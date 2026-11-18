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

// Drives one method task to completion, delivering 100 at its suspension.
function driveMethod(instance, startFn, qual) {
  const exports = instance.exports;
  const memory = exports.memory;
  const handle = exports[startFn]();
  const status = exports[`__async_async_method_${qual}_status`];
  const result = exports[`__async_async_method_${qual}_result`];
  const error = exports[`__async_async_method_${qual}_error`];
  while (true) {
    const st = status(handle);
    if (st == -1) break;
    if (st == -2) throw new Error(`task ${qual} failed: ` + getString(memory, error(handle)));
    if (st <= 0) throw new Error(`task ${qual}: unexpected status ` + st);
    const site = st - 1;
    const resume = exports[`__async_async_method_${qual}_resume_${site}`];
    const rc = resume(handle, 100);
    if (rc != 0 && rc != 1) throw new Error(`task ${qual}: unexpected step return ` + rc);
  }
  return result(handle);
}

export async function postInstantiate(instance) {
  // add(0): 0, plus the delivered 100.
  if (driveMethod(instance, "startAdd", "Counter_add") !== 100) throw new Error("add must be 100");
  // viaArrow(0): 4 + 100, the probe-D arithmetic.
  if (driveMethod(instance, "startViaArrow", "Counter_viaArrow") !== 104) throw new Error("viaArrow must be 104");
}
