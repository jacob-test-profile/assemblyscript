/**
 * @fileoverview Metadata helpers for the CPS async coordinator generator
 * (Phase 1, chunk 6): value-kind descriptions, export/import lookup, and
 * the skip-with-warning helper shared by the function/import metadata
 * builders. Pure lookups over already-registered program state.
 * @license Apache-2.0
 */

import {
  NodeKind,
  SourceKind
} from "./ast";

import {
  CommonFlags,
  CommonNames
} from "./common";

import {
  DiagnosticCode
} from "./diagnostics";

import {
  Program,
  Function,
  FunctionPrototype,
  ClassPrototype,
  Element,
  ElementKind,
  File
} from "./program";

import {
  ReportMode
} from "./resolver";

import {
  Type,
  Signature,
  TypeKind,
  TypeFlags
} from "./types";

/** A value kind the coordinator can lower/lift across the boundary. */
export interface ValueDesc {
  kind: string;
  nullable: boolean;
}

/** Metadata for a rest parameter: how the runtime builds the collected
 *  array (element kind for lowering, the Array<T> runtime id, and the
 *  element layout for the typed-array fill). */
export interface RestDesc {
  kind: string;
  nullable: boolean;
  /** Runtime id of the Array<T> class. */
  id: number;
  /** log2 element size: 0, 1, 2 or 3. */
  align: number;
  /** The element view is signed (integer elements only). */
  signed: boolean;
  /** The element view is floating-point. */
  float: boolean;
  /** Elements are managed references (pointers), not scalars. */
  managed: boolean;
}

/** Metadata for one await site, per the chunk 1 wire protocol. A join
 *  site (chunk 5) has no resume export: settlements are delivered through
 *  the join_store/join_error exports and the site resumes via join_done.
 *  A nested site (chunk 3/7) awaits another async function, in this file
 *  or another: the inner task's handle comes from the pending export, and
 *  the inner function is named by innerExportName (its file-qualified
 *  `fileBase#qualName` key when it is exported, else the generated name
 *  the inners map is keyed by). */
export interface SiteMeta {
  kind: string;
  nullable: boolean;
  join: boolean;
  nested: boolean;
  resumeExport: string | null;
  rejectExport: string;
  storeExport: string | null;
  errorExport: string | null;
  doneExport: string | null;
  /** Marks one pre-resolved member (a hoisted member await) as the
   *  winning member for race/any; `null` for non-join sites. */
  markExport: string | null;
  pendingExport: string | null;
  innerExportName: string | null;
}

/** Metadata for one exported transformed async function. A namespaced
 *  function has `exportName: null` and is driven through `entryExport`
 *  instead; `path`/`name` place it at `api.NS.take` in the generated JS
 *  (nested objects mirroring the namespace path). */
export interface FunctionMeta {
  /** Wasm export name, or `null` for a non-exported inner function and
   *  for a namespaced function (driven through `entryExport`). */
  exportName: string | null;
  fileBase: string;
  params: ValueDesc[];
  /** True when the function takes optional or rest parameters: the
   *  runtime sets `__setArgumentsLength` before the entry call so the
   *  varargs stub fills the omitted ones. */
  varargs: boolean;
  /** Rest-element description, or `null` when there is no rest param. */
  rest: RestDesc | null;
  resultKind: string;
  resultNullable: boolean;
  statusExport: string;
  resultExport: string;
  errorExport: string;
  /** `__async_<file>_<fn>_last_handle`: the last entry's handle, for the
   *  coordinator's trap reclaim when an entry's step traps. */
  lastHandleExport: string;
  /** `__async_<file>_<fn>_reclaim`: releases a trapped task's spill
   *  slots without running its state machine. */
  reclaimExport: string;
  sites: SiteMeta[];
  /** `__async_<file>_<qual>_entry`, for namespaced functions and methods. */
  entryExport?: string;
  /** Namespace path segments, for namespaced functions. */
  path?: string[];
  /** Simple function name, for namespaced functions. */
  name?: string;
}

/** Metadata for one transformed async method on an exported class. Like
 *  FunctionMeta, but the method is not a top-level api function
 *  (exportName is `null`) and is driven through its entry export instead.
 *  `params` describes only the declared params: the receiver is a raw
 *  pointer the runtime prepends, never a described value. A static
 *  method has no receiver: the runtime puts it on the wrapper
 *  constructor instead of the prototype. */
export interface MethodMeta extends FunctionMeta {
  exportName: null;
  /** AS method name, e.g. `add`: the runtime puts the Promise-returning
   *  method on the wrapper prototype under this name. It is not derived
   *  from entryExport — the fileBase in there may contain underscores. */
  name: string;
  /** Whether the method is static (driven without a receiver). */
  isStatic: boolean;
  /** `__async_<file>_<Class>_<method>_entry` (chunk A). */
  entryExport: string;
}

/** Metadata for one exported class with drivable async methods. */
export interface ClassMeta {
  name: string;
  /** `__async_<file>_<Class>_new` (chunk A). */
  newExport: string;
  newParams: ValueDesc[];
  /** True when the constructor takes optional or rest parameters. */
  newVarargs: boolean;
  /** Rest-element description for the constructor, or `null`. */
  newRest: RestDesc | null;
  methods: MethodMeta[];
}

/** Metadata for one suspending import (ambient fn returning Promise<T>). */
export interface ImportMeta {
  module: string;
  name: string;
  params: ValueDesc[];
  resultKind: string;
  resultNullable: boolean;
  /** Set when the import cannot be driven: the runtime installs a stub
   *  that rejects with this reason instead of calling the binding. */
  unsupported?: string;
  /** Set for the fixed __async_join import (chunk 5): the coordinator
   *  provides the wrapper itself, no user binding is needed. */
  joinImport?: boolean;
  /** Set for the fixed __async_wait import (chunk 7, stored-promise
   *  await): the coordinator provides the wrapper itself, no user
   *  binding is needed. */
  waitImport?: boolean;
}

/** Warns that a transformed function or import is not driven, and records
 *  the reason for the comment block in the generated file. A skip must
 *  never throw: the CLI turns a throw here into process.exit(1), which
 *  kills the test worker and aborts the whole compiler suite. */
export function warnSkipped(
  program: Program,
  prototype: FunctionPrototype,
  reason: string,
  notes: string[]
): void {
  let message = "async coordinator cannot drive '" + prototype.name + "': " + reason;
  notes.push(message);
  program.warning(
    DiagnosticCode.Not_implemented_0,
    prototype.declaration.range,
    message
  );
}

/** Sanitizes a file path for use in generated identifiers (chunk 1's rule). */
export function sanitizeName(name: string): string {
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

/** Maps a resolved type to a coordinator value kind, or `null` if unsupported. */
export function describeType(type: Type): ValueDesc | null {
  let nullable = (type.flags & TypeFlags.Nullable) != 0;
  let base = nullable ? type.nonNullableType : type;
  // Class types are Usize-based, so the String class must be recognised
  // before the integer kinds below (a string is not a u32).
  let classReference = base.getClass();
  if (classReference) {
    if (classReference.prototype.name == CommonNames.String) {
      return { kind: "string", nullable };
    }
    return null;
  }
  switch (base.kind) {
    case TypeKind.Bool: return { kind: "bool", nullable };
    case TypeKind.I8:
    case TypeKind.I16:
    case TypeKind.I32:
    case TypeKind.Isize: return { kind: "i32", nullable };
    case TypeKind.U8:
    case TypeKind.U16:
    case TypeKind.U32:
    case TypeKind.Usize: return { kind: "u32", nullable };
    case TypeKind.I64: return { kind: "i64", nullable };
    case TypeKind.U64: return { kind: "u64", nullable };
    case TypeKind.F32: return { kind: "f32", nullable };
    case TypeKind.F64: return { kind: "f64", nullable };
    case TypeKind.String: return { kind: "string", nullable };
    case TypeKind.Extern: return { kind: "externref", nullable };
    case TypeKind.Void: return { kind: "void", nullable };
    default: break;
  }
  return null;
}

/** Describes a wasm-pointer value (an array or a non-string class) for
 *  nested delivery only: the value is a heap pointer produced wasm-side
 *  by an inner task, so the coordinator hands it from the inner result
 *  to the outer resume untouched. It must never describe a value lowered
 *  from JS — a JS array or object is not a wasm pointer — so callers gate
 *  it on the nested (pending) path. */
export function describePointerType(type: Type): ValueDesc | null {
  let nullable = (type.flags & TypeFlags.Nullable) != 0;
  let base = nullable ? type.nonNullableType : type;
  let classReference = base.getClass();
  if (!classReference) return null;
  if (classReference.prototype.name == CommonNames.String) return null;
  return { kind: "pointer", nullable };
}

/** Describes every parameter type, or `null` with the reason when one is unsupported. */
export function describeParams(types: Type[], owner: string): { params: ValueDesc[], reason: string | null } {
  let out: ValueDesc[] = [];
  for (let i = 0, k = types.length; i < k; ++i) {
    let desc = describeType(types[i]);
    if (!desc) {
      return {
        params: out,
        reason: "unsupported parameter type '" + types[i].toString() + "' in '" + owner + "'"
      };
    }
    out.push(desc);
  }
  return { params: out, reason: null };
}

/** Namespace path of an element, outermost first: `["Outer", "Inner"]`
 *  for a member of `Outer.Inner`, `[]` for a top-level element. */
export function namespacePathOf(element: Element): string[] {
  let path = new Array<string>();
  let current: Element | null = element.parent;
  while (current && current.kind == ElementKind.Namespace) {
    path.unshift(current.name);
    current = current.parent;
  }
  return path;
}

/** Whether a method prototype is a static method (a MethodDeclaration
 *  without the Instance flag; statics live in the class's own members). */
export function isStaticMethod(prototype: FunctionPrototype): bool {
  return prototype.declaration.kind == NodeKind.MethodDeclaration
    && !prototype.is(CommonFlags.Instance);
}

/** Finds the class prototype a method prototype belongs to: the bound
 *  class for an instance method, the parent class prototype for a static
 *  method (statics are never bound: toBound asserts Instance). Returns
 *  `null` for a plain function. */
export function methodClassOf(prototype: FunctionPrototype): ClassPrototype | null {
  let bound = prototype.getBoundClassOrInterface();
  if (bound) return bound.prototype;
  if (
    prototype.declaration.kind == NodeKind.MethodDeclaration &&
    prototype.parent.kind == ElementKind.ClassPrototype
  ) return <ClassPrototype>prototype.parent;
  return null;
}

/** Describes one rest element type, or `null` when the runtime cannot
 *  build the collected array for it. Rest elements are written through
 *  a DataView fill, so externref elements are unsupported (they cannot
 *  be written that way) and class/array elements are unsupported (no
 *  lowering); the precise integer width is kept, since `describeType`
 *  collapses i8/i16/i32 and the fill needs the real element size. */
function describeRestElement(element: Type): RestDesc | null {
  let nullable = (element.flags & TypeFlags.Nullable) != 0;
  let base = nullable ? element.nonNullableType : element;
  let classReference = base.getClass();
  if (classReference) {
    if (classReference.prototype.name == CommonNames.String) {
      return { kind: "string", nullable, id: 0, align: 2, signed: false, float: false, managed: true };
    }
    return null;
  }
  switch (base.kind) {
    case TypeKind.Bool: return { kind: "bool", nullable, id: 0, align: 0, signed: false, float: false, managed: false };
    case TypeKind.I8: return { kind: "i32", nullable, id: 0, align: 0, signed: true, float: false, managed: false };
    case TypeKind.I16: return { kind: "i32", nullable, id: 0, align: 1, signed: true, float: false, managed: false };
    case TypeKind.I32:
    case TypeKind.Isize: return { kind: "i32", nullable, id: 0, align: 2, signed: true, float: false, managed: false };
    case TypeKind.U8: return { kind: "u32", nullable, id: 0, align: 0, signed: false, float: false, managed: false };
    case TypeKind.U16: return { kind: "u32", nullable, id: 0, align: 1, signed: false, float: false, managed: false };
    case TypeKind.U32:
    case TypeKind.Usize: return { kind: "u32", nullable, id: 0, align: 2, signed: false, float: false, managed: false };
    case TypeKind.I64: return { kind: "i64", nullable, id: 0, align: 3, signed: true, float: false, managed: false };
    case TypeKind.U64: return { kind: "u64", nullable, id: 0, align: 3, signed: false, float: false, managed: false };
    case TypeKind.F32: return { kind: "f32", nullable, id: 0, align: 2, signed: true, float: true, managed: false };
    case TypeKind.F64: return { kind: "f64", nullable, id: 0, align: 3, signed: true, float: true, managed: false };
    case TypeKind.String: return { kind: "string", nullable, id: 0, align: 2, signed: false, float: false, managed: true };
    default: return null;
  }
}

/** Splits a signature's parameter types into the fixed params and the
 *  rest element description, or a reason when a type is unsupported.
 *  `varargs` is true when the function takes optional or rest
 *  parameters (the compiler's own stub condition): the runtime must set
 *  `__setArgumentsLength` before the entry call. */
export function describeParamsAndRest(
  signature: Signature,
  owner: string
): { params: ValueDesc[], rest: RestDesc | null, varargs: boolean, reason: string | null } {
  let types = signature.parameterTypes;
  let fixed = signature.hasRest ? types.slice(0, types.length - 1) : types;
  let params = describeParams(fixed, owner);
  if (params.reason) {
    return { params: params.params, rest: null, varargs: false, reason: params.reason };
  }
  let rest: RestDesc | null = null;
  if (signature.hasRest) {
    let restType = types[types.length - 1];
    let base = (restType.flags & TypeFlags.Nullable) != 0 ? restType.nonNullableType : restType;
    let restClass = base.getClass();
    if (!restClass || !restClass.typeArguments || restClass.typeArguments.length == 0) {
      return {
        params: params.params,
        rest: null,
        varargs: false,
        reason: "unsupported rest parameter type '" + restType.toString() + "' in '" + owner + "'"
      };
    }
    let element = restClass.typeArguments[0];
    let desc = describeRestElement(element);
    if (!desc) {
      return {
        params: params.params,
        rest: null,
        varargs: false,
        reason: "unsupported rest element type '" + element.toString() + "' in '" + owner + "'"
      };
    }
    desc.id = restClass.id;
    rest = desc;
  }
  return {
    params: params.params,
    rest,
    varargs: signature.requiredParameters < types.length,
    reason: null
  };
}

/** Qualified name used for all generated names: `Class_method` for a bound
 *  method prototype (the transform binds methods to the resolved class, so
 *  the parent chain carries the class), `NS_take` for a function in a
 *  namespace (the path disambiguates same-named functions in different
 *  namespaces), the plain name otherwise. */
export function qualNameOf(prototype: FunctionPrototype): string {
  let cls = methodClassOf(prototype);
  if (cls) return cls.name + "_" + prototype.name;
  let path = namespacePathOf(prototype);
  if (path.length > 0) return path.join("_") + "_" + prototype.name;
  return prototype.name;
}

/** Finds the file owning an element, walking up through namespaces. */
export function owningFile(element: Element): File | null {
  let current: Element | null = element;
  while (current) {
    if (current.kind == ElementKind.File) return <File>current;
    current = current.parent;
  }
  return null;
}

/** Finds the wasm export name of an element, or `null` if not exported.
 *  Only UserEntry exports become WebAssembly exports: an element exported
 *  from a non-entry file (a helper imported by the entry) is not one, so
 *  only entry files count here. */
export function findExportName(program: Program, file: File, element: Element): string | null {
  if (file.source.sourceKind == SourceKind.UserEntry) {
    let exports = file.exports;
    if (exports) {
      for (let name of exports.keys()) {
        if (exports.get(name) === element) return name;
      }
    }
  }
  for (let other of program.filesByName.values()) {
    if (other.source.sourceKind != SourceKind.UserEntry) continue;
    let otherExports = other.exports;
    if (!otherExports) continue;
    for (let name of otherExports.keys()) {
      if (otherExports.get(name) === element) return name;
    }
  }
  return null;
}

/** Collects ambient functions returning Promise<T> from user files. */
export function collectSuspendingImports(program: Program, out: FunctionPrototype[]): void {
  for (let file of program.filesByName.values()) {
    if (
      file.source.sourceKind != SourceKind.User &&
      file.source.sourceKind != SourceKind.UserEntry
    ) continue;
    collectFromElement(program, file, out);
  }
}

function collectFromElement(program: Program, element: Element, out: FunctionPrototype[]): void {
  let members = element.members;
  if (!members) return;
  for (let member of members.values()) {
    if (member.kind == ElementKind.FunctionPrototype && member.is(CommonFlags.Ambient)) {
      let prototype = <FunctionPrototype>member;
      if (prototype.typeParameterNodes && prototype.typeParameterNodes.length > 0) {
        // Generic: there is no default instance (resolving with null
        // type arguments asserts), so look at the resolved
        // instantiations instead.
        let instances = prototype.instances;
        if (instances) {
          for (let _values = Map_values(instances), i = 0, k = _values.length; i < k; ++i) {
            if (program.resolver.unwrapPromiseType(_values[i].signature.returnType)) {
              out.push(prototype);
              break;
            }
          }
        }
      } else {
        let instance = program.resolver.resolveFunction(prototype, null, new Map(), ReportMode.Swallow);
        if (instance && program.resolver.unwrapPromiseType(instance.signature.returnType)) {
          out.push(prototype);
        }
      }
    } else if (member.kind == ElementKind.Namespace) {
      collectFromElement(program, member, out);
    }
  }
}

/** Looks up the wasm import module/name of an ambient function. For a
 *  generic import the module holds only the last-registered instance
 *  (one import per (module, name), several internal functions), so an
 *  element matches when it is the prototype, the passed instance, or any
 *  other instance of the prototype. */
export function findImportName(
  program: Program,
  prototype: FunctionPrototype,
  instance: Element
): { module: string, name: string } | null {
  for (let entry of program.moduleImports) {
    let moduleName = entry[0];
    let map = entry[1];
    for (let nameEntry of map) {
      let elementName = nameEntry[0];
      let element = nameEntry[1];
      if (element === prototype || element === instance) {
        return { module: moduleName, name: elementName };
      }
      if (element.kind == ElementKind.Function && (<Function>element).prototype === prototype) {
        return { module: moduleName, name: elementName };
      }
    }
  }
  return null;
}

