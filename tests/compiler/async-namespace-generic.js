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
  imports.env.fetchValue = function() {
    return 0; // suspended; the driver delivers via the resume export
  };
}

// Inner task qualified name per outer task and nested site, mirroring the
// coordinator's inners map keyed by qualName.
const INNER = {
  "runNsGen": ["NS_id_i32"],
  "runOuterGen": ["Outer_Inner_id_i32"],
  "runPlain": ["Plain_id_i32"],
  "runStr": ["NS_id__x7e_lib_x2f_string_x2f_String"]
};

// Drives one task to completion. A nested site fetches the inner handle
// from the pending export, drives the inner task recursively, and delivers
// its result to the outer resume export; a direct import site is resumed
// with 1. Mirrors tests/compiler/async-generic.js.
function driveTask(instance, qual, handle) {
  const exports = instance.exports;
  const base = `__async_async_namespace_generic_${qual}`;
  const status = exports[base + "_status"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  while (true) {
    if (++guard > 20) throw new Error(`task ${qual}: loop guard`);
    const st = status(handle);
    if (st == -1) return { failed: false, value: result(handle) };
    if (st == -2) return { failed: true, errorPtr: error(handle) };
    if (st <= 0) throw new Error(`task ${qual}: unexpected status ` + st);
    const site = st - 1;
    const pending = exports[base + `_pending_${site}`];
    if (pending) {
      const innerQual = (INNER[qual] || [])[site];
      if (!innerQual) throw new Error(`task ${qual}: unexpected nested site ` + site);
      const inner = driveTask(instance, innerQual, pending(handle));
      if (inner.failed) {
        const reject = exports[base + `_reject_${site}`];
        const rc = reject(handle, inner.errorPtr);
        if (rc != 0 && rc != 1 && rc != 2) throw new Error(`task ${qual}: unexpected reject return ` + rc);
        continue;
      }
      const resume = exports[base + `_resume_${site}`];
      const rc = resume(handle, inner.value);
      if (rc != 0 && rc != 1) throw new Error(`task ${qual}: unexpected step return ` + rc);
      continue;
    }
    const resume = exports[base + `_resume_${site}`];
    const rc = resume(handle, 1);
    if (rc != 0 && rc != 1) throw new Error(`task ${qual}: unexpected step return ` + rc);
  }
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;

  // Direct drive through the top-level entry aliases.
  const direct = driveTask(instance, "NS_id_i32", exports.__async_async_namespace_generic_NS_id_i32_entry(42));
  if (direct.failed || direct.value !== 42) throw new Error("NS.id<i32>(42): " + JSON.stringify(direct));
  const deep = driveTask(instance, "Outer_Inner_id_i32", exports.__async_async_namespace_generic_Outer_Inner_id_i32_entry(7));
  if (deep.failed || deep.value !== 7) throw new Error("Outer.Inner.id<i32>(7): " + JSON.stringify(deep));

  // Nested drive through the exported runners.
  const r = driveTask(instance, "runNsGen", exports.runNsGen());
  if (r.failed || r.value !== 42) throw new Error("runNsGen: " + JSON.stringify(r));
  const o = driveTask(instance, "runOuterGen", exports.runOuterGen());
  if (o.failed || o.value !== 7) throw new Error("runOuterGen: " + JSON.stringify(o));
  const p = driveTask(instance, "runPlain", exports.runPlain());
  if (p.failed || p.value !== 9) throw new Error("runPlain: " + JSON.stringify(p));
  const s = driveTask(instance, "runStr", exports.runStr());
  if (s.failed || getString(s.value) !== "hi") throw new Error("runStr: " + JSON.stringify(s));
}
