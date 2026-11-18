/**
 * @fileoverview CPS state-machine transform for async functions (Phase 1,
 * chunk 1). Runs at the end of `Program.initialize()`: each top-level
 * async function declaration is rewritten into an explicit state machine
 * (state class with a `step()` dispatch method, entry wrapper, per-site
 * resume/reject exports, result/error/status exports, roots registry),
 * following the shape probe A proved. See STATUS.md for the contracts.
 * @license Apache-2.0
 */

import {
  NodeKind,
  Node,
  Statement,
  Expression,
  BlockStatement,
  BreakStatement,
  ExpressionStatement,
  ReturnStatement,
  SwitchStatement,
  SwitchCase,
  VariableStatement,
  VariableDeclaration,
  VariableLikeDeclarationStatement,
  IfStatement,
  WhileStatement,
  ForStatement,
  DoStatement,
  FunctionDeclaration,
  MethodDeclaration,
  ClassDeclaration,
  FieldDeclaration,
  ParameterNode,
  ParameterKind,
  FunctionTypeNode,
  TypeNode,
  NamedTypeNode,
  IdentifierExpression,
  CallExpression,
  BinaryExpression,
  PropertyAccessExpression,
  AwaitExpression,
  UnaryPrefixExpression,
  UnaryPostfixExpression,
  TernaryExpression,
  NewExpression,
  ParenthesizedExpression,
  CommaExpression,
  InstanceOfExpression,
  ElementAccessExpression,
  ArrayLiteralExpression,
  ObjectLiteralExpression,
  TemplateLiteralExpression,
  AssertionExpression,
  TypeName,
  ArrowKind,
  TrueExpression,
  NullExpression,
  ThisExpression,
  SourceKind
} from "./ast";

import {
  Range,
  DiagnosticCode
} from "./diagnostics";

import {
  CommonNames,
  CommonFlags
} from "./common";

import {
  Type,
  TypeKind
} from "./types";

import {
  Token
} from "./tokenizer";

import {
  Program,
  FunctionPrototype,
  Function,
  File,
  Element,
  ElementKind,
  Namespace,
  NamespaceDeclaration,
  ClassPrototype
} from "./program";

import {
  Flow
} from "./flow";

import {
  ReportMode
} from "./resolver";

import {
  AsyncScope,
  AsyncLocalBinding,
  AsyncFail,
  ident,
  thisProp,
  intLit,
  strLit,
  callExpr,
  assignExpr,
  exprStmt,
  blockStmt,
  namedType,
  typeToTypeNode,
  promiseInnerNode,
  zeroValue,
  rewriteExpression,
  rewriteStatement,
  containsAwait,
  validateBody,
  SPILL_POOL_SIZE,
  SPILL_ACQUIRE,
  SPILL_RELEASE,
  SPILL_GET,
  SPILL_SET
} from "./asyncRewrite";

/** Fallthrough target meaning "the function completes". */
const CONT_TERMINAL = -1;
/** Break/continue target meaning "no enclosing loop". */
const NO_TARGET = -1;
/** Base offset for segment ids in the `state` field. Suspended states are
 *  `site + 1` (1..sites), so segment states live at `CPS_SEGMENT_BASE + id`
 *  and can never collide with a suspended state. */
const CPS_SEGMENT_BASE = 1024;

/** Outcome of attempting to transform one async function. */
const enum TransformOutcome {
  Transformed,
  Rejected,
  Untransformed
}

/** One await site in the body. */
class AwaitSite {
  constructor(
    /** Index of the site, in order of appearance. */
    public id: i32,
    /** Type of the awaited value. */
    public type: Type,
    /** Type node denoting the awaited value. */
    public typeNode: TypeNode,
    /** Whether any code consumes the value. */
    public used: bool,
    /** Rewritten call expression issuing the suspension. */
    public call: CallExpression,
    /** Spill slot field, when the awaited value is an externref. */
    public slotField: string,
    /** Source range of the await expression. */
    public range: Range
  ) {}
}

/** One state field. */
class StateField {
  constructor(
    public name: string,
    public typeNode: TypeNode,
    public type: Type
  ) {}
}

/** One externref spill slot reservation. */
class SpillSlot {
  constructor(
    /** "param", "local", "pend" or "result". */
    public kind: string,
    /** Local name, "pend<n>" or "result". */
    public name: string,
    /** State field holding the acquired slot index. */
    public slotField: string
  ) {}
}

/** One segment of the state machine. */
class Segment {
  stmts: Statement[] = new Array<Statement>();
  end: SegmentEnd | null = null;
  constructor(
    public id: i32
  ) {}
}

/** How a segment ends. */
class SegmentEnd {
  constructor(
    /** "jump" sets state and re-dispatches, "redispatch" only re-dispatches,
     *  "suspend" suspends after the call, "terminal" completes. */
    public kind: string,
    public next: i32 = NO_TARGET,
    /** Await site id, for "suspend" ends. */
    public site: i32 = -1
  ) {}
}

/** Transforms all async functions in the program. Called from `Program.initialize()`. */
export function transformAsyncFunctions(program: Program): void {
  let pools = new Set<string>();
  let files = Map_values(program.filesByName);
  for (let i = 0, k = files.length; i < k; ++i) {
    let file = files[i];
    if (file.source.sourceKind == SourceKind.LibraryEntry) continue;
    let functions = new Array<FunctionPrototype>();
    let methods = new Array<FunctionPrototype>();
    collectAsyncFunctions(file, functions, methods);
    for (let j = 0, l = methods.length; j < l; ++j) {
      let method = methods[j];
      program.error(
        DiagnosticCode.Not_implemented_0,
        method.identifierNode.range,
        "Async methods are not yet supported"
      );
      program.rejectedAsyncFunctions.add(method);
    }
    for (let j = 0, l = functions.length; j < l; ++j) {
      let transform = new AsyncFunctionTransform(program, file, functions[j], pools);
      transform.run();
    }
  }
}

function collectAsyncFunctions(
  element: Element,
  functions: FunctionPrototype[],
  methods: FunctionPrototype[]
): void {
  let members = element.members;
  if (!members) return;
  let values = Map_values(members);
  for (let i = 0, k = values.length; i < k; ++i) {
    let member = values[i];
    if (member.kind == ElementKind.FunctionPrototype && member.is(CommonFlags.Async)) {
      let prototype = <FunctionPrototype>member;
      if (prototype.declaration.kind == NodeKind.MethodDeclaration) {
        methods.push(prototype);
      } else if (prototype.declaration.kind == NodeKind.FunctionDeclaration) {
        functions.push(prototype);
      }
    } else if (member.kind == ElementKind.Namespace) {
      collectAsyncFunctions(member, functions, methods);
    } else if (member.kind == ElementKind.ClassPrototype) {
      let prototype = <ClassPrototype>member;
      let instanceMembers = prototype.instanceMembers;
      if (instanceMembers) {
        let instanceValues = Map_values(instanceMembers);
        for (let j = 0, l = instanceValues.length; j < l; ++j) {
          let instanceMember = instanceValues[j];
          if (instanceMember.kind == ElementKind.FunctionPrototype && instanceMember.is(CommonFlags.Async)) {
            methods.push(<FunctionPrototype>instanceMember);
          }
        }
      }
    }
  }
}

/** Per-function transform state. */
class AsyncFunctionTransform {
  private resolver = this.program.resolver;
  private declaration: FunctionDeclaration;
  private parent: Element;
  private fnName: string;
  private range: Range;
  private instance: Function | null = null;
  private flow: Flow | null = null;
  private returnType: Type = Type.void;
  private returnTypeNode: TypeNode | null = null;
  private scope = new AsyncScope();
  private segments = new Array<Segment>();
  private cur: i32 = 0;
  private curClosed: bool = false;
  private terminalSegment: i32 = -1;
  private sites = new Array<AwaitSite>();
  private fields = new Array<StateField>();
  private slots = new Array<SpillSlot>();
  private fieldCounter: i32 = 0;
  private failed: bool = false;
  private punted: bool = false;
  private stateClassName: string;
  private rootsName: string;
  private fileBase: string;

  constructor(
    private program: Program,
    private file: File,
    private prototype: FunctionPrototype,
    private pools: Set<string>
  ) {
    this.declaration = <FunctionDeclaration>prototype.declaration;
    this.parent = prototype.parent;
    this.fnName = prototype.name;
    this.range = this.declaration.range;
    this.fileBase = sanitizeName(file.source.simplePath);
    this.stateClassName = `__Cps_${this.fnName}`;
    this.rootsName = `__async_roots_${this.fnName}`;
  }

  private get fail(): AsyncFail {
    let program = this.program;
    let self = this;
    return (message: string, range: Range): void => {
      if (!self.failed) {
        program.error(DiagnosticCode.Not_implemented_0, range, message);
      }
      self.failed = true;
    };
  }

  run(): void {
    let outcome = this.transform();
    if (outcome == TransformOutcome.Transformed) {
      this.program.transformedAsyncFunctions.add(this.prototype);
    } else if (outcome == TransformOutcome.Rejected) {
      this.program.rejectedAsyncFunctions.add(this.prototype);
    }
  }

  private transform(): TransformOutcome {
    let prototype = this.prototype;
    let typeParameters = prototype.typeParameterNodes;
    if (typeParameters && typeParameters.length > 0) {
      this.fail("Generic async functions are not yet supported", this.declaration.name.range);
      return TransformOutcome.Rejected;
    }
    if (this.declaration.kind == NodeKind.MethodDeclaration) {
      this.fail("Async methods are not yet supported", this.declaration.name.range);
      return TransformOutcome.Rejected;
    }
    let instance = this.resolver.resolveFunction(prototype, null, new Map(), ReportMode.Report);
    if (!instance) return TransformOutcome.Rejected;
    this.instance = instance;
    let signature = instance.signature;
    let parameters = prototype.functionTypeNode.parameters;
    for (let i = 0, k = parameters.length; i < k; ++i) {
      let parameter = parameters[i];
      if (parameter.parameterKind != ParameterKind.Default || parameter.initializer) {
        this.fail("Async functions with default, optional or rest parameters are not yet supported", parameter.range);
        return TransformOutcome.Rejected;
      }
    }
    let unwrapped = this.resolver.unwrapPromiseType(signature.returnType);
    if (!unwrapped) return TransformOutcome.Rejected;
    this.returnType = unwrapped;
    let returnTypeNode = prototype.functionTypeNode.returnType;
    let innerNode = promiseInnerNode(returnTypeNode);
    if (innerNode) {
      this.returnTypeNode = innerNode;
    } else {
      let converted = typeToTypeNode(unwrapped, returnTypeNode.range);
      if (!converted) {
        this.fail(`Async functions cannot return values of type '${unwrapped.toString()}' yet`, returnTypeNode.range);
        return TransformOutcome.Rejected;
      }
      this.returnTypeNode = converted;
    }
    if (unwrapped.kind == TypeKind.Extern) {
      this.slots.push(new SpillSlot("result", "__result", "__slot_result"));
    } else if (unwrapped.kind != TypeKind.Void) {
      if (!zeroValue(unwrapped, assert(this.returnTypeNode), returnTypeNode.range)) {
        this.fail(`Async functions cannot return values of type '${unwrapped.toString()}' yet`, returnTypeNode.range);
        return TransformOutcome.Rejected;
      }
    }
    let bodyNode = prototype.bodyNode;
    if (!bodyNode) return TransformOutcome.Rejected;
    if (!validateBody(bodyNode, this.fail)) return TransformOutcome.Rejected;
    this.flow = Flow.createDefault(instance);
    let parameterTypes = signature.parameterTypes;
    for (let i = 0, k = parameters.length; i < k; ++i) {
      let parameter = parameters[i];
      let outcome = this.declareLocal(parameter.name.text, parameter.type, parameterTypes[i], parameter.name.range, parameter, true);
      if (outcome != TransformOutcome.Transformed) return outcome;
    }
    this.newSegment();
    let statements: Statement[];
    if (bodyNode.kind == NodeKind.Block) {
      statements = (<BlockStatement>bodyNode).statements;
    } else {
      statements = [ bodyNode ];
    }
    this.transformList(statements, CONT_TERMINAL, NO_TARGET, NO_TARGET);
    if (this.failed) return TransformOutcome.Rejected;
    if (this.punted) return TransformOutcome.Untransformed;
    if (this.slots.length > SPILL_POOL_SIZE) {
      this.fail(`Async function needs ${this.slots.length} externref spill slots, but the pool has only ${SPILL_POOL_SIZE}`, this.declaration.name.range);
      return TransformOutcome.Rejected;
    }
    if (this.sites.length >= CPS_SEGMENT_BASE) {
      this.fail(`Async function has ${this.sites.length} await sites, but the state encoding supports only ${CPS_SEGMENT_BASE - 1}`, this.declaration.name.range);
      return TransformOutcome.Rejected;
    }
    if (!this.generate()) return TransformOutcome.Rejected;
    return TransformOutcome.Transformed;
  }

  // === Scopes =====================================================================================

  private pushScope(): void {
    this.scope.push();
    this.flow = assert(this.flow).fork();
  }

  private popScope(): void {
    this.scope.pop();
    let flow = assert(this.flow);
    this.flow = assert(flow.parent);
  }

  private rewriter(): { scope: AsyncScope, fail: AsyncFail } {
    return { scope: this.scope, fail: this.fail };
  }

  // === Locals =====================================================================================

  /** Declares a lifted local or parameter. */
  private declareLocal(
    name: string,
    typeNode: TypeNode | null,
    type: Type | null,
    nameRange: Range,
    declarationNode: Node,
    isParam: bool
  ): TransformOutcome {
    let existing = this.scope.lookupCurrent(name);
    if (existing) {
      this.program.error(
        DiagnosticCode.Duplicate_identifier_0,
        nameRange,
        name
      );
      this.failed = true;
      return TransformOutcome.Rejected;
    }
    if (!type) {
      this.punted = true;
      return TransformOutcome.Untransformed;
    }
    let flow = assert(this.flow);
    if (flow.getScopedLocal(name)) {
      this.program.error(
        DiagnosticCode.Duplicate_identifier_0,
        nameRange,
        name
      );
      this.failed = true;
      return TransformOutcome.Rejected;
    }
    flow.addScopedDummyLocal(name, type, declarationNode);
    if (type.kind == TypeKind.Extern) {
      let slotField = `__slot_${name}_${this.fieldCounter++}`;
      this.slots.push(new SpillSlot(isParam ? "param" : "local", name, slotField));
      this.scope.declare(name, {
        field: "",
        spilled: true,
        slotField,
        range: nameRange,
        shadowed: false
      });
      return TransformOutcome.Transformed;
    }
    let fieldTypeNode: TypeNode | null = typeNode;
    if (!fieldTypeNode) {
      fieldTypeNode = typeToTypeNode(type, nameRange);
      if (!fieldTypeNode) {
        this.fail(`Async functions cannot lift locals of type '${type.toString()}' yet`, nameRange);
        return TransformOutcome.Rejected;
      }
    }
    if (!zeroValue(type, fieldTypeNode, nameRange)) {
      this.fail(`Async functions cannot lift locals of type '${type.toString()}' yet`, nameRange);
      return TransformOutcome.Rejected;
    }
    let fieldName = `__cps_${name}_${this.fieldCounter++}`;
    this.fields.push(new StateField(fieldName, fieldTypeNode, type));
    this.scope.declare(name, {
      field: fieldName,
      spilled: false,
      slotField: "",
      range: nameRange,
      shadowed: false
    });
    return TransformOutcome.Transformed;
  }

  /** Emits an assignment to a lifted local, honouring spill slots. */
  private emitLocalAssign(name: string, value: Expression, range: Range): void {
    let binding = this.scope.lookup(name);
    assert(binding != null);
    if (binding!.spilled) {
      this.emit(exprStmt(callExpr(
        ident(SPILL_SET, range),
        [ thisProp(binding!.slotField, range), value ],
        range
      )));
      return;
    }
    this.emit(exprStmt(assignExpr(thisProp(binding!.field, range), value, range)));
  }

  /** The expression delivering an awaited value in the resume segment. */
  private pendAccess(site: AwaitSite, range: Range): Expression {
    if (site.type.kind == TypeKind.Extern) {
      return callExpr(ident(SPILL_GET, range), [ thisProp(site.slotField, range) ], range);
    }
    return thisProp(`__pend${site.id}`, range);
  }

  private slotTemp(slotField: string): string {
    for (let i = 0, k = this.slots.length; i < k; ++i) {
      if (this.slots[i].slotField == slotField) return `__s${i}`;
    }
    return "__s0";
  }

  // === Segments =================================================================================

  private createSegment(): i32 {
    let id = this.segments.length;
    this.segments.push(new Segment(id));
    return id;
  }

  private newSegment(): i32 {
    let id = this.createSegment();
    this.cur = id;
    this.curClosed = false;
    return id;
  }

  private setCurrent(id: i32): void {
    this.cur = id;
    this.curClosed = false;
  }

  private ensureOpenSegment(): void {
    if (this.curClosed) this.newSegment();
  }

  private emit(stmt: Statement): void {
    this.ensureOpenSegment();
    this.segments[this.cur].stmts.push(stmt);
  }

  private closeCurrent(end: SegmentEnd): void {
    if (this.curClosed) return;
    this.segments[this.cur].end = end;
    this.curClosed = true;
  }

  private resolveCont(cont: i32): i32 {
    if (cont != CONT_TERMINAL) return cont;
    if (this.terminalSegment < 0) {
      let id = this.createSegment();
      this.segments[id].end = new SegmentEnd("terminal");
      this.terminalSegment = id;
    }
    return this.terminalSegment;
  }

  /** Transforms a statement list, closing its final segment toward `cont`. */
  private transformList(
    statements: Statement[],
    cont: i32,
    breakTarget: i32,
    continueTarget: i32
  ): void {
    for (let i = 0, k = statements.length; i < k; ++i) {
      this.transformStatement(statements[i], cont, breakTarget, continueTarget, i == k - 1);
      if (this.failed || this.punted) return;
    }
    this.closeCurrent(
      cont == CONT_TERMINAL
        ? new SegmentEnd("terminal")
        : new SegmentEnd("jump", cont)
    );
  }

  /** Transforms a statement list inline, leaving the current segment open. */
  private transformBlockInline(
    statements: Statement[],
    breakTarget: i32,
    continueTarget: i32
  ): void {
    this.pushScope();
    for (let i = 0, k = statements.length; i < k; ++i) {
      this.transformStatement(statements[i], CONT_TERMINAL, breakTarget, continueTarget, false);
      if (this.failed || this.punted) {
        this.popScope();
        return;
      }
    }
    this.popScope();
  }

  private transformStatement(
    stmt: Statement,
    cont: i32,
    breakTarget: i32,
    continueTarget: i32,
    isLast: bool
  ): void {
    switch (stmt.kind) {
      case NodeKind.Block: {
        this.transformBlockInline((<BlockStatement>stmt).statements, breakTarget, continueTarget);
        return;
      }
      case NodeKind.Variable: {
        this.transformVariable(<VariableStatement>stmt);
        return;
      }
      case NodeKind.Expression: {
        this.transformExpressionStatement(<ExpressionStatement>stmt);
        return;
      }
      case NodeKind.Return: {
        this.transformReturn(<ReturnStatement>stmt);
        return;
      }
      case NodeKind.If: {
        this.transformIf(<IfStatement>stmt, cont, breakTarget, continueTarget, isLast);
        return;
      }
      case NodeKind.While: {
        this.transformWhile(<WhileStatement>stmt, cont, breakTarget, continueTarget, isLast);
        return;
      }
      case NodeKind.For: {
        this.transformFor(<ForStatement>stmt, cont, breakTarget, continueTarget, isLast);
        return;
      }
      case NodeKind.Do: {
        this.transformDo(<DoStatement>stmt, cont, breakTarget, continueTarget, isLast);
        return;
      }
      case NodeKind.Break: {
        if (breakTarget == NO_TARGET) {
          this.fail("'break' outside of a loop is not allowed here", stmt.range);
          return;
        }
        this.closeCurrent(new SegmentEnd("jump", breakTarget));
        return;
      }
      case NodeKind.Continue: {
        if (continueTarget == NO_TARGET) {
          this.fail("'continue' outside of a loop is not allowed here", stmt.range);
          return;
        }
        this.closeCurrent(new SegmentEnd("jump", continueTarget));
        return;
      }
      case NodeKind.Empty: {
        return;
      }
      default: {
        if (containsAwait(stmt)) {
          this.fail("'await' in this statement is not yet supported", stmt.range);
          return;
        }
        let rewritten = rewriteStatement(stmt, this.rewriter());
        if (!rewritten) {
          this.failed = true;
          return;
        }
        this.emit(rewritten);
        return;
      }
    }
  }

  private checkNoAwait(expr: Expression): bool {
    if (containsAwait(expr)) {
      this.fail("'await' is only supported as a whole expression statement, variable initializer, assignment or return value", expr.range);
      return false;
    }
    return true;
  }

  private rewriteChecked(expr: Expression): Expression | null {
    if (!this.checkNoAwait(expr)) return null;
    let rewritten = rewriteExpression(expr, this.rewriter());
    if (!rewritten) this.failed = true;
    return rewritten;
  }

  // === Statements ===============================================================================

  private transformVariable(stmt: VariableStatement): void {
    let declarations = stmt.declarations;
    for (let i = 0, k = declarations.length; i < k; ++i) {
      let declaration = declarations[i];
      let name = declaration.name.text;
      let initializer = declaration.initializer;
      if (initializer && unwrapParens(initializer).kind == NodeKind.Await) {
        let awaitExpr = <AwaitExpression>unwrapParens(initializer);
        let site = this.transformAwait(awaitExpr, true);
        if (!site) return;
        let type: Type | null = site.type;
        if (declaration.type) {
          let annotated = this.resolver.resolveType(declaration.type, this.flow, this.parent, null, ReportMode.Swallow);
          if (!annotated) {
            this.punted = true;
            return;
          }
          type = annotated;
        }
        let outcome = this.declareLocal(name, declaration.type, type, declaration.name.range, declaration, false);
        if (outcome != TransformOutcome.Transformed) return;
        this.suspendCurrent(site);
        this.emitAwaitAssignment(name, site, declaration.range);
        continue;
      }
      let type: Type | null = null;
      if (declaration.type) {
        type = this.resolver.resolveType(declaration.type, this.flow, this.parent, null, ReportMode.Swallow);
        if (!type) {
          this.punted = true;
          return;
        }
      } else if (initializer) {
        this.checkDirectAsyncCalls(initializer);
        if (this.failed) return;
        type = this.resolver.resolveExpression(initializer, assert(this.flow), Type.auto, ReportMode.Swallow);
        if (!type) {
          this.punted = true;
          return;
        }
      }
      let outcome = this.declareLocal(name, declaration.type, type, declaration.name.range, declaration, false);
      if (outcome != TransformOutcome.Transformed) return;
      if (initializer) {
        let rewrittenInit = this.rewriteChecked(initializer);
        if (!rewrittenInit) return;
        this.emitLocalAssign(name, rewrittenInit, declaration.range);
      }
    }
  }

  private transformExpressionStatement(stmt: ExpressionStatement): void {
    let expr = unwrapParens(stmt.expression);
    if (expr.kind == NodeKind.Await) {
      let site = this.transformAwait(<AwaitExpression>expr, false);
      if (!site) return;
      this.suspendCurrent(site);
      return;
    }
    if (
      expr.kind == NodeKind.Binary &&
      (<BinaryExpression>expr).operator == Token.Equals &&
      unwrapParens((<BinaryExpression>expr).right).kind == NodeKind.Await
    ) {
      let binary = <BinaryExpression>expr;
      let left = unwrapParens(binary.left);
      if (left.kind != NodeKind.Identifier) {
        this.fail("'await' can only be assigned to a local variable", left.range);
        return;
      }
      let name = (<IdentifierExpression>left).text;
      let site = this.transformAwait(<AwaitExpression>unwrapParens(binary.right), true);
      if (!site) return;
      this.suspendCurrent(site);
      let binding = this.scope.lookup(name);
      if (binding) {
        this.emitAwaitAssignment(name, site, stmt.range);
      } else {
        this.emit(exprStmt(assignExpr(ident(name, left.range), this.pendAccess(site, stmt.range), stmt.range)));
      }
      return;
    }
    this.checkDirectAsyncCalls(stmt.expression);
    if (this.failed) return;
    let rewritten = this.rewriteChecked(stmt.expression);
    if (!rewritten) return;
    this.emit(exprStmt(rewritten));
  }

  private transformReturn(stmt: ReturnStatement): void {
    let value = stmt.value;
    if (value && unwrapParens(value).kind == NodeKind.Await) {
      let site = this.transformAwait(<AwaitExpression>unwrapParens(value), true);
      if (!site) return;
      this.suspendCurrent(site);
      this.emitReturnAssignment(site, stmt.range);
      this.emitTerminal(stmt.range);
      return;
    }
    if (value) {
      this.checkDirectAsyncCalls(value);
      if (this.failed) return;
      let rewritten = this.rewriteChecked(value);
      if (!rewritten) return;
      if (this.returnType.kind != TypeKind.Void) {
        this.emit(exprStmt(assignExpr(this.resultAccess(stmt.range), rewritten, stmt.range)));
      }
    }
    this.emitTerminal(stmt.range);
  }

  private transformIf(
    stmt: IfStatement,
    cont: i32,
    breakTarget: i32,
    continueTarget: i32,
    isLast: bool
  ): void {
    let condition = this.rewriteChecked(stmt.condition);
    if (!condition) return;
    let join: i32;
    if (isLast) {
      join = cont;
    } else {
      join = this.createSegment();
    }
    let thenEntry = this.createSegment();
    let elseEntry: i32;
    if (stmt.ifElse) {
      elseEntry = this.createSegment();
    } else {
      elseEntry = join;
    }
    let dispatch = new IfStatement(
      condition,
      blockStmt([ exprStmt(assignExpr(this.stateAccess(stmt.range), this.segState(thenEntry, stmt.range), stmt.range)) ], stmt.range),
      blockStmt([ exprStmt(assignExpr(this.stateAccess(stmt.range), this.segState(elseEntry, stmt.range), stmt.range)) ], stmt.range),
      stmt.range
    );
    this.emit(dispatch);
    this.closeCurrent(new SegmentEnd("redispatch"));
    this.setCurrent(thenEntry);
    this.pushScope();
    this.transformList(asStatements(stmt.ifTrue), join, breakTarget, continueTarget);
    this.popScope();
    if (this.failed || this.punted) return;
    if (stmt.ifElse) {
      this.setCurrent(elseEntry);
      this.pushScope();
      this.transformList(asStatements(stmt.ifElse), join, breakTarget, continueTarget);
      this.popScope();
      if (this.failed || this.punted) return;
    }
    if (!isLast) {
      this.setCurrent(join);
    }
  }

  private transformWhile(
    stmt: WhileStatement,
    cont: i32,
    breakTarget: i32,
    continueTarget: i32,
    isLast: bool
  ): void {
    let condition = this.rewriteChecked(stmt.condition);
    if (!condition) return;
    let after: i32;
    if (isLast) {
      after = cont;
    } else {
      after = this.createSegment();
    }
    let head = this.createSegment();
    let bodyEntry = this.createSegment();
    this.closeCurrent(new SegmentEnd("jump", head));
    this.setCurrent(head);
    let dispatch = new IfStatement(
      condition,
      blockStmt([ exprStmt(assignExpr(this.stateAccess(stmt.range), this.segState(bodyEntry, stmt.range), stmt.range)) ], stmt.range),
      blockStmt([ exprStmt(assignExpr(this.stateAccess(stmt.range), this.segState(this.resolveCont(after), stmt.range), stmt.range)) ], stmt.range),
      stmt.range
    );
    this.emit(dispatch);
    this.closeCurrent(new SegmentEnd("redispatch"));
    this.setCurrent(bodyEntry);
    this.pushScope();
    this.transformList(asStatements(stmt.body), head, this.resolveCont(after), head);
    this.popScope();
    if (this.failed || this.punted) return;
    if (!isLast) {
      this.setCurrent(after);
    }
  }

  private transformFor(
    stmt: ForStatement,
    cont: i32,
    breakTarget: i32,
    continueTarget: i32,
    isLast: bool
  ): void {
    let after: i32;
    if (isLast) {
      after = cont;
    } else {
      after = this.createSegment();
    }
    let head = this.createSegment();
    let bodyEntry = this.createSegment();
    let incr: i32;
    if (stmt.incrementor) {
      incr = this.createSegment();
    } else {
      incr = head;
    }
    this.pushScope();
    if (stmt.initializer) {
      this.transformStatement(stmt.initializer, CONT_TERMINAL, NO_TARGET, NO_TARGET, false);
      if (this.failed || this.punted) {
        this.popScope();
        return;
      }
    }
    let condition: Expression | null = null;
    if (stmt.condition) {
      condition = this.rewriteChecked(stmt.condition);
      if (!condition) {
        this.popScope();
        return;
      }
    }
    let incrementor: Expression | null = null;
    if (stmt.incrementor) {
      incrementor = this.rewriteChecked(stmt.incrementor);
      if (!incrementor) {
        this.popScope();
        return;
      }
    }
    this.closeCurrent(new SegmentEnd("jump", head));
    this.setCurrent(head);
    if (condition) {
      let dispatch = new IfStatement(
        condition,
        blockStmt([ exprStmt(assignExpr(this.stateAccess(stmt.range), this.segState(bodyEntry, stmt.range), stmt.range)) ], stmt.range),
        blockStmt([ exprStmt(assignExpr(this.stateAccess(stmt.range), this.segState(this.resolveCont(after), stmt.range), stmt.range)) ], stmt.range),
        stmt.range
      );
      this.emit(dispatch);
    } else {
      this.emit(exprStmt(assignExpr(this.stateAccess(stmt.range), this.segState(bodyEntry, stmt.range), stmt.range)));
    }
    this.closeCurrent(new SegmentEnd("redispatch"));
    if (stmt.incrementor) {
      this.setCurrent(incr);
      this.emit(exprStmt(incrementor!));
      this.closeCurrent(new SegmentEnd("jump", head));
    }
    this.setCurrent(bodyEntry);
    this.transformList(asStatements(stmt.body), incr, this.resolveCont(after), incr);
    this.popScope();
    if (this.failed || this.punted) return;
    if (!isLast) {
      this.setCurrent(after);
    }
  }

  private transformDo(
    stmt: DoStatement,
    cont: i32,
    breakTarget: i32,
    continueTarget: i32,
    isLast: bool
  ): void {
    let condition = this.rewriteChecked(stmt.condition);
    if (!condition) return;
    let after: i32;
    if (isLast) {
      after = cont;
    } else {
      after = this.createSegment();
    }
    let bodyEntry = this.createSegment();
    let condEntry = this.createSegment();
    this.closeCurrent(new SegmentEnd("jump", bodyEntry));
    this.setCurrent(condEntry);
    let dispatch = new IfStatement(
      condition,
      blockStmt([ exprStmt(assignExpr(this.stateAccess(stmt.range), this.segState(bodyEntry, stmt.range), stmt.range)) ], stmt.range),
      blockStmt([ exprStmt(assignExpr(this.stateAccess(stmt.range), this.segState(this.resolveCont(after), stmt.range), stmt.range)) ], stmt.range),
      stmt.range
    );
    this.emit(dispatch);
    this.closeCurrent(new SegmentEnd("redispatch"));
    this.setCurrent(bodyEntry);
    this.pushScope();
    this.transformList(asStatements(stmt.body), condEntry, this.resolveCont(after), condEntry);
    this.popScope();
    if (this.failed || this.punted) return;
    if (!isLast) {
      this.setCurrent(after);
    }
  }

  // === Await ====================================================================================

  /** Validates an await operand and records the site. Returns `null` on failure. */
  private transformAwait(node: AwaitExpression, used: bool): AwaitSite | null {
    let operand = unwrapParens(node.operand);
    if (operand.kind != NodeKind.Call) {
      this.fail("'await' is only supported on direct calls to suspending imports", node.range);
      return null;
    }
    let call = <CallExpression>operand;
    let callee = call.expression;
    if (callee.kind == NodeKind.PropertyAccess) {
      let access = <PropertyAccessExpression>callee;
      if (access.expression.kind == NodeKind.Identifier && (<IdentifierExpression>access.expression).text == CommonNames.Promise) {
        let policy = access.property.text;
        if (policy == "all" || policy == "race" || policy == "allSettled" || policy == "any") {
          this.fail(`'await' of 'Promise.${policy}' is not yet supported (join primitive, chunk 5)`, node.range);
          return null;
        }
      }
      this.fail("'await' of a member call is not yet supported", node.range);
      return null;
    }
    if (callee.kind != NodeKind.Identifier) {
      this.fail("'await' is only supported on direct calls to suspending imports", node.range);
      return null;
    }
    this.checkDirectAsyncCalls(call);
    if (this.failed) return null;
    let flow = assert(this.flow);
    let operandType = this.resolver.resolveExpression(operand, flow, Type.auto, ReportMode.Swallow);
    if (!operandType) {
      this.punted = true;
      return null;
    }
    let unwrapped = this.resolver.unwrapPromiseType(operandType);
    if (!unwrapped) {
      this.program.error(
        DiagnosticCode.The_operand_of_an_await_expression_must_be_a_Promise,
        operand.range
      );
      this.failed = true;
      return null;
    }
    let calleeName = (<IdentifierExpression>callee).text;
    let element = flow.lookup(calleeName);
    if (!element) {
      this.punted = true;
      return null;
    }
    if (element.kind != ElementKind.FunctionPrototype || !(<FunctionPrototype>element).is(CommonFlags.Ambient)) {
      this.fail("'await' is only supported on direct calls to suspending imports", node.range);
      return null;
    }
    let typeNode = typeToTypeNode(unwrapped, node.range);
    if (!typeNode) {
      this.fail(`Async functions cannot await values of type '${unwrapped.toString()}' yet`, node.range);
      return null;
    }
    if (unwrapped.kind != TypeKind.Extern && !zeroValue(unwrapped, typeNode, node.range)) {
      this.fail(`Async functions cannot await values of type '${unwrapped.toString()}' yet`, node.range);
      return null;
    }
    let rewrittenCall = rewriteExpression(call, this.rewriter());
    if (!rewrittenCall || rewrittenCall.kind != NodeKind.Call) {
      this.failed = true;
      return null;
    }
    let site = new AwaitSite(
      this.sites.length, unwrapped, typeNode, used,
      <CallExpression>rewrittenCall, "", node.range
    );
    this.sites.push(site);
    if (unwrapped.kind == TypeKind.Extern) {
      site.slotField = `__slot_pend${site.id}`;
      this.slots.push(new SpillSlot("pend", `pend${site.id}`, site.slotField));
    }
    return site;
  }

  /** Rejects direct (non-awaited) calls to async functions in an expression. */
  private checkDirectAsyncCalls(expr: Expression): void {
    if (expr instanceof CallExpression) {
      let callee = expr.expression;
      if (callee.kind == NodeKind.Identifier) {
        let element = assert(this.flow).lookup((<IdentifierExpression>callee).text);
        if (
          element &&
          element.kind == ElementKind.FunctionPrototype &&
          element.is(CommonFlags.Async)
        ) {
          this.fail("Direct calls to async functions are not supported; await them", callee.range);
          return;
        }
      }
      this.checkDirectAsyncCalls(expr.expression);
      if (this.failed) return;
      let args = expr.args;
      for (let i = 0, k = args.length; i < k; ++i) {
        this.checkDirectAsyncCalls(args[i]);
        if (this.failed) return;
      }
      return;
    }
    if (expr instanceof BinaryExpression) {
      this.checkDirectAsyncCalls(expr.left);
      if (this.failed) return;
      this.checkDirectAsyncCalls(expr.right);
      return;
    }
    if (expr instanceof PropertyAccessExpression) {
      this.checkDirectAsyncCalls(expr.expression);
      return;
    }
    if (expr instanceof ElementAccessExpression) {
      this.checkDirectAsyncCalls(expr.expression);
      if (this.failed) return;
      this.checkDirectAsyncCalls(expr.elementExpression);
      return;
    }
    if (expr instanceof UnaryPrefixExpression || expr instanceof UnaryPostfixExpression) {
      this.checkDirectAsyncCalls(expr.operand);
      return;
    }
    if (expr instanceof TernaryExpression) {
      this.checkDirectAsyncCalls(expr.condition);
      if (this.failed) return;
      this.checkDirectAsyncCalls(expr.ifThen);
      if (this.failed) return;
      this.checkDirectAsyncCalls(expr.ifElse);
      return;
    }
    if (expr instanceof AssertionExpression) {
      this.checkDirectAsyncCalls(expr.expression);
      return;
    }
    if (expr instanceof ParenthesizedExpression) {
      this.checkDirectAsyncCalls(expr.expression);
      return;
    }
    if (expr instanceof CommaExpression) {
      let exprs = expr.expressions;
      for (let i = 0, k = exprs.length; i < k; ++i) {
        this.checkDirectAsyncCalls(exprs[i]);
        if (this.failed) return;
      }
      return;
    }
    if (expr instanceof InstanceOfExpression) {
      this.checkDirectAsyncCalls(expr.expression);
      return;
    }
    if (expr instanceof NewExpression) {
      let args = expr.args;
      for (let i = 0, k = args.length; i < k; ++i) {
        this.checkDirectAsyncCalls(args[i]);
        if (this.failed) return;
      }
      return;
    }
    if (expr instanceof ArrayLiteralExpression) {
      let elements = expr.elementExpressions;
      for (let i = 0, k = elements.length; i < k; ++i) {
        this.checkDirectAsyncCalls(elements[i]);
        if (this.failed) return;
      }
      return;
    }
    if (expr instanceof ObjectLiteralExpression) {
      let values = expr.values;
      for (let i = 0, k = values.length; i < k; ++i) {
        this.checkDirectAsyncCalls(values[i]);
        if (this.failed) return;
      }
      return;
    }
    if (expr instanceof TemplateLiteralExpression) {
      if (expr.tag) this.checkDirectAsyncCalls(expr.tag);
      if (this.failed) return;
      let exprs = expr.expressions;
      for (let i = 0, k = exprs.length; i < k; ++i) {
        this.checkDirectAsyncCalls(exprs[i]);
        if (this.failed) return;
      }
      return;
    }
  }

  /** Closes the current segment with a suspension at the site. */
  private suspendCurrent(site: AwaitSite): void {
    this.emit(exprStmt(site.call));
    let next = this.segments.length;
    this.closeCurrent(new SegmentEnd("suspend", next, site.id));
    this.newSegment();
    assert(this.cur == next);
  }

  /** State value addressing a segment in the `state` field. */
  private segState(id: i32, range: Range): Expression {
    return intLit(CPS_SEGMENT_BASE + id, range);
  }

  /** Emits the assignment of the awaited value into its local. */
  private emitAwaitAssignment(name: string, site: AwaitSite, range: Range): void {
    let binding = this.scope.lookup(name);
    assert(binding != null);
    if (binding!.spilled) {
      this.emit(exprStmt(callExpr(
        ident(SPILL_SET, range),
        [ thisProp(binding!.slotField, range), this.pendAccess(site, range) ],
        range
      )));
      return;
    }
    this.emit(exprStmt(assignExpr(thisProp(binding!.field, range), this.pendAccess(site, range), range)));
  }

  private emitReturnAssignment(site: AwaitSite, range: Range): void {
    if (this.returnType.kind == TypeKind.Void) return;
    if (this.returnType.kind == TypeKind.Extern) {
      this.emit(exprStmt(callExpr(
        ident(SPILL_SET, range),
        [ thisProp("__slot_result", range), this.pendAccess(site, range) ],
        range
      )));
      return;
    }
    this.emit(exprStmt(assignExpr(this.resultAccess(range), this.pendAccess(site, range), range)));
  }

  private emitTerminal(range: Range): void {
    this.closeCurrent(new SegmentEnd("terminal"));
  }

  private stateAccess(range: Range): Expression {
    return thisProp("state", range);
  }

  private resultAccess(range: Range): Expression {
    return thisProp("__result", range);
  }

  /** Statements completing the task: state `finalState`, release slots, drop the root. */
  private terminalStatements(inStep: bool, range: Range, finalState: i32): Statement[] {
    let stmts = new Array<Statement>();
    let stateObj = (): Expression => {
      return inStep
        ? new ThisExpression(range)
        : ident("state", range);
    };
    let fieldAccess = (field: string): Expression => {
      return new PropertyAccessExpression(stateObj(), ident(field, range), range);
    };
    stmts.push(exprStmt(assignExpr(
      fieldAccess("state"),
      finalState < 0
        ? new UnaryPrefixExpression(Token.Minus, intLit(-finalState, range), range)
        : intLit(finalState, range),
      range
    )));
    for (let i = 0, k = this.slots.length; i < k; ++i) {
      stmts.push(exprStmt(callExpr(
        ident(SPILL_RELEASE, range),
        [ fieldAccess(this.slots[i].slotField) ],
        range
      )));
    }
    stmts.push(exprStmt(callExpr(
      new PropertyAccessExpression(ident(this.rootsName, range), ident("splice", range), range),
      [
        callExpr(
          new PropertyAccessExpression(ident(this.rootsName, range), ident("indexOf", range), range),
          [ stateObj() ],
          range
        ),
        intLit(1, range)
      ],
      range
    )));
    return stmts;
  }

  // === Code generation ==========================================================================

  private generate(): bool {
    if (this.hasNameCollision(this.stateClassName)) return false;
    if (this.hasNameCollision(this.rootsName)) return false;
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      if (this.hasNameCollision(this.resumeName(i))) return false;
      if (this.hasNameCollision(this.rejectName(i))) return false;
    }
    if (this.hasNameCollision(this.resultName())) return false;
    if (this.hasNameCollision(this.errorName())) return false;
    if (this.hasNameCollision(this.statusName())) return false;
    if (this.slots.length > 0) {
      if (!this.ensureSpillPool()) return false;
    }
    let declarations = new Array<Statement>();
    let stateClass = this.buildStateClass();
    if (!stateClass) return false;
    declarations.push(stateClass);
    declarations.push(this.buildRootsGlobal());
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      declarations.push(this.buildResume(i));
      declarations.push(this.buildReject(i));
    }
    declarations.push(this.buildResult());
    declarations.push(this.buildError());
    declarations.push(this.buildStatus());
    let statements = this.parentStatements();
    for (let i = 0, k = declarations.length; i < k; ++i) {
      statements.push(declarations[i]);
    }
    for (let i = 0, k = declarations.length; i < k; ++i) {
      if (!this.program.initializeGeneratedDeclaration(declarations[i], this.parent)) return false;
    }
    this.declaration.body = this.buildWrapperBody();
    return true;
  }

  private hasNameCollision(name: string): bool {
    if (this.parent.getMember(name)) {
      this.fail(`Generated name '${name}' collides with an existing declaration`, this.range);
      return true;
    }
    return false;
  }

  private parentStatements(): Statement[] {
    if (this.parent.kind == ElementKind.File) {
      return this.file.source.statements;
    }
    let namespace = <Namespace>this.parent;
    return (<NamespaceDeclaration>namespace.declaration).members;
  }

  private resumeName(site: i32): string {
    return `__async_${this.fileBase}_${this.fnName}_resume_${site}`;
  }

  private rejectName(site: i32): string {
    return `__async_${this.fileBase}_${this.fnName}_reject_${site}`;
  }

  private resultName(): string {
    return `__async_${this.fileBase}_${this.fnName}_result`;
  }

  private errorName(): string {
    return `__async_${this.fileBase}_${this.fnName}_error`;
  }

  private statusName(): string {
    return `__async_${this.fileBase}_${this.fnName}_status`;
  }

  private ensureSpillPool(): bool {
    let key = this.file.internalName;
    if (this.pools.has(key)) return true;
    this.pools.add(key);
    let range = this.range;
    let file = this.file;
    for (let i = 0; i < SPILL_POOL_SIZE; ++i) {
      if (file.getMember(`__async_spill_${i}`)) {
        this.fail(`Generated name '__async_spill_${i}' collides with an existing declaration`, range);
        return false;
      }
    }
    if (file.getMember("__async_spill_free")) {
      this.fail("Generated name '__async_spill_free' collides with an existing declaration", range);
      return false;
    }
    let spillNames = [ SPILL_ACQUIRE, SPILL_RELEASE, SPILL_GET, SPILL_SET ];
    for (let i = 0, k = spillNames.length; i < k; ++i) {
      if (file.getMember(spillNames[i])) {
        this.fail(`Generated name '${spillNames[i]}' collides with an existing declaration`, range);
        return false;
      }
    }
    let globals = new Array<VariableDeclaration>();
    for (let i = 0; i < SPILL_POOL_SIZE; ++i) {
      globals.push(new VariableDeclaration(
        ident(`__async_spill_${i}`, range), null, CommonFlags.None,
        namedType("externref", null, false, range),
        new NullExpression(range),
        range
      ));
    }
    let freeElements = new Array<Expression>();
    for (let i = SPILL_POOL_SIZE - 1; i >= 0; --i) {
      freeElements.push(intLit(i, range));
    }
    globals.push(new VariableDeclaration(
      ident("__async_spill_free", range), null, CommonFlags.None,
      namedType("Array", [ namedType("i32", null, false, range) ], false, range),
      new ArrayLiteralExpression(freeElements, range),
      range
    ));
    let poolStatements = new Array<Statement>();
    poolStatements.push(new VariableStatement(null, globals, range));
    poolStatements.push(this.buildSpillAcquire());
    poolStatements.push(this.buildSpillRelease());
    poolStatements.push(this.buildSpillGet());
    poolStatements.push(this.buildSpillSet());
    let statements = file.source.statements;
    for (let i = 0, k = poolStatements.length; i < k; ++i) {
      statements.push(poolStatements[i]);
    }
    for (let i = 0, k = poolStatements.length; i < k; ++i) {
      if (!this.program.initializeGeneratedDeclaration(poolStatements[i], file)) return false;
    }
    return true;
  }

  private buildSpillAcquire(): FunctionDeclaration {
    let range = this.range;
    let free = ident("__async_spill_free", range);
    let signature = new FunctionTypeNode(
      [],
      namedType("i32", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(new IfStatement(
      new BinaryExpression(
        Token.Equals_Equals,
        new PropertyAccessExpression(ident("__async_spill_free", range), ident("length", range), range),
        intLit(0, range),
        range
      ),
      blockStmt([
        new ReturnStatement(
          new UnaryPrefixExpression(Token.Minus, intLit(1, range), range),
          range
        )
      ], range),
      null,
      range
    ));
    body.push(new ReturnStatement(
      callExpr(
        new PropertyAccessExpression(ident("__async_spill_free", range), ident("pop", range), range),
        [],
        range
      ),
      range
    ));
    return new FunctionDeclaration(
      ident(SPILL_ACQUIRE, range), null, CommonFlags.None,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private buildSpillRelease(): FunctionDeclaration {
    let range = this.range;
    let signature = new FunctionTypeNode(
      [ new ParameterNode(ParameterKind.Default, ident("slot", range), namedType("i32", null, false, range), null, range) ],
      namedType("void", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(exprStmt(callExpr(
      new PropertyAccessExpression(ident("__async_spill_free", range), ident("push", range), range),
      [ ident("slot", range) ],
      range
    )));
    return new FunctionDeclaration(
      ident(SPILL_RELEASE, range), null, CommonFlags.None,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private buildSpillGet(): FunctionDeclaration {
    let range = this.range;
    let signature = new FunctionTypeNode(
      [ new ParameterNode(ParameterKind.Default, ident("slot", range), namedType("i32", null, false, range), null, range) ],
      namedType("externref", null, false, range),
      null,
      false,
      range
    );
    let cases = new Array<SwitchCase>();
    for (let i = 0; i < SPILL_POOL_SIZE; ++i) {
      cases.push(new SwitchCase(
        intLit(i, range),
        [ new ReturnStatement(ident(`__async_spill_${i}`, range), range) ],
        range
      ));
    }
    cases.push(new SwitchCase(
      null,
      [ new ReturnStatement(new NullExpression(range), range) ],
      range
    ));
    let body = new Array<Statement>();
    body.push(new SwitchStatement(ident("slot", range), cases, range));
    return new FunctionDeclaration(
      ident(SPILL_GET, range), null, CommonFlags.None,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private buildSpillSet(): FunctionDeclaration {
    let range = this.range;
    let signature = new FunctionTypeNode(
      [
        new ParameterNode(ParameterKind.Default, ident("slot", range), namedType("i32", null, false, range), null, range),
        new ParameterNode(ParameterKind.Default, ident("value", range), namedType("externref", null, false, range), null, range)
      ],
      namedType("void", null, false, range),
      null,
      false,
      range
    );
    let cases = new Array<SwitchCase>();
    for (let i = 0; i < SPILL_POOL_SIZE; ++i) {
      cases.push(new SwitchCase(
        intLit(i, range),
        [
          exprStmt(assignExpr(ident(`__async_spill_${i}`, range), ident("value", range), range)),
          new BreakStatement(null, range)
        ],
        range
      ));
    }
    cases.push(new SwitchCase(
      null,
      [ new BreakStatement(null, range) ],
      range
    ));
    let body = new Array<Statement>();
    body.push(new SwitchStatement(ident("slot", range), cases, range));
    return new FunctionDeclaration(
      ident(SPILL_SET, range), null, CommonFlags.None,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private buildStateClass(): ClassDeclaration | null {
    let range = this.range;
    let members = new Array<Statement>();
    members.push(new FieldDeclaration(
      ident("state", range), null, CommonFlags.None,
      namedType("i32", null, false, range),
      intLit(0, range), -1, range
    ));
    if (this.returnType.kind != TypeKind.Void && this.returnType.kind != TypeKind.Extern) {
      let zero = zeroValue(this.returnType, assert(this.returnTypeNode), range);
      if (!zero) return null;
      members.push(new FieldDeclaration(
        ident("__result", range), null, CommonFlags.None,
        assert(this.returnTypeNode),
        zero, -1, range
      ));
    }
    members.push(new FieldDeclaration(
      ident("__error", range), null, CommonFlags.None,
      namedType("string", null, false, range),
      strLit("", range), -1, range
    ));
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      let site = this.sites[i];
      if (!site.used || site.type.kind == TypeKind.Extern) continue;
      let zero = zeroValue(site.type, site.typeNode, range);
      if (!zero) return null;
      members.push(new FieldDeclaration(
        ident(`__pend${site.id}`, range), null, CommonFlags.None,
        site.typeNode,
        zero, -1, range
      ));
    }
    for (let i = 0, k = this.fields.length; i < k; ++i) {
      let field = this.fields[i];
      let zero = zeroValue(field.type, field.typeNode, range);
      if (!zero) return null;
      members.push(new FieldDeclaration(
        ident(field.name, range), null, CommonFlags.None,
        field.typeNode,
        zero, -1, range
      ));
    }
    for (let i = 0, k = this.slots.length; i < k; ++i) {
      members.push(new FieldDeclaration(
        ident(this.slots[i].slotField, range), null, CommonFlags.None,
        namedType("i32", null, false, range),
        new UnaryPrefixExpression(Token.Minus, intLit(1, range), range), -1, range
      ));
    }
    members.push(this.buildStepMethod());
    return new ClassDeclaration(
      ident(this.stateClassName, range), null, CommonFlags.None,
      null, null, null, members, range
    );
  }

  private buildStepMethod(): MethodDeclaration {
    let range = this.range;
    let cases = new Array<SwitchCase>();
    // Entry: state 0 means not started, dispatch to the first segment.
    cases.push(new SwitchCase(
      intLit(0, range),
      [
        exprStmt(assignExpr(this.stateAccess(range), this.segState(0, range), range)),
        new BreakStatement(null, range)
      ],
      range
    ));
    // Resume: state `site + 1` means suspended at that site; dispatch to
    // the segment following the suspending call.
    let afterSegment = new Array<i32>(this.sites.length);
    for (let i = 0, k = this.segments.length; i < k; ++i) {
      let end = this.segments[i].end;
      if (end && end.kind == "suspend") {
        afterSegment[end.site] = end.next;
      }
    }
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      cases.push(new SwitchCase(
        intLit(i + 1, range),
        [
          exprStmt(assignExpr(this.stateAccess(range), this.segState(afterSegment[i], range), range)),
          new BreakStatement(null, range)
        ],
        range
      ));
    }
    for (let i = 0, k = this.segments.length; i < k; ++i) {
      let segment = this.segments[i];
      let statements = segment.stmts.slice();
      let end = segment.end;
      assert(end != null);
      if (end!.kind == "jump") {
        statements.push(exprStmt(assignExpr(this.stateAccess(range), this.segState(end!.next, range), range)));
        statements.push(new BreakStatement(null, range));
      } else if (end!.kind == "redispatch") {
        statements.push(new BreakStatement(null, range));
      } else if (end!.kind == "suspend") {
        statements.push(exprStmt(assignExpr(this.stateAccess(range), intLit(end!.site + 1, range), range)));
        statements.push(new ReturnStatement(intLit(0, range), range));
      } else if (end!.kind == "terminal") {
        let terminalStmts = this.terminalStatements(true, range, -1);
        for (let j = 0, l = terminalStmts.length; j < l; ++j) {
          statements.push(terminalStmts[j]);
        }
        statements.push(new ReturnStatement(intLit(1, range), range));
      }
      cases.push(new SwitchCase(this.segState(segment.id, range), statements, range));
    }
    let defaultCase = new SwitchCase(
      null,
      [ new ReturnStatement(
        new TernaryExpression(
          new BinaryExpression(
            Token.Equals_Equals,
            this.stateAccess(range),
            new UnaryPrefixExpression(Token.Minus, intLit(1, range), range),
            range
          ),
          intLit(1, range),
          intLit(2, range),
          range
        ),
        range
      ) ],
      range
    );
    cases.push(defaultCase);
    let dispatch = new SwitchStatement(this.stateAccess(range), cases, range);
    let loop = new WhileStatement(
      new TrueExpression(range),
      blockStmt([ dispatch ], range),
      range
    );
    let signature = new FunctionTypeNode(
      [],
      namedType("i32", null, false, range),
      null,
      false,
      range
    );
    return new MethodDeclaration(
      ident("step", range), null, CommonFlags.Instance,
      null, signature, blockStmt([ loop ], range), range
    );
  }

  private buildRootsGlobal(): VariableStatement {
    let range = this.range;
    let stateType = namedType(this.stateClassName, null, false, range);
    return new VariableStatement(
      null,
      [ new VariableDeclaration(
        ident(this.rootsName, range), null, CommonFlags.None,
        namedType("Array", [ stateType ], false, range),
        new NewExpression(
          new TypeName(ident("Array", range), null, range),
          [ stateType ],
          [],
          range
        ),
        range
      ) ],
      range
    );
  }

  private buildResume(siteId: i32): FunctionDeclaration {
    let range = this.range;
    let site = this.sites[siteId];
    let stateParam = new ParameterNode(
      ParameterKind.Default,
      ident("state", range),
      namedType(this.stateClassName, null, false, range),
      null,
      range
    );
    let valueParam = new ParameterNode(
      ParameterKind.Default,
      ident("value", range),
      site.typeNode,
      null,
      range
    );
    let signature = new FunctionTypeNode(
      [ stateParam, valueParam ],
      namedType("i32", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    if (site.used) {
      if (site.type.kind == TypeKind.Extern) {
        body.push(exprStmt(callExpr(
          ident(SPILL_SET, range),
          [
            new PropertyAccessExpression(ident("state", range), ident(site.slotField, range), range),
            ident("value", range)
          ],
          range
        )));
      } else {
        body.push(exprStmt(assignExpr(
          new PropertyAccessExpression(ident("state", range), ident(`__pend${site.id}`, range), range),
          ident("value", range),
          range
        )));
      }
    }
    body.push(new ReturnStatement(
      callExpr(
        new PropertyAccessExpression(ident("state", range), ident("step", range), range),
        [],
        range
      ),
      range
    ));
    return new FunctionDeclaration(
      ident(this.resumeName(siteId), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private buildReject(siteId: i32): FunctionDeclaration {
    let range = this.range;
    let stateParam = new ParameterNode(
      ParameterKind.Default,
      ident("state", range),
      namedType(this.stateClassName, null, false, range),
      null,
      range
    );
    let messageParam = new ParameterNode(
      ParameterKind.Default,
      ident("message", range),
      namedType("string", null, false, range),
      null,
      range
    );
    let signature = new FunctionTypeNode(
      [ stateParam, messageParam ],
      namedType("i32", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(exprStmt(assignExpr(
      new PropertyAccessExpression(ident("state", range), ident("__error", range), range),
      ident("message", range),
      range
    )));
    let terminalStmts = this.terminalStatements(false, range, -2);
    for (let i = 0, k = terminalStmts.length; i < k; ++i) {
      body.push(terminalStmts[i]);
    }
    body.push(new ReturnStatement(intLit(2, range), range));
    return new FunctionDeclaration(
      ident(this.rejectName(siteId), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private buildResult(): FunctionDeclaration {
    let range = this.range;
    let stateParam = new ParameterNode(
      ParameterKind.Default,
      ident("state", range),
      namedType(this.stateClassName, null, false, range),
      null,
      range
    );
    let returnTypeNode: TypeNode;
    if (this.returnType.kind == TypeKind.Void) {
      returnTypeNode = namedType("void", null, false, range);
    } else {
      returnTypeNode = assert(this.returnTypeNode);
    }
    let signature = new FunctionTypeNode(
      [ stateParam ],
      returnTypeNode,
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    if (this.returnType.kind == TypeKind.Void) {
      body.push(new ReturnStatement(null, range));
    } else if (this.returnType.kind == TypeKind.Extern) {
      body.push(new ReturnStatement(
        callExpr(
          ident(SPILL_GET, range),
          [ new PropertyAccessExpression(ident("state", range), ident("__slot_result", range), range) ],
          range
        ),
        range
      ));
    } else {
      body.push(new ReturnStatement(
        new PropertyAccessExpression(ident("state", range), ident("__result", range), range),
        range
      ));
    }
    return new FunctionDeclaration(
      ident(this.resultName(), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private buildError(): FunctionDeclaration {
    let range = this.range;
    let stateParam = new ParameterNode(
      ParameterKind.Default,
      ident("state", range),
      namedType(this.stateClassName, null, false, range),
      null,
      range
    );
    let signature = new FunctionTypeNode(
      [ stateParam ],
      namedType("string", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(new ReturnStatement(
      new PropertyAccessExpression(ident("state", range), ident("__error", range), range),
      range
    ));
    return new FunctionDeclaration(
      ident(this.errorName(), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private buildStatus(): FunctionDeclaration {
    let range = this.range;
    let stateParam = new ParameterNode(
      ParameterKind.Default,
      ident("state", range),
      namedType(this.stateClassName, null, false, range),
      null,
      range
    );
    let signature = new FunctionTypeNode(
      [ stateParam ],
      namedType("i32", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(new ReturnStatement(
      new PropertyAccessExpression(ident("state", range), ident("state", range), range),
      range
    ));
    return new FunctionDeclaration(
      ident(this.statusName(), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private buildWrapperBody(): BlockStatement {
    let range = this.range;
    let body = new Array<Statement>();
    for (let i = 0, k = this.slots.length; i < k; ++i) {
      let temp = `__s${i}`;
      body.push(new VariableStatement(
        null,
        [ new VariableDeclaration(
          ident(temp, range), null, CommonFlags.Let,
          namedType("i32", null, false, range),
          callExpr(ident(SPILL_ACQUIRE, range), [], range),
          range
        ) ],
        range
      ));
      let rollback = new Array<Statement>();
      for (let j = 0; j < i; ++j) {
        rollback.push(exprStmt(callExpr(ident(SPILL_RELEASE, range), [ ident(`__s${j}`, range) ], range)));
      }
      rollback.push(new ReturnStatement(
        new CallExpression(
          ident("changetype", range),
          [ this.prototype.functionTypeNode.returnType ],
          [ intLit(0, range) ],
          range
        ),
        range
      ));
      body.push(new IfStatement(
        new BinaryExpression(Token.LessThan, ident(temp, range), intLit(0, range), range),
        blockStmt(rollback, range),
        null,
        range
      ));
    }
    body.push(new VariableStatement(
      null,
      [ new VariableDeclaration(
        ident("__st", range), null, CommonFlags.Let,
        namedType(this.stateClassName, null, false, range),
        new NewExpression(
          new TypeName(ident(this.stateClassName, range), null, range),
          null,
          [],
          range
        ),
        range
      ) ],
      range
    ));
    for (let i = 0, k = this.slots.length; i < k; ++i) {
      let slot = this.slots[i];
      let temp = `__s${i}`;
      if (slot.kind == "param") {
        body.push(exprStmt(callExpr(
          ident(SPILL_SET, range),
          [ ident(temp, range), ident(slot.name, range) ],
          range
        )));
      }
      body.push(exprStmt(assignExpr(
        new PropertyAccessExpression(ident("__st", range), ident(slot.slotField, range), range),
        ident(temp, range),
        range
      )));
    }
    let parameters = this.prototype.functionTypeNode.parameters;
    for (let i = 0, k = parameters.length; i < k; ++i) {
      let parameter = parameters[i];
      let name = parameter.name.text;
      let binding = this.scope.lookup(name);
      assert(binding != null);
      if (binding!.spilled) continue;
      body.push(exprStmt(assignExpr(
        new PropertyAccessExpression(ident("__st", range), ident(binding!.field, range), range),
        ident(name, range),
        range
      )));
    }
    body.push(exprStmt(callExpr(
      new PropertyAccessExpression(ident(this.rootsName, range), ident("push", range), range),
      [ ident("__st", range) ],
      range
    )));
    body.push(exprStmt(callExpr(
      new PropertyAccessExpression(ident("__st", range), ident("step", range), range),
      [],
      range
    )));
    body.push(new ReturnStatement(
      new CallExpression(
        ident("changetype", range),
        [ this.prototype.functionTypeNode.returnType ],
        [ ident("__st", range) ],
        range
      ),
      range
    ));
    return blockStmt(body, range);
  }
}

/** Turns a statement that may be a single statement into a statement list. */
function asStatements(stmt: Statement): Statement[] {
  if (stmt.kind == NodeKind.Block) return (<BlockStatement>stmt).statements;
  return [ stmt ];
}

/** Unwraps parenthesized expressions. */
function unwrapParens(expr: Expression): Expression {
  while (expr.kind == NodeKind.Parenthesized) {
    expr = (<ParenthesizedExpression>expr).expression;
  }
  return expr;
}

/** Sanitizes a file path for use in generated identifiers. */
function sanitizeName(name: string): string {
  let out = "";
  for (let i = 0, k = name.length; i < k; ++i) {
    let code = name.charCodeAt(i);
    let ok = (code >= 48 && code <= 57)
      || (code >= 65 && code <= 90)
      || (code >= 97 && code <= 122)
      || code == 95 || code == 36;
    out += ok ? name.charAt(i) : "_";
  }
  return out;
}

