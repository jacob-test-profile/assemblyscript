/**
 * @fileoverview Closure env-lifting pre-pass for the CPS state-machine
 * transform (Phase 1, chunk 3). Runs before the core's rewrite consumes
 * an async body. Every closure in the body becomes a method on the state
 * class, and the closure expression is replaced by a reference to a
 * top-level adapter that forwards through the currently-stepping state
 * object, so captured locals are state fields and shared mutation is
 * exact. Async arrows are extracted to generated async functions (see
 * asyncArrowExtract.ts) and awaited through the nested-await path.
 * @license Apache-2.0
 */

import {
  NodeKind,
  TypeNode,
  Statement,
  Expression,
  IdentifierExpression,
  PropertyAccessExpression,
  ElementAccessExpression,
  CallExpression,
  BinaryExpression,
  UnaryPrefixExpression,
  UnaryPostfixExpression,
  TernaryExpression,
  AssertionExpression,
  ParenthesizedExpression,
  CommaExpression,
  InstanceOfExpression,
  NewExpression,
  ArrayLiteralExpression,
  ObjectLiteralExpression,
  TemplateLiteralExpression,
  AwaitExpression,
  FunctionExpression,
  FunctionDeclaration,
  MethodDeclaration,
  BlockStatement,
  ExpressionStatement,
  ReturnStatement,
  VariableStatement,
  IfStatement,
  WhileStatement,
  ForStatement,
  DoStatement,
  ForOfStatement,
  SwitchStatement,
  TryStatement,
  ThrowStatement,
  ArrowKind,
  ParameterNode,
  ParameterKind
} from "./ast";

import {
  Token
} from "./tokenizer";

import {
  CommonFlags
} from "./common";

import {
  Range
} from "./diagnostics";

import {
  Program,
  FunctionPrototype,
  File,
  Element,
  ClassPrototype
} from "./program";

import {
  AsyncFail,
  ASYNC_THIS_NAME,
  ASYNC_OUTER_NAME,
  SPILL_GET,
  ident,
  namedType,
  blockStmt,
  callExpr,
  containsAwait,
  copyFunctionSignature,
  unwrapParens
} from "./asyncRewrite";

import {
  ArrowAlias,
  ArrowWorkItem,
  FileArrowAliases,
  OuterArrowBinding,
  OuterRecord,
  extractAsyncArrow,
  outerFieldKey,
  validateLiftableParams
} from "./asyncArrowExtract";

import {
  scanFunctionFreeVars,
  isCompoundAssign,
  FreeVarInfo,
  FreeVarKind
} from "./asyncFreeVars";

/** Inputs the core computes for one async function or method. */
export interface LiftContext {
  program: Program;
  file: File;
  /** Element generated declarations are registered under. */
  genParent: Element;
  /** Qualified name (function name, or `<Class>_<method>`). */
  qualName: string;
  stateClassName: string;
  stateGlobalName: string;
  /** Whether the enclosing function is an instance method. */
  hasReceiver: bool;
  /** Enclosing class, for instance methods. */
  receiverClass: ClassPrototype | null;
  aliases: FileArrowAliases;
}

/** Outcome of the env-lift pre-pass for one async function. */
export interface EnvLiftResult {
  /** State-class methods holding lifted closure bodies. */
  methods: MethodDeclaration[];
  /** Adapter name to lifted method, for the core's rewrite hook. */
  adapters: Map<string, MethodDeclaration>;
  /** Whether any adapter (and so the state global) is needed. */
  hasAdapters: bool;
  /** Extracted async arrows awaiting their pre-passes. */
  arrows: ArrowWorkItem[];
}

/** One arrow binding: how a local holding an extracted arrow is called. */
interface ArrowBinding {
  extractedName: string;
  needsReceiver: bool;
  receiverName: string | null;
}

interface FrameEntry {
  arrow: ArrowBinding | null;
  /** Annotated type node of a parameter or variable, if any. `null`
   *  when the name was declared without an annotation, so it cannot
   *  be passed as a by-value environment parameter. */
  typeNode: TypeNode | null;
  /** Environment parameter names of a lifted closure held by this
   *  variable, if any. A value reference to such a variable is an
   *  escape: the closure cannot leave its defining scope. */
  envParams: string[] | null;
  /** Range of the declaration name, for resolving a capture to the
   *  exact declaration (shadowing) when an arrow is extracted. */
  nameRange: Range | null;
}

interface ScopeFrame {
  names: Map<string, FrameEntry>;
  isClosure: bool;
}

/** Lifts closures and async arrows in one async body. Returns `null`
 *  when a failure was reported through `fail`. `outer` is the record
 *  for resolving captures from the enclosing async function, or `null`
 *  when this body is not an extracted arrow. */
export function liftEnvInAsyncBody(
  program: Program,
  prototype: FunctionPrototype,
  ctx: LiftContext,
  selfName: string | null,
  forbidden: Set<string>,
  outer: OuterRecord | null,
  fail: AsyncFail
): EnvLiftResult | null {
  let lifter = new EnvLifter(program, ctx, forbidden, fail);
  lifter.outer = outer;
  lifter.pushFrame(false);
  let parameters = prototype.functionTypeNode.parameters;
  for (let i = 0, k = parameters.length; i < k; ++i) {
    lifter.declare(parameters[i].name.text, parameters[i].type, parameters[i].name.range);
  }
  if (selfName) {
    lifter.bindArrow(selfName, {
      extractedName: prototype.name,
      needsReceiver: ctx.hasReceiver,
      receiverName: ctx.hasReceiver ? ASYNC_THIS_NAME : null
    });
  }
  let bodyNode = prototype.bodyNode;
  if (bodyNode && !lifter.walkStatement(bodyNode)) return null;
  lifter.popFrame();
  return {
    methods: lifter.methods,
    adapters: lifter.adapters,
    hasAdapters: lifter.methods.length > 0,
    arrows: lifter.arrows
  };
}

class EnvLifter {
  methods: MethodDeclaration[] = [];
  adapters = new Map<string, MethodDeclaration>();
  arrows: ArrowWorkItem[] = [];
  private frames: ScopeFrame[] = [];
  private closureDepth: i32 = 0;
  /** Frame index where each enclosing closure's parameters start, so a
   *  nested closure capturing an outer closure's locals is rejected. */
  private closureFrameBases: i32[] = [];
  private closureCounter: i32 = 0;
  private arrowCounter: i32 = 0;
  /** Adapter name to the environment parameter names its lifted
   *  closure captures from an enclosing closure. */
  private closureEnvParams = new Map<string, string[]>();
  private dynamicFieldAliases = new Map<string, ArrowAlias>();
  private poisonedFields = new Set<string>();
  /** Record for resolving captures from the enclosing async function,
   *  or `null` when this body is not an extracted arrow. */
  outer: OuterRecord | null = null;

  constructor(
    private program: Program,
    private ctx: LiftContext,
    private forbidden: Set<string>,
    private fail: AsyncFail
  ) {}

  get receiverClassName(): string {
    let receiverClass = this.ctx.receiverClass;
    return receiverClass ? receiverClass.name : "";
  }

  // === Scopes ===================================================================================

  pushFrame(isClosure: bool): void {
    this.frames.push({ names: new Map(), isClosure });
  }

  popFrame(): void {
    this.frames.pop();
  }

  declare(name: string, typeNode: TypeNode | null = null, nameRange: Range | null = null): void {
    let frame = this.frames[this.frames.length - 1];
    if (!frame.names.has(name)) frame.names.set(name, { arrow: null, typeNode, envParams: null, nameRange });
  }

  bindArrow(name: string, binding: ArrowBinding): void {
    for (let i = this.frames.length - 1; i >= 0; --i) {
      let entry = this.frames[i].names.get(name);
      if (entry) {
        entry.arrow = binding;
        return;
      }
    }
    this.frames[this.frames.length - 1].names.set(name, { arrow: binding, typeNode: null, envParams: null, nameRange: null });
  }

  /** Records that the variable holds a lifted closure whose captured
   *  environment parameters are `envParams`. */
  private bindEnvParams(name: string, envParams: string[]): void {
    for (let i = this.frames.length - 1; i >= 0; --i) {
      let entry = this.frames[i].names.get(name);
      if (entry) {
        entry.envParams = envParams;
        return;
      }
    }
    this.frames[this.frames.length - 1].names.set(name, { arrow: null, typeNode: null, envParams, nameRange: null });
  }

  /** Annotated type node of the nearest binding of `name`, if any. */
  private lookupTypeNode(name: string): TypeNode | null {
    for (let i = this.frames.length - 1; i >= 0; --i) {
      let entry = this.frames[i].names.get(name);
      if (entry) return entry.typeNode;
    }
    return null;
  }

  /** Classifies a free variable of a closure body for the free-var
   *  scan: bound in the async function's own scope, in an enclosing
   *  closure's scope, or nowhere. */
  private classifyFreeVar(name: string): FreeVarKind {
    for (let i = this.frames.length - 1; i >= 0; --i) {
      if (this.frames[i].names.has(name)) {
        return this.frames[i].isClosure ? "closure" : "async";
      }
    }
    if (name == ASYNC_THIS_NAME) return "async";
    if (this.forbidden.has(name)) return "async";
    if (this.ctx.aliases.globals.has(name)) return "async";
    return "global";
  }

  /** Enclosing local name to its declaration name range, nearest
   *  declaration wins. Captured when an arrow is extracted, so the
   *  arrow can resolve its captures to the exact declaration. */
  private captureOuterNames(): Map<string, Range> {
    let names = new Map<string, Range>();
    for (let i = this.frames.length - 1; i >= 0; --i) {
      let keys = Map_keys(this.frames[i].names);
      for (let j = 0, k = keys.length; j < k; ++j) {
        let name = keys[j];
        if (names.has(name)) continue;
        let entry = this.frames[i].names.get(name)!;
        if (entry.nameRange) names.set(name, entry.nameRange);
      }
    }
    return names;
  }

  /** Enclosing arrow name to its binding, nearest wins. */
  private captureOuterArrows(): Map<string, OuterArrowBinding> {
    let arrows = new Map<string, OuterArrowBinding>();
    for (let i = this.frames.length - 1; i >= 0; --i) {
      let keys = Map_keys(this.frames[i].names);
      for (let j = 0, k = keys.length; j < k; ++j) {
        let name = keys[j];
        if (arrows.has(name)) continue;
        let entry = this.frames[i].names.get(name)!;
        if (entry.arrow) {
          arrows.set(name, {
            extractedName: entry.arrow.extractedName,
            needsReceiver: entry.arrow.needsReceiver,
            receiverName: entry.arrow.receiverName
          });
        }
      }
    }
    return arrows;
  }

  /** Whether `name` is a captured externref local (spilled). Writes to
   *  such a local stay loud: the spill slot is a value copy. */
  private outerSpilled(name: string): bool {
    let outer = this.outer;
    if (!outer) return false;
    let nameRange = outer.names.get(name);
    if (!nameRange) return false;
    let info = outer.fields.get(outerFieldKey(nameRange));
    return info ? info.spilled : false;
  }

  /** Environment parameters of an expression that is a lifted closure's
   *  adapter, if any. Parentheses are transparent. */
  private envParamsOf(expr: Expression): string[] | null {
    let unwrapped = unwrapParens(expr);
    if (unwrapped.kind != NodeKind.Identifier) return null;
    let envParams = this.closureEnvParams.get((<IdentifierExpression>unwrapped).text);
    return envParams ? envParams : null;
  }

  /** Walks an expression in a value position, failing when it is a
   *  lifted closure carrying environment parameters: such a closure
   *  cannot escape its defining scope. Binding sites (a variable
   *  declaration or reassignment) and call callees do not use this. */
  private walkValue(node: Expression): Expression | null {
    let walked = this.walkExpression(node);
    if (!walked) return null;
    if (this.envParamsOf(walked)) {
      this.fail("Closures capturing names from an enclosing closure cannot be passed as values; call them directly", node.range);
      return null;
    }
    return walked;
  }

  lookup(name: string): FrameEntry | null {
    for (let i = this.frames.length - 1; i >= 0; --i) {
      let entry = this.frames[i].names.get(name);
      if (entry) return entry;
    }
    return null;
  }

  private lookupFrame(name: string): i32 {
    for (let i = this.frames.length - 1; i >= 0; --i) {
      if (this.frames[i].names.has(name)) return i;
    }
    return -1;
  }

  private lookupFieldAlias(fieldName: string): ArrowAlias | null {
    if (this.poisonedFields.has(fieldName)) return null;
    let dynamic = this.dynamicFieldAliases.get(fieldName);
    if (dynamic) return dynamic;
    let alias = this.ctx.aliases.fields.get(fieldName);
    return alias ? alias : null;
  }

  private prescan(statements: Statement[]): void {
    for (let i = 0, k = statements.length; i < k; ++i) {
      let statement = statements[i];
      if (statement.kind == NodeKind.Variable) {
        let declarations = (<VariableStatement>statement).declarations;
        for (let j = 0, l = declarations.length; j < l; ++j) {
          this.declare(declarations[j].name.text, declarations[j].type, declarations[j].name.range);
        }
      }
    }
  }

  // === Statements ===============================================================================

  walkStatement(node: Statement): bool {
    switch (node.kind) {
      case NodeKind.Block: {
        this.pushFrame(this.closureDepth > 0);
        let statements = (<BlockStatement>node).statements;
        this.prescan(statements);
        for (let i = 0, k = statements.length; i < k; ++i) {
          if (!this.walkStatement(statements[i])) {
            this.popFrame();
            return false;
          }
        }
        this.popFrame();
        return true;
      }
      case NodeKind.Variable: {
        return this.walkVariable(<VariableStatement>node);
      }
      case NodeKind.Expression: {
        let stmt = <ExpressionStatement>node;
        let expr = this.walkExpression(stmt.expression);
        if (!expr) return false;
        stmt.expression = expr;
        return true;
      }
      case NodeKind.Return: {
        let stmt = <ReturnStatement>node;
        if (stmt.value) {
          let value = this.walkValue(stmt.value);
          if (!value) return false;
          stmt.value = value;
        }
        return true;
      }
      case NodeKind.If: {
        let stmt = <IfStatement>node;
        let condition = this.walkExpression(stmt.condition);
        if (!condition) return false;
        stmt.condition = condition;
        return this.walkStatement(stmt.ifTrue)
          && (!stmt.ifFalse || this.walkStatement(stmt.ifFalse));
      }
      case NodeKind.While: {
        let stmt = <WhileStatement>node;
        let condition = this.walkExpression(stmt.condition);
        if (!condition) return false;
        stmt.condition = condition;
        return this.walkStatement(stmt.body);
      }
      case NodeKind.Do: {
        let stmt = <DoStatement>node;
        if (!this.walkStatement(stmt.body)) return false;
        let condition = this.walkExpression(stmt.condition);
        if (!condition) return false;
        stmt.condition = condition;
        return true;
      }
      case NodeKind.For: {
        let stmt = <ForStatement>node;
        this.pushFrame(this.closureDepth > 0);
        if (stmt.initializer) {
          this.prescan([ stmt.initializer ]);
          if (!this.walkStatement(stmt.initializer)) {
            this.popFrame();
            return false;
          }
        }
        if (stmt.condition) {
          let condition = this.walkExpression(stmt.condition);
          if (!condition) {
            this.popFrame();
            return false;
          }
          stmt.condition = condition;
        }
        if (stmt.incrementor) {
          let incrementor = this.walkExpression(stmt.incrementor);
          if (!incrementor) {
            this.popFrame();
            return false;
          }
          stmt.incrementor = incrementor;
        }
        let ok = this.walkStatement(stmt.body);
        this.popFrame();
        return ok;
      }
      case NodeKind.ForOf: {
        let stmt = <ForOfStatement>node;
        this.pushFrame(this.closureDepth > 0);
        this.prescan([ stmt.variable ]);
        if (!this.walkStatement(stmt.variable)) {
          this.popFrame();
          return false;
        }
        let iterable = this.walkExpression(stmt.iterable);
        if (!iterable) {
          this.popFrame();
          return false;
        }
        stmt.iterable = iterable;
        let ok = this.walkStatement(stmt.body);
        this.popFrame();
        return ok;
      }
      case NodeKind.Switch: {
        let stmt = <SwitchStatement>node;
        this.pushFrame(this.closureDepth > 0);
        let cases = stmt.cases;
        for (let i = 0, k = cases.length; i < k; ++i) {
          this.prescan(cases[i].statements);
        }
        let condition = this.walkExpression(stmt.condition);
        if (!condition) {
          this.popFrame();
          return false;
        }
        stmt.condition = condition;
        for (let i = 0, k = cases.length; i < k; ++i) {
          let switchCase = cases[i];
          if (switchCase.label) {
            let label = this.walkExpression(switchCase.label);
            if (!label) {
              this.popFrame();
              return false;
            }
            switchCase.label = label;
          }
          let statements = switchCase.statements;
          for (let j = 0, l = statements.length; j < l; ++j) {
            if (!this.walkStatement(statements[j])) {
              this.popFrame();
              return false;
            }
          }
        }
        this.popFrame();
        return true;
      }
      case NodeKind.Try: {
        let stmt = <TryStatement>node;
        this.pushFrame(this.closureDepth > 0);
        this.prescan(stmt.bodyStatements);
        let bodyStatements = stmt.bodyStatements;
        for (let i = 0, k = bodyStatements.length; i < k; ++i) {
          if (!this.walkStatement(bodyStatements[i])) {
            this.popFrame();
            return false;
          }
        }
        this.popFrame();
        if (stmt.catchStatements) {
          this.pushFrame(this.closureDepth > 0);
          if (stmt.catchVariable) this.declare(stmt.catchVariable.text, null, stmt.catchVariable.range);
          this.prescan(stmt.catchStatements);
          let catchStatements = stmt.catchStatements;
          for (let i = 0, k = catchStatements.length; i < k; ++i) {
            if (!this.walkStatement(catchStatements[i])) {
              this.popFrame();
              return false;
            }
          }
          this.popFrame();
        }
        if (stmt.finallyStatements) {
          this.pushFrame(this.closureDepth > 0);
          this.prescan(stmt.finallyStatements);
          let finallyStatements = stmt.finallyStatements;
          for (let i = 0, k = finallyStatements.length; i < k; ++i) {
            if (!this.walkStatement(finallyStatements[i])) {
              this.popFrame();
              return false;
            }
          }
          this.popFrame();
        }
        return true;
      }
      case NodeKind.Throw: {
        let stmt = <ThrowStatement>node;
        let value = this.walkValue(stmt.value);
        if (!value) return false;
        stmt.value = value;
        return true;
      }
      default: {
        return true;
      }
    }
  }

  private walkVariable(node: VariableStatement): bool {
    let declarations = node.declarations;
    for (let i = 0, k = declarations.length; i < k; ++i) {
      let declaration = declarations[i];
      let name = declaration.name.text;
      let initializer = declaration.initializer;
      if (!initializer) continue;
      let unwrapped = unwrapParens(initializer);
      if (unwrapped.kind == NodeKind.Function && (<FunctionExpression>unwrapped).declaration.is(CommonFlags.Async)) {
        if (this.closureDepth > 0) {
          this.fail("Async arrows cannot be declared inside a closure; declare them in the async function body", unwrapped.range);
          return false;
        }
        let extracted = this.extractArrowHere((<FunctionExpression>unwrapped).declaration, name);
        if (!extracted) return false;
        extracted.selfName = name;
        declaration.initializer = ident(extracted.prototype.name, initializer.range);
        this.bindArrow(name, {
          extractedName: extracted.prototype.name,
          needsReceiver: this.ctx.hasReceiver,
          receiverName: this.ctx.hasReceiver ? ASYNC_THIS_NAME : null
        });
        this.arrows.push(extracted);
        continue;
      }
      if (unwrapped.kind == NodeKind.PropertyAccess) {
        let access = <PropertyAccessExpression>unwrapped;
        if (access.expression.kind == NodeKind.Identifier) {
          let alias = this.lookupFieldAlias(access.property.text);
          if (alias) {
            this.bindArrow(name, {
              extractedName: alias.extractedName,
              needsReceiver: true,
              receiverName: (<IdentifierExpression>access.expression).text
            });
          }
        }
      } else if (unwrapped.kind == NodeKind.Identifier) {
        let alias = this.ctx.aliases.globals.get((<IdentifierExpression>unwrapped).text);
        if (alias) {
          this.bindArrow(name, {
            extractedName: alias.extractedName,
            needsReceiver: false,
            receiverName: null
          });
          continue;
        }
      }
      let walked = this.walkExpression(initializer);
      if (!walked) return false;
      declaration.initializer = walked;
      let envParams = this.envParamsOf(walked);
      if (envParams) this.bindEnvParams(name, envParams);
    }
    return true;
  }

  private extractArrowHere(declaration: FunctionDeclaration, selfName: string): ArrowWorkItem | null {
    let extractedName = `__async_arrow_${this.ctx.qualName}_${this.arrowCounter++}`;
    // Names the new arrow cannot capture: the ancestor's visible names
    // (transitive capture is not threaded). The immediate outer's names
    // are capturable through the outer record.
    let forbidden = new Set<string>();
    if (this.outer) {
      let ancestorNames = Map_keys(this.outer.names);
      for (let i = 0, k = ancestorNames.length; i < k; ++i) forbidden.add(ancestorNames[i]);
      let ancestorArrows = Map_keys(this.outer.arrows);
      for (let i = 0, k = ancestorArrows.length; i < k; ++i) forbidden.add(ancestorArrows[i]);
    }
    return extractAsyncArrow(
      this.ctx.program,
      this.ctx.genParent,
      declaration,
      extractedName,
      this.ctx.hasReceiver,
      this.receiverClassName,
      this.ctx.receiverClass,
      forbidden,
      this.ctx.qualName,
      this.captureOuterNames(),
      this.captureOuterArrows(),
      this.fail
    );
  }

  // === Expressions ==============================================================================

  walkExpression(node: Expression): Expression | null {
    switch (node.kind) {
      case NodeKind.Identifier: {
        let name = (<IdentifierExpression>node).text;
        let entry = this.lookup(name);
        if (entry) {
          if (entry.arrow) {
            this.fail("Async arrows cannot be passed as values; await them directly", node.range);
            return null;
          }
          if (entry.envParams) {
            this.fail("Closures capturing names from an enclosing closure cannot be passed as values; call them directly", node.range);
            return null;
          }
          if (this.closureDepth > 0) {
            let frameIndex = this.lookupFrame(name);
            let base = this.closureFrameBases[this.closureFrameBases.length - 1];
            if (frameIndex >= 0 && frameIndex < base && this.frames[frameIndex].isClosure) {
              this.fail(`Closures cannot capture '${name}' from an enclosing closure`, node.range);
              return null;
            }
          }
          return node;
        }
        if (this.outer) {
          let nameRange = this.outer.names.get(name);
          if (nameRange) {
            let info = this.outer.fields.get(outerFieldKey(nameRange));
            if (!info) {
              this.fail(`Async arrows cannot capture '${name}' from the enclosing function`, node.range);
              return null;
            }
            if (info.spilled) {
              return callExpr(
                ident(SPILL_GET, node.range),
                [ new PropertyAccessExpression(ident(ASYNC_OUTER_NAME, node.range), ident(info.slotField, node.range), node.range) ],
                node.range
              );
            }
            return new PropertyAccessExpression(
              ident(ASYNC_OUTER_NAME, node.range),
              ident(info.field, node.range),
              node.range
            );
          }
          if (this.outer.arrows.has(name)) {
            this.fail("Async arrows cannot be passed as values; await them directly", node.range);
            return null;
          }
        }
        if (this.forbidden.has(name)) {
          this.fail(`Async arrows cannot capture '${name}' from the enclosing function`, node.range);
          return null;
        }
        if (this.ctx.aliases.globals.has(name)) {
          this.fail("Async arrows cannot be passed as values; await them directly", node.range);
          return null;
        }
        return node;
      }
      case NodeKind.Literal: {
        if (node instanceof TemplateLiteralExpression) {
          return this.walkTemplateLiteral(node);
        }
        if (node instanceof ArrayLiteralExpression) {
          let elements = node.elementExpressions;
          for (let i = 0, k = elements.length; i < k; ++i) {
            let element = this.walkValue(elements[i]);
            if (!element) return null;
            elements[i] = element;
          }
          return node;
        }
        if (node instanceof ObjectLiteralExpression) {
          let values = node.values;
          for (let i = 0, k = values.length; i < k; ++i) {
            let value = this.walkValue(values[i]);
            if (!value) return null;
            values[i] = value;
          }
          return node;
        }
        return node;
      }
      case NodeKind.PropertyAccess: {
        let access = <PropertyAccessExpression>node;
        let object = this.walkExpression(access.expression);
        if (!object) return null;
        access.expression = object;
        return access;
      }
      case NodeKind.ElementAccess: {
        let access = <ElementAccessExpression>node;
        let object = this.walkExpression(access.expression);
        if (!object) return null;
        let element = this.walkExpression(access.elementExpression);
        if (!element) return null;
        access.expression = object;
        access.elementExpression = element;
        return access;
      }
      case NodeKind.Call: {
        return this.walkCall(<CallExpression>node);
      }
      case NodeKind.New: {
        let expr = <NewExpression>node;
        let args = expr.args;
        for (let i = 0, k = args.length; i < k; ++i) {
          let arg = this.walkValue(args[i]);
          if (!arg) return null;
          args[i] = arg;
        }
        return expr;
      }
      case NodeKind.Binary: {
        return this.walkBinary(<BinaryExpression>node);
      }
      case NodeKind.UnaryPrefix: {
        let unary = <UnaryPrefixExpression>node;
        if (unary.operator == Token.Plus_Plus || unary.operator == Token.Minus_Minus) {
          let target = unwrapParens(unary.operand);
          if (target.kind == NodeKind.Identifier && this.outerSpilled((<IdentifierExpression>target).text)) {
            this.fail(`Async arrows cannot write to '${(<IdentifierExpression>target).text}' captured from the enclosing function`, node.range);
            return null;
          }
        }
        let operand = this.walkExpression(unary.operand);
        if (!operand) return null;
        unary.operand = operand;
        return unary;
      }
      case NodeKind.UnaryPostfix: {
        let unary = <UnaryPostfixExpression>node;
        if (unary.operator == Token.Plus_Plus || unary.operator == Token.Minus_Minus) {
          let target = unwrapParens(unary.operand);
          if (target.kind == NodeKind.Identifier && this.outerSpilled((<IdentifierExpression>target).text)) {
            this.fail(`Async arrows cannot write to '${(<IdentifierExpression>target).text}' captured from the enclosing function`, node.range);
            return null;
          }
        }
        let operand = this.walkExpression(unary.operand);
        if (!operand) return null;
        unary.operand = operand;
        return unary;
      }
      case NodeKind.Ternary: {
        let ternary = <TernaryExpression>node;
        let condition = this.walkExpression(ternary.condition);
        if (!condition) return null;
        let ifThen = this.walkValue(ternary.ifThen);
        if (!ifThen) return null;
        let ifElse = this.walkValue(ternary.ifElse);
        if (!ifElse) return null;
        ternary.condition = condition;
        ternary.ifThen = ifThen;
        ternary.ifElse = ifElse;
        return ternary;
      }
      case NodeKind.Assertion: {
        let assertion = <AssertionExpression>node;
        let expr = this.walkExpression(assertion.expression);
        if (!expr) return null;
        assertion.expression = expr;
        return assertion;
      }
      case NodeKind.Parenthesized: {
        let parenthesized = <ParenthesizedExpression>node;
        let expr = this.walkExpression(parenthesized.expression);
        if (!expr) return null;
        parenthesized.expression = expr;
        return parenthesized;
      }
      case NodeKind.Comma: {
        let comma = <CommaExpression>node;
        let exprs = comma.expressions;
        for (let i = 0, k = exprs.length; i < k; ++i) {
          let expr = this.walkExpression(exprs[i]);
          if (!expr) return null;
          exprs[i] = expr;
        }
        return comma;
      }
      case NodeKind.InstanceOf: {
        let instanceOf = <InstanceOfExpression>node;
        let expr = this.walkExpression(instanceOf.expression);
        if (!expr) return null;
        instanceOf.expression = expr;
        return instanceOf;
      }
      case NodeKind.Await: {
        let awaitExpr = <AwaitExpression>node;
        let operand = this.walkExpression(awaitExpr.operand);
        if (!operand) return null;
        awaitExpr.operand = operand;
        return awaitExpr;
      }
      case NodeKind.Function: {
        let declaration = (<FunctionExpression>node).declaration;
        if (declaration.is(CommonFlags.Async)) {
          this.fail("Async arrows must be assigned to a local or a field to be awaited", node.range);
          return null;
        }
        return this.liftClosure(<FunctionExpression>node);
      }
      case NodeKind.Class: {
        return node;
      }
      default: {
        return node;
      }
    }
  }

  private walkTemplateLiteral(node: TemplateLiteralExpression): Expression | null {
    if (node.tag) {
      let tag = this.walkExpression(node.tag);
      if (!tag) return null;
      node.tag = tag;
    }
    let exprs = node.expressions;
    for (let i = 0, k = exprs.length; i < k; ++i) {
      let expr = this.walkExpression(exprs[i]);
      if (!expr) return null;
      exprs[i] = expr;
    }
    return node;
  }

  private walkCall(node: CallExpression): Expression | null {
    let callee = node.expression;
    if (callee.kind == NodeKind.Identifier) {
      let name = (<IdentifierExpression>callee).text;
      let entry = this.lookup(name);
      let binding = entry ? entry.arrow : null;
      if (!binding) {
        let alias = this.ctx.aliases.globals.get(name);
        if (alias) binding = { extractedName: alias.extractedName, needsReceiver: false, receiverName: null };
      }
      if (binding) {
        if (this.closureDepth > 0) {
          this.fail("Async arrows cannot be called inside a closure; call them in the async function body", node.range);
          return null;
        }
        if (binding.needsReceiver && !binding.receiverName) {
          this.fail("Internal error: async arrow call without a receiver", node.range);
          return null;
        }
        let args = new Array<Expression>();
        if (binding.needsReceiver) args.push(ident(binding.receiverName!, node.range));
        let callArgs = node.args;
        for (let i = 0, k = callArgs.length; i < k; ++i) {
          let arg = this.walkValue(callArgs[i]);
          if (!arg) return null;
          args.push(arg);
        }
        return new CallExpression(ident(binding.extractedName, callee.range), null, args, node.range);
      }
      if (this.outer) {
        let outerArrow = this.outer.arrows.get(name);
        if (outerArrow) {
          if (this.closureDepth > 0) {
            this.fail("Async arrows cannot be called inside a closure; call them in the async function body", node.range);
            return null;
          }
          if (outerArrow.needsReceiver && !outerArrow.receiverName) {
            this.fail("Internal error: async arrow call without a receiver", node.range);
            return null;
          }
          let args = new Array<Expression>();
          if (outerArrow.needsReceiver) args.push(ident(outerArrow.receiverName!, node.range));
          let callArgs = node.args;
          for (let i = 0, k = callArgs.length; i < k; ++i) {
            let arg = this.walkValue(callArgs[i]);
            if (!arg) return null;
            args.push(arg);
          }
          return new CallExpression(ident(outerArrow.extractedName, callee.range), null, args, node.range);
        }
      }
      if (entry && entry.envParams) {
        return this.walkClosureCall(node, entry.envParams);
      }
    } else if (callee.kind == NodeKind.PropertyAccess) {
      let access = <PropertyAccessExpression>callee;
      if (access.expression.kind == NodeKind.Identifier) {
        let alias = this.lookupFieldAlias(access.property.text);
        if (alias) {
          if (this.closureDepth > 0) {
            this.fail("Async arrows cannot be called inside a closure; call them in the async function body", node.range);
            return null;
          }
          let object = this.walkExpression(access.expression);
          if (!object) return null;
          let args = new Array<Expression>();
          args.push(ident((<IdentifierExpression>object).text, access.expression.range));
          let callArgs = node.args;
          for (let i = 0, k = callArgs.length; i < k; ++i) {
            let arg = this.walkValue(callArgs[i]);
            if (!arg) return null;
            args.push(arg);
          }
          return new CallExpression(ident(alias.extractedName, callee.range), null, args, node.range);
        }
      }
    }
    let walkedCallee = this.walkExpression(callee);
    if (!walkedCallee) return null;
    node.expression = walkedCallee;
    let args = node.args;
    for (let i = 0, k = args.length; i < k; ++i) {
      let arg = this.walkValue(args[i]);
      if (!arg) return null;
      args[i] = arg;
    }
    if (walkedCallee.kind == NodeKind.Identifier) {
      let envParams = this.closureEnvParams.get((<IdentifierExpression>walkedCallee).text);
      if (envParams) {
        let envArgs = this.envArgIdents(envParams, node.range);
        if (!envArgs) return null;
        for (let i = 0, k = envArgs.length; i < k; ++i) args.push(envArgs[i]);
      }
    }
    return node;
  }

  /** Walks a call to a variable holding a lifted closure with
   *  environment parameters, appending the environment arguments.
   *  The callee stays the variable: it is a call target, not a value. */
  private walkClosureCall(node: CallExpression, envParams: string[]): Expression | null {
    let args = new Array<Expression>();
    let callArgs = node.args;
    for (let i = 0, k = callArgs.length; i < k; ++i) {
      let arg = this.walkValue(callArgs[i]);
      if (!arg) return null;
      args.push(arg);
    }
    let envArgs = this.envArgIdents(envParams, node.range);
    if (!envArgs) return null;
    for (let i = 0, k = envArgs.length; i < k; ++i) args.push(envArgs[i]);
    node.args = args;
    return node;
  }

  /** Builds the environment arguments for a lifted closure call.
   *  Each name must resolve in the current scope: a closure value
   *  that escaped its defining scope has no environment to read. */
  private envArgIdents(envParams: string[], range: Range): Expression[] | null {
    let args = new Array<Expression>();
    for (let i = 0, k = envParams.length; i < k; ++i) {
      let name = envParams[i];
      if (!this.lookup(name)) {
        this.fail(`Closure capturing '${name}' from an enclosing closure was called outside its scope`, range);
        return null;
      }
      args.push(ident(name, range));
    }
    return args;
  }

  private walkBinary(node: BinaryExpression): Expression | null {
    // A write to a captured externref local stays loud: the spill slot
    // is a value copy, so the write could not be shared.
    if (node.operator == Token.Equals || isCompoundAssign(node.operator)) {
      let left = unwrapParens(node.left);
      if (left.kind == NodeKind.Identifier && this.outerSpilled((<IdentifierExpression>left).text)) {
        this.fail(`Async arrows cannot write to '${(<IdentifierExpression>left).text}' captured from the enclosing function`, node.range);
        return null;
      }
    }
    if (node.operator == Token.Equals) {
      let right = unwrapParens(node.right);
      if (right.kind == NodeKind.Function && (<FunctionExpression>right).declaration.is(CommonFlags.Async)) {
        return this.walkArrowAssignment(node, <FunctionExpression>right);
      }
      let left = node.left;
      if (left.kind == NodeKind.Identifier) {
        let name = (<IdentifierExpression>left).text;
        let entry = this.lookup(name);
        if (entry) {
          entry.arrow = null;
          entry.envParams = null;
        }
        let walkedLeft = this.walkExpression(left);
        if (!walkedLeft) return null;
        node.left = walkedLeft;
        let walkedRight = this.walkExpression(node.right);
        if (!walkedRight) return null;
        node.right = walkedRight;
        let envParams = this.envParamsOf(walkedRight);
        if (envParams) {
          if (!entry) {
            // Assigning a closure with env params to a non-local (an
            // outer capture or a global) escapes it.
            this.fail("Closures capturing names from an enclosing closure cannot be passed as values; call them directly", node.range);
            return null;
          }
          this.bindEnvParams(name, envParams);
        }
        return node;
      }
      if (left.kind == NodeKind.PropertyAccess) {
        let access = <PropertyAccessExpression>left;
        let object = this.walkExpression(access.expression);
        if (!object) return null;
        access.expression = object;
        this.poisonedFields.add(access.property.text);
        let walkedRight = this.walkExpression(node.right);
        if (!walkedRight) return null;
        node.right = walkedRight;
        if (this.envParamsOf(walkedRight)) {
          this.fail("Closures capturing names from an enclosing closure cannot be assigned to a field; call them directly", node.range);
          return null;
        }
        return node;
      }
    }
    let left = this.walkExpression(node.left);
    if (!left) return null;
    let right = this.walkValue(node.right);
    if (!right) return null;
    node.left = left;
    node.right = right;
    return node;
  }

  private walkArrowAssignment(node: BinaryExpression, funcExpr: FunctionExpression): Expression | null {
    if (this.closureDepth > 0) {
      this.fail("Async arrows cannot be assigned inside a closure; assign them in the async function body", funcExpr.range);
      return null;
    }
    let left = node.left;
    if (left.kind == NodeKind.Identifier) {
      let name = (<IdentifierExpression>left).text;
      let extracted = this.extractArrowHere(funcExpr.declaration, name);
      if (!extracted) return null;
      extracted.selfName = name;
      node.right = ident(extracted.prototype.name, node.right.range);
      this.bindArrow(name, {
        extractedName: extracted.prototype.name,
        needsReceiver: this.ctx.hasReceiver,
        receiverName: this.ctx.hasReceiver ? ASYNC_THIS_NAME : null
      });
      this.arrows.push(extracted);
      return node;
    }
    if (left.kind == NodeKind.PropertyAccess) {
      let access = <PropertyAccessExpression>left;
      if (access.expression.kind != NodeKind.Identifier) {
        this.fail("Async arrows can only be assigned to a local or a field", left.range);
        return null;
      }
      let fieldName = access.property.text;
      let existing = this.lookupFieldAlias(fieldName);
      let extracted = this.extractArrowHere(funcExpr.declaration, fieldName);
      if (!extracted) return null;
      if (existing && existing.extractedName != extracted.prototype.name) {
        this.fail(`Async arrows in a field named '${fieldName}' are ambiguous`, left.range);
        return null;
      }
      node.right = ident(extracted.prototype.name, node.right.range);
      let object = this.walkExpression(access.expression);
      if (!object) return null;
      access.expression = object;
      this.dynamicFieldAliases.set(fieldName, { extractedName: extracted.prototype.name, needsReceiver: true });
      this.arrows.push(extracted);
      return node;
    }
    this.fail("Async arrows can only be assigned to a local or a field", left.range);
    return null;
  }

  // === Closure lifting =============================================================================

  private liftClosure(node: FunctionExpression): Expression | null {
    let declaration = node.declaration;
    let range = node.range;
    if (!validateLiftableParams(declaration, "closures", this.fail)) return null;
    if (declaration.body && containsAwait(declaration.body)) {
      this.fail("'await' inside a closure is not yet supported; use an async arrow", range);
      return null;
    }
    let bodyNode = declaration.body;
    if (!bodyNode) {
      this.fail("Closures must have a body", range);
      return null;
    }
    let freeVars = scanFunctionFreeVars(declaration, (name) => this.classifyFreeVar(name));
    let envCaptures: FreeVarInfo[] = [];
    for (let i = 0, k = freeVars.length; i < k; ++i) {
      let free = freeVars[i];
      if (free.kind == "closure") envCaptures.push(free);
    }
    // Stock AssemblyScript has no nested-closure capture at all (the
    // compiler reports "Not implemented: Closures" for a closure
    // capturing an enclosing closure's locals, even in a plain
    // function), so a nested closure is always lifted, with its
    // outer-closure captures as extra by-value parameters.
    let envParams: string[] = [];
    let envParamTypes: TypeNode[] = [];
    for (let i = 0, k = envCaptures.length; i < k; ++i) {
      let capture = envCaptures[i];
      if (capture.written) {
        this.fail(`Closures cannot write to '${capture.name}' captured from an enclosing closure`, capture.range);
        return null;
      }
      let typeNode = this.lookupTypeNode(capture.name);
      if (!typeNode) {
        this.fail(`Closures cannot capture '${capture.name}' from an enclosing closure without an explicit type annotation`, capture.range);
        return null;
      }
      envParams.push(capture.name);
      envParamTypes.push(typeNode);
    }
    return this.liftClosureWithEnv(node, declaration, bodyNode, range, envParams, envParamTypes);
  }

  /** Walks a closure body with the closure frame pushed, returning the
   *  body to use for a lifted method, or `null` on failure. */
  private walkClosureBody(bodyNode: Statement, range: Range): Statement | null {
    if (bodyNode.kind == NodeKind.Block) {
      if (!this.walkStatement(bodyNode)) return null;
      return bodyNode;
    }
    if (bodyNode.kind == NodeKind.Expression) {
      let expr = this.walkExpression((<ExpressionStatement>bodyNode).expression);
      if (!expr) return null;
      return blockStmt([ new ReturnStatement(expr, range) ], range);
    }
    this.fail("Closures with this body shape are not yet supported", bodyNode.range);
    return null;
  }

  /** Lifts a closure to a state-class method plus a top-level adapter.
   *  `envParams` are names the closure captures from an enclosing
   *  closure: they become extra method and adapter parameters, and
   *  call sites append them as arguments. */
  private liftClosureWithEnv(
    node: FunctionExpression,
    declaration: FunctionDeclaration,
    bodyNode: Statement,
    range: Range,
    envParams: string[],
    envParamTypes: TypeNode[]
  ): Expression | null {
    let methodName = `__closure_${this.closureCounter}`;
    let adapterName = `__adapt_${this.ctx.qualName}_${this.closureCounter++}`;
    let methodSignature = copyFunctionSignature(declaration.signature, range);
    let adapterSignature = copyFunctionSignature(declaration.signature, range);
    for (let i = 0, k = envParams.length; i < k; ++i) {
      methodSignature.parameters.push(new ParameterNode(ParameterKind.Default, ident(envParams[i], range), envParamTypes[i], null, range));
      adapterSignature.parameters.push(new ParameterNode(ParameterKind.Default, ident(envParams[i], range), envParamTypes[i], null, range));
    }
    this.closureFrameBases.push(this.frames.length);
    this.pushFrame(true);
    let parameters = declaration.signature.parameters;
    for (let i = 0, k = parameters.length; i < k; ++i) {
      this.declare(parameters[i].name.text, parameters[i].type, parameters[i].name.range);
    }
    for (let i = 0, k = envParams.length; i < k; ++i) {
      this.declare(envParams[i], envParamTypes[i]);
    }
    this.closureDepth++;
    let methodBody = this.walkClosureBody(bodyNode, range);
    this.closureDepth--;
    this.closureFrameBases.pop();
    this.popFrame();
    if (!methodBody) return null;
    let method = new MethodDeclaration(
      ident(methodName, range),
      null,
      CommonFlags.Instance,
      null,
      methodSignature,
      methodBody,
      range
    );
    let argIdents = new Array<Expression>();
    for (let i = 0, k = parameters.length; i < k; ++i) {
      argIdents.push(ident(parameters[i].name.text, parameters[i].name.range));
    }
    for (let i = 0, k = envParams.length; i < k; ++i) {
      argIdents.push(ident(envParams[i], range));
    }
    let stateAccess = new CallExpression(
      ident("changetype", range),
      [ namedType(this.ctx.stateClassName, null, false, range) ],
      [ ident(this.ctx.stateGlobalName, range) ],
      range
    );
    let adapterBody = blockStmt([
      new ReturnStatement(
        callExpr(
          new PropertyAccessExpression(stateAccess, ident(methodName, range), range),
          argIdents,
          range
        ),
        range
      )
    ], range);
    let adapter = new FunctionDeclaration(
      ident(adapterName, range),
      null,
      CommonFlags.None,
      null,
      adapterSignature,
      adapterBody,
      ArrowKind.None,
      range
    );
    if (this.ctx.genParent.getMember(adapterName)) {
      this.fail(`Generated name '${adapterName}' collides with an existing declaration`, range);
      return null;
    }
    if (!this.program.initializeGeneratedDeclaration(adapter, this.ctx.genParent)) {
      this.fail(`Could not register generated function '${adapterName}'`, range);
      return null;
    }
    this.methods.push(method);
    this.adapters.set(adapterName, method);
    if (envParams.length > 0) this.closureEnvParams.set(adapterName, envParams);
    return ident(adapterName, range);
  }
}
