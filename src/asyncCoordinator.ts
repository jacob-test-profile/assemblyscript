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
  Function,
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
  RestDesc,
  warnSkipped,
  sanitizeName,
  describeType,
  describePointerType,
  describeParams,
  describeParamsAndRest,
  owningFile,
  findExportName,
  collectSuspendingImports,
  findImportName,
  qualNameOf,
  methodClassOf,
  isStaticMethod,
  namespacePathOf
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
  let result = describeType(unwrapped);
  if (!result) {
    // An inner function may return a wasm-pointer value (array/class):
    // its result is handed to the awaiting parent untouched, never to JS.
    // Top-level entry functions keep the loud skip — a raw pointer is
    // not a usable JS result.
    if (forInner) result = describePointerType(unwrapped);
    if (!result) {
      warnSkipped(program, prototype, "unsupported return type '" + unwrapped.toString() + "'", notes);
      return null;
    }
  }
  let params = describeParamsAndRest(signature, prototype.name);
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
      let markName = "__async_" + fileBase + "_" + fn + "_join_mark_" + n.toString();
      let markMember = lookupParent.getMember(markName);
      if (!markMember || markMember.kind != ElementKind.FunctionPrototype) {
        warnSkipped(program, prototype, "join site " + n.toString() + " has no join_mark export", notes);
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
        markExport: markName,
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
    let pendingName = "__async_" + fileBase + "_" + fn + "_pending_" + n.toString();
    let pendingMember = lookupParent.getMember(pendingName);
    if (pendingMember && pendingMember.kind != ElementKind.FunctionPrototype) pendingMember = null;
    // A void site's resume export takes only the state: the awaited
    // value does not exist, so there is no value parameter to describe.
    let site: ValueDesc | null;
    if (valueTypes.length == 1) {
      site = { kind: "void", nullable: false };
    } else if (valueTypes.length < 2) {
      warnSkipped(program, prototype, "its resume export '" + resumeName + "' has no value parameter", notes);
      return null;
    } else {
      site = describeType(valueTypes[1]);
      if (!site) {
        // A nested site may await a wasm-pointer value (array/class): the
        // inner result is handed to the resume untouched, never lowered
        // from JS. Any other site keeps the loud skip.
        if (pendingMember) site = describePointerType(valueTypes[1]);
        if (!site) {
          warnSkipped(
            program, prototype,
            "unsupported awaited type '" + valueTypes[1].toString() + "'",
            notes
          );
          return null;
        }
      }
    }
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
      markExport: null,
      pendingExport: pendingMember ? pendingName : null,
      innerExportName
    });
  }
  return {
    exportName,
    fileBase,
    params: params.params,
    varargs: params.varargs,
    rest: params.rest,
    resultKind: result.kind,
    resultNullable: result.nullable,
    statusExport: "__async_" + fileBase + "_" + fn + "_status",
    resultExport: "__async_" + fileBase + "_" + fn + "_result",
    errorExport: "__async_" + fileBase + "_" + fn + "_error",
    lastHandleExport: "__async_" + fileBase + "_" + fn + "_last_handle",
    reclaimExport: "__async_" + fileBase + "_" + fn + "_reclaim",
    sites
  };
}

/** Builds metadata for one transformed async method on an exported class,
 *  or `null` when it cannot be driven. A method on a non-exported class
 *  is skipped silently by design (no wrapper class: the class is not
 *  nameable from JS, so its methods stay reachable only as nested
 *  inners); any other failure warns.
 *  The resolved signature's parameterTypes are the declared params only —
 *  the receiver lives in signature.thisType — so they describe as-is and
 *  the runtime prepends the raw pointer. A static method has no receiver
 *  at all: its entry takes only the declared params. */
function buildMethodMeta(
  program: Program,
  prototype: FunctionPrototype,
  notes: string[]
): MethodMeta | null {
  let cls = methodClassOf(prototype);
  if (!cls) return null;
  // A method on a generic class is transformed per instantiation and is
  // drivable through its entry export, but the generated wrapper cannot
  // name the instantiated class yet (Group 4): skip it silently, exactly
  // like a method on a non-exported class.
  let typeParameters = cls.typeParameterNodes;
  if (typeParameters && typeParameters.length > 0) return null;
  let file = owningFile(prototype);
  if (!file) {
    warnSkipped(program, prototype, "it has no owning file", notes);
    return null;
  }
  if (!findExportName(program, file, cls)) return null;
  let qualName = qualNameOf(prototype);
  let meta = buildFunctionMeta(program, prototype, notes, true, qualName, file);
  if (!meta) return null;
  let entryExport = "__async_" + meta.fileBase + "_" + qualName + "_entry";
  // The transform skips the entry when the method cannot be driven
  // through it (e.g. a default value referencing `this`): without the
  // entry the wrapper method would call a missing export, so the method
  // is skipped here instead.
  let entryMember = file.getMember(entryExport);
  if (!entryMember || entryMember.kind != ElementKind.FunctionPrototype) {
    warnSkipped(program, prototype, "its generated entry was not emitted, so it is not driven (see the earlier warning for the reason)", notes);
    return null;
  }
  return {
    ...meta,
    exportName: null,
    name: prototype.name,
    isStatic: isStaticMethod(prototype),
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
  let newVarargs = false;
  let newRest: RestDesc | null = null;
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
    let params = describeParamsAndRest(ctorInstance.signature, name);
    if (params.reason) {
      warnSkipped(program, ctor, params.reason, notes);
      return null;
    }
    newParams = params.params;
    newVarargs = params.varargs;
    newRest = params.rest;
    // The transform skips _new when the constructor cannot be driven
    // through it (e.g. a default value referencing `this`): without it
    // the wrapper cannot be constructed, so the whole class is skipped.
    let file = owningFile(classPrototype);
    let newExport = "__async_" + fileBase + "_" + name + "_new";
    if (file) {
      let newMember = file.getMember(newExport);
      if (!newMember || newMember.kind != ElementKind.FunctionPrototype) {
        warnSkipped(program, ctor, "its generated _new was not emitted, so it is not driven (see the earlier warning for the reason)", notes);
        return null;
      }
    }
  }
  return {
    name,
    newExport: "__async_" + fileBase + "_" + name + "_new",
    newParams,
    newVarargs,
    newRest,
    methods
  };
}

/** Builds metadata for one suspending import. An import with an
 *  unsupported type still gets an entry: the runtime installs a stub that
 *  rejects with the reason instead of calling the binding. Returns `null`
 *  (with a warning) only when the import cannot be located at all. A
 *  generic import has no default instance (resolving with null type
 *  arguments asserts), so it is built from its resolved instantiations:
 *  one wrapper serves them all when their parameter types agree — the
 *  wrapper only lifts arguments, and each instantiation's result is
 *  delivered through its own await site's resume export. */
function buildImportMeta(
  program: Program,
  prototype: FunctionPrototype,
  notes: string[]
): ImportMeta | null {
  let instances: Function[] | null = null;
  let instance: Function | null;
  if (prototype.typeParameterNodes && prototype.typeParameterNodes.length > 0) {
    instances = genericImportInstances(prototype);
    if (!instances || instances.length == 0) {
      warnSkipped(program, prototype, "generic suspending import has no instantiations", notes);
      return null;
    }
    instance = instances[0];
  } else {
    instance = program.resolver.resolveFunction(prototype, null, new Map(), ReportMode.Swallow);
    if (!instance) {
      warnSkipped(program, prototype, "suspending import cannot be resolved", notes);
      return null;
    }
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
  if (instances) {
    for (let i = 1, k = instances.length; i < k; ++i) {
      let other = describeParams(instances[i].signature.parameterTypes, prototype.name);
      if (other.reason || !sameParams(params.params, other.params)) {
        let reason = "instantiations disagree on parameter types";
        warnSkipped(program, prototype, reason, notes);
        return {
          module: found.module,
          name: found.name,
          params: [],
          resultKind: result.kind,
          resultNullable: result.nullable,
          unsupported: "async coordinator cannot drive suspending import '" + prototype.name +
            "': " + reason
        };
      }
    }
  }
  return {
    module: found.module,
    name: found.name,
    params: params.params,
    resultKind: result.kind,
    resultNullable: result.nullable
  };
}

/** Splits a file-qualified inner key (`fileBase#qualName`, set by the
 *  transform) into its parts; a bare name means the outer file. */
function splitInnerQual(innerQual: string): { fileBase: string | null, qual: string } {
  let hash = innerQual.indexOf("#");
  if (hash < 0) return { fileBase: null, qual: innerQual };
  return { fileBase: innerQual.substring(0, hash), qual: innerQual.substring(hash + 1) };
}

/** Finds a nested inner prototype by file-qualified name, or `null`
 *  when it cannot be found. A bare name means the outer file. */
function findInnerPrototypeByBase(program: Program, innerBase: string, qual: string): FunctionPrototype | null {
  for (let prototype of program.transformedAsyncFunctions) {
    if (qualNameOf(prototype) != qual) continue;
    let innerFile = owningFile(prototype);
    if (!innerFile || sanitizeName(innerFile.source.simplePath) != innerBase) continue;
    return prototype;
  }
  return null;
}

/** Resolved instantiations of a generic suspending import. */
function genericImportInstances(prototype: FunctionPrototype): Function[] | null {
  let instances = prototype.instances;
  if (!instances) return null;
  return Map_values(instances);
}

/** Whether two parameter descriptions lift identically (same kind and
 *  nullability at every position). */
function sameParams(a: ValueDesc[], b: ValueDesc[]): bool {
  if (a.length != b.length) return false;
  for (let i = 0, k = a.length; i < k; ++i) {
    if (a[i].kind != b[i].kind || a[i].nullable != b[i].nullable) return false;
  }
  return true;
}

/** Builds metadata for a nested inner function by file-qualified name, or
 *  `null` when it cannot be found or driven. The inner may live in another
 *  file than the outer function and needs no export. A method inner has
 *  innerQual `Class_method`, so the match uses the qualified name, not
 *  `prototype.name` (which is just the method name). */
function buildInnerMeta(
  program: Program,
  outer: FunctionPrototype,
  innerQual: string,
  notes: string[]
): FunctionMeta | null {
  let outerFile = owningFile(outer);
  if (!outerFile) return null;
  let parts = splitInnerQual(innerQual);
  let innerBase = parts.fileBase ? parts.fileBase : sanitizeName(outerFile.source.simplePath);
  let prototype = findInnerPrototypeByBase(program, innerBase, parts.qual);
  if (!prototype) return null;
  let innerFile = owningFile(prototype);
  if (!innerFile) return null;
  // Protocol members register under the owning file for methods (whose
  // parent is the bound class) and for namespaced functions (whose
  // parent is the namespace); only a top-level function looks them up
  // under its own parent, the file itself.
  let lookupParent: Element = methodClassOf(prototype) || namespacePathOf(prototype).length > 0
    ? innerFile
    : prototype.parent;
  return buildFunctionMeta(program, prototype, notes, true, parts.qual, lookupParent);
}

/** Finds the prototype for an inners-map key
 *  (`outerFileBase\0innerQual`), or `null` when it cannot be found. */
function findInnerPrototypeByKey(program: Program, key: string): FunctionPrototype | null {
  let nul = key.indexOf("\0");
  let innerQual = nul < 0 ? key : key.substring(nul + 1);
  let outerBase = nul < 0 ? "" : key.substring(0, nul);
  let parts = splitInnerQual(innerQual);
  let innerBase = parts.fileBase ? parts.fileBase : outerBase;
  return findInnerPrototypeByBase(program, innerBase, parts.qual);
}

/** Resolves the metadata for every nested inner function the exported
 *  functions await, keyed by file + qualified name. A function whose
 *  inner cannot be found or driven is dropped (with a warning) —
 *  driving it would deliver the inner import's raw value as the inner
 *  result. Inners of inners resolve transitively to a fixpoint, so a
 *  chain (A awaits B, B awaits C) drives; a longer chain whose inner is
 *  undrivable is not dropped here — it fails loudly at runtime in
 *  driveNested when the inner task suspends at the broken site. */
function resolveNestedInners(
  program: Program,
  entries: Array<{ prototype: FunctionPrototype, meta: FunctionMeta }>,
  notes: string[]
): { [key: string]: FunctionMeta } {
  let inners: { [key: string]: FunctionMeta } = {};
  let innerKeys = new Array<string>();
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
        innerKeys.push(key);
        continue;
      }
      warnSkipped(program, entry.prototype, "its nested await of '" + splitInnerQual(site.innerExportName).qual + "' cannot be driven", notes);
      entries.splice(i, 1);
      dropped = true;
      break;
    }
    if (dropped) continue;
  }
  for (let q = 0; q < innerKeys.length; ++q) {
    let key = innerKeys[q];
    let meta = inners[key];
    let outerPrototype = findInnerPrototypeByKey(program, key);
    if (!outerPrototype) continue;
    let sites = meta.sites;
    for (let j = 0, l = sites.length; j < l; ++j) {
      let site = sites[j];
      if (!site.nested || !site.innerExportName) continue;
      let innerKey = meta.fileBase + "\0" + site.innerExportName;
      if (inners[innerKey]) continue;
      let innerMeta = buildInnerMeta(program, outerPrototype, site.innerExportName, notes);
      if (!innerMeta) continue;
      inners[innerKey] = innerMeta;
      innerKeys.push(innerKey);
    }
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
    let cls = methodClassOf(prototype);
    if (cls) {
      let meta = buildMethodMeta(program, prototype, notes);
      if (meta) methodEntries.push({ prototype, meta, classPrototype: cls });
    } else if (namespacePathOf(prototype).length > 0) {
      // A namespaced function is not a wasm export, so it is driven
      // through its generated top-level entry alias. The entry exists
      // only when the function is exported through its namespace chain;
      // without it the function stays inner-only and is skipped here.
      let qual = qualNameOf(prototype);
      let file = owningFile(prototype);
      let meta = file ? buildFunctionMeta(program, prototype, notes, true, qual, file) : null;
      if (meta) {
        let entryName = "__async_" + meta.fileBase + "_" + qual + "_entry";
        if (file!.getMember(entryName)) {
          meta.exportName = null;
          meta.entryExport = entryName;
          meta.path = namespacePathOf(prototype);
          meta.name = prototype.name;
          entries.push({ prototype, meta });
        }
      }
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
  // The mint is per file and file-independent: any transformed
  // function's file carries one, so the first entry's file will do.
  let mintFileBase = functions.length > 0
    ? functions[0].fileBase
    : classes[0].methods[0].fileBase;
  let metadata = {
    functions,
    classes,
    inners,
    imports,
    mintExport: "__async_" + mintFileBase + "_mint",
    mintStringExport: "__async_" + mintFileBase + "_mint_string"
  };
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
