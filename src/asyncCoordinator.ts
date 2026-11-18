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
  ClassPrototype,
  Element,
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
  MethodMeta,
  ClassMeta,
  ImportMeta,
  ValueDesc,
  warnSkipped,
  sanitizeName,
  describeType,
  describeParams,
  owningFile,
  findExportName,
  collectSuspendingImports,
  findImportName,
  qualNameOf
} from "./asyncCoordinatorMeta";

/** Builds metadata for one transformed async function, or `null` (with a
 *  warning) when it cannot be driven. Non-exported functions are skipped
 *  silently unless `forInner` is set: an inner function needs no export
 *  (the coordinator never calls its entry, it only drives the handle the
 *  outer task already started), so its exportName is `null` and the
 *  caller keys it by file + qualified name instead. `fn` is the qualified
 *  name used for the protocol exports (`Class_method` for methods, the
 *  plain name otherwise); `lookupParent` is the element the generated
 *  protocol members are registered under (the owning file for methods,
 *  whose parent is the bound class — the transform registers them under
 *  the class's parent file). */
function buildFunctionMeta(
  program: Program,
  prototype: FunctionPrototype,
  notes: string[],
  forInner: boolean,
  fn: string,
  lookupParent: Element
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
  let result = describeType(program, unwrapped);
  if (!result) {
    warnSkipped(program, prototype, "unsupported return type '" + unwrapped.toString() + "'", notes);
    return null;
  }
  let params = describeParams(program, signature.parameterTypes, prototype.name);
  if (params.reason) {
    warnSkipped(program, prototype, params.reason, notes);
    return null;
  }
  let fileBase = sanitizeName(file.source.simplePath);
  let sites: SiteMeta[] = [];
  for (let n = 0; ; ++n) {
    let resumeName = "__async_" + fileBase + "_" + fn + "_resume_" + n.toString();
    let doneName = "__async_" + fileBase + "_" + fn + "_join_done_" + n.toString();
    let resumeMember = lookupParent.getMember(resumeName);
    if (resumeMember && resumeMember.kind != ElementKind.FunctionPrototype) resumeMember = null;
    let doneMember = lookupParent.getMember(doneName);
    if (doneMember && doneMember.kind != ElementKind.FunctionPrototype) doneMember = null;
    if (!resumeMember && !doneMember) break;
    if (resumeMember && doneMember) {
      warnSkipped(program, prototype, "await site " + n.toString() + " has both a resume and a join export", notes);
      return null;
    }
    if (doneMember) {
      let storeName = "__async_" + fileBase + "_" + fn + "_join_store_" + n.toString();
      let storeMember = lookupParent.getMember(storeName);
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
      let member = describeType(program, storeTypes[2]);
      if (!member) {
        warnSkipped(
          program, prototype,
          "unsupported join member type '" + storeTypes[2].toString() + "'",
          notes
        );
        return null;
      }
      sites.push({
        desc: member,
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
    let site = describeType(program, valueTypes[1]);
    if (!site) {
      warnSkipped(
        program, prototype,
        "unsupported awaited type '" + valueTypes[1].toString() + "'",
        notes
      );
      return null;
    }
    let pendingName = "__async_" + fileBase + "_" + fn + "_pending_" + n.toString();
    let pendingMember = lookupParent.getMember(pendingName);
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
      desc: site,
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
    result,
    statusExport: "__async_" + fileBase + "_" + fn + "_status",
    resultExport: "__async_" + fileBase + "_" + fn + "_result",
    errorExport: "__async_" + fileBase + "_" + fn + "_error",
    sites
  };
}

/** Builds metadata for one transformed async method on an exported class,
 *  or `null` when it cannot be driven. A method on a non-exported class
 *  is skipped silently (no wrapper class in v1); any other failure warns.
 *  The resolved signature's parameterTypes are the declared params only —
 *  the receiver lives in signature.thisType — so they describe as-is and
 *  the runtime prepends the raw pointer. */
function buildMethodMeta(
  program: Program,
  prototype: FunctionPrototype,
  notes: string[]
): MethodMeta | null {
  let bound = prototype.getBoundClassOrInterface();
  if (!bound) return null;
  let file = owningFile(prototype);
  if (!file) {
    warnSkipped(program, prototype, "it has no owning file", notes);
    return null;
  }
  if (!findExportName(program, file, bound.prototype)) return null;
  let qualName = qualNameOf(prototype);
  let meta = buildFunctionMeta(program, prototype, notes, true, qualName, file);
  if (!meta) return null;
  return {
    ...meta,
    exportName: null,
    name: prototype.name,
    entryExport: "__async_" + meta.fileBase + "_" + qualName + "_entry"
  };
}

/** Builds metadata for one exported class from its drivable async methods,
 *  or `null` (with a warning) when the constructor cannot be driven: the
 *  whole class is skipped, since the wrapper cannot be constructed. A
 *  class with no explicit constructor takes no `new` params. */
function buildClassMeta(
  program: Program,
  classPrototype: ClassPrototype,
  methods: MethodMeta[],
  notes: string[]
): ClassMeta | null {
  let fileBase = methods[0].fileBase;
  let name = classPrototype.name;
  let newParams: ValueDesc[] = [];
  let ctor = classPrototype.constructorPrototype;
  if (ctor) {
    // The constructor prototype is flagged Instance but unbound, so
    // resolveFunction asserts on it: resolve the class instead and take
    // the constructor instance the resolver links (resolver.ts).
    let classInstance = program.resolver.resolveClass(classPrototype, null, new Map(), ReportMode.Swallow);
    if (!classInstance) {
      warnSkipped(program, ctor, "its class cannot be resolved", notes);
      return null;
    }
    let ctorInstance = classInstance.constructorInstance;
    if (!ctorInstance) {
      warnSkipped(program, ctor, "its constructor cannot be resolved", notes);
      return null;
    }
    let params = describeParams(program, ctorInstance.signature.parameterTypes, name);
    if (params.reason) {
      warnSkipped(program, ctor, params.reason, notes);
      return null;
    }
    newParams = params.params;
  }
  return {
    name,
    newExport: "__async_" + fileBase + "_" + name + "_new",
    newParams,
    methods
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
  let result = describeType(program, unwrapped);
  if (!result) {
    let reason = "unsupported return type '" + unwrapped.toString() + "'";
    warnSkipped(program, prototype, reason, notes);
    return {
      module: found.module,
      name: found.name,
      params: [],
      result: { kind: "void", nullable: false },
      unsupported: "async coordinator cannot drive suspending import '" + prototype.name +
        "': " + reason
    };
  }
  let params = describeParams(program, instance.signature.parameterTypes, prototype.name);
  if (params.reason) {
    warnSkipped(program, prototype, params.reason, notes);
    return {
      module: found.module,
      name: found.name,
      params: [],
      result,
      unsupported: "async coordinator cannot drive suspending import '" + prototype.name +
        "': " + params.reason
    };
  }
  return {
    module: found.module,
    name: found.name,
    params: params.params,
    result
  };
}

/** Builds metadata for a nested inner function by qualified name, or
 *  `null` when it cannot be found or driven. The inner lives in the
 *  same file as the outer function and needs no export. A method inner
 *  has innerQual `Class_method`, so the match uses the qualified name,
 *  not `prototype.name` (which is just the method name). */
function buildInnerMeta(
  program: Program,
  outer: FunctionPrototype,
  innerQual: string,
  notes: string[]
): FunctionMeta | null {
  let file = owningFile(outer);
  if (!file) return null;
  for (let prototype of program.transformedAsyncFunctions) {
    if (qualNameOf(prototype) != innerQual) continue;
    let innerFile = owningFile(prototype);
    if (!innerFile || innerFile != file) continue;
    let lookupParent: Element = prototype.getBoundClassOrInterface() ? innerFile : prototype.parent;
    return buildFunctionMeta(program, prototype, notes, true, innerQual, lookupParent);
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
 * has no exported transformed async function or class method. Call after
 * compilation.
 */
export function buildAsyncCoordinator(program: Program): string | null {
  if (program.transformedAsyncFunctions.size == 0) return null;
  let notes: string[] = [];
  let entries: Array<{ prototype: FunctionPrototype, meta: FunctionMeta }> = [];
  let methodEntries: Array<{ prototype: FunctionPrototype, meta: MethodMeta, classPrototype: ClassPrototype }> = [];
  for (let prototype of program.transformedAsyncFunctions) {
    let bound = prototype.getBoundClassOrInterface();
    if (bound && bound.kind == ElementKind.Class) {
      let meta = buildMethodMeta(program, prototype, notes);
      if (meta) methodEntries.push({ prototype, meta, classPrototype: bound.prototype });
    } else {
      let meta = buildFunctionMeta(program, prototype, notes, false, prototype.name, prototype.parent);
      if (meta) entries.push({ prototype, meta });
    }
  }
  if (entries.length == 0 && methodEntries.length == 0) return null;
  let combined: Array<{ prototype: FunctionPrototype, meta: FunctionMeta }> = [];
  for (let i = 0, k = entries.length; i < k; ++i) combined.push(entries[i]);
  for (let i = 0, k = methodEntries.length; i < k; ++i) combined.push(methodEntries[i]);
  let classOf = new Map<FunctionPrototype, ClassPrototype>();
  for (let i = 0, k = methodEntries.length; i < k; ++i) {
    classOf.set(methodEntries[i].prototype, methodEntries[i].classPrototype);
  }
  let inners = resolveNestedInners(program, combined, notes);
  let functions: FunctionMeta[] = [];
  let keptMethods = new Map<ClassPrototype, MethodMeta[]>();
  for (let i = 0, k = combined.length; i < k; ++i) {
    let entry = combined[i];
    let classPrototype = classOf.get(entry.prototype);
    if (classPrototype) {
      let list = keptMethods.get(classPrototype);
      if (!list) keptMethods.set(classPrototype, list = []);
      list.push(<MethodMeta>entry.meta);
    } else {
      functions.push(entry.meta);
    }
  }
  let classes: ClassMeta[] = [];
  for (let classPrototype of keptMethods.keys()) {
    let classMeta = buildClassMeta(program, classPrototype, keptMethods.get(classPrototype)!, notes);
    if (classMeta) classes.push(classMeta);
  }
  if (functions.length == 0 && classes.length == 0) return null;
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
  // Array layout constants for the runtime's array lowering/lifting,
  // from the stock bindings generator's `__lowerArray`/`__liftArray`
  // (`src/bindings/js.ts`): the ArrayBuffer id, the Array<T> header
  // size, and the buffer/dataStart/byteLength/length field offsets.
  let arrayView = program.arrayBufferViewInstance;
  let byteLengthOffset = arrayView.offsetof("byteLength");
  let layout = {
    arrayBufferId: program.arrayBufferInstance.id,
    arraySize: arrayView.nextMemoryOffset + 4,
    bufferOffset: arrayView.offsetof("buffer"),
    dataStartOffset: arrayView.offsetof("dataStart"),
    byteLengthOffset,
    lengthOffset: byteLengthOffset + 4
  };
  let metadata = { functions, classes, inners, imports, layout };
  let hasJoin = false;
  for (let i = 0, k = functions.length; i < k; ++i) {
    let sites = functions[i].sites;
    for (let j = 0, l = sites.length; j < l; ++j) {
      if (sites[j].join) hasJoin = true;
    }
  }
  for (let i = 0, k = classes.length; i < k; ++i) {
    let methods = classes[i].methods;
    for (let j = 0, l = methods.length; j < l; ++j) {
      let sites = methods[j].sites;
      for (let m = 0, n = sites.length; m < n; ++m) {
        if (sites[m].join) hasJoin = true;
      }
    }
  }
  if (hasJoin) {
    imports.push({
      module: "env",
      name: "__async_join",
      params: [],
      result: { kind: "i32", nullable: false },
      joinImport: true
    });
  }
  let envImports = program.moduleImports.get("env");
  if (envImports && envImports.has("__async_wait")) {
    imports.push({
      module: "env",
      name: "__async_wait",
      params: [],
      result: { kind: "i32", nullable: false },
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
