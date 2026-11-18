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

function drive(exports, fn, mode, values) {
  const base = `__async_async_try_nested_${fn}`;
  const handle = exports[fn](mode);
  const status = exports[base + "_status"];
  const resume = exports[base + "_resume_0"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let vi = 0, guard = 0;
  while (true) {
    if (++guard > 10) throw new Error("loop guard");
    const st = status(handle);
    if (st == -1) return { failed: false, value: getString(result(handle)) };
    if (st == -2) return { failed: true, value: getString(error(handle)) };
    if (st <= 0) throw new Error("unexpected status " + st);
    const rc = resume(handle, exports.chunkString(vi++));
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected step return " + rc);
  }
}

function expectLogs(want, label) {
  const got = log.join(",");
  if (got !== want) throw new Error(label + ": wrong log: " + got + " (want " + want + ")");
  log.length = 0;
}

function expect(r, failed, value, label) {
  if (r.failed !== failed || r.value !== value) throw new Error(label + ": " + JSON.stringify(r) + " (want failed=" + failed + " value=" + value + ")");
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;

  expect(drive(exports, "nested", 0), false, "in-A", "nested(0)");
  expectLogs("inner-finally,outer-finally", "nested(0)");

  expect(drive(exports, "nested", 1), false, "inner-caught", "nested(1)");
  expectLogs("inner-catch:inner-boom,inner-finally,outer-finally", "nested(1)");

  expect(drive(exports, "nested", 2), false, "outer-caught", "nested(2)");
  expectLogs("inner-catch:inner-boom,inner-finally,outer-catch:rethrow,outer-finally", "nested(2)");

  expect(drive(exports, "inLoop", 0), false, "done-ABC", "inLoop(0)");
  expectLogs("fin-0,fin-1,fin-2", "inLoop(0)");

  expect(drive(exports, "inLoop", 1), false, "done-AB", "inLoop(1)");
  expectLogs("fin-0,fin-1", "inLoop(1)");

  expect(drive(exports, "inLoop", 2), false, "done-ABC", "inLoop(2)");
  expectLogs("fin-0,fin-1,fin-2", "inLoop(2)");

  expect(drive(exports, "inLoop", 3), false, "early-AB", "inLoop(3)");
  expectLogs("fin-0,fin-1", "inLoop(3)");

  expect(drive(exports, "noCatch", 0), false, "ok-A", "noCatch(0)");
  expectLogs("nc-finally", "noCatch(0)");

  expect(drive(exports, "noCatch", 1), true, "nocatch-boom", "noCatch(1)");
  expectLogs("nc-finally", "noCatch(1)");

  expect(drive(exports, "finThrow", 0), false, "plain-A", "finThrow(0)");
  expectLogs("ft-finally", "finThrow(0)");

  expect(drive(exports, "finThrow", 1), true, "fin-boom", "finThrow(1)");
  expectLogs("ft-finally", "finThrow(1)");
}
