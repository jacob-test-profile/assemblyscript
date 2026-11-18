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

// Inner task qualified name per outer task and nested site: `run` awaits
// `Box<i32>.get` (qualName `Box_get_i32`) as a nested task.
const INNER = {
  "run": ["Box_get_i32"]
};

// Drives one task to completion. A nested site fetches the inner handle
// from the pending export, drives the inner task recursively, and delivers
// its result to the outer resume export; a direct import site is resumed
// with 1. Mirrors tests/compiler/async-member-await.js.
function driveTask(instance, qual, handle) {
  const exports = instance.exports;
  const base = `__async_async_generic_method_${qual}`;
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

  // run(): new Box<i32>(42), await box.get() -> 42.
  const r = driveTask(instance, "run", exports.run());
  if (r.failed || r.value !== 42) throw new Error("run: " + JSON.stringify(r));

  // The method directly through its entry export, on a Box built by the
  // class-new export: new Box<i32>(99), await get() -> 99.
  const box = exports["__async_async_generic_method_Box_i32_new"](99);
  const handle = exports["__async_async_generic_method_Box_get_i32_entry"](box);
  const g = driveTask(instance, "Box_get_i32", handle);
  if (g.failed || g.value !== 99) throw new Error("Box_get_i32: " + JSON.stringify(g));
}
