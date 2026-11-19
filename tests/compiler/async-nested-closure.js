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

// Runs one task to completion, delivering 10 at its single suspension.
function stepTask(instance, fn, handle) {
  const exports = instance.exports;
  const memory = exports.memory;
  const status = exports[`__async_async_nested_closure_${fn}_status`];
  const result = exports[`__async_async_nested_closure_${fn}_result`];
  const error = exports[`__async_async_nested_closure_${fn}_error`];
  while (true) {
    const st = status(handle);
    if (st == -1) return result(handle);
    if (st == -2) throw new Error(`task ${fn} failed: ` + getString(memory, error(handle)));
    if (st <= 0) throw new Error(`task ${fn}: unexpected status ` + st);
    const site = st - 1;
    const resume = exports[`__async_async_nested_closure_${fn}_resume_${site}`];
    const rc = resume(handle, 10);
    if (rc != 0 && rc != 1) throw new Error(`task ${fn}: unexpected step return ` + rc);
  }
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  // nestedParam: outer(1) = 11, + 10.
  const nestedParam = stepTask(instance, "nestedParam", exports.nestedParam());
  if (nestedParam !== 21) throw new Error("nestedParam must be 21, got " + nestedParam);
  // nestedMixed: outer(1) = 111, + 10.
  const nestedMixed = stepTask(instance, "nestedMixed", exports.nestedMixed());
  if (nestedMixed !== 121) throw new Error("nestedMixed must be 121, got " + nestedMixed);
  // nestedMixedLocal: outer(2) = 1017, + 10.
  const nestedMixedLocal = stepTask(instance, "nestedMixedLocal", exports.nestedMixedLocal());
  if (nestedMixedLocal !== 1027) throw new Error("nestedMixedLocal must be 1027, got " + nestedMixedLocal);
}
