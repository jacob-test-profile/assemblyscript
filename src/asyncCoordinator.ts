/**
 * @fileoverview Builds the generated JS coordinator for CPS async
 * functions (Phase 1, chunk 6).
 *
 * `buildAsyncCoordinator(program)` returns the source of a self-contained
 * `<base>.async.js` module, or `null` when the program has no exported
 * transformed async function. It must be called after compilation, when
 * the transform has run and imports are registered in
 * `program.moduleImports`. It reads only already-registered program
 * state — no changes to the transform are needed to feed it.
 * @license Apache-2.0
 */

import {
  Program,
  FunctionPrototype,
  ElementKind
} from "./program";

import {
  ReportMode
} from "./resolver";

import {
  ASYNC_COORDINATOR_RUNTIME
} from "./asyncCoordinatorRuntime";

import {
  ASYNC_COORDINATOR_JOIN_SOURCE
} from "./asyncCoordinatorJoin";

import {
  SiteMeta,
  FunctionMeta,
  ImportMeta,
  warnSkipped,
  sanitizeName,
  describeType,
  describeParams,
  owningFile,
  findExportName,
  collectSuspendingImports,
  findImportName
} from "./asyncCoordinatorMeta";

/** Builds metadata for one transformed async function, or `null` (with a
 *  warning) when it cannot be driven. Non-exported functions are skipped
 *  silently: they cannot be called from JS. */
function buildFunctionMeta(
  program: Program,
  prototype: FunctionPrototype,
  notes: string[]
): FunctionMeta | null {
  let file = owningFile(prototype);
  if (!file) {
    warnSkipped(program, prototype, "it has no owning file", notes);
    return null;
  }
  let exportName = findExportName(program, file, prototype);
  if (!exportName) return null;
  let instance = program.resolver.resolveFunction(prototype, null, new Map(), ReportMode.Swallow);
  if (!instance) {
    warnSkipped(program, prototype, "it cannot be resolved", notes);
    return null;
  }
  let signature = instance.signature;
  let unwrapped = program.resolver.unwrapPromiseType(signature.returnType);
  if (!unwrapped) {
    warnSkipped(program, prototype, "it does not return a Promise", notes);
    return null;
  }
  let result = describeType(unwrapped);
  if (!result) {
    warnSkipped(program, prototype, "unsupported return type '" + unwrapped.toString() + "'", notes);
    return null;
  }
  let params = describeParams(signature.parameterTypes, prototype.name);
  if (params.reason) {
    warnSkipped(program, prototype, params.reason, notes);
    return null;
  }
  let fileBase = sanitizeName(file.source.simplePath);
  let fn = prototype.name;
  let sites: SiteMeta[] = [];
  for (let n = 0; ; ++n) {
    let resumeName = "__async_" + fileBase + "_" + fn + "_resume_" + n.toString();
    let doneName = "__async_" + fileBase + "_" + fn + "_join_done_" + n.toString();
    let resumeMember = prototype.parent.getMember(resumeName);
    if (resumeMember && resumeMember.kind != ElementKind.FunctionPrototype) resumeMember = null;
    let doneMember = prototype.parent.getMember(doneName);
    if (doneMember && doneMember.kind != ElementKind.FunctionPrototype) doneMember = null;
    if (!resumeMember && !doneMember) break;
    if (resumeMember && doneMember) {
      warnSkipped(program, prototype, "await site " + n.toString() + " has both a resume and a join export", notes);
      return null;
    }
    if (doneMember) {
      let storeName = "__async_" + fileBase + "_" + fn + "_join_store_" + n.toString();
      let storeMember = prototype.parent.getMember(storeName);
      if (!storeMember || storeMember.kind != ElementKind.FunctionPrototype) {
        warnSkipped(program, prototype, "join site " + n.toString() + " has no join_store export", notes);
        return null;
      }
      let storeInstance = program.resolver.resolveFunction(
        <FunctionPrototype>storeMember, null, new Map(), ReportMode.Swallow
      );
      if (!storeInstance) {
        warnSkipped(program, prototype, "join site " + n.toString() + " cannot be resolved", notes);
        return null;
      }
      let storeTypes = storeInstance.signature.parameterTypes;
      if (storeTypes.length < 3) {
        warnSkipped(program, prototype, "join site " + n.toString() + " has no value parameter", notes);
        return null;
      }
      let member = describeType(storeTypes[2]);
      if (!member) {
        warnSkipped(
          program, prototype,
          "unsupported join member type '" + storeTypes[2].toString() + "'",
          notes
        );
        return null;
      }
      sites.push({
        kind: member.kind,
        nullable: member.nullable,
        join: true,
        resumeExport: null,
        rejectExport: "__async_" + fileBase + "_" + fn + "_reject_" + n.toString(),
        storeExport: storeName,
        errorExport: "__async_" + fileBase + "_" + fn + "_join_error_" + n.toString(),
        doneExport: doneName
      });
      continue;
    }
    let resumeInstance = program.resolver.resolveFunction(
      <FunctionPrototype>resumeMember, null, new Map(), ReportMode.Swallow
    );
    if (!resumeInstance) {
      warnSkipped(program, prototype, "its resume export '" + resumeName + "' cannot be resolved", notes);
      return null;
    }
    let valueTypes = resumeInstance.signature.parameterTypes;
    if (valueTypes.length < 2) {
      warnSkipped(program, prototype, "its resume export '" + resumeName + "' has no value parameter", notes);
      return null;
    }
    let site = describeType(valueTypes[1]);
    if (!site) {
      warnSkipped(
        program, prototype,
        "unsupported awaited type '" + valueTypes[1].toString() + "'",
        notes
      );
      return null;
    }
    sites.push({
      kind: site.kind,
      nullable: site.nullable,
      join: false,
      resumeExport: resumeName,
      rejectExport: "__async_" + fileBase + "_" + fn + "_reject_" + n.toString(),
      storeExport: null,
      errorExport: null,
      doneExport: null
    });
  }
  return {
    exportName,
    fileBase,
    params: params.params,
    resultKind: result.kind,
    resultNullable: result.nullable,
    statusExport: "__async_" + fileBase + "_" + fn + "_status",
    resultExport: "__async_" + fileBase + "_" + fn + "_result",
    errorExport: "__async_" + fileBase + "_" + fn + "_error",
    sites
  };
}

/** Builds metadata for one suspending import. An import with an
 *  unsupported type still gets an entry: the runtime installs a stub that
 *  rejects with the reason instead of calling the binding. Returns `null`
 *  (with a warning) only when the import cannot be located at all. */
function buildImportMeta(
  program: Program,
  prototype: FunctionPrototype,
  notes: string[]
): ImportMeta | null {
  let instance = program.resolver.resolveFunction(prototype, null, new Map(), ReportMode.Swallow);
  if (!instance) {
    warnSkipped(program, prototype, "suspending import cannot be resolved", notes);
    return null;
  }
  let found = findImportName(program, prototype, instance);
  if (!found) {
    warnSkipped(program, prototype, "suspending import was not registered as a module import", notes);
    return null;
  }
  let unwrapped = program.resolver.unwrapPromiseType(instance.signature.returnType);
  if (!unwrapped) {
    warnSkipped(program, prototype, "suspending import does not return a Promise", notes);
    return null;
  }
  let result = describeType(unwrapped);
  if (!result) {
    let reason = "unsupported return type '" + unwrapped.toString() + "'";
    warnSkipped(program, prototype, reason, notes);
    return {
      module: found.module,
      name: found.name,
      params: [],
      resultKind: "void",
      resultNullable: false,
      unsupported: "async coordinator cannot drive suspending import '" + prototype.name +
        "': " + reason
    };
  }
  let params = describeParams(instance.signature.parameterTypes, prototype.name);
  if (params.reason) {
    warnSkipped(program, prototype, params.reason, notes);
    return {
      module: found.module,
      name: found.name,
      params: [],
      resultKind: result.kind,
      resultNullable: result.nullable,
      unsupported: "async coordinator cannot drive suspending import '" + prototype.name +
        "': " + params.reason
    };
  }
  return {
    module: found.module,
    name: found.name,
    params: params.params,
    resultKind: result.kind,
    resultNullable: result.nullable
  };
}

/**
 * Builds the generated JS coordinator for the program, or `null` when it
 * has no exported transformed async function. Call after compilation.
 */
export function buildAsyncCoordinator(program: Program): string | null {
  if (program.transformedAsyncFunctions.size == 0) return null;
  let notes: string[] = [];
  let functions: FunctionMeta[] = [];
  for (let prototype of program.transformedAsyncFunctions) {
    let meta = buildFunctionMeta(program, prototype, notes);
    if (meta) functions.push(meta);
  }
  if (functions.length == 0) return null;
  let imports: ImportMeta[] = [];
  let seen = new Set<string>();
  let prototypes: FunctionPrototype[] = [];
  collectSuspendingImports(program, prototypes);
  for (let i = 0, k = prototypes.length; i < k; ++i) {
    let meta = buildImportMeta(program, prototypes[i], notes);
    if (!meta) continue;
    let key = meta.module + "\0" + meta.name;
    if (seen.has(key)) continue;
    seen.add(key);
    imports.push(meta);
  }
  let metadata = { functions, imports };
  let hasJoin = false;
  for (let i = 0, k = functions.length; i < k; ++i) {
    let sites = functions[i].sites;
    for (let j = 0, l = sites.length; j < l; ++j) {
      if (sites[j].join) hasJoin = true;
    }
  }
  if (hasJoin) {
    imports.push({
      module: "env",
      name: "__async_join",
      params: [],
      resultKind: "i32",
      resultNullable: false,
      joinImport: true
    });
  }
  let out = ASYNC_COORDINATOR_JOIN_SOURCE + ASYNC_COORDINATOR_RUNTIME + "\nconst __ASYNC_METADATA__ = " + JSON.stringify(metadata) + ";\n";
  if (notes.length > 0) {
    out += "// Note: the coordinator does not drive every async function in this module:\n";
    for (let i = 0, k = notes.length; i < k; ++i) {
      out += "// - " + notes[i] + "\n";
    }
  }
  return out;
}
