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
  imports.env.fetch = function(x) {
    return 0; // suspended; the driver delivers via the resume export
  };
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;
  const base = "__async_async_generic_import_run";
  const status = exports[base + "_status"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  const handle = exports.run();
  let guard = 0;
  while (true) {
    if (++guard > 20) throw new Error("run: loop guard");
    const st = status(handle);
    if (st == -1) break;
    if (st == -2) throw new Error("run failed: " + getString(memory, error(handle)));
    if (st <= 0) throw new Error("run: unexpected status " + st);
    const site = st - 1;
    const resume = exports[base + `_resume_${site}`];
    // Site 0 is fetch<i32>(1): deliver 42. Site 1 is fetch<string>(2):
    // deliver the "hi" pointer.
    const value = site == 0 ? 42 : exports.hi();
    const rc = resume(handle, value);
    if (rc != 0 && rc != 1) throw new Error("run: unexpected step return " + rc);
  }
  if (result(handle) !== 43) throw new Error("run: wrong result " + result(handle));
}
