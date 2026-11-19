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
  imports.env.getVoid = function() {
    return 0; // suspended; the glue delivers via the resume/reject exports
  };
}

function driveVoid(exports, fn, reject) {
  const base = `__async_async_void_await_${fn}`;
  const handle = exports[fn]();
  const status = exports[base + "_status"];
  const resume = exports[base + "_resume_0"];
  const rejectFn = exports[base + "_reject_0"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  while (true) {
    if (++guard > 10) throw new Error("loop guard");
    const st = status(handle);
    if (st == -1) return { failed: false, value: result(handle) };
    if (st == -2) return { failed: true, value: getString(error(handle)) };
    if (st <= 0) throw new Error("unexpected status " + st);
    // A void resume takes no value argument.
    const rc = reject ? rejectFn(handle, exports.msg()) : resume(handle);
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected step return " + rc);
  }
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;

  let r = driveVoid(exports, "voidStmt", false);
  if (r.failed || getString(r.value) !== "after-void") throw new Error("voidStmt: " + JSON.stringify(r));

  r = driveVoid(exports, "voidReturn", false);
  if (r.failed) throw new Error("voidReturn: " + JSON.stringify(r));

  r = driveVoid(exports, "voidCatch", true);
  if (r.failed || getString(r.value) !== "caught:void-boom") throw new Error("voidCatch: " + JSON.stringify(r));
}
