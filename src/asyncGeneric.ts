/**
 * @fileoverview Per-instantiation transform for generic async functions
 * and async methods on generic classes (close-gaps Group 3b).
 *
 * AssemblyScript monomorphizes generics at compile time: a generic
 * function has no wasm export and each instantiation is a separate
 * internal function. The CPS transform therefore runs once per
 * instantiation, on a deep copy of the declaration with every reference
 * to a type parameter replaced by the concrete type argument. The clone
 * is an ordinary non-generic declaration, so the existing pipeline
 * (this-lift, env-lift, core) runs unchanged on it, and the generated
 * names carry the mangled type arguments (`f_i32`,
 * `__async_<file>_f_i32_resume_0`; `Box<T>.get` at `Box<i32>` becomes
 * method `get_i32`, qualName `Box_get_i32`, entry export
 * `__async_<file>_Box_get_i32_entry`, class-new
 * `__async_<file>_Box_i32_new`).
 *
 * The hook is `Resolver.resolveFunction`: when it creates an instance of
 * a generic async function or method, the clone pipeline runs and the
 * call resolves to the clone's instance. The clone is created and
 * registered before its transform runs, so a recursive instantiation
 * resolves to the same clone instead of recursing forever.
 * @license Apache-2.0
 */

import {
  NodeKind,
  Statement,
  Expression,
  TypeNode,
  NamedTypeNode,
  TypeName,
  FunctionTypeNode,
  TupleTypeNode,
  ParameterNode,
  PropertyAccessExpression,
  ElementAccessExpression,
  CallExpression,
  NewExpression,
  BinaryExpression,
  UnaryPrefixExpression,
  UnaryPostfixExpression,
  TernaryExpression,
  AssertionExpression,
  ParenthesizedExpression,
  CommaExpression,
  InstanceOfExpression,
  ArrayLiteralExpression,
  ObjectLiteralExpression,
  TemplateLiteralExpression,
  AwaitExpression,
  FunctionExpression,
  ClassExpression,
  ClassDeclaration,
  FieldDeclaration,
  MethodDeclaration,
  FunctionDeclaration,
  DeclarationStatement,
  BlockStatement,
  BreakStatement,
  ContinueStatement,
  ExpressionStatement,
  ReturnStatement,
  SwitchStatement,
  SwitchCase,
  TryStatement,
  VariableStatement,
  VariableDeclaration,
  IfStatement,
  WhileStatement,
  ForStatement,
  DoStatement,
  ForOfStatement,
  ThrowStatement,
  EmptyStatement
} from "./ast";

import {
  DiagnosticCode
} from "./diagnostics";

import {
  CommonFlags
} from "./common";

import {
  Type,
  typesToString
} from "./types";

import {
  Program,
  Function,
  FunctionPrototype,
  ClassPrototype,
  Class,
  Element,
  DeclaredElement,
  ElementKind
} from "./program";

import {
  ReportMode
} from "./resolver";

import {
  AsyncFail,
  ident,
  typeToTypeNode,
  mangleGenericName
} from "./asyncRewrite";

import {
  transformAsyncWorkItem,
  TransformWorkItem
} from "./asyncTransform";

import {
  owningFile
} from "./asyncCoordinatorMeta";

/** Deep-copies a function or method declaration, replacing every
 *  reference to a type parameter with the concrete type argument.
 *  Leaf nodes (identifiers, literals) are shared: nothing mutates them.
 *  Any node kind the cloner does not know is a loud failure, never a
 *  silent passthrough of a shared node (the transform mutates bodies in
 *  place, so sharing would corrupt the original declaration). */
class GenericCloner {
  constructor(
    /** Type parameter name to concrete type. */
    private sub: Map<string, Type>,
    private fail: AsyncFail
  ) {}

  cloneFunctionDeclaration(
    declaration: FunctionDeclaration,
    newName: string
  ): FunctionDeclaration | null {
    let signature = this.cloneSignature(declaration.signature);
    if (!signature) return null;
    let body: Statement | null = null;
    if (declaration.body) {
      body = this.cloneStatement(declaration.body);
      if (!body) return null;
    }
    return new FunctionDeclaration(
      ident(newName, declaration.name.range),
      declaration.decorators,
      declaration.flags & ~(CommonFlags.Generic | CommonFlags.GenericContext),
      null,
      signature,
      body,
      declaration.arrowKind,
      declaration.range
    );
  }

  cloneMethodDeclaration(
    declaration: MethodDeclaration,
    newName: string
  ): MethodDeclaration | null {
    let signature = this.cloneSignature(declaration.signature);
    if (!signature) return null;
    let body: Statement | null = null;
    if (declaration.body) {
      body = this.cloneStatement(declaration.body);
      if (!body) return null;
    }
    return new MethodDeclaration(
      ident(newName, declaration.name.range),
      declaration.decorators,
      declaration.flags & ~(CommonFlags.Generic | CommonFlags.GenericContext),
      null,
      signature,
      body,
      declaration.range
    );
  }

  private cloneSignature(signature: FunctionTypeNode): FunctionTypeNode | null {
    let parameters = new Array<ParameterNode>(signature.parameters.length);
    for (let i = 0, k = signature.parameters.length; i < k; ++i) {
      let parameter = signature.parameters[i];
      let type = this.substituteTypeNode(parameter.type);
      if (!type) return null;
      let initializer: Expression | null = null;
      if (parameter.initializer) {
        initializer = this.cloneExpression(parameter.initializer);
        if (!initializer) return null;
      }
      parameters[i] = new ParameterNode(
        parameter.parameterKind,
        parameter.name,
        type,
        initializer,
        parameter.range
      );
    }
    let returnType = this.substituteTypeNode(signature.returnType);
    if (!returnType) return null;
    let explicitThisType: NamedTypeNode | null = null;
    if (signature.explicitThisType) {
      let substituted = this.substituteTypeNode(signature.explicitThisType);
      if (!substituted || substituted.kind != NodeKind.NamedType) return null;
      explicitThisType = <NamedTypeNode>substituted;
    }
    return new FunctionTypeNode(
      parameters,
      returnType,
      explicitThisType,
      signature.isNullable,
      signature.range
    );
  }

  /** Replaces a type node mentioning a type parameter with the node
   *  spelling the concrete type, preserving the written nullability. */
  private substituteTypeNode(node: TypeNode): TypeNode | null {
    switch (node.kind) {
      case NodeKind.NamedType: {
        let named = <NamedTypeNode>node;
        let name = named.name;
        if (!name.next) {
          let arg = this.sub.get(name.identifier.text);
          if (arg) {
            let spelled = typeToTypeNode(arg, node.range);
            if (!spelled) {
              this.fail(`Generic async functions cannot use type '${arg.toString()}' yet`, node.range);
              return null;
            }
            if (named.isNullable && spelled.kind == NodeKind.NamedType) {
              (<NamedTypeNode>spelled).isNullable = true;
            } else if (named.isNullable && spelled.kind == NodeKind.FunctionType) {
              (<FunctionTypeNode>spelled).isNullable = true;
            }
            return spelled;
          }
        }
        let typeArguments: TypeNode[] | null = null;
        if (named.typeArguments) {
          typeArguments = new Array<TypeNode>(named.typeArguments.length);
          for (let i = 0, k = named.typeArguments.length; i < k; ++i) {
            let substituted = this.substituteTypeNode(named.typeArguments[i]);
            if (!substituted) return null;
            typeArguments[i] = substituted;
          }
        }
        return new NamedTypeNode(
          this.cloneTypeName(name),
          typeArguments,
          named.isNullable,
          node.range
        );
      }
      case NodeKind.FunctionType: {
        return this.cloneSignature(<FunctionTypeNode>node);
      }
      case NodeKind.TupleType: {
        let tuple = <TupleTypeNode>node;
        let elements = new Array<TypeNode>(tuple.elements.length);
        for (let i = 0, k = tuple.elements.length; i < k; ++i) {
          let substituted = this.substituteTypeNode(tuple.elements[i]);
          if (!substituted) return null;
          elements[i] = substituted;
        }
        return new TupleTypeNode(
          elements,
          tuple.elementNames,
          tuple.isNullable,
          node.range
        );
      }
      default: {
        this.fail(`Generic async functions with this type syntax are not yet supported`, node.range);
        return null;
      }
    }
  }

  /** Clones a type name, spelling a bare type parameter as its concrete
   *  type (`new T()` becomes `new Point()` when `T` is `Point`). */
  private cloneTypeName(name: TypeName): TypeName {
    if (!name.next) {
      let arg = this.sub.get(name.identifier.text);
      if (arg) {
        let spelled = typeToTypeNode(arg, name.range);
        if (spelled && spelled.kind == NodeKind.NamedType) {
          return (<NamedTypeNode>spelled).name;
        }
        // A non-class spelling (e.g. a function type) cannot name a
        // constructed type; the transform will fail loudly resolving it.
        return name;
      }
    }
    let next: TypeName | null = null;
    if (name.next) next = this.cloneTypeName(name.next);
    return new TypeName(name.identifier, next, name.range);
  }

  private cloneStatement(node: Statement): Statement | null {
    switch (node.kind) {
      case NodeKind.Block: {
        let block = <BlockStatement>node;
        let statements = new Array<Statement>(block.statements.length);
        for (let i = 0, k = block.statements.length; i < k; ++i) {
          let cloned = this.cloneStatement(block.statements[i]);
          if (!cloned) return null;
          statements[i] = cloned;
        }
        return new BlockStatement(statements, node.range);
      }
      case NodeKind.Expression: {
        let expr = this.cloneExpression((<ExpressionStatement>node).expression);
        if (!expr) return null;
        return new ExpressionStatement(expr);
      }
      case NodeKind.Return: {
        let stmt = <ReturnStatement>node;
        let value: Expression | null = null;
        if (stmt.value) {
          value = this.cloneExpression(stmt.value);
          if (!value) return null;
        }
        return new ReturnStatement(value, node.range);
      }
      case NodeKind.Variable: {
        let stmt = <VariableStatement>node;
        let declarations = new Array<VariableDeclaration>(stmt.declarations.length);
        for (let i = 0, k = stmt.declarations.length; i < k; ++i) {
          let declaration = stmt.declarations[i];
          let type: TypeNode | null = null;
          if (declaration.type) {
            type = this.substituteTypeNode(declaration.type);
            if (!type) return null;
          }
          let initializer: Expression | null = null;
          if (declaration.initializer) {
            initializer = this.cloneExpression(declaration.initializer);
            if (!initializer) return null;
          }
          declarations[i] = new VariableDeclaration(
            declaration.name,
            declaration.decorators,
            declaration.flags,
            type,
            initializer,
            declaration.range
          );
        }
        return new VariableStatement(stmt.decorators, declarations, node.range);
      }
      case NodeKind.If: {
        let stmt = <IfStatement>node;
        let condition = this.cloneExpression(stmt.condition);
        if (!condition) return null;
        let ifTrue = this.cloneStatement(stmt.ifTrue);
        if (!ifTrue) return null;
        let ifFalse: Statement | null = null;
        if (stmt.ifFalse) {
          ifFalse = this.cloneStatement(stmt.ifFalse);
          if (!ifFalse) return null;
        }
        return new IfStatement(condition, ifTrue, ifFalse, node.range);
      }
      case NodeKind.While: {
        let stmt = <WhileStatement>node;
        let condition = this.cloneExpression(stmt.condition);
        if (!condition) return null;
        let body = this.cloneStatement(stmt.body);
        if (!body) return null;
        return new WhileStatement(condition, body, node.range);
      }
      case NodeKind.For: {
        let stmt = <ForStatement>node;
        let initializer: Statement | null = null;
        if (stmt.initializer) {
          initializer = this.cloneStatement(stmt.initializer);
          if (!initializer) return null;
        }
        let condition: Expression | null = null;
        if (stmt.condition) {
          condition = this.cloneExpression(stmt.condition);
          if (!condition) return null;
        }
        let incrementor: Expression | null = null;
        if (stmt.incrementor) {
          incrementor = this.cloneExpression(stmt.incrementor);
          if (!incrementor) return null;
        }
        let body = this.cloneStatement(stmt.body);
        if (!body) return null;
        return new ForStatement(initializer, condition, incrementor, body, node.range);
      }
      case NodeKind.Do: {
        let stmt = <DoStatement>node;
        let body = this.cloneStatement(stmt.body);
        if (!body) return null;
        let condition = this.cloneExpression(stmt.condition);
        if (!condition) return null;
        return new DoStatement(body, condition, node.range);
      }
      case NodeKind.ForOf: {
        let stmt = <ForOfStatement>node;
        let variable = this.cloneStatement(stmt.variable);
        if (!variable) return null;
        let iterable = this.cloneExpression(stmt.iterable);
        if (!iterable) return null;
        let body = this.cloneStatement(stmt.body);
        if (!body) return null;
        return new ForOfStatement(variable, iterable, body, node.range);
      }
      case NodeKind.Switch: {
        let stmt = <SwitchStatement>node;
        let condition = this.cloneExpression(stmt.condition);
        if (!condition) return null;
        let cases = new Array<SwitchCase>(stmt.cases.length);
        for (let i = 0, k = stmt.cases.length; i < k; ++i) {
          let switchCase = stmt.cases[i];
          let label: Expression | null = null;
          if (switchCase.label) {
            label = this.cloneExpression(switchCase.label);
            if (!label) return null;
          }
          let statements = new Array<Statement>(switchCase.statements.length);
          for (let j = 0, l = switchCase.statements.length; j < l; ++j) {
            let cloned = this.cloneStatement(switchCase.statements[j]);
            if (!cloned) return null;
            statements[j] = cloned;
          }
          cases[i] = new SwitchCase(label, statements, switchCase.range);
        }
        return new SwitchStatement(condition, cases, node.range);
      }
      case NodeKind.Try: {
        let stmt = <TryStatement>node;
        let bodyStatements = new Array<Statement>(stmt.bodyStatements.length);
        for (let i = 0, k = stmt.bodyStatements.length; i < k; ++i) {
          let cloned = this.cloneStatement(stmt.bodyStatements[i]);
          if (!cloned) return null;
          bodyStatements[i] = cloned;
        }
        let catchStatements: Statement[] | null = null;
        if (stmt.catchStatements) {
          catchStatements = new Array<Statement>(stmt.catchStatements.length);
          for (let i = 0, k = stmt.catchStatements.length; i < k; ++i) {
            let cloned = this.cloneStatement(stmt.catchStatements[i]);
            if (!cloned) return null;
            catchStatements[i] = cloned;
          }
        }
        let finallyStatements: Statement[] | null = null;
        if (stmt.finallyStatements) {
          finallyStatements = new Array<Statement>(stmt.finallyStatements.length);
          for (let i = 0, k = stmt.finallyStatements.length; i < k; ++i) {
            let cloned = this.cloneStatement(stmt.finallyStatements[i]);
            if (!cloned) return null;
            finallyStatements[i] = cloned;
          }
        }
        return new TryStatement(
          bodyStatements,
          stmt.catchVariable,
          catchStatements,
          finallyStatements,
          node.range
        );
      }
      case NodeKind.Throw: {
        let value = this.cloneExpression((<ThrowStatement>node).value);
        if (!value) return null;
        return new ThrowStatement(value, node.range);
      }
      case NodeKind.Break: {
        return new BreakStatement((<BreakStatement>node).label, node.range);
      }
      case NodeKind.Continue: {
        return new ContinueStatement((<ContinueStatement>node).label, node.range);
      }
      case NodeKind.Empty: {
        return new EmptyStatement(node.range);
      }
      default: {
        this.fail(`Generic async functions with this statement are not yet supported`, node.range);
        return null;
      }
    }
  }

  private cloneExpression(node: Expression): Expression | null {
    switch (node.kind) {
      case NodeKind.Identifier:
      case NodeKind.This:
      case NodeKind.Super:
      case NodeKind.True:
      case NodeKind.False:
      case NodeKind.Null: {
        return node;
      }
      case NodeKind.PropertyAccess: {
        let access = <PropertyAccessExpression>node;
        let object = this.cloneExpression(access.expression);
        if (!object) return null;
        return new PropertyAccessExpression(object, access.property, node.range);
      }
      case NodeKind.ElementAccess: {
        let access = <ElementAccessExpression>node;
        let object = this.cloneExpression(access.expression);
        if (!object) return null;
        let element = this.cloneExpression(access.elementExpression);
        if (!element) return null;
        return new ElementAccessExpression(object, element, node.range);
      }
      case NodeKind.Call: {
        let call = <CallExpression>node;
        let callee = this.cloneExpression(call.expression);
        if (!callee) return null;
        let typeArguments: TypeNode[] | null = null;
        if (call.typeArguments) {
          typeArguments = new Array<TypeNode>(call.typeArguments.length);
          for (let i = 0, k = call.typeArguments.length; i < k; ++i) {
            let substituted = this.substituteTypeNode(call.typeArguments[i]);
            if (!substituted) return null;
            typeArguments[i] = substituted;
          }
        }
        let args = new Array<Expression>(call.args.length);
        for (let i = 0, k = call.args.length; i < k; ++i) {
          let cloned = this.cloneExpression(call.args[i]);
          if (!cloned) return null;
          args[i] = cloned;
        }
        return new CallExpression(callee, typeArguments, args, node.range);
      }
      case NodeKind.New: {
        let expr = <NewExpression>node;
        let typeArguments: TypeNode[] | null = null;
        if (expr.typeArguments) {
          typeArguments = new Array<TypeNode>(expr.typeArguments.length);
          for (let i = 0, k = expr.typeArguments.length; i < k; ++i) {
            let substituted = this.substituteTypeNode(expr.typeArguments[i]);
            if (!substituted) return null;
            typeArguments[i] = substituted;
          }
        }
        let args = new Array<Expression>(expr.args.length);
        for (let i = 0, k = expr.args.length; i < k; ++i) {
          let cloned = this.cloneExpression(expr.args[i]);
          if (!cloned) return null;
          args[i] = cloned;
        }
        return new NewExpression(this.cloneTypeName(expr.typeName), typeArguments, args, node.range);
      }
      case NodeKind.Binary: {
        let binary = <BinaryExpression>node;
        let left = this.cloneExpression(binary.left);
        if (!left) return null;
        let right = this.cloneExpression(binary.right);
        if (!right) return null;
        return new BinaryExpression(binary.operator, left, right, node.range);
      }
      case NodeKind.UnaryPrefix: {
        let unary = <UnaryPrefixExpression>node;
        let operand = this.cloneExpression(unary.operand);
        if (!operand) return null;
        return new UnaryPrefixExpression(unary.operator, operand, node.range);
      }
      case NodeKind.UnaryPostfix: {
        let unary = <UnaryPostfixExpression>node;
        let operand = this.cloneExpression(unary.operand);
        if (!operand) return null;
        return new UnaryPostfixExpression(unary.operator, operand, node.range);
      }
      case NodeKind.Ternary: {
        let ternary = <TernaryExpression>node;
        let condition = this.cloneExpression(ternary.condition);
        if (!condition) return null;
        let ifThen = this.cloneExpression(ternary.ifThen);
        if (!ifThen) return null;
        let ifElse = this.cloneExpression(ternary.ifElse);
        if (!ifElse) return null;
        return new TernaryExpression(condition, ifThen, ifElse, node.range);
      }
      case NodeKind.Assertion: {
        let assertion = <AssertionExpression>node;
        let expr = this.cloneExpression(assertion.expression);
        if (!expr) return null;
        let toType: TypeNode | null = null;
        if (assertion.toType) {
          toType = this.substituteTypeNode(assertion.toType);
          if (!toType) return null;
        }
        return new AssertionExpression(assertion.assertionKind, expr, toType, node.range);
      }
      case NodeKind.Parenthesized: {
        let expr = this.cloneExpression((<ParenthesizedExpression>node).expression);
        if (!expr) return null;
        return new ParenthesizedExpression(expr, node.range);
      }
      case NodeKind.Comma: {
        let comma = <CommaExpression>node;
        let exprs = new Array<Expression>(comma.expressions.length);
        for (let i = 0, k = comma.expressions.length; i < k; ++i) {
          let cloned = this.cloneExpression(comma.expressions[i]);
          if (!cloned) return null;
          exprs[i] = cloned;
        }
        return new CommaExpression(exprs, node.range);
      }
      case NodeKind.InstanceOf: {
        let instanceOf = <InstanceOfExpression>node;
        let expr = this.cloneExpression(instanceOf.expression);
        if (!expr) return null;
        let isType = this.substituteTypeNode(instanceOf.isType);
        if (!isType) return null;
        return new InstanceOfExpression(expr, isType, node.range);
      }
      case NodeKind.Await: {
        let operand = this.cloneExpression((<AwaitExpression>node).operand);
        if (!operand) return null;
        return new AwaitExpression(operand, node.range);
      }
      case NodeKind.Function: {
        let declaration = (<FunctionExpression>node).declaration;
        if (declaration.typeParameters && declaration.typeParameters.length > 0) {
          this.fail(`Generic async functions with generic closures are not yet supported`, node.range);
          return null;
        }
        let cloned = this.cloneFunctionDeclaration(declaration, declaration.name.text);
        if (!cloned) return null;
        return new FunctionExpression(cloned);
      }
      case NodeKind.Class: {
        let cloned = this.cloneClassDeclaration((<ClassExpression>node).declaration);
        if (!cloned) return null;
        return new ClassExpression(cloned);
      }
      case NodeKind.Literal: {
        if (node instanceof ArrayLiteralExpression) {
          let elements = new Array<Expression>(node.elementExpressions.length);
          for (let i = 0, k = node.elementExpressions.length; i < k; ++i) {
            let cloned = this.cloneExpression(node.elementExpressions[i]);
            if (!cloned) return null;
            elements[i] = cloned;
          }
          return new ArrayLiteralExpression(elements, node.range);
        }
        if (node instanceof ObjectLiteralExpression) {
          let values = new Array<Expression>(node.values.length);
          for (let i = 0, k = node.values.length; i < k; ++i) {
            let cloned = this.cloneExpression(node.values[i]);
            if (!cloned) return null;
            values[i] = cloned;
          }
          return new ObjectLiteralExpression(node.names, values, node.range);
        }
        if (node instanceof TemplateLiteralExpression) {
          let tag: Expression | null = null;
          if (node.tag) {
            tag = this.cloneExpression(node.tag);
            if (!tag) return null;
          }
          let exprs = new Array<Expression>(node.expressions.length);
          for (let i = 0, k = node.expressions.length; i < k; ++i) {
            let cloned = this.cloneExpression(node.expressions[i]);
            if (!cloned) return null;
            exprs[i] = cloned;
          }
          return new TemplateLiteralExpression(tag, node.parts, node.rawParts, exprs, node.range);
        }
        return node;
      }
      default: {
        this.fail(`Generic async functions with this expression are not yet supported`, node.range);
        return null;
      }
    }
  }

  /** Clones a class expression's declaration with substitution. A generic
   *  class expression cannot be monomorphized this way (its type
   *  parameters have no arguments here), so it fails loudly. */
  private cloneClassDeclaration(declaration: ClassDeclaration): ClassDeclaration | null {
    if (declaration.typeParameters && declaration.typeParameters.length > 0) {
      this.fail(`Generic async functions with generic class expressions are not yet supported`, declaration.range);
      return null;
    }
    let extendsType: NamedTypeNode | null = null;
    if (declaration.extendsType) {
      let substituted = this.substituteTypeNode(declaration.extendsType);
      if (!substituted || substituted.kind != NodeKind.NamedType) return null;
      extendsType = <NamedTypeNode>substituted;
    }
    let implementsTypes: NamedTypeNode[] | null = null;
    if (declaration.implementsTypes) {
      implementsTypes = new Array<NamedTypeNode>(declaration.implementsTypes.length);
      for (let i = 0, k = declaration.implementsTypes.length; i < k; ++i) {
        let substituted = this.substituteTypeNode(declaration.implementsTypes[i]);
        if (!substituted || substituted.kind != NodeKind.NamedType) return null;
        implementsTypes[i] = <NamedTypeNode>substituted;
      }
    }
    let members = new Array<DeclarationStatement>(declaration.members.length);
    for (let i = 0, k = declaration.members.length; i < k; ++i) {
      let member = declaration.members[i];
      if (member.kind == NodeKind.FieldDeclaration) {
        let field = <FieldDeclaration>member;
        let type: TypeNode | null = null;
        if (field.type) {
          type = this.substituteTypeNode(field.type);
          if (!type) return null;
        }
        let initializer: Expression | null = null;
        if (field.initializer) {
          initializer = this.cloneExpression(field.initializer);
          if (!initializer) return null;
        }
        members[i] = new FieldDeclaration(
          field.name,
          field.decorators,
          field.flags,
          type,
          initializer,
          field.parameterIndex,
          field.range
        );
      } else if (member.kind == NodeKind.MethodDeclaration) {
        let cloned = this.cloneMethodDeclaration(<MethodDeclaration>member, (<MethodDeclaration>member).name.text);
        if (!cloned) return null;
        members[i] = cloned;
      } else {
        this.fail(`Generic async functions with this class member are not yet supported`, member.range);
        return null;
      }
    }
    return new ClassDeclaration(
      declaration.name,
      declaration.decorators,
      declaration.flags & ~(CommonFlags.Generic | CommonFlags.GenericContext),
      null,
      extendsType,
      implementsTypes,
      members,
      declaration.range
    );
  }
}

/** Reports a per-instantiation failure on the generic declaration and
 *  marks the prototype rejected, so the compiler guard fails silently
 *  instead of doubling the diagnostic. */
function failGeneric(
  program: Program,
  prototype: FunctionPrototype,
  message: string
): void {
  program.error(
    DiagnosticCode.Not_implemented_0,
    prototype.identifierNode.range,
    message
  );
  program.rejectedAsyncFunctions.add(prototype);
}

/** Resolves the clone's instance: the bound clone for a method (the
 *  resolver asserts on unbound instance-method prototypes), the clone
 *  itself for a function. */
function resolveCloneInstance(
  program: Program,
  clone: FunctionPrototype,
  classInstance: Class | null
): Function | null {
  let prototype = clone;
  if (classInstance) {
    prototype = clone.toBound(classInstance);
  }
  return program.resolver.resolveFunction(prototype, null, new Map(), ReportMode.Swallow);
}

/** Transforms one instantiation of a generic async function or method:
 *  clones the declaration with concrete types, registers the clone, and
 *  runs the per-item pipeline (this-lift, env-lift, core) on it. Returns
 *  the clone's instance, or `null` when the instantiation cannot be
 *  transformed (a specific diagnostic was already reported and the
 *  prototype marked rejected). The clone is registered before its
 *  transform runs, so a recursive instantiation finds the same clone.
 *
 *  `typeArguments` are the function's own type arguments (or `null`);
 *  `classInstance` is the bound class for a method (or `null`). */
export function ensureAsyncGenericInstance(
  program: Program,
  prototype: FunctionPrototype,
  typeArguments: Type[] | null,
  classInstance: Class | null
): Function | null {
  let declaration = <FunctionDeclaration>prototype.declaration;
  let isMethod = prototype.is(CommonFlags.Instance);
  if (
    declaration.kind == NodeKind.MethodDeclaration &&
    !isMethod
  ) {
    // Static async methods are not transformed at all today (the
    // compiler guard rejects them); the generic form is no different.
    failGeneric(program, prototype, "Async static methods are not yet supported");
    return null;
  }
  let classArgs = classInstance ? classInstance.typeArguments : null;
  let combined = new Array<Type>();
  if (classArgs) {
    for (let i = 0, k = classArgs.length; i < k; ++i) combined.push(classArgs[i]);
  }
  if (typeArguments) {
    for (let i = 0, k = typeArguments.length; i < k; ++i) combined.push(typeArguments[i]);
  }
  let key = typesToString(combined);
  let byArgs = program.asyncGenericInstances.get(declaration);
  if (byArgs) {
    let existing = byArgs.get(key);
    if (existing) return resolveCloneInstance(program, existing, classInstance);
  }
  let sub = new Map<string, Type>();
  if (classInstance) {
    let classParams = classInstance.prototype.typeParameterNodes;
    if (classParams && classArgs) {
      for (let i = 0, k = classParams.length; i < k; ++i) {
        sub.set(classParams[i].name.text, classArgs[i]);
      }
    }
  }
  let fnParams = prototype.typeParameterNodes;
  if (fnParams && typeArguments) {
    for (let i = 0, k = fnParams.length; i < k; ++i) {
      sub.set(fnParams[i].name.text, typeArguments[i]);
    }
  }
  let receiverClass: ClassPrototype | null = null;
  let mangled: string;
  let qualName: string;
  let registerParent: Element;
  let genParent: Element;
  if (isMethod) {
    receiverClass = assert(classInstance).prototype;
    mangled = mangleGenericName(prototype.name, combined);
    qualName = `${receiverClass.name}_${mangled}`;
    registerParent = receiverClass;
    genParent = receiverClass.parent;
  } else {
    mangled = mangleGenericName(prototype.name, combined);
    qualName = mangled;
    registerParent = prototype.parent;
    genParent = prototype.parent;
  }
  let file = owningFile(prototype);
  if (!file) {
    failGeneric(program, prototype, "Generic async functions without an owning file are not yet supported");
    return null;
  }
  let aliases = program.asyncFileAliases.get(file.internalName);
  if (!aliases) {
    failGeneric(program, prototype, "Generic async functions could not be transformed: the file was not scanned");
    return null;
  }
  let fail: AsyncFail = (message: string, range): void => {
    program.error(DiagnosticCode.Not_implemented_0, range, message);
  };
  let cloner = new GenericCloner(sub, fail);
  let cloneDeclaration: FunctionDeclaration | null;
  if (isMethod) {
    cloneDeclaration = cloner.cloneMethodDeclaration(<MethodDeclaration>declaration, mangled);
  } else {
    cloneDeclaration = cloner.cloneFunctionDeclaration(<FunctionDeclaration>declaration, mangled);
  }
  if (!cloneDeclaration) {
    program.rejectedAsyncFunctions.add(prototype);
    return null;
  }
  if (!program.initializeGeneratedDeclaration(cloneDeclaration, registerParent)) {
    failGeneric(program, prototype, `Generated name '${mangled}' collides with an existing declaration`);
    return null;
  }
  // Instance methods live in the class's instanceMembers, not in members,
  // so they are looked up there; plain functions live in the parent's members.
  let clone: DeclaredElement | null;
  if (isMethod) {
    let instanceMembers = (<ClassPrototype>registerParent).instanceMembers;
    clone = instanceMembers ? (instanceMembers.get(mangled) || null) : null;
  } else {
    clone = registerParent.getMember(mangled);
  }
  let cloneElement = assert(clone);
  if (cloneElement.kind != ElementKind.FunctionPrototype) {
    failGeneric(program, prototype, `Generated name '${mangled}' collides with an existing declaration`);
    return null;
  }
  let clonePrototype = <FunctionPrototype>cloneElement;
  program.asyncGenericCloneDeclarations.add(cloneDeclaration);
  if (!byArgs) {
    byArgs = new Map();
    program.asyncGenericInstances.set(declaration, byArgs);
  }
  byArgs.set(key, clonePrototype);
  // The clone must also be visible as a member of the class instance it
  // was bound to: the entry export calls `receiver.<mangled>(...)`, and
  // the instance's member map was built when the class was resolved,
  // before the clone existed (resolveClass binds prototype members into
  // the instance the same way).
  if (isMethod && classInstance) {
    classInstance.add(mangled, clonePrototype.toBound(classInstance));
  }
  let item: TransformWorkItem = {
    prototype: clonePrototype,
    isMethod,
    isStatic: false,
    receiverClass,
    boundClass: isMethod ? classInstance : null,
    genParent,
    qualName,
    selfName: null,
    forbidden: new Set<string>(),
    isExtracted: false
  };
  let worklist = new Array<TransformWorkItem>();
  worklist.push(item);
  for (let w = 0; w < worklist.length; ++w) {
    transformAsyncWorkItem(program, file, worklist[w], aliases, worklist);
  }
  // The transform records the bound prototype for methods (the prototype
  // it bound to the resolved class), the clone itself for functions.
  let boundPrototype = classInstance
    ? clonePrototype.toBound(classInstance)
    : clonePrototype;
  if (program.transformedAsyncFunctions.has(boundPrototype)) {
    let instance = program.resolver.resolveFunction(boundPrototype, null, new Map(), ReportMode.Swallow);
    if (instance) return instance;
  }
  // The transform rejected the clone (the specific diagnostic was already
  // reported) or punted (e.g. an unresolvable type in the body for these
  // arguments): mark the generic prototype rejected so the compiler guard
  // fails silently instead of doubling the diagnostic.
  program.rejectedAsyncFunctions.add(prototype);
  return null;
}
