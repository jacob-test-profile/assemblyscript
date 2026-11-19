/**
 * @fileoverview Helpers for the CPS state-machine transform of async
 * functions: synthetic AST construction, resolved-type to type-node
 * conversion, the identifier rewriter that lifts locals to state fields,
 * and the validation walks that reject what chunk 1 cannot transform.
 * @license Apache-2.0
 */

import {
  NodeKind,
  Node,
  Statement,
  Expression,
  TypeNode,
  NamedTypeNode,
  TypeName,
  IdentifierExpression,
  ThisExpression,
  PropertyAccessExpression,
  CallExpression,
  BinaryExpression,
  IntegerLiteralExpression,
  FloatLiteralExpression,
  StringLiteralExpression,
  FalseExpression,
  NullExpression,
  NewExpression,
  AssertionExpression,
  TernaryExpression,
  UnaryPrefixExpression,
  UnaryPostfixExpression,
  ParenthesizedExpression,
  CommaExpression,
  InstanceOfExpression,
  ElementAccessExpression,
  ArrayLiteralExpression,
  ObjectLiteralExpression,
  TemplateLiteralExpression,
  BlockStatement,
  BreakStatement,
  ContinueStatement,
  ExpressionStatement,
  ReturnStatement,
  SwitchStatement,
  TryStatement,
  VariableStatement,
  IfStatement,
  WhileStatement,
  ForStatement,
  ForOfStatement,
  DoStatement,
  FunctionExpression,
  ClassExpression,
  MethodDeclaration,
  AwaitExpression,
  FunctionTypeNode,
  ParameterNode,
  ParameterKind,
  ArrowKind,
  ThrowStatement
} from "./ast";

import {
  Range
} from "./diagnostics";

import {
  Token
} from "./tokenizer";

import {
  Type,
  TypeKind,
  Signature
} from "./types";

import {
  CommonNames,
  CommonFlags
} from "./common";

/** Spill-pool entry points, generated once per module when needed. */
export const SPILL_POOL_SIZE = 8;
export const SPILL_ACQUIRE = "__async_spill_acquire";
export const SPILL_RELEASE = "__async_spill_release";
export const SPILL_GET = "__async_spill_get";
export const SPILL_SET = "__async_spill_set";
/** Markers the try desugar emits and the transform lowers: the first
 *  derives a throw's message + value and records them in the frame's
 *  slots; the second fails the task with already-computed slots. */
export const TRY_THROW_MARKER = "__async_try_throw";
export const TRY_FAIL_MARKER = "__async_try_fail";

/** Local holding the receiver of an async method, introduced by the
 *  this-lift pre-pass (`this` is rewritten to this identifier). */
export const ASYNC_THIS_NAME = "__async_this";

/** State field of an extracted async arrow holding the enclosing
 *  function's state object, so the arrow can read captured locals
 *  across suspension. Initialised by the arrow's entry wrapper. */
export const ASYNC_OUTER_NAME = "__async_outer";

/** State class name for an async function or method, from its qualified
 *  name (the plain function name, or `<Class>_<method>` for methods). */
export function cpsStateClassName(qualName: string): string {
  return `__Cps_${qualName}`;
}

/** Encodes one type into an identifier-safe fragment, injectively: an
 *  identifier character stays itself, every other character becomes
 *  `_x<hex>_`. The encoding is uniquely decodable (an escape is always
 *  `_x` + hex + `_`, and a bare `_` never occurs), so distinct type
 *  lists mangle to distinct names. */
export function encodeTypeName(text: string): string {
  let out = "";
  for (let i = 0, k = text.length; i < k; ++i) {
    let code = text.charCodeAt(i);
    let ok = (code >= 48 && code <= 57)
      || (code >= 65 && code <= 90)
      || (code >= 97 && code <= 122)
      || code == 36;
    out += ok ? text.charAt(i) : "_x" + code.toString(16) + "_";
  }
  return out;
}

/** Mangles a base name with concrete type arguments, e.g. `f` + `[i32]`
 *  becomes `f_i32`, `Box` + `[~lib/string/String]` becomes
 *  `Box__x7e_lib_x2f_string_x2f_String`. One mangled name per distinct
 *  type-argument list; callers still guard against collisions with user
 *  declarations (a user could have written the mangled name by hand). */
export function mangleGenericName(base: string, typeArguments: Type[]): string {
  let parts = new Array<string>(typeArguments.length);
  for (let i = 0, k = typeArguments.length; i < k; ++i) {
    parts[i] = encodeTypeName(typeArguments[i].toString(true));
  }
  return base + "_" + parts.join("_");
}

/** Module-global holding the currently-stepping state object (as a raw
 *  pointer) for an async function or method. */
export function cpsStateGlobalName(fileBase: string, qualName: string): string {
  return `__async_state_${fileBase}_${qualName}`;
}

/** How a lifted local is stored in the state object. */
export interface AsyncLocalBinding {
  /** State field holding the value, if lifted. */
  field: string;
  /** Whether the value lives in an externref spill slot instead. */
  spilled: bool;
  /** State field holding the spill slot index, if spilled. */
  slotField: string;
  /** Range of the declaration name, for diagnostics. */
  range: Range;
  /** Whether this name is a plain step-method local shadowing an outer lifted local. */
  shadowed: bool;
  /** Resolved type of the local, when known; `null` for shadow bindings. */
  type: Type | null;
  /** Identifier holding the env object, when the value lives in a
   *  loop-closure env instead of the state object; "" otherwise. */
  envReceiver: string;
}

export function shadowBinding(range: Range): AsyncLocalBinding {
  return {
    field: "",
    spilled: false,
    slotField: "",
    range,
    shadowed: true,
    type: null,
    envReceiver: ""
  };
}

/** Per-iteration env for one loop closure: the hidden env parameter the
 *  lifted method takes, the env class holding the snapshots, and the
 *  loop-scoped names captured in it (first-reference order). */
export interface LoopEnvInfo {
  envParam: string;
  envClass: string;
  captureName: string;
  captures: string[];
  /** Adapter stem `__adapt_<qual>_<N>`; slot `s` is `<stem>_<s>`. */
  adapterBase: string;
  /** Module-global env array, adapter array, and slot counter. */
  envsName: string;
  fnsName: string;
  slotName: string;
}

/** Slots in one loop closure's adapter table: at most this many stored
 *  closures per closure site stay distinct; the next creation reuses the
 *  oldest slot. A bare function pointer carries no liveness, so the bound
 *  cannot fail loudly without breaking transient closures. */
export const LOOP_ADAPTER_SLOTS = 32;

/** Hidden env parameter name for loop-closure methods. */
export const LOOP_ENV_PARAM = "__async_env";

/** Scoped map of lifted locals, innermost scope last. */
export class AsyncScope {
  private stack: Map<string, AsyncLocalBinding>[] = [ new Map() ];

  push(): void {
    this.stack.push(new Map());
  }

  pop(): void {
    assert(this.stack.length > 1);
    this.stack.pop();
  }

  declare(name: string, binding: AsyncLocalBinding): void {
    this.stack[this.stack.length - 1].set(name, binding);
  }

  /** Looks up the name in the innermost scope only, if present. */
  lookupCurrent(name: string): AsyncLocalBinding | null {
    let scope = this.stack[this.stack.length - 1];
    let binding = scope.get(name);
    return binding ? binding : null;
  }

  lookup(name: string): AsyncLocalBinding | null {
    for (let i = this.stack.length - 1; i >= 0; --i) {
      let binding = this.stack[i].get(name);
      if (binding) return binding;
    }
    return null;
  }
}

/** Reports a transform failure. The caller aborts the transform. */
export type AsyncFail = (message: string, range: Range) => void;

// === Synthetic AST construction ================================================================

export function ident(name: string, range: Range): IdentifierExpression {
  return new IdentifierExpression(name, false, range);
}

export function thisProp(field: string, range: Range): PropertyAccessExpression {
  return new PropertyAccessExpression(
    new ThisExpression(range),
    ident(field, range),
    range
  );
}

export function intLit(value: i32, range: Range): IntegerLiteralExpression {
  return new IntegerLiteralExpression(i64_new(value, value < 0 ? -1 : 0), range);
}

export function strLit(value: string, range: Range): StringLiteralExpression {
  return new StringLiteralExpression(value, range);
}

export function callExpr(callee: Expression, args: Expression[], range: Range): CallExpression {
  return new CallExpression(callee, null, args, range);
}

export function assignExpr(left: Expression, right: Expression, range: Range): BinaryExpression {
  return new BinaryExpression(Token.Equals, left, right, range);
}

export function exprStmt(expr: Expression): ExpressionStatement {
  return new ExpressionStatement(expr);
}

export function blockStmt(statements: Statement[], range: Range): BlockStatement {
  return new BlockStatement(statements, range);
}

export function namedType(name: string, typeArguments: TypeNode[] | null, isNullable: bool, range: Range): NamedTypeNode {
  return new NamedTypeNode(
    new TypeName(ident(name, range), null, range),
    typeArguments,
    isNullable,
    range
  );
}

/** Unwraps parenthesized expressions. */
export function unwrapParens(expr: Expression): Expression {
  while (expr.kind == NodeKind.Parenthesized) {
    expr = (<ParenthesizedExpression>expr).expression;
  }
  return expr;
}

/** Copies a function signature with fresh parameter nodes (shared type
 *  nodes). Initializers are dropped; callers must reject them first. */
export function copyFunctionSignature(signature: FunctionTypeNode, range: Range): FunctionTypeNode {
  let parameters = new Array<ParameterNode>(signature.parameters.length);
  for (let i = 0, k = signature.parameters.length; i < k; ++i) {
    let parameter = signature.parameters[i];
    parameters[i] = new ParameterNode(
      parameter.parameterKind,
      ident(parameter.name.text, parameter.name.range),
      parameter.type,
      null,
      parameter.range
    );
  }
  return new FunctionTypeNode(
    parameters,
    signature.returnType,
    signature.explicitThisType,
    signature.isNullable,
    range
  );
}

// === Resolved type to type node ==================================================================

const primitiveNames = new Map<TypeKind, string>();
primitiveNames.set(TypeKind.Bool, "bool");
primitiveNames.set(TypeKind.I8, "i8");
primitiveNames.set(TypeKind.I16, "i16");
primitiveNames.set(TypeKind.I32, "i32");
primitiveNames.set(TypeKind.I64, "i64");
primitiveNames.set(TypeKind.Isize, "isize");
primitiveNames.set(TypeKind.U8, "u8");
primitiveNames.set(TypeKind.U16, "u16");
primitiveNames.set(TypeKind.U32, "u32");
primitiveNames.set(TypeKind.U64, "u64");
primitiveNames.set(TypeKind.Usize, "usize");
primitiveNames.set(TypeKind.F32, "f32");
primitiveNames.set(TypeKind.F64, "f64");
primitiveNames.set(TypeKind.V128, "v128");

/** Builds a type node denoting the specified resolved type, or `null` if the type has no spelling. */
export function typeToTypeNode(type: Type, range: Range): TypeNode | null {
  if (type == Type.string) return namedType("string", null, type.isNullableReference, range);
  // Class types are usize-based, so the class check must precede the
  // primitive lookup or every class would spell as `usize`.
  let classReference = type.getClass();
  if (classReference) {
    if (classReference.prototype.name == CommonNames.String) {
      return namedType("string", null, type.isNullableReference, range);
    }
    let typeArguments: TypeNode[] | null = null;
    let classTypeArguments = classReference.typeArguments;
    if (classTypeArguments) {
      typeArguments = new Array<TypeNode>(classTypeArguments.length);
      for (let i = 0, k = classTypeArguments.length; i < k; ++i) {
        let argNode = typeToTypeNode(classTypeArguments[i], range);
        if (!argNode) return null;
        typeArguments[i] = argNode;
      }
    }
    return namedType(classReference.prototype.name, typeArguments, type.isNullableReference, range);
  }
  // Function types are usize-based too, so the signature check must
  // precede the primitive lookup or every function would spell as `usize`.
  let signature = type.getSignature();
  if (signature) {
    return functionTypeNodeFromSignature(signature, type.isNullableReference, range);
  }
  let primitiveName = primitiveNames.get(type.kind);
  if (primitiveName) return namedType(primitiveName, null, false, range);
  if (type.kind == TypeKind.Extern) return namedType("externref", null, type.isNullableReference, range);
  if (type.kind == TypeKind.Void) return null;
  return null;
}

/** Builds a function type node denoting the specified signature, or `null`
 *  if a parameter or return type has no spelling. */
export function functionTypeNodeFromSignature(
  signature: Signature,
  isNullable: bool,
  range: Range
): FunctionTypeNode | null {
  let parameterTypes = signature.parameterTypes;
  let parameters = new Array<ParameterNode>(parameterTypes.length);
  for (let i = 0, k = parameterTypes.length; i < k; ++i) {
    let parameterTypeNode = typeToTypeNode(parameterTypes[i], range);
    if (!parameterTypeNode) return null;
    let kind = ParameterKind.Default;
    if (i == k - 1 && signature.hasRest) {
      kind = ParameterKind.Rest;
    } else if (i >= signature.requiredParameters) {
      kind = ParameterKind.Optional;
    }
    parameters[i] = new ParameterNode(
      kind,
      ident(`__arg${i}`, range),
      parameterTypeNode,
      null,
      range
    );
  }
  let returnTypeNode: TypeNode | null;
  if (signature.returnType.kind == TypeKind.Void) {
    returnTypeNode = namedType("void", null, false, range);
  } else {
    returnTypeNode = typeToTypeNode(signature.returnType, range);
    if (!returnTypeNode) return null;
  }
  let explicitThisType: NamedTypeNode | null = null;
  let thisType = signature.thisType;
  if (thisType) {
    let thisTypeNode = typeToTypeNode(thisType, range);
    if (!thisTypeNode || thisTypeNode.kind != NodeKind.NamedType) return null;
    explicitThisType = <NamedTypeNode>thisTypeNode;
  }
  return new FunctionTypeNode(parameters, returnTypeNode, explicitThisType, isNullable, range);
}

/** Extracts the inner `T` node of a `Promise<T>` type node, or `null`. */
export function promiseInnerNode(node: TypeNode): TypeNode | null {
  if (node.kind != NodeKind.NamedType) return null;
  let named = <NamedTypeNode>node;
  let name = named.name;
  if (name.next) return null;
  if (name.identifier.text != CommonNames.Promise) return null;
  let typeArguments = named.typeArguments;
  if (!typeArguments || typeArguments.length != 1) return null;
  return typeArguments[0];
}

/** Builds a zero-valued expression of the specified type, or `null` if there is no spelling. */
export function zeroValue(type: Type, typeNode: TypeNode, range: Range): Expression | null {
  if (type == Type.string) return strLit("", range);
  // Class types are usize-based, so the class check must precede the
  // primitive switch or every class would zero as `0`.
  let classReference = type.getClass();
  if (classReference) {
    if (classReference.prototype.name == CommonNames.String) return strLit("", range);
    if (classReference.prototype.name == "Array") {
      let typeArguments = classReference.typeArguments;
      let elementNode: TypeNode | null = null;
      if (typeArguments && typeArguments.length == 1) {
        elementNode = typeToTypeNode(typeArguments[0], range);
      }
      if (elementNode) {
        return new NewExpression(
          new TypeName(ident("Array", range), null, range),
          [ elementNode ],
          [],
          range
        );
      }
    }
    return new CallExpression(
      ident("changetype", range),
      [ typeNode ],
      [ intLit(0, range) ],
      range
    );
  }
  // Function types are usize-based too, so the signature check must
  // precede the primitive switch or every function would zero as `0`.
  // A null function value is `changetype<Fn>(0)`, like a null class.
  if (type.getSignature()) {
    return new CallExpression(
      ident("changetype", range),
      [ typeNode ],
      [ intLit(0, range) ],
      range
    );
  }
  switch (type.kind) {
    case TypeKind.Bool: return new FalseExpression(range);
    case TypeKind.I8:
    case TypeKind.I16:
    case TypeKind.I32:
    case TypeKind.I64:
    case TypeKind.Isize:
    case TypeKind.U8:
    case TypeKind.U16:
    case TypeKind.U32:
    case TypeKind.U64:
    case TypeKind.Usize: return intLit(0, range);
    case TypeKind.F32:
    case TypeKind.F64: return new FloatLiteralExpression(0.0, range);
    default: break;
  }
  if (type.isNullableReference) return new NullExpression(range);
  return null;
}

// === Identifier rewriting ======================================================================
//
// Rewrites references to lifted locals to `this.<field>` and references to
// spilled externref locals to `__async_spill_get(this.<slotField>)`.
// Nested (non-async) function bodies are opaque: the compiler resolves
// them in their own scope, and capturing a lifted local fails loudly
// there, as it does for sync code.

export interface AsyncRewriter {
  scope: AsyncScope;
  fail: AsyncFail;
  /** Lifted closure methods awaiting a rewrite, by adapter name. The
   *  rewrite of a method body happens when its adapter identifier is
   *  first rewritten, while the enclosing scope is still live; the entry
   *  is removed then. `null` when the transform has no lifted closures. */
  adapters: Map<string, MethodDeclaration> | null;
  /** Per-iteration envs of loop closures, by lifted method name. `null`
   *  when the transform has no loop closure. */
  loopEnvs: Map<string, LoopEnvInfo> | null;
  /** Replaces a loop closure's adapter identifier with its capture call.
   *  Set together with `loopEnvs`; the core implements it. */
  rewriteLoopAdapter: ((adapterName: string, method: MethodDeclaration) => Expression | null) | null;
}

/** Reads one lifted local: a spill slot, an env field, or a state field. */
export function bindingRead(binding: AsyncLocalBinding, range: Range): Expression {
  if (binding.spilled) {
    return callExpr(
      ident(SPILL_GET, range),
      [ thisProp(binding.slotField, range) ],
      range
    );
  }
  if (binding.envReceiver != "") {
    return new PropertyAccessExpression(
      ident(binding.envReceiver, range),
      ident(binding.field, range),
      range
    );
  }
  return thisProp(binding.field, range);
}

/** Rewrites one lifted closure method body with the enclosing scope: the
 *  method's parameters are shadowed so references to them stay plain,
 *  while captured locals become state-field accesses. A loop closure's
 *  captured names become env-field accesses instead. */
export function rewriteClosureMethod(method: MethodDeclaration, ctx: AsyncRewriter): bool {
  if (!method.body) return false;
  ctx.scope.push();
  let parameters = method.signature.parameters;
  for (let i = 0, k = parameters.length; i < k; ++i) {
    ctx.scope.declare(parameters[i].name.text, shadowBinding(parameters[i].name.range));
  }
  let loopEnvs = ctx.loopEnvs;
  if (loopEnvs) {
    let env = loopEnvs.get(method.name.text);
    if (env) {
      for (let i = 0, k = env.captures.length; i < k; ++i) {
        let name = env.captures[i];
        // An externref capture arrives as a hidden method parameter
        // (reference-typed env fields are not allowed); it is already
        // declared above, so it must not be rebound to an env field.
        if (ctx.scope.lookupCurrent(name)) continue;
        ctx.scope.declare(name, {
          field: name,
          spilled: false,
          slotField: "",
          range: method.name.range,
          shadowed: false,
          type: null,
          envReceiver: env.envParam
        });
      }
    }
  }
  let rewritten = rewriteStatement(method.body, ctx);
  ctx.scope.pop();
  if (!rewritten) return false;
  method.body = rewritten;
  return true;
}

function rewriteIdentifier(node: IdentifierExpression, ctx: AsyncRewriter): Expression | null {
  let binding = ctx.scope.lookup(node.text);
  if (!binding || binding.shadowed) {
    let adapters = ctx.adapters;
    if (adapters) {
      let method = adapters.get(node.text);
      if (method) {
        adapters.delete(node.text);
        let loopEnvs = ctx.loopEnvs;
        if (loopEnvs && loopEnvs.has(method.name.text) && ctx.rewriteLoopAdapter) {
          return ctx.rewriteLoopAdapter(node.text, method);
        }
        if (!rewriteClosureMethod(method, ctx)) return null;
      }
    }
    return node;
  }
  return bindingRead(binding, node.range);
}

export function rewriteExpression(node: Expression, ctx: AsyncRewriter): Expression | null {
  switch (node.kind) {
    case NodeKind.Identifier:
    case NodeKind.True:
    case NodeKind.False:
    case NodeKind.Null: {
      if (node.kind != NodeKind.Identifier) return node;
      return rewriteIdentifier(<IdentifierExpression>node, ctx);
    }
    case NodeKind.This:
    case NodeKind.Super: {
      ctx.fail(
        node.kind == NodeKind.This
          ? "'this' in async functions is not yet supported"
          : "'super' in async functions is not yet supported",
        node.range
      );
      return null;
    }
    case NodeKind.PropertyAccess: {
      let access = <PropertyAccessExpression>node;
      let object = rewriteExpression(access.expression, ctx);
      if (!object) return null;
      access.expression = object;
      return access;
    }
    case NodeKind.ElementAccess: {
      let access = <ElementAccessExpression>node;
      let object = rewriteExpression(access.expression, ctx);
      if (!object) return null;
      let element = rewriteExpression(access.elementExpression, ctx);
      if (!element) return null;
      access.expression = object;
      access.elementExpression = element;
      return access;
    }
    case NodeKind.Call: {
      let call = <CallExpression>node;
      let callee = rewriteExpression(call.expression, ctx);
      if (!callee) return null;
      call.expression = callee;
      let args = call.args;
      for (let i = 0, k = args.length; i < k; ++i) {
        let arg = rewriteExpression(args[i], ctx);
        if (!arg) return null;
        args[i] = arg;
      }
      return call;
    }
    case NodeKind.New: {
      let expr = <NewExpression>node;
      let args = expr.args;
      for (let i = 0, k = args.length; i < k; ++i) {
        let arg = rewriteExpression(args[i], ctx);
        if (!arg) return null;
        args[i] = arg;
      }
      return expr;
    }
    case NodeKind.Binary: {
      let binary = <BinaryExpression>node;
      if (binary.operator == Token.Equals) {
        let left = binary.left;
        if (left.kind == NodeKind.Identifier) {
          let binding = ctx.scope.lookup((<IdentifierExpression>left).text);
          if (binding && binding.spilled) {
            ctx.fail("Cannot assign to a spilled externref local here", left.range);
            return null;
          }
        }
      }
      let left = rewriteExpression(binary.left, ctx);
      if (!left) return null;
      let right = rewriteExpression(binary.right, ctx);
      if (!right) return null;
      binary.left = left;
      binary.right = right;
      return binary;
    }
    case NodeKind.UnaryPrefix: {
      let unary = <UnaryPrefixExpression>node;
      let operand = rewriteExpression(unary.operand, ctx);
      if (!operand) return null;
      unary.operand = operand;
      return unary;
    }
    case NodeKind.UnaryPostfix: {
      let unary = <UnaryPostfixExpression>node;
      if (unary.operand.kind == NodeKind.Identifier) {
        let binding = ctx.scope.lookup((<IdentifierExpression>unary.operand).text);
        if (binding && binding.spilled) {
          ctx.fail("Cannot assign to a spilled externref local here", unary.operand.range);
          return null;
        }
      }
      let operand = rewriteExpression(unary.operand, ctx);
      if (!operand) return null;
      unary.operand = operand;
      return unary;
    }
    case NodeKind.Ternary: {
      let ternary = <TernaryExpression>node;
      let condition = rewriteExpression(ternary.condition, ctx);
      if (!condition) return null;
      let ifThen = rewriteExpression(ternary.ifThen, ctx);
      if (!ifThen) return null;
      let ifElse = rewriteExpression(ternary.ifElse, ctx);
      if (!ifElse) return null;
      ternary.condition = condition;
      ternary.ifThen = ifThen;
      ternary.ifElse = ifElse;
      return ternary;
    }
    case NodeKind.Assertion: {
      let assertion = <AssertionExpression>node;
      let expr = rewriteExpression(assertion.expression, ctx);
      if (!expr) return null;
      assertion.expression = expr;
      return assertion;
    }
    case NodeKind.Parenthesized: {
      let parenthesized = <ParenthesizedExpression>node;
      let expr = rewriteExpression(parenthesized.expression, ctx);
      if (!expr) return null;
      parenthesized.expression = expr;
      return parenthesized;
    }
    case NodeKind.Comma: {
      let comma = <CommaExpression>node;
      let exprs = comma.expressions;
      for (let i = 0, k = exprs.length; i < k; ++i) {
        let expr = rewriteExpression(exprs[i], ctx);
        if (!expr) return null;
        exprs[i] = expr;
      }
      return comma;
    }
    case NodeKind.InstanceOf: {
      let instanceOf = <InstanceOfExpression>node;
      let expr = rewriteExpression(instanceOf.expression, ctx);
      if (!expr) return null;
      instanceOf.expression = expr;
      return instanceOf;
    }
    case NodeKind.Literal: {
      let literal = node;
      if (literal instanceof ArrayLiteralExpression) {
        let elements = literal.elementExpressions;
        for (let i = 0, k = elements.length; i < k; ++i) {
          let element = rewriteExpression(elements[i], ctx);
          if (!element) return null;
          elements[i] = element;
        }
      } else if (literal instanceof ObjectLiteralExpression) {
        let values = literal.values;
        for (let i = 0, k = values.length; i < k; ++i) {
          let value = rewriteExpression(values[i], ctx);
          if (!value) return null;
          values[i] = value;
        }
      } else if (literal instanceof TemplateLiteralExpression) {
        if (literal.tag) {
          let tag = rewriteExpression(literal.tag, ctx);
          if (!tag) return null;
          literal.tag = tag;
        }
        let exprs = literal.expressions;
        for (let i = 0, k = exprs.length; i < k; ++i) {
          let expr = rewriteExpression(exprs[i], ctx);
          if (!expr) return null;
          exprs[i] = expr;
        }
      }
      return literal;
    }
    case NodeKind.Await: {
      ctx.fail("Internal error: unexpected 'await' during rewriting", node.range);
      return null;
    }
    case NodeKind.Function:
    case NodeKind.Class: {
      return node;
    }
    default: {
      return node;
    }
  }
}

/** Rewrites a passthrough statement (no await inside) in place. */
export function rewriteStatement(node: Statement, ctx: AsyncRewriter): Statement | null {
  switch (node.kind) {
    case NodeKind.Block: {
      let block = <BlockStatement>node;
      ctx.scope.push();
      let statements = block.statements;
      for (let i = 0, k = statements.length; i < k; ++i) {
        let rewritten = rewriteStatement(statements[i], ctx);
        if (!rewritten) {
          ctx.scope.pop();
          return null;
        }
        statements[i] = rewritten;
      }
      ctx.scope.pop();
      return block;
    }
    case NodeKind.Expression: {
      let stmt = <ExpressionStatement>node;
      let expr = rewriteExpression(stmt.expression, ctx);
      if (!expr) return null;
      stmt.expression = expr;
      return stmt;
    }
    case NodeKind.Return: {
      let stmt = <ReturnStatement>node;
      if (stmt.value) {
        let value = rewriteExpression(stmt.value, ctx);
        if (!value) return null;
        stmt.value = value;
      }
      return stmt;
    }
    case NodeKind.Variable: {
      let stmt = <VariableStatement>node;
      let declarations = stmt.declarations;
      for (let i = 0, k = declarations.length; i < k; ++i) {
        let declaration = declarations[i];
        if (declaration.initializer) {
          let initializer = rewriteExpression(declaration.initializer, ctx);
          if (!initializer) return null;
          declaration.initializer = initializer;
        }
        ctx.scope.declare(declaration.name.text, shadowBinding(declaration.name.range));
      }
      return stmt;
    }
    case NodeKind.If: {
      let stmt = <IfStatement>node;
      let condition = rewriteExpression(stmt.condition, ctx);
      if (!condition) return null;
      stmt.condition = condition;
      let ifTrue = rewriteStatement(stmt.ifTrue, ctx);
      if (!ifTrue) return null;
      stmt.ifTrue = ifTrue;
      if (stmt.ifFalse) {
        let ifFalse = rewriteStatement(stmt.ifFalse, ctx);
        if (!ifFalse) return null;
        stmt.ifFalse = ifFalse;
      }
      return stmt;
    }
    case NodeKind.While: {
      let stmt = <WhileStatement>node;
      let condition = rewriteExpression(stmt.condition, ctx);
      if (!condition) return null;
      stmt.condition = condition;
      let body = rewriteStatement(stmt.body, ctx);
      if (!body) return null;
      stmt.body = body;
      return stmt;
    }
    case NodeKind.For: {
      let stmt = <ForStatement>node;
      ctx.scope.push();
      if (stmt.initializer) {
        let initializer = rewriteStatement(stmt.initializer, ctx);
        if (!initializer) {
          ctx.scope.pop();
          return null;
        }
        stmt.initializer = initializer;
      }
      if (stmt.condition) {
        let condition = rewriteExpression(stmt.condition, ctx);
        if (!condition) {
          ctx.scope.pop();
          return null;
        }
        stmt.condition = condition;
      }
      if (stmt.incrementor) {
        let incrementor = rewriteExpression(stmt.incrementor, ctx);
        if (!incrementor) {
          ctx.scope.pop();
          return null;
        }
        stmt.incrementor = incrementor;
      }
      let body = rewriteStatement(stmt.body, ctx);
      if (!body) {
        ctx.scope.pop();
        return null;
      }
      stmt.body = body;
      ctx.scope.pop();
      return stmt;
    }
    case NodeKind.Do: {
      let stmt = <DoStatement>node;
      let body = rewriteStatement(stmt.body, ctx);
      if (!body) return null;
      stmt.body = body;
      let condition = rewriteExpression(stmt.condition, ctx);
      if (!condition) return null;
      stmt.condition = condition;
      return stmt;
    }
    case NodeKind.Switch: {
      let stmt = <SwitchStatement>node;
      let condition = rewriteExpression(stmt.condition, ctx);
      if (!condition) return null;
      stmt.condition = condition;
      ctx.scope.push();
      let cases = stmt.cases;
      for (let i = 0, k = cases.length; i < k; ++i) {
        let switchCase = cases[i];
        if (switchCase.label) {
          let label = rewriteExpression(switchCase.label, ctx);
          if (!label) {
            ctx.scope.pop();
            return null;
          }
          switchCase.label = label;
        }
        let statements = switchCase.statements;
        for (let j = 0, l = statements.length; j < l; ++j) {
          let rewritten = rewriteStatement(statements[j], ctx);
          if (!rewritten) {
            ctx.scope.pop();
            return null;
          }
          statements[j] = rewritten;
        }
      }
      ctx.scope.pop();
      return stmt;
    }
    case NodeKind.Try: {
      let stmt = <TryStatement>node;
      ctx.scope.push();
      let bodyStatements = stmt.bodyStatements;
      for (let i = 0, k = bodyStatements.length; i < k; ++i) {
        let rewritten = rewriteStatement(bodyStatements[i], ctx);
        if (!rewritten) {
          ctx.scope.pop();
          return null;
        }
        bodyStatements[i] = rewritten;
      }
      ctx.scope.pop();
      if (stmt.catchStatements) {
        ctx.scope.push();
        if (stmt.catchVariable) {
          ctx.scope.declare(stmt.catchVariable.text, shadowBinding(stmt.catchVariable.range));
        }
        let catchStatements = stmt.catchStatements;
        for (let i = 0, k = catchStatements.length; i < k; ++i) {
          let rewritten = rewriteStatement(catchStatements[i], ctx);
          if (!rewritten) {
            ctx.scope.pop();
            return null;
          }
          catchStatements[i] = rewritten;
        }
        ctx.scope.pop();
      }
      if (stmt.finallyStatements) {
        let finallyStatements = stmt.finallyStatements;
        for (let i = 0, k = finallyStatements.length; i < k; ++i) {
          let rewritten = rewriteStatement(finallyStatements[i], ctx);
          if (!rewritten) return null;
          finallyStatements[i] = rewritten;
        }
      }
      return stmt;
    }
    default: {
      return node;
    }
  }
}

// === Validation walks ============================================================================

/** Tests whether the subtree contains an `await`, not descending into nested functions. */
export function containsAwait(node: Node): bool {
  if (node.kind == NodeKind.Await) return true;
  if (node instanceof FunctionExpression) return false;
  if (node instanceof BlockStatement) {
    let statements = node.statements;
    for (let i = 0, k = statements.length; i < k; ++i) {
      if (containsAwait(statements[i])) return true;
    }
    return false;
  }
  if (node instanceof ExpressionStatement) return containsAwait(node.expression);
  if (node instanceof VariableStatement) {
    let declarations = node.declarations;
    for (let i = 0, k = declarations.length; i < k; ++i) {
      let initializer = declarations[i].initializer;
      if (initializer && containsAwait(initializer)) return true;
    }
    return false;
  }
  if (node instanceof ReturnStatement) {
    return node.value ? containsAwait(node.value) : false;
  }
  if (node instanceof IfStatement) {
    return containsAwait(node.condition)
      || containsAwait(node.ifTrue)
      || (node.ifFalse ? containsAwait(node.ifFalse) : false);
  }
  if (node instanceof WhileStatement) {
    return containsAwait(node.condition) || containsAwait(node.body);
  }
  if (node instanceof DoStatement) {
    return containsAwait(node.body) || containsAwait(node.condition);
  }
  if (node instanceof ForStatement) {
    return (node.initializer ? containsAwait(node.initializer) : false)
      || (node.condition ? containsAwait(node.condition) : false)
      || (node.incrementor ? containsAwait(node.incrementor) : false)
      || containsAwait(node.body);
  }
  if (node instanceof ForOfStatement) {
    return containsAwait(node.variable)
      || containsAwait(node.iterable)
      || containsAwait(node.body);
  }
  if (node instanceof SwitchStatement) {
    if (containsAwait(node.condition)) return true;
    let cases = node.cases;
    for (let i = 0, k = cases.length; i < k; ++i) {
      let switchCase = cases[i];
      if (switchCase.label && containsAwait(switchCase.label)) return true;
      let statements = switchCase.statements;
      for (let j = 0, l = statements.length; j < l; ++j) {
        if (containsAwait(statements[j])) return true;
      }
    }
    return false;
  }
  if (node instanceof TryStatement) {
    let bodyStatements = node.bodyStatements;
    for (let i = 0, k = bodyStatements.length; i < k; ++i) {
      if (containsAwait(bodyStatements[i])) return true;
    }
    if (node.catchStatements) {
      let catchStatements = node.catchStatements;
      for (let i = 0, k = catchStatements.length; i < k; ++i) {
        if (containsAwait(catchStatements[i])) return true;
      }
    }
    if (node.finallyStatements) {
      let finallyStatements = node.finallyStatements;
      for (let i = 0, k = finallyStatements.length; i < k; ++i) {
        if (containsAwait(finallyStatements[i])) return true;
      }
    }
    return false;
  }
  if (node instanceof Expression) {
    return containsAwaitExpression(<Expression>node);
  }
  return false;
}

function containsAwaitExpression(node: Expression): bool {
  if (node.kind == NodeKind.Await) return true;
  if (node instanceof FunctionExpression) return false;
  if (node instanceof ClassExpression) return false;
  if (node instanceof BinaryExpression) {
    return containsAwaitExpression(node.left) || containsAwaitExpression(node.right);
  }
  if (node instanceof CallExpression) {
    if (containsAwaitExpression(node.expression)) return true;
    let args = node.args;
    for (let i = 0, k = args.length; i < k; ++i) {
      if (containsAwaitExpression(args[i])) return true;
    }
    return false;
  }
  if (node instanceof PropertyAccessExpression) return containsAwaitExpression(node.expression);
  if (node instanceof ElementAccessExpression) {
    return containsAwaitExpression(node.expression) || containsAwaitExpression(node.elementExpression);
  }
  if (node instanceof UnaryPrefixExpression) return containsAwaitExpression(node.operand);
  if (node instanceof UnaryPostfixExpression) return containsAwaitExpression(node.operand);
  if (node instanceof TernaryExpression) {
    return containsAwaitExpression(node.condition)
      || containsAwaitExpression(node.ifThen)
      || containsAwaitExpression(node.ifElse);
  }
  if (node instanceof AssertionExpression) return containsAwaitExpression(node.expression);
  if (node instanceof ParenthesizedExpression) return containsAwaitExpression(node.expression);
  if (node instanceof CommaExpression) {
    let exprs = node.expressions;
    for (let i = 0, k = exprs.length; i < k; ++i) {
      if (containsAwaitExpression(exprs[i])) return true;
    }
    return false;
  }
  if (node instanceof InstanceOfExpression) return containsAwaitExpression(node.expression);
  if (node instanceof NewExpression) {
    let args = node.args;
    for (let i = 0, k = args.length; i < k; ++i) {
      if (containsAwaitExpression(args[i])) return true;
    }
    return false;
  }
  if (node instanceof ArrayLiteralExpression) {
    let elements = node.elementExpressions;
    for (let i = 0, k = elements.length; i < k; ++i) {
      if (containsAwaitExpression(elements[i])) return true;
    }
    return false;
  }
  if (node instanceof ObjectLiteralExpression) {
    let values = node.values;
    for (let i = 0, k = values.length; i < k; ++i) {
      if (containsAwaitExpression(values[i])) return true;
    }
    return false;
  }
  if (node instanceof TemplateLiteralExpression) {
    if (node.tag && containsAwaitExpression(node.tag)) return true;
    let exprs = node.expressions;
    for (let i = 0, k = exprs.length; i < k; ++i) {
      if (containsAwaitExpression(exprs[i])) return true;
    }
    return false;
  }
  if (node instanceof AwaitExpression) return true;
  return false;
}

/** Tests whether the subtree references `this` or `super`. Used when a
 *  parameter initializer is copied into a generated entry function (a
 *  free function, so it has no `this`): an initializer that mentions
 *  `this` cannot be evaluated there. Arrow functions inherit the
 *  enclosing `this`, so they are descended into; regular function
 *  expressions and class expressions have their own `this` and are not. */
export function containsThisOrSuper(node: Node): bool {
  if (node.kind == NodeKind.This || node.kind == NodeKind.Super) return true;
  if (node instanceof FunctionExpression) {
    let declaration = node.declaration;
    if (declaration.arrowKind == ArrowKind.None) return false;
    let body = declaration.body;
    return body ? containsThisOrSuper(body) : false;
  }
  if (node instanceof ClassExpression) return false;
  if (node instanceof BlockStatement) {
    let statements = node.statements;
    for (let i = 0, k = statements.length; i < k; ++i) {
      if (containsThisOrSuper(statements[i])) return true;
    }
    return false;
  }
  if (node instanceof ExpressionStatement) return containsThisOrSuper(node.expression);
  if (node instanceof VariableStatement) {
    let declarations = node.declarations;
    for (let i = 0, k = declarations.length; i < k; ++i) {
      let initializer = declarations[i].initializer;
      if (initializer && containsThisOrSuper(initializer)) return true;
    }
    return false;
  }
  if (node instanceof ReturnStatement) {
    return node.value ? containsThisOrSuper(node.value) : false;
  }
  if (node instanceof ThrowStatement) return containsThisOrSuper(node.value);
  if (node instanceof IfStatement) {
    return containsThisOrSuper(node.condition)
      || containsThisOrSuper(node.ifTrue)
      || (node.ifFalse ? containsThisOrSuper(node.ifFalse) : false);
  }
  if (node instanceof WhileStatement) {
    return containsThisOrSuper(node.condition) || containsThisOrSuper(node.body);
  }
  if (node instanceof DoStatement) {
    return containsThisOrSuper(node.body) || containsThisOrSuper(node.condition);
  }
  if (node instanceof ForStatement) {
    return (node.initializer ? containsThisOrSuper(node.initializer) : false)
      || (node.condition ? containsThisOrSuper(node.condition) : false)
      || (node.incrementor ? containsThisOrSuper(node.incrementor) : false)
      || containsThisOrSuper(node.body);
  }
  if (node instanceof SwitchStatement) {
    if (containsThisOrSuper(node.condition)) return true;
    let cases = node.cases;
    for (let i = 0, k = cases.length; i < k; ++i) {
      let switchCase = cases[i];
      if (switchCase.label && containsThisOrSuper(switchCase.label)) return true;
      let statements = switchCase.statements;
      for (let j = 0, l = statements.length; j < l; ++j) {
        if (containsThisOrSuper(statements[j])) return true;
      }
    }
    return false;
  }
  if (node instanceof TryStatement) {
    let bodyStatements = node.bodyStatements;
    for (let i = 0, k = bodyStatements.length; i < k; ++i) {
      if (containsThisOrSuper(bodyStatements[i])) return true;
    }
    if (node.catchStatements) {
      let catchStatements = node.catchStatements;
      for (let i = 0, k = catchStatements.length; i < k; ++i) {
        if (containsThisOrSuper(catchStatements[i])) return true;
      }
    }
    if (node.finallyStatements) {
      let finallyStatements = node.finallyStatements;
      for (let i = 0, k = finallyStatements.length; i < k; ++i) {
        if (containsThisOrSuper(finallyStatements[i])) return true;
      }
    }
    return false;
  }
  if (node instanceof Expression) {
    return containsThisOrSuperExpression(<Expression>node);
  }
  return false;
}

function containsThisOrSuperExpression(node: Expression): bool {
  if (node.kind == NodeKind.This || node.kind == NodeKind.Super) return true;
  if (node instanceof FunctionExpression) {
    let declaration = node.declaration;
    if (declaration.arrowKind == ArrowKind.None) return false;
    let body = declaration.body;
    return body ? containsThisOrSuper(body) : false;
  }
  if (node instanceof ClassExpression) return false;
  if (node instanceof BinaryExpression) {
    return containsThisOrSuperExpression(node.left) || containsThisOrSuperExpression(node.right);
  }
  if (node instanceof CallExpression) {
    if (containsThisOrSuperExpression(node.expression)) return true;
    let args = node.args;
    for (let i = 0, k = args.length; i < k; ++i) {
      if (containsThisOrSuperExpression(args[i])) return true;
    }
    return false;
  }
  if (node instanceof PropertyAccessExpression) return containsThisOrSuperExpression(node.expression);
  if (node instanceof ElementAccessExpression) {
    return containsThisOrSuperExpression(node.expression) || containsThisOrSuperExpression(node.elementExpression);
  }
  if (node instanceof UnaryPrefixExpression) return containsThisOrSuperExpression(node.operand);
  if (node instanceof UnaryPostfixExpression) return containsThisOrSuperExpression(node.operand);
  if (node instanceof TernaryExpression) {
    return containsThisOrSuperExpression(node.condition)
      || containsThisOrSuperExpression(node.ifThen)
      || containsThisOrSuperExpression(node.ifElse);
  }
  if (node instanceof AssertionExpression) return containsThisOrSuperExpression(node.expression);
  if (node instanceof ParenthesizedExpression) return containsThisOrSuperExpression(node.expression);
  if (node instanceof CommaExpression) {
    let exprs = node.expressions;
    for (let i = 0, k = exprs.length; i < k; ++i) {
      if (containsThisOrSuperExpression(exprs[i])) return true;
    }
    return false;
  }
  if (node instanceof InstanceOfExpression) return containsThisOrSuperExpression(node.expression);
  if (node instanceof NewExpression) {
    let args = node.args;
    for (let i = 0, k = args.length; i < k; ++i) {
      if (containsThisOrSuperExpression(args[i])) return true;
    }
    return false;
  }
  if (node instanceof ArrayLiteralExpression) {
    let elements = node.elementExpressions;
    for (let i = 0, k = elements.length; i < k; ++i) {
      if (containsThisOrSuperExpression(elements[i])) return true;
    }
    return false;
  }
  if (node instanceof ObjectLiteralExpression) {
    let values = node.values;
    for (let i = 0, k = values.length; i < k; ++i) {
      if (containsThisOrSuperExpression(values[i])) return true;
    }
    return false;
  }
  if (node instanceof TemplateLiteralExpression) {
    if (node.tag && containsThisOrSuperExpression(node.tag)) return true;
    let exprs = node.expressions;
    for (let i = 0, k = exprs.length; i < k; ++i) {
      if (containsThisOrSuperExpression(exprs[i])) return true;
    }
    return false;
  }
  if (node instanceof AwaitExpression) return containsThisOrSuperExpression(node.operand);
  return false;
}

/**
 * Rejects what chunk 1 cannot transform, with a specific diagnostic per
 * construct. Returns `false` when a failure was reported. Nested
 * (non-async) function bodies are opaque, except that an async function
 * expression is rejected outright.
 */
export function validateBody(node: Statement, fail: AsyncFail): bool {
  return validateStatement(node, fail);
}

function validateStatement(node: Statement, fail: AsyncFail): bool {
  switch (node.kind) {
    case NodeKind.Block: {
      let statements = (<BlockStatement>node).statements;
      for (let i = 0, k = statements.length; i < k; ++i) {
        if (!validateStatement(statements[i], fail)) return false;
      }
      return true;
    }
    case NodeKind.Expression: {
      return validateExpression((<ExpressionStatement>node).expression, fail);
    }
    case NodeKind.Variable: {
      let declarations = (<VariableStatement>node).declarations;
      for (let i = 0, k = declarations.length; i < k; ++i) {
        let initializer = declarations[i].initializer;
        if (initializer && !validateExpression(initializer, fail)) return false;
      }
      return true;
    }
    case NodeKind.Return: {
      let value = (<ReturnStatement>node).value;
      return !value || validateExpression(value, fail);
    }
    case NodeKind.If: {
      let stmt = <IfStatement>node;
      return validateExpression(stmt.condition, fail)
        && validateStatement(stmt.ifTrue, fail)
        && (!stmt.ifFalse || validateStatement(stmt.ifFalse, fail));
    }
    case NodeKind.While: {
      let stmt = <WhileStatement>node;
      return validateExpression(stmt.condition, fail) && validateStatement(stmt.body, fail);
    }
    case NodeKind.Do: {
      let stmt = <DoStatement>node;
      return validateStatement(stmt.body, fail) && validateExpression(stmt.condition, fail);
    }
    case NodeKind.For: {
      let stmt = <ForStatement>node;
      return (!stmt.initializer || validateStatement(stmt.initializer, fail))
        && (!stmt.condition || validateExpression(stmt.condition, fail))
        && (!stmt.incrementor || validateExpression(stmt.incrementor, fail))
        && validateStatement(stmt.body, fail);
    }
    case NodeKind.ForOf: {
      let stmt = <ForOfStatement>node;
      return validateStatement(stmt.variable, fail)
        && validateExpression(stmt.iterable, fail)
        && validateStatement(stmt.body, fail);
    }
    case NodeKind.Switch: {
      let stmt = <SwitchStatement>node;
      if (!validateExpression(stmt.condition, fail)) return false;
      let cases = stmt.cases;
      for (let i = 0, k = cases.length; i < k; ++i) {
        let switchCase = cases[i];
        if (switchCase.label && !validateExpression(switchCase.label, fail)) return false;
        let statements = switchCase.statements;
        for (let j = 0, l = statements.length; j < l; ++j) {
          if (!validateStatement(statements[j], fail)) return false;
        }
      }
      return true;
    }
    case NodeKind.Try: {
      let stmt = <TryStatement>node;
      let bodyStatements = stmt.bodyStatements;
      for (let i = 0, k = bodyStatements.length; i < k; ++i) {
        if (!validateStatement(bodyStatements[i], fail)) return false;
      }
      if (stmt.catchStatements) {
        let catchStatements = stmt.catchStatements;
        for (let i = 0, k = catchStatements.length; i < k; ++i) {
          if (!validateStatement(catchStatements[i], fail)) return false;
        }
      }
      if (stmt.finallyStatements) {
        let finallyStatements = stmt.finallyStatements;
        for (let i = 0, k = finallyStatements.length; i < k; ++i) {
          if (!validateStatement(finallyStatements[i], fail)) return false;
        }
      }
      return true;
    }
    case NodeKind.Throw: {
      // `throw` reaches the core only as the desugar's fail-the-task
      // primitive (or a top-level throw); the transform lowers it.
      return true;
    }
    case NodeKind.Break: {
      if ((<BreakStatement>node).label) {
        fail("Labels in async functions are not yet supported", node.range);
        return false;
      }
      return true;
    }
    case NodeKind.Continue: {
      if ((<ContinueStatement>node).label) {
        fail("Labels in async functions are not yet supported", node.range);
        return false;
      }
      return true;
    }
    default: {
      return true;
    }
  }
}

function validateExpression(node: Expression, fail: AsyncFail): bool {
  if (node.kind == NodeKind.Await) return true;
  if (node instanceof FunctionExpression) {
    let declaration = node.declaration;
    if (declaration.is(CommonFlags.Async)) {
      fail("Async function expressions are not yet supported", node.range);
      return false;
    }
    return true;
  }
  if (node instanceof ClassExpression) return true;
  if (node.kind == NodeKind.This) {
    fail("'this' in async functions is not yet supported", node.range);
    return false;
  }
  if (node.kind == NodeKind.Super) {
    fail("'super' in async functions is not yet supported", node.range);
    return false;
  }
  if (node instanceof BinaryExpression) {
    return validateExpression(node.left, fail) && validateExpression(node.right, fail);
  }
  if (node instanceof CallExpression) {
    if (!validateExpression(node.expression, fail)) return false;
    let args = node.args;
    for (let i = 0, k = args.length; i < k; ++i) {
      if (!validateExpression(args[i], fail)) return false;
    }
    return true;
  }
  if (node instanceof PropertyAccessExpression) return validateExpression(node.expression, fail);
  if (node instanceof ElementAccessExpression) {
    return validateExpression(node.expression, fail) && validateExpression(node.elementExpression, fail);
  }
  if (node instanceof UnaryPrefixExpression) return validateExpression(node.operand, fail);
  if (node instanceof UnaryPostfixExpression) return validateExpression(node.operand, fail);
  if (node instanceof TernaryExpression) {
    return validateExpression(node.condition, fail)
      && validateExpression(node.ifThen, fail)
      && validateExpression(node.ifElse, fail);
  }
  if (node instanceof AssertionExpression) return validateExpression(node.expression, fail);
  if (node instanceof ParenthesizedExpression) return validateExpression(node.expression, fail);
  if (node instanceof CommaExpression) {
    let exprs = node.expressions;
    for (let i = 0, k = exprs.length; i < k; ++i) {
      if (!validateExpression(exprs[i], fail)) return false;
    }
    return true;
  }
  if (node instanceof InstanceOfExpression) return validateExpression(node.expression, fail);
  if (node instanceof NewExpression) {
    let args = node.args;
    for (let i = 0, k = args.length; i < k; ++i) {
      if (!validateExpression(args[i], fail)) return false;
    }
    return true;
  }
  if (node instanceof ArrayLiteralExpression) {
    let elements = node.elementExpressions;
    for (let i = 0, k = elements.length; i < k; ++i) {
      if (!validateExpression(elements[i], fail)) return false;
    }
    return true;
  }
  if (node instanceof ObjectLiteralExpression) {
    let values = node.values;
    for (let i = 0, k = values.length; i < k; ++i) {
      if (!validateExpression(values[i], fail)) return false;
    }
    return true;
  }
  if (node instanceof TemplateLiteralExpression) {
    if (node.tag && !validateExpression(node.tag, fail)) return false;
    let exprs = node.expressions;
    for (let i = 0, k = exprs.length; i < k; ++i) {
      if (!validateExpression(exprs[i], fail)) return false;
    }
    return true;
  }
  return true;
}
