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
 *  silently unless `forInner` is set: an inner function needs no export
 *  (the coordinator never calls its entry, it only drives the handle the
 *  outer task already started), so its exportName is `null` and the
 *  caller keys it by file + qualified name instead. */
function buildFunctionMeta(
  program: Program,
  prototype: FunctionPrototype,
  notes: string[],
  forInner: boolean
): FunctionMeta | null {
  let file = owningFile(prototype);
  if (!file) {
    warnSkipped(program, prototype, "it has no owning file", notes);
    return null;
  }
  let exportName: string | null = null;
  if (!forInner) {
    let found = findExportName(program, file, prototype);
    if (!found) return null;
    exportName = found;
  }
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
        nested: false,
        resumeExport: null,
        rejectExport: "__async_" + fileBase + "_" + fn + "_reject_" + n.toString(),
        storeExport: storeName,
        errorExport: "__async_" + fileBase + "_" + fn + "_join_error_" + n.toString(),
        doneExport: doneName,
        pendingExport: null,
        innerExportName: null
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
    let pendingName = "__async_" + fileBase + "_" + fn + "_pending_" + n.toString();
    let pendingMember = prototype.parent.getMember(pendingName);
    if (pendingMember && pendingMember.kind != ElementKind.FunctionPrototype) pendingMember = null;
    let innerExportName: string | null = null;
    if (pendingMember) {
      innerExportName = program.asyncNestedPending.get(pendingName) || null;
      if (!innerExportName) {
        warnSkipped(program, prototype, "nested await site " + n.toString() + " has no recorded inner function", notes);
        return null;
      }
    }
    sites.push({
      kind: site.kind,
      nullable: site.nullable,
      join: false,
      nested: !!pendingMember,
      resumeExport: resumeName,
      rejectExport: "__async_" + fileBase + "_" + fn + "_reject_" + n.toString(),
      storeExport: null,
      errorExport: null,
      doneExport: null,
      pendingExport: pendingMember ? pendingName : null,
      innerExportName
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

/** Builds metadata for a nested inner function by qualified name, or
 *  `null` when it cannot be found or driven. The inner lives in the
 *  same file as the outer function and needs no export. */
function buildInnerMeta(
  program: Program,
  outer: FunctionPrototype,
  innerQual: string,
  notes: string[]
): FunctionMeta | null {
  let file = owningFile(outer);
  if (!file) return null;
  for (let prototype of program.transformedAsyncFunctions) {
    if (prototype.name != innerQual) continue;
    if (owningFile(prototype) != file) continue;
    return buildFunctionMeta(program, prototype, notes, true);
  }
  return null;
}

/** Resolves the metadata for every nested inner function the exported
 *  functions await, keyed by file + qualified name. A function whose
 *  inner cannot be found or driven is dropped (with a warning) —
 *  driving it would deliver the inner import's raw value as the inner
 *  result. A longer chain (A awaits B, B's own inner undrivable) is
 *  not dropped here; it fails loudly at runtime in driveNested when
 *  the inner task suspends at the broken site. */
function resolveNestedInners(
  program: Program,
  entries: Array<{ prototype: FunctionPrototype, meta: FunctionMeta }>,
  notes: string[]
): { [key: string]: FunctionMeta } {
  let inners: { [key: string]: FunctionMeta } = {};
  for (let i = entries.length - 1; i >= 0; --i) {
    let entry = entries[i];
    let sites = entry.meta.sites;
    let dropped = false;
    for (let j = 0, l = sites.length; j < l; ++j) {
      let site = sites[j];
      if (!site.nested || !site.innerExportName) continue;
      let key = entry.meta.fileBase + "\0" + site.innerExportName;
      if (inners[key]) continue;
      let innerMeta = buildInnerMeta(program, entry.prototype, site.innerExportName, notes);
      if (innerMeta) {
        inners[key] = innerMeta;
        continue;
      }
      warnSkipped(program, entry.prototype, "its nested await of '" + site.innerExportName + "' cannot be driven", notes);
      entries.splice(i, 1);
      dropped = true;
      break;
    }
    if (dropped) continue;
  }
  return inners;
}

/**
 * Builds the generated JS coordinator for the program, or `null` when it
 * has no exported transformed async function. Call after compilation.
 */
export function buildAsyncCoordinator(program: Program): string | null {
  if (program.transformedAsyncFunctions.size == 0) return null;
  let notes: string[] = [];
  let entries: Array<{ prototype: FunctionPrototype, meta: FunctionMeta }> = [];
  for (let prototype of program.transformedAsyncFunctions) {
    let meta = buildFunctionMeta(program, prototype, notes, false);
    if (meta) entries.push({ prototype, meta });
  }
  if (entries.length == 0) return null;
  let inners = resolveNestedInners(program, entries, notes);
  let functions: FunctionMeta[] = [];
  for (let i = 0, k = entries.length; i < k; ++i) functions.push(entries[i].meta);
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
  let metadata = { functions, inners, imports };
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
  let envImports = program.moduleImports.get("env");
  if (envImports && envImports.has("__async_wait")) {
    imports.push({
      module: "env",
      name: "__async_wait",
      params: [],
      resultKind: "i32",
      resultNullable: false,
      waitImport: true
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
