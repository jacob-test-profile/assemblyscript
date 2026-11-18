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

// Drives one async call to completion: `values` is the queue of
// chunkString indices delivered to each suspending site, in order;
// `rejectAt` rejects the site with that index (1-based count) instead.
function drive(exports, base, fn, args, values, rejectAt = -1) {
  const handle = exports[fn](...args);
  const status = exports[base + "_status"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  let next = 0;
  while (true) {
    if (++guard > 20) throw new Error("loop guard");
    const st = status(handle);
    if (st == -1) return { failed: false, value: getString(result(handle)) };
    if (st == -2) return { failed: true, value: getString(error(handle)) };
    if (st <= 0) throw new Error("unexpected status " + st);
    const site = st - 1;
    if (next + 1 == rejectAt) {
      const reject = exports[base + "_reject_" + site];
      if (!reject) throw new Error("missing reject export for site " + site);
      const rc = reject(handle, exports.errString());
      if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected step return " + rc);
      next++;
      continue;
    }
    const resume = exports[base + "_resume_" + site];
    if (!resume) throw new Error("missing resume export for site " + site);
    const rc = resume(handle, exports.chunkString(values[next++]));
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected step return " + rc);
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

  let r = drive(exports, "__async_async_try_finally_await_f", "f", [0], [0, 1]);
  if (r.failed || r.value !== "ok-A") throw new Error("f(0): " + JSON.stringify(r));
  expectLogs("finally-B", "f(0)");

  r = drive(exports, "__async_async_try_finally_await_f", "f", [1], [0, 1]);
  if (r.failed || r.value !== "caught") throw new Error("f(1): " + JSON.stringify(r));
  expectLogs("catch:body-boom,finally-B", "f(1)");

  // The finally await rejects: the rejection replaces the pending body
  // error and lands in the outer catch.
  r = drive(exports, "__async_async_try_finally_await_h", "h", [], [], 1);
  if (r.failed || r.value !== "outer-caught:fin-boom") throw new Error("h(): " + JSON.stringify(r));
}
