let memory = null;

function getString(ptr) {
  const RUNTIME_HEADER_SIZE = 16;
  if (!ptr) return "null";
  const U32 = new Uint32Array(memory.buffer);
  const U16 = new Uint16Array(memory.buffer);
  const len16 = U32[(ptr - RUNTIME_HEADER_SIZE + 12) >>> 2] >>> 1;
  const ptr16 = ptr >>> 1;
  return String.fromCharCode.apply(String, U16.subarray(ptr16, ptr16 + len16));
}

export function preInstantiate(imports, exports) {
  memory = imports.env.memory;
  imports.env.getChunk = function(i) {
    return 0; // suspended; the glue delivers via the resume export
  };
}

// Drives one plain (non-nested) task to completion through its generated
// top-level entry alias, delivering chunkString(i) at its single site.
function driveSimple(exports, base, entry, entryArgs, i) {
  const handle = exports[entry](...entryArgs);
  const status = exports[base + "_status"];
  const resume = exports[base + "_resume_0"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let st = status(handle);
  if (st != 1) throw new Error(base + ": expected status 1, got " + st);
  const rc = resume(handle, exports.chunkString(i));
  if (rc != 0 && rc != 1) throw new Error(base + ": unexpected step return " + rc);
  st = status(handle);
  if (st != -1) throw new Error(base + ": expected status -1, got " + st + " (" + getString(error(handle)) + ")");
  return getString(result(handle));
}

// Drives a task awaiting a nested namespaced fn: the outer suspends at
// its nested site, the inner handle comes from the pending export, the
// inner is driven to completion, and its result is delivered through the
// outer resume export. `start` is the outer's entry alias for a
// namespaced outer, its own export name for a top-level outer.
function driveNested(exports, outerBase, start, innerBase, i) {
  const outerHandle = exports[start]();
  const outerStatus = exports[outerBase + "_status"];
  const outerResume = exports[outerBase + "_resume_0"];
  const outerResult = exports[outerBase + "_result"];
  const outerError = exports[outerBase + "_error"];
  let st = outerStatus(outerHandle);
  if (st != 1) throw new Error(outerBase + ": expected status 1, got " + st);
  const innerHandle = exports[outerBase + "_pending_0"](outerHandle);
  if (!innerHandle) throw new Error(outerBase + ": pending export returned no inner handle");
  const innerStatus = exports[innerBase + "_status"];
  const innerResume = exports[innerBase + "_resume_0"];
  const innerResult = exports[innerBase + "_result"];
  const innerError = exports[innerBase + "_error"];
  st = innerStatus(innerHandle);
  if (st != 1) throw new Error(innerBase + ": expected status 1, got " + st);
  let rc = innerResume(innerHandle, exports.chunkString(i));
  if (rc != 0 && rc != 1) throw new Error(innerBase + ": unexpected step return " + rc);
  st = innerStatus(innerHandle);
  if (st != -1) throw new Error(innerBase + ": expected status -1, got " + st + " (" + getString(innerError(innerHandle)) + ")");
  const value = innerResult(innerHandle);
  rc = outerResume(outerHandle, value);
  if (rc != 0 && rc != 1) throw new Error(outerBase + ": unexpected step return " + rc);
  st = outerStatus(outerHandle);
  if (st != -1) throw new Error(outerBase + ": expected status -1, got " + st + " (" + getString(outerError(outerHandle)) + ")");
  return getString(outerResult(outerHandle));
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory; // the module defines its own memory
  const take = driveSimple(exports, "__async_async_namespace_NS_take", "__async_async_namespace_NS_take_entry", [], 0);
  if (take !== "got-C0") throw new Error("NS.take must be got-C0, got " + take);
  const takeTwo = driveSimple(exports, "__async_async_namespace_NS_takeTwo", "__async_async_namespace_NS_takeTwo_entry", [5], 5);
  if (takeTwo !== "two-C5") throw new Error("NS.takeTwo(5) must be two-C5, got " + takeTwo);
  const viaOther = driveNested(exports, "__async_async_namespace_NS_viaOther", "__async_async_namespace_NS_viaOther_entry", "__async_async_namespace_NS_takeTwo", 1);
  if (viaOther !== "via-two-C1") throw new Error("NS.viaOther must be via-two-C1, got " + viaOther);
  const deep = driveSimple(exports, "__async_async_namespace_Outer_Inner_deep", "__async_async_namespace_Outer_Inner_deep_entry", [], 2);
  if (deep !== "deep-C2") throw new Error("Outer.Inner.deep must be deep-C2, got " + deep);
  const top = driveNested(exports, "__async_async_namespace_topViaNs", "topViaNs", "__async_async_namespace_NS_take", 0);
  if (top !== "top-got-C0") throw new Error("topViaNs must be top-got-C0, got " + top);
  const hidden = driveNested(exports, "__async_async_namespace_viaHidden", "viaHidden", "__async_async_namespace_Hidden_secret", 3);
  if (hidden !== "via-hidden-secret-C3") throw new Error("viaHidden must be via-hidden-secret-C3, got " + hidden);
}
