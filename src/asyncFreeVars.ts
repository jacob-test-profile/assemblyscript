/**
 * @fileoverview Scope-aware free-variable scan for one function body.
 * Shared by the nested-closure (Group 3a item 3) and arrow-capture
 * (item 2) work: walks a function body, tracks its own bindings, and
 * returns the names it references from outside, classified by a caller
 * callback (async-fn frame / enclosing-closure frame / unbound). The
 * scan is read-only and stops at nested function boundaries: a nested
 * function's references are that function's own free variables, not
 * this body's.
 * @license Apache-2.0
 */

import {
  NodeKind,
  Statement,
  Expression,
  IdentifierExpression,
  FunctionDeclaration,
  BlockStatement,
  VariableStatement,
  ExpressionStatement,
  ReturnStatement,
  IfStatement,
  WhileStatement,
  DoStatement,
  ForStatement,
  ForOfStatement,
  SwitchStatement,
  TryStatement,
  ThrowStatement,
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
  AwaitExpression,
  TemplateLiteralExpression,
  ArrayLiteralExpression,
  ObjectLiteralExpression
} from "./ast";

import {
  Token
} from "./tokenizer";

import {
  Range
} from "./diagnostics";

import {
  unwrapParens
} from "./asyncRewrite";

/** Where a free variable is bound: the async function's own scope, an
 *  enclosing closure's scope, or nowhere (a global / import). */
export type FreeVarKind = "async" | "closure" | "global";

export interface FreeVarInfo {
  name: string;
  /** Whether the body writes to the name (assignment, compound
   *  assignment, `++`/`--`). A written capture cannot be shared
   *  by value. */
  written: bool;
  /** Range of the first reference, for diagnostics. */
  range: Range;
  kind: FreeVarKind;
}

/** Classifies a name the scanned body does not bind itself. */
export type FreeVarClassifier = (name: string) => FreeVarKind;

/** Scans one function declaration's body for free variables. The
 *  declaration's own parameters are bound, not free. */
export function scanFunctionFreeVars(
  declaration: FunctionDeclaration,
  classify: FreeVarClassifier
): FreeVarInfo[] {
  let scanner = new FreeVarScanner(classify);
  let parameters = declaration.signature.parameters;
  for (let i = 0, k = parameters.length; i < k; ++i) {
    scanner.declare(parameters[i].name.text);
  }
  let body = declaration.body;
  if (body) scanner.walkStatement(body);
  return scanner.freeVars();
}

class FreeVarScanner {
  private free = new Map<string, FreeVarInfo>();
  private scopes: Set<string>[] = [ new Set<string>() ];

  constructor(
    private classify: FreeVarClassifier
  ) {}

  freeVars(): FreeVarInfo[] {
    let out = new Array<FreeVarInfo>();
    let keys = Map_keys(this.free);
    for (let i = 0, k = keys.length; i < k; ++i) {
      out.push(this.free.get(keys[i])!);
    }
    return out;
  }

  declare(name: string): void {
    this.scopes[this.scopes.length - 1].add(name);
  }

  private isBound(name: string): bool {
    for (let i = this.scopes.length - 1; i >= 0; --i) {
      if (this.scopes[i].has(name)) return true;
    }
    return false;
  }

  private reference(name: string, range: Range, written: bool): void {
    if (this.isBound(name)) return;
    let existing = this.free.get(name);
    if (existing) {
      if (written) existing.written = true;
      return;
    }
    this.free.set(name, {
      name,
      written,
      range,
      kind: this.classify(name)
    });
  }

  private prescan(statements: Statement[]): void {
    for (let i = 0, k = statements.length; i < k; ++i) {
      let statement = statements[i];
      if (statement.kind == NodeKind.Variable) {
        let declarations = (<VariableStatement>statement).declarations;
        for (let j = 0, l = declarations.length; j < l; ++j) {
          this.declare(declarations[j].name.text);
        }
      }
    }
  }

  walkStatement(node: Statement): void {
    switch (node.kind) {
      case NodeKind.Block: {
        this.scopes.push(new Set<string>());
        let statements = (<BlockStatement>node).statements;
        this.prescan(statements);
        for (let i = 0, k = statements.length; i < k; ++i) this.walkStatement(statements[i]);
        this.scopes.pop();
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
        this.scopes.push(new Set<string>());
        if (stmt.initializer) {
          this.prescan([ stmt.initializer ]);
          this.walkStatement(stmt.initializer);
        }
        if (stmt.condition) this.walkExpression(stmt.condition);
        if (stmt.incrementor) this.walkExpression(stmt.incrementor);
        this.walkStatement(stmt.body);
        this.scopes.pop();
        return;
      }
      case NodeKind.ForOf: {
        let stmt = <ForOfStatement>node;
        this.scopes.push(new Set<string>());
        this.prescan([ stmt.variable ]);
        this.walkStatement(stmt.variable);
        this.walkExpression(stmt.iterable);
        this.walkStatement(stmt.body);
        this.scopes.pop();
        return;
      }
      case NodeKind.Switch: {
        let stmt = <SwitchStatement>node;
        this.scopes.push(new Set<string>());
        let cases = stmt.cases;
        for (let i = 0, k = cases.length; i < k; ++i) {
          this.prescan(cases[i].statements);
        }
        this.walkExpression(stmt.condition);
        for (let i = 0, k = cases.length; i < k; ++i) {
          let switchCase = cases[i];
          if (switchCase.label) this.walkExpression(switchCase.label);
          let statements = switchCase.statements;
          for (let j = 0, l = statements.length; j < l; ++j) this.walkStatement(statements[j]);
        }
        this.scopes.pop();
        return;
      }
      case NodeKind.Try: {
        let stmt = <TryStatement>node;
        this.scopes.push(new Set<string>());
        this.prescan(stmt.bodyStatements);
        let bodyStatements = stmt.bodyStatements;
        for (let i = 0, k = bodyStatements.length; i < k; ++i) this.walkStatement(bodyStatements[i]);
        this.scopes.pop();
        if (stmt.catchStatements) {
          this.scopes.push(new Set<string>());
          if (stmt.catchVariable) this.declare(stmt.catchVariable.text);
          this.prescan(stmt.catchStatements);
          let catchStatements = stmt.catchStatements;
          for (let i = 0, k = catchStatements.length; i < k; ++i) this.walkStatement(catchStatements[i]);
          this.scopes.pop();
        }
        if (stmt.finallyStatements) {
          this.scopes.push(new Set<string>());
          this.prescan(stmt.finallyStatements);
          let finallyStatements = stmt.finallyStatements;
          for (let i = 0, k = finallyStatements.length; i < k; ++i) this.walkStatement(finallyStatements[i]);
          this.scopes.pop();
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
      case NodeKind.Identifier: {
        this.reference((<IdentifierExpression>node).text, node.range, false);
        return;
      }
      case NodeKind.PropertyAccess: {
        this.walkExpression((<PropertyAccessExpression>node).expression);
        return;
      }
      case NodeKind.ElementAccess: {
        let access = <ElementAccessExpression>node;
        this.walkExpression(access.expression);
        this.walkExpression(access.elementExpression);
        return;
      }
      case NodeKind.Call: {
        let call = <CallExpression>node;
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
          let left = unwrapParens(binary.left);
          if (left.kind == NodeKind.Identifier) {
            this.reference((<IdentifierExpression>left).text, left.range, true);
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
        let operand = unwrapParens(unary.operand);
        if ((unary.operator == Token.Plus_Plus || unary.operator == Token.Minus_Minus)
          && operand.kind == NodeKind.Identifier) {
          this.reference((<IdentifierExpression>operand).text, operand.range, true);
          return;
        }
        this.walkExpression(unary.operand);
        return;
      }
      case NodeKind.UnaryPostfix: {
        let unary = <UnaryPostfixExpression>node;
        let operand = unwrapParens(unary.operand);
        if ((unary.operator == Token.Plus_Plus || unary.operator == Token.Minus_Minus)
          && operand.kind == NodeKind.Identifier) {
          this.reference((<IdentifierExpression>operand).text, operand.range, true);
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
        // A nested function is its own scope; its references are not
        // this body's free variables.
        return;
      }
      case NodeKind.Class: {
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
