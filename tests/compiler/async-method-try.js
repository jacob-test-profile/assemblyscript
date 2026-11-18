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
  imports.env.getNumber = function() {
    return 0; // suspended; the driver resumes or rejects via the exports
  };
  imports.env.log = function(p) {
    log.push(getString(p));
  };
}

// Drives one method task: resumes its single await with 100, or rejects
// it with the fixture's message when `reject` is true.
function driveMethod(instance, startFn, qual, reject) {
  const exports = instance.exports;
  const handle = exports[startFn]();
  const base = `__async_async_method_try_${qual}`;
  const status = exports[base + "_status"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  while (true) {
    if (++guard > 10) throw new Error("loop guard");
    const st = status(handle);
    if (st == -1) return { failed: false, value: result(handle) };
    if (st == -2) return { failed: true, value: getString(error(handle)) };
    if (st <= 0) throw new Error("unexpected status " + st);
    if (st - 1 != 0) throw new Error("unexpected pending site " + (st - 1));
    if (reject) {
      const rc = exports[base + "_reject_0"](handle, exports.rejectMessage());
      if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected reject return " + rc);
    } else {
      const rc = exports[base + "_resume_0"](handle, 100);
      if (rc != 0 && rc != 1) throw new Error("unexpected resume return " + rc);
    }
  }
}

function expectLogs(want, label) {
  const got = log.join(",");
  if (got !== want) throw new Error(label + ": wrong log: " + got + " (want " + want + ")");
  log.length = 0;
}

export async function postInstantiate(instance) {
  memory = instance.exports.memory;

  // guarded success: 0 + 100, finally once, no catch.
  let r = driveMethod(instance, "startGuarded", "Worker_guarded", false);
  if (r.failed || r.value !== 100) throw new Error("guarded resume: " + JSON.stringify(r));
  expectLogs("finally", "guarded resume");

  // guarded rejection: catch returns -1, finally once.
  r = driveMethod(instance, "startGuarded", "Worker_guarded", true);
  if (r.failed || r.value !== -1) throw new Error("guarded reject: " + JSON.stringify(r));
  expectLogs("catch:coord-boom,finally", "guarded reject");

  // guardedFinally success: 0 + 100, finally exactly once (never on suspend).
  r = driveMethod(instance, "startGuardedFinally", "Worker_guardedFinally", false);
  if (r.failed || r.value !== 100) throw new Error("guardedFinally resume: " + JSON.stringify(r));
  expectLogs("finally", "guardedFinally resume");

  // guardedFinally rejection: no catch, task fails, finally exactly once.
  r = driveMethod(instance, "startGuardedFinally", "Worker_guardedFinally", true);
  if (!r.failed || r.value !== "coord-boom") throw new Error("guardedFinally reject: " + JSON.stringify(r));
  expectLogs("finally", "guardedFinally reject");
}
