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
  ClassExpression,
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
  Range
} from "./diagnostics";

import {
  CommonFlags
} from "./common";

import {
  Program,
  FunctionPrototype
} from "./program";

import {
  ASYNC_THIS_NAME,
  AsyncFail,
  ident
} from "./asyncRewrite";

/** Rewrites `this`/`super` in one async body. Returns `false` when a
 *  failure was reported through `fail`. `allowReceiverParam` permits a
 *  leading `__async_this` parameter: the generated receiver parameter of
 *  an extracted async arrow, whose body was already lifted. */
export function liftThisInAsyncBody(
  program: Program,
  prototype: FunctionPrototype,
  fail: AsyncFail,
  allowReceiverParam: bool = false
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
  let walker = new ThisWalker(program, fail, hasReceiver, isStatic);
  return walker.walkStatement(bodyNode);
}

class ThisWalker {
  constructor(
    private program: Program,
    private fail: AsyncFail,
    private hasReceiver: bool,
    private isStatic: bool
  ) {}

  private failThis(range: Range): bool {
    this.fail(
      this.isStatic
        ? "'this' in static async methods is not yet supported"
        : "'this' in async functions is not yet supported",
      range
    );
    return false;
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
          if (declaration.name.text == ASYNC_THIS_NAME) {
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
          && (!stmt.ifElse || this.walkStatement(stmt.ifElse));
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
        if (stmt.catchVariable && stmt.catchVariable.text == ASYNC_THIS_NAME) {
          this.fail(`'${ASYNC_THIS_NAME}' is reserved for the CPS transform and cannot be a catch variable`, stmt.catchVariable.range);
          return false;
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
        if (!this.hasReceiver) {
          this.failThis(node.range);
          return null;
        }
        return ident(ASYNC_THIS_NAME, node.range);
      }
      case NodeKind.Super: {
        this.fail("'super' in async functions is not yet supported", node.range);
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
        let call = <CallExpression>node;
        let callee = this.walkExpression(call.expression);
        if (!callee) return null;
        call.expression = callee;
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
        let operand = this.walkExpression(unary.operand);
        if (!operand) return null;
        unary.operand = operand;
        return unary;
      }
      case NodeKind.UnaryPostfix: {
        let unary = <UnaryPostfixExpression>node;
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
          if (parameters[i].name.text == ASYNC_THIS_NAME) {
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
