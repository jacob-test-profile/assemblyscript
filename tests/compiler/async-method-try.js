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

// Inner task qualified name per outer task and nested site, mirroring the
// coordinator's inners map keyed by qualName (`Class_method`).
const INNER = {
  "Worker_guardedNested": ["Worker_helper"]
};

// Drives one task to completion. `mode` is "deliver" (import sites get
// 100) or "reject" (import sites are rejected with `rejectMessage()`). A
// nested site fetches the inner handle from the pending export, drives
// the inner task recursively, and delivers its result to the outer resume
// export — or its failure to the outer reject export, like the
// coordinator does.
function driveTask(instance, qual, handle, mode) {
  const exports = instance.exports;
  const base = `__async_async_method_try_${qual}`;
  const status = exports[base + "_status"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  while (true) {
    if (++guard > 20) throw new Error(`task ${qual}: loop guard`);
    const st = status(handle);
    if (st == -1) return { failed: false, value: result(handle) };
    if (st == -2) return { failed: true, errorPtr: error(handle) };
    if (st <= 0) throw new Error(`task ${qual}: unexpected status ` + st);
    const site = st - 1;
    const pending = exports[base + `_pending_${site}`];
    if (pending) {
      const innerQual = (INNER[qual] || [])[site];
      if (!innerQual) throw new Error(`task ${qual}: unexpected nested site ` + site);
      const inner = driveTask(instance, innerQual, pending(handle), mode);
      if (inner.failed) {
        const reject = exports[base + `_reject_${site}`];
        const rc = reject(handle, inner.errorPtr);
        if (rc != 0 && rc != 1 && rc != 2) throw new Error(`task ${qual}: unexpected reject return ` + rc);
        continue;
      }
      const resume = exports[base + `_resume_${site}`];
      const rc = resume(handle, inner.value);
      if (rc != 0 && rc != 1) throw new Error(`task ${qual}: unexpected step return ` + rc);
      continue;
    }
    if (mode == "reject") {
      const reject = exports[base + `_reject_${site}`];
      const rc = reject(handle, exports.rejectMessage());
      if (rc != 0 && rc != 1 && rc != 2) throw new Error(`task ${qual}: unexpected reject return ` + rc);
      continue;
    }
    const resume = exports[base + `_resume_${site}`];
    const rc = resume(handle, 100);
    if (rc != 0 && rc != 1) throw new Error(`task ${qual}: unexpected step return ` + rc);
  }
}

function expectLogs(want, label) {
  const got = log.join(",");
  if (got !== want) throw new Error(label + ": wrong log: " + got + " (want " + want + ")");
  log.length = 0;
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;

  // guarded success: 0 + 100, finally once, no catch.
  let r = driveTask(instance, "Worker_guarded", exports.startGuarded(), "deliver");
  if (r.failed || r.value !== 100) throw new Error("guarded resume: " + JSON.stringify(r));
  expectLogs("finally", "guarded resume");

  // guarded rejection: catch returns -1, finally once.
  r = driveTask(instance, "Worker_guarded", exports.startGuarded(), "reject");
  if (r.failed || r.value !== -1) throw new Error("guarded reject: " + JSON.stringify(r));
  expectLogs("catch:coord-boom,finally", "guarded reject");

  // guardedFinally success: 0 + 100, finally exactly once (never on suspend).
  r = driveTask(instance, "Worker_guardedFinally", exports.startGuardedFinally(), "deliver");
  if (r.failed || r.value !== 100) throw new Error("guardedFinally resume: " + JSON.stringify(r));
  expectLogs("finally", "guardedFinally resume");

  // guardedFinally rejection: no catch, task fails, finally exactly once.
  r = driveTask(instance, "Worker_guardedFinally", exports.startGuardedFinally(), "reject");
  if (!r.failed || getString(r.errorPtr) !== "coord-boom") throw new Error("guardedFinally reject: " + JSON.stringify(r));
  expectLogs("finally", "guardedFinally reject");

  // guardedNested deliver: helper(5) = 5 + 100, count 105, finally once.
  r = driveTask(instance, "Worker_guardedNested", exports.startGuardedNested(), "deliver");
  if (r.failed || r.value !== 105) throw new Error("guardedNested deliver: " + JSON.stringify(r));
  expectLogs("finally", "guardedNested deliver");

  // guardedNested reject: inner failure reaches the method catch, -1.
  r = driveTask(instance, "Worker_guardedNested", exports.startGuardedNested(), "reject");
  if (r.failed || r.value !== -1) throw new Error("guardedNested reject: " + JSON.stringify(r));
  expectLogs("catch:coord-boom,finally", "guardedNested reject");
}
