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
// coordinator's inners map keyed by qualName. `run` awaits the i32 and
// string instantiations of `f` as nested tasks.
const INNER = {
  "run": ["f_i32", "f__x7e_lib_x2f_string_x2f_String"]
};

// Drives one task to completion. A nested site fetches the inner handle
// from the pending export, drives the inner task recursively, and delivers
// its result to the outer resume export; a direct import site is resumed
// with 1. Mirrors tests/compiler/async-member-await.js.
function driveTask(instance, qual, handle) {
  const exports = instance.exports;
  const base = `__async_async_generic_${qual}`;
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

  // run(): await f<i32>(42) -> 42, await f<string>("hi") -> "hi"; 42 + 1.
  const r = driveTask(instance, "run", exports.run());
  if (r.failed || r.value !== 43) throw new Error("run: " + JSON.stringify(r));

  // The class instantiation, driven directly through its entry export:
  // callPoint returns the f<Point> handle; resume with 1; the result is
  // the same Point, x = 7, y = 8.
  const ptr = exports.makePoint(7, 8);
  const p = driveTask(instance, "f_async_x2d_generic_x2f_Point", exports.callPoint(ptr));
  if (p.failed) throw new Error("f<Point>: failed: " + getString(memory, p.errorPtr));
  const U32 = new Uint32Array(memory.buffer);
  const x = U32[p.value >>> 2];
  const y = U32[(p.value + 4) >>> 2];
  if (x !== 7 || y !== 8) throw new Error(`f<Point>: wrong point: ${x},${y}`);
}
