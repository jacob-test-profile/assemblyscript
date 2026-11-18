function getString(memory, ptr) {
  const RUNTIME_HEADER_SIZE = 16;
  if (!ptr) return "null";
  const U32 = new Uint32Array(memory.buffer);
  const U16 = new Uint16Array(memory.buffer);
  const len16 = U32[(ptr - RUNTIME_HEADER_SIZE + 12) >>> 2] >>> 1;
  const ptr16 = ptr >>> 1;
  return String.fromCharCode.apply(String, U16.subarray(ptr16, ptr16 + len16));
}

export function preInstantiate(imports, exports) {
  imports.env.getNumber = function() {
    return 0; // suspended; the driver delivers via the resume export
  };
}

// Drives one task to completion, delivering 10 at every suspension.
function drive(instance, fn) {
  const exports = instance.exports;
  const memory = exports.memory;
  const handle = exports[fn]();
  const status = exports[`__async_async_closure_${fn}_status`];
  const result = exports[`__async_async_closure_${fn}_result`];
  const error = exports[`__async_async_closure_${fn}_error`];
  while (true) {
    const st = status(handle);
    if (st == -1) break;
    if (st == -2) throw new Error(`task ${fn} failed: ` + getString(memory, error(handle)));
    if (st <= 0) throw new Error(`task ${fn}: unexpected status ` + st);
    const site = st - 1;
    const resume = exports[`__async_async_closure_${fn}_resume_${site}`];
    const rc = resume(handle, 10);
    if (rc != 0 && rc != 1) throw new Error(`task ${fn}: unexpected step return ` + rc);
  }
  return result(handle);
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  const memory = exports.memory;
  // counter: first call 1, second call 2, plus the delivered 10.
  if (drive(instance, "counter") !== 22) throw new Error("counter must be 22");
  // passed: 40 + 2, plus the delivered 10.
  if (drive(instance, "passed") !== 52) throw new Error("passed must be 52");
  // nested: (10 + 5) + 1, plus the delivered 10.
  if (drive(instance, "nested") !== 26) throw new Error("nested must be 26");
  // greeting: the captured string after mutation, plus the delivered 10.
  const greeting = getString(memory, drive(instance, "greeting"));
  if (greeting !== "hello there10") throw new Error("greeting must be hello there10, got " + greeting);
}
