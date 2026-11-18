/**
 * @fileoverview Metadata helpers for the CPS async coordinator generator
 * (Phase 1, chunk 6): value-kind descriptions, export/import lookup, and
 * the skip-with-warning helper shared by the function/import metadata
 * builders. Pure lookups over already-registered program state.
 * @license Apache-2.0
 */

import {
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

/** A value kind the coordinator can lower/lift across the boundary. */
export interface ValueDesc {
  kind: string;
  nullable: boolean;
}

/** Metadata for one await site, per the chunk 1 wire protocol. A join
 *  site (chunk 5) has no resume export: settlements are delivered through
 *  the join_store/join_error exports and the site resumes via join_done. */
export interface SiteMeta {
  kind: string;
  nullable: boolean;
  join: boolean;
  resumeExport: string | null;
  rejectExport: string;
  storeExport: string | null;
  errorExport: string | null;
  doneExport: string | null;
}

/** Metadata for one exported transformed async function. */
export interface FunctionMeta {
  exportName: string;
  fileBase: string;
  params: ValueDesc[];
  resultKind: string;
  resultNullable: boolean;
  statusExport: string;
  resultExport: string;
  errorExport: string;
  sites: SiteMeta[];
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

