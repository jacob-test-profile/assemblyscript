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
  imports.env.getNum = function(i) {
    return 0; // suspended; the glue delivers via the resume export
  };
  imports.env.log = function(p) {
    log.push(getString(p));
  };
}

// Drives one string-returning async call to completion: `values` is the
// queue of chunkString indices delivered to each suspending site.
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

function expectLogs(want, label) {
  const got = log.join(",");
  if (got !== want) throw new Error(label + ": wrong log: " + got + " (want " + want + ")");
  log.length = 0;
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;

  let r = drive(exports, "__async_async_try_in_switch_f", "f", [1], [0]);
  if (r.failed || r.value !== "t-A") throw new Error("f(1): " + JSON.stringify(r));
  expectLogs("t-finally", "f(1)");

  r = drive(exports, "__async_async_try_in_switch_f", "f", [2], [0]);
  if (r.failed || r.value !== "sw-caught:sw-boom") throw new Error("f(2): " + JSON.stringify(r));

  r = drive(exports, "__async_async_try_in_switch_f", "f", [9], []);
  if (r.failed || r.value !== "sw-dflt") throw new Error("f(9) default: " + JSON.stringify(r));

  // g(): site 0 awaits getNum (i32), site 1 awaits getChunk (string).
  {
    const base = "__async_async_try_in_switch_g";
    const handle = exports.g();
    const status = exports[base + "_status"];
    const result = exports[base + "_result"];
    const error = exports[base + "_error"];
    let st = status(handle);
    if (st != 1) throw new Error("g(): expected site 0, got status " + st);
    let rc = exports[base + "_resume_0"](handle, 1);
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("g(): unexpected step return " + rc);
    st = status(handle);
    if (st != 2) throw new Error("g(): expected site 1, got status " + st);
    rc = exports[base + "_resume_1"](handle, exports.chunkString(0));
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("g(): unexpected step return " + rc);
    st = status(handle);
    if (st != -1) throw new Error("g(): expected completion, got status " + st);
    if (getString(result(handle)) !== "A") throw new Error("g(): wrong result");
    if (getString(error(handle)) !== "") throw new Error("g(): unexpected error");
  }

  r = drive(exports, "__async_async_try_in_switch_retInTryInSwitch", "retInTryInSwitch", [1], [0]);
  if (r.failed || r.value !== "A") throw new Error("retInTryInSwitch(1): " + JSON.stringify(r));

  r = drive(exports, "__async_async_try_in_switch_retInTryInSwitch", "retInTryInSwitch", [9], []);
  if (r.failed || r.value !== "d") throw new Error("retInTryInSwitch(9): " + JSON.stringify(r));
}
