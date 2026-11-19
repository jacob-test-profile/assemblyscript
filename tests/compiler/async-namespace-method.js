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

// Drives one task to completion through its generated entry export,
// delivering chunkString(i) at its single site. For an instance method
// the entry takes the receiver (built by the class-new export) first.
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

// Drives one task returning an i32 to completion through its generated
// entry export, delivering chunkString(i) at its single site.
function driveSimpleInt(exports, base, entry, entryArgs, i) {
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
  return result(handle);
}

// Drives a task awaiting a nested namespaced-class method: the outer
// suspends at its nested site, the inner handle comes from the pending
// export, the inner is driven to completion, and its result is delivered
// through the outer resume export. `start` is the outer's own export
// name (a top-level function).
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

// Drives a task returning an i32 and awaiting a nested namespaced-class
// method, as driveNested but with a numeric outer result.
function driveNestedInt(exports, outerBase, start, innerBase, i) {
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
  return outerResult(outerHandle);
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory; // the module defines its own memory
  const base = "__async_async_namespace_method_";
  // Direct drive through the entry export, on an H built by _new.
  const box = exports[base + "NS2_H_new"](7);
  const m = driveSimple(exports, base + "NS2_H_m", base + "NS2_H_m_entry", [box], 0);
  if (m !== "C07") throw new Error("NS2.H.m must be C07, got " + m);
  // Direct drive of the static method through its entry export.
  const make = driveSimpleInt(exports, base + "NS2_H_make", base + "NS2_H_make_entry", [3], 3);
  if (make !== 5) throw new Error("NS2.H.make(3) must be 5, got " + make);
  // Nested awaits from top-level functions.
  const runNs = driveNested(exports, base + "runNs", "runNs", base + "NS2_H_m", 0);
  if (runNs !== "C05") throw new Error("runNs must be C05, got " + runNs);
  const runNsStatic = driveNestedInt(exports, base + "runNsStatic", "runNsStatic", base + "NS2_H_make", 3);
  if (runNsStatic !== 5) throw new Error("runNsStatic must be 5, got " + runNsStatic);
  const deepBox = exports[base + "Outer_Inner_Deep_new"]();
  const deep = driveSimple(exports, base + "Outer_Inner_Deep_m", base + "Outer_Inner_Deep_m_entry", [deepBox], 2);
  if (deep !== "deep-C2") throw new Error("Outer.Inner.Deep.m must be deep-C2, got " + deep);
  const runDeep = driveNested(exports, base + "runDeep", "runDeep", base + "Outer_Inner_Deep_m", 2);
  if (runDeep !== "deep-C2") throw new Error("runDeep must be deep-C2, got " + runDeep);
}
