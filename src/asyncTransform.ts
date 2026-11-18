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
  buildJoinStore,
  buildJoinError,
  buildJoinDone
} from "./asyncJoin";

import {
  rejectTargetFor
} from "./asyncTryDesugar";

import {
  liftThisInAsyncBody
} from "./asyncThisLift";

import {
  liftEnvInAsyncBody,
  LiftContext,
  EnvLiftResult
} from "./asyncEnvLift";

import {
  scanFileForAsyncArrows,
  ArrowWorkItem
} from "./asyncArrowExtract";

import {
  AsyncScope,
  AsyncRewriter,
  AsyncFail,
  ASYNC_THIS_NAME,
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
  containsAwait,
  validateBody,
  cpsStateClassName,
  cpsStateGlobalName,
  SPILL_POOL_SIZE,
  SPILL_ACQUIRE,
  SPILL_RELEASE,
  SPILL_GET,
  SPILL_SET
} from "./asyncRewrite";

import {
  describeParams,
  findExportName,
  warnSkipped
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
    /** Whether this site awaits a nested async function in the same file. */
    public isNested: bool = false,
    /** State field holding the inner task's handle, for a nested site. */
    public handleField: string = "",
    /** Qualified name of the inner async function, for a nested site. */
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
    public resultTypeNode: TypeNode
  ) {}
}

/** One async function or method awaiting the pre-passes and the core. */
interface TransformWorkItem {
  prototype: FunctionPrototype;
  /** Whether the prototype is an instance method (receiver via `this`). */
  isMethod: bool;
  /** Enclosing class, for methods and for arrows closing over a receiver. */
  receiverClass: ClassPrototype | null;
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
}

/** Transforms all async functions in the program. Called from `Program.initialize()`. */
export function transformAsyncFunctions(program: Program): void {
  let pools = new Set<string>();
  let mints = new Set<string>();
  let classNews = new Set<ClassPrototype>();
  let files = Map_values(program.filesByName);
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
    let fileBase = sanitizeName(file.source.simplePath);
    let worklist = new Array<TransformWorkItem>();
    for (let j = 0, l = functions.length; j < l; ++j) {
      let prototype = functions[j];
      worklist.push({
        prototype,
        isMethod: false,
        receiverClass: null,
        genParent: file,
        qualName: prototype.name,
        selfName: null,
        forbidden: new Set<string>(),
        isExtracted: false
      });
    }
    for (let j = 0, l = methods.length; j < l; ++j) {
      let prototype = methods[j];
      let receiverClass = <ClassPrototype>prototype.parent;
      worklist.push({
        prototype,
        isMethod: true,
        receiverClass,
        genParent: receiverClass.parent,
        qualName: `${receiverClass.name}_${prototype.name}`,
        selfName: null,
        forbidden: new Set<string>(),
        isExtracted: false
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
        let typeParameters = receiverClass.typeParameterNodes;
        if (typeParameters && typeParameters.length > 0) {
          fail("Async methods in generic classes are not yet supported", prototype.identifierNode.range);
          continue;
        }
        if (receiverClass.parent.kind == ElementKind.Namespace) {
          fail("Async methods in namespaced classes are not yet supported: the entry is not a WebAssembly export, so the coordinator cannot drive it", prototype.identifierNode.range);
          continue;
        }
        let classInstance = program.resolver.resolveClass(receiverClass, null, new Map(), ReportMode.Report);
        if (!classInstance) {
          program.rejectedAsyncFunctions.add(prototype);
          continue;
        }
        transformPrototype = prototype.toBound(classInstance);
      } else if (prototype.parent.kind == ElementKind.Namespace) {
        fail("Async functions in namespaces are not yet supported: the entry is not a WebAssembly export, so the coordinator cannot drive it", prototype.identifierNode.range);
        continue;
      }
      if (!liftThisInAsyncBody(program, transformPrototype, fail, item.isExtracted)) continue;
      let ctx: LiftContext = {
        program,
        file,
        genParent: item.genParent,
        qualName: item.qualName,
        stateClassName: cpsStateClassName(item.qualName),
        stateGlobalName: cpsStateGlobalName(fileBase, item.qualName),
        hasReceiver: item.isMethod || item.receiverClass != null,
        receiverClass: item.receiverClass,
        aliases
      };
      let lift = liftEnvInAsyncBody(program, transformPrototype, ctx, item.selfName, item.forbidden, fail);
      if (!lift) continue;
      for (let a = 0, b = lift.arrows.length; a < b; ++a) {
        worklist.push(arrowWorkItem(lift.arrows[a]));
      }
      let transform = new AsyncFunctionTransform(program, file, transformPrototype, pools, mints, lift, item.qualName, item.genParent, item.isMethod, item.receiverClass, classNews);
      transform.run();
    }
  }
}

/** Turns an extracted arrow into a worklist item. Extracted arrows are
 *  plain functions whose receiver, when present, arrives as a leading
 *  `__async_this` parameter, so they are not methods for the core. */
function arrowWorkItem(arrow: ArrowWorkItem): TransformWorkItem {
  return {
    prototype: arrow.prototype,
    isMethod: false,
    receiverClass: arrow.receiverClass,
    genParent: arrow.genParent,
    qualName: arrow.prototype.name,
    selfName: arrow.selfName,
    forbidden: arrow.forbidden,
    isExtracted: true
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
  /** Element generated declarations are registered under. */
  private genParent: Element;
  /** Whether the prototype is an instance method (receiver via `this`). */
  private isMethod: bool;
  /** Enclosing class, for methods; `null` for plain functions. */
  private receiverClass: ClassPrototype | null;
  /** Classes whose `__async_<file>_<Class>_new` export was already
   *  emitted by an earlier transformed method of the class. */
  private classNews: Set<ClassPrototype>;
  /** Lifted closure methods, appended to the state class. */
  private liftedMethods: MethodDeclaration[];
  /** Adapter name to lifted method, for the rewrite hook; `null` when none. */
  private adapters: Map<string, MethodDeclaration> | null;
  /** Whether any adapter exists, so the state global is needed. */
  private hasAdapters: bool;
  /** Module global holding the currently-stepping state object. */
  private stateGlobalName: string;
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
    receiverClass: ClassPrototype | null,
    classNews: Set<ClassPrototype>
  ) {
    this.declaration = <FunctionDeclaration>prototype.declaration;
    this.parent = prototype.parent;
    this.genParent = genParent;
    this.isMethod = isMethod;
    this.receiverClass = receiverClass;
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
    if (this.isMethod) {
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
    // compiling with unresolved captures.
    let adapters = this.adapters;
    if (adapters) {
      let remaining = Map_values(adapters);
      for (let i = 0, k = remaining.length; i < k; ++i) {
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
    return { scope: this.scope, fail: this.fail, adapters: this.adapters };
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
      case NodeKind.Throw: {
        // The try desugar's fail-the-task primitive: set the error slot
        // and close the task as failed. Reaching here with an await in the
        // value is a loud error via `rewriteChecked`.
        let value = this.rewriteChecked((<ThrowStatement>stmt).value);
        if (!value) return;
        this.emitFail(value, stmt.range);
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
          });
          if (status == JoinEmitOutcome.FailedInline) return;
          continue;
        }
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
        if (this.isSuspendingImportCall(initializer)) {
          let binding = this.scope.lookup(name);
          if (binding) this.storedPromises.add(binding.field);
        }
      }
    }
  }

  private transformExpressionStatement(stmt: ExpressionStatement): void {
    let expr = unwrapParens(stmt.expression);
    if (expr.kind == NodeKind.Await) {
      let awaitExpr = <AwaitExpression>expr;
      let joinCall = this.joinCallOf(awaitExpr);
      if (joinCall) {
        let join = this.prepareJoin(joinCall, assert(joinPolicyOfCall(joinCall)), false, awaitExpr.range, null);
        if (!join) return;
        let status = this.emitJoin(join, (_value: Expression): void => {});
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
      let awaitExpr = <AwaitExpression>unwrapParens(binary.right);
      let joinCall = this.joinCallOf(awaitExpr);
      if (joinCall) {
        let join = this.prepareJoin(joinCall, assert(joinPolicyOfCall(joinCall)), true, awaitExpr.range, this.localTypeNode(name));
        if (!join) return;
        let binding = this.scope.lookup(name);
        let status = this.emitJoin(join, (value: Expression): void => {
          if (binding) {
            this.emitLocalAssign(name, value, stmt.range);
          } else {
            this.emit(exprStmt(assignExpr(ident(name, left.range), value, stmt.range)));
          }
        });
        if (status == JoinEmitOutcome.FailedInline) return;
        return;
      }
      let site = this.transformAwait(awaitExpr, true);
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
    this.trackStoredRebind(stmt.expression);
    let rewritten = this.rewriteChecked(stmt.expression);
    if (!rewritten) return;
    this.emit(exprStmt(rewritten));
  }

  private transformReturn(stmt: ReturnStatement): void {
    let value = stmt.value;
    if (value && unwrapParens(value).kind == NodeKind.Await) {
      let awaitExpr = <AwaitExpression>unwrapParens(value);
      let joinCall = this.joinCallOf(awaitExpr);
      if (joinCall) {
        let join = this.prepareJoin(joinCall, assert(joinPolicyOfCall(joinCall)), true, awaitExpr.range, this.returnTypeNode);
        if (!join) return;
        let status = this.emitJoin(join, (result: Expression): void => {
          if (this.returnType.kind != TypeKind.Void) {
            this.emit(exprStmt(assignExpr(this.resultAccess(stmt.range), result, stmt.range)));
          }
        });
        if (status == JoinEmitOutcome.FailedInline) return;
        this.emitTerminal(stmt.range);
        return;
      }
      let site = this.transformAwait(awaitExpr, true);
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
    if (this.isSuspendingImportCall(binary.right)) {
      this.storedPromises.add(binding.field);
    } else {
      this.storedPromises.delete(binding.field);
    }
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
      this.fail("'await' of a stored promise is only supported when the promise was bound by a direct call to a suspending import in this function", node.range);
      return null;
    }
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
    let typeNode = typeToTypeNode(unwrapped, node.range);
    if (!typeNode) {
      this.fail(`Async functions cannot await values of type '${unwrapped.toString()}' yet`, node.range);
      return null;
    }
    if (unwrapped.kind != TypeKind.Extern && !zeroValue(unwrapped, typeNode, node.range)) {
      this.fail(`Async functions cannot await values of type '${unwrapped.toString()}' yet`, node.range);
      return null;
    }
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
    let rejectTarget = rejectTargetFor(this.file, node.range);
    if (rejectTarget) {
      let flagBinding = this.scope.lookup(rejectTarget.flagVar);
      let errBinding = this.scope.lookup(rejectTarget.errorVar);
      if (flagBinding && !flagBinding.shadowed && errBinding && !errBinding.shadowed) {
        site.rejectFlagField = flagBinding.field;
        site.rejectErrField = errBinding.field;
      }
    }
    if (unwrapped.kind == TypeKind.Extern) {
      site.slotField = `__slot_pend${site.id}`;
      this.slots.push(new SpillSlot("pend", `pend${site.id}`, site.slotField));
    }
    return site;
  }

  /** Validates an await operand and records the site. Returns `null` on failure. */
  private transformAwait(node: AwaitExpression, used: bool): AwaitSite | null {
    let operand = unwrapParens(node.operand);
    if (operand.kind == NodeKind.Identifier) {
      return this.transformStoredAwait(node, <IdentifierExpression>operand, used);
    }
    if (operand.kind != NodeKind.Call) {
      this.fail("'await' is only supported on direct calls to suspending imports", node.range);
      return null;
    }
    let call = <CallExpression>operand;
    let callee = call.expression;
    if (callee.kind == NodeKind.PropertyAccess) {
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
      if (innerPrototype.declaration.range.source != this.file.source) {
        this.fail("await of an async function in another file is not yet supported", node.range);
        return null;
      }
      let args = call.args;
      for (let i = 0, k = args.length; i < k; ++i) {
        this.checkDirectAsyncCalls(args[i]);
        if (this.failed) return null;
      }
      return this.transformNestedAwait(call, calleeName, node, used);
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
    // A coordinator rejection of this site lands in the enclosing try's
    // catch when the desugar recorded one: resolve the error locals to
    // state fields now, while the scope still holds them.
    let rejectTarget = rejectTargetFor(this.file, node.range);
    if (rejectTarget) {
      let flagBinding = this.scope.lookup(rejectTarget.flagVar);
      let errBinding = this.scope.lookup(rejectTarget.errorVar);
      if (flagBinding && !flagBinding.shadowed && errBinding && !errBinding.shadowed) {
        site.rejectFlagField = flagBinding.field;
        site.rejectErrField = errBinding.field;
      }
    }
    if (unwrapped.kind == TypeKind.Extern) {
      site.slotField = `__slot_pend${site.id}`;
      this.slots.push(new SpillSlot("pend", `pend${site.id}`, site.slotField));
    }
    return site;
  }

  /** Records a nested await site for a call that starts an inner async
   *  task and returns its handle: the outer step calls it, the pending
   *  export exposes the handle, and the coordinator drives the inner
   *  task, delivering its result through this site's resume export. */
  private transformNestedAwait(call: CallExpression, innerQual: string, node: AwaitExpression, used: bool): AwaitSite | null {
    let flow = assert(this.flow);
    let operandType = this.resolver.resolveExpression(call, flow, Type.auto, ReportMode.Swallow);
    if (!operandType) {
      this.punted = true;
      return null;
    }
    let unwrapped = this.resolver.unwrapPromiseType(operandType);
    if (!unwrapped) {
      this.program.error(
        DiagnosticCode.The_operand_of_an_await_expression_must_be_a_Promise,
        call.range
      );
      this.failed = true;
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
    site.isNested = true;
    site.handleField = `__handle${site.id}`;
    site.innerQual = innerQual;
    this.sites.push(site);
    // A coordinator rejection of this site lands in the enclosing try's
    // catch when the desugar recorded one: resolve the error locals to
    // state fields now, while the scope still holds them.
    let rejectTarget = rejectTargetFor(this.file, node.range);
    if (rejectTarget) {
      let flagBinding = this.scope.lookup(rejectTarget.flagVar);
      let errBinding = this.scope.lookup(rejectTarget.errorVar);
      if (flagBinding && !flagBinding.shadowed && errBinding && !errBinding.shadowed) {
        site.rejectFlagField = flagBinding.field;
        site.rejectErrField = errBinding.field;
      }
    }
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
    let receiverClass = this.receiverClassOf(unwrapParens(access.expression), node);
    if (!receiverClass) return null;
    let method = this.lookupInstanceMethod(receiverClass, access.property.text);
    if (!method || !method.is(CommonFlags.Async) || method.declaration.kind != NodeKind.MethodDeclaration) {
      this.fail("'await' of a member call is not yet supported", node.range);
      return null;
    }
    let declaringClass = <ClassPrototype>method.parent;
    let typeParameters = declaringClass.typeParameterNodes;
    if (typeParameters && typeParameters.length > 0) {
      this.fail("'await' of a member call is not yet supported", node.range);
      return null;
    }
    if (declaringClass.parent.kind == ElementKind.Namespace) {
      this.fail("'await' of a member call is not yet supported", node.range);
      return null;
    }
    if (method.declaration.range.source != this.file.source) {
      this.fail("'await' of a member call is not yet supported", node.range);
      return null;
    }
    return this.transformNestedAwait(call, `${declaringClass.name}_${method.name}`, node, used);
  }

  /** Resolves the receiver expression to its class prototype, or `null`
   *  after failing loudly (not a class) or punting (unresolvable). A
   *  lifted local, including the `__async_this` receiver, reads its type
   *  from the state field; anything else resolves in the flow. */
  private receiverClassOf(receiver: Expression, node: AwaitExpression): ClassPrototype | null {
    if (receiver.kind == NodeKind.Identifier) {
      let name = (<IdentifierExpression>receiver).text;
      let element = assert(this.flow).lookup(name);
      if (element && element.kind == ElementKind.ClassPrototype) {
        // A static call (`await C.method(...)`): the receiver names a
        // type, not an instance, and static async methods are out of scope.
        this.fail("'await' of a member call is not yet supported", node.range);
        return null;
      }
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

  /** Validates one join member expression and returns its unwrapped type. */
  private validateJoinMember(element: Expression, policy: string): Type | null {
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
    if (arg instanceof ArrayLiteralExpression) {
      memberKind = "literal";
      let elements = arg.elementExpressions;
      memberCount = elements.length;
      for (let i = 0, k = elements.length; i < k; ++i) {
        let element = unwrapParens(elements[i]);
        let member = this.validateJoinMember(element, policy);
        if (!member) return null;
        if (!memberType) {
          memberType = member;
        } else if (member.toString() != memberType.toString()) {
          this.fail(`'Promise.${policy}' members must all have the same type`, element.range);
          return null;
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
      if (containsAwait(arg)) {
        this.fail("'await' inside a join argument is not yet supported", arg.range);
        return null;
      }
      this.checkDirectAsyncCalls(arg);
      if (this.failed) return null;
      let argType = this.resolver.resolveExpression(arg, flow, Type.auto, ReportMode.Swallow);
      if (!argType) {
        this.punted = true;
        return null;
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
      let rewritten = rewriteExpression(arg, this.rewriter());
      if (!rewritten) {
        this.failed = true;
        return null;
      }
      membersExpr = rewritten;
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
    return new PreparedJoin(site, policy, memberKind, memberCount, members, membersExpr, resultType, resultTypeNode);
  }

  /** Builds the join-import call for a site. */
  private joinCallExpr(siteId: i32, policy: string, range: Range): CallExpression {
    return callExpr(
      ident(JOIN_IMPORT_NAME, range),
      [ thisProp(joinReqsField(siteId), range), intLit(joinPolicyCode(policy), range) ],
      range
    );
  }

  /** Emits the issue + join + continuation for a prepared join. */
  private emitJoin(join: PreparedJoin, emitResult: (value: Expression) => void): JoinEmitOutcome {
    let site = join.site;
    let range = site.range;
    let policy = join.policy;
    let memberTypeNode = assert(site.memberTypeNode);
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
        this.emit(this.issueStatement(site, join.members[i]));
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
    let receiverClass = this.isMethod ? this.receiverClass : null;
    let emitEntry = false;
    let emitClassNew = false;
    if (receiverClass && findExportName(this.program, this.file, receiverClass) != null) {
      if (!this.classNews.has(receiverClass)) {
        if (this.hasNameCollision(this.classNewName(receiverClass))) return false;
        emitClassNew = true;
      }
      if (this.hasNameCollision(this.methodEntryName())) return false;
      emitEntry = true;
    }
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      if (this.sites[i].isJoin) {
        if (this.hasNameCollision(joinStoreName(this.fileBase, this.fnName, i))) return false;
        if (this.hasNameCollision(joinErrorName(this.fileBase, this.fnName, i))) return false;
        if (this.hasNameCollision(joinDoneName(this.fileBase, this.fnName, i))) return false;
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
    if (this.hasAdapters) {
      if (this.hasNameCollision(this.stateGlobalName)) return false;
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
    if (this.hasAdapters) declarations.push(this.buildStateGlobal());
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      let site = this.sites[i];
      if (site.isJoin) {
        declarations.push(buildJoinStore(this.fileBase, this.fnName, this.stateClassName, i, assert(site.memberTypeNode), this.range));
        declarations.push(buildJoinError(this.fileBase, this.fnName, this.stateClassName, i, this.range));
        declarations.push(buildJoinDone(this.fileBase, this.fnName, this.stateClassName, i, this.range));
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
    declarations.push(this.buildStatus());
    if (emitEntry) {
      let entry = this.buildMethodEntry(assert(receiverClass));
      if (entry) declarations.push(entry);
    }
    if (emitClassNew) {
      this.classNews.add(assert(receiverClass));
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
    for (let i = 0, k = this.sites.length; i < k; ++i) {
      let site = this.sites[i];
      if (site.isJoin || !site.used || site.type.kind == TypeKind.Extern) continue;
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
    if (this.hasAdapters) {
      // Adapters forward through the currently-stepping state object.
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

  private buildStateGlobal(): VariableStatement {
    let range = this.range;
    return new VariableStatement(
      null,
      [ new VariableDeclaration(
        ident(this.stateGlobalName, range), null, CommonFlags.None,
        namedType("usize", null, false, range),
        intLit(0, range),
        range
      ) ],
      range
    );
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
    let site = this.sites[siteId];
    let body = new Array<Statement>();
    if (!site.isJoin && site.rejectFlagField != "") {
      // A coordinator rejection lands in the enclosing try's catch: set
      // the error flag/message and resume the state machine at the segment
      // after the suspending call (the task is suspended at this site, so
      // `step()` dispatches there). The desugared guards skip the rest of
      // the try body and the dispatch runs catch/finally/propagation.
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
    return `__async_${this.fileBase}_${receiverClass.name}_new`;
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
    entryParams.push(new ParameterNode(
      ParameterKind.Default,
      ident(receiverName, range),
      namedType(receiverClass.name, null, false, range),
      null,
      range
    ));
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
        [ callExpr(
          new PropertyAccessExpression(ident(receiverName, range), ident(this.prototype.name, range), range),
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

  private buildClassNew(receiverClass: ClassPrototype): FunctionDeclaration | null {
    let range = this.range;
    let className = receiverClass.name;
    let parameters = new Array<ParameterNode>();
    let args = new Array<Expression>();
    let thisType = assert(this.instance).signature.thisType;
    let classInstance = thisType ? thisType.getClass() : null;
    let ctor = classInstance ? classInstance.constructorInstance : null;
    if (ctor) {
      let ctorPrototype = ctor.prototype;
      let described = describeParams(ctor.signature.parameterTypes, className);
      if (described.reason) {
        warnSkipped(this.program, this.prototype, described.reason, []);
        return null;
      }
      let ctorParams = ctorPrototype.functionTypeNode.parameters;
      for (let i = 0, k = ctorParams.length; i < k; ++i) {
        let parameter = ctorParams[i];
        let typeNode = parameter.type || typeToTypeNode(ctor.signature.parameterTypes[i], range);
        if (!typeNode) {
          warnSkipped(this.program, this.prototype, "constructor of '" + className + "' has a parameter without a usable type", []);
          return null;
        }
        parameters.push(new ParameterNode(
          ParameterKind.Default,
          ident(parameter.name.text, range),
          typeNode,
          null,
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
    body.push(new ReturnStatement(
      new CallExpression(
        ident("changetype", range),
        [ namedType("i32", null, false, range) ],
        [ new NewExpression(
          new TypeName(ident(className, range), null, range),
          null,
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
    if (this.isMethod) {
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

