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

// Runs one task to completion. `deliver` provides the value for each
// suspension: a plain value, or the result of driving a nested task.
function stepTask(instance, fn, handle, deliver) {
  const exports = instance.exports;
  const memory = exports.memory;
  const status = exports[`__async_async_arrow_${fn}_status`];
  const result = exports[`__async_async_arrow_${fn}_result`];
  const error = exports[`__async_async_arrow_${fn}_error`];
  while (true) {
    const st = status(handle);
    if (st == -1) return result(handle);
    if (st == -2) throw new Error(`task ${fn} failed: ` + getString(memory, error(handle)));
    if (st <= 0) throw new Error(`task ${fn}: unexpected status ` + st);
    const site = st - 1;
    const resume = exports[`__async_async_arrow_${fn}_resume_${site}`];
    const value = deliver(site, handle);
    const rc = resume(handle, value);
    if (rc != 0 && rc != 1) throw new Error(`task ${fn}: unexpected step return ` + rc);
  }
}

// Drives an outer task whose site 0 awaits a nested async arrow: fetch
// the inner handle from the pending export, drive the inner task (which
// delivers 10 at its own suspension), and resume the outer with its result.
function driveNested(instance, outerFn, innerFn, handle) {
  return stepTask(instance, outerFn, handle, (site, outerHandle) => {
    if (site != 0) throw new Error(`task ${outerFn}: unexpected site ` + site);
    const exports = instance.exports;
    const pending = exports[`__async_async_arrow_${outerFn}_pending_0`];
    const innerHandle = pending(outerHandle);
    return stepTask(instance, innerFn, innerHandle, () => 10);
  });
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  // arrowed: (10 + 1) + 1.
  const arrowed = driveNested(instance, "arrowed", "__async_arrow_arrowed_0", exports.arrowed());
  if (arrowed !== 12) throw new Error("arrowed must be 12, got " + arrowed);
  // Worker.run: 5 + 10, through the receiver.
  const run = driveNested(instance, "Worker_run", "__async_arrow_Worker_run_0", exports.startWorker());
  if (run !== 15) throw new Error("Worker.run must be 15, got " + run);
  // Holder.fetch: 10 + 2, through the field arrow.
  const fetch = driveNested(instance, "Holder_fetch", "__async_arrow_Holder_getValue_0", exports.startHolderFetch());
  if (fetch !== 12) throw new Error("Holder.fetch must be 12, got " + fetch);
}
