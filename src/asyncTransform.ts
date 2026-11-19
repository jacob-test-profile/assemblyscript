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
  DeclarationStatement,
  IfStatement,
  WhileStatement,
  ForStatement,
  ForOfStatement,
  DoStatement,
  ThrowStatement,
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
  DecoratorNode,
  ArrowKind,
  TrueExpression,
  FalseExpression,
  NullExpression,
  ThisExpression,
  NamespaceDeclaration,
  SourceKind
} from "./ast";

import {
  Range,
  DiagnosticCode
} from "./diagnostics";

import {
  CommonFlags,
  CommonNames
} from "./common";

import {
  Type,
  TypeKind,
  TypeFlags
} from "./types";

import {
  Token
} from "./tokenizer";

import {
  Program,
  FunctionPrototype,
  Function,
  Class,
  File,
  Element,
  ElementKind,
  Namespace,
  ClassPrototype
} from "./program";

import {
  Flow
} from "./flow";

import {
  ReportMode
} from "./resolver";

import {
  JOIN_IMPORT_NAME,
  AGGREGATE_ERROR_EMPTY,
  joinPolicyOfCall,
  joinPolicyCode,
  joinResultTypeNode,
  joinValsField,
  joinStatusField,
  joinReasonsField,
  joinIdxField,
  joinHasValueField,
  joinReqsField,
  joinMembersField,
  joinStoreName,
  joinErrorName,
  joinDoneName,
  joinMarkName,
  buildJoinStore,
  buildJoinError,
  buildJoinDone,
  buildJoinMark
} from "./asyncJoin";

import {
  rejectTargetFor
} from "./asyncTryDesugar";

import {
  liftThisInAsyncBody,
  prepareSuperHelpers,
  SuperPrepass
} from "./asyncThisLift";

import {
  liftEnvInAsyncBody,
  LiftContext,
  EnvLiftResult
} from "./asyncEnvLift";

import {
  scanFileForAsyncArrows,
  ArrowWorkItem,
  FileArrowAliases,
  OuterArrowBinding,
  OuterFieldInfo,
  OuterRecord,
  outerFieldMaps,
  outerFieldKey
} from "./asyncArrowExtract";

import {
  AsyncScope,
  AsyncRewriter,
  AsyncFail,
  LoopEnvInfo,
  ASYNC_THIS_NAME,
  ASYNC_OUTER_NAME,
  LOOP_ADAPTER_SLOTS,
  LOOP_ENV_PARAM,
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
  rewriteClosureMethod,
  bindingRead,
  containsAwait,
  containsThisOrSuper,
  validateBody,
  cpsStateClassName,
  cpsStateGlobalName,
  mangleGenericName,
  SPILL_POOL_SIZE,
  SPILL_ACQUIRE,
  SPILL_RELEASE,
  SPILL_GET,
  SPILL_SET,
  TRY_THROW_MARKER,
  TRY_FAIL_MARKER
} from "./asyncRewrite";

import {
  describeParamsAndRest,
  findExportName,
  warnSkipped,
  qualNameOf,
  namespacePathOf,
  exportedThroughNamespaces,
  owningFile
} from "./asyncCoordinatorMeta";

/** Fallthrough target meaning "the function completes". */
const CONT_TERMINAL = -1;
/** Break/continue target meaning "no enclosing loop". */
const NO_TARGET = -1;
/** Name of the suspending wait import for stored-promise await (declared
 *  in std/assembly/promise.ts). */
const WAIT_IMPORT_NAME = "__async_wait";
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
    public range: Range,
    /** Whether this site is a join (`await Promise.<policy>(...)`). */
    public isJoin: bool = false,
    /** Combinator name for a join site, else "". */
    public joinPolicy: string = "",
    /** Member type for a join site, else null. */
    public memberType: Type | null = null,
    /** Type node denoting the member type for a join site, else null. */
    public memberTypeNode: TypeNode | null = null,
    /** State field holding the enclosing try's error flag, when a
     *  coordinator rejection of this site must land in a catch. */
    public rejectFlagField: string = "",
    /** State field holding the enclosing try's error message, same. */
    public rejectErrField: string = "",
    /** State fields a coordinator rejection of this site must clear
     *  first: the error flags of the finallys the rejection escapes, and
     *  the pending return/break/continue flags (see AsyncTryRejectTarget).
     *  Empty for awaits outside a finally. */
    public rejectClearFields: string[] = [],
    /** Whether this site awaits a nested async function, in this file or another. */
    public isNested: bool = false,
    /** State field holding the inner task's handle, for a nested site. */
    public handleField: string = "",
    /** File-qualified name of the inner async function (`fileBase#qualName`), for a nested site. */
    public innerQual: string = ""
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
    /** "param", "local", "pend", "result" or "temp". */
    public kind: string,
    /** Local name, "pend<n>", "result" or "tmp<n>". */
    public name: string,
    /** State field holding the acquired slot index. */
    public slotField: string
  ) {}
}

/** One per-site temp: a state field holding a value captured before a
 *  suspension, or a spill slot when the value is an externref. */
class AwaitTemp {
  constructor(
    /** State field holding the value, if a field temp. */
    public field: string,
    /** State field holding the spill slot index, if a slot temp. */
    public slotField: string,
    /** Whether the value lives in a spill slot instead of a field. */
    public spilled: bool
  ) {}
}

/** An assignment target prepared before suspension: the receiver, index
 *  and (for compound assignments) current value are captured into temps,
 *  so the resume segment only writes through them. */
class AwaitTarget {
  constructor(
    /** Captured current value, for compound assignments; null for `=`. */
    public readTemp: AwaitTemp | null,
    /** Spill slot field when the target is a spilled local, else "". */
    public spilledSlotField: string,
    /** Builds the resume-side target expression, or null for a spilled local. */
    public buildTarget: ((range: Range) => Expression) | null,
    /** Declared type node of a local target, for join validation; null otherwise. */
    public expectedTypeNode: TypeNode | null,
    /** Plain binary operator for a compound assignment, `Token.Equals` for `=`. */
    public binaryOp: Token
  ) {}
}

/** One loop closure's per-iteration env, with the capture types resolved
 *  at first encounter of its adapter identifier. `types`/`typeNodes` are
 *  per capture, in capture order; externref captures have no env field
 *  (reference-typed fields are not allowed) and are listed separately. */
class LoopAdapterBuild {
  constructor(
    public info: LoopEnvInfo,
    public method: MethodDeclaration,
    public types: Type[],
    public typeNodes: TypeNode[],
    public extCaptures: string[]
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
     *  "suspend" suspends after the call, "terminal" completes, "fail"
     *  fails the task with state -2. */
    public kind: string,
    public next: i32 = NO_TARGET,
    /** Await site id, for "suspend" ends. */
    public site: i32 = -1
  ) {}
}

/** Outcome of emitting a join. */
const enum JoinEmitOutcome {
  /** The join suspends; the caller continues in the resume segment. */
  Suspended,
  /** The result was produced inline; the current segment stays open. */
  CompletedInline,
  /** The task was failed inline; the current segment is closed. */
  FailedInline
}

/** A validated join awaiting emission. */
class PreparedJoin {
  constructor(
    public site: AwaitSite,
    public policy: string,
    /** "literal" or "dynamic". */
    public memberKind: string,
    /** Member count for literal joins, -1 for dynamic joins. */
    public memberCount: i32,
    /** Literal member expressions, rewritten; empty for dynamic joins. */
    public members: Expression[],
    /** Rewritten dynamic member-array expression; null for literal joins. */
    public membersExpr: Expression | null,
    public resultType: Type,
    public resultTypeNode: TypeNode,
    /** Await sites hoisted out of literal members, by member index: the
     *  member awaited before the join issues, and its value is delivered
     *  into the site's pend field instead of a token. */
    public hoisted: Map<i32, AwaitSite>,
    /** Await site hoisted out of a dynamic join argument, or `null`: the
     *  argument awaited before the join issues, and `membersExpr` reads
     *  its pend field. */
    public argSite: AwaitSite | null
  ) {}
}

/** One async function or method awaiting the pre-passes and the core. */
export interface TransformWorkItem {
  prototype: FunctionPrototype;
  /** Whether the prototype is a method (instance or static). */
  isMethod: bool;
  /** Whether the method is static (no receiver; the class is the qualifier). */
  isStatic: bool;
  /** Enclosing class, for methods and for arrows closing over a receiver. */
  receiverClass: ClassPrototype | null;
  /** Resolved class instance the method is bound to, when already known
   *  (per-instantiation clones); `null` resolves the class here. */
  boundClass: Class | null;
  /** Element generated declarations are registered under. */
  genParent: Element;
  /** Qualified name used for all generated names. */
  qualName: string;
  /** Local name bound to an extracted arrow (for recursion), or `null`. */
  selfName: string | null;
  /** Enclosing locals the body must not reference (captures). */
  forbidden: Set<string>;
  /** Whether the prototype is an extracted async arrow (its receiver, if
   *  any, arrives as a generated `__async_this` parameter). */
  isExtracted: bool;
  /** QualName of the enclosing async function or method, for extracted
   *  arrows capturing its locals; `null` otherwise. */
  outerQual: string | null;
  /** Enclosing local name to its declaration name range, captured at
   *  extraction time; empty unless extracted. */
  outerNames: Map<string, Range>;
  /** Enclosing arrow name to its binding, captured at extraction time. */
  outerArrows: Map<string, OuterArrowBinding>;
}

/** Transforms all async functions in the program. Called from `Program.initialize()`. */
export function transformAsyncFunctions(program: Program): void {
  let files = Map_values(program.filesByName);
  // The `super` pre-pass registers helper methods on class prototypes,
  // which must happen before any worklist `resolveClass` finishes a
  // class instance, so it runs over all files up front.
  let superPrototypes = new Array<FunctionPrototype>();
  for (let i = 0, k = files.length; i < k; ++i) {
    let file = files[i];
    if (file.source.sourceKind == SourceKind.LibraryEntry) continue;
    let functions = new Array<FunctionPrototype>();
    let methods = new Array<FunctionPrototype>();
    collectAsyncFunctions(file, functions, methods);
    for (let j = 0, l = functions.length; j < l; ++j) superPrototypes.push(functions[j]);
    for (let j = 0, l = methods.length; j < l; ++j) superPrototypes.push(methods[j]);
  }
  let superHelpers = prepareSuperHelpers(program, superPrototypes);
  for (let i = 0, k = files.length; i < k; ++i) {
    let file = files[i];
    if (file.source.sourceKind == SourceKind.LibraryEntry) continue;
    // Collect the user async functions and methods first: the file scan
    // below registers generated async functions for global and field
    // arrows, and those belong on the worklist as extracted arrows, not
    // as plain functions.
    let functions = new Array<FunctionPrototype>();
    let methods = new Array<FunctionPrototype>();
    collectAsyncFunctions(file, functions, methods);
    // Chunk 2 slot: try desugar runs per function below, before the
    // this-lift and env-lift, when it lands.
    let scan = scanFileForAsyncArrows(program, file, (message: string, range: Range): void => {
      program.error(DiagnosticCode.Not_implemented_0, range, message);
    });
    if (!scan) continue;
    let aliases = scan.aliases;
    program.asyncFileAliases.set(file.internalName, aliases);
    let fileBase = sanitizeName(file.source.simplePath);
    let worklist = new Array<TransformWorkItem>();
    for (let j = 0, l = functions.length; j < l; ++j) {
      let prototype = functions[j];
      // File members include imported prototypes: only transform
      // functions declared in this file, or an imported callee is
      // transformed under the wrong file (its generated names resolve in
      // the wrong scope) and transformed twice.
      if (prototype.declaration.range.source != file.source) continue;
      worklist.push({
        prototype,
        isMethod: false,
        isStatic: false,
        receiverClass: null,
        boundClass: null,
        genParent: file,
        qualName: qualNameOf(prototype),
        selfName: null,
        forbidden: new Set<string>(),
        isExtracted: false,
        outerQual: null,
        outerNames: new Map<string, Range>(),
        outerArrows: new Map<string, OuterArrowBinding>()
      });
    }
    for (let j = 0, l = methods.length; j < l; ++j) {
      let prototype = methods[j];
      if (prototype.declaration.range.source != file.source) continue;
      let receiverClass = <ClassPrototype>prototype.parent;
      worklist.push({
        prototype,
        isMethod: true,
        isStatic: !prototype.is(CommonFlags.Instance),
        receiverClass,
        boundClass: null,
        genParent: receiverClass.parent,
        qualName: qualNameOf(prototype),
        selfName: null,
        forbidden: new Set<string>(),
        isExtracted: false,
        outerQual: null,
        outerNames: new Map<string, Range>(),
        outerArrows: new Map<string, OuterArrowBinding>()
      });
    }
    for (let j = 0, l = scan.arrows.length; j < l; ++j) {
      worklist.push(arrowWorkItem(scan.arrows[j]));
    }
    for (let w = 0; w < worklist.length; ++w) {
      let item = worklist[w];
      let prototype = item.prototype;
      // Functions the try desugar rejected already carry a specific
      // diagnostic; skip them so the core does not double-report.
      if (program.rejectedAsyncFunctions.has(prototype)) continue;
      // Generic functions and methods, and methods on generic classes, are
      // transformed per instantiation (the hook), never here: the pre-passes
      // mutate the body in place, and the shared generic body must stay
      // pristine for the next instantiation's clone. A registered clone is
      // already an instantiation, so it is transformed here.
      if (!program.asyncGenericCloneDeclarations.has(prototype.declaration)) {
        if (!item.isMethod) {
          let typeParameters = prototype.typeParameterNodes;
          if (typeParameters && typeParameters.length > 0) continue;
        } else {
          let receiverClass = assert(item.receiverClass);
          let classParameters = receiverClass.typeParameterNodes;
          if (classParameters && classParameters.length > 0) continue;
          let ownParameters = prototype.typeParameterNodes;
          if (ownParameters && ownParameters.length > 0) continue;
        }
      }
      // Instance methods resolve through a prototype bound to the
      // resolved class; bind up front so the pre-passes, the core and
      // the compiler guard all see the same prototype. Static methods
      // stay unbound: toBound asserts Instance, and a static has no
      // receiver to bind.
      let transformPrototype = prototype;
      let fail = (message: string, range: Range): void => {
        program.error(DiagnosticCode.Not_implemented_0, range, message);
        program.rejectedAsyncFunctions.add(transformPrototype);
      };
      if (item.isMethod) {
        let receiverClass = assert(item.receiverClass);
        let classInstance = program.resolver.resolveClass(receiverClass, null, new Map(), ReportMode.Report);
        if (!classInstance) {
          program.rejectedAsyncFunctions.add(prototype);
          continue;
        }
        if (!item.isStatic) transformPrototype = prototype.toBound(classInstance);
      }
      // A namespaced function is transformed like a top-level one: its
      // protocol members already register under the file, and generate()
      // emits a top-level entry alias the coordinator can drive.
      // A method the `super` pre-pass rejected already carries its
      // diagnostic; mark the bound prototype rejected so the compiler
      // guard skips it silently.
      if (superHelpers.failed.has(prototype)) {
        program.rejectedAsyncFunctions.add(transformPrototype);
        continue;
      }
      let superPrepass: SuperPrepass | null = null;
      if (item.receiverClass) superPrepass = superHelpers.helpers.get(item.receiverClass) || null;
      // An extracted arrow resolves its captures through the enclosing
      // function's field map, filled by the enclosing transform (which
      // runs first: the arrow is queued behind it). A missing map means
      // the enclosing function did not transform and already carries a
      // diagnostic, so skip silently.
      let outer: OuterRecord | null = null;
      if (item.isExtracted && item.outerQual) {
        let fields = outerFieldMaps.get(item.outerQual);
        if (!fields) {
          program.rejectedAsyncFunctions.add(transformPrototype);
          continue;
        }
        outer = {
          outerQual: item.outerQual,
          names: item.outerNames,
          arrows: item.outerArrows,
          fields
        };
      }
      if (!liftThisInAsyncBody(program, transformPrototype, fail, item.isExtracted, superPrepass)) continue;
      // Static methods have no receiver: arrows inside them close over
      // the class name, not an instance, so the lift sees no receiver.
      let hasReceiver = (item.isMethod && !item.isStatic) || (!item.isMethod && item.receiverClass != null);
      let ctx: LiftContext = {
        program,
        file,
        genParent: item.genParent,
        qualName: item.qualName,
        stateClassName: cpsStateClassName(item.qualName),
        stateGlobalName: cpsStateGlobalName(fileBase, item.qualName),
        hasReceiver,
        receiverClass: item.isStatic ? null : item.receiverClass,
        aliases
      };
      let lift = liftEnvInAsyncBody(program, transformPrototype, ctx, item.selfName, item.forbidden, outer, fail);
      if (!lift) continue;
      for (let a = 0, b = lift.arrows.length; a < b; ++a) {
        worklist.push(arrowWorkItem(lift.arrows[a]));
      }
      let transform = new AsyncFunctionTransform(program, file, transformPrototype, program.asyncSpillPools, program.asyncMints, lift, item.qualName, item.genParent, item.isMethod, item.isStatic, item.receiverClass, program.asyncClassNews, item.outerQual);
      transform.run();
    }
  }
  reexportCrossFileInners(program);
}

/** Re-exports the protocol functions of async functions awaited from
 *  another file: only UserEntry exports become WebAssembly exports, so
 *  without this the coordinator could not call a cross-file inner's
 *  resume/reject/status/result/error exports, or the pending export of a
 *  non-entry outer that awaits a nested function. Only functions that
 *  participate in cross-file nesting are re-exported: a referenced inner,
 *  or a function with a nested site (its pending export is needed whenever
 *  it is itself driven as an inner task). */
function reexportCrossFileInners(program: Program): void {
  let files = Map_values(program.filesByName);
  let entries = new Array<File>();
  for (let i = 0, k = files.length; i < k; ++i) {
    if (files[i].source.sourceKind == SourceKind.UserEntry) entries.push(files[i]);
  }
  if (entries.length == 0) return;
  let referenced = new Set<string>();
  let pending = Map_values(program.asyncNestedPending);
  for (let i = 0, k = pending.length; i < k; ++i) referenced.add(pending[i]);
  for (let prototype of program.transformedAsyncFunctions) {
    let file = owningFile(prototype);
    if (!file || file.source.sourceKind == SourceKind.UserEntry) continue;
    let fileBase = sanitizeName(file.source.simplePath);
    let qual = qualNameOf(prototype);
    if (!referenced.has(fileBase + "#" + qual) && !hasPendingExport(file, fileBase, qual)) continue;
    reexportInnerProtocol(program, entries, file, fileBase, qual, prototype);
  }
}

/** Whether the file holds a pending export for the function: it awaits a
 *  nested function, so its pending export is needed whenever it is itself
 *  driven as an inner task. */
function hasPendingExport(file: File, fileBase: string, qual: string): bool {
  let members = file.members;
  if (!members) return false;
  let prefix = `__async_${fileBase}_${qual}_pending_`;
  let names = Map_keys(members);
  for (let i = 0, k = names.length; i < k; ++i) {
    if (names[i].startsWith(prefix)) return true;
  }
  return false;
}

/** Re-exports one cross-file participant's protocol functions from every
 *  entry file: the result/error/status exports and, per site, the resume
 *  (or join store/error/done) and reject exports, plus the pending exports
 *  of its nested sites. A name already exported to a different element is
 *  a user collision with the transform's namespace and fails loudly
 *  instead of emitting a coordinator that would call the wrong function. */
function reexportInnerProtocol(
  program: Program,
  entries: File[],
  innerFile: File,
  fileBase: string,
  qual: string,
  prototype: FunctionPrototype
): void {
  let prefix = `__async_${fileBase}_${qual}_`;
  let members = innerFile.members;
  if (!members) return;
  let names = Map_keys(members);
  for (let i = 0, k = names.length; i < k; ++i) {
    let name = names[i];
    if (!name.startsWith(prefix)) continue;
    let rest = name.substring(prefix.length);
    if (
      rest != "status" && rest != "result" && rest != "error" &&
      !rest.startsWith("resume_") && !rest.startsWith("reject_") &&
      !rest.startsWith("join_done_") && !rest.startsWith("join_store_") &&
      !rest.startsWith("join_error_") && !rest.startsWith("join_mark_") &&
      !rest.startsWith("pending_")
    ) continue;
    let element = innerFile.getMember(name);
    if (!element || element.kind != ElementKind.FunctionPrototype) continue;
    for (let j = 0, l = entries.length; j < l; ++j) {
      let entry = entries[j];
      let existing = entry.lookupExport(name);
      if (existing) {
        if (existing !== element) {
          program.error(
            DiagnosticCode.Not_implemented_0,
            prototype.identifierNode.range,
            `Generated name '${name}' collides with an existing export`
          );
        }
        continue;
      }
      program.ensureGeneratedModuleExport(entry, name, <FunctionPrototype>element);
    }
  }
}

/** Transforms one async function, method or extracted arrow: the
 *  this-lift, env-lift and core, in order. Generic functions, generic
 *  methods and methods on generic classes are skipped here: they are
 *  transformed once per instantiation by the `resolveFunction` hook
 *  (`src/asyncGeneric.ts`), which calls this with the clone. Arrow items
 *  the env-lift extracts are appended to `worklist` for the caller to
 *  drain. */
export function transformAsyncWorkItem(
  program: Program,
  file: File,
  item: TransformWorkItem,
  aliases: FileArrowAliases,
  worklist: TransformWorkItem[]
): void {
  let prototype = item.prototype;
  // Functions the try desugar rejected already carry a specific
  // diagnostic; skip them so the core does not double-report.
  if (program.rejectedAsyncFunctions.has(prototype)) return;
  // Generic functions and methods, and methods on generic classes, are
  // transformed per instantiation (the hook), never here: the pre-passes
  // mutate the body in place, and the shared generic body must stay
  // pristine for the next instantiation's clone. A registered clone is
  // already an instantiation, so it is transformed here.
  if (!program.asyncGenericCloneDeclarations.has(prototype.declaration)) {
    if (!item.isMethod) {
      let typeParameters = prototype.typeParameterNodes;
      if (typeParameters && typeParameters.length > 0) return;
    } else {
      let receiverClass = assert(item.receiverClass);
      let classParameters = receiverClass.typeParameterNodes;
      if (classParameters && classParameters.length > 0) return;
      let ownParameters = prototype.typeParameterNodes;
      if (ownParameters && ownParameters.length > 0) return;
    }
  }
  // Instance methods resolve through a prototype bound to the
  // resolved class; bind up front so the pre-passes, the core and
  // the compiler guard all see the same prototype.
  let transformPrototype = prototype;
  let fail = (message: string, range: Range): void => {
    program.error(DiagnosticCode.Not_implemented_0, range, message);
    program.rejectedAsyncFunctions.add(transformPrototype);
  };
  if (item.isMethod) {
    let receiverClass = assert(item.receiverClass);
    let classInstance: Class | null = item.boundClass;
    // A static method needs no class instance (no receiver to bind),
    // and resolving a generic class with null type arguments asserts.
    if (!classInstance && !item.isStatic) {
      classInstance = program.resolver.resolveClass(receiverClass, null, new Map(), ReportMode.Report);
      if (!classInstance) {
        program.rejectedAsyncFunctions.add(prototype);
        return;
      }
    }
    // Static methods stay unbound: toBound asserts Instance, and a
    // static has no receiver to bind.
    if (!item.isStatic) transformPrototype = prototype.toBound(assert(classInstance));
  }
  // A namespaced function transforms like a top-level one: its protocol
  // members register under the file, and generate() emits a top-level
  // entry alias the coordinator can drive. A generic clone arrives here
  // with the namespace-prefixed qualName and file genParent the hook set.
  if (!liftThisInAsyncBody(program, transformPrototype, fail, item.isExtracted)) return;
  let fileBase = sanitizeName(file.source.simplePath);
  let ctx: LiftContext = {
    program,
    file,
    genParent: item.genParent,
    qualName: item.qualName,
    stateClassName: cpsStateClassName(item.qualName),
    stateGlobalName: cpsStateGlobalName(fileBase, item.qualName),
    hasReceiver: (item.isMethod && !item.isStatic) || (!item.isMethod && item.receiverClass != null),
    receiverClass: item.isStatic ? null : item.receiverClass,
    aliases
  };
  let lift = liftEnvInAsyncBody(program, transformPrototype, ctx, item.selfName, item.forbidden, null, fail);
  if (!lift) return;
  for (let a = 0, b = lift.arrows.length; a < b; ++a) {
    worklist.push(arrowWorkItem(lift.arrows[a]));
  }
  let transform = new AsyncFunctionTransform(program, file, transformPrototype, program.asyncSpillPools, program.asyncMints, lift, item.qualName, item.genParent, item.isMethod, item.isStatic, item.receiverClass, program.asyncClassNews, item.outerQual);
  transform.run();
}

/** Turns an extracted arrow into a worklist item. Extracted arrows are
 *  plain functions whose receiver, when present, arrives as a leading
 *  `__async_this` parameter, so they are not methods for the core. */
function arrowWorkItem(arrow: ArrowWorkItem): TransformWorkItem {
  return {
    prototype: arrow.prototype,
    isMethod: false,
    isStatic: false,
    receiverClass: arrow.receiverClass,
    boundClass: null,
    genParent: arrow.genParent,
    qualName: arrow.prototype.name,
    selfName: arrow.selfName,
    forbidden: arrow.forbidden,
    isExtracted: true,
    outerQual: arrow.outerQual,
    outerNames: arrow.outerNames,
    outerArrows: arrow.outerArrows
  };
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
      // Static async methods live in the class's own members, not in
      // instanceMembers; they transform like methods with no receiver.
      let staticMembers = prototype.members;
      if (staticMembers) {
        let staticValues = Map_values(staticMembers);
        for (let j = 0, l = staticValues.length; j < l; ++j) {
          let staticMember = staticValues[j];
          if (
            staticMember.kind == ElementKind.FunctionPrototype &&
            staticMember.is(CommonFlags.Async) &&
            (<FunctionPrototype>staticMember).declaration.kind == NodeKind.MethodDeclaration
          ) {
            methods.push(<FunctionPrototype>staticMember);
          }
        }
      }
    }
  }
}

/** Whether the operator is `=` or a compound assignment operator. */
function isAssignmentOp(op: Token): bool {
  switch (op) {
    case Token.Equals:
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
    case Token.Caret_Equals:
      return true;
    default: return false;
  }
}

/** Maps a compound assignment operator to its plain binary operator. */
function compoundToBinary(op: Token): Token {
  switch (op) {
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
    default: return Token.Equals;
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
  /** Counter for fresh hoisted-await temp names. */
  private hoistCounter: i32 = 0;
  private failed: bool = false;
  private punted: bool = false;
  private stateClassName: string;
  private rootsName: string;
  private fileBase: string;
  /** Element generated declarations are registered under. */
  private genParent: Element;
  /** Whether the prototype is a method (instance or static). */
  private isMethod: bool;
  /** Whether the method is static (no receiver local, no receiver param). */
  private isStatic: bool;
  /** Enclosing class, for methods; `null` for plain functions. */
  private receiverClass: ClassPrototype | null;
  /** Namespace path segments, outermost first; empty for top-level
   *  functions and methods. */
  private namespacePath: string[];
  /** Namespace path of the enclosing class, for methods; empty for
   *  top-level classes and plain functions. */
  private classNamespacePath: string[];
  /** Classes whose `__async_<file>_<Class>_new` export was already
   *  emitted by an earlier transformed method of the class, by export
   *  name. Keyed by name, not prototype: two instantiations of one
   *  generic class need two exports. */
  private classNews: Set<string>;
  /** Lifted closure methods, appended to the state class. */
  private liftedMethods: MethodDeclaration[];
  /** Adapter name to lifted method, for the rewrite hook; `null` when none. */
  private adapters: Map<string, MethodDeclaration> | null;
  /** Whether any adapter exists, so the state global is needed. */
  private hasAdapters: bool;
  /** Whether any async arrow was extracted from the body, so the state
   *  global is needed (extracted arrows read it for their outer). */
  private hasArrows: bool;
  /** Whether the state global is needed: adapters or extracted arrows. */
  private needsStateGlobal: bool;
  /** Per-iteration envs of loop closures, by lifted method name. */
  private loopEnvs = new Map<string, LoopEnvInfo>();
  /** Per-iteration envs of loop closures, by adapter name. */
  private loopInfos = new Map<string, LoopEnvInfo>();
  /** Loop closures whose adapter was rewritten, by adapter name, with
   *  capture types resolved for code generation. */
  private loopBuilds = new Map<string, LoopAdapterBuild>();
  /** Module global holding the currently-stepping state object. */
  private stateGlobalName: string;
  /** QualName of the enclosing async function or method, for an
   *  extracted arrow capturing its locals; `null` otherwise. */
  private outerQual: string | null;
  /** State-field map for this function's locals, keyed by declaration
   *  name range, stashed on success so extracted arrows can resolve
   *  their captures. */
  private fieldMap = new Map<string, OuterFieldInfo>();
  /** State fields holding stored-promise tokens: a local is tracked here
   *  when its binding (declaration initializer or `=` rebind) is a direct
   *  call to a suspending import. Keyed by field, so a shadowing local
   *  with the same name does not inherit the binding. */
  private storedPromises = new Set<string>();

  constructor(
    private program: Program,
    private file: File,
    private prototype: FunctionPrototype,
    private pools: Set<string>,
    private mints: Set<string>,
    lift: EnvLiftResult,
    qualName: string,
    genParent: Element,
    isMethod: bool,
    isStatic: bool,
    receiverClass: ClassPrototype | null,
    classNews: Set<string>,
    outerQual: string | null
  ) {
    this.declaration = <FunctionDeclaration>prototype.declaration;
    this.parent = prototype.parent;
    // Generated declarations for a method on a namespaced class register
    // at file level, not under the namespace: stock asc does not export
    // namespace members, so protocol/entry/_new exports would be
    // unreachable from the coordinator. The qualName carries the
    // namespace path, so the generated names stay unique. A plain
    // namespaced function normalizes the same way, so a caller passing
    // the namespace as genParent (the generic hook's clone path) lands
    // its protocol members under the file like the main loop does.
    let inNamespace = !isMethod && namespacePathOf(prototype).length > 0;
    this.genParent = inNamespace || (isMethod && receiverClass && receiverClass.parent.kind == ElementKind.Namespace)
      ? file
      : genParent;
    this.isMethod = isMethod;
    this.isStatic = isStatic;
    this.receiverClass = receiverClass;
    this.namespacePath = isMethod ? [] : namespacePathOf(prototype);
    this.classNamespacePath = isMethod && receiverClass ? namespacePathOf(receiverClass) : [];
    this.classNews = classNews;
    this.fnName = qualName;
    this.range = this.declaration.range;
    this.fileBase = sanitizeName(file.source.simplePath);
    this.stateClassName = cpsStateClassName(qualName);
    this.rootsName = `__async_roots_${qualName}`;
    this.stateGlobalName = cpsStateGlobalName(this.fileBase, qualName);
    this.liftedMethods = lift.methods;
    this.adapters = lift.adapters.size > 0 ? lift.adapters : null;
    this.hasAdapters = lift.hasAdapters;
    this.hasArrows = lift.arrows.length > 0;
    this.needsStateGlobal = this.hasAdapters || this.hasArrows;
    this.outerQual = outerQual;
    let loopAdapterNames = Map_keys(lift.loopEnvs);
    for (let i = 0, k = loopAdapterNames.length; i < k; ++i) {
      let adapterName = loopAdapterNames[i];
      let info = lift.loopEnvs.get(adapterName)!;
      this.loopInfos.set(adapterName, info);
      let method = lift.adapters.get(adapterName);
      if (method) this.loopEnvs.set(method.name.text, info);
    }
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
      // Publish the field map so extracted arrows can resolve captures.
      outerFieldMaps.set(this.fnName, this.fieldMap);
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
    let instance = this.resolver.resolveFunction(prototype, null, new Map(), ReportMode.Report);
    if (!instance) return TransformOutcome.Rejected;
    this.instance = instance;
    let signature = instance.signature;
    let parameters = prototype.functionTypeNode.parameters;
    for (let i = 0, k = parameters.length; i < k; ++i) {
      let parameter = parameters[i];
      // Optional parameters without an initializer are a stock AS215
      // error (the compiler needs an initializer to fill the omitted
      // argument); defaulted and rest parameters go through the varargs
      // stub, whose defaults are evaluated per call by the stub itself.
      if (parameter.parameterKind == ParameterKind.Optional && !parameter.initializer) {
        this.fail("Async functions with optional parameters without an initializer are not yet supported (AssemblyScript requires an initializer for optional parameters)", parameter.range);
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
    if (this.isMethod && !this.isStatic) {
      let receiverType = signature.thisType;
      if (!receiverType) {
        this.fail("Async methods need a receiver type", this.declaration.name.range);
        return TransformOutcome.Rejected;
      }
      let receiverTypeNode = typeToTypeNode(receiverType, this.declaration.name.range);
      if (!receiverTypeNode) {
        this.fail(`Async methods cannot lift receivers of type '${receiverType.toString()}' yet`, this.declaration.name.range);
        return TransformOutcome.Rejected;
      }
      let outcome = this.declareLocal(ASYNC_THIS_NAME, receiverTypeNode, receiverType, this.declaration.name.range, this.declaration, true);
      if (outcome != TransformOutcome.Transformed) return outcome;
    }
    if (this.outerQual) {
      let outcome = this.declareOuter();
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
    // Any lifted closure whose adapter identifier never passed through
    // the rewrite hook (it should have) is rewritten now with the
    // top-level scope, so a missed body fails loudly instead of
    // compiling with unresolved captures. A loop closure cannot be
    // rewritten here: its captured names are out of scope by now, and
    // its capture call was never emitted.
    let adapters = this.adapters;
    if (adapters) {
      let remaining = Map_values(adapters);
      for (let i = 0, k = remaining.length; i < k; ++i) {
        if (this.loopEnvs.has(remaining[i].name.text)) {
          this.fail(`Loop closure '${remaining[i].name.text}' could not be rewritten`, this.declaration.name.range);
          return TransformOutcome.Rejected;
        }
        if (!rewriteClosureMethod(remaining[i], this.rewriter())) return TransformOutcome.Rejected;
      }
    }
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

  private rewriter(): AsyncRewriter {
    return {
      scope: this.scope,
      fail: this.fail,
      adapters: this.adapters,
      loopEnvs: this.loopEnvs.size > 0 ? this.loopEnvs : null,
      rewriteLoopAdapter: (adapterName: string, method: MethodDeclaration): Expression | null => {
        return this.rewriteLoopAdapter(adapterName, method);
      }
    };
  }

  /** Prepends the slot-0 externref globals to the slot-0 adapter's method
   *  call, matching the hidden externref parameters added above. The
   *  lifter builds slot 0's adapter before externref-ness is known, so
   *  its call is fixed up here once the captures are resolved. */
  private prependLoopAdapterExtArgs(info: LoopEnvInfo, extCaptures: string[]): bool {
    let range = this.range;
    let adapterName = `${info.adapterBase}_0`;
    let member = this.genParent.getMember(adapterName);
    if (!member || member.kind != ElementKind.FunctionPrototype) {
      this.fail(`Loop closure adapter '${adapterName}' could not be found`, range);
      return false;
    }
    let declaration = <FunctionDeclaration>(<FunctionPrototype>member).declaration;
    let body = declaration.body;
    if (!body || body.kind != NodeKind.Block) {
      this.fail(`Loop closure adapter '${adapterName}' has an unexpected body`, range);
      return false;
    }
    let statements = (<BlockStatement>body).statements;
    if (statements.length != 1 || statements[0].kind != NodeKind.Return) {
      this.fail(`Loop closure adapter '${adapterName}' has an unexpected body`, range);
      return false;
    }
    let value = (<ReturnStatement>statements[0]).value;
    if (!value || value.kind != NodeKind.Call) {
      this.fail(`Loop closure adapter '${adapterName}' has an unexpected body`, range);
      return false;
    }
    let call = <CallExpression>value;
    let args = new Array<Expression>();
    for (let i = 0, k = extCaptures.length; i < k; ++i) {
      args.push(ident(this.loopExtName(info.adapterBase, extCaptures[i], 0), range));
    }
    for (let i = 0, k = call.args.length; i < k; ++i) args.push(call.args[i]);
    call.args = args;
    return true;
  }

  /** Rewrites a loop closure's adapter identifier as a call to its capture
   *  helper, snapshotting the current values of its captured names. The
   *  lifted method body is rewritten first, with the enclosing scope still
   *  live, so its captured names resolve to env fields. */
  private rewriteLoopAdapter(adapterName: string, method: MethodDeclaration): Expression | null {
    let info = this.loopInfos.get(adapterName);
    if (!info) {
      this.fail(`Loop closure '${adapterName}' has no per-iteration env`, method.name.range);
      return null;
    }
    let range = method.name.range;
    let types = new Array<Type>();
    let typeNodes = new Array<TypeNode>();
    let args = new Array<Expression>();
    let extCaptures = new Array<string>();
    for (let i = 0, k = info.captures.length; i < k; ++i) {
      let name = info.captures[i];
      let binding = this.scope.lookup(name);
      if (!binding || binding.shadowed || !binding.type) {
        this.fail(`Loop closure captures '${name}' that is not in scope here`, range);
        return null;
      }
      let typeNode = typeToTypeNode(binding.type, range);
      if (!typeNode) {
        this.fail(`Loop closures cannot capture values of type '${binding.type.toString()}' yet`, range);
        return null;
      }
      types.push(binding.type);
      typeNodes.push(typeNode);
      args.push(bindingRead(binding, range));
      if (binding.spilled) extCaptures.push(name);
    }
    if (extCaptures.length > 0) {
      // Externref captures cannot live in the env class (reference-typed
      // fields are not allowed), so each becomes a hidden leading method
      // parameter, fed from a per-slot externref global by the adapter.
      // They precede the env parameter, so references to them in the
      // method body resolve to the parameters.
      let extParams = new Array<ParameterNode>();
      for (let i = 0, k = extCaptures.length; i < k; ++i) {
        extParams.push(new ParameterNode(
          ParameterKind.Default,
          ident(extCaptures[i], range),
          namedType("externref", null, false, range),
          null,
          range
        ));
      }
      let methodParams = method.signature.parameters;
      let newParams = new Array<ParameterNode>();
      for (let i = 0, k = extParams.length; i < k; ++i) newParams.push(extParams[i]);
      for (let i = 0, k = methodParams.length; i < k; ++i) newParams.push(methodParams[i]);
      method.signature.parameters = newParams;
      if (!this.prependLoopAdapterExtArgs(info, extCaptures)) return null;
    }
    if (!rewriteClosureMethod(method, this.rewriter())) return null;
    this.loopBuilds.set(adapterName, new LoopAdapterBuild(info, method, types, typeNodes, extCaptures));
    return callExpr(ident(info.captureName, range), args, range);
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
        shadowed: false,
        type,
        envReceiver: ""
      });
      this.recordField(name, nameRange, "", true, slotField);
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
      shadowed: false,
      type,
      envReceiver: ""
    });
    this.recordField(name, nameRange, fieldName, false, "");
    return TransformOutcome.Transformed;
  }

  /** Records a lifted local in the field map, so an extracted arrow
   *  can resolve a capture of it. Synthetic names are not user locals. */
  private recordField(name: string, nameRange: Range, field: string, spilled: bool, slotField: string): void {
    if (name == ASYNC_THIS_NAME || name == ASYNC_OUTER_NAME) return;
    this.fieldMap.set(outerFieldKey(nameRange), { field, spilled, slotField });
  }

  /** Declares the `__async_outer` state field holding the enclosing
   *  function's state object, and binds the name in the scope so the
   *  rewriter turns references into `this.__async_outer`. */
  private declareOuter(): TransformOutcome {
    let outerQual = assert(this.outerQual);
    let range = this.range;
    if (this.scope.lookupCurrent(ASYNC_OUTER_NAME)) {
      this.fail(`Async arrows cannot capture a local named '${ASYNC_OUTER_NAME}'`, range);
      return TransformOutcome.Rejected;
    }
    let outerClassName = cpsStateClassName(outerQual);
    let outerTypeNode = namedType(outerClassName, null, false, range);
    let flow = assert(this.flow);
    let outerType = this.resolver.resolveType(outerTypeNode, flow, this.parent, new Map());
    if (!outerType) return TransformOutcome.Rejected;
    this.fields.push(new StateField(ASYNC_OUTER_NAME, outerTypeNode, outerType));
    this.scope.declare(ASYNC_OUTER_NAME, {
      field: ASYNC_OUTER_NAME,
      spilled: false,
      slotField: "",
      range,
      shadowed: false,
      type: outerType,
      envReceiver: ""
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

  /** Declares a per-site temp holding a value captured before suspension. */
  private declareTemp(type: Type, range: Range): AwaitTemp | null {
    if (type.kind == TypeKind.Extern) {
      let n = this.fieldCounter++;
      let slotField = `__slot_tmp_${n}`;
      this.slots.push(new SpillSlot("temp", `tmp${n}`, slotField));
      return new AwaitTemp("", slotField, true);
    }
    let typeNode = typeToTypeNode(type, range);
    if (!typeNode) {
      this.fail(`Async functions cannot lift locals of type '${type.toString()}' yet`, range);
      return null;
    }
    if (!zeroValue(type, typeNode, range)) {
      this.fail(`Async functions cannot lift locals of type '${type.toString()}' yet`, range);
      return null;
    }
    let fieldName = `__tmp_${this.fieldCounter++}`;
    this.fields.push(new StateField(fieldName, typeNode, type));
    return new AwaitTemp(fieldName, "", false);
  }

  /** The expression reading a per-site temp. */
  private tempRead(temp: AwaitTemp, range: Range): Expression {
    if (temp.spilled) {
      return callExpr(ident(SPILL_GET, range), [ thisProp(temp.slotField, range) ], range);
    }
    return thisProp(temp.field, range);
  }

  /** Emits the write of a value into a per-site temp. */
  private emitTempWrite(temp: AwaitTemp, value: Expression, range: Range): void {
    if (temp.spilled) {
      this.emit(exprStmt(callExpr(
        ident(SPILL_SET, range),
        [ thisProp(temp.slotField, range), value ],
        range
      )));
      return;
    }
    this.emit(exprStmt(assignExpr(thisProp(temp.field, range), value, range)));
  }

  /** Resolves the type of an expression against the current flow. */
  private resolveExprType(expr: Expression, range: Range): Type | null {
    let type = this.resolver.resolveExpression(expr, assert(this.flow), Type.auto, ReportMode.Swallow);
    if (!type) this.punted = true;
    return type;
  }

  /** Captures an already-rewritten expression into a per-site temp. */
  private captureTemp(type: Type, value: Expression, range: Range): AwaitTemp | null {
    let temp = this.declareTemp(type, range);
    if (!temp) return null;
    this.emitTempWrite(temp, value, range);
    return temp;
  }

  /** Captures an original expression (rewritten, then captured) into a per-site temp. */
  private captureOriginal(expr: Expression, range: Range): AwaitTemp | null {
    let type = this.resolveExprType(expr, range);
    if (!type) return null;
    let rewritten = rewriteExpression(expr, this.rewriter());
    if (!rewritten) {
      this.failed = true;
      return null;
    }
    return this.captureTemp(type, rewritten, range);
  }

  /** Prepares an assignment target: captures the receiver, index and,
   *  for compound assignments, current value into per-site temps. */
  private prepareAwaitTarget(left: Expression, compound: bool, operator: Token, range: Range): AwaitTarget | null {
    // Resolve the current-value type up front: capturing the receiver or
    // index rewrites the target in place, so it must not be resolved after.
    let readType: Type | null = null;
    if (compound) {
      readType = this.resolveExprType(left, range);
      if (!readType) return null;
    }
    if (left.kind == NodeKind.Identifier) {
      let name = (<IdentifierExpression>left).text;
      let binding = this.scope.lookup(name);
      let readTemp: AwaitTemp | null = null;
      if (compound) {
        readTemp = this.captureOriginal(left, range);
        if (!readTemp) return null;
      }
      let spilledSlotField = binding && binding.spilled ? binding.slotField : "";
      let field = binding && !binding.spilled ? binding.field : "";
      let buildTarget = (targetRange: Range): Expression => {
        if (field != "") return thisProp(field, targetRange);
        return ident(name, targetRange);
      };
      return new AwaitTarget(readTemp, spilledSlotField, buildTarget, this.localTypeNode(name), compound ? compoundToBinary(operator) : Token.Equals);
    }
    if (left.kind == NodeKind.PropertyAccess) {
      let access = <PropertyAccessExpression>left;
      let receiverTemp = this.captureOriginal(access.expression, range);
      if (!receiverTemp) return null;
      let property = access.property.text;
      let buildTarget = (targetRange: Range): Expression => {
        return new PropertyAccessExpression(this.tempRead(receiverTemp, targetRange), ident(property, targetRange), targetRange);
      };
      let readTemp: AwaitTemp | null = null;
      if (compound) {
        readTemp = this.captureTemp(assert(readType), buildTarget(range), range);
        if (!readTemp) return null;
      }
      return new AwaitTarget(readTemp, "", buildTarget, null, compound ? compoundToBinary(operator) : Token.Equals);
    }
    let access = <ElementAccessExpression>left;
    let objectTemp = this.captureOriginal(access.expression, range);
    if (!objectTemp) return null;
    let indexTemp = this.captureOriginal(access.elementExpression, range);
    if (!indexTemp) return null;
    let buildTarget = (targetRange: Range): Expression => {
      return new ElementAccessExpression(this.tempRead(objectTemp, targetRange), this.tempRead(indexTemp, targetRange), targetRange);
    };
    let readTemp: AwaitTemp | null = null;
    if (compound) {
      readTemp = this.captureTemp(assert(readType), buildTarget(range), range);
      if (!readTemp) return null;
    }
    return new AwaitTarget(readTemp, "", buildTarget, null, compound ? compoundToBinary(operator) : Token.Equals);
  }

  /** Emits the resume-side assignment of an awaited value into its target. */
  private emitAwaitTargetAssign(target: AwaitTarget, value: Expression, range: Range): void {
    let rhs = value;
    if (target.readTemp) {
      rhs = new BinaryExpression(target.binaryOp, this.tempRead(target.readTemp, range), value, range);
    }
    if (target.spilledSlotField != "") {
      this.emit(exprStmt(callExpr(
        ident(SPILL_SET, range),
        [ thisProp(target.spilledSlotField, range), rhs ],
        range
      )));
      return;
    }
    this.emit(exprStmt(assignExpr(assert(target.buildTarget)(range), rhs, range)));
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
        this.transformVariable(<VariableStatement>stmt, breakTarget);
        return;
      }
      case NodeKind.Expression: {
        this.transformExpressionStatement(<ExpressionStatement>stmt, breakTarget);
        return;
      }
      case NodeKind.Return: {
        this.transformReturn(<ReturnStatement>stmt, breakTarget);
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
      case NodeKind.Switch: {
        this.transformSwitch(<SwitchStatement>stmt, cont, breakTarget, continueTarget, isLast);
        return;
      }
      case NodeKind.ForOf: {
        this.transformForOf(<ForOfStatement>stmt, cont, breakTarget, continueTarget, isLast);
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
      case NodeKind.Throw: {
        // The try desugar binds every thrown value to a local first, so
        // this sees an identifier; derive its message and value with
        // full type info and fail the task with both.
        let thrown = (<ThrowStatement>stmt).value;
        let type = this.resolver.resolveExpression(thrown, assert(this.flow), Type.auto, ReportMode.Swallow);
        if (!type) {
          this.punted = true;
          return;
        }
        if (type.kind == TypeKind.Void) {
          this.fail("Cannot throw a value of type 'void'", stmt.range);
          return;
        }
        let rewritten = this.rewriteChecked(thrown);
        if (!rewritten) return;
        let derived = this.throwMessageAndValue(rewritten, type, stmt.range);
        if (!derived) return;
        this.emitThrowFail(derived.message, derived.value, stmt.range);
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

  private failAwaitPosition(range: Range): void {
    this.fail("'await' is only supported as a whole expression statement, variable initializer, assignment or return value", range);
  }

  private checkNoAwait(expr: Expression): bool {
    if (containsAwait(expr)) {
      this.failAwaitPosition(expr.range);
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

  /** Hoists each await in `expr` sitting in a hoistable position into a
   *  fresh temp local (through the variable-initializer machinery),
   *  replacing it with the temp identifier, in evaluation order.
   *  Awaits in short-circuited positions stay loud: the right side of
   *  `&&`/`||` and the branches of a ternary. Returns the rewritten
   *  expression, or null on failure. Await-free expressions come back
   *  unchanged, so existing callers keep their behaviour. */
  private hoistAwaits(expr: Expression, breakTarget: i32): Expression | null {
    if (expr.kind == NodeKind.Await) {
      return this.hoistAwaitExpr(<AwaitExpression>expr, breakTarget);
    }
    if (expr instanceof BinaryExpression) {
      if (expr.operator == Token.Ampersand_Ampersand || expr.operator == Token.Bar_Bar) {
        let left = this.hoistAwaits(expr.left, breakTarget);
        if (!left) return null;
        expr.left = left;
        if (containsAwait(expr.right)) {
          this.failAwaitPosition(expr.right.range);
          return null;
        }
        return expr;
      }
      if (isAssignmentOp(expr.operator)) {
        if (containsAwait(expr.left)) {
          this.failAwaitPosition(expr.left.range);
          return null;
        }
        if (expr.operator != Token.Equals && containsAwait(expr.right)) {
          this.failAwaitPosition(expr.right.range);
          return null;
        }
        let right = this.hoistAwaits(expr.right, breakTarget);
        if (!right) return null;
        expr.right = right;
        return expr;
      }
      let left = this.hoistAwaits(expr.left, breakTarget);
      if (!left) return null;
      expr.left = left;
      let right = this.hoistAwaits(expr.right, breakTarget);
      if (!right) return null;
      expr.right = right;
      return expr;
    }
    if (expr instanceof CallExpression) {
      let callee = this.hoistAwaits(expr.expression, breakTarget);
      if (!callee) return null;
      expr.expression = callee;
      let args = expr.args;
      for (let i = 0, k = args.length; i < k; ++i) {
        let arg = this.hoistAwaits(args[i], breakTarget);
        if (!arg) return null;
        args[i] = arg;
      }
      return expr;
    }
    if (expr instanceof NewExpression) {
      let args = expr.args;
      for (let i = 0, k = args.length; i < k; ++i) {
        let arg = this.hoistAwaits(args[i], breakTarget);
        if (!arg) return null;
        args[i] = arg;
      }
      return expr;
    }
    if (expr instanceof PropertyAccessExpression) {
      let object = this.hoistAwaits(expr.expression, breakTarget);
      if (!object) return null;
      expr.expression = object;
      return expr;
    }
    if (expr instanceof ElementAccessExpression) {
      let object = this.hoistAwaits(expr.expression, breakTarget);
      if (!object) return null;
      expr.expression = object;
      let element = this.hoistAwaits(expr.elementExpression, breakTarget);
      if (!element) return null;
      expr.elementExpression = element;
      return expr;
    }
    if (expr instanceof UnaryPrefixExpression || expr instanceof UnaryPostfixExpression) {
      let operand = this.hoistAwaits(expr.operand, breakTarget);
      if (!operand) return null;
      expr.operand = operand;
      return expr;
    }
    if (expr instanceof TernaryExpression) {
      let condition = this.hoistAwaits(expr.condition, breakTarget);
      if (!condition) return null;
      expr.condition = condition;
      if (containsAwait(expr.ifThen)) {
        this.failAwaitPosition(expr.ifThen.range);
        return null;
      }
      if (containsAwait(expr.ifElse)) {
        this.failAwaitPosition(expr.ifElse.range);
        return null;
      }
      return expr;
    }
    if (expr instanceof AssertionExpression) {
      let inner = this.hoistAwaits(expr.expression, breakTarget);
      if (!inner) return null;
      expr.expression = inner;
      return expr;
    }
    if (expr instanceof ParenthesizedExpression) {
      let inner = this.hoistAwaits(expr.expression, breakTarget);
      if (!inner) return null;
      expr.expression = inner;
      return expr;
    }
    if (expr instanceof CommaExpression) {
      let exprs = expr.expressions;
      for (let i = 0, k = exprs.length; i < k; ++i) {
        let inner = this.hoistAwaits(exprs[i], breakTarget);
        if (!inner) return null;
        exprs[i] = inner;
      }
      return expr;
    }
    if (expr instanceof InstanceOfExpression) {
      let inner = this.hoistAwaits(expr.expression, breakTarget);
      if (!inner) return null;
      expr.expression = inner;
      return expr;
    }
    if (expr instanceof ArrayLiteralExpression) {
      let elements = expr.elementExpressions;
      for (let i = 0, k = elements.length; i < k; ++i) {
        let element = this.hoistAwaits(elements[i], breakTarget);
        if (!element) return null;
        elements[i] = element;
      }
      return expr;
    }
    if (expr instanceof ObjectLiteralExpression) {
      let values = expr.values;
      for (let i = 0, k = values.length; i < k; ++i) {
        let value = this.hoistAwaits(values[i], breakTarget);
        if (!value) return null;
        values[i] = value;
      }
      return expr;
    }
    if (expr instanceof TemplateLiteralExpression) {
      if (expr.tag) {
        let tag = this.hoistAwaits(expr.tag, breakTarget);
        if (!tag) return null;
        expr.tag = tag;
      }
      let exprs = expr.expressions;
      for (let i = 0, k = exprs.length; i < k; ++i) {
        let inner = this.hoistAwaits(exprs[i], breakTarget);
        if (!inner) return null;
        exprs[i] = inner;
      }
      return expr;
    }
    return expr;
  }

  /** Hoists one await into a fresh temp local: awaits nested in the
   *  operand are hoisted first (a join await goes whole, so its member
   *  diagnostics survive), then the await itself becomes a temp
   *  initializer through the variable machinery. */
  private hoistAwaitExpr(node: AwaitExpression, breakTarget: i32): Expression | null {
    if (!this.joinCallOf(node)) {
      let operand = this.hoistAwaits(node.operand, breakTarget);
      if (!operand) return null;
      node.operand = operand;
    }
    let name = this.freshHoistName();
    let declaration = new VariableDeclaration(
      ident(name, node.range), null, CommonFlags.Let, null, node, node.range
    );
    let statement = new VariableStatement(null, [ declaration ], node.range);
    this.transformVariable(statement, breakTarget);
    if (this.failed || this.punted) return null;
    return ident(name, node.range);
  }

  /** A temp name no binding in scope uses. */
  private freshHoistName(): string {
    let name: string;
    do {
      name = "__async_hoist_" + this.hoistCounter.toString();
      this.hoistCounter++;
    } while (this.scope.lookup(name) != null);
    return name;
  }

  // === Statements ===============================================================================

  private transformVariable(stmt: VariableStatement, breakTarget: i32): void {
    let declarations = stmt.declarations;
    for (let i = 0, k = declarations.length; i < k; ++i) {
      let declaration = declarations[i];
      let name = declaration.name.text;
      let initializer = declaration.initializer;
      if (initializer && unwrapParens(initializer).kind == NodeKind.Await) {
        let awaitExpr = <AwaitExpression>unwrapParens(initializer);
        let joinCall = this.joinCallOf(awaitExpr);
        if (joinCall) {
          let join = this.prepareJoin(joinCall, assert(joinPolicyOfCall(joinCall)), true, awaitExpr.range, declaration.type);
          if (!join) return;
          let type: Type | null = join.resultType;
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
          let status = this.emitJoin(join, (value: Expression): void => {
            this.emitLocalAssign(name, value, declaration.range);
          }, breakTarget);
          if (status == JoinEmitOutcome.FailedInline) return;
          continue;
        }
        let site = this.transformAwait(awaitExpr, true);
        if (!site) return;
        if (site.type.kind == TypeKind.Void) {
          this.fail("Cannot store the result of 'await' of type 'void' in a variable; await it as a statement instead", awaitExpr.range);
          return;
        }
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
        let hoisted = this.hoistAwaits(initializer, breakTarget);
        if (!hoisted) return;
        let rewrittenInit = this.rewriteChecked(hoisted);
        if (!rewrittenInit) return;
        this.emitLocalAssign(name, rewrittenInit, declaration.range);
        if (this.isSuspendingImportCall(initializer) || this.isTrackedStoredValue(initializer)) {
          let binding = this.scope.lookup(name);
          if (binding) this.storedPromises.add(binding.field);
        }
      }
    }
  }

  private transformExpressionStatement(stmt: ExpressionStatement, breakTarget: i32): void {
    let expr = unwrapParens(stmt.expression);
    if (expr.kind == NodeKind.Call) {
      let call = <CallExpression>expr;
      let callee = call.expression;
      if (callee.kind == NodeKind.Identifier) {
        let name = (<IdentifierExpression>callee).text;
        if (name == TRY_THROW_MARKER) {
          this.lowerTryThrow(call, stmt.range);
          return;
        }
        if (name == TRY_FAIL_MARKER) {
          this.lowerTryFail(call, stmt.range);
          return;
        }
      }
    }
    if (expr.kind == NodeKind.Await) {
      let awaitExpr = <AwaitExpression>expr;
      let joinCall = this.joinCallOf(awaitExpr);
      if (joinCall) {
        let join = this.prepareJoin(joinCall, assert(joinPolicyOfCall(joinCall)), false, awaitExpr.range, null);
        if (!join) return;
        let status = this.emitJoin(join, (_value: Expression): void => {}, breakTarget);
        if (status == JoinEmitOutcome.FailedInline) return;
        return;
      }
      let site = this.transformAwait(awaitExpr, false);
      if (!site) return;
      this.suspendCurrent(site);
      return;
    }
    if (
      expr.kind == NodeKind.Binary &&
      isAssignmentOp((<BinaryExpression>expr).operator) &&
      unwrapParens((<BinaryExpression>expr).right).kind == NodeKind.Await
    ) {
      this.trackStoredRebind(stmt.expression);
      this.transformAwaitAssignment(<BinaryExpression>expr, stmt.range, breakTarget);
      return;
    }
    if (
      expr.kind == NodeKind.Binary &&
      isAssignmentOp((<BinaryExpression>expr).operator) &&
      containsAwait((<BinaryExpression>expr).right)
    ) {
      this.checkDirectAsyncCalls(stmt.expression);
      if (this.failed) return;
      this.trackStoredRebind(stmt.expression);
      if (!this.transformAwaitAssignmentExpr(<BinaryExpression>expr, stmt.range, breakTarget)) return;
      return;
    }
    this.checkDirectAsyncCalls(stmt.expression);
    if (this.failed) return;
    this.trackStoredRebind(stmt.expression);
    let hoisted = this.hoistAwaits(stmt.expression, breakTarget);
    if (!hoisted) return;
    let rewritten = this.rewriteChecked(hoisted);
    if (!rewritten) return;
    this.emit(exprStmt(rewritten));
  }

  /** Transforms `L op= await E` for a local, field or element target,
   *  capturing the target's subexpressions and current value before the
   *  suspension and writing through the temps on resume. */
  private transformAwaitAssignment(binary: BinaryExpression, range: Range, breakTarget: i32): void {
    let operator = binary.operator;
    let left = unwrapParens(binary.left);
    let awaitExpr = <AwaitExpression>unwrapParens(binary.right);
    if (
      left.kind != NodeKind.Identifier &&
      left.kind != NodeKind.PropertyAccess &&
      left.kind != NodeKind.ElementAccess
    ) {
      this.fail("'await' can only be assigned to a local variable", left.range);
      return;
    }
    if (!this.checkNoAwait(left)) return;
    this.checkDirectAsyncCalls(left);
    if (this.failed) return;
    let target = this.prepareAwaitTarget(left, operator != Token.Equals, operator, range);
    if (!target) return;
    let joinCall = this.joinCallOf(awaitExpr);
    if (joinCall) {
      let join = this.prepareJoin(joinCall, assert(joinPolicyOfCall(joinCall)), true, awaitExpr.range, target.expectedTypeNode);
      if (!join) return;
      let status = this.emitJoin(join, (value: Expression): void => {
        this.emitAwaitTargetAssign(target, value, range);
      }, breakTarget);
      if (status == JoinEmitOutcome.FailedInline) return;
      return;
    }
    let site = this.transformAwait(awaitExpr, true);
    if (!site) return;
    if (site.type.kind == TypeKind.Void) {
      this.fail("Cannot assign the result of 'await' of type 'void'; await it as a statement instead", awaitExpr.range);
      return;
    }
    this.suspendCurrent(site);
    this.emitAwaitTargetAssign(target, this.pendAccess(site, range), range);
  }

  /** Transforms `L op= <expr containing await>` where the RHS is not a
   *  whole await: captures the target before suspension, hoists the RHS
   *  awaits into temps, then writes through the temps. Returns false on
   *  failure. */
  private transformAwaitAssignmentExpr(binary: BinaryExpression, range: Range, breakTarget: i32): bool {
    let operator = binary.operator;
    let left = unwrapParens(binary.left);
    if (
      left.kind != NodeKind.Identifier &&
      left.kind != NodeKind.PropertyAccess &&
      left.kind != NodeKind.ElementAccess
    ) {
      this.fail("'await' can only be assigned to a local variable", left.range);
      return false;
    }
    if (!this.checkNoAwait(left)) return false;
    this.checkDirectAsyncCalls(binary);
    if (this.failed) return false;
    let target = this.prepareAwaitTarget(left, operator != Token.Equals, operator, range);
    if (!target) return false;
    let hoisted = this.hoistAwaits(binary.right, breakTarget);
    if (!hoisted) return false;
    let rewritten = this.rewriteChecked(hoisted);
    if (!rewritten) return false;
    this.emitAwaitTargetAssign(target, rewritten, range);
    return true;
  }

  /** Transforms a `for` incrementor: an assignment with awaits goes
   *  through the target-capture path, anything else through hoisting.
   *  Returns false on failure. */
  private transformIncrementor(expr: Expression, range: Range, breakTarget: i32): bool {
    let node = unwrapParens(expr);
    if (node.kind == NodeKind.Binary && isAssignmentOp((<BinaryExpression>node).operator)) {
      let binary = <BinaryExpression>node;
      if (unwrapParens(binary.right).kind == NodeKind.Await) {
        this.trackStoredRebind(expr);
        this.transformAwaitAssignment(binary, range, breakTarget);
        return !this.failed && !this.punted;
      }
      if (containsAwait(binary.right)) {
        this.checkDirectAsyncCalls(expr);
        if (this.failed) return false;
        this.trackStoredRebind(expr);
        return this.transformAwaitAssignmentExpr(binary, range, breakTarget);
      }
    }
    this.checkDirectAsyncCalls(expr);
    if (this.failed) return false;
    this.trackStoredRebind(expr);
    let hoisted = this.hoistAwaits(expr, breakTarget);
    if (!hoisted) return false;
    let rewritten = this.rewriteChecked(hoisted);
    if (!rewritten) return false;
    this.emit(exprStmt(rewritten));
    return true;
  }

  /** Lowers the try desugar's throw marker: derives the message and value
   *  from the bound thrown value and records them in the frame's slots,
   *  guarded so a coordinator rejection resuming at this segment is not
   *  clobbered by the (zero) bound value. */
  private lowerTryThrow(call: CallExpression, range: Range): void {
    let args = call.args;
    if (args.length != 4) {
      this.fail("Invalid '" + TRY_THROW_MARKER + "' marker", range);
      return;
    }
    let thrown = args[0];
    let type = this.resolver.resolveExpression(thrown, assert(this.flow), Type.auto, ReportMode.Swallow);
    if (!type) {
      this.punted = true;
      return;
    }
    if (type.kind == TypeKind.Void) {
      this.fail("Cannot throw a value of type 'void'", range);
      return;
    }
    let rewritten = this.rewriteChecked(thrown);
    if (!rewritten) return;
    let derived = this.throwMessageAndValue(rewritten, type, range);
    if (!derived) return;
    let errVar = this.rewriteChecked(args[1]);
    if (!errVar) return;
    let errValVar = this.rewriteChecked(args[2]);
    if (!errValVar) return;
    let flagCond = this.rewriteChecked(args[3]);
    if (!flagCond) return;
    let flagSet = this.rewriteChecked(args[3]);
    if (!flagSet) return;
    this.emit(new IfStatement(
      new UnaryPrefixExpression(Token.Exclamation, flagCond, range),
      blockStmt([
        exprStmt(assignExpr(errVar, derived.message, range)),
        exprStmt(assignExpr(errValVar, derived.value, range)),
        exprStmt(assignExpr(flagSet, new TrueExpression(range), range))
      ], range),
      null,
      range
    ));
  }

  /** Lowers the try desugar's fail marker: the message and value are
   *  already computed, so they go straight to the error slots and fail
   *  the task. */
  private lowerTryFail(call: CallExpression, range: Range): void {
    let args = call.args;
    if (args.length != 2) {
      this.fail("Invalid '" + TRY_FAIL_MARKER + "' marker", range);
      return;
    }
    let message = this.rewriteChecked(args[0]);
    if (!message) return;
    let value = this.rewriteChecked(args[1]);
    if (!value) return;
    this.emitThrowFail(message, value, range);
  }

  private transformReturn(stmt: ReturnStatement, breakTarget: i32): void {
    let value = stmt.value;
    if (value && unwrapParens(value).kind == NodeKind.Await) {
      let awaitExpr = <AwaitExpression>unwrapParens(value);
      let joinCall = this.joinCallOf(awaitExpr);
      if (joinCall) {
        let join = this.prepareJoin(joinCall, assert(joinPolicyOfCall(joinCall)), true, awaitExpr.range, this.returnTypeNode);
        if (!join) return;
        let status = this.emitJoin(join, (result: Expression): void => {
          if (this.returnType.kind != TypeKind.Void) {
            this.emitResultAssign(result, stmt.range);
          }
        }, breakTarget);
        if (status == JoinEmitOutcome.FailedInline) return;
        this.emitTerminal(stmt.range);
        return;
      }
      let site = this.transformAwait(awaitExpr, true);
      if (!site) return;
      if (site.type.kind == TypeKind.Void && this.returnType.kind != TypeKind.Void) {
        this.fail("Cannot return the result of 'await' of type 'void' from a function returning '" + this.returnType.toString() + "'", awaitExpr.range);
        return;
      }
      this.suspendCurrent(site);
      this.emitReturnAssignment(site, stmt.range);
      this.emitTerminal(stmt.range);
      return;
    }
    if (value) {
      this.checkDirectAsyncCalls(value);
      if (this.failed) return;
      let hoisted = this.hoistAwaits(value, breakTarget);
      if (!hoisted) return;
      let rewritten = this.rewriteChecked(hoisted);
      if (!rewritten) return;
      if (this.returnType.kind != TypeKind.Void) {
        this.emitResultAssign(rewritten, stmt.range);
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
    this.checkDirectAsyncCalls(stmt.condition);
    if (this.failed) return;
    let condition = this.hoistAwaits(stmt.condition, breakTarget);
    if (!condition) return;
    condition = this.rewriteChecked(condition);
    if (!condition) return;
    let join: i32;
    if (isLast) {
      join = cont;
    } else {
      join = this.createSegment();
    }
    let thenEntry = this.createSegment();
    let elseEntry: i32;
    if (stmt.ifFalse) {
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
    if (stmt.ifFalse) {
      this.setCurrent(elseEntry);
      this.pushScope();
      this.transformList(asStatements(stmt.ifFalse), join, breakTarget, continueTarget);
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
    // The condition is hoisted here, in the head segment, so its awaits
    // re-evaluate on every iteration.
    this.checkDirectAsyncCalls(stmt.condition);
    if (this.failed) return;
    let condition = this.hoistAwaits(stmt.condition, breakTarget);
    if (!condition) return;
    condition = this.rewriteChecked(condition);
    if (!condition) return;
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
    this.closeCurrent(new SegmentEnd("jump", head));
    this.setCurrent(head);
    // The condition is hoisted here, in the head segment, so its awaits
    // re-evaluate on every iteration.
    let condition: Expression | null = null;
    if (stmt.condition) {
      this.checkDirectAsyncCalls(stmt.condition);
      if (this.failed) {
        this.popScope();
        return;
      }
      condition = this.hoistAwaits(stmt.condition, breakTarget);
      if (!condition) {
        this.popScope();
        return;
      }
      condition = this.rewriteChecked(condition);
      if (!condition) {
        this.popScope();
        return;
      }
    }
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
      if (!this.transformIncrementor(stmt.incrementor, stmt.range, breakTarget)) {
        this.popScope();
        return;
      }
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
    // The condition is hoisted here, in the condition segment, so its
    // awaits re-evaluate on every iteration.
    this.checkDirectAsyncCalls(stmt.condition);
    if (this.failed) return;
    let condition = this.hoistAwaits(stmt.condition, breakTarget);
    if (!condition) return;
    condition = this.rewriteChecked(condition);
    if (!condition) return;
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

  /** Reads a lifted local by name, honouring spill slots. */
  private localAccess(name: string, range: Range): Expression {
    let binding = this.scope.lookup(name);
    assert(binding != null);
    if (binding!.spilled) {
      return callExpr(ident(SPILL_GET, range), [ thisProp(binding!.slotField, range) ], range);
    }
    return thisProp(binding!.field, range);
  }

  /** Transforms a `switch` whose cases may await. The discriminant is
   *  evaluated once into a lifted local; a generated switch in the
   *  dispatch segment routes to one entry segment per case, and each
   *  case list falls through to the next case's entry, so `break`,
   *  fallthrough and `default` keep their ordinary meaning. A `return`
   *  inside a case completes the task through the usual terminal
   *  segment instead of returning raw out of `step()`. */
  private transformSwitch(
    stmt: SwitchStatement,
    cont: i32,
    breakTarget: i32,
    continueTarget: i32,
    isLast: bool
  ): void {
    let range = stmt.range;
    if (containsAwait(stmt.condition)) {
      this.fail("'await' in a 'switch' condition is not yet supported", stmt.condition.range);
      return;
    }
    let cases = stmt.cases;
    for (let i = 0, k = cases.length; i < k; ++i) {
      if (cases[i].label && containsAwait(cases[i].label!)) {
        this.fail("'await' in a 'switch' case label is not yet supported", cases[i].label!.range);
        return;
      }
    }
    let flow = assert(this.flow);
    let condType = this.resolver.resolveExpression(stmt.condition, flow, Type.auto, ReportMode.Swallow);
    if (!condType) {
      this.punted = true;
      return;
    }
    let condTypeNode = typeToTypeNode(condType, range);
    if (!condTypeNode && condType.kind != TypeKind.Extern) {
      this.fail(`Async functions cannot switch on values of type '${condType.toString()}' yet`, range);
      return;
    }
    let condition = this.rewriteChecked(stmt.condition);
    if (!condition) return;
    let after: i32;
    if (isLast) {
      after = cont;
    } else {
      after = this.createSegment();
    }
    let afterResolved = this.resolveCont(after);
    let entries = new Array<i32>(cases.length);
    for (let i = 0, k = cases.length; i < k; ++i) entries[i] = this.createSegment();
    let defaultEntry = afterResolved;
    for (let i = 0, k = cases.length; i < k; ++i) {
      if (cases[i].isDefault) defaultEntry = entries[i];
    }
    this.pushScope();
    let discName = `__async_sw_${this.fieldCounter}`;
    let outcome = this.declareLocal(discName, condTypeNode, condType, range, stmt, false);
    if (outcome != TransformOutcome.Transformed) {
      this.popScope();
      return;
    }
    this.emitLocalAssign(discName, condition, range);
    let dispatchCases = new Array<SwitchCase>();
    for (let i = 0, k = cases.length; i < k; ++i) {
      let label = cases[i].label;
      let rewrittenLabel: Expression | null = null;
      if (label) {
        rewrittenLabel = rewriteExpression(label, this.rewriter());
        if (!rewrittenLabel) {
          this.popScope();
          this.failed = true;
          return;
        }
      }
      dispatchCases.push(new SwitchCase(
        rewrittenLabel,
        [
          exprStmt(assignExpr(this.stateAccess(range), this.segState(entries[i], range), range)),
          new BreakStatement(null, range)
        ],
        range
      ));
    }
    let hasDefault = false;
    for (let i = 0, k = cases.length; i < k; ++i) {
      if (cases[i].isDefault) hasDefault = true;
    }
    if (!hasDefault) {
      dispatchCases.push(new SwitchCase(
        null,
        [
          exprStmt(assignExpr(this.stateAccess(range), this.segState(defaultEntry, range), range)),
          new BreakStatement(null, range)
        ],
        range
      ));
    }
    this.emit(new SwitchStatement(this.localAccess(discName, range), dispatchCases, range));
    this.closeCurrent(new SegmentEnd("redispatch"));
    for (let i = 0, k = cases.length; i < k; ++i) {
      let next = i + 1 < k ? entries[i + 1] : afterResolved;
      this.setCurrent(entries[i]);
      this.transformList(cases[i].statements, next, afterResolved, continueTarget);
      if (this.failed || this.punted) {
        this.popScope();
        return;
      }
    }
    this.popScope();
    if (!isLast) {
      this.setCurrent(after);
    }
  }

  /** Transforms a `for-of` over an array, lowering it to an indexed loop
   *  whose index, iterable and element locals all survive suspension.
   *  The compiler has no iterator support at all (even sync `for-of`
   *  fails with "Not implemented: Iterators"), so any other iterable
   *  stays loud. */
  private transformForOf(
    stmt: ForOfStatement,
    cont: i32,
    breakTarget: i32,
    continueTarget: i32,
    isLast: bool
  ): void {
    let range = stmt.range;
    if (containsAwait(stmt.iterable)) {
      this.fail("'await' in a 'for-of' iterable is not yet supported", stmt.iterable.range);
      return;
    }
    let flow = assert(this.flow);
    let iterType = this.resolver.resolveExpression(stmt.iterable, flow, Type.auto, ReportMode.Swallow);
    if (!iterType) {
      this.punted = true;
      return;
    }
    let iterClass = iterType.getClass();
    let typeArguments = iterClass ? iterClass.typeArguments : null;
    if (!iterClass || iterClass.prototype.name != "Array" || !typeArguments || typeArguments.length != 1) {
      this.fail("'for-of' in async functions is only supported over arrays; the compiler has no iterator support for other iterables", stmt.iterable.range);
      return;
    }
    let elementType = typeArguments[0];
    let elementTypeNode = typeToTypeNode(elementType, range);
    if (!elementTypeNode) {
      this.fail(`Async functions cannot iterate arrays of type '${elementType.toString()}' yet`, range);
      return;
    }
    let elementName: string | null = null;
    let elementRange = range;
    if (stmt.variable.kind == NodeKind.Variable) {
      let declarations = (<VariableStatement>stmt.variable).declarations;
      if (declarations.length != 1) {
        this.fail("'for-of' in async functions takes exactly one loop variable", stmt.variable.range);
        return;
      }
      elementName = declarations[0].name.text;
      elementRange = declarations[0].name.range;
    } else if (stmt.variable.kind == NodeKind.Expression) {
      let expr = (<ExpressionStatement>stmt.variable).expression;
      if (expr.kind != NodeKind.Identifier) {
        this.fail("'for-of' in async functions takes a single loop variable", stmt.variable.range);
        return;
      }
      elementName = (<IdentifierExpression>expr).text;
      elementRange = expr.range;
    } else {
      this.fail("'for-of' in async functions takes a single loop variable", stmt.variable.range);
      return;
    }
    let rewrittenIter = this.rewriteChecked(stmt.iterable);
    if (!rewrittenIter) return;
    let iterTypeNode = typeToTypeNode(iterType, range);
    if (!iterTypeNode) {
      this.fail(`Async functions cannot iterate values of type '${iterType.toString()}' yet`, range);
      return;
    }
    let after: i32;
    if (isLast) {
      after = cont;
    } else {
      after = this.createSegment();
    }
    let head = this.createSegment();
    let bodyEntry = this.createSegment();
    let incr = this.createSegment();
    this.pushScope();
    let iterName = `__async_of_${this.fieldCounter}`;
    let outcome = this.declareLocal(iterName, iterTypeNode, iterType, range, stmt, false);
    if (outcome != TransformOutcome.Transformed) {
      this.popScope();
      return;
    }
    this.emitLocalAssign(iterName, rewrittenIter, range);
    let indexName = `__async_ofi_${this.fieldCounter}`;
    outcome = this.declareLocal(indexName, namedType("i32", null, false, range), Type.i32, range, stmt, false);
    if (outcome != TransformOutcome.Transformed) {
      this.popScope();
      return;
    }
    this.emitLocalAssign(indexName, intLit(0, range), range);
    let isDeclaration = stmt.variable.kind == NodeKind.Variable;
    if (isDeclaration) {
      outcome = this.declareLocal(assert(elementName), elementTypeNode, elementType, elementRange, stmt, false);
      if (outcome != TransformOutcome.Transformed) {
        this.popScope();
        return;
      }
    }
    this.closeCurrent(new SegmentEnd("jump", head));
    this.setCurrent(head);
    let lengthAccess = (): Expression => {
      return new PropertyAccessExpression(this.localAccess(iterName, range), ident("length", range), range);
    };
    let indexAccess = (): Expression => this.localAccess(indexName, range);
    let dispatch = new IfStatement(
      new BinaryExpression(Token.LessThan, indexAccess(), lengthAccess(), range),
      blockStmt([ exprStmt(assignExpr(this.stateAccess(range), this.segState(bodyEntry, range), range)) ], range),
      blockStmt([ exprStmt(assignExpr(this.stateAccess(range), this.segState(this.resolveCont(after), range), range)) ], range),
      range
    );
    this.emit(dispatch);
    this.closeCurrent(new SegmentEnd("redispatch"));
    this.setCurrent(incr);
    this.emit(exprStmt(assignExpr(
      indexAccess(),
      new BinaryExpression(Token.Plus, indexAccess(), intLit(1, range), range),
      range
    )));
    this.closeCurrent(new SegmentEnd("jump", head));
    this.setCurrent(bodyEntry);
    let elementAccess = new ElementAccessExpression(this.localAccess(iterName, range), indexAccess(), range);
    if (isDeclaration) {
      this.emitLocalAssign(assert(elementName), elementAccess, range);
    } else {
      let binding = this.scope.lookup(assert(elementName));
      if (binding && !binding.shadowed) {
        this.emitLocalAssign(assert(elementName), elementAccess, range);
      } else {
        this.emit(exprStmt(assignExpr(ident(assert(elementName), elementRange), elementAccess, range)));
      }
    }
    this.transformList(asStatements(stmt.body), incr, this.resolveCont(after), incr);
    this.popScope();
    if (this.failed || this.punted) return;
    if (!isLast) {
      this.setCurrent(after);
    }
  }

  // === Await ====================================================================================

  /** Whether the expression is a direct call to a suspending import. */
  private isSuspendingImportCall(expr: Expression): bool {
    let call = unwrapParens(expr);
    if (call.kind != NodeKind.Call) return false;
    let callee = (<CallExpression>call).expression;
    if (callee.kind != NodeKind.Identifier) return false;
    let element = assert(this.flow).lookup((<IdentifierExpression>callee).text);
    return !!element
      && element.kind == ElementKind.FunctionPrototype
      && (<FunctionPrototype>element).is(CommonFlags.Ambient);
  }

  /** Whether the expression's value is a tracked stored promise: a local
   *  bound by a suspending-import call (or copied from one), or a
   *  member/index read, whose token the coordinator resolves at runtime
   *  (failing loudly on an unknown token). */
  private isTrackedStoredValue(expr: Expression): bool {
    let node = unwrapParens(expr);
    if (node.kind == NodeKind.Identifier) {
      let binding = this.scope.lookup((<IdentifierExpression>node).text);
      return !!binding && this.storedPromises.has(binding.field);
    }
    return node.kind == NodeKind.ElementAccess || node.kind == NodeKind.PropertyAccess;
  }

  /** Maintains the stored-promise binding set across `p = ...` rebinds:
   *  a rebind to a suspending-import call binds a fresh token, anything
   *  else unbinds. Only plain `=` assignments to a local are tracked;
   *  rebinds anywhere else leave the old binding in place, and the
   *  coordinator fails loudly at runtime on a token it does not know. */
  private trackStoredRebind(expr: Expression): void {
    let node = unwrapParens(expr);
    if (node.kind != NodeKind.Binary) return;
    let binary = <BinaryExpression>node;
    if (binary.operator != Token.Equals) return;
    let left = unwrapParens(binary.left);
    if (left.kind != NodeKind.Identifier) return;
    let binding = this.scope.lookup((<IdentifierExpression>left).text);
    if (!binding) return;
    if (this.isSuspendingImportCall(binary.right) || this.isTrackedStoredValue(binary.right)) {
      this.storedPromises.add(binding.field);
    } else {
      this.storedPromises.delete(binding.field);
    }
  }

  /** Resolves the type node of an awaited value, or `null` after failing
   *  loudly. `void` has no spelling and no zero value, but it is a valid
   *  awaited type: the site carries no value, so the void node is
   *  returned directly and the resume export takes no value parameter. */
  private resolveAwaitType(unwrapped: Type, range: Range): TypeNode | null {
    if (unwrapped.kind == TypeKind.Void) return namedType("void", null, false, range);
    let typeNode = typeToTypeNode(unwrapped, range);
    if (!typeNode) {
      this.fail(`Async functions cannot await values of type '${unwrapped.toString()}' yet`, range);
      return null;
    }
    if (unwrapped.kind != TypeKind.Extern && !zeroValue(unwrapped, typeNode, range)) {
      this.fail(`Async functions cannot await values of type '${unwrapped.toString()}' yet`, range);
      return null;
    }
    return typeNode;
  }

  /** Awaits a stored promise: the operation was already issued when the
   *  promise was bound, so the site suspends on its token through
   *  `__async_wait` instead of issuing a new call. The token is the
   *  bound local's field value, reinterpreted as an i32; the rest of the
   *  site (resume value, reject retarget, externref spill slot) is
   *  exactly a direct-await site. */
  private transformStoredAwait(node: AwaitExpression, operand: IdentifierExpression, used: bool): AwaitSite | null {
    let binding = this.scope.lookup(operand.text);
    if (!binding || !this.storedPromises.has(binding.field)) {
      this.fail("'await' of a stored promise is only supported when the promise was bound by a direct call to a suspending import in this function (or copied from such a binding)", node.range);
      return null;
    }
    return this.buildWaitSite(node, operand, used);
  }

  /** Builds a `__async_wait` site for an operand evaluating to an issued
   *  token: a tracked stored promise, or a member/index read whose value
   *  the coordinator resolves to an issued token at runtime (and fails
   *  loudly on an unknown token). */
  private buildWaitSite(node: AwaitExpression, operand: Expression, used: bool): AwaitSite | null {
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
    let typeNode = this.resolveAwaitType(unwrapped, node.range);
    if (!typeNode) return null;
    let rewrittenOperand = rewriteExpression(operand, this.rewriter());
    if (!rewrittenOperand) {
      this.failed = true;
      return null;
    }
    let waitCall = callExpr(
      ident(WAIT_IMPORT_NAME, node.range),
      [
        new CallExpression(
          ident("changetype", node.range),
          [ namedType("i32", null, false, node.range) ],
          [ rewrittenOperand ],
          node.range
        )
      ],
      node.range
    );
    let site = new AwaitSite(
      this.sites.length, unwrapped, typeNode, used,
      waitCall, "", node.range
    );
    this.sites.push(site);
    this.resolveRejectTarget(site, node);
    if (unwrapped.kind == TypeKind.Extern) {
      site.slotField = `__slot_pend${site.id}`;
      this.slots.push(new SpillSlot("pend", `pend${site.id}`, site.slotField));
    }
    return site;
  }

  /** Resolves a coordinator rejection of this await to the enclosing
   *  try's error locals, and records the pending-outcome flags the
   *  rejection must clear first when the await sits in a finally. The
   *  desugar recorded the target against the await's range; names are
   *  resolved to state fields now, while the scope still holds them. */
  private resolveRejectTarget(site: AwaitSite, node: AwaitExpression): void {
    let rejectTarget = rejectTargetFor(this.file, node.range);
    if (!rejectTarget) return;
    let flagBinding = this.scope.lookup(rejectTarget.flagVar);
    let errBinding = this.scope.lookup(rejectTarget.errorVar);
    if (flagBinding && !flagBinding.shadowed && errBinding && !errBinding.shadowed) {
      site.rejectFlagField = flagBinding.field;
      site.rejectErrField = errBinding.field;
    }
    let clearVars = rejectTarget.clearVars;
    for (let i = 0, k = clearVars.length; i < k; ++i) {
      let binding = this.scope.lookup(clearVars[i]);
      if (binding && !binding.shadowed) site.rejectClearFields.push(binding.field);
    }
  }

  /** Validates an await operand and records the site. Returns `null` on failure. */
  private transformAwait(node: AwaitExpression, used: bool): AwaitSite | null {
    let operand = unwrapParens(node.operand);
    if (operand.kind == NodeKind.Identifier) {
      return this.transformStoredAwait(node, <IdentifierExpression>operand, used);
    }
    if (operand.kind == NodeKind.ElementAccess || operand.kind == NodeKind.PropertyAccess) {
      this.checkDirectAsyncCalls(operand);
      if (this.failed) return null;
      return this.buildWaitSite(node, operand, used);
    }
    if (operand.kind != NodeKind.Call) {
      this.fail("'await' is only supported on direct calls to suspending imports", node.range);
      return null;
    }
    let call = <CallExpression>operand;
    let callee = call.expression;
    if (callee.kind == NodeKind.PropertyAccess) {
      // Nested await of a namespaced async function in this file: the
      // call starts the inner task, keyed by its qualified name.
      let namespaced = this.lookupNamespaceFunction(callee);
      if (namespaced) {
        if (namespaced.declaration.range.source != this.file.source) {
          this.fail("await of an async function in another file is not yet supported", node.range);
          return null;
        }
        let args = call.args;
        for (let i = 0, k = args.length; i < k; ++i) {
          this.checkDirectAsyncCalls(args[i]);
          if (this.failed) return null;
        }
        this.qualifyNestedCall(call, namespaced);
        return this.transformNestedAwait(call, namespaced, node, used);
      }
      return this.transformMemberAwait(node, call, used);
    }
    if (callee.kind != NodeKind.Identifier) {
      this.fail("'await' is only supported on direct calls to suspending imports", node.range);
      return null;
    }
    let calleeName = (<IdentifierExpression>callee).text;
    let flow = assert(this.flow);
    // Nested await of a same-file async function: an extracted async
    // arrow, or a direct call to another async function in this file.
    // The call starts the inner task; its handle is kept in a state
    // field, and the coordinator drives the inner task, then delivers
    // the result through this site's resume export.
    let element = flow.lookup(calleeName);
    if (element && element.kind == ElementKind.FunctionPrototype && (<FunctionPrototype>element).is(CommonFlags.Async)) {
      let innerPrototype = <FunctionPrototype>element;
      // A nested await may call an async function from another file: the
      // inner function is transformed in its own file pass, and the
      // coordinator resolves it by (file, qualified name). "#" cannot
      // appear in a sanitized file base or a qualified name.
      let args = call.args;
      for (let i = 0, k = args.length; i < k; ++i) {
        this.checkDirectAsyncCalls(args[i]);
        if (this.failed) return null;
      }
      this.qualifyNestedCall(call, innerPrototype);
      return this.transformNestedAwait(call, innerPrototype, node, used);
    }
    this.checkDirectAsyncCalls(call);
    if (this.failed) return null;
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
    if (!element) {
      this.punted = true;
      return null;
    }
    if (element.kind != ElementKind.FunctionPrototype || !(<FunctionPrototype>element).is(CommonFlags.Ambient)) {
      this.fail("'await' is only supported on direct calls to suspending imports", node.range);
      return null;
    }
    let typeNode = this.resolveAwaitType(unwrapped, node.range);
    if (!typeNode) return null;
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
    // A coordinator rejection of this site lands in the enclosing try's
    // catch when the desugar recorded one: resolve the error locals to
    // state fields now, while the scope still holds them.
    this.resolveRejectTarget(site, node);
    if (unwrapped.kind == TypeKind.Extern) {
      site.slotField = `__slot_pend${site.id}`;
      this.slots.push(new SpillSlot("pend", `pend${site.id}`, site.slotField));
    }
    return site;
  }

  /** Resolves a property-access chain to an async function declared in a
   *  namespace, or `null` when the chain does not name one: the root must
   *  look up to a namespace, every intermediate segment must be a
   *  namespace, and the final segment an async function. A local with
   *  the root name shadows the namespace, so that resolves to nothing
   *  here. Locals, classes and instances never resolve here, so member
   *  calls fall through to the member-await path. */
  private lookupNamespaceFunction(expr: Expression): FunctionPrototype | null {
    let segments = new Array<string>();
    let current = expr;
    while (current.kind == NodeKind.PropertyAccess) {
      let access = <PropertyAccessExpression>current;
      segments.unshift(access.property.text);
      current = access.expression;
    }
    if (current.kind != NodeKind.Identifier) return null;
    let rootName = (<IdentifierExpression>current).text;
    let binding = this.scope.lookup(rootName);
    if (binding && !binding.shadowed) return null;
    let element = assert(this.flow).lookup(rootName);
    if (!element || element.kind != ElementKind.Namespace) return null;
    for (let i = 0, k = segments.length - 1; i < k; ++i) {
      let next: Element | null = (<Namespace>element).getMember(segments[i]);
      if (!next || next.kind != ElementKind.Namespace) return null;
      element = next;
    }
    let member = (<Namespace>element).getMember(segments[segments.length - 1]);
    if (!member || member.kind != ElementKind.FunctionPrototype) return null;
    let prototype = <FunctionPrototype>member;
    return prototype.is(CommonFlags.Async) ? prototype : null;
  }

  /** Resolves a property-access chain to a class declared in a
   *  namespace, or `null` when the chain does not name one: the root must
   *  look up to a namespace, every intermediate segment must be a
   *  namespace, and the final segment a class. A local with the root
   *  name shadows the namespace, so that resolves to nothing here. */
  private lookupNamespaceClass(expr: Expression): ClassPrototype | null {
    let segments = new Array<string>();
    let current = expr;
    while (current.kind == NodeKind.PropertyAccess) {
      let access = <PropertyAccessExpression>current;
      segments.unshift(access.property.text);
      current = access.expression;
    }
    if (current.kind != NodeKind.Identifier) return null;
    let rootName = (<IdentifierExpression>current).text;
    let binding = this.scope.lookup(rootName);
    if (binding && !binding.shadowed) return null;
    let element = assert(this.flow).lookup(rootName);
    if (!element || element.kind != ElementKind.Namespace) return null;
    for (let i = 0, k = segments.length - 1; i < k; ++i) {
      let next: Element | null = (<Namespace>element).getMember(segments[i]);
      if (!next || next.kind != ElementKind.Namespace) return null;
      element = next;
    }
    let member = (<Namespace>element).getMember(segments[segments.length - 1]);
    if (!member || member.kind != ElementKind.ClassPrototype) return null;
    return <ClassPrototype>member;
  }

  /** Rewrites a nested call's callee to the inner function's absolute
   *  namespace-qualified access (`NS.take`, `Outer.Inner.deep`), so the
   *  call still resolves once the transform moves it into the top-level
   *  state class. A call written unqualified or namespace-relative would
   *  not resolve there. Top-level inners need no change. */
  private qualifyNestedCall(call: CallExpression, prototype: FunctionPrototype): void {
    let path = namespacePathOf(prototype);
    if (path.length == 0) return;
    let range = call.expression.range;
    let callee: Expression = ident(path[0], range);
    for (let i = 1, k = path.length; i < k; ++i) {
      callee = new PropertyAccessExpression(callee, ident(path[i], range), range);
    }
    call.expression = new PropertyAccessExpression(callee, ident(prototype.name, range), range);
  }

  /** Records a nested await site for a call that starts an inner async
   *  task and returns its handle: the outer step calls it, the pending
   *  export exposes the handle, and the coordinator drives the inner
   *  task, delivering its result through this site's resume export. The
   *  inner is resolved through `maybeInferCall`, so for a generic inner
   *  the instance is the per-instantiation clone and the recorded
   *  qualified name is the clone's mangled name. */
  private transformNestedAwait(call: CallExpression, innerPrototype: FunctionPrototype, node: AwaitExpression, used: bool): AwaitSite | null {
    let flow = assert(this.flow);
    let innerInstance = this.resolver.maybeInferCall(call, innerPrototype, flow, ReportMode.Swallow);
    if (!innerInstance) {
      this.punted = true;
      return null;
    }
    let unwrapped = this.resolver.unwrapPromiseType(innerInstance.signature.returnType);
    if (!unwrapped) {
      this.program.error(
        DiagnosticCode.The_operand_of_an_await_expression_must_be_a_Promise,
        call.range
      );
      this.failed = true;
      return null;
    }
    let typeNode = this.resolveAwaitType(unwrapped, node.range);
    if (!typeNode) return null;
    let rewrittenCall = rewriteExpression(call, this.rewriter());
    if (!rewrittenCall || rewrittenCall.kind != NodeKind.Call) {
      this.failed = true;
      return null;
    }
    let site = new AwaitSite(
      this.sites.length, unwrapped, typeNode, used,
      <CallExpression>rewrittenCall, "", node.range
    );
    site.isNested = true;
    site.handleField = `__handle${site.id}`;
    // The inner may live in another file: key it by (file, qualified
    // name) so the coordinator resolves it under its own file, exactly
    // as for a direct cross-file call.
    let innerBase = sanitizeName(innerInstance.prototype.declaration.range.source.simplePath);
    site.innerQual = innerBase + "#" + qualNameOf(innerInstance.prototype);
    this.sites.push(site);
    // A coordinator rejection of this site lands in the enclosing try's
    // catch when the desugar recorded one: resolve the error locals to
    // state fields now, while the scope still holds them.
    this.resolveRejectTarget(site, node);
    if (unwrapped.kind == TypeKind.Extern) {
      site.slotField = `__slot_pend${site.id}`;
      this.slots.push(new SpillSlot("pend", `pend${site.id}`, site.slotField));
    }
    return site;
  }

  /** Awaits a member call on a transformed async method, as a nested site
   *  through the same machinery as a nested async function: the outer
   *  step evaluates the receiver and calls the method, and the pending
   *  export exposes the inner handle. Anything else stays loud. */
  private transformMemberAwait(node: AwaitExpression, call: CallExpression, used: bool): AwaitSite | null {
    this.checkDirectAsyncCalls(call);
    if (this.failed) return null;
    let access = <PropertyAccessExpression>call.expression;
    let receiver = unwrapParens(access.expression);
    if (receiver.kind == NodeKind.Identifier) {
      let element = assert(this.flow).lookup((<IdentifierExpression>receiver).text);
      if (element && element.kind == ElementKind.ClassPrototype) {
        return this.transformStaticAwait(node, call, <ClassPrototype>element, access.property.text, used);
      }
    }
    if (receiver.kind == NodeKind.PropertyAccess) {
      let namespacedClass = this.lookupNamespaceClass(receiver);
      if (namespacedClass) {
        return this.transformStaticAwait(node, call, namespacedClass, access.property.text, used);
      }
    }
    let receiverClass = this.receiverClassOf(receiver, node);
    if (!receiverClass) return null;
    let method = this.lookupInstanceMethod(receiverClass, access.property.text);
    if (!method || !method.is(CommonFlags.Async) || method.declaration.kind != NodeKind.MethodDeclaration) {
      this.fail("'await' of a member call is not yet supported", node.range);
      return null;
    }
    // As for plain functions above, the method may live in another file:
    // it is transformed in its own file pass, and the coordinator
    // resolves it by (file, qualified name). Bind the method to the
    // receiver's class instance: for a generic class this is the
    // instantiated class, and resolving the bound prototype runs the
    // per-instantiation hook.
    let flow = assert(this.flow);
    let receiverType = this.resolver.resolveExpression(unwrapParens(access.expression), flow, Type.auto, ReportMode.Swallow);
    if (!receiverType) {
      this.punted = true;
      return null;
    }
    let receiverClassInstance = receiverType.getClass();
    if (!receiverClassInstance) {
      this.fail("'await' of a member call is not yet supported", node.range);
      return null;
    }
    return this.transformNestedAwait(call, method.toBound(receiverClassInstance), node, used);
  }

  /** Awaits a static call (`await C.method(...)`) as a nested site: the
   *  static is a free function with a class qualifier, so the outer step
   *  calls it and the coordinator drives the inner task by qualName. */
  private transformStaticAwait(node: AwaitExpression, call: CallExpression, classPrototype: ClassPrototype, methodName: string, used: bool): AwaitSite | null {
    let method = this.lookupStaticMethod(classPrototype, methodName);
    if (!method || !method.is(CommonFlags.Async) || method.declaration.kind != NodeKind.MethodDeclaration) {
      this.fail("'await' of a member call is not yet supported", node.range);
      return null;
    }
    let declaringClass = <ClassPrototype>method.parent;
    let typeParameters = declaringClass.typeParameterNodes;
    if (typeParameters && typeParameters.length > 0) {
      // A static method on a generic class is only instantiable through
      // its own type arguments (statics cannot reference the class's type
      // parameters): a static without them has no instantiation to drive.
      let ownParameters = method.typeParameterNodes;
      if (!ownParameters || ownParameters.length == 0) {
        this.fail("'await' of a member call is not yet supported", node.range);
        return null;
      }
    }
    if (method.declaration.range.source != this.file.source) {
      this.fail("'await' of a member call is not yet supported", node.range);
      return null;
    }
    return this.transformNestedAwait(call, method, node, used);
  }

  /** Finds a static method by name, walking the base-class chain, so an
   *  inherited static async method resolves to its declaring class. */
  private lookupStaticMethod(cls: ClassPrototype, name: string): FunctionPrototype | null {
    let prototype: ClassPrototype | null = cls;
    while (prototype) {
      let members = prototype.members;
      if (members) {
        let member = members.get(name);
        if (member && member.kind == ElementKind.FunctionPrototype) return <FunctionPrototype>member;
      }
      prototype = prototype.basePrototype;
    }
    return null;
  }

  /** Resolves the receiver expression to its class prototype, or `null`
   *  after failing loudly (not a class) or punting (unresolvable). A
   *  lifted local, including the `__async_this` receiver, reads its type
   *  from the state field; anything else resolves in the flow. */
  private receiverClassOf(receiver: Expression, node: AwaitExpression): ClassPrototype | null {
    if (receiver.kind == NodeKind.Identifier) {
      let name = (<IdentifierExpression>receiver).text;
      let binding = this.scope.lookup(name);
      if (binding && !binding.shadowed) {
        for (let i = 0, k = this.fields.length; i < k; ++i) {
          if (this.fields[i].name == binding.field) {
            let cls = this.fields[i].type.getClass();
            if (!cls) {
              this.fail("'await' of a member call is not yet supported", node.range);
              return null;
            }
            return cls.prototype;
          }
        }
      }
    }
    let flow = assert(this.flow);
    let type = this.resolver.resolveExpression(receiver, flow, Type.auto, ReportMode.Swallow);
    if (!type) {
      this.punted = true;
      return null;
    }
    let cls = type.getClass();
    if (!cls) {
      this.fail("'await' of a member call is not yet supported", node.range);
      return null;
    }
    return cls.prototype;
  }

  /** Finds an instance method by name, walking the base-class chain, so
   *  an inherited async method resolves to its declaring class. */
  private lookupInstanceMethod(cls: ClassPrototype, name: string): FunctionPrototype | null {
    let prototype: ClassPrototype | null = cls;
    while (prototype) {
      let members = prototype.instanceMembers;
      if (members) {
        let member = members.get(name);
        if (member && member.kind == ElementKind.FunctionPrototype) return <FunctionPrototype>member;
      }
      prototype = prototype.basePrototype;
    }
    return null;
  }

  // === Join =====================================================================================

  /** Returns the join call when the await operand is `await Promise.<policy>(...)`. */
  private joinCallOf(node: AwaitExpression): CallExpression | null {
    let operand = unwrapParens(node.operand);
    if (operand.kind != NodeKind.Call) return null;
    let call = <CallExpression>operand;
    return joinPolicyOfCall(call) ? call : null;
  }

  /** Resolves a type node, punting when it does not resolve. */
  private resolveNode(node: TypeNode, range: Range): Type | null {
    let type = this.resolver.resolveType(node, assert(this.flow), this.parent, null, ReportMode.Swallow);
    if (!type) this.punted = true;
    return type;
  }

  /** Returns the result type node of a lifted local, if it has one. */
  private localTypeNode(name: string): TypeNode | null {
    let binding = this.scope.lookup(name);
    if (!binding || binding.spilled) return null;
    for (let i = 0, k = this.fields.length; i < k; ++i) {
      if (this.fields[i].name == binding.field) return this.fields[i].typeNode;
    }
    return null;
  }

  /** Validates one join member expression and returns its unwrapped type.
   *  An `await` member is hoisted to its own await site before the join
   *  issues: the await suspends first (as if it stood alone), its value
   *  lands in the site's pend field, and the issue step records it as an
   *  already-settled member instead of a token. */
  private validateJoinMember(element: Expression, policy: string, index: i32, hoisted: Map<i32, AwaitSite>): Type | null {
    let unwrappedElement = unwrapParens(element);
    if (unwrappedElement.kind == NodeKind.Await) {
      let site = this.transformAwait(<AwaitExpression>unwrappedElement, true);
      if (!site) return null;
      hoisted.set(index, site);
      return this.validateJoinMemberType(site.type, policy, element.range);
    }
    if (containsAwait(element)) {
      this.fail("'await' inside a join member is not yet supported", element.range);
      return null;
    }
    if (element.kind == NodeKind.Call) {
      let call = <CallExpression>element;
      if (joinPolicyOfCall(call)) {
        this.fail(`'Promise.${policy}' members cannot be nested joins`, element.range);
        return null;
      }
      if (call.expression.kind != NodeKind.Identifier) {
        this.fail(`'Promise.${policy}' members must be direct calls to suspending imports or Promise values`, element.range);
        return null;
      }
    } else if (element.kind != NodeKind.Identifier && element.kind != NodeKind.ElementAccess) {
      this.fail(`'Promise.${policy}' members must be direct calls to suspending imports or Promise values`, element.range);
      return null;
    }
    this.checkDirectAsyncCalls(element);
    if (this.failed) return null;
    let flow = assert(this.flow);
    let type = this.resolver.resolveExpression(element, flow, Type.auto, ReportMode.Swallow);
    if (!type) {
      this.punted = true;
      return null;
    }
    let unwrapped = this.resolver.unwrapPromiseType(type);
    if (!unwrapped) {
      this.fail(`'Promise.${policy}' members must be promises`, element.range);
      return null;
    }
    if (element.kind == NodeKind.Call) {
      let calleeName = (<IdentifierExpression>(<CallExpression>element).expression).text;
      let found = flow.lookup(calleeName);
      if (!found) {
        this.punted = true;
        return null;
      }
      if (found.kind != ElementKind.FunctionPrototype || !(<FunctionPrototype>found).is(CommonFlags.Ambient)) {
        this.fail(`'Promise.${policy}' members must be direct calls to suspending imports or Promise values`, element.range);
        return null;
      }
    }
    return this.validateJoinMemberType(unwrapped, policy, element.range);
  }

  /** Validates a join member type against the core's marshalling bar. */
  private validateJoinMemberType(type: Type, policy: string, range: Range): Type | null {
    if (type.kind == TypeKind.Void) {
      this.fail(`'Promise.${policy}' members must not be void`, range);
      return null;
    }
    if (this.resolver.unwrapPromiseType(type)) {
      this.fail(`'Promise.${policy}' members must not be promises of promises`, range);
      return null;
    }
    if (type.kind == TypeKind.Extern) {
      this.fail(`'Promise.${policy}' members of type 'externref' are not yet supported`, range);
      return null;
    }
    let node = typeToTypeNode(type, range);
    if (!node || !zeroValue(type, node, range)) {
      this.fail(`Async functions cannot await values of type '${type.toString()}' yet`, range);
      return null;
    }
    return type;
  }

  /** Extracts the member type node from a result type node, or `null`. */
  private memberTypeNodeFromResult(policy: string, resultNode: TypeNode): TypeNode | null {
    if (policy == "race" || policy == "any") return resultNode;
    if (resultNode.kind != NodeKind.NamedType) return null;
    let named = <NamedTypeNode>resultNode;
    if (named.name.next) return null;
    if (named.name.identifier.text != "Array") return null;
    let typeArguments = named.typeArguments;
    if (!typeArguments || typeArguments.length != 1) return null;
    if (policy == "all") return typeArguments[0];
    let inner = typeArguments[0];
    if (inner.kind != NodeKind.NamedType) return null;
    let innerNamed = <NamedTypeNode>inner;
    if (innerNamed.name.next) return null;
    if (innerNamed.name.identifier.text != "PromiseSettledResult") return null;
    let innerArguments = innerNamed.typeArguments;
    if (!innerArguments || innerArguments.length != 1) return null;
    return innerArguments[0];
  }

  /** Validates a join call and records its site and state fields. */
  private prepareJoin(
    call: CallExpression,
    policy: string,
    used: bool,
    range: Range,
    expectedResultNode: TypeNode | null
  ): PreparedJoin | null {
    let args = call.args;
    if (args.length != 1) {
      this.fail(`'Promise.${policy}' expects exactly one argument`, call.range);
      return null;
    }
    let flow = assert(this.flow);
    let arg = unwrapParens(args[0]);
    let memberType: Type | null = null;
    let memberKind = "";
    let memberCount = -1;
    let members = new Array<Expression>();
    let membersExpr: Expression | null = null;
    let hoisted = new Map<i32, AwaitSite>();
    let argSite: AwaitSite | null = null;
    if (arg instanceof ArrayLiteralExpression) {
      memberKind = "literal";
      let elements = arg.elementExpressions;
      memberCount = elements.length;
      for (let i = 0, k = elements.length; i < k; ++i) {
        let element = unwrapParens(elements[i]);
        let member = this.validateJoinMember(element, policy, i, hoisted);
        if (!member) return null;
        if (!memberType) {
          memberType = member;
        } else if (member.toString() != memberType.toString()) {
          this.fail(`'Promise.${policy}' members must all have the same type`, element.range);
          return null;
        }
        let hoistedSite = hoisted.get(i);
        if (hoistedSite) {
          members.push(this.pendAccess(hoistedSite, element.range));
          continue;
        }
        let rewritten = rewriteExpression(element, this.rewriter());
        if (!rewritten) {
          this.failed = true;
          return null;
        }
        members.push(rewritten);
      }
    } else {
      memberKind = "dynamic";
      let argType: Type | null = null;
      if (unwrapParens(arg).kind == NodeKind.Await) {
        // The whole argument awaited: hoist it to its own site, then the
        // join runs over the delivered array. An await deeper inside the
        // argument stays loud.
        let awaitExpr = <AwaitExpression>unwrapParens(arg);
        let site = this.transformAwait(awaitExpr, true);
        if (!site) return null;
        argSite = site;
        argType = site.type;
        membersExpr = this.pendAccess(site, arg.range);
      } else {
        if (containsAwait(arg)) {
          this.fail("'await' inside a join argument is not yet supported", arg.range);
          return null;
        }
        this.checkDirectAsyncCalls(arg);
        if (this.failed) return null;
        argType = this.resolver.resolveExpression(arg, flow, Type.auto, ReportMode.Swallow);
        if (!argType) {
          this.punted = true;
          return null;
        }
      }
      let argClass = argType.getClass();
      let typeArguments = argClass ? argClass.typeArguments : null;
      if (!argClass || argClass.prototype.name != "Array" || !typeArguments || typeArguments.length != 1) {
        this.fail(`'Promise.${policy}' expects an argument of type 'Array<Promise<T>>'`, arg.range);
        return null;
      }
      let unwrapped = this.resolver.unwrapPromiseType(typeArguments[0]);
      if (!unwrapped) {
        this.fail(`'Promise.${policy}' expects an argument of type 'Array<Promise<T>>'`, arg.range);
        return null;
      }
      memberType = this.validateJoinMemberType(unwrapped, policy, arg.range);
      if (!memberType) return null;
      if (!argSite) {
        let rewritten = rewriteExpression(arg, this.rewriter());
        if (!rewritten) {
          this.failed = true;
          return null;
        }
        membersExpr = rewritten;
      }
    }
    let memberTypeNode: TypeNode | null = null;
    let resultTypeNode: TypeNode | null = null;
    let resultType: Type | null = null;
    if (memberType) {
      memberTypeNode = typeToTypeNode(memberType, range);
      if (memberTypeNode) {
        resultTypeNode = joinResultTypeNode(policy, memberTypeNode, range);
        resultType = this.resolveNode(resultTypeNode, range);
        if (!resultType) return null;
      }
    }
    if (!memberTypeNode) {
      if (memberType) {
        this.fail(`'Promise.${policy}' members of type '${memberType.toString()}' are not yet supported`, range);
        return null;
      }
      if (!expectedResultNode) {
        let callType = this.resolver.resolveExpression(call, flow, Type.auto, ReportMode.Swallow);
        let resolvedResult = callType ? this.resolver.unwrapPromiseType(callType) : null;
        if (resolvedResult) {
          let resolvedNode = typeToTypeNode(resolvedResult, range);
          if (resolvedNode) expectedResultNode = resolvedNode;
        }
      }
      if (!expectedResultNode) {
        this.fail(`Cannot infer the member type of 'Promise.${policy}([])'; annotate the awaited result`, call.range);
        return null;
      }
      memberTypeNode = this.memberTypeNodeFromResult(policy, expectedResultNode);
      if (!memberTypeNode) {
        this.fail(`Cannot infer the member type of 'Promise.${policy}([])' from the awaited result`, call.range);
        return null;
      }
      memberType = this.resolveNode(memberTypeNode, range);
      if (!memberType) return null;
      memberType = this.validateJoinMemberType(memberType, policy, range);
      if (!memberType) return null;
      resultTypeNode = expectedResultNode;
      resultType = this.resolveNode(resultTypeNode, range);
      if (!resultType) return null;
    }
    if (!memberType || !memberTypeNode || !resultType || !resultTypeNode) return null;
    let siteId = this.sites.length;
    let site = new AwaitSite(
      siteId, resultType, resultTypeNode, used, this.joinCallExpr(siteId, policy, range), "", range,
      true, policy, memberType, memberTypeNode
    );
    this.sites.push(site);
    let arrayNode = (elementNode: TypeNode): TypeNode => namedType("Array", [ elementNode ], false, range);
    let i32ArrayNode = arrayNode(namedType("i32", null, false, range));
    let i32ArrayType = this.resolveNode(i32ArrayNode, range);
    let stringArrayNode = arrayNode(namedType("string", null, false, range));
    let stringArrayType = this.resolveNode(stringArrayNode, range);
    let valsNode = arrayNode(memberTypeNode);
    let valsType = this.resolveNode(valsNode, range);
    if (!i32ArrayType || !stringArrayType || !valsType) return null;
    this.fields.push(new StateField(joinValsField(siteId), valsNode, valsType));
    this.fields.push(new StateField(joinStatusField(siteId), i32ArrayNode, i32ArrayType));
    this.fields.push(new StateField(joinReasonsField(siteId), stringArrayNode, stringArrayType));
    this.fields.push(new StateField(joinIdxField(siteId), namedType("i32", null, false, range), Type.i32));
    this.fields.push(new StateField(joinHasValueField(siteId), namedType("bool", null, false, range), Type.bool));
    this.fields.push(new StateField(joinReqsField(siteId), i32ArrayNode, i32ArrayType));
    if (memberKind == "dynamic") {
      let membersNode = arrayNode(namedType("Promise", [ memberTypeNode ], false, range));
      let membersType = this.resolveNode(membersNode, range);
      if (!membersType) return null;
      this.fields.push(new StateField(joinMembersField(siteId), membersNode, membersType));
    }
    return new PreparedJoin(site, policy, memberKind, memberCount, members, membersExpr, resultType, resultTypeNode, hoisted, argSite);
  }

  /** Emits the desugar's settled check for a hoisted await, right after
   *  its suspension: when the await was rejected, its flag is set, so
   *  break out of the enclosing try wrapper (via its break target)
   *  instead of issuing the join or the next hoisted await. Without
   *  this, a rejection would only be noticed after the whole join
   *  statement, and the join's members would be issued even though the
   *  await already threw. A site with no reject flag (outside any try)
   *  needs no check. */
  private emitHoistedRejectCheck(site: AwaitSite, breakTarget: i32): void {
    if (site.rejectFlagField == "" || breakTarget == NO_TARGET) return;
    let range = site.range;
    let joinEntry = this.createSegment();
    let dispatch = new IfStatement(
      thisProp(site.rejectFlagField, range),
      blockStmt([ exprStmt(assignExpr(this.stateAccess(range), this.segState(breakTarget, range), range)) ], range),
      blockStmt([ exprStmt(assignExpr(this.stateAccess(range), this.segState(joinEntry, range), range)) ], range),
      range
    );
    this.emit(dispatch);
    this.closeCurrent(new SegmentEnd("redispatch"));
    this.setCurrent(joinEntry);
  }

  /** Builds the join-import call for a site. */
  private joinCallExpr(siteId: i32, policy: string, range: Range): CallExpression {
    return callExpr(
      ident(JOIN_IMPORT_NAME, range),
      [ thisProp(joinReqsField(siteId), range), intLit(joinPolicyCode(policy), range) ],
      range
    );
  }

  /** Emits the issue + join + continuation for a prepared join. Hoisted
   *  awaits suspend first, in order, before the join issues: a hoisted
   *  member await delivers its value into its pend field, and a hoisted
   *  argument await delivers the member array the same way. */
  private emitJoin(join: PreparedJoin, emitResult: (value: Expression) => void, breakTarget: i32): JoinEmitOutcome {
    let site = join.site;
    let range = site.range;
    let policy = join.policy;
    let memberTypeNode = assert(site.memberTypeNode);
    if (join.argSite) {
      this.suspendCurrent(join.argSite);
      this.emitHoistedRejectCheck(join.argSite, breakTarget);
    }
    for (let i = 0, k = join.memberCount; i < k; ++i) {
      let hoistedSite = join.hoisted.get(i);
      if (hoistedSite) {
        this.suspendCurrent(hoistedSite);
        this.emitHoistedRejectCheck(hoistedSite, breakTarget);
      }
    }
    let countExpr = (): Expression => {
      if (join.memberKind == "literal") return intLit(join.memberCount, range);
      return new PropertyAccessExpression(
        thisProp(joinMembersField(site.id), range),
        ident("length", range),
        range
      );
    };
    if (join.memberKind != "literal") {
      this.emit(exprStmt(assignExpr(
        thisProp(joinMembersField(site.id), range),
        assert(join.membersExpr),
        range
      )));
    }
    let sizedArray = (elementNode: TypeNode): Expression => {
      return new NewExpression(
        new TypeName(ident("Array", range), null, range),
        [ elementNode ],
        [ countExpr() ],
        range
      );
    };
    this.emit(exprStmt(assignExpr(thisProp(joinValsField(site.id), range), sizedArray(memberTypeNode), range)));
    this.emit(exprStmt(assignExpr(thisProp(joinStatusField(site.id), range), sizedArray(namedType("i32", null, false, range)), range)));
    this.emit(exprStmt(assignExpr(thisProp(joinReasonsField(site.id), range), sizedArray(namedType("string", null, false, range)), range)));
    this.emit(exprStmt(assignExpr(
      thisProp(joinIdxField(site.id), range),
      new UnaryPrefixExpression(Token.Minus, intLit(1, range), range),
      range
    )));
    this.emit(exprStmt(assignExpr(thisProp(joinHasValueField(site.id), range), new FalseExpression(range), range)));
    this.emit(exprStmt(assignExpr(
      thisProp(joinReqsField(site.id), range),
      new NewExpression(
        new TypeName(ident("Array", range), null, range),
        [ namedType("i32", null, false, range) ],
        [],
        range
      ),
      range
    )));
    if (join.memberKind == "literal") {
      if (join.memberCount == 0) {
        if (policy == "all" || policy == "allSettled") {
          emitResult(this.emptyResult(join));
          return JoinEmitOutcome.CompletedInline;
        }
        if (policy == "any") {
          this.emitFail(strLit(AGGREGATE_ERROR_EMPTY, range), range);
          return JoinEmitOutcome.FailedInline;
        }
        this.suspendCurrent(site);
        if (site.used) this.emitJoinAssembly(join, emitResult);
        return JoinEmitOutcome.Suspended;
      }
      for (let i = 0, k = join.members.length; i < k; ++i) {
        let hoistedSite = join.hoisted.get(i);
        if (hoistedSite) {
          this.emitHoistedIssue(site, hoistedSite, i);
        } else {
          this.emit(this.issueStatement(site, join.members[i]));
        }
      }
      this.suspendCurrent(site);
      if (site.used) this.emitJoinAssembly(join, emitResult);
      return JoinEmitOutcome.Suspended;
    }
    let cont = this.createSegment();
    let empty = this.createSegment();
    let membersLength = (): Expression => {
      return new PropertyAccessExpression(
        thisProp(joinMembersField(site.id), range),
        ident("length", range),
        range
      );
    };
    let loopVar = `__join_i_${site.id}`;
    let issueLoop = new ForStatement(
      new VariableStatement(
        null,
        [ new VariableDeclaration(ident(loopVar, range), null, CommonFlags.Let, namedType("i32", null, false, range), intLit(0, range), range) ],
        range
      ),
      new BinaryExpression(Token.LessThan, ident(loopVar, range), membersLength(), range),
      new UnaryPostfixExpression(Token.Plus_Plus, ident(loopVar, range), range),
      blockStmt([ this.issueStatement(site, new ElementAccessExpression(thisProp(joinMembersField(site.id), range), ident(loopVar, range), range)) ], range),
      range
    );
    this.emit(new IfStatement(
      new BinaryExpression(Token.Equals_Equals, membersLength(), intLit(0, range), range),
      blockStmt([
        exprStmt(assignExpr(this.stateAccess(range), this.segState(empty, range), range)),
        new BreakStatement(null, range)
      ], range),
      blockStmt([ issueLoop ], range),
      range
    ));
    this.suspendCurrent(site, cont);
    if (site.used) this.emitJoinAssembly(join, emitResult);
    this.setCurrent(empty);
    if (policy == "all" || policy == "allSettled") {
      this.closeCurrent(new SegmentEnd("jump", cont));
    } else if (policy == "any") {
      this.emitFail(strLit(AGGREGATE_ERROR_EMPTY, range), range);
    } else {
      this.emit(exprStmt(this.joinCallExpr(site.id, policy, range)));
      this.closeCurrent(new SegmentEnd("suspend", cont, site.id));
    }
    this.setCurrent(cont);
    return JoinEmitOutcome.Suspended;
  }

  /** The empty-array result value for `all` / `allSettled`. */
  private emptyResult(join: PreparedJoin): Expression {
    let range = join.site.range;
    let memberTypeNode = assert(join.site.memberTypeNode);
    let elementNode = join.policy == "allSettled"
      ? namedType("PromiseSettledResult", [ memberTypeNode ], false, range)
      : memberTypeNode;
    return new NewExpression(
      new TypeName(ident("Array", range), null, range),
      [ elementNode ],
      [ intLit(0, range) ],
      range
    );
  }

  /** Builds the statement recording one member's request id. */
  private issueStatement(site: AwaitSite, member: Expression): Statement {
    let range = site.range;
    return exprStmt(callExpr(
      new PropertyAccessExpression(thisProp(joinReqsField(site.id), range), ident("push", range), range),
      [ new CallExpression(
        ident("changetype", range),
        [ namedType("i32", null, false, range) ],
        [ member ],
        range
      ) ],
      range
    ));
  }

  /** Records one hoisted member as already settled: its value (delivered
   *  into the hoisted site's pend field) is stored in the join's value
   *  array with status fulfilled, and the sentinel token 0 is pushed so
   *  the coordinator counts the member without waiting on a promise. */
  private emitHoistedIssue(site: AwaitSite, memberSite: AwaitSite, index: i32): void {
    let range = site.range;
    this.emit(exprStmt(assignExpr(
      new ElementAccessExpression(thisProp(joinValsField(site.id), range), intLit(index, range), range),
      this.pendAccess(memberSite, range),
      range
    )));
    this.emit(exprStmt(assignExpr(
      new ElementAccessExpression(thisProp(joinStatusField(site.id), range), intLit(index, range), range),
      intLit(1, range),
      range
    )));
    this.emit(exprStmt(callExpr(
      new PropertyAccessExpression(thisProp(joinReqsField(site.id), range), ident("push", range), range),
      [ intLit(0, range) ],
      range
    )));
  }

  /** Emits the continuation assembling the join result. */
  private emitJoinAssembly(join: PreparedJoin, emitResult: (value: Expression) => void): void {
    let site = join.site;
    let range = site.range;
    let policy = join.policy;
    let memberTypeNode = assert(site.memberTypeNode);
    if (policy == "all") {
      emitResult(thisProp(joinValsField(site.id), range));
      return;
    }
    if (policy == "race" || policy == "any") {
      emitResult(new ElementAccessExpression(
        thisProp(joinValsField(site.id), range),
        thisProp(joinIdxField(site.id), range),
        range
      ));
      return;
    }
    let outVar = `__join_out_${site.id}`;
    let elementNode = namedType("PromiseSettledResult", [ memberTypeNode ], false, range);
    this.emit(new VariableStatement(
      null,
      [ new VariableDeclaration(
        ident(outVar, range), null, CommonFlags.Let,
        namedType("Array", [ elementNode ], false, range),
        new NewExpression(
          new TypeName(ident("Array", range), null, range),
          [ elementNode ],
          [],
          range
        ),
        range
      ) ],
      range
    ));
    let kVar = `__join_k_${site.id}`;
    let atIndex = (field: string): Expression => {
      return new ElementAccessExpression(thisProp(field, range), ident(kVar, range), range);
    };
    // __joinVals/__joinReasons are holey arrays: a slot is written only on
    // its member's settlement, and reading a hole traps. Guard both reads
    // so only the settled side is read (status is 1 exactly when fulfilled).
    let fulfilled = (): Expression => {
      return new BinaryExpression(Token.Equals_Equals, atIndex(joinStatusField(site.id)), intLit(1, range), range);
    };
    let zero = assert(zeroValue(assert(site.memberType), memberTypeNode, range));
    let loop = new ForStatement(
      new VariableStatement(
        null,
        [ new VariableDeclaration(ident(kVar, range), null, CommonFlags.Let, namedType("i32", null, false, range), intLit(0, range), range) ],
        range
      ),
      new BinaryExpression(
        Token.LessThan,
        ident(kVar, range),
        new PropertyAccessExpression(thisProp(joinValsField(site.id), range), ident("length", range), range),
        range
      ),
      new UnaryPostfixExpression(Token.Plus_Plus, ident(kVar, range), range),
      blockStmt([
        exprStmt(callExpr(
          new PropertyAccessExpression(ident(outVar, range), ident("push", range), range),
          [ new NewExpression(
            new TypeName(ident("PromiseSettledResult", range), null, range),
            [ memberTypeNode ],
            [
              new TernaryExpression(
                new BinaryExpression(Token.Equals_Equals, atIndex(joinStatusField(site.id)), intLit(1, range), range),
                strLit("fulfilled", range),
                strLit("rejected", range),
                range
              ),
              new TernaryExpression(fulfilled(), atIndex(joinValsField(site.id)), zero, range),
              new TernaryExpression(fulfilled(), strLit("", range), atIndex(joinReasonsField(site.id)), range)
            ],
            range
          ) ],
          range
        ))
      ], range),
      range
    );
    this.emit(loop);
    emitResult(ident(outVar, range));
  }

  /** Fails the task with the given error, closing the current segment. */
  private emitFail(error: Expression, range: Range): void {
    this.emit(exprStmt(assignExpr(thisProp("__error", range), error, range)));
    this.closeCurrent(new SegmentEnd("fail"));
  }

  /** Fails the task with a message and a thrown value. */
  private emitThrowFail(message: Expression, value: Expression, range: Range): void {
    this.emit(exprStmt(assignExpr(thisProp("__errorValue", range), value, range)));
    this.emitFail(message, range);
  }

  /** True when the class is Error or extends it. */
  private isErrorClass(classReference: Class): bool {
    let cls: Class | null = classReference;
    while (cls) {
      if (cls.prototype.name == "Error") return true;
      cls = cls.base;
    }
    return false;
  }

  /** `changetype<Error>(value)`: the thrown value as the stored error value. */
  private changetypeError(value: Expression, range: Range): Expression {
    return new CallExpression(
      ident("changetype", range),
      [ namedType("Error", null, false, range) ],
      [ value ],
      range
    );
  }

  /** Derives a thrown value's error message and stored value from its
   *  (already rewritten) expression and resolved type. */
  private throwMessageAndValue(value: Expression, type: Type, range: Range): { message: Expression, value: Expression } | null {
    let nullable = (type.flags & TypeFlags.Nullable) != 0;
    let base = nullable ? type.nonNullableType : type;
    let message: Expression;
    let stored: Expression;
    let classReference = base.getClass();
    if (classReference) {
      if (classReference.prototype.name == CommonNames.String) {
        message = value;
        stored = this.changetypeError(value, range);
      } else if (this.isErrorClass(classReference)) {
        message = new PropertyAccessExpression(value, ident("message", range), range);
        stored = this.changetypeError(value, range);
      } else {
        message = strLit("", range);
        stored = this.changetypeError(value, range);
      }
    } else if (base.kind == TypeKind.Extern) {
      // An externref cannot be stored in a managed field; the stored
      // value is the null sentinel, like a null class field.
      message = strLit("", range);
      stored = this.changetypeError(intLit(0, range), range);
    } else {
      switch (base.kind) {
        case TypeKind.Bool:
        case TypeKind.I8:
        case TypeKind.I16:
        case TypeKind.I32:
        case TypeKind.I64:
        case TypeKind.Isize:
        case TypeKind.U8:
        case TypeKind.U16:
        case TypeKind.U32:
        case TypeKind.U64:
        case TypeKind.Usize:
        case TypeKind.F32:
        case TypeKind.F64: {
          message = callExpr(
            new PropertyAccessExpression(value, ident("toString", range), range),
            [],
            range
          );
          // No value to store: the null sentinel, like a null class field.
          stored = this.changetypeError(intLit(0, range), range);
          break;
        }
        default: {
          this.fail("Cannot throw a value of type '" + type.toString() + "'", range);
          return null;
        }
      }
    }
    if (nullable && classReference) {
      // A null reference has no message; the stored value is already
      // null-safe (`changetype<Error>(null)` is 0).
      message = new TernaryExpression(
        new BinaryExpression(Token.Equals_Equals, value, new NullExpression(range), range),
        strLit("", range),
        message,
        range
      );
    }
    return { message, value: stored };
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
      if (callee.kind == NodeKind.PropertyAccess) {
        if (this.lookupNamespaceFunction(callee)) {
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
  private suspendCurrent(site: AwaitSite, next: i32 = -1): void {
    if (site.isNested) {
      // A nested call starts the inner task; keep its handle so the
      // coordinator can drive it and deliver its result to the resume
      // export. The handle is a reference, stored as a raw usize.
      this.emit(exprStmt(assignExpr(
        thisProp(site.handleField, site.range),
        new CallExpression(
          ident("changetype", site.range),
          [ namedType("usize", null, false, site.range) ],
          [ site.call ],
          site.range
        ),
        site.range
      )));
    } else {
      this.emit(exprStmt(site.call));
    }
    if (next < 0) {
      next = this.segments.length;
      this.closeCurrent(new SegmentEnd("suspend", next, site.id));
      this.newSegment();
      assert(this.cur == next);
    } else {
      this.closeCurrent(new SegmentEnd("suspend", next, site.id));
      this.setCurrent(next);
    }
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

  /** Stores a return value: through the result spill slot for externref
      returns (the state class has no `__result` field for those), the
      `__result` field otherwise. */
  private emitResultAssign(value: Expression, range: Range): void {
    if (this.returnType.kind == TypeKind.Void) return;
    if (this.returnType.kind == TypeKind.Extern) {
      this.emit(exprStmt(callExpr(
        ident(SPILL_SET, range),
        [ thisProp("__slot_result", range), value ],
        range
      )));
      return;
    }
    this.emit(exprStmt(assignExpr(this.resultAccess(range), value, range)));
  }

  private emitReturnAssignment(site: AwaitSite, range: Range): void {
    this.emitResultAssign(this.pendAccess(site, range), range);
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
    let receiverClass = this.isMethod ? this.receiverClass : null;
    let emitEntry = false;
    let emitClassNew = false;
    // A class is drivable when it is a module export, or exported
    // through its whole namespace chain (a namespaced class is never a
    // module export itself: the namespace is).
    if (receiverClass && (findExportName(this.program, this.file, receiverClass) != null || exportedThroughNamespaces(receiverClass))) {
      if (!this.classNews.has(this.classNewName(receiverClass))) {
        if (this.hasNameCollision(this.classNewName(receiverClass))) return false;
        emitClassNew = true;
      }
      if (this.hasNameCollision(this.methodEntryName())) return false;
      emitEntry = true;
    }
    let emitFunctionEntry = false;
    if (!this.isMethod && this.namespacePath.length > 0 && this.isExportedThroughNamespaces()) {
      if (this.hasNameCollision(this.methodEntryName())) return false;
      // The entry body refers to the namespace by its root name, so a
      // parameter with that name would shadow it.
      let parameters = this.prototype.functionTypeNode.parameters;
      for (let i = 0, k = parameters.length; i < k; ++i) {
        if (parameters[i].name.text == this.namespacePath[0]) {
          this.fail(`Async function parameter '${parameters[i].name.text}' shadows its namespace`, parameters[i].range);
          return false;
        }
      }
      emitFunctionEntry = true;
    }
    // An instance async method named `dispose` would be shadowed by the
    // wrapper's sync dispose(): the wrapper cannot carry both, so the
    // conflict fails loudly with the remedy. A static async `dispose`
    // lives on the constructor, not the prototype, and a non-exported
    // class gets no wrapper, so neither collides.
    if (emitEntry && !this.isStatic && this.prototype.name == "dispose") {
      this.fail("Async method 'dispose' conflicts with the coordinator's generated dispose() method on the wrapper class; rename the method", this.declaration.name.range);
      return false;
    }
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      if (this.sites[i].isJoin) {
        if (this.hasNameCollision(joinStoreName(this.fileBase, this.fnName, i))) return false;
        if (this.hasNameCollision(joinErrorName(this.fileBase, this.fnName, i))) return false;
        if (this.hasNameCollision(joinDoneName(this.fileBase, this.fnName, i))) return false;
        if (this.hasNameCollision(joinMarkName(this.fileBase, this.fnName, i))) return false;
      } else {
        if (this.sites[i].isNested) {
          if (this.hasNameCollision(this.pendingName(i))) return false;
        }
        if (this.hasNameCollision(this.resumeName(i))) return false;
      }
      if (this.hasNameCollision(this.rejectName(i))) return false;
    }
    if (this.hasNameCollision(this.resultName())) return false;
    if (this.hasNameCollision(this.errorName())) return false;
    if (this.hasNameCollision(this.statusName())) return false;
    if (this.hasNameCollision(this.lastHandleName())) return false;
    if (this.hasNameCollision(this.reclaimName())) return false;
    if (this.needsStateGlobal) {
      if (this.hasNameCollision(this.stateGlobalName)) return false;
    }
    let loopAdapterNames = Map_keys(this.loopBuilds);
    for (let i = 0, k = loopAdapterNames.length; i < k; ++i) {
      let adapterName = loopAdapterNames[i];
      let build = this.loopBuilds.get(adapterName)!;
      if (this.hasNameCollision(build.info.envClass)) return false;
      if (this.hasNameCollision(build.info.captureName)) return false;
      if (this.hasNameCollision(build.info.envsName)) return false;
      if (this.hasNameCollision(build.info.fnsName)) return false;
      if (this.hasNameCollision(build.info.slotName)) return false;
      for (let i = 0, k = build.extCaptures.length; i < k; ++i) {
        for (let s = 0; s < LOOP_ADAPTER_SLOTS; ++s) {
          if (this.hasNameCollision(this.loopExtName(build.info.adapterBase, build.extCaptures[i], s))) return false;
        }
      }
      // Slot 0's adapter is built by the lifter; the rest are built here.
      for (let s = 1; s < LOOP_ADAPTER_SLOTS; ++s) {
        if (this.hasNameCollision(`${build.info.adapterBase}_${s}`)) return false;
      }
    }
    if (this.slots.length > 0) {
      if (!this.ensureSpillPool()) return false;
    }
    if (!this.ensureMint()) return false;
    let declarations = new Array<Statement>();
    let stateClass = this.buildStateClass();
    if (!stateClass) return false;
    declarations.push(stateClass);
    declarations.push(this.buildRootsGlobal());
    declarations.push(this.buildLastHandleGetter());
    declarations.push(this.buildReclaim());
    if (this.needsStateGlobal) declarations.push(this.buildStateGlobal());
    for (let i = 0, k = loopAdapterNames.length; i < k; ++i) {
      let adapterName = loopAdapterNames[i];
      let loopDeclarations = this.buildLoopAdapterSet(this.loopBuilds.get(adapterName)!);
      if (!loopDeclarations) return false;
      for (let j = 0, l = loopDeclarations.length; j < l; ++j) declarations.push(loopDeclarations[j]);
    }
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      let site = this.sites[i];
      if (site.isJoin) {
        declarations.push(buildJoinStore(this.fileBase, this.fnName, this.stateClassName, i, assert(site.memberTypeNode), this.range));
        declarations.push(buildJoinError(this.fileBase, this.fnName, this.stateClassName, i, this.range));
        declarations.push(buildJoinDone(this.fileBase, this.fnName, this.stateClassName, i, this.range));
        declarations.push(buildJoinMark(this.fileBase, this.fnName, this.stateClassName, i, this.range));
      } else {
        if (site.isNested) {
          declarations.push(this.buildPending(i));
          this.program.asyncNestedPending.set(this.pendingName(i), site.innerQual);
        }
        declarations.push(this.buildResume(i));
      }
      declarations.push(this.buildReject(i));
    }
    declarations.push(this.buildResult());
    declarations.push(this.buildError());
    declarations.push(this.buildErrorValue());
    declarations.push(this.buildStatus());
    if (emitEntry) {
      let entry = this.buildMethodEntry(assert(receiverClass));
      if (entry) declarations.push(entry);
    }
    if (emitFunctionEntry) {
      let entry = this.buildFunctionEntry();
      if (entry) declarations.push(entry);
    }
    if (emitClassNew) {
      this.classNews.add(this.classNewName(assert(receiverClass)));
      let classNew = this.buildClassNew(assert(receiverClass));
      if (classNew) declarations.push(classNew);
    }
    let statements = this.parentStatements();
    for (let i = 0, k = declarations.length; i < k; ++i) {
      statements.push(declarations[i]);
    }
    for (let i = 0, k = declarations.length; i < k; ++i) {
      if (!this.program.initializeGeneratedDeclaration(declarations[i], this.genParent)) return false;
    }
    this.declaration.body = this.buildWrapperBody();
    return true;
  }

  private hasNameCollision(name: string): bool {
    if (this.genParent.getMember(name)) {
      this.fail(`Generated name '${name}' collides with an existing declaration`, this.range);
      return true;
    }
    return false;
  }

  private parentStatements(): Statement[] {
    if (this.genParent.kind == ElementKind.File) {
      return this.file.source.statements;
    }
    let namespace = <Namespace>this.genParent;
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

  private errorValueName(): string {
    return `__async_${this.fileBase}_${this.fnName}_errorValue`;
  }

  private statusName(): string {
    return `__async_${this.fileBase}_${this.fnName}_status`;
  }

  private mintName(): string {
    return `__async_${this.fileBase}_mint`;
  }

  private mintStringName(): string {
    return `__async_${this.fileBase}_mint_string`;
  }

  private lastHandleName(): string {
    return `__async_${this.fileBase}_${this.fnName}_last_handle`;
  }

  private reclaimName(): string {
    return `__async_${this.fileBase}_${this.fnName}_reclaim`;
  }

  /** Emits the per-file token/string mint exports, once per file. The
   *  mint allocates inside wasm, so the coordinator needs no exported
   *  `__new` (`--exportRuntime`) to obtain fresh heap pointers. */
  private ensureMint(): bool {
    let key = this.file.internalName;
    if (this.mints.has(key)) return true;
    this.mints.add(key);
    let range = this.range;
    let file = this.file;
    if (file.getMember(this.mintName())) {
      this.fail(`Generated name '${this.mintName()}' collides with an existing declaration`, range);
      return false;
    }
    if (file.getMember(this.mintStringName())) {
      this.fail(`Generated name '${this.mintStringName()}' collides with an existing declaration`, range);
      return false;
    }
    let statements = new Array<Statement>();
    statements.push(this.buildMint());
    statements.push(this.buildMintString());
    let fileStatements = file.source.statements;
    for (let i = 0, k = statements.length; i < k; ++i) {
      fileStatements.push(statements[i]);
    }
    for (let i = 0, k = statements.length; i < k; ++i) {
      if (!this.program.initializeGeneratedDeclaration(statements[i], file)) return false;
    }
    return true;
  }

  /** Fresh heap-pointer token: any heap object will do (only the pointer
   *  is the token), so a small ArrayBuffer is the cheapest allocation. */
  private buildMint(): FunctionDeclaration {
    let range = this.range;
    let signature = new FunctionTypeNode(
      [],
      namedType("i32", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(new ReturnStatement(
      new CallExpression(
        ident("changetype", range),
        [ namedType("i32", null, false, range) ],
        [ new NewExpression(
          new TypeName(ident("ArrayBuffer", range), null, range),
          null,
          [ intLit(8, range) ],
          range
        ) ],
        range
      ),
      range
    ));
    return new FunctionDeclaration(
      ident(this.mintName(), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  /** Fresh string of exactly `len` chars: the coordinator writes the
   *  message's UTF-16 units over the blank string. */
  private buildMintString(): FunctionDeclaration {
    let range = this.range;
    let signature = new FunctionTypeNode(
      [ new ParameterNode(ParameterKind.Default, ident("len", range), namedType("i32", null, false, range), null, range) ],
      namedType("string", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(new ReturnStatement(
      callExpr(
        new PropertyAccessExpression(strLit(" ", range), ident("repeat", range), range),
        [ ident("len", range) ],
        range
      ),
      range
    ));
    return new FunctionDeclaration(
      ident(this.mintStringName(), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
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
        ident(`__async_spill_${i}`, range), lazyDecorator(range), CommonFlags.None,
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
      ident("__async_spill_free", range), lazyDecorator(range), CommonFlags.None,
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
    let members = new Array<DeclarationStatement>();
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
    members.push(new FieldDeclaration(
      ident("__errorValue", range), null, CommonFlags.None,
      namedType("Error", null, false, range),
      new CallExpression(
        ident("changetype", range),
        [ namedType("Error", null, false, range) ],
        [ intLit(0, range) ],
        range
      ), -1, range
    ));
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      let site = this.sites[i];
      if (site.isJoin || !site.used || site.type.kind == TypeKind.Extern || site.type.kind == TypeKind.Void) continue;
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
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      let site = this.sites[i];
      if (!site.isNested) continue;
      members.push(new FieldDeclaration(
        ident(site.handleField, range), null, CommonFlags.None,
        namedType("usize", null, false, range),
        intLit(0, range), -1, range
      ));
    }
    for (let i = 0, k = this.slots.length; i < k; ++i) {
      members.push(new FieldDeclaration(
        ident(this.slots[i].slotField, range), null, CommonFlags.None,
        namedType("i32", null, false, range),
        new UnaryPrefixExpression(Token.Minus, intLit(1, range), range), -1, range
      ));
    }
    for (let i = 0, k = this.liftedMethods.length; i < k; ++i) {
      members.push(this.liftedMethods[i]);
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
      } else if (end!.kind == "fail") {
        let terminalStmts = this.terminalStatements(true, range, -2);
        for (let j = 0, l = terminalStmts.length; j < l; ++j) {
          statements.push(terminalStmts[j]);
        }
        statements.push(new ReturnStatement(intLit(2, range), range));
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
    let body = new Array<Statement>();
    if (this.needsStateGlobal) {
      // Adapters forward through the currently-stepping state object,
      // and extracted arrows read it for their outer.
      body.push(exprStmt(assignExpr(
        ident(this.stateGlobalName, range),
        new CallExpression(
          ident("changetype", range),
          [ namedType("usize", null, false, range) ],
          [ new ThisExpression(range) ],
          range
        ),
        range
      )));
    }
    body.push(loop);
    return new MethodDeclaration(
      ident("step", range), null, CommonFlags.Instance,
      null, signature, blockStmt(body, range), range
    );
  }

  private buildRootsGlobal(): VariableStatement {
    let range = this.range;
    let stateType = namedType(this.stateClassName, null, false, range);
    return new VariableStatement(
      null,
      [ new VariableDeclaration(
        ident(this.rootsName, range), lazyDecorator(range), CommonFlags.None,
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

  private buildStateGlobal(): VariableStatement {
    let range = this.range;
    return new VariableStatement(
      null,
      [ new VariableDeclaration(
        ident(this.stateGlobalName, range), lazyDecorator(range), CommonFlags.None,
        namedType("usize", null, false, range),
        intLit(0, range),
        range
      ) ],
      range
    );
  }

  /** Copies the closure's own parameters out of the lifted method's
   *  signature (its leading parameters are the hidden externref captures
   *  and env). */
  private loopClosureParams(method: MethodDeclaration, range: Range, skip: i32): ParameterNode[] {
    let params = new Array<ParameterNode>();
    let methodParams = method.signature.parameters;
    for (let i = skip, k = methodParams.length; i < k; ++i) {
      let parameter = methodParams[i];
      params.push(new ParameterNode(
        parameter.parameterKind,
        ident(parameter.name.text, parameter.name.range),
        parameter.type,
        null,
        parameter.range
      ));
    }
    return params;
  }

  /** Module-global holding one loop closure's externref capture, per slot. */
  private loopExtName(adapterBase: string, capture: string, slot: i32): string {
    return `${adapterBase}_ext_${capture}_${slot}`;
  }

  /** Builds the env class, adapter table globals, capture helper, and
   *  adapters for one loop closure. The capture helper snapshots the
   *  current values into a fresh env, stores it in the next round-robin
   *  slot, and returns that slot's adapter; each adapter forwards through
   *  its slot's env. Slot 0's adapter is built by the lifter, so only
   *  slots 1..31 are built here. */
  private buildLoopAdapterSet(build: LoopAdapterBuild): Statement[] | null {
    let range = this.range;
    let info = build.info;
    let method = build.method;
    let envsName = info.envsName;
    let fnsName = info.fnsName;
    let slotName = info.slotName;
    let declarations = new Array<Statement>();
    let envMembers = new Array<DeclarationStatement>();
    for (let i = 0, k = info.captures.length; i < k; ++i) {
      if (build.extCaptures.indexOf(info.captures[i]) >= 0) continue;
      let zero = zeroValue(build.types[i], build.typeNodes[i], range);
      if (!zero) return null;
      envMembers.push(new FieldDeclaration(
        ident(info.captures[i], range), null, CommonFlags.None,
        build.typeNodes[i], zero, -1, range
      ));
    }
    declarations.push(new ClassDeclaration(
      ident(info.envClass, range), null, CommonFlags.None,
      null, null, null, envMembers, range
    ));
    let hiddenParams = 1 + build.extCaptures.length;
    let closureParams = this.loopClosureParams(method, range, hiddenParams);
    let fnType = new FunctionTypeNode(
      this.loopClosureParams(method, range, hiddenParams),
      method.signature.returnType,
      null,
      false,
      range
    );
    let fnIdents = new Array<Expression>();
    for (let s = 0; s < LOOP_ADAPTER_SLOTS; ++s) {
      fnIdents.push(ident(`${info.adapterBase}_${s}`, range));
    }
    // One externref global per slot per externref capture: reference
    // types cannot live in arrays or class fields, so each slot holds its
    // capture in its own global, as the spill pool does. These must precede
    // the adapter-function array below: compiling that array compiles the
    // adapters, whose bodies read the ext globals, and a global assigned
    // before its declaration is a compile error (TS2448).
    for (let i = 0, k = build.extCaptures.length; i < k; ++i) {
      let extGlobals = new Array<VariableDeclaration>();
      for (let s = 0; s < LOOP_ADAPTER_SLOTS; ++s) {
        extGlobals.push(new VariableDeclaration(
          ident(this.loopExtName(info.adapterBase, build.extCaptures[i], s), range),
          null, CommonFlags.None,
          namedType("externref", null, false, range),
          new NullExpression(range),
          range
        ));
      }
      declarations.push(new VariableStatement(null, extGlobals, range));
    }
    declarations.push(new VariableStatement(
      null,
      [
        new VariableDeclaration(
          ident(envsName, range), null, CommonFlags.None,
          namedType("Array", [ namedType(info.envClass, null, false, range) ], false, range),
          new NewExpression(
            new TypeName(ident("Array", range), null, range),
            [ namedType(info.envClass, null, false, range) ],
            [ intLit(LOOP_ADAPTER_SLOTS, range) ],
            range
          ),
          range
        ),
        new VariableDeclaration(
          ident(fnsName, range), null, CommonFlags.None,
          namedType("Array", [ fnType ], false, range),
          new ArrayLiteralExpression(fnIdents, range),
          range
        ),
        new VariableDeclaration(
          ident(slotName, range), null, CommonFlags.None,
          namedType("i32", null, false, range),
          intLit(0, range),
          range
        )
      ],
      range
    ));
    let helperParams = new Array<ParameterNode>();
    for (let i = 0, k = info.captures.length; i < k; ++i) {
      helperParams.push(new ParameterNode(
        ParameterKind.Default,
        ident(info.captures[i], range),
        build.typeNodes[i],
        null,
        range
      ));
    }
    let helperBody = new Array<Statement>();
    helperBody.push(new VariableStatement(
      null,
      [ new VariableDeclaration(
        ident(LOOP_ENV_PARAM, range), null, CommonFlags.None,
        namedType(info.envClass, null, false, range),
        new NewExpression(
          new TypeName(ident(info.envClass, range), null, range),
          null,
          [],
          range
        ),
        range
      ) ],
      range
    ));
    for (let i = 0, k = info.captures.length; i < k; ++i) {
      if (build.extCaptures.indexOf(info.captures[i]) >= 0) continue;
      helperBody.push(exprStmt(assignExpr(
        new PropertyAccessExpression(
          ident(LOOP_ENV_PARAM, range),
          ident(info.captures[i], range),
          range
        ),
        ident(info.captures[i], range),
        range
      )));
    }
    helperBody.push(new VariableStatement(
      null,
      [ new VariableDeclaration(
        ident("__async_slot", range), null, CommonFlags.None,
        namedType("i32", null, false, range),
        ident(slotName, range),
        range
      ) ],
      range
    ));
    for (let i = 0, k = build.extCaptures.length; i < k; ++i) {
      let capture = build.extCaptures[i];
      let cases = new Array<SwitchCase>();
      for (let s = 0; s < LOOP_ADAPTER_SLOTS; ++s) {
        cases.push(new SwitchCase(
          intLit(s, range),
          [
            exprStmt(assignExpr(
              ident(this.loopExtName(info.adapterBase, capture, s), range),
              ident(capture, range),
              range
            )),
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
      helperBody.push(new SwitchStatement(ident("__async_slot", range), cases, range));
    }
    helperBody.push(exprStmt(assignExpr(
      new ElementAccessExpression(
        ident(envsName, range),
        ident("__async_slot", range),
        range
      ),
      ident(LOOP_ENV_PARAM, range),
      range
    )));
    helperBody.push(exprStmt(assignExpr(
      ident(slotName, range),
      new BinaryExpression(
        Token.Percent,
        new BinaryExpression(
          Token.Plus,
          ident("__async_slot", range),
          intLit(1, range),
          range
        ),
        intLit(LOOP_ADAPTER_SLOTS, range),
        range
      ),
      range
    )));
    helperBody.push(new ReturnStatement(
      new ElementAccessExpression(
        ident(fnsName, range),
        ident("__async_slot", range),
        range
      ),
      range
    ));
    declarations.push(new FunctionDeclaration(
      ident(info.captureName, range),
      null,
      CommonFlags.None,
      null,
      new FunctionTypeNode(helperParams, fnType, null, false, range),
      blockStmt(helperBody, range),
      ArrowKind.None,
      range
    ));
    for (let s = 1; s < LOOP_ADAPTER_SLOTS; ++s) {
      let argIdents = new Array<Expression>();
      for (let i = 0, k = build.extCaptures.length; i < k; ++i) {
        argIdents.push(ident(this.loopExtName(info.adapterBase, build.extCaptures[i], s), range));
      }
      argIdents.push(new ElementAccessExpression(
        ident(envsName, range),
        intLit(s, range),
        range
      ));
      for (let i = 0, k = closureParams.length; i < k; ++i) {
        argIdents.push(ident(closureParams[i].name.text, closureParams[i].name.range));
      }
      let stateAccess = new CallExpression(
        ident("changetype", range),
        [ namedType(this.stateClassName, null, false, range) ],
        [ ident(this.stateGlobalName, range) ],
        range
      );
      declarations.push(new FunctionDeclaration(
        ident(`${info.adapterBase}_${s}`, range),
        null,
        CommonFlags.None,
        null,
        new FunctionTypeNode(
          this.loopClosureParams(method, range, hiddenParams),
          method.signature.returnType,
          null,
          false,
          range
        ),
        blockStmt([
          new ReturnStatement(
            callExpr(
              new PropertyAccessExpression(stateAccess, ident(method.name.text, range), range),
              argIdents,
              range
            ),
            range
          )
        ], range),
        ArrowKind.None,
        range
      ));
    }
    return declarations;
  }

  private pendingName(site: i32): string {
    return `__async_${this.fileBase}_${this.fnName}_pending_${site}`;
  }

  /** Export returning the inner task's handle for a nested await site, so
   *  the coordinator can drive the inner task to completion. */
  private buildPending(siteId: i32): FunctionDeclaration {
    let range = this.range;
    let site = this.sites[siteId];
    let stateParam = new ParameterNode(
      ParameterKind.Default,
      ident("state", range),
      namedType(this.stateClassName, null, false, range),
      null,
      range
    );
    let signature = new FunctionTypeNode(
      [ stateParam ],
      namedType("usize", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(new ReturnStatement(
      new PropertyAccessExpression(ident("state", range), ident(site.handleField, range), range),
      range
    ));
    return new FunctionDeclaration(
      ident(this.pendingName(siteId), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
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
    // A void site carries no value: the resume export takes only the
    // state, and the coordinator calls it with no value argument.
    let params = new Array<ParameterNode>();
    params.push(stateParam);
    if (site.type.kind != TypeKind.Void) {
      params.push(new ParameterNode(
        ParameterKind.Default,
        ident("value", range),
        site.typeNode,
        null,
        range
      ));
    }
    let signature = new FunctionTypeNode(
      params,
      namedType("i32", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    if (site.used && site.type.kind != TypeKind.Void) {
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
    let site = this.sites[siteId];
    let body = new Array<Statement>();
    if (!site.isJoin && site.rejectFlagField != "") {
      // A coordinator rejection lands in the enclosing try's catch: set
      // the error flag/message and resume the state machine at the segment
      // after the suspending call (the task is suspended at this site, so
      // `step()` dispatches there). The desugared guards skip the rest of
      // the try body and the dispatch runs catch/finally/propagation.
      // A rejection of an await in a finally first clears the pending
      // outcome the finally was running for, exactly as a sync transfer
      // in a finally does: without this, the post-finally dispatch would
      // overwrite the new error with the stale body error, or execute a
      // stale pending return.
      for (let i = 0, k = site.rejectClearFields.length; i < k; ++i) {
        body.push(exprStmt(assignExpr(
          new PropertyAccessExpression(ident("state", range), ident(site.rejectClearFields[i], range), range),
          new FalseExpression(range),
          range
        )));
      }
      body.push(exprStmt(assignExpr(
        new PropertyAccessExpression(ident("state", range), ident(site.rejectFlagField, range), range),
        new TrueExpression(range),
        range
      )));
      body.push(exprStmt(assignExpr(
        new PropertyAccessExpression(ident("state", range), ident(site.rejectErrField, range), range),
        ident("message", range),
        range
      )));
      body.push(new ReturnStatement(
        callExpr(
          new PropertyAccessExpression(ident("state", range), ident("step", range), range),
          [],
          range
        ),
        range
      ));
    } else {
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
    }
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

  private buildErrorValue(): FunctionDeclaration {
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
      namedType("Error", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(new ReturnStatement(
      new PropertyAccessExpression(ident("state", range), ident("__errorValue", range), range),
      range
    ));
    return new FunctionDeclaration(
      ident(this.errorValueName(), range), null, CommonFlags.Export,
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

  /** Last task on the roots registry: the registry is the liveness
   *  record, so the handle can never dangle — a settled task is spliced
   *  out and a live one stays a traced reference. A raw pointer global
   *  would go stale once the GC reuses the address. */
  private buildLastHandleGetter(): FunctionDeclaration {
    let range = this.range;
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
        new PropertyAccessExpression(ident(this.rootsName, range), ident("length", range), range),
        intLit(0, range),
        range
      ),
      blockStmt([ new ReturnStatement(intLit(0, range), range) ], range),
      null,
      range
    ));
    body.push(new ReturnStatement(
      new CallExpression(
        ident("changetype", range),
        [ namedType("i32", null, false, range) ],
        [ new ElementAccessExpression(
          ident(this.rootsName, range),
          new BinaryExpression(
            Token.Minus,
            new PropertyAccessExpression(ident(this.rootsName, range), ident("length", range), range),
            intLit(1, range),
            range
          ),
          range
        ) ],
        range
      ),
      range
    ));
    return new FunctionDeclaration(
      ident(this.lastHandleName(), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  /** Export releasing a trapped task's spill slots: the terminal cleanup
   *  without running the state machine. Already-terminal is a no-op, so
   *  a repeated reclaim cannot release a slot twice. */
  private buildReclaim(): FunctionDeclaration {
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
    body.push(new IfStatement(
      new BinaryExpression(
        Token.LessThan,
        new PropertyAccessExpression(ident("state", range), ident("state", range), range),
        intLit(0, range),
        range
      ),
      blockStmt([ new ReturnStatement(intLit(2, range), range) ], range),
      null,
      range
    ));
    let terminalStmts = this.terminalStatements(false, range, -2);
    for (let i = 0, k = terminalStmts.length; i < k; ++i) {
      body.push(terminalStmts[i]);
    }
    body.push(new ReturnStatement(intLit(2, range), range));
    return new FunctionDeclaration(
      ident(this.reclaimName(), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private methodEntryName(): string {
    return `__async_${this.fileBase}_${this.fnName}_entry`;
  }

  private classNewName(receiverClass: ClassPrototype): string {
    return `__async_${this.fileBase}_${this.instantiatedClassName(receiverClass)}_new`;
  }

  /** Class name with its instantiation's type arguments encoded
   *  (`Box_i32` for `Box<i32>`, plain `Box` otherwise), prefixed with
   *  the namespace path for a namespaced class (`NS_H`, `NS_Box_i32`),
   *  so two instantiations of one generic class, and two same-named
   *  classes in different namespaces, get distinct exports. */
  private instantiatedClassName(receiverClass: ClassPrototype): string {
    let thisType = assert(this.instance).signature.thisType;
    let cls = thisType ? thisType.getClass() : null;
    let args = cls ? cls.typeArguments : null;
    let base = receiverClass.name;
    if (args && args.length > 0) base = mangleGenericName(receiverClass.name, args);
    if (this.classNamespacePath.length > 0) return this.classNamespacePath.join("_") + "_" + base;
    return base;
  }

  /** Type node for the resolved receiver (`Box<i32>` for a method on an
   *  instantiated generic class, plain `Box` otherwise). `typeToTypeNode`
   *  qualifies the class with its namespace path (`NS.H`), so the node
   *  resolves at file level, where the generated declarations live. */
  private receiverTypeNode(range: Range): TypeNode | null {
    let thisType = assert(this.instance).signature.thisType;
    if (!thisType) return null;
    return typeToTypeNode(thisType, range);
  }

  /** Whether the function is exported through its whole namespace chain:
   *  the function and every enclosing namespace carry `Export`. A
   *  non-exported namespaced function stays inner-only, like a
   *  non-exported top-level function. */
  private isExportedThroughNamespaces(): bool {
    if (!this.prototype.is(CommonFlags.Export)) return false;
    let current = this.prototype.parent;
    while (current.kind == ElementKind.Namespace) {
      if (!current.is(CommonFlags.Export)) return false;
      current = current.parent;
    }
    return true;
  }

  /** Namespace-qualified callee for the function entry: `NS.take` for a
   *  single namespace, `Outer.Inner.deep` for nested ones. */
  private namespacedCallee(range: Range): Expression {
    let callee: Expression = ident(this.namespacePath[0], range);
    for (let i = 1, k = this.namespacePath.length; i < k; ++i) {
      callee = new PropertyAccessExpression(callee, ident(this.namespacePath[i], range), range);
    }
    return new PropertyAccessExpression(callee, ident(this.prototype.name, range), range);
  }

  /** Builds the top-level entry alias for an exported namespaced async
   *  function: `__async_<file>_<qual>_entry(...params): i32` calls the
   *  namespaced wrapper and returns its state handle, mirroring the
   *  method entry. Stock asc does not export namespace members, so
   *  without this alias the coordinator could not drive the function. */
  private buildFunctionEntry(): FunctionDeclaration | null {
    let range = this.range;
    let parameters = this.prototype.functionTypeNode.parameters;
    let entryParams = new Array<ParameterNode>();
    let callArgs = new Array<Expression>();
    let signature = assert(this.instance).signature;
    for (let i = 0, k = parameters.length; i < k; ++i) {
      let parameter = parameters[i];
      let typeNode = parameter.type || typeToTypeNode(signature.parameterTypes[i], range);
      if (!typeNode) {
        warnSkipped(this.program, this.prototype, "parameter '" + parameter.name.text + "' has no usable type", []);
        return null;
      }
      entryParams.push(new ParameterNode(
        ParameterKind.Default,
        ident(parameter.name.text, range),
        typeNode,
        null,
        range
      ));
      callArgs.push(ident(parameter.name.text, range));
    }
    let entrySignature = new FunctionTypeNode(
      entryParams,
      namedType("i32", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(new ReturnStatement(
      new CallExpression(
        ident("changetype", range),
        [ namedType("i32", null, false, range) ],
        [ callExpr(this.namespacedCallee(range), callArgs, range) ],
        range
      ),
      range
    ));
    return new FunctionDeclaration(
      ident(this.methodEntryName(), range), null, CommonFlags.Export,
      null, entrySignature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  private buildMethodEntry(receiverClass: ClassPrototype): FunctionDeclaration | null {
    let range = this.range;
    let parameters = this.prototype.functionTypeNode.parameters;
    let receiverName = "receiver";
    for (let i = 0, k = parameters.length; i < k; ++i) {
      if (parameters[i].name.text == receiverName) {
        receiverName = "__receiver";
        break;
      }
    }
    let entryParams = new Array<ParameterNode>();
    // A static entry takes no receiver: the call qualifies the class.
    if (!this.isStatic) {
      // The resolved receiver type, not the bare class name: for a
      // generic class the bare name carries no type arguments and does
      // not resolve (`Box` needs `<i32>`).
      let receiverTypeNode = this.receiverTypeNode(range);
      entryParams.push(new ParameterNode(
        ParameterKind.Default,
        ident(receiverName, range),
        receiverTypeNode || namedType(receiverClass.name, null, false, range),
        null,
        range
      ));
    }
    let callArgs = new Array<Expression>();
    let signature = assert(this.instance).signature;
    for (let i = 0, k = parameters.length; i < k; ++i) {
      let parameter = parameters[i];
      // A rest array built by the coordinator cannot be forwarded
      // through the entry: AssemblyScript cannot pass a pre-built array
      // as a rest argument (the call wraps it into a one-element array
      // instead). The method stays transformable — nested await passes
      // elements, which wrap normally — but it is not drivable through
      // the coordinator.
      if (parameter.parameterKind == ParameterKind.Rest) {
        warnSkipped(this.program, this.prototype, "rest parameters cannot be driven through the coordinator (a pre-built array cannot be passed as a rest argument)", []);
        return null;
      }
      let typeNode = parameter.type || typeToTypeNode(signature.parameterTypes[i], range);
      if (!typeNode) {
        warnSkipped(this.program, this.prototype, "parameter '" + parameter.name.text + "' has no usable type", []);
        return null;
      }
      // The entry mirrors the method's parameter kinds and initializers
      // so it gets its own varargs stub: omitted arguments are filled by
      // the stub exactly as a direct call would fill them. An initializer
      // that mentions `this` or `super` cannot be evaluated in the entry
      // (a free function, so it has no `this`); such a method stays
      // transformable but is not drivable through the coordinator.
      if (parameter.initializer && containsThisOrSuper(parameter.initializer)) {
        warnSkipped(this.program, this.prototype, "parameter '" + parameter.name.text + "' has a default value that references 'this' or 'super'", []);
        return null;
      }
      entryParams.push(new ParameterNode(
        parameter.parameterKind,
        ident(parameter.name.text, range),
        typeNode,
        parameter.initializer,
        range
      ));
      callArgs.push(ident(parameter.name.text, range));
    }
    let entrySignature = new FunctionTypeNode(
      entryParams,
      namedType("i32", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    body.push(new ReturnStatement(
      new CallExpression(
        ident("changetype", range),
        [ namedType("i32", null, false, range) ],
        [ callExpr(
          new PropertyAccessExpression(
            this.isStatic ? this.classCallee(receiverClass, range) : ident(receiverName, range),
            ident(this.prototype.name, range),
            range
          ),
          callArgs,
          range
        ) ],
        range
      ),
      range
    ));
    return new FunctionDeclaration(
      ident(this.methodEntryName(), range), null, CommonFlags.Export,
      null, entrySignature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  /** Callee qualifying the class for a static entry (`NS.H` for a
   *  namespaced class, plain `H` otherwise): the entry lives at file
   *  level, where the bare class name would not resolve. */
  private classCallee(receiverClass: ClassPrototype, range: Range): Expression {
    if (this.classNamespacePath.length == 0) return ident(receiverClass.name, range);
    let callee: Expression = ident(this.classNamespacePath[0], range);
    for (let i = 1, k = this.classNamespacePath.length; i < k; ++i) {
      callee = new PropertyAccessExpression(callee, ident(this.classNamespacePath[i], range), range);
    }
    return new PropertyAccessExpression(callee, ident(receiverClass.name, range), range);
  }

  private buildClassNew(receiverClass: ClassPrototype): FunctionDeclaration | null {
    let range = this.range;
    let className = receiverClass.name;
    let parameters = new Array<ParameterNode>();
    let args = new Array<Expression>();
    let classInstance = this.resolveNewClass(receiverClass);
    // No class instance means no `_new`: a static method on a generic
    // class has no instantiation to resolve the class with (statics
    // cannot reference the class's type parameters, and `new Box()`
    // without type arguments is an error), so the class cannot be
    // constructed through the coordinator. The entry still drives the
    // method as a nested inner.
    if (!classInstance) {
      let typeParameters = receiverClass.typeParameterNodes;
      if (typeParameters && typeParameters.length > 0) {
        warnSkipped(this.program, this.prototype, "the constructor of generic class '" + className + "' cannot be driven without a class instantiation", []);
        return null;
      }
    }
    let ctor = classInstance ? classInstance.constructorInstance : null;
    if (ctor) {
      let ctorPrototype = ctor.prototype;
      let described = describeParamsAndRest(this.program, ctor.signature, className);
      if (described.reason) {
        warnSkipped(this.program, this.prototype, described.reason, []);
        return null;
      }
      let ctorParams = ctorPrototype.functionTypeNode.parameters;
      for (let i = 0, k = ctorParams.length; i < k; ++i) {
        let parameter = ctorParams[i];
        // As in buildMethodEntry: a rest array cannot be forwarded
        // through _new, so a class with a rest constructor is not
        // drivable through the coordinator.
        if (parameter.parameterKind == ParameterKind.Rest) {
          warnSkipped(this.program, this.prototype, "rest parameters cannot be driven through the coordinator (a pre-built array cannot be passed as a rest argument)", []);
          return null;
        }
        // The resolved type, not the declared node: the declared node
        // can name a type parameter of a generic class, which has no
        // meaning in the generated function. Falls back to the declared
        // node when the resolved type has no spelling.
        let typeNode = typeToTypeNode(ctor.signature.parameterTypes[i], range) || parameter.type;
        if (!typeNode) {
          warnSkipped(this.program, this.prototype, "constructor of '" + className + "' has a parameter without a usable type", []);
          return null;
        }
        // As in buildMethodEntry: the _new mirrors the constructor's
        // parameter kinds and initializers so it gets its own varargs
        // stub, and a `this`/`super` default is not drivable.
        if (parameter.initializer && containsThisOrSuper(parameter.initializer)) {
          warnSkipped(this.program, this.prototype, "constructor parameter '" + parameter.name.text + "' has a default value that references 'this' or 'super'", []);
          return null;
        }
        parameters.push(new ParameterNode(
          parameter.parameterKind,
          ident(parameter.name.text, range),
          typeNode,
          parameter.initializer,
          range
        ));
        args.push(ident(parameter.name.text, range));
      }
    }
    let signature = new FunctionTypeNode(
      parameters,
      namedType("i32", null, false, range),
      null,
      false,
      range
    );
    let body = new Array<Statement>();
    // The resolved receiver type, or the bare class name for a static
    // method (which has no receiver type), qualified with the namespace
    // path: the `_new` lives at file level, where the bare class name
    // would not resolve. It carries the type arguments too (`Box<i32>`).
    let newType = this.receiverTypeNode(range);
    if (!newType) {
      let chained = new TypeName(ident(className, range), null, range);
      for (let i = this.classNamespacePath.length - 1; i >= 0; --i) {
        chained = new TypeName(ident(this.classNamespacePath[i], range), chained, range);
      }
      newType = new NamedTypeNode(chained, null, false, range);
    }
    let newTypeName = new TypeName(ident(className, range), null, range);
    let newTypeArgs: TypeNode[] | null = null;
    if (newType.kind == NodeKind.NamedType) {
      let named = <NamedTypeNode>newType;
      newTypeName = named.name;
      newTypeArgs = named.typeArguments;
    }
    body.push(new ReturnStatement(
      new CallExpression(
        ident("changetype", range),
        [ namedType("i32", null, false, range) ],
        [ new NewExpression(
          newTypeName,
          newTypeArgs,
          args,
          range
        ) ],
        range
      ),
      range
    ));
    return new FunctionDeclaration(
      ident(this.classNewName(receiverClass), range), null, CommonFlags.Export,
      null, signature, blockStmt(body, range), ArrowKind.None, range
    );
  }

  /** Resolves the class for the `_new` export. An instance method reads
   *  it off its receiver type; a static method has no receiver type, so
   *  the class resolves directly (it already resolved in the worklist).
   *  A static method on a generic class has no instantiation to resolve
   *  with — resolving a generic class with null type arguments asserts —
   *  so that case returns `null` and the caller skips the `_new`. */
  private resolveNewClass(receiverClass: ClassPrototype): Class | null {
    let thisType = assert(this.instance).signature.thisType;
    if (thisType) {
      let classInstance = thisType.getClass();
      if (classInstance) return classInstance;
    }
    let typeParameters = receiverClass.typeParameterNodes;
    if (typeParameters && typeParameters.length > 0) return null;
    return this.program.resolver.resolveClass(receiverClass, null, new Map(), ReportMode.Swallow);
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
    if (this.outerQual) {
      // Pin the enclosing function's state object: it is read from the
      // state global while the enclosing step is running synchronously,
      // so the global holds this task's state; the field then pins it
      // across suspension and is never re-read. The global is usize
      // typed, so the read is cast back to the state class.
      body.push(exprStmt(assignExpr(
        new PropertyAccessExpression(ident("__st", range), ident(ASYNC_OUTER_NAME, range), range),
        new CallExpression(
          ident("changetype", range),
          [ namedType(cpsStateClassName(this.outerQual), null, false, range) ],
          [ ident(cpsStateGlobalName(this.fileBase, this.outerQual), range) ],
          range
        ),
        range
      )));
    }
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
    if (this.isMethod && !this.isStatic) {
      let receiverBinding = this.scope.lookup(ASYNC_THIS_NAME);
      assert(receiverBinding != null);
      body.push(exprStmt(assignExpr(
        new PropertyAccessExpression(ident("__st", range), ident(receiverBinding!.field, range), range),
        new ThisExpression(range),
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

/** A `@lazy` decorator for a generated global, so it compiles on first
 *  use (`compileGlobalLazy`): a clone transformed mid-compilation (a
 *  sync direct call to a generic async function) registers its globals
 *  after `compileFile` already ran, so their initializers never ran at
 *  startup. Lazy initialization is safe here: every generated global is
 *  only read by the generated code that first initializes it. */
function lazyDecorator(range: Range): DecoratorNode[] {
  return [ Node.createDecorator(ident("lazy", range), null, range) ];
}

