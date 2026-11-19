/**
 * @fileoverview Async-arrow extraction for the CPS state-machine transform
 * (Phase 1, chunk 3). An async arrow assigned to a local or a field cannot
 * be awaited in place: it is extracted to a generated top-level async
 * function, which the core then transforms like any async function, and
 * the arrow expression is replaced by a reference to it. Arrows in
 * methods close over the receiver, which is passed as a leading
 * `__async_this` parameter.
 * @license Apache-2.0
 */

import {
  NodeKind,
  Statement,
  FunctionDeclaration,
  FunctionExpression,
  VariableStatement,
  ClassDeclaration,
  NamespaceDeclaration,
  FieldDeclaration,
  ExpressionStatement,
  ReturnStatement,
  ParameterNode,
  ParameterKind,
  FunctionTypeNode,
  CallExpression,
  ArrowKind
} from "./ast";

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
  ElementKind,
  ClassPrototype
} from "./program";

import {
  AsyncFail,
  ASYNC_THIS_NAME,
  ident,
  namedType,
  blockStmt,
  copyFunctionSignature,
  promiseInnerNode,
  unwrapParens
} from "./asyncRewrite";

/** How an extracted arrow is referenced from its binding site. */
export interface ArrowAlias {
  /** Name of the generated async function. */
  extractedName: string;
  /** Whether call sites must pass the receiver as the first argument. */
  needsReceiver: bool;
}

/** An outer async arrow visible to an extracted arrow's body: how to
 *  call it. The receiver name is the outer's `__async_this`, which the
 *  inner arrow also receives as its own leading parameter. */
export interface OuterArrowBinding {
  extractedName: string;
  needsReceiver: bool;
  receiverName: string | null;
}

/** Field info for one outer local, keyed by its declaration name range. */
export interface OuterFieldInfo {
  /** State field holding the value, or "" when spilled. */
  field: string;
  /** Whether the value lives in an externref spill slot instead. */
  spilled: bool;
  /** State field holding the spill slot index, or "" when not spilled. */
  slotField: string;
}

/** State-field map for one transformed async function, keyed by its
 *  qualName, so an extracted arrow can resolve its captures. The inner
 *  map is keyed by declaration name range (`start:end`). Filled by the
 *  outer's core transform; an arrow's transform reads it. */
export const outerFieldMaps = new Map<string, Map<string, OuterFieldInfo>>();

/** Key for one declaration name range in an outer field map. */
export function outerFieldKey(range: Range): string {
  return range.start.toString() + ":" + range.end.toString();
}

/** What an extracted arrow needs to resolve captures from its enclosing
 *  async function. */
export interface OuterRecord {
  outerQual: string;
  /** Enclosing local name to its declaration name range, captured at
   *  extraction time (nearest declaration wins, so shadowing is exact). */
  names: Map<string, Range>;
  /** Enclosing arrow name to its binding, captured at extraction time. */
  arrows: Map<string, OuterArrowBinding>;
  /** Field map of the outer, filled by the outer's core transform. */
  fields: Map<string, OuterFieldInfo>;
}

/** A generated async function awaiting its pre-passes. */
export interface ArrowWorkItem {
  prototype: FunctionPrototype;
  /** Local name bound to the arrow (for recursion), or `null`. */
  selfName: string | null;
  /** Enclosing locals the body must not reference (captures). */
  forbidden: Set<string>;
  /** Element generated declarations are registered under. */
  genParent: Element;
  /** Enclosing class, when the arrow closes over a receiver. */
  receiverClass: ClassPrototype | null;
  /** QualName of the enclosing async function or method, or `null` for
   *  file-level arrows (no enclosing function, no captures). */
  outerQual: string | null;
  /** Enclosing local name to its declaration name range, captured at
   *  extraction time. Empty for file-level arrows. */
  outerNames: Map<string, Range>;
  /** Enclosing arrow name to its binding, captured at extraction time. */
  outerArrows: Map<string, OuterArrowBinding>;
}

/** Arrow aliases visible in one file: globals by name, fields by name. */
export interface FileArrowAliases {
  globals: Map<string, ArrowAlias>;
  fields: Map<string, ArrowAlias>;
}

export interface FileArrowScan {
  aliases: FileArrowAliases;
  arrows: ArrowWorkItem[];
}

/** Validates the parameters of a function to be lifted or extracted. */
export function validateLiftableParams(
  declaration: FunctionDeclaration,
  what: string,
  fail: AsyncFail
): bool {
  if (declaration.typeParameters && declaration.typeParameters.length > 0) {
    fail(`Generic ${what} are not yet supported`, declaration.name.range);
    return false;
  }
  if (declaration.signature.explicitThisType) {
    fail(`${what} with an explicit 'this' type are not yet supported`, declaration.signature.explicitThisType.range);
    return false;
  }
  let parameters = declaration.signature.parameters;
  for (let i = 0, k = parameters.length; i < k; ++i) {
    let parameter = parameters[i];
    if (parameter.parameterKind != ParameterKind.Default || parameter.initializer) {
      fail(`${what} with default, optional or rest parameters are not yet supported`, parameter.range);
      return false;
    }
  }
  return true;
}

/** Extracts one async arrow to a generated top-level async function.
 *  Returns `null` when a failure was reported through `fail`. The
 *  `forbidden` set is carried to the work item so the extracted body is
 *  rejected loudly if it references an enclosing local it cannot
 *  capture (a transitive capture through an ancestor). The outer info
 *  is carried so the extracted body can resolve its captures from the
 *  enclosing function; file-level arrows pass `null`/empty maps. */
export function extractAsyncArrow(
  program: Program,
  genParent: Element,
  declaration: FunctionDeclaration,
  extractedName: string,
  needsReceiver: bool,
  receiverClassName: string,
  receiverClass: ClassPrototype | null,
  forbidden: Set<string>,
  outerQual: string | null,
  outerNames: Map<string, Range>,
  outerArrows: Map<string, OuterArrowBinding>,
  fail: AsyncFail
): ArrowWorkItem | null {
  let range = declaration.range;
  if (!validateLiftableParams(declaration, "async arrows", fail)) return null;
  if (!promiseInnerNode(declaration.signature.returnType)) {
    fail("Async arrows must declare a 'Promise<T>' return type", declaration.signature.returnType.range);
    return null;
  }
  if (genParent.getMember(extractedName)) {
    fail(`Generated name '${extractedName}' collides with an existing declaration`, range);
    return null;
  }
  let parameters = new Array<ParameterNode>();
  if (needsReceiver) {
    parameters.push(new ParameterNode(
      ParameterKind.Default,
      ident(ASYNC_THIS_NAME, range),
      namedType(receiverClassName, null, false, range),
      null,
      range
    ));
  }
  let copied = copyFunctionSignature(declaration.signature, range);
  for (let i = 0, k = copied.parameters.length; i < k; ++i) {
    parameters.push(copied.parameters[i]);
  }
  let signature = new FunctionTypeNode(
    parameters,
    copied.returnType,
    null,
    false,
    range
  );
  let bodyNode = declaration.body;
  if (!bodyNode) {
    fail("Async arrows must have a body", range);
    return null;
  }
  let body: Statement;
  if (bodyNode.kind == NodeKind.Block) {
    body = bodyNode;
  } else if (bodyNode.kind == NodeKind.Expression) {
    body = blockStmt([
      new ReturnStatement((<ExpressionStatement>bodyNode).expression, range)
    ], range);
  } else {
    fail("Async arrows with this body shape are not yet supported", bodyNode.range);
    return null;
  }
  let extracted = new FunctionDeclaration(
    ident(extractedName, range),
    null,
    declaration.flags,
    null,
    signature,
    body,
    ArrowKind.None,
    range
  );
  if (!program.initializeGeneratedDeclaration(extracted, genParent)) {
    fail(`Could not register generated function '${extractedName}'`, range);
    return null;
  }
  let prototype = <FunctionPrototype>genParent.getMember(extractedName);
  if (!prototype) {
    fail(`Could not register generated function '${extractedName}'`, range);
    return null;
  }
  return {
    prototype,
    selfName: null,
    forbidden,
    genParent,
    receiverClass,
    outerQual,
    outerNames,
    outerArrows
  };
}

/** Scans one file for async arrows assigned to globals and class fields,
 *  extracting each to a generated async function. Returns `null` when a
 *  failure was reported through `fail`. */
export function scanFileForAsyncArrows(
  program: Program,
  file: File,
  fail: AsyncFail
): FileArrowScan | null {
  let aliases: FileArrowAliases = {
    globals: new Map(),
    fields: new Map()
  };
  let arrows = new Array<ArrowWorkItem>();
  let fieldCounts = new Map<string, i32>();
  collectFieldNames(file.source.statements, fieldCounts);
  let counter = 0;
  let ok = scanStatements(program, file, file.source.statements, file, aliases, arrows, fieldCounts, { value: counter }, fail);
  if (!ok) return null;
  return { aliases, arrows };
}

function collectFieldNames(statements: Statement[], counts: Map<string, i32>): void {
  for (let i = 0, k = statements.length; i < k; ++i) {
    let statement = statements[i];
    if (statement.kind == NodeKind.ClassDeclaration) {
      let members = (<ClassDeclaration>statement).members;
      for (let j = 0, l = members.length; j < l; ++j) {
        let member = members[j];
        if (member.kind == NodeKind.FieldDeclaration) {
          let name = (<FieldDeclaration>member).name.text;
          counts.set(name, (counts.get(name) || 0) + 1);
        }
      }
    } else if (statement.kind == NodeKind.NamespaceDeclaration) {
      collectFieldNames((<NamespaceDeclaration>statement).members, counts);
    }
  }
}

function scanStatements(
  program: Program,
  file: File,
  statements: Statement[],
  parent: Element,
  aliases: FileArrowAliases,
  arrows: ArrowWorkItem[],
  fieldCounts: Map<string, i32>,
  counter: { value: i32 },
  fail: AsyncFail
): bool {
  for (let i = 0, k = statements.length; i < k; ++i) {
    let statement = statements[i];
    if (statement.kind == NodeKind.Variable) {
      let declarations = (<VariableStatement>statement).declarations;
      for (let j = 0, l = declarations.length; j < l; ++j) {
        let declaration = declarations[j];
        let initializer = declaration.initializer;
        if (!initializer) continue;
        let unwrapped = unwrapParens(initializer);
        if (unwrapped.kind != NodeKind.Function) continue;
        let funcExpr = <FunctionExpression>unwrapped;
        if (!funcExpr.declaration.is(CommonFlags.Async)) continue;
        let name = `__async_arrow_${declaration.name.text}_${counter.value++}`;
        let extracted = extractAsyncArrow(
          program, parent, funcExpr.declaration, name,
          false, "", null, new Set<string>(), null, new Map<string, Range>(), new Map<string, OuterArrowBinding>(), fail
        );
        if (!extracted) return false;
        extracted.selfName = declaration.name.text;
        declaration.initializer = ident(name, initializer.range);
        aliases.globals.set(declaration.name.text, { extractedName: name, needsReceiver: false });
        arrows.push(extracted);
      }
    } else if (statement.kind == NodeKind.ClassDeclaration) {
      let classDeclaration = <ClassDeclaration>statement;
      let className = classDeclaration.name.text;
      let prototype = parent.getMember(className);
      if (!prototype || prototype.kind != ElementKind.ClassPrototype) continue;
      let classPrototype = <ClassPrototype>prototype;
      let typeParameters = classPrototype.typeParameterNodes;
      let members = classDeclaration.members;
      for (let j = 0, l = members.length; j < l; ++j) {
        let member = members[j];
        if (member.kind != NodeKind.FieldDeclaration) continue;
        let field = <FieldDeclaration>member;
        let initializer = field.initializer;
        if (!initializer) continue;
        let unwrapped = unwrapParens(initializer);
        if (unwrapped.kind != NodeKind.Function) continue;
        let funcExpr = <FunctionExpression>unwrapped;
        if (!funcExpr.declaration.is(CommonFlags.Async)) continue;
        let fieldName = field.name.text;
        if ((fieldCounts.get(fieldName) || 0) > 1) {
          fail(`Async arrows in a field named '${fieldName}' are ambiguous because the name is used by more than one class`, field.name.range);
          return false;
        }
        if (typeParameters && typeParameters.length > 0) {
          fail("Async arrows in generic classes are not yet supported", classDeclaration.name.range);
          return false;
        }
        let name = `__async_arrow_${className}_${fieldName}_${counter.value++}`;
        let extracted = extractAsyncArrow(
          program, parent, funcExpr.declaration, name,
          true, className, classPrototype, new Set<string>(), null, new Map<string, Range>(), new Map<string, OuterArrowBinding>(), fail
        );
        if (!extracted) return false;
        // The extracted function takes the receiver as a leading
        // parameter, so its reference does not match the field's declared
        // function type; the receiver is supplied at rewritten call sites.
        // Without an annotation the type is inferred from the initializer.
        if (field.type) {
          field.initializer = new CallExpression(
            ident("changetype", initializer.range),
            [ field.type ],
            [ ident(name, initializer.range) ],
            initializer.range
          );
        } else {
          field.initializer = ident(name, initializer.range);
        }
        aliases.fields.set(fieldName, { extractedName: name, needsReceiver: true });
        arrows.push(extracted);
      }
    } else if (statement.kind == NodeKind.NamespaceDeclaration) {
      let namespaceDeclaration = <NamespaceDeclaration>statement;
      let namespace = parent.getMember(namespaceDeclaration.name.text);
      if (!namespace) continue;
      if (!scanStatements(program, file, namespaceDeclaration.members, namespace, aliases, arrows, fieldCounts, counter, fail)) return false;
    }
  }
  return true;
}
