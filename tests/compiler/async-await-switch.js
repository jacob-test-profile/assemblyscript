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
}

// Drives one async call to completion: `values` is the queue of
// chunkString indices delivered to each suspending site, in order.
function drive(exports, base, fn, args, values) {
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
    const resume = exports[base + "_resume_" + site];
    if (!resume) throw new Error("missing resume export for site " + site);
    const rc = resume(handle, exports.chunkString(values[next++]));
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected step return " + rc);
  }
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;

  let r = drive(exports, "__async_async_await_switch_f", "f", [1], [0]);
  if (r.failed || r.value !== "AAA") throw new Error("f(1): " + JSON.stringify(r));

  r = drive(exports, "__async_async_await_switch_f", "f", [2], [1, 2]);
  if (r.failed || r.value !== "BBBCCC") throw new Error("f(2) fallthrough: " + JSON.stringify(r));

  r = drive(exports, "__async_async_await_switch_f", "f", [3], [2]);
  if (r.failed || r.value !== "CCC") throw new Error("f(3): " + JSON.stringify(r));

  r = drive(exports, "__async_async_await_switch_f", "f", [9], []);
  if (r.failed || r.value !== "dflt") throw new Error("f(9) default: " + JSON.stringify(r));

  r = drive(exports, "__async_async_await_switch_g", "g", [exports.oneString()], [0]);
  if (r.failed || r.value !== "AAA") throw new Error("g(one): " + JSON.stringify(r));

  r = drive(exports, "__async_async_await_switch_g", "g", [exports.twoString()], []);
  if (r.failed || r.value !== "two") throw new Error("g(two): " + JSON.stringify(r));

  r = drive(exports, "__async_async_await_switch_g", "g", [exports.otherString()], []);
  if (r.failed || r.value !== "other") throw new Error("g(other): " + JSON.stringify(r));

  r = drive(exports, "__async_async_await_switch_h", "h", [], [2]);
  if (r.failed || r.value !== "xCCCx") throw new Error("h() switch in loop: " + JSON.stringify(r));
}
