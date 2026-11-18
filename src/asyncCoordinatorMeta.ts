/**
 * @fileoverview Metadata helpers for the CPS async coordinator generator
 * (Phase 1, chunk 6): value-kind descriptions, export/import lookup, and
 * the skip-with-warning helper shared by the function/import metadata
 * builders. Pure lookups over already-registered program state.
 * @license Apache-2.0
 */

import {
  Source,
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
  FunctionPrototype,
  Class,
  PropertyPrototype,
  Element,
  ElementKind,
  File
} from "./program";

import {
  ReportMode
} from "./resolver";

import {
  Type,
  TypeKind,
  TypeFlags
} from "./types";

/** A value kind the coordinator can lower/lift across the boundary.
 *  Array and class descs carry what the runtime needs to build them:
 *  an array carries its class id, element alignment and element desc;
 *  a class carries its record shape (runtime id, byte size, fields). */
export interface ValueDesc {
  kind: string;
  nullable: boolean;
  elem?: ValueDesc;
  id?: i32;
  align?: i32;
  shape?: ClassShape;
}

/** The record shape of a plain class: what `__new` and the field
 *  offsets need. Mirrors the stock bindings generator's `__lowerRecord`
 *  (`src/bindings/js.ts`): only plain objects lower this way. */
export interface ClassShape {
  id: i32;
  size: i32;
  fields: Array<{ name: string, offset: i32, desc: ValueDesc }>;
}

/** Metadata for one await site, per the chunk 1 wire protocol. A join
 *  site (chunk 5) has no resume export: settlements are delivered through
 *  the join_store/join_error exports and the site resumes via join_done.
 *  A nested site (chunk 3/7) awaits another async function in the same
 *  file: the inner task's handle comes from the pending export, and the
 *  inner function is named by innerExportName (its export name when it
 *  is exported, else the generated name the inners map is keyed by).
 *  `desc` is the full value description: array and class await values
 *  carry their element/field descs, so the runtime can lower them. */
export interface SiteMeta {
  desc: ValueDesc;
  join: boolean;
  nested: boolean;
  resumeExport: string | null;
  rejectExport: string;
  storeExport: string | null;
  errorExport: string | null;
  doneExport: string | null;
  pendingExport: string | null;
  innerExportName: string | null;
}

/** Metadata for one exported transformed async function. */
export interface FunctionMeta {
  /** Wasm export name, or `null` for a non-exported inner function. */
  exportName: string | null;
  fileBase: string;
  params: ValueDesc[];
  result: ValueDesc;
  statusExport: string;
  resultExport: string;
  errorExport: string;
  sites: SiteMeta[];
}

/** Metadata for one transformed async method on an exported class. Like
 *  FunctionMeta, but the method is not a top-level api function
 *  (exportName is `null`) and is driven through its entry export instead.
 *  `params` describes only the declared params: the receiver is a raw
 *  pointer the runtime prepends, never a described value. */
export interface MethodMeta extends FunctionMeta {
  exportName: null;
  /** AS method name, e.g. `add`: the runtime puts the Promise-returning
   *  method on the wrapper prototype under this name. It is not derived
   *  from entryExport — the fileBase in there may contain underscores. */
  name: string;
  /** `__async_<file>_<Class>_<method>_entry` (chunk A). */
  entryExport: string;
}

/** Metadata for one exported class with drivable async methods. */
export interface ClassMeta {
  name: string;
  /** `__async_<file>_<Class>_new` (chunk A). */
  newExport: string;
  newParams: ValueDesc[];
  methods: MethodMeta[];
}

/** Metadata for one suspending import (ambient fn returning Promise<T>). */
export interface ImportMeta {
  module: string;
  name: string;
  params: ValueDesc[];
  result: ValueDesc;
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

/** Maps a resolved type to a coordinator value description, or `null`
 *  if it cannot be lowered/lifted. Arrays and plain classes are
 *  described recursively, mirroring the stock bindings generator's
 *  layouts (`src/bindings/js.ts`): an array carries its class id,
 *  element alignment and element desc; a plain class carries its record
 *  shape. `seen` guards the recursion: a class whose shape references
 *  itself cannot be described as finite JSON, so it is refused.
 *  Externref inside an array or a class field is refused too: an
 *  externref stored in memory is a table index, not the JS object, so
 *  the runtime could not lift it back. */
export function describeType(program: Program, type: Type, seen: Set<i32> = new Set<i32>()): ValueDesc | null {
  let nullable = (type.flags & TypeFlags.Nullable) != 0;
  let base = nullable ? type.nonNullableType : type;
  // Class types are Usize-based, so the String class must be recognised
  // before the integer kinds below (a string is not a u32).
  let classReference = base.getClass();
  if (classReference) {
    if (classReference.prototype.name == CommonNames.String) {
      return { kind: "string", nullable };
    }
    if (classReference.extendsPrototype(program.arrayPrototype)) {
      return describeArray(program, classReference, "array", nullable, seen);
    }
    if (classReference.extendsPrototype(program.staticArrayPrototype)) {
      return describeArray(program, classReference, "staticarray", nullable, seen);
    }
    if (
      classReference.extendsPrototype(program.arrayBufferInstance.prototype) ||
      classReference.extendsPrototype(program.arrayBufferViewInstance.prototype)
    ) {
      return null;
    }
    return describeClass(program, classReference, nullable, seen);
  }
  switch (base.kind) {
    case TypeKind.Bool: return { kind: "bool", nullable };
    case TypeKind.I8: return { kind: "i8", nullable };
    case TypeKind.I16: return { kind: "i16", nullable };
    case TypeKind.I32:
    case TypeKind.Isize: return { kind: "i32", nullable };
    case TypeKind.U8: return { kind: "u8", nullable };
    case TypeKind.U16: return { kind: "u16", nullable };
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

/** Describes an Array<T> or StaticArray<T>: the element desc decides
 *  the element width, so i8 elements lower as bytes, not words. */
function describeArray(
  program: Program,
  classReference: Class,
  kind: string,
  nullable: boolean,
  seen: Set<i32>
): ValueDesc | null {
  let elemType = classReference.getArrayValueType();
  let elem = describeType(program, elemType, seen);
  if (!elem) return null;
  if (elem.kind == "externref") return null;
  return {
    kind,
    nullable,
    id: classReference.id,
    align: elemType.alignLog2,
    elem
  };
}

/** Describes a plain class as a record shape, or `null` when it is not
 *  plain, when its shape is recursive, or when a field cannot be
 *  described. Only `isField` properties carry data; methods and
 *  accessors are not stored. */
function describeClass(
  program: Program,
  classReference: Class,
  nullable: boolean,
  seen: Set<i32>
): ValueDesc | null {
  if (!isPlainClass(classReference)) return null;
  let id = classReference.id;
  if (seen.has(id)) return null;
  seen.add(id);
  let fields: Array<{ name: string, offset: i32, desc: ValueDesc }> = [];
  let members = classReference.members;
  if (members) {
    for (let name of members.keys()) {
      let member = members.get(name)!;
      if (member.kind != ElementKind.PropertyPrototype) continue;
      let property = (<PropertyPrototype>member).instance;
      if (!property || !property.isField) continue;
      if (property.memoryOffset < 0) {
        seen.delete(id);
        return null;
      }
      let desc = describeType(program, property.type, seen);
      if (!desc || desc.kind == "externref") {
        seen.delete(id);
        return null;
      }
      fields.push({ name, offset: property.memoryOffset, desc });
    }
  }
  seen.delete(id);
  return {
    kind: "class",
    nullable,
    shape: {
      id,
      size: classReference.nextMemoryOffset,
      fields
    }
  };
}

/** The stock bindings generator's plain-object rule
 *  (`src/bindings/js.ts`, `isPlainObject`): a class whose data is
 *  exactly its declared fields — no non-Object base, no explicit
 *  constructor, no private or protected members. Anything else keeps
 *  its state somewhere the coordinator cannot rebuild from a JS object,
 *  so it stays skipped with a warning. */
function isPlainClass(clazz: Class): bool {
  if (clazz.base && !clazz.prototype.implicitlyExtendsObject) return false;
  let members = clazz.members;
  if (members) {
    for (let member of members.values()) {
      if (member.isAny(CommonFlags.Private | CommonFlags.Protected)) return false;
      if (member.is(CommonFlags.Constructor)) {
        if (member.declaration.range != Source.native.range) return false;
      }
    }
  }
  return true;
}

/** Describes every parameter type, or `null` with the reason when one is unsupported. */
export function describeParams(program: Program, types: Type[], owner: string): { params: ValueDesc[], reason: string | null } {
  let out: ValueDesc[] = [];
  for (let i = 0, k = types.length; i < k; ++i) {
    let desc = describeType(program, types[i]);
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

/** Qualified name used for all generated names: `Class_method` for a bound
 *  method prototype (the transform binds methods to the resolved class, so
 *  the parent chain carries the class), the plain name otherwise. */
export function qualNameOf(prototype: FunctionPrototype): string {
  let bound = prototype.getBoundClassOrInterface();
  if (bound) return bound.prototype.name + "_" + prototype.name;
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

/** Finds the wasm export name of an element, or `null` if not exported. */
export function findExportName(program: Program, file: File, element: Element): string | null {
  let exports = file.exports;
  if (exports) {
    for (let name of exports.keys()) {
      if (exports.get(name) === element) return name;
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
      let instance = program.resolver.resolveFunction(prototype, null, new Map(), ReportMode.Swallow);
      if (instance && program.resolver.unwrapPromiseType(instance.signature.returnType)) {
        out.push(prototype);
      }
    } else if (member.kind == ElementKind.Namespace) {
      collectFromElement(program, member, out);
    }
  }
}

/** Looks up the wasm import module/name of an ambient function. */
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
    }
  }
  return null;
}

