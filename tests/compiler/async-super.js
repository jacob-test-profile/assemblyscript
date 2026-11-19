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
  const status = exports[`__async_async_super_${fn}_status`];
  const result = exports[`__async_async_super_${fn}_result`];
  const error = exports[`__async_async_super_${fn}_error`];
  while (true) {
    const st = status(handle);
    if (st == -1) return result(handle);
    if (st == -2) throw new Error(`task ${fn} failed: ` + getString(memory, error(handle)));
    if (st <= 0) throw new Error(`task ${fn}: unexpected status ` + st);
    const site = st - 1;
    const resume = exports[`__async_async_super_${fn}_resume_${site}`];
    const value = deliver(site, handle);
    const rc = resume(handle, value);
    if (rc != 0 && rc != 1) throw new Error(`task ${fn}: unexpected step return ` + rc);
  }
}

// Drives one method task to completion, delivering 10 at its suspension.
function driveMethod(instance, startFn, qual) {
  return stepTask(instance, qual, instance.exports[startFn](), () => 10);
}

// Drives a method task whose site 0 awaits a nested async arrow: fetch
// the inner handle from the pending export, drive the inner task (which
// delivers 10 at its own suspension), and resume the outer with its result.
function driveNested(instance, startFn, outerFn, innerFn) {
  return stepTask(instance, outerFn, instance.exports[startFn](), (site, outerHandle) => {
    if (site != 0) throw new Error(`task ${outerFn}: unexpected site ` + site);
    const pending = instance.exports[`__async_async_super_${outerFn}_pending_0`];
    const innerHandle = pending(outerHandle);
    return stepTask(instance, innerFn, innerHandle, () => 10);
  });
}

export async function postInstantiate(instance) {
  // superCall: super.foo() is Base's 2, not Child's override 3.
  if (driveMethod(instance, "startSuperCall", "Child_superCall") !== 12) throw new Error("superCall must be 12");
  // superField: super.n set to 30, then read back.
  if (driveMethod(instance, "startSuperField", "Child_superField") !== 40) throw new Error("superField must be 40");
  // superAccessor: before is Base's 10, super.v is 5 after the Base setter.
  if (driveMethod(instance, "startSuperAccessor", "Child_superAccessor") !== 1015) throw new Error("superAccessor must be 1015");
  // superInClosure: super.foo() is 2 inside the lifted closure.
  if (driveMethod(instance, "startSuperInClosure", "Child_superInClosure") !== 12) throw new Error("superInClosure must be 12");
  // superInArrow: super.foo() is 2 inside the extracted arrow.
  if (driveNested(instance, "startSuperInArrow", "Child_superInArrow", "__async_arrow_Child_superInArrow_0") !== 12) throw new Error("superInArrow must be 12");
  // superInherited: super.bar() is Base's 200 (grandparent-declared).
  if (driveMethod(instance, "startSuperInherited", "Child_superInherited") !== 210) throw new Error("superInherited must be 210");
  // superCompound: super.v is 10, += 2 gives 12, ++ gives 13.
  if (driveMethod(instance, "startSuperCompound", "Child_superCompound") !== 23) throw new Error("superCompound must be 23");
}
