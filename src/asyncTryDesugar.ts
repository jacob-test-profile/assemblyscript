/**
 * @fileoverview AST desugar for try/catch/finally in async functions (CPS
 * Phase 1, chunk 2). Runs at the end of `Program.initialize()`, before the
 * state-machine transform consumes the bodies: each `try` becomes an
 * explicit flag-and-dispatch shape the core already understands (prologue
 * error locals, a `while (true)` wrapper with a settled check after every
 * body statement, a catch dispatch, the finally statements, and a dispatch
 * that propagates the error or executes a pending return/break/continue).
 * No `try` survives to the core; a `throw` survives only as the "fail the
 * task" primitive the core lowers with `emitFail`. See STATUS-chunk2.md.
 * @license Apache-2.0
 */

import {
  NodeKind,
  Statement,
  Expression,
  TypeNode,
  NamedTypeNode,
  SourceKind,
  BlockStatement,
  BreakStatement,
  ContinueStatement,
  ExpressionStatement,
  ReturnStatement,
  SwitchStatement,
  VariableStatement,
  VariableDeclaration,
  IfStatement,
  WhileStatement,
  ForStatement,
  DoStatement,
  ForOfStatement,
  TryStatement,
  ThrowStatement,
  FunctionDeclaration,
  FunctionExpression,
  ClassExpression,
  ClassDeclaration,
  AwaitExpression,
  NewExpression,
  BinaryExpression,
  UnaryPrefixExpression,
  TernaryExpression,
  CommaExpression,
  ParenthesizedExpression,
  CallExpression,
  PropertyAccessExpression,
  ElementAccessExpression,
  UnaryPostfixExpression,
  AssertionExpression,
  InstanceOfExpression,
  ArrayLiteralExpression,
  ObjectLiteralExpression,
  TemplateLiteralExpression,
  TrueExpression,
  FalseExpression
} from "./ast";

import {
  Range,
  DiagnosticCode
} from "./diagnostics";

import {
  Token
} from "./tokenizer";

import {
  CommonFlags
} from "./common";

import {
  TypeKind
} from "./types";

import {
  Program,
  File,
  FunctionPrototype,
  ClassPrototype,
  Element,
  ElementKind
} from "./program";

import {
  ReportMode
} from "./resolver";

import {
  ident,
  intLit,
  strLit,
  assignExpr,
  exprStmt,
  blockStmt,
  namedType,
  containsAwait,
  promiseInnerNode,
  typeToTypeNode
} from "./asyncRewrite";

/** Where a coordinator rejection of an await should land: the enclosing
 *  try's error locals, resolved to state fields by the core at site
 *  creation. `null` (no record) means terminal task failure. */
export interface AsyncTryRejectTarget {
  errorVar: string;
  flagVar: string;
  /** Desugar locals a rejection of this await must clear first: the
   *  error flags of the finallys the rejection escapes, plus the pending
   *  return/break/continue flags when any finally is escaped. A rejection
   *  is a transfer out of the finally, like a sync `throw` there, so the
   *  pending outcome it replaces must not survive (the desugar's
   *  `clearTransfers` does the same for sync transfers). Empty for
   *  awaits outside a finally. */
  clearVars: string[];
}

/** Reject targets recorded by the desugar, keyed by file + await offset.
 *  Cleared at the start of every run; the core reads it synchronously
 *  within the same `Program.initialize()`, so no entry outlives its run. */
const rejectTargets = new Map<string, AsyncTryRejectTarget>();

export function rejectTargetFor(file: File, range: Range): AsyncTryRejectTarget | null {
  let target = rejectTargets.get(file.internalName + ":" + range.start.toString());
  return target ? target : null;
}

/** Desugars try/catch/finally in every async function of the program.
 *  Functions the desugar rejects are marked in
 *  `rejectedAsyncFunctions` so the core skips them without doubling the
 *  diagnostic. */
export function desugarAsyncTryStatements(program: Program): void {
  rejectTargets.clear();
  let files = Map_values(program.filesByName);
  for (let i = 0, k = files.length; i < k; ++i) {
    let file = files[i];
    if (file.source.sourceKind == SourceKind.LibraryEntry) continue;
    let functions = new Array<FunctionPrototype>();
    collectAsyncFunctions(file, functions);
    for (let j = 0, l = functions.length; j < l; ++j) {
      let desugar = new TryDesugar(program, file, functions[j]);
      if (!desugar.run()) {
        program.rejectedAsyncFunctions.add(functions[j]);
      }
    }
  }
}

function collectAsyncFunctions(element: Element, out: FunctionPrototype[]): void {
  let members = element.members;
  if (!members) return;
  let values = Map_values(members);
  for (let i = 0, k = values.length; i < k; ++i) {
    let member = values[i];
    if (member.kind == ElementKind.FunctionPrototype && member.is(CommonFlags.Async)) {
      let prototype = <FunctionPrototype>member;
      if (prototype.declaration.kind == NodeKind.FunctionDeclaration
        || prototype.declaration.kind == NodeKind.MethodDeclaration) out.push(prototype);
    } else if (member.kind == ElementKind.Namespace) {
      collectAsyncFunctions(member, out);
    } else if (member.kind == ElementKind.ClassPrototype) {
      // Instance methods only, mirroring the transform's collector.
      // The desugar adds no `this`, so the later lifts need no accommodation.
      let prototype = <ClassPrototype>member;
      let instanceMembers = prototype.instanceMembers;
      if (instanceMembers) {
        let instanceValues = Map_values(instanceMembers);
        for (let j = 0, l = instanceValues.length; j < l; ++j) {
          let instanceMember = instanceValues[j];
          if (instanceMember.kind == ElementKind.FunctionPrototype && instanceMember.is(CommonFlags.Async)) {
            out.push(<FunctionPrototype>instanceMember);
          }
        }
      }
    }
  }
}

/** One enclosing try whose body is being desugared. */
class TryFrame {
  /** Per-finally "a transfer already left this finally" flag, "" when the
   *  try has no finally. */
  public finVar: string = "";
  /** `frames.length` when this frame's finally started being desugared
   *  (-1 when it has no finally): a rejection escapes this finally
   *  exactly when no try is open between the finally and the await,
   *  i.e. the frames depth at the await equals this depth. */
  public depth: i32 = -1;
  constructor(
    public errVar: string,
    public flagVar: string
  ) {}
}

/** One enclosing break/continue target (loop or switch). */
class BreakTarget {
  constructor(
    public kind: string
  ) {}
}

/** Per-function desugar state. */
class TryDesugar {
  private declaration: FunctionDeclaration;
  private range: Range;
  private names = new Set<string>();
  private counter: i32 = 0;
  private frames = new Array<TryFrame>();
  private targets = new Array<BreakTarget>();
  /** `targets.length` at the entry of each try part (body/catch/finally)
   *  being desugared: a break/continue target pushed after the innermost
   *  marker is inside that part, anything older encloses it. */
  private tryMarkers = new Array<i32>();
  private finallyChain = new Array<TryFrame>();
  private pendingTargets = new Map<string, AsyncTryRejectTarget>();
  private failed: bool = false;
  private hasTry: bool = false;
  private hasReturnInTry: bool = false;
  private retFlag: string = "";
  private brkFlag: string = "";
  private cntFlag: string = "";
  private retVal: string = "";
  /** Pending error from a throw in a catch/finally with no enclosing try
   *  to propagate to: the enclosing dispatch throws it after finally. */
  private pendErr: string = "";
  private pendFail: string = "";
  private retTypeNode: TypeNode | null = null;
  private isVoid: bool = false;

  constructor(
    private program: Program,
    private file: File,
    private prototype: FunctionPrototype
  ) {
    this.declaration = <FunctionDeclaration>prototype.declaration;
    this.range = this.declaration.range;
  }

  private fail(message: string, range: Range): void {
    if (!this.failed) {
      this.program.error(DiagnosticCode.Not_implemented_0, range, message);
    }
    this.failed = true;
  }

  run(): bool {
    let bodyNode = this.prototype.bodyNode;
    if (!bodyNode) return true;
    let parameters = this.prototype.functionTypeNode.parameters;
    for (let i = 0, k = parameters.length; i < k; ++i) {
      this.names.add(parameters[i].name.text);
    }
    let statements = asStatements(bodyNode);
    for (let i = 0, k = statements.length; i < k; ++i) {
      this.analyzeStatement(statements[i], 0);
    }
    if (this.failed) return false;
    if (this.hasTry) {
      if (this.hasReturnInTry && !this.resolveReturnType()) return false;
      this.retFlag = this.fresh("ret");
      this.brkFlag = this.fresh("brk");
      this.cntFlag = this.fresh("cnt");
      this.pendErr = this.fresh("pendErr");
      this.pendFail = this.fresh("pendFail");
      if (this.hasReturnInTry && !this.isVoid) this.retVal = this.fresh("retVal");
    }
    let rewritten = this.desugarList(statements, "top");
    if (this.failed) return false;
    let prologue = new Array<Statement>();
    if (this.hasTry) {
      prologue.push(this.letDecl(this.retFlag, namedType("bool", null, false, this.range), new FalseExpression(this.range)));
      prologue.push(this.letDecl(this.brkFlag, namedType("bool", null, false, this.range), new FalseExpression(this.range)));
      prologue.push(this.letDecl(this.cntFlag, namedType("bool", null, false, this.range), new FalseExpression(this.range)));
      prologue.push(this.letDecl(this.pendErr, namedType("string", null, false, this.range), strLit("", this.range)));
      prologue.push(this.letDecl(this.pendFail, namedType("bool", null, false, this.range), new FalseExpression(this.range)));
      if (this.retVal != "") {
        prologue.push(this.letDecl(this.retVal, assert(this.retTypeNode), null));
      }
    }
    for (let i = 0, k = rewritten.length; i < k; ++i) prologue.push(rewritten[i]);
    this.declaration.body = blockStmt(prologue, this.range);
    let keys = Map_keys(this.pendingTargets);
    for (let i = 0, k = keys.length; i < k; ++i) {
      rejectTargets.set(keys[i], assert(this.pendingTargets.get(keys[i])));
    }
    return true;
  }

  /** A name no binding in the function uses. */
  private fresh(kind: string): string {
    let name = "__async_try_" + kind + "_" + this.counter.toString();
    this.counter++;
    while (this.names.has(name)) {
      name = "__async_try_" + kind + "_" + this.counter.toString();
      this.counter++;
    }
    this.names.add(name);
    return name;
  }

  private letDecl(name: string, typeNode: TypeNode, initializer: Expression | null): VariableStatement {
    return new VariableStatement(
      null,
      [ new VariableDeclaration(ident(name, this.range), null, CommonFlags.Let, typeNode, initializer, this.range) ],
      this.range
    );
  }

  /** Determines the return-value holder type, or fails loudly. Only called
   *  when a return occurs inside a try/catch/finally. */
  private resolveReturnType(): bool {
    let inner = promiseInnerNode(this.prototype.functionTypeNode.returnType);
    if (inner) {
      if (inner.kind == NodeKind.NamedType && (<NamedTypeNode>inner).name.identifier.text == "void") {
        this.isVoid = true;
      } else {
        this.retTypeNode = inner;
      }
      return true;
    }
    let instance = this.program.resolver.resolveFunction(this.prototype, null, new Map(), ReportMode.Report);
    if (!instance) return false;
    let unwrapped = this.program.resolver.unwrapPromiseType(instance.signature.returnType);
    if (!unwrapped) return false;
    if (unwrapped.kind == TypeKind.Void) {
      this.isVoid = true;
      return true;
    }
    let node = typeToTypeNode(unwrapped, this.range);
    if (!node) {
      this.fail("Async functions with a 'return' inside a 'try' statement cannot return values of a type with no spelling", this.range);
      return false;
    }
    this.retTypeNode = node;
    return true;
  }

  // === Analysis =================================================================================

  /** Collects binding names, detects trys and returns inside them, and
   *  rejects `await` in a finally. Never descends into nested functions. */
  private analyzeStatement(stmt: Statement, tryDepth: i32): void {
    switch (stmt.kind) {
      case NodeKind.Block: {
        let statements = (<BlockStatement>stmt).statements;
        for (let i = 0, k = statements.length; i < k; ++i) this.analyzeStatement(statements[i], tryDepth);
        return;
      }
      case NodeKind.Variable: {
        let declarations = (<VariableStatement>stmt).declarations;
        for (let i = 0, k = declarations.length; i < k; ++i) {
          this.names.add(declarations[i].name.text);
        }
        return;
      }
      case NodeKind.Try: {
        let tryStmt = <TryStatement>stmt;
        this.hasTry = true;
        if (tryStmt.catchVariable) this.names.add(tryStmt.catchVariable.text);
        let bodyStatements = tryStmt.bodyStatements;
        for (let i = 0, k = bodyStatements.length; i < k; ++i) this.analyzeStatement(bodyStatements[i], tryDepth + 1);
        if (tryStmt.catchStatements) {
          let catchStatements = tryStmt.catchStatements;
          for (let i = 0, k = catchStatements.length; i < k; ++i) this.analyzeStatement(catchStatements[i], tryDepth + 1);
        }
        if (tryStmt.finallyStatements) {
          let finallyStatements = tryStmt.finallyStatements;
          for (let i = 0, k = finallyStatements.length; i < k; ++i) this.analyzeStatement(finallyStatements[i], tryDepth + 1);
        }
        return;
      }
      case NodeKind.Return: {
        if (tryDepth > 0) this.hasReturnInTry = true;
        return;
      }
      case NodeKind.If: {
        let ifStmt = <IfStatement>stmt;
        this.analyzeStatement(ifStmt.ifTrue, tryDepth);
        if (ifStmt.ifFalse) this.analyzeStatement(ifStmt.ifFalse, tryDepth);
        return;
      }
      case NodeKind.While: {
        this.analyzeStatement((<WhileStatement>stmt).body, tryDepth);
        return;
      }
      case NodeKind.Do: {
        this.analyzeStatement((<DoStatement>stmt).body, tryDepth);
        return;
      }
      case NodeKind.For: {
        let forStmt = <ForStatement>stmt;
        if (forStmt.initializer) this.analyzeStatement(forStmt.initializer, tryDepth);
        this.analyzeStatement(forStmt.body, tryDepth);
        return;
      }
      case NodeKind.ForOf: {
        let forOf = <ForOfStatement>stmt;
        this.analyzeStatement(forOf.variable, tryDepth);
        this.analyzeStatement(forOf.body, tryDepth);
        return;
      }
      case NodeKind.Switch: {
        let cases = (<SwitchStatement>stmt).cases;
        for (let i = 0, k = cases.length; i < k; ++i) {
          let statements = cases[i].statements;
          for (let j = 0, l = statements.length; j < l; ++j) this.analyzeStatement(statements[j], tryDepth);
        }
        return;
      }
      case NodeKind.FunctionDeclaration: {
        this.names.add((<FunctionDeclaration>stmt).name.text);
        return;
      }
      case NodeKind.ClassDeclaration: {
        this.names.add((<ClassDeclaration>stmt).name.text);
        return;
      }
      default: {
        return;
      }
    }
  }

  // === Guard expressions ========================================================================

  /** True when the current list must stop. In a try body or catch list
   *  this is the innermost try's error flag (or the enclosing one, inside
   *  a catch) or a pending return/break/continue. In a finally list the
   *  pending-action flags are excluded — a finally runs even with a return
   *  pending — and the finally's own flag takes their place. */
  private stopExpr(range: Range, mode: string): Expression {
    if (mode == "finally") {
      let fin = this.finallyChain[this.finallyChain.length - 1];
      let expr: Expression = ident(fin.finVar, range);
      if (this.frames.length > 0) {
        expr = new BinaryExpression(Token.Bar_Bar, expr, ident(this.frames[this.frames.length - 1].flagVar, range), range);
      }
      expr = new BinaryExpression(Token.Bar_Bar, expr, ident(this.pendFail, range), range);
      return expr;
    }
    let expr: Expression | null = null;
    if (this.frames.length > 0) {
      expr = ident(this.frames[this.frames.length - 1].flagVar, range);
    }
    expr = orChain(expr, ident(this.retFlag, range), range);
    expr = orChain(expr, ident(this.brkFlag, range), range);
    expr = orChain(expr, ident(this.cntFlag, range), range);
    expr = orChain(expr, ident(this.pendFail, range), range);
    return assert(expr);
  }

  /** Clears every enclosing finally's error flag and the pending-action
   *  flags, so a transfer inside a finally replaces the pending outcome. */
  private clearTransfers(range: Range): Statement[] {
    let out = new Array<Statement>();
    for (let i = 0, k = this.finallyChain.length; i < k; ++i) {
      out.push(exprStmt(assignExpr(ident(this.finallyChain[i].flagVar, range), new FalseExpression(range), range)));
    }
    out.push(exprStmt(assignExpr(ident(this.retFlag, range), new FalseExpression(range), range)));
    out.push(exprStmt(assignExpr(ident(this.brkFlag, range), new FalseExpression(range), range)));
    out.push(exprStmt(assignExpr(ident(this.cntFlag, range), new FalseExpression(range), range)));
    return out;
  }

  /** Marks every enclosing finally as left, so its remaining statements
   *  are skipped after an escaping return/break/continue. */
  private leaveFinallys(range: Range): Statement[] {
    let out = new Array<Statement>();
    for (let i = 0, k = this.finallyChain.length; i < k; ++i) {
      out.push(exprStmt(assignExpr(ident(this.finallyChain[i].finVar, range), new TrueExpression(range), range)));
    }
    return out;
  }

  private flatCheck(range: Range, mode: string): Statement {
    return new IfStatement(
      this.stopExpr(range, mode),
      blockStmt([ new BreakStatement(null, range) ], range),
      null,
      range
    );
  }

  // === Rewriting ==================================================================================

  /** Desugars a statement list. "top" emits no guards; "flat" appends a
   *  settled check after every statement (lists inside the wrapper loop);
   *  "catch"/"finally" nest the remainder under `if (!stop)` (lists with
   *  no loop to break out of). */
  private desugarList(statements: Statement[], mode: string): Statement[] {
    let out = new Array<Statement>();
    if (mode == "top") {
      for (let i = 0, k = statements.length; i < k; ++i) {
        let desugared = this.desugarStatement(statements[i], mode);
        for (let j = 0, l = desugared.length; j < l; ++j) out.push(desugared[j]);
      }
      return out;
    }
    if (mode == "flat") {
      for (let i = 0, k = statements.length; i < k; ++i) {
        let desugared = this.desugarStatement(statements[i], mode);
        for (let j = 0, l = desugared.length; j < l; ++j) out.push(desugared[j]);
        out.push(this.flatCheck(statements[i].range, mode));
      }
      return out;
    }
    let tail = new Array<Statement>();
    for (let i = statements.length - 1; i >= 0; --i) {
      let cur = this.desugarStatement(statements[i], mode);
      if (tail.length == 0) {
        tail = cur;
      } else {
        let guarded = new Array<Statement>();
        for (let j = 0, k = cur.length; j < k; ++j) guarded.push(cur[j]);
        guarded.push(new IfStatement(
          new UnaryPrefixExpression(Token.Exclamation, this.stopExpr(statements[i].range, mode), statements[i].range),
          blockStmt(tail, statements[i].range),
          null,
          statements[i].range
        ));
        tail = guarded;
      }
    }
    return tail;
  }

  /** Desugars one statement as a branch/body: one statement out, wrapped
   *  in a block when the desugar produced several. */
  private desugarBranch(stmt: Statement, mode: string): Statement {
    let desugared = this.desugarList(asStatements(stmt), mode);
    if (desugared.length == 1) return desugared[0];
    return blockStmt(desugared, stmt.range);
  }

  private desugarStatement(stmt: Statement, mode: string): Statement[] {
    if (stmt.kind == NodeKind.Try) return this.desugarTry(<TryStatement>stmt, mode);
    this.scanDirectExpressions(stmt);
    if (this.failed) return [ stmt ];
    switch (stmt.kind) {
      case NodeKind.Block: {
        let block = <BlockStatement>stmt;
        return [ blockStmt(this.desugarList(block.statements, mode), stmt.range) ];
      }
      case NodeKind.Return: {
        let ret = <ReturnStatement>stmt;
        if (this.tryMarkers.length == 0) return [ stmt ];
        let out = this.clearTransfers(stmt.range);
        let leaving = this.leaveFinallys(stmt.range);
        for (let i = 0, k = leaving.length; i < k; ++i) out.push(leaving[i]);
        if (ret.value && this.retVal != "") {
          out.push(exprStmt(assignExpr(ident(this.retVal, stmt.range), ret.value, stmt.range)));
        }
        out.push(exprStmt(assignExpr(ident(this.retFlag, stmt.range), new TrueExpression(stmt.range), stmt.range)));
        return out;
      }
      case NodeKind.Throw: {
        let throwStmt = <ThrowStatement>stmt;
        if (containsAwait(throwStmt.value)) {
          this.fail("'await' as the value of a 'throw' statement is not yet supported", throwStmt.value.range);
          return [ stmt ];
        }
        let value = this.stringifyThrow(throwStmt.value);
        if (this.tryMarkers.length == 0) {
          return [ new ThrowStatement(value, stmt.range) ];
        }
        let out = this.clearTransfers(stmt.range);
        if (this.frames.length > 0) {
          let top = this.frames[this.frames.length - 1];
          out.push(exprStmt(assignExpr(ident(top.errVar, stmt.range), value, stmt.range)));
          out.push(exprStmt(assignExpr(ident(top.flagVar, stmt.range), new TrueExpression(stmt.range), stmt.range)));
        } else {
          out.push(exprStmt(assignExpr(ident(this.pendErr, stmt.range), value, stmt.range)));
          out.push(exprStmt(assignExpr(ident(this.pendFail, stmt.range), new TrueExpression(stmt.range), stmt.range)));
        }
        return out;
      }
      case NodeKind.Break: {
        let breakStmt = <BreakStatement>stmt;
        if (breakStmt.label) return [ stmt ];
        return this.desugarJump(stmt, true);
      }
      case NodeKind.Continue: {
        let continueStmt = <ContinueStatement>stmt;
        if (continueStmt.label) return [ stmt ];
        return this.desugarJump(stmt, false);
      }
      case NodeKind.If: {
        let ifStmt = <IfStatement>stmt;
        ifStmt.ifTrue = this.desugarBranch(ifStmt.ifTrue, mode);
        if (ifStmt.ifFalse) ifStmt.ifFalse = this.desugarBranch(ifStmt.ifFalse, mode);
        return [ stmt ];
      }
      case NodeKind.While: {
        let whileStmt = <WhileStatement>stmt;
        this.targets.push(new BreakTarget("loop"));
        whileStmt.body = this.desugarBranch(whileStmt.body, mode);
        this.targets.pop();
        whileStmt.condition = this.guardedCondition(whileStmt.condition, stmt.range, mode);
        return [ stmt ];
      }
      case NodeKind.Do: {
        let doStmt = <DoStatement>stmt;
        this.targets.push(new BreakTarget("loop"));
        doStmt.body = this.desugarBranch(doStmt.body, mode);
        this.targets.pop();
        doStmt.condition = this.guardedCondition(doStmt.condition, stmt.range, mode);
        return [ stmt ];
      }
      case NodeKind.For: {
        let forStmt = <ForStatement>stmt;
        if (forStmt.initializer) {
          let init = this.desugarStatement(forStmt.initializer, mode);
          if (init.length > 0) forStmt.initializer = init[0];
        }
        if (forStmt.condition) {
          forStmt.condition = this.guardedCondition(forStmt.condition, stmt.range, mode);
        } else if (mode != "top") {
          forStmt.condition = new UnaryPrefixExpression(Token.Exclamation, this.stopExpr(stmt.range, mode), stmt.range);
        }
        if (forStmt.incrementor && mode != "top") {
          forStmt.incrementor = new TernaryExpression(
            new UnaryPrefixExpression(Token.Exclamation, this.stopExpr(stmt.range, mode), stmt.range),
            new CommaExpression([ forStmt.incrementor, intLit(0, stmt.range) ], stmt.range),
            intLit(0, stmt.range),
            stmt.range
          );
        }
        this.targets.push(new BreakTarget("loop"));
        forStmt.body = this.desugarBranch(forStmt.body, mode);
        this.targets.pop();
        return [ stmt ];
      }
      case NodeKind.ForOf: {
        let forOf = <ForOfStatement>stmt;
        let variable = this.desugarStatement(forOf.variable, mode);
        if (variable.length > 0) forOf.variable = variable[0];
        this.targets.push(new BreakTarget("loop"));
        forOf.body = this.desugarBranch(forOf.body, mode);
        this.targets.pop();
        return [ stmt ];
      }
      case NodeKind.Switch: {
        let switchStmt = <SwitchStatement>stmt;
        this.targets.push(new BreakTarget("switch"));
        let cases = switchStmt.cases;
        for (let i = 0, k = cases.length; i < k; ++i) {
          cases[i].statements = this.desugarList(cases[i].statements, mode);
        }
        this.targets.pop();
        return [ stmt ];
      }
      default: {
        return [ stmt ];
      }
    }
  }

  /** A `break`/`continue` whose target was pushed before the innermost
   *  try part began encloses that part, so it becomes a pending-action
   *  flag; one targeting a loop/switch inside the part stays as it is. */
  private desugarJump(stmt: Statement, isBreak: bool): Statement[] {
    let mark = this.tryMarkers.length > 0 ? this.tryMarkers[this.tryMarkers.length - 1] : -1;
    let targetIndex = -1;
    for (let i = this.targets.length - 1; i >= 0; --i) {
      let candidate = this.targets[i];
      if (isBreak || candidate.kind == "loop") {
        targetIndex = i;
        break;
      }
    }
    if (targetIndex < 0) {
      this.fail(isBreak
        ? "'break' outside of a loop is not allowed here"
        : "'continue' outside of a loop is not allowed here", stmt.range);
      return [ stmt ];
    }
    if (targetIndex >= mark) return [ stmt ];
    let out = this.clearTransfers(stmt.range);
    let leaving = this.leaveFinallys(stmt.range);
    for (let i = 0, k = leaving.length; i < k; ++i) out.push(leaving[i]);
    let flag = isBreak ? this.brkFlag : this.cntFlag;
    out.push(exprStmt(assignExpr(ident(flag, stmt.range), new TrueExpression(stmt.range), stmt.range)));
    return out;
  }

  /** Prepends `!stop &&` to a loop condition, so the condition is not
   *  re-evaluated after a throw/transfer. */
  private guardedCondition(condition: Expression, range: Range, mode: string): Expression {
    if (mode == "top") return condition;
    return new BinaryExpression(
      Token.Ampersand_Ampersand,
      new UnaryPrefixExpression(Token.Exclamation, this.stopExpr(range, mode), range),
      condition,
      range
    );
  }

  /** `throw new Error(msg)` carries `msg`; everything else is thrown as
   *  written and must be a string (the error slot is a string). */
  private stringifyThrow(value: Expression): Expression {
    if (value.kind == NodeKind.New) {
      let newExpr = <NewExpression>value;
      let typeName = newExpr.typeName;
      if (!typeName.next && typeName.identifier.text == "Error") {
        let args = newExpr.args;
        if (args.length > 0) return args[0];
        return strLit("", value.range);
      }
    }
    return value;
  }

  /** Statements propagating an error value to the enclosing try, or
   *  failing the task when there is none. */
  private propagateError(value: Expression, range: Range): Statement[] {
    if (this.frames.length > 0) {
      let parent = this.frames[this.frames.length - 1];
      return [
        exprStmt(assignExpr(ident(parent.errVar, range), value, range)),
        exprStmt(assignExpr(ident(parent.flagVar, range), new TrueExpression(range), range))
      ];
    }
    return [ new ThrowStatement(value, range) ];
  }

  private desugarTry(stmt: TryStatement, mode: string): Statement[] {
    let range = stmt.range;
    let frame = new TryFrame(this.fresh("err"), this.fresh("flag"));
    if (stmt.finallyStatements) frame.finVar = this.fresh("fin");
    let out = new Array<Statement>();
    out.push(this.letDecl(frame.flagVar, namedType("bool", null, false, range), new FalseExpression(range)));
    out.push(this.letDecl(frame.errVar, namedType("string", null, false, range), strLit("", range)));
    this.frames.push(frame);
    this.tryMarkers.push(this.targets.length);
    let bodyStmts = this.desugarList(stmt.bodyStatements, "flat");
    this.tryMarkers.pop();
    this.frames.pop();
    if (this.failed) return [ stmt ];
    let wrapperBody = new Array<Statement>();
    for (let i = 0, k = bodyStmts.length; i < k; ++i) wrapperBody.push(bodyStmts[i]);
    wrapperBody.push(new BreakStatement(null, range));
    out.push(new WhileStatement(new TrueExpression(range), blockStmt(wrapperBody, range), range));
    if (stmt.catchStatements) {
      let catchBody = new Array<Statement>();
      catchBody.push(exprStmt(assignExpr(ident(frame.flagVar, range), new FalseExpression(range), range)));
      if (stmt.catchVariable) {
        catchBody.push(this.letDecl(stmt.catchVariable.text, namedType("string", null, false, range), ident(frame.errVar, range)));
      }
      this.tryMarkers.push(this.targets.length);
      let desugaredCatch = this.desugarList(stmt.catchStatements, "catch");
      this.tryMarkers.pop();
      for (let i = 0, k = desugaredCatch.length; i < k; ++i) catchBody.push(desugaredCatch[i]);
      out.push(new IfStatement(ident(frame.flagVar, range), blockStmt(catchBody, range), null, range));
    }
    if (stmt.finallyStatements) {
      out.push(this.letDecl(frame.finVar, namedType("bool", null, false, range), new FalseExpression(range)));
      frame.depth = this.frames.length;
      this.finallyChain.push(frame);
      this.tryMarkers.push(this.targets.length);
      let desugaredFinally = this.desugarList(stmt.finallyStatements, "finally");
      this.tryMarkers.pop();
      this.finallyChain.pop();
      for (let i = 0, k = desugaredFinally.length; i < k; ++i) out.push(desugaredFinally[i]);
    }
    if (this.failed) return [ stmt ];
    let tail: Statement | null = null;
    if (this.frames.length == 0) {
      if (this.hasEnclosingLoop()) {
        tail = new IfStatement(
          ident(this.cntFlag, range),
          blockStmt([
            exprStmt(assignExpr(ident(this.cntFlag, range), new FalseExpression(range), range)),
            new ContinueStatement(null, range)
          ], range),
          null,
          range
        );
      }
      if (this.hasEnclosingBreakTarget()) {
        tail = new IfStatement(
          ident(this.brkFlag, range),
          blockStmt([
            exprStmt(assignExpr(ident(this.brkFlag, range), new FalseExpression(range), range)),
            new BreakStatement(null, range)
          ], range),
          tail,
          range
        );
      }
      let retStmts = new Array<Statement>();
      retStmts.push(exprStmt(assignExpr(ident(this.retFlag, range), new FalseExpression(range), range)));
      if (this.retVal != "") {
        retStmts.push(new ReturnStatement(ident(this.retVal, range), range));
      } else {
        retStmts.push(new ReturnStatement(null, range));
      }
      tail = new IfStatement(ident(this.retFlag, range), blockStmt(retStmts, range), tail, range);
    }
    // A throw in this try's catch/finally waits here as a pending error;
    // propagate it after finally, ahead of any pending return/break.
    let pendStmts = new Array<Statement>();
    pendStmts.push(exprStmt(assignExpr(ident(this.pendFail, range), new FalseExpression(range), range)));
    let pendPropagate = this.propagateError(ident(this.pendErr, range), range);
    for (let i = 0, k = pendPropagate.length; i < k; ++i) pendStmts.push(pendPropagate[i]);
    tail = new IfStatement(ident(this.pendFail, range), blockStmt(pendStmts, range), tail, range);
    out.push(new IfStatement(
      ident(frame.flagVar, range),
      blockStmt(this.propagateError(ident(frame.errVar, range), range), range),
      tail,
      range
    ));
    return out;
  }

  private hasEnclosingLoop(): bool {
    for (let i = 0, k = this.targets.length; i < k; ++i) {
      if (this.targets[i].kind == "loop") return true;
    }
    return false;
  }

  private hasEnclosingBreakTarget(): bool {
    return this.targets.length > 0;
  }

  // === Await scanning ===========================================================================

  /** Records the reject target of every await in a statement's own
   *  expressions. Child statements are scanned by their own desugar call,
   *  so each await is recorded once, against the frame active at its
   *  position. */
  private scanDirectExpressions(stmt: Statement): void {
    switch (stmt.kind) {
      case NodeKind.Variable: {
        let declarations = (<VariableStatement>stmt).declarations;
        for (let i = 0, k = declarations.length; i < k; ++i) {
          let initializer = declarations[i].initializer;
          if (initializer) this.scanExpression(initializer);
        }
        return;
      }
      case NodeKind.Expression: {
        this.scanExpression((<ExpressionStatement>stmt).expression);
        return;
      }
      case NodeKind.Return: {
        let value = (<ReturnStatement>stmt).value;
        if (value) this.scanExpression(value);
        return;
      }
      case NodeKind.Throw: {
        this.scanExpression((<ThrowStatement>stmt).value);
        return;
      }
      case NodeKind.If: {
        this.scanExpression((<IfStatement>stmt).condition);
        return;
      }
      case NodeKind.While: {
        this.scanExpression((<WhileStatement>stmt).condition);
        return;
      }
      case NodeKind.Do: {
        this.scanExpression((<DoStatement>stmt).condition);
        return;
      }
      case NodeKind.For: {
        let forStmt = <ForStatement>stmt;
        if (forStmt.condition) this.scanExpression(forStmt.condition);
        if (forStmt.incrementor) this.scanExpression(forStmt.incrementor);
        return;
      }
      case NodeKind.ForOf: {
        this.scanExpression((<ForOfStatement>stmt).iterable);
        return;
      }
      case NodeKind.Switch: {
        let switchStmt = <SwitchStatement>stmt;
        this.scanExpression(switchStmt.condition);
        let cases = switchStmt.cases;
        for (let i = 0, k = cases.length; i < k; ++i) {
          if (cases[i].label) this.scanExpression(assert(cases[i].label));
        }
        return;
      }
      default: {
        return;
      }
    }
  }

  /** Records the reject target of every await in an expression, not
   *  descending into nested functions or classes. */
  private scanExpression(expr: Expression): void {
    if (expr.kind == NodeKind.Await) {
      if (this.frames.length > 0) {
        let top = this.frames[this.frames.length - 1];
        let key = this.file.internalName + ":" + expr.range.start.toString();
        let clearVars = new Array<string>();
        for (let i = 0, k = this.finallyChain.length; i < k; ++i) {
          if (this.finallyChain[i].depth == this.frames.length) {
            clearVars.push(this.finallyChain[i].flagVar);
          }
        }
        if (clearVars.length > 0) {
          if (this.retFlag != "") clearVars.push(this.retFlag);
          if (this.brkFlag != "") clearVars.push(this.brkFlag);
          if (this.cntFlag != "") clearVars.push(this.cntFlag);
        }
        this.pendingTargets.set(key, { errorVar: top.errVar, flagVar: top.flagVar, clearVars });
      }
      this.scanExpression((<AwaitExpression>expr).operand);
      return;
    }
    if (expr instanceof FunctionExpression) return;
    if (expr instanceof ClassExpression) return;
    if (expr instanceof BinaryExpression) {
      this.scanExpression(expr.left);
      this.scanExpression(expr.right);
      return;
    }
    if (expr instanceof CallExpression) {
      this.scanExpression(expr.expression);
      let args = expr.args;
      for (let i = 0, k = args.length; i < k; ++i) this.scanExpression(args[i]);
      return;
    }
    if (expr instanceof PropertyAccessExpression) {
      this.scanExpression(expr.expression);
      return;
    }
    if (expr instanceof ElementAccessExpression) {
      this.scanExpression(expr.expression);
      this.scanExpression(expr.elementExpression);
      return;
    }
    if (expr instanceof UnaryPrefixExpression) {
      this.scanExpression(expr.operand);
      return;
    }
    if (expr instanceof UnaryPostfixExpression) {
      this.scanExpression(expr.operand);
      return;
    }
    if (expr instanceof TernaryExpression) {
      this.scanExpression(expr.condition);
      this.scanExpression(expr.ifThen);
      this.scanExpression(expr.ifElse);
      return;
    }
    if (expr instanceof AssertionExpression) {
      this.scanExpression(expr.expression);
      return;
    }
    if (expr instanceof ParenthesizedExpression) {
      this.scanExpression(expr.expression);
      return;
    }
    if (expr instanceof CommaExpression) {
      let exprs = expr.expressions;
      for (let i = 0, k = exprs.length; i < k; ++i) this.scanExpression(exprs[i]);
      return;
    }
    if (expr instanceof InstanceOfExpression) {
      this.scanExpression(expr.expression);
      return;
    }
    if (expr instanceof NewExpression) {
      let args = expr.args;
      for (let i = 0, k = args.length; i < k; ++i) this.scanExpression(args[i]);
      return;
    }
    if (expr instanceof ArrayLiteralExpression) {
      let elements = expr.elementExpressions;
      for (let i = 0, k = elements.length; i < k; ++i) this.scanExpression(elements[i]);
      return;
    }
    if (expr instanceof ObjectLiteralExpression) {
      let values = expr.values;
      for (let i = 0, k = values.length; i < k; ++i) this.scanExpression(values[i]);
      return;
    }
    if (expr instanceof TemplateLiteralExpression) {
      if (expr.tag) this.scanExpression(expr.tag);
      let exprs = expr.expressions;
      for (let i = 0, k = exprs.length; i < k; ++i) this.scanExpression(exprs[i]);
      return;
    }
  }
}

/** Turns a statement that may be a single statement into a statement list. */
function asStatements(stmt: Statement): Statement[] {
  if (stmt.kind == NodeKind.Block) return (<BlockStatement>stmt).statements;
  return [ stmt ];
}

function orChain(left: Expression | null, right: Expression, range: Range): Expression {
  if (!left) return right;
  return new BinaryExpression(Token.Bar_Bar, left, right, range);
}
