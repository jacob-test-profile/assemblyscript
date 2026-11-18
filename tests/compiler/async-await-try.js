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

function drive(exports, fn, mode) {
  const base = `__async_async_await_try_${fn}`;
  const handle = exports[fn](mode);
  const status = exports[base + "_status"];
  const resume = exports[base + "_resume_0"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  while (true) {
    if (++guard > 10) throw new Error("loop guard");
    const st = status(handle);
    if (st == -1) return { failed: false, value: getString(result(handle)) };
    if (st == -2) return { failed: true, value: getString(error(handle)) };
    if (st <= 0) throw new Error("unexpected status " + st);
    const rc = resume(handle, exports.chunkString(0));
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

  let r = drive(exports, "f", 0);
  if (r.failed || r.value !== "ok-A") throw new Error("f(0): " + JSON.stringify(r));
  expectLogs("finally", "f(0)");

  r = drive(exports, "f", 1);
  if (r.failed || r.value !== "caught") throw new Error("f(1): " + JSON.stringify(r));
  expectLogs("catch:async-boom,finally", "f(1)");

  r = drive(exports, "g", 0);
  if (r.failed || r.value !== "ok-A") throw new Error("g(0): " + JSON.stringify(r));
  expectLogs("finally", "g(0)");

  r = drive(exports, "g", 2);
  if (r.failed || r.value !== "caught") throw new Error("g(2): " + JSON.stringify(r));
  expectLogs("catch:sync-boom,finally", "g(2)");
}
