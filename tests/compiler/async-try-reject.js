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
    return 0; // suspended; the glue rejects via the reject export
  };
  imports.env.log = function(p) {
    log.push(getString(p));
  };
}

function driveReject(exports, fn, message) {
  const base = `__async_async_try_reject_${fn}`;
  const handle = exports[fn](0);
  const status = exports[base + "_status"];
  const reject = exports[base + "_reject_0"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  while (true) {
    if (++guard > 10) throw new Error("loop guard");
    const st = status(handle);
    if (st == -1) return { failed: false, value: getString(result(handle)) };
    if (st == -2) return { failed: true, value: getString(error(handle)) };
    if (st <= 0) throw new Error("unexpected status " + st);
    if (st - 1 != 0) throw new Error("unexpected pending site " + (st - 1));
    const rc = reject(handle, exports.rejectMessage());
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected reject return " + rc);
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

  let r = driveReject(exports, "f", "coord-boom");
  if (r.failed || r.value !== "caught") throw new Error("f reject: " + JSON.stringify(r));
  expectLogs("catch:coord-boom,finally", "f reject");

  r = driveReject(exports, "g", "coord-boom");
  if (!r.failed || r.value !== "coord-boom") throw new Error("g reject: " + JSON.stringify(r));
  expectLogs("finally", "g reject");
}
