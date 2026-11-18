/**
 * @fileoverview Join primitive for the CPS state-machine transform
 * (Phase 1, chunk 5). One suspending import, `__async_join`, keyed by a
 * completion-policy flag, serves all four combinators; per-site store /
 * error / done exports deliver member outcomes to the state machine.
 * See STATUS-chunk5.md for the wire protocol.
 * @license Apache-2.0
 */

import {
  NodeKind,
  Statement,
  TypeNode,
  IdentifierExpression,
  PropertyAccessExpression,
  ElementAccessExpression,
  CallExpression,
  BinaryExpression,
  IfStatement,
  ReturnStatement,
  TrueExpression,
  FunctionDeclaration,
  FunctionTypeNode,
  ParameterNode,
  ParameterKind,
  ArrowKind
} from "./ast";

import {
  Range
} from "./diagnostics";

import {
  Token
} from "./tokenizer";

import {
  CommonNames,
  CommonFlags
} from "./common";

import {
  ident,
  intLit,
  callExpr,
  assignExpr,
  exprStmt,
  blockStmt,
  namedType
} from "./asyncRewrite";

/** Name of the single suspending join import (declared in std/assembly/promise.ts). */
export const JOIN_IMPORT_NAME = "__async_join";

/** Completion-policy flag passed to the join import. */
export const JOIN_POLICY_ALL = 0;
export const JOIN_POLICY_RACE = 1;
export const JOIN_POLICY_ALL_SETTLED = 2;
export const JOIN_POLICY_ANY = 3;

/** `__error` value for an `any` over zero members (no errors to list). */
export const AGGREGATE_ERROR_EMPTY = "AggregateError: ";

/** Returns the combinator name when the call is `Promise.<policy>(...)`, else `null`. */
export function joinPolicyOfCall(call: CallExpression): string | null {
  let callee = call.expression;
  if (callee.kind != NodeKind.PropertyAccess) return null;
  let access = <PropertyAccessExpression>callee;
  if (access.expression.kind != NodeKind.Identifier) return null;
  if ((<IdentifierExpression>access.expression).text != CommonNames.Promise) return null;
  let policy = access.property.text;
  if (policy == "all" || policy == "race" || policy == "allSettled" || policy == "any") return policy;
  return null;
}

/** Maps a combinator name to its join-import policy flag. */
export function joinPolicyCode(policy: string): i32 {
  if (policy == "race") return JOIN_POLICY_RACE;
  if (policy == "allSettled") return JOIN_POLICY_ALL_SETTLED;
  if (policy == "any") return JOIN_POLICY_ANY;
  return JOIN_POLICY_ALL;
}

/** Builds the result type node for a combinator over the member type node. */
export function joinResultTypeNode(policy: string, memberTypeNode: TypeNode, range: Range): TypeNode {
  if (policy == "race" || policy == "any") return memberTypeNode;
  if (policy == "all") return namedType("Array", [ memberTypeNode ], false, range);
  return namedType(
    "Array",
    [ namedType("PromiseSettledResult", [ memberTypeNode ], false, range) ],
    false,
    range
  );
}

// === Per-site state field names ==================================================================

export function joinValsField(siteId: i32): string { return `__joinVals${siteId}`; }
export function joinStatusField(siteId: i32): string { return `__joinStatus${siteId}`; }
export function joinReasonsField(siteId: i32): string { return `__joinReasons${siteId}`; }
export function joinIdxField(siteId: i32): string { return `__joinIdx${siteId}`; }
export function joinHasValueField(siteId: i32): string { return `__joinHasValue${siteId}`; }
export function joinReqsField(siteId: i32): string { return `__joinReqs${siteId}`; }
export function joinMembersField(siteId: i32): string { return `__joinMembers${siteId}`; }

export function joinStoreName(fileBase: string, fnName: string, siteId: i32): string {
  return `__async_${fileBase}_${fnName}_join_store_${siteId}`;
}

export function joinErrorName(fileBase: string, fnName: string, siteId: i32): string {
  return `__async_${fileBase}_${fnName}_join_error_${siteId}`;
}

export function joinDoneName(fileBase: string, fnName: string, siteId: i32): string {
  return `__async_${fileBase}_${fnName}_join_done_${siteId}`;
}

// === Per-site exports =============================================================================

/** Guards a join delivery against a task that already left the join site. */
function suspendedGuard(stateParam: string, siteId: i32, range: Range): IfStatement {
  return new IfStatement(
    new BinaryExpression(
      Token.Exclamation_Equals,
      new PropertyAccessExpression(ident(stateParam, range), ident("state", range), range),
      intLit(siteId + 1, range),
      range
    ),
    blockStmt([ new ReturnStatement(null, range) ], range),
    null,
    range
  );
}

function stateField(stateParam: string, field: string, range: Range): PropertyAccessExpression {
  return new PropertyAccessExpression(ident(stateParam, range), ident(field, range), range);
}

function stateParamNode(stateClassName: string, range: Range): ParameterNode {
  return new ParameterNode(
    ParameterKind.Default,
    ident("state", range),
    namedType(stateClassName, null, false, range),
    null,
    range
  );
}

/** Records one member fulfillment. Late deliveries are ignored. */
export function buildJoinStore(
  fileBase: string,
  fnName: string,
  stateClassName: string,
  siteId: i32,
  memberTypeNode: TypeNode,
  range: Range
): FunctionDeclaration {
  let body = new Array<Statement>();
  body.push(suspendedGuard("state", siteId, range));
  let atIndex = (field: string): ElementAccessExpression => {
    return new ElementAccessExpression(stateField("state", field, range), ident("index", range), range);
  };
  body.push(exprStmt(assignExpr(atIndex(joinValsField(siteId)), ident("value", range), range)));
  body.push(exprStmt(assignExpr(atIndex(joinStatusField(siteId)), intLit(1, range), range)));
  body.push(exprStmt(assignExpr(stateField("state", joinIdxField(siteId), range), ident("index", range), range)));
  body.push(exprStmt(assignExpr(
    stateField("state", joinHasValueField(siteId), range),
    new TrueExpression(range),
    range
  )));
  let signature = new FunctionTypeNode(
    [
      stateParamNode(stateClassName, range),
      new ParameterNode(ParameterKind.Default, ident("index", range), namedType("i32", null, false, range), null, range),
      new ParameterNode(ParameterKind.Default, ident("value", range), memberTypeNode, null, range)
    ],
    namedType("void", null, false, range),
    null,
    false,
    range
  );
  return new FunctionDeclaration(
    ident(joinStoreName(fileBase, fnName, siteId), range), null, CommonFlags.Export,
    null, signature, blockStmt(body, range), ArrowKind.None, range
  );
}

/** Records one member rejection. Late deliveries are ignored. */
export function buildJoinError(
  fileBase: string,
  fnName: string,
  stateClassName: string,
  siteId: i32,
  range: Range
): FunctionDeclaration {
  let body = new Array<Statement>();
  body.push(suspendedGuard("state", siteId, range));
  body.push(exprStmt(assignExpr(
    new ElementAccessExpression(stateField("state", joinReasonsField(siteId), range), ident("index", range), range),
    ident("message", range),
    range
  )));
  body.push(exprStmt(assignExpr(
    new ElementAccessExpression(stateField("state", joinStatusField(siteId), range), ident("index", range), range),
    intLit(2, range),
    range
  )));
  let signature = new FunctionTypeNode(
    [
      stateParamNode(stateClassName, range),
      new ParameterNode(ParameterKind.Default, ident("index", range), namedType("i32", null, false, range), null, range),
      new ParameterNode(ParameterKind.Default, ident("message", range), namedType("string", null, false, range), null, range)
    ],
    namedType("void", null, false, range),
    null,
    false,
    range
  );
  return new FunctionDeclaration(
    ident(joinErrorName(fileBase, fnName, siteId), range), null, CommonFlags.Export,
    null, signature, blockStmt(body, range), ArrowKind.None, range
  );
}

/** Resumes the state machine once the join's policy is satisfied. */
export function buildJoinDone(
  fileBase: string,
  fnName: string,
  stateClassName: string,
  siteId: i32,
  range: Range
): FunctionDeclaration {
  let signature = new FunctionTypeNode(
    [ stateParamNode(stateClassName, range) ],
    namedType("i32", null, false, range),
    null,
    false,
    range
  );
  let body = new Array<Statement>();
  body.push(new ReturnStatement(
    callExpr(
      new PropertyAccessExpression(ident("state", range), ident("step", range), range),
      [],
      range
    ),
    range
  ));
  return new FunctionDeclaration(
    ident(joinDoneName(fileBase, fnName, siteId), range), null, CommonFlags.Export,
    null, signature, blockStmt(body, range), ArrowKind.None, range
  );
}
