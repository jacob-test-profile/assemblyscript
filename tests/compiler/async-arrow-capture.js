function getString(memory, ptr) {
  const RUNTIME_HEADER_SIZE = 16;
  if (!ptr) return "null";
  const U32 = new Uint32Array(memory.buffer);
  const U16 = new Uint16Array(memory.buffer);
  const len16 = U32[(ptr - RUNTIME_HEADER_SIZE + 12) >>> 2] >>> 1;
  const ptr16 = ptr >>> 1;
  return String.fromCharCode.apply(String, U16.subarray(ptr16, ptr16 + len16));
}

const sentinel = { tag: "handle" };
let seenHandle = null;

export function preInstantiate(imports, exports) {
  imports.env.getNumber = function() {
    return 0; // suspended; the driver delivers via the resume export
  };
  imports.env.getHandle = function() {
    return 0; // suspended
  };
  imports.env.useHandle = function(h) {
    seenHandle = h;
    return 0; // suspended
  };
}

// Runs one task to completion. `deliver` provides the value for each
// suspension: a plain value, or the result of driving a nested task.
function stepTask(instance, fn, handle, deliver) {
  const exports = instance.exports;
  const memory = exports.memory;
  const status = exports[`__async_async_arrow_capture_${fn}_status`];
  const result = exports[`__async_async_arrow_capture_${fn}_result`];
  const error = exports[`__async_async_arrow_capture_${fn}_error`];
  while (true) {
    const st = status(handle);
    if (st == -1) return result(handle);
    if (st == -2) throw new Error(`task ${fn} failed: ` + getString(memory, error(handle)));
    if (st <= 0) throw new Error(`task ${fn}: unexpected status ` + st);
    const site = st - 1;
    const resume = exports[`__async_async_arrow_capture_${fn}_resume_${site}`];
    const value = deliver(site, handle);
    const rc = resume(handle, value);
    if (rc != 0 && rc != 1) throw new Error(`task ${fn}: unexpected step return ` + rc);
  }
}

// Drives an outer task whose site 0 awaits a nested async arrow: fetch
// the inner handle from the pending export, drive the inner task, and
// resume the outer with its result.
function driveNested(instance, outerFn, innerFn, handle, innerDeliver) {
  return stepTask(instance, outerFn, handle, (site, outerHandle) => {
    if (site != 0) throw new Error(`task ${outerFn}: unexpected site ` + site);
    const exports = instance.exports;
    const pending = exports[`__async_async_arrow_capture_${outerFn}_pending_0`];
    const innerHandle = pending(outerHandle);
    return stepTask(instance, innerFn, innerHandle, innerDeliver);
  });
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  // arrowCapture: (1 + 10) + 1.
  const capture = driveNested(instance, "arrowCapture", "__async_arrow_arrowCapture_0", exports.arrowCapture(), () => 10);
  if (capture !== 12) throw new Error("arrowCapture must be 12, got " + capture);
  // arrowCaptureWrite: (10+5)+10=25, + x=15 = 40.
  const write = driveNested(instance, "arrowCaptureWrite", "__async_arrow_arrowCaptureWrite_0", exports.arrowCaptureWrite(), () => 10);
  if (write !== 40) throw new Error("arrowCaptureWrite must be 40, got " + write);
  // arrowCaptureShadow: 1000 + 10.
  const shadow = driveNested(instance, "arrowCaptureShadow", "__async_arrow_arrowCaptureShadow_0", exports.arrowCaptureShadow(), () => 10);
  if (shadow !== 1010) throw new Error("arrowCaptureShadow must be 1010, got " + shadow);
  // arrowCallsArrow: g = 2+10=12, f = 12+1=13.
  const callsArrow = driveNested(instance, "arrowCallsArrow", "__async_arrow_arrowCallsArrow_1", exports.arrowCallsArrow(), (site, fHandle) => {
    if (site != 0) throw new Error("arrowCallsArrow f: unexpected site " + site);
    const pending = exports[`__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_pending_0`];
    const gHandle = pending(fHandle);
    return stepTask(instance, "__async_arrow_arrowCallsArrow_0", gHandle, () => 10);
  });
  if (callsArrow !== 13) throw new Error("arrowCallsArrow must be 13, got " + callsArrow);
  // ArrowHolder.run: 7 + 3 + 10.
  const run = driveNested(instance, "ArrowHolder_run", "__async_arrow_ArrowHolder_run_0", exports.startHolderRun(), () => 10);
  if (run !== 20) throw new Error("ArrowHolder.run must be 20, got " + run);
  // arrowCaptureExtern: useHandle=40 + 10.
  seenHandle = null;
  const extern = stepTask(instance, "arrowCaptureExtern", exports.arrowCaptureExtern(), (site, handle) => {
    if (site == 0) return sentinel;
    if (site != 1) throw new Error("arrowCaptureExtern: unexpected site " + site);
    const pending = exports[`__async_async_arrow_capture_arrowCaptureExtern_pending_1`];
    const innerHandle = pending(handle);
    return stepTask(instance, "__async_arrow_arrowCaptureExtern_0", innerHandle, (innerSite) => {
      if (innerSite == 0) return 10;
      if (innerSite != 1) throw new Error("arrowCaptureExtern arrow: unexpected site " + innerSite);
      if (seenHandle !== sentinel) throw new Error("externref identity lost across await");
      return 40;
    });
  });
  if (extern !== 50) throw new Error("arrowCaptureExtern must be 50, got " + extern);
}
