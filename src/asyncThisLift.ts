/**
 * @fileoverview `this`/`super` pre-pass for the CPS state-machine
 * transform (Phase 1, chunk 3). Runs before the core's rewrite consumes
 * an async body. In async methods, `this` is rewritten to the
 * `__async_this` identifier, which the core lifts as an ordinary local
 * holding the receiver; `super` is rejected loudly, as is `this` where
 * there is no receiver to lift (top-level and static async functions).
 * @license Apache-2.0
 */

import {
  NodeKind,
  Statement,
  Expression,
  TypeNode,
  NamedTypeNode,
  TypeName,
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
  StringLiteralExpression,
  SuperExpression,
  AwaitExpression,
  FunctionExpression,
  FunctionDeclaration,
  MethodDeclaration,
  ClassDeclaration,
  FunctionTypeNode,
  ParameterNode,
  ParameterKind,
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
  ThrowStatement
} from "./ast";

import {
  DiagnosticCode,
  Range
} from "./diagnostics";

import {
  Token
} from "./tokenizer";

import {
  CommonFlags
} from "./common";

import {
  Program,
  FunctionPrototype,
  ClassPrototype,
  PropertyPrototype,
  ElementKind
} from "./program";

import {
  ASYNC_THIS_NAME,
  AsyncFail,
  ident,
  intLit,
  namedType,
  blockStmt,
  callExpr,
  copyFunctionSignature,
  unwrapParens
} from "./asyncRewrite";

/** Rewrites `this`/`super` in one async body. Returns `false` when a
 *  failure was reported through `fail`. `allowReceiverParam` permits a
 *  leading `__async_this` parameter: the generated receiver parameter of
 *  an extracted async arrow, whose body was already lifted. `superPrepass`
 *  carries the base type and the helper methods the pre-pass registered
 *  for this method's `super` accesses; `null` when the body has none
 *  (any `super` node then fails loudly, as before). */
export function liftThisInAsyncBody(
  program: Program,
  prototype: FunctionPrototype,
  fail: AsyncFail,
  allowReceiverParam: bool = false,
  superPrepass: SuperPrepass | null = null
): bool {
  let declaration = prototype.declaration;
  let isMethod = declaration.kind == NodeKind.MethodDeclaration;
  let isStatic = isMethod && !prototype.is(CommonFlags.Instance);
  let hasReceiver = isMethod && !isStatic;
  let parameters = prototype.functionTypeNode.parameters;
  for (let i = 0, k = parameters.length; i < k; ++i) {
    if (parameters[i].name.text == ASYNC_THIS_NAME) {
      if (allowReceiverParam && i == 0) continue;
      fail(`'${ASYNC_THIS_NAME}' is reserved for the CPS transform and cannot be a parameter name`, parameters[i].name.range);
      return false;
    }
  }
  let bodyNode = prototype.bodyNode;
  if (!bodyNode) return true;
  if (isStatic) {
    // In a static method `this` is the class itself, so it rewrites to
    // the class-name identifier, exactly as the user would write it.
    // A local binding of the class name would shadow that identifier,
    // so the rewrite fails loudly instead of miscompiling. The scan is
    // deliberately conservative: a binding anywhere in the body,
    // including inside a nested function where it would not actually
    // shadow an outer use, still fails — renaming the local fixes it.
    let className = (<ClassPrototype>prototype.parent).name;
    let collector = new ThisWalker(program, noopFail, false, true, className, true);
    for (let i = 0, k = parameters.length; i < k; ++i) {
      collector.declared.add(parameters[i].name.text);
    }
    collector.walkStatement(bodyNode);
    if (collector.sawThis && collector.declared.has(className)) {
      fail(`'this' in static async method '${prototype.name}' cannot be rewritten because '${className}' is shadowed by a local of the same name; rename the local`, prototype.identifierNode.range);
      return false;
    }
  }
  let walker = new ThisWalker(program, fail, hasReceiver, isStatic, isStatic ? (<ClassPrototype>prototype.parent).name : null, false, superPrepass);
  return walker.walkStatement(bodyNode);
}

function noopFail(_message: string, _range: Range): void {}

/** How one `super` member is reached from the rewritten body: plain
 *  fields need no helper (a base-typed `changetype` is exact for them),
 *  methods and accessors go through a generated helper method on the
 *  derived class, where a real `super` access compiles with base
 *  semantics. A `changetype` rewrite would be wrong for them: the
 *  compiler routes the call through the override stub, which dispatches
 *  on the runtime type to the most-derived override. */
export interface SuperMemberInfo {
  kind: "method" | "accessor";
  /** Helper for a method call, or "" when unused. */
  call: string;
  /** Helper for an accessor read, or "" when unused. */
  get: string;
  /** Helper for an accessor write, or "" when unused. */
  set: string;
}

/** Outcome of the `super` pre-pass for one async method. */
export interface SuperPrepass {
  /** Base type node (a copy of the class declaration's `extendsType`)
   *  for the `changetype` rewrite of plain-field accesses. */
  baseType: NamedTypeNode;
  /** Member name to helper methods, for methods and accessors only. */
  members: Map<string, SuperMemberInfo>;
}

/** One `super` access found by the pre-pass scan. */
interface SuperAccess {
  name: string;
  kind: "call" | "get" | "set" | "setNested" | "bare" | "element";
  /** Whether the call carries explicit type arguments. */
  hasTypeArgs: bool;
  range: Range;
}

interface SuperMember {
  kind: "field" | "method" | "accessor";
  element: FunctionPrototype | PropertyPrototype;
  declaring: ClassPrototype;
}

/** Scans async functions and methods for `super` accesses and registers
 *  helper methods for the ones a `changetype` rewrite cannot serve.
 *  Must run before any worklist `resolveClass`: helpers are registered on
 *  the class prototype, and a resolved class instance never picks up
 *  members added afterwards. Returns the per-prototype pre-pass data and
 *  the prototypes the pre-pass rejected (already reported); the caller
 *  must add the bound prototype of each rejected method to
 *  `rejectedAsyncFunctions` so the compiler guard skips it silently. */
/** Scans async functions and methods for `super` accesses and registers
 *  helper methods for the ones a `changetype` rewrite cannot serve.
 *  Must run before any worklist `resolveClass`: helpers are registered on
 *  the class prototype, and a resolved class instance never picks up
 *  members added afterwards. Helpers are shared per class, not per
 *  method: an extracted arrow inside a method reaches the same helpers
 *  through its receiver class. Returns the per-class pre-pass data and
 *  the prototypes the pre-pass rejected (already reported); the caller
 *  must add the bound prototype of each rejected method to
 *  `rejectedAsyncFunctions` so the compiler guard skips it silently. */
export function prepareSuperHelpers(
  program: Program,
  prototypes: FunctionPrototype[]
): { helpers: Map<ClassPrototype, SuperPrepass>, failed: Set<FunctionPrototype> } {
  let failed = new Set<FunctionPrototype>();
  let helpers = new Map<ClassPrototype, SuperPrepass>();
  let registered = new Map<string, string>();
  for (let i = 0, k = prototypes.length; i < k; ++i) {
    let prototype = prototypes[i];
    if (program.rejectedAsyncFunctions.has(prototype)) continue;
    let declaration = prototype.declaration;
    let bodyNode = prototype.bodyNode;
    if (!bodyNode) continue;
    let accesses = collectSuperAccesses(bodyNode);
    if (accesses.length == 0) continue;
    let fail = (message: string, range: Range): void => {
      program.error(DiagnosticCode.Not_implemented_0, range, message);
      failed.add(prototype);
    };
    if (declaration.kind != NodeKind.MethodDeclaration) {
      fail("'super' in async functions is not yet supported", accesses[0].range);
      continue;
    }
    if (!prototype.is(CommonFlags.Instance)) continue;
    let receiverClass = <ClassPrototype>prototype.parent;
    if (receiverClass.typeParameterNodes && receiverClass.typeParameterNodes.length > 0) continue;
    if (receiverClass.parent.kind == ElementKind.Namespace) continue;
    let basePrototype = receiverClass.basePrototype;
    if (!basePrototype) {
      fail("'super' can only be referenced in a derived class", accesses[0].range);
      continue;
    }
    let classDeclaration = <ClassDeclaration>receiverClass.declaration;
    let extendsType = classDeclaration.extendsType;
    if (!extendsType) {
      fail("'super' can only be referenced in a derived class", accesses[0].range);
      continue;
    }
    let prepass = helpers.get(receiverClass);
    if (!prepass) {
      prepass = {
        baseType: copyNamedType(extendsType),
        members: new Map<string, SuperMemberInfo>()
      };
      helpers.set(receiverClass, prepass);
    }
    let members = prepass.members;
    for (let j = 0, l = accesses.length; j < l; ++j) {
      let access = accesses[j];
      if (failed.has(prototype)) break;
      if (access.kind == "bare") {
        fail("'super' calls are only permitted in constructors", access.range);
        break;
      }
      if (access.kind == "element") {
        fail("'super' element access with a non-literal index is not yet supported", access.range);
        break;
      }
      if (access.kind == "setNested") {
        fail("'super' property assignment is only supported as a full expression statement", access.range);
        break;
      }
      let member = lookupSuperMember(basePrototype, access.name);
      if (!member) {
        fail(`'super' member '${access.name}' could not be resolved in the base class`, access.range);
        break;
      }
      let declaring = member.declaring;
      let declaringDeclaration = <ClassDeclaration>declaring.declaration;
      if (declaringDeclaration.range.source != classDeclaration.range.source) {
        fail("'super' to a member of a base class in another file is not yet supported", access.range);
        break;
      }
      if (declaring.typeParameterNodes && declaring.typeParameterNodes.length > 0) {
        fail("'super' to a member of a generic base class is not yet supported", access.range);
        break;
      }
      if (member.kind == "field") continue;
      if (member.kind == "method") {
        let methodPrototype = <FunctionPrototype>member.element;
        if (methodPrototype.typeParameterNodes && methodPrototype.typeParameterNodes.length > 0) {
          fail("'super' to a generic base method is not yet supported", access.range);
          break;
        }
        if (countMethodDeclarations(declaringDeclaration, access.name) > 1) {
          fail("'super' to an overloaded base method is not yet supported", access.range);
          break;
        }
        if (access.kind == "get") {
          fail("'super' methods cannot be used as values", access.range);
          break;
        }
        if (access.kind == "set") {
          fail("cannot assign to a 'super' method", access.range);
          break;
        }
        if (access.hasTypeArgs) {
          fail("'super' to a generic base method is not yet supported", access.range);
          break;
        }
        let info = members.get(access.name);
        if (!info) {
          info = { kind: "method", call: "", get: "", set: "" };
          members.set(access.name, info);
        }
        if (!info.call) {
          let signature = copyFunctionSignature(methodPrototype.functionTypeNode, access.range);
          let helperName = registerSuperHelper(program, receiverClass, receiverClass.name, access.name, "call", registered, signature, superCallBody(methodPrototype, signature, access.range), access.range, fail);
          if (!helperName) break;
          info.call = helperName;
        }
        continue;
      }
      let property = <PropertyPrototype>member.element;
      let info = members.get(access.name);
      if (!info) {
        info = { kind: "accessor", call: "", get: "", set: "" };
        members.set(access.name, info);
      }
      if (access.kind == "call" || access.kind == "get") {
        let getter = property.getterPrototype;
        if (!getter) {
          fail(`'super' member '${access.name}' has no getter`, access.range);
          break;
        }
        if (!info.get) {
          let signature = new FunctionTypeNode(
            [],
            getter.functionTypeNode.returnType,
            null,
            false,
            access.range
          );
          let helperName = registerSuperHelper(program, receiverClass, receiverClass.name, access.name, "get", registered, signature, superGetBody(access.name, access.range), access.range, fail);
          if (!helperName) break;
          info.get = helperName;
        }
        continue;
      }
      let setter = property.setterPrototype;
      if (!setter) {
        fail(`'super' member '${access.name}' has no setter`, access.range);
        break;
      }
      if (!info.set) {
        let setterParams = setter.functionTypeNode.parameters;
        let valueType = setterParams.length > 0 ? setterParams[0].type : null;
        if (!valueType) {
          fail(`'super' member '${access.name}' has no setter`, access.range);
          break;
        }
        let signature = new FunctionTypeNode(
          [ new ParameterNode(ParameterKind.Default, ident("value", access.range), valueType, null, access.range) ],
          namedType("void", null, false, access.range),
          null,
          false,
          access.range
        );
        let helperName = registerSuperHelper(program, receiverClass, receiverClass.name, access.name, "set", registered, signature, superSetBody(access.name, access.range), access.range, fail);
        if (!helperName) break;
        info.set = helperName;
      }
    }
  }
  return { helpers, failed };
}

function lookupSuperMember(base: ClassPrototype, name: string): SuperMember | null {
  let current: ClassPrototype | null = base;
  while (current) {
    let instanceMembers = current.instanceMembers;
    if (instanceMembers) {
      let member = instanceMembers.get(name);
      if (member) {
        if (member.kind == ElementKind.FunctionPrototype) {
          return { kind: "method", element: <FunctionPrototype>member, declaring: current };
        }
        if (member.kind == ElementKind.PropertyPrototype) {
          let property = <PropertyPrototype>member;
          if (property.fieldDeclaration) {
            return { kind: "field", element: property, declaring: current };
          }
          return { kind: "accessor", element: property, declaring: current };
        }
        return null;
      }
    }
    current = current.basePrototype;
  }
  return null;
}

function countMethodDeclarations(declaration: ClassDeclaration, name: string): i32 {
  let count = 0;
  let members = declaration.members;
  for (let i = 0, k = members.length; i < k; ++i) {
    let member = members[i];
    if (member.kind == NodeKind.MethodDeclaration && (<MethodDeclaration>member).name.text == name) ++count;
  }
  return count;
}

function registerSuperHelper(
  program: Program,
  receiverClass: ClassPrototype,
  qualName: string,
  memberName: string,
  kind: string,
  registered: Map<string, string>,
  signature: FunctionTypeNode,
  body: Statement,
  range: Range,
  fail: AsyncFail
): string {
  let baseName = `__async_super_${qualName}_${memberName}_${kind}`;
  // Already registered by this pre-pass for another method of the same
  // class: the helper body is `return super.<member>(...)` on the same
  // class, so it is identical — reuse it instead of registering a
  // duplicate.
  let existing = registered.get(baseName);
  if (existing) return existing;
  let helperName = baseName;
  let instanceMembers = receiverClass.instanceMembers;
  let suffix = 0;
  while (instanceMembers && instanceMembers.has(helperName)) {
    ++suffix;
    helperName = `${baseName}_${suffix}`;
  }
  let helper = new MethodDeclaration(
    ident(helperName, range),
    null,
    CommonFlags.Instance,
    null,
    signature,
    body,
    range
  );
  if (!program.initializeGeneratedMethod(helper, receiverClass)) {
    fail(`Could not register generated method '${helperName}'`, range);
    return "";
  }
  registered.set(baseName, helperName);
  return helperName;
}

function superCallBody(prototype: FunctionPrototype, signature: FunctionTypeNode, range: Range): Statement {
  let args = new Array<Expression>();
  let parameters = signature.parameters;
  for (let i = 0, k = parameters.length; i < k; ++i) {
    args.push(ident(parameters[i].name.text, parameters[i].name.range));
  }
  return blockStmt([
    new ReturnStatement(
      new CallExpression(
        new PropertyAccessExpression(
          new SuperExpression(range),
          ident(prototype.name, range),
          range
        ),
        null,
        args,
        range
      ),
      range
    )
  ], range);
}

function superGetBody(memberName: string, range: Range): Statement {
  return blockStmt([
    new ReturnStatement(
      new PropertyAccessExpression(
        new SuperExpression(range),
        ident(memberName, range),
        range
      ),
      range
    )
  ], range);
}

function superSetBody(memberName: string, range: Range): Statement {
  return blockStmt([
    new ExpressionStatement(
      new BinaryExpression(
        Token.Equals,
        new PropertyAccessExpression(
          new SuperExpression(range),
          ident(memberName, range),
          range
        ),
        ident("value", range),
        range
      )
    )
  ], range);
}

/** Deep-copies a named type node (name chain + type arguments). */
function copyNamedType(node: NamedTypeNode): NamedTypeNode {
  let typeArguments: TypeNode[] | null = null;
  if (node.typeArguments) {
    let args = node.typeArguments;
    typeArguments = new Array<TypeNode>(args.length);
    for (let i = 0, k = args.length; i < k; ++i) {
      let arg = args[i];
      typeArguments[i] = arg.kind == NodeKind.NamedType
        ? copyNamedType(<NamedTypeNode>arg)
        : arg;
    }
  }
  return new NamedTypeNode(
    copyTypeName(node.name),
    typeArguments,
    node.isNullable,
    node.range
  );
}

function copyTypeName(name: TypeName): TypeName {
  let next: TypeName | null = null;
  if (name.next) next = copyTypeName(name.next);
  return new TypeName(ident(name.identifier.text, name.identifier.range), next, name.range);
}

// === `super` access collection (pre-pass scan) ================================================

/** Whether the token is a compound assignment operator (`+=`, `-=`, ...). */
function isCompoundAssign(operator: Token): bool {
  switch (operator) {
    case Token.Plus_Equals:
    case Token.Minus_Equals:
    case Token.Asterisk_Equals:
    case Token.Asterisk_Asterisk_Equals:
    case Token.Slash_Equals:
    case Token.Percent_Equals:
    case Token.LessThan_LessThan_Equals:
    case Token.GreaterThan_GreaterThan_Equals:
    case Token.GreaterThan_GreaterThan_GreaterThan_Equals:
    case Token.Ampersand_Equals:
    case Token.Bar_Equals:
    case Token.Caret_Equals: return true;
    default: return false;
  }
}

/** Collects the `super` accesses in one async body, read-only, descending
 *  into nested functions (their accesses are rewritten by the same lift). */
function collectSuperAccesses(bodyNode: Statement): SuperAccess[] {
  let collector = new SuperCollector();
  collector.walkStatement(bodyNode);
  return collector.accesses;
}

class SuperCollector {
  accesses: SuperAccess[] = [];

  private record(name: string, kind: "call" | "get" | "set" | "setNested" | "bare" | "element", range: Range, hasTypeArgs: bool = false): void {
    this.accesses.push({ name, kind, hasTypeArgs, range });
  }

  /** The member name when the expression is a `super` property access
   *  (element access with a string literal counts), or "" otherwise. */
  private superPropertyName(node: Expression): string {
    if (node.kind == NodeKind.PropertyAccess) {
      let access = <PropertyAccessExpression>node;
      if (access.expression.kind == NodeKind.Super) return access.property.text;
      return "";
    }
    if (node.kind == NodeKind.ElementAccess) {
      let access = <ElementAccessExpression>node;
      if (access.expression.kind == NodeKind.Super && access.elementExpression instanceof StringLiteralExpression) {
        return (<StringLiteralExpression>access.elementExpression).value;
      }
      return "";
    }
    return "";
  }

  private isSuperElementAccess(node: Expression): bool {
    return node.kind == NodeKind.ElementAccess
      && (<ElementAccessExpression>node).expression.kind == NodeKind.Super
      && !((<ElementAccessExpression>node).elementExpression instanceof StringLiteralExpression);
  }

  walkStatement(node: Statement): void {
    switch (node.kind) {
      case NodeKind.Block: {
        let statements = (<BlockStatement>node).statements;
        for (let i = 0, k = statements.length; i < k; ++i) this.walkStatement(statements[i]);
        return;
      }
      case NodeKind.Variable: {
        let declarations = (<VariableStatement>node).declarations;
        for (let i = 0, k = declarations.length; i < k; ++i) {
          let initializer = declarations[i].initializer;
          if (initializer) this.walkExpression(initializer);
        }
        return;
      }
      case NodeKind.Expression: {
        let expr = unwrapParens((<ExpressionStatement>node).expression);
        if (expr.kind == NodeKind.Binary) {
          let binary = <BinaryExpression>expr;
          let name = this.superPropertyName(unwrapParens(binary.left));
          if (name != "") {
            if (binary.operator == Token.Equals) {
              this.record(name, "set", binary.range);
            } else if (isCompoundAssign(binary.operator)) {
              this.record(name, "get", binary.range);
              this.record(name, "set", binary.range);
            } else {
              this.record(name, "get", binary.range);
            }
            this.walkExpression(binary.right);
            return;
          }
        } else if (expr.kind == NodeKind.UnaryPrefix || expr.kind == NodeKind.UnaryPostfix) {
          let unary = expr.kind == NodeKind.UnaryPrefix
            ? <UnaryPrefixExpression>expr
            : <UnaryPostfixExpression>expr;
          let operator = unary.operator;
          if (operator == Token.Plus_Plus || operator == Token.Minus_Minus) {
            let name = this.superPropertyName(unwrapParens(unary.operand));
            if (name != "") {
              this.record(name, "get", unary.range);
              this.record(name, "set", unary.range);
              return;
            }
          }
        }
        this.walkExpression((<ExpressionStatement>node).expression);
        return;
      }
      case NodeKind.Return: {
        let stmt = <ReturnStatement>node;
        if (stmt.value) this.walkExpression(stmt.value);
        return;
      }
      case NodeKind.If: {
        let stmt = <IfStatement>node;
        this.walkExpression(stmt.condition);
        this.walkStatement(stmt.ifTrue);
        if (stmt.ifFalse) this.walkStatement(stmt.ifFalse);
        return;
      }
      case NodeKind.While: {
        let stmt = <WhileStatement>node;
        this.walkExpression(stmt.condition);
        this.walkStatement(stmt.body);
        return;
      }
      case NodeKind.Do: {
        let stmt = <DoStatement>node;
        this.walkStatement(stmt.body);
        this.walkExpression(stmt.condition);
        return;
      }
      case NodeKind.For: {
        let stmt = <ForStatement>node;
        if (stmt.initializer) this.walkStatement(stmt.initializer);
        if (stmt.condition) this.walkExpression(stmt.condition);
        if (stmt.incrementor) this.walkExpression(stmt.incrementor);
        this.walkStatement(stmt.body);
        return;
      }
      case NodeKind.ForOf: {
        let stmt = <ForOfStatement>node;
        this.walkStatement(stmt.variable);
        this.walkExpression(stmt.iterable);
        this.walkStatement(stmt.body);
        return;
      }
      case NodeKind.Switch: {
        let stmt = <SwitchStatement>node;
        this.walkExpression(stmt.condition);
        let cases = stmt.cases;
        for (let i = 0, k = cases.length; i < k; ++i) {
          let switchCase = cases[i];
          if (switchCase.label) this.walkExpression(switchCase.label);
          let statements = switchCase.statements;
          for (let j = 0, l = statements.length; j < l; ++j) this.walkStatement(statements[j]);
        }
        return;
      }
      case NodeKind.Try: {
        let stmt = <TryStatement>node;
        let bodyStatements = stmt.bodyStatements;
        for (let i = 0, k = bodyStatements.length; i < k; ++i) this.walkStatement(bodyStatements[i]);
        if (stmt.catchStatements) {
          let catchStatements = stmt.catchStatements;
          for (let i = 0, k = catchStatements.length; i < k; ++i) this.walkStatement(catchStatements[i]);
        }
        if (stmt.finallyStatements) {
          let finallyStatements = stmt.finallyStatements;
          for (let i = 0, k = finallyStatements.length; i < k; ++i) this.walkStatement(finallyStatements[i]);
        }
        return;
      }
      case NodeKind.Throw: {
        this.walkExpression((<ThrowStatement>node).value);
        return;
      }
      default: {
        return;
      }
    }
  }

  walkExpression(node: Expression): void {
    switch (node.kind) {
      case NodeKind.Super: {
        this.record("", "bare", node.range);
        return;
      }
      case NodeKind.PropertyAccess: {
        let access = <PropertyAccessExpression>node;
        if (access.expression.kind == NodeKind.Super) {
          this.record(access.property.text, "get", node.range);
          return;
        }
        this.walkExpression(access.expression);
        return;
      }
      case NodeKind.ElementAccess: {
        let access = <ElementAccessExpression>node;
        if (access.expression.kind == NodeKind.Super) {
          if (access.elementExpression instanceof StringLiteralExpression) {
            this.record((<StringLiteralExpression>access.elementExpression).value, "get", node.range);
          } else {
            this.record("", "element", node.range);
          }
          return;
        }
        this.walkExpression(access.expression);
        this.walkExpression(access.elementExpression);
        return;
      }
      case NodeKind.Call: {
        let call = <CallExpression>node;
        let callee = unwrapParens(call.expression);
        if (callee.kind == NodeKind.Super) {
          this.record("", "bare", node.range);
          return;
        }
        let name = this.superPropertyName(callee);
        if (name != "") {
          this.record(name, "call", node.range, !!(call.typeArguments && call.typeArguments.length > 0));
          let args = call.args;
          for (let i = 0, k = args.length; i < k; ++i) this.walkExpression(args[i]);
          return;
        }
        if (this.isSuperElementAccess(callee)) {
          this.record("", "element", node.range);
          return;
        }
        this.walkExpression(call.expression);
        let args = call.args;
        for (let i = 0, k = args.length; i < k; ++i) this.walkExpression(args[i]);
        return;
      }
      case NodeKind.New: {
        let expr = <NewExpression>node;
        let args = expr.args;
        for (let i = 0, k = args.length; i < k; ++i) this.walkExpression(args[i]);
        return;
      }
      case NodeKind.Binary: {
        let binary = <BinaryExpression>node;
        if (binary.operator == Token.Equals || isCompoundAssign(binary.operator)) {
          let name = this.superPropertyName(unwrapParens(binary.left));
          if (name != "") {
            this.record(name, "setNested", binary.range);
            this.walkExpression(binary.right);
            return;
          }
        }
        this.walkExpression(binary.left);
        this.walkExpression(binary.right);
        return;
      }
      case NodeKind.UnaryPrefix: {
        let unary = <UnaryPrefixExpression>node;
        let name = this.superPropertyName(unwrapParens(unary.operand));
        if (name != "") {
          if (unary.operator == Token.Plus_Plus || unary.operator == Token.Minus_Minus) {
            this.record(name, "setNested", unary.range);
          } else {
            this.record(name, "get", unary.range);
          }
          return;
        }
        this.walkExpression(unary.operand);
        return;
      }
      case NodeKind.UnaryPostfix: {
        let unary = <UnaryPostfixExpression>node;
        let name = this.superPropertyName(unwrapParens(unary.operand));
        if (name != "") {
          if (unary.operator == Token.Plus_Plus || unary.operator == Token.Minus_Minus) {
            this.record(name, "setNested", unary.range);
          } else {
            this.record(name, "get", unary.range);
          }
          return;
        }
        this.walkExpression(unary.operand);
        return;
      }
      case NodeKind.Ternary: {
        let ternary = <TernaryExpression>node;
        this.walkExpression(ternary.condition);
        this.walkExpression(ternary.ifThen);
        this.walkExpression(ternary.ifElse);
        return;
      }
      case NodeKind.Assertion: {
        this.walkExpression((<AssertionExpression>node).expression);
        return;
      }
      case NodeKind.Parenthesized: {
        this.walkExpression((<ParenthesizedExpression>node).expression);
        return;
      }
      case NodeKind.Comma: {
        let comma = <CommaExpression>node;
        let exprs = comma.expressions;
        for (let i = 0, k = exprs.length; i < k; ++i) this.walkExpression(exprs[i]);
        return;
      }
      case NodeKind.InstanceOf: {
        this.walkExpression((<InstanceOfExpression>node).expression);
        return;
      }
      case NodeKind.Await: {
        this.walkExpression((<AwaitExpression>node).operand);
        return;
      }
      case NodeKind.Function: {
        let declaration = (<FunctionExpression>node).declaration;
        if (declaration.body) this.walkStatement(declaration.body);
        return;
      }
      case NodeKind.Literal: {
        if (node instanceof TemplateLiteralExpression) {
          let literal = <TemplateLiteralExpression>node;
          if (literal.tag) this.walkExpression(literal.tag);
          let exprs = literal.expressions;
          for (let i = 0, k = exprs.length; i < k; ++i) this.walkExpression(exprs[i]);
        } else if (node instanceof ArrayLiteralExpression) {
          let elements = (<ArrayLiteralExpression>node).elementExpressions;
          for (let i = 0, k = elements.length; i < k; ++i) this.walkExpression(elements[i]);
        } else if (node instanceof ObjectLiteralExpression) {
          let values = (<ObjectLiteralExpression>node).values;
          for (let i = 0, k = values.length; i < k; ++i) this.walkExpression(values[i]);
        }
        return;
      }
      default: {
        return;
      }
    }
  }
}


class ThisWalker {
  /** Names bound anywhere in the body, collected when `collecting`. */
  declared = new Set<string>();
  /** Whether a `this` was seen, collected when `collecting`. */
  sawThis: bool = false;

  constructor(
    private program: Program,
    private fail: AsyncFail,
    private hasReceiver: bool,
    private isStatic: bool,
    /** Class name a static `this` rewrites to; `null` otherwise. */
    private className: string | null = null,
    /** When set, only record declarations and `this` uses; never fail
     *  or rewrite, so the pass cannot abort the collection early. */
    private collecting: bool = false,
    private superPrepass: SuperPrepass | null = null
  ) {}

  private failThis(range: Range): bool {
    this.fail("'this' in async functions is not yet supported", range);
    return false;
  }

  private failSuper(range: Range): bool {
    this.fail("'super' in async functions is not yet supported", range);
    return false;
  }

  /** The helper info for a `super` member, or `null` when the member is
   *  a plain field (no helper) or the pre-pass did not resolve it. */
  private superMember(name: string): SuperMemberInfo | null {
    let prepass = this.superPrepass;
    if (!prepass) return null;
    let info = prepass.members.get(name);
    return info ? info : null;
  }

  /** Whether the pre-pass resolved the `super` member (field, method or
   *  accessor). Anything the pre-pass did not see is a bare `super`. */
  private hasSuperPrepass(): bool {
    return this.superPrepass != null;
  }

  /** The base-typed receiver expression for a plain-field `super`
   *  access: `changetype<Base>(__async_this)`. */
  private superReceiver(range: Range): Expression | null {
    let prepass = this.superPrepass;
    if (!prepass || !this.hasReceiver) return null;
    return new CallExpression(
      ident("changetype", range),
      [ prepass.baseType ],
      [ ident(ASYNC_THIS_NAME, range) ],
      range
    );
  }

  /** A call to a `super` helper method on the receiver. */
  private superHelperCall(helper: string, args: Expression[], range: Range): Expression | null {
    if (!this.hasReceiver) return null;
    return callExpr(
      new PropertyAccessExpression(ident(ASYNC_THIS_NAME, range), ident(helper, range), range),
      args,
      range
    );
  }

  /** The member name when the expression is a `super` property access
   *  (element access with a string literal counts), or "" otherwise. */
  private superPropertyName(node: Expression): string {
    if (node.kind == NodeKind.PropertyAccess) {
      let access = <PropertyAccessExpression>node;
      if (access.expression.kind == NodeKind.Super) return access.property.text;
      return "";
    }
    if (node.kind == NodeKind.ElementAccess) {
      let access = <ElementAccessExpression>node;
      if (access.expression.kind == NodeKind.Super && access.elementExpression instanceof StringLiteralExpression) {
        return (<StringLiteralExpression>access.elementExpression).value;
      }
      return "";
    }
    return "";
  }

  private failSuperExpr(range: Range): Expression | null {
    this.failSuper(range);
    return null;
  }

  /** Maps a compound assignment operator to its plain operator, or
   *  `Token.Invalid` when the operator is not a compound assignment. */
  private compoundOperator(operator: Token): Token {
    switch (operator) {
      case Token.Plus_Equals: return Token.Plus;
      case Token.Minus_Equals: return Token.Minus;
      case Token.Asterisk_Equals: return Token.Asterisk;
      case Token.Asterisk_Asterisk_Equals: return Token.Asterisk_Asterisk;
      case Token.Slash_Equals: return Token.Slash;
      case Token.Percent_Equals: return Token.Percent;
      case Token.LessThan_LessThan_Equals: return Token.LessThan_LessThan;
      case Token.GreaterThan_GreaterThan_Equals: return Token.GreaterThan_GreaterThan;
      case Token.GreaterThan_GreaterThan_GreaterThan_Equals: return Token.GreaterThan_GreaterThan_GreaterThan;
      case Token.Ampersand_Equals: return Token.Ampersand;
      case Token.Bar_Equals: return Token.Bar;
      case Token.Caret_Equals: return Token.Caret;
      default: return Token.Invalid;
    }
  }

  /** Rewrites a whole expression statement, handling `super` accessor
   *  writes (which become helper calls and are only valid at statement
   *  level) before delegating to the generic expression walk. */
  private walkTopExpression(node: Expression): Expression | null {
    let expr = unwrapParens(node);
    if (expr.kind == NodeKind.Binary) {
      let binary = <BinaryExpression>expr;
      let name = this.superPropertyName(unwrapParens(binary.left));
      if (name != "") {
        if (!this.hasSuperPrepass()) return this.failSuperExpr(binary.range);
        let info = this.superMember(name);
        if (info) {
          if (info.kind == "method") {
            this.fail("cannot assign to a 'super' method", binary.range);
            return null;
          }
          if (binary.operator == Token.Equals) {
            let right = this.walkExpression(binary.right);
            if (!right) return null;
            let setter = this.superHelperCall(info.set, [ right ], binary.range);
            if (!setter) return this.failSuperExpr(binary.range);
            return setter;
          }
          let plain = this.compoundOperator(binary.operator);
          if (plain != Token.Invalid) {
            let right = this.walkExpression(binary.right);
            if (!right) return null;
            let getter = this.superHelperCall(info.get, [], binary.range);
            if (!getter) return this.failSuperExpr(binary.range);
            let setter = this.superHelperCall(info.set, [
              new BinaryExpression(plain, getter, right, binary.range)
            ], binary.range);
            if (!setter) return this.failSuperExpr(binary.range);
            return setter;
          }
        }
      }
    } else if (expr.kind == NodeKind.UnaryPrefix || expr.kind == NodeKind.UnaryPostfix) {
      let unary = expr.kind == NodeKind.UnaryPrefix
        ? <UnaryPrefixExpression>expr
        : <UnaryPostfixExpression>expr;
      if (unary.operator == Token.Plus_Plus || unary.operator == Token.Minus_Minus) {
        let name = this.superPropertyName(unwrapParens(unary.operand));
        if (name != "") {
          if (!this.hasSuperPrepass()) return this.failSuperExpr(unary.range);
          let info = this.superMember(name);
          if (info) {
            if (info.kind == "method") {
              this.fail("cannot assign to a 'super' method", unary.range);
              return null;
            }
            let getter = this.superHelperCall(info.get, [], unary.range);
            if (!getter) return this.failSuperExpr(unary.range);
            let one = intLit(1, unary.range);
            let updated = new BinaryExpression(
              unary.operator == Token.Plus_Plus ? Token.Plus : Token.Minus,
              getter,
              one,
              unary.range
            );
            let setter = this.superHelperCall(info.set, [ updated ], unary.range);
            if (!setter) return this.failSuperExpr(unary.range);
            return setter;
          }
        }
      }
    }
    return this.walkExpression(node);
  }

  walkStatement(node: Statement): bool {
    switch (node.kind) {
      case NodeKind.Block: {
        let statements = (<BlockStatement>node).statements;
        for (let i = 0, k = statements.length; i < k; ++i) {
          if (!this.walkStatement(statements[i])) return false;
        }
        return true;
      }
      case NodeKind.Variable: {
        let declarations = (<VariableStatement>node).declarations;
        for (let i = 0, k = declarations.length; i < k; ++i) {
          let declaration = declarations[i];
          if (this.collecting) this.declared.add(declaration.name.text);
          if (!this.collecting && declaration.name.text == ASYNC_THIS_NAME) {
            this.fail(`'${ASYNC_THIS_NAME}' is reserved for the CPS transform and cannot be declared in an async function`, declaration.name.range);
            return false;
          }
          if (declaration.initializer) {
            let initializer = this.walkExpression(declaration.initializer);
            if (!initializer) return false;
            declaration.initializer = initializer;
          }
        }
        return true;
      }
      case NodeKind.FunctionDeclaration: {
        if (!this.collecting) return true;
        let declaration = <FunctionDeclaration>node;
        let parameters = declaration.signature.parameters;
        for (let i = 0, k = parameters.length; i < k; ++i) {
          this.declared.add(parameters[i].name.text);
        }
        if (declaration.body) return this.walkStatement(declaration.body);
        return true;
      }
      case NodeKind.Expression: {
        let stmt = <ExpressionStatement>node;
        let expr = this.walkTopExpression(stmt.expression);
        if (!expr) return false;
        stmt.expression = expr;
        return true;
      }
      case NodeKind.Return: {
        let stmt = <ReturnStatement>node;
        if (stmt.value) {
          let value = this.walkExpression(stmt.value);
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
        if (stmt.initializer && !this.walkStatement(stmt.initializer)) return false;
        if (stmt.condition) {
          let condition = this.walkExpression(stmt.condition);
          if (!condition) return false;
          stmt.condition = condition;
        }
        if (stmt.incrementor) {
          let incrementor = this.walkExpression(stmt.incrementor);
          if (!incrementor) return false;
          stmt.incrementor = incrementor;
        }
        return this.walkStatement(stmt.body);
      }
      case NodeKind.ForOf: {
        let stmt = <ForOfStatement>node;
        if (!this.walkStatement(stmt.variable)) return false;
        let iterable = this.walkExpression(stmt.iterable);
        if (!iterable) return false;
        stmt.iterable = iterable;
        return this.walkStatement(stmt.body);
      }
      case NodeKind.Switch: {
        let stmt = <SwitchStatement>node;
        let condition = this.walkExpression(stmt.condition);
        if (!condition) return false;
        stmt.condition = condition;
        let cases = stmt.cases;
        for (let i = 0, k = cases.length; i < k; ++i) {
          let switchCase = cases[i];
          if (switchCase.label) {
            let label = this.walkExpression(switchCase.label);
            if (!label) return false;
            switchCase.label = label;
          }
          let statements = switchCase.statements;
          for (let j = 0, l = statements.length; j < l; ++j) {
            if (!this.walkStatement(statements[j])) return false;
          }
        }
        return true;
      }
      case NodeKind.Try: {
        let stmt = <TryStatement>node;
        let bodyStatements = stmt.bodyStatements;
        for (let i = 0, k = bodyStatements.length; i < k; ++i) {
          if (!this.walkStatement(bodyStatements[i])) return false;
        }
        if (stmt.catchVariable) {
          if (this.collecting) {
            this.declared.add(stmt.catchVariable.text);
          } else if (stmt.catchVariable.text == ASYNC_THIS_NAME) {
            this.fail(`'${ASYNC_THIS_NAME}' is reserved for the CPS transform and cannot be a catch variable`, stmt.catchVariable.range);
            return false;
          }
        }
        if (stmt.catchStatements) {
          let catchStatements = stmt.catchStatements;
          for (let i = 0, k = catchStatements.length; i < k; ++i) {
            if (!this.walkStatement(catchStatements[i])) return false;
          }
        }
        if (stmt.finallyStatements) {
          let finallyStatements = stmt.finallyStatements;
          for (let i = 0, k = finallyStatements.length; i < k; ++i) {
            if (!this.walkStatement(finallyStatements[i])) return false;
          }
        }
        return true;
      }
      case NodeKind.Throw: {
        let stmt = <ThrowStatement>node;
        let value = this.walkExpression(stmt.value);
        if (!value) return false;
        stmt.value = value;
        return true;
      }
      default: {
        return true;
      }
    }
  }

  walkExpression(node: Expression): Expression | null {
    switch (node.kind) {
      case NodeKind.This: {
        if (this.collecting) {
          this.sawThis = true;
          return node;
        }
        if (this.isStatic) return ident(assert(this.className), node.range);
        if (!this.hasReceiver) {
          this.failThis(node.range);
          return null;
        }
        return ident(ASYNC_THIS_NAME, node.range);
      }
      case NodeKind.Super: {
        if (this.collecting) return node;
        this.fail(
          this.isStatic
            ? "'super' in static async methods is not yet supported"
            : this.hasReceiver
              ? "'super' in async methods is not yet supported"
              : "'super' in async functions is not yet supported",
          node.range
        );
        return null;
      }
      case NodeKind.Identifier:
      case NodeKind.Literal: {
        if (node instanceof TemplateLiteralExpression) {
          return this.walkTemplateLiteral(node);
        }
        if (node instanceof ArrayLiteralExpression) {
          let elements = node.elementExpressions;
          for (let i = 0, k = elements.length; i < k; ++i) {
            let element = this.walkExpression(elements[i]);
            if (!element) return null;
            elements[i] = element;
          }
          return node;
        }
        if (node instanceof ObjectLiteralExpression) {
          let values = node.values;
          for (let i = 0, k = values.length; i < k; ++i) {
            let value = this.walkExpression(values[i]);
            if (!value) return null;
            values[i] = value;
          }
          return node;
        }
        return node;
      }
      case NodeKind.PropertyAccess: {
        let access = <PropertyAccessExpression>node;
        if (access.expression.kind == NodeKind.Super) {
          let name = access.property.text;
          if (!this.hasSuperPrepass()) return this.failSuperExpr(node.range);
          let info = this.superMember(name);
          if (info) {
            if (info.kind == "method") {
              this.fail("'super' methods cannot be used as values", node.range);
              return null;
            }
            let getter = this.superHelperCall(info.get, [], node.range);
            if (!getter) return this.failSuperExpr(node.range);
            return getter;
          }
          let receiver = this.superReceiver(node.range);
          if (!receiver) return this.failSuperExpr(node.range);
          return new PropertyAccessExpression(receiver, ident(name, access.property.range), node.range);
        }
        let object = this.walkExpression(access.expression);
        if (!object) return null;
        access.expression = object;
        return access;
      }
      case NodeKind.ElementAccess: {
        let access = <ElementAccessExpression>node;
        if (access.expression.kind == NodeKind.Super) {
          if (!(access.elementExpression instanceof StringLiteralExpression)) {
            this.fail("'super' element access with a non-literal index is not yet supported", node.range);
            return null;
          }
          let name = (<StringLiteralExpression>access.elementExpression).value;
          if (!this.hasSuperPrepass()) return this.failSuperExpr(node.range);
          let info = this.superMember(name);
          if (info) {
            if (info.kind == "method") {
              this.fail("'super' methods cannot be used as values", node.range);
              return null;
            }
            let getter = this.superHelperCall(info.get, [], node.range);
            if (!getter) return this.failSuperExpr(node.range);
            return getter;
          }
          let receiver = this.superReceiver(node.range);
          if (!receiver) return this.failSuperExpr(node.range);
          return new ElementAccessExpression(receiver, access.elementExpression, node.range);
        }
        let object = this.walkExpression(access.expression);
        if (!object) return null;
        let element = this.walkExpression(access.elementExpression);
        if (!element) return null;
        access.expression = object;
        access.elementExpression = element;
        return access;
      }
      case NodeKind.Call: {
        let call = <CallExpression>node;
        let callee = unwrapParens(call.expression);
        if (callee.kind == NodeKind.Super) {
          this.fail("'super' calls are only permitted in constructors", node.range);
          return null;
        }
        let name = this.superPropertyName(callee);
        if (name != "") {
          if (!this.hasSuperPrepass()) return this.failSuperExpr(node.range);
          let info = this.superMember(name);
          if (info) {
            if (info.kind == "accessor") {
              let getter = this.superHelperCall(info.get, [], node.range);
              if (!getter) return this.failSuperExpr(node.range);
              let args = call.args;
              for (let i = 0, k = args.length; i < k; ++i) {
                let arg = this.walkExpression(args[i]);
                if (!arg) return null;
                args[i] = arg;
              }
              return new CallExpression(getter, call.typeArguments, args, node.range);
            }
            if (call.typeArguments && call.typeArguments.length > 0) {
              this.fail("'super' to a generic base method is not yet supported", node.range);
              return null;
            }
            let args = call.args;
            for (let i = 0, k = args.length; i < k; ++i) {
              let arg = this.walkExpression(args[i]);
              if (!arg) return null;
              args[i] = arg;
            }
            let helper = this.superHelperCall(info.call, args, node.range);
            if (!helper) return this.failSuperExpr(node.range);
            return helper;
          }
          let receiver = this.superReceiver(node.range);
          if (!receiver) return this.failSuperExpr(node.range);
          let args = call.args;
          for (let i = 0, k = args.length; i < k; ++i) {
            let arg = this.walkExpression(args[i]);
            if (!arg) return null;
            args[i] = arg;
          }
          let propertyRange = callee.kind == NodeKind.PropertyAccess
            ? (<PropertyAccessExpression>callee).property.range
            : node.range;
          return callExpr(
            new PropertyAccessExpression(receiver, ident(name, propertyRange), node.range),
            args,
            node.range
          );
        }
        let walkedCallee = this.walkExpression(call.expression);
        if (!walkedCallee) return null;
        call.expression = walkedCallee;
        let args = call.args;
        for (let i = 0, k = args.length; i < k; ++i) {
          let arg = this.walkExpression(args[i]);
          if (!arg) return null;
          args[i] = arg;
        }
        return call;
      }
      case NodeKind.New: {
        let expr = <NewExpression>node;
        let args = expr.args;
        for (let i = 0, k = args.length; i < k; ++i) {
          let arg = this.walkExpression(args[i]);
          if (!arg) return null;
          args[i] = arg;
        }
        return expr;
      }
      case NodeKind.Binary: {
        let binary = <BinaryExpression>node;
        if (binary.operator == Token.Equals || this.compoundOperator(binary.operator) != Token.Invalid) {
          let name = this.superPropertyName(unwrapParens(binary.left));
          if (name != "") {
            if (!this.hasSuperPrepass()) return this.failSuperExpr(node.range);
            let info = this.superMember(name);
            if (info) {
              if (info.kind == "method") {
                this.fail("cannot assign to a 'super' method", node.range);
                return null;
              }
              this.fail("'super' property assignment is only supported as a full expression statement", node.range);
              return null;
            }
          }
        }
        let left = this.walkExpression(binary.left);
        if (!left) return null;
        let right = this.walkExpression(binary.right);
        if (!right) return null;
        binary.left = left;
        binary.right = right;
        return binary;
      }
      case NodeKind.UnaryPrefix: {
        let unary = <UnaryPrefixExpression>node;
        let name = this.superPropertyName(unwrapParens(unary.operand));
        if (name != "" && (unary.operator == Token.Plus_Plus || unary.operator == Token.Minus_Minus)) {
          if (!this.hasSuperPrepass()) return this.failSuperExpr(node.range);
          let info = this.superMember(name);
          if (info) {
            if (info.kind == "method") {
              this.fail("cannot assign to a 'super' method", node.range);
              return null;
            }
            this.fail("'super' property assignment is only supported as a full expression statement", node.range);
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
        let name = this.superPropertyName(unwrapParens(unary.operand));
        if (name != "" && (unary.operator == Token.Plus_Plus || unary.operator == Token.Minus_Minus)) {
          if (!this.hasSuperPrepass()) return this.failSuperExpr(node.range);
          let info = this.superMember(name);
          if (info) {
            if (info.kind == "method") {
              this.fail("cannot assign to a 'super' method", node.range);
              return null;
            }
            this.fail("'super' property assignment is only supported as a full expression statement", node.range);
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
        let ifThen = this.walkExpression(ternary.ifThen);
        if (!ifThen) return null;
        let ifElse = this.walkExpression(ternary.ifElse);
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
        let parameters = declaration.signature.parameters;
        for (let i = 0, k = parameters.length; i < k; ++i) {
          if (this.collecting) {
            this.declared.add(parameters[i].name.text);
          } else if (parameters[i].name.text == ASYNC_THIS_NAME) {
            this.fail(`'${ASYNC_THIS_NAME}' is reserved for the CPS transform and cannot be a closure parameter`, parameters[i].name.range);
            return null;
          }
        }
        if (declaration.body && !this.walkStatement(declaration.body)) return null;
        return node;
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
}
