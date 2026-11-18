const log = [];
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
  log.length = 0;
  memory = imports.env.memory;
  imports.env.getChunk = function(i) {
    return 0; // suspended; the glue delivers via the resume export
  };
  imports.env.log = function(p) {
    log.push(getString(p));
  };
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;
  const base = "__async_async_try_trap_trap";
  const handle = exports.trap();
  const status = exports[base + "_status"];
  const resume = exports[base + "_resume_0"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  while (true) {
    if (++guard > 10) throw new Error("loop guard");
    const st = status(handle);
    if (st == -1) throw new Error("task completed instead of trapping: " + getString(result(handle)));
    if (st == -2) throw new Error("task failed instead of trapping: " + getString(error(handle)));
    if (st <= 0) throw new Error("unexpected status " + st);
    // Resuming past the await runs boom(), which traps. The trap must
    // escape the resume call: the catch must not swallow it.
    let trapped = false;
    try {
      resume(handle, exports.chunkString(0));
    } catch (e) {
      trapped = true;
    }
    if (!trapped) throw new Error("resume did not trap");
    if (log.length !== 0) throw new Error("finally ran on trap: " + log.join(","));
    return;
  }
}
