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
    return 0; // suspended; the driver delivers via the resume export
  };
  imports.env.log = function(p) {
    log.push(getString(p));
  };
}

// Inner task qualified name per outer task and nested site, mirroring the
// coordinator's inners map keyed by qualName (`Class_method`).
const INNER = {
  "viaObj": ["W_helper"],
  "viaNew": ["W_helper"],
  "viaObjGuarded": ["W_helper"],
  "W_viaThis": ["W_helper"],
  "W_viaNested": ["W_viaThis"]
};

// Drives one task to completion. `mode` is "deliver" (import sites get 10)
// or "reject" (import sites are rejected with `rejectMessage()`). A nested
// site fetches the inner handle from the pending export, drives the inner
// task recursively, and delivers its result to the outer resume export —
// or its failure to the outer reject export, like the coordinator does.
function driveTask(instance, qual, handle, mode) {
  const exports = instance.exports;
  const base = `__async_async_member_await_${qual}`;
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
    const rc = resume(handle, 10);
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

  // await this.helper(): 5 + 10, accumulated into total.
  let r = driveTask(instance, "W_viaThis", exports.startViaThis(), "deliver");
  if (r.failed || r.value !== 15) throw new Error("viaThis: " + JSON.stringify(r));

  // Nested method -> method -> import: (5 + 10) + 1.
  r = driveTask(instance, "W_viaNested", exports.startViaNested(), "deliver");
  if (r.failed || r.value !== 16) throw new Error("viaNested: " + JSON.stringify(r));

  // await obj.method(): 7 + 10.
  r = driveTask(instance, "viaObj", exports.startViaObj(7), "deliver");
  if (r.failed || r.value !== 17) throw new Error("viaObj: " + JSON.stringify(r));

  // await new W().helper(): 7 + 10.
  r = driveTask(instance, "viaNew", exports.startViaNew(7), "deliver");
  if (r.failed || r.value !== 17) throw new Error("viaNew: " + JSON.stringify(r));

  // try/catch around a member await, inner succeeds: 7 + 10.
  r = driveTask(instance, "viaObjGuarded", exports.startViaObjGuarded(7), "deliver");
  if (r.failed || r.value !== 17) throw new Error("viaObjGuarded deliver: " + JSON.stringify(r));
  expectLogs("", "viaObjGuarded deliver");

  // Same, inner fails: the failure reaches the outer catch, which logs
  // and returns -1.
  r = driveTask(instance, "viaObjGuarded", exports.startViaObjGuarded(7), "reject");
  if (r.failed || r.value !== -1) throw new Error("viaObjGuarded reject: " + JSON.stringify(r));
  expectLogs("catch:inner-boom", "viaObjGuarded reject");
}
