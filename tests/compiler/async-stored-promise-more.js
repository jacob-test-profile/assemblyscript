// Driver for the stored-promise member/index/copy fixture. Each import
// is issued once and mints a token string; every await must suspend
// through __async_wait on exactly the issued token(s), in order.
const driver = { issues: [], waits: [] };

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
  imports.env.getChunk = function() {
    const token = exports.mintString(driver.issues.length + 1);
    driver.issues.push(token);
    return token;
  };
  imports.env.__async_wait = function(token) {
    driver.waits.push(token);
    return 0;
  };
}

function drive(exports, memory, fn, wantIssues, wantResult) {
  driver.issues = [];
  driver.waits = [];
  const base = `__async_async_stored_promise_more_${fn}`;
  const handle = exports[fn]();
  const status = exports[base + "_status"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  let i = 0;
  while (true) {
    if (++guard > 10) throw new Error(fn + ": loop guard");
    const st = status(handle);
    if (st == -1) {
      if (driver.issues.length !== wantIssues) throw new Error(fn + ": must issue " + wantIssues + " times, got " + driver.issues.length);
      if (driver.waits.length !== wantIssues) throw new Error(fn + ": must wait " + wantIssues + " times, got " + driver.waits.length);
      for (let j = 0; j < wantIssues; j++) {
        if (driver.waits[j] !== driver.issues[j]) throw new Error(fn + ": wait " + j + " must be on the issued token");
      }
      const out = getString(memory, result(handle));
      if (out !== wantResult) throw new Error(fn + ": wrong result: " + out);
      return;
    }
    if (st == -2) throw new Error(fn + ": failed: " + getString(memory, error(handle)));
    if (st <= 0) throw new Error(fn + ": unexpected status " + st);
    const site = st - 1;
    const rc = exports[base + "_resume_" + site](handle, exports.chunkString(i++));
    if (rc != 0 && rc != 1 && rc != 2) throw new Error(fn + ": unexpected step return " + rc);
  }
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  const memory = exports.memory;

  drive(exports, memory, "memberIndex", 2, "AB");
  drive(exports, memory, "memberField", 1, "got-A");
  drive(exports, memory, "copyInit", 1, "got-A");
  drive(exports, memory, "copyRebind", 1, "got-A");
  drive(exports, memory, "copyMember", 1, "got-A");
}
