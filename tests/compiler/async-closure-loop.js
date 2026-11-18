export function preInstantiate(imports, exports) {
  imports.env.getNumber = function() {
    return 0; // suspended; the driver delivers via the resume export
  };
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  const memory = exports.memory;
  const handle = exports.loopClosures();
  const status = exports.__async_async_closure_loop_loopClosures_status;
  const result = exports.__async_async_closure_loop_loopClosures_result;
  const error = exports.__async_async_closure_loop_loopClosures_error;
  const resume = exports.__async_async_closure_loop_loopClosures_resume_0;
  const U32 = new Uint32Array(memory.buffer);
  const U16 = new Uint16Array(memory.buffer);
  while (true) {
    const st = status(handle);
    if (st == -1) break;
    if (st == -2) {
      const ptr = error(handle);
      const len16 = U32[(ptr - 16 + 12) >>> 2] >>> 1;
      throw new Error("task failed: " + String.fromCharCode.apply(String, U16.subarray(ptr >>> 1, (ptr >>> 1) + len16)));
    }
    if (st != 1) throw new Error("unexpected status " + st);
    const rc = resume(handle, 10);
    if (rc != 0 && rc != 1) throw new Error("unexpected step return " + rc);
  }
  // (10+0) + (10+1) + (10+2), plus 10 delivered per iteration.
  if (result(handle) !== 63) throw new Error("loopClosures must be 63, got " + result(handle));
}
