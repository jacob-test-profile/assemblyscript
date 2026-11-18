const log = [];

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
  log.length = 0;
  imports.env.getChunk = function(i) {
    log.push(i);
    return 0; // suspended; the coordinator delivers via the resume export
  };
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  const memory = exports.memory;
  const handle = exports.concatThree();
  const status = exports.__async_async_loop_concatThree_status;
  const resume = exports.__async_async_loop_concatThree_resume_0;
  const result = exports.__async_async_loop_concatThree_result;
  const error = exports.__async_async_loop_concatThree_error;
  let i = 0;
  while (true) {
    const st = status(handle);
    if (st == -1) break;
    if (st == -2) throw new Error("task failed: " + getString(memory, error(handle)));
    if (st <= 0) throw new Error("unexpected status " + st);
    const site = st - 1;
    if (site != 0) throw new Error("unexpected pending site " + site);
    const rc = resume(handle, exports.chunkString(i));
    if (rc != 0 && rc != 1) throw new Error("unexpected step return " + rc);
    i++;
    if (i > 10) throw new Error("loop guard");
  }
  const out = getString(memory, result(handle));
  if (out !== "AAABBBCCC") throw new Error("wrong result: " + out);
  if (log.join(",") !== "0,1,2") throw new Error("wrong issue order: " + log.join(","));
}
