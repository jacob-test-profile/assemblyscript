function getString(memory, ptr) {
  const RUNTIME_HEADER_SIZE = 16;
  if (!ptr) return "null";
  const U32 = new Uint32Array(memory.buffer);
  const U16 = new Uint16Array(memory.buffer);
  const len16 = U32[(ptr - RUNTIME_HEADER_SIZE + 12) >>> 2] >>> 1;
  const ptr16 = ptr >>> 1;
  return String.fromCharCode.apply(String, U16.subarray(ptr16, ptr16 + len16));
}

const BASE = "async_static_method";

// Outer site -> inner qual for the nested sites in this fixture:
// viaInstance awaits c.add(...) at its site 0.
const NESTED = {
  "Counter_viaInstance:0": "Counter_add"
};

export function preInstantiate(imports, exports) {
  imports.env.getNumber = function() {
    return 0; // suspended; the driver delivers via the resume export
  };
}

// Drives one task to completion, delivering 100 at every import site and
// recursing into nested tasks via the pending export, delivering the
// inner result to the outer resume.
function driveTask(instance, handle, qual) {
  const exports = instance.exports;
  const memory = exports.memory;
  const status = exports[`__async_${BASE}_${qual}_status`];
  const result = exports[`__async_${BASE}_${qual}_result`];
  const error = exports[`__async_${BASE}_${qual}_error`];
  while (true) {
    const st = status(handle);
    if (st == -1) break;
    if (st == -2) throw new Error(`task ${qual} failed: ` + getString(memory, error(handle)));
    if (st <= 0) throw new Error(`task ${qual}: unexpected status ` + st);
    const site = st - 1;
    const pending = exports[`__async_${BASE}_${qual}_pending_${site}`];
    const resume = exports[`__async_${BASE}_${qual}_resume_${site}`];
    let rc;
    if (pending) {
      const innerHandle = pending(handle);
      const innerQual = NESTED[qual + ":" + site];
      if (!innerQual) throw new Error(`task ${qual}: unknown nested site ` + site);
      const innerResult = driveTask(instance, innerHandle, innerQual);
      rc = resume(handle, innerResult);
    } else {
      rc = resume(handle, 100);
    }
    if (rc != 0 && rc != 1) throw new Error(`task ${qual}: unexpected step return ` + rc);
  }
  return result(handle);
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  // create(0): 0 + the delivered 100, into static total.
  if (driveTask(instance, exports.startCreate(), "Counter_create") !== 100) throw new Error("create must be 100");
  // viaInstance(0): a fresh Counter's add(0), 0 + the delivered 100.
  if (driveTask(instance, exports.startViaInstance(), "Counter_viaInstance") !== 100) throw new Error("viaInstance must be 100");
}
