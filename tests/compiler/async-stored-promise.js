// Driver for the chunk-7 stored-promise fixture. The import is issued
// once, at bind time; the await suspends through __async_wait on the
// issued token and resumes with the delivered value.
const driver = { issues: [], waits: [] };
let instanceExports = null;

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
  instanceExports = exports;
  imports.env.getChunk = function() {
    const token = instanceExports.mintString(driver.issues.length + 1);
    driver.issues.push(token);
    return token;
  };
  imports.env.__async_wait = function(token) {
    driver.waits.push(token);
    return 0;
  };
}

export async function postInstantiate(instance) {
  driver.issues = [];
  driver.waits = [];
  const exports = instance.exports;
  const memory = exports.memory;
  const base = "__async_async_stored_promise_f";
  const handle = exports.f();
  const status = exports[base + "_status"];
  const resume = exports[base + "_resume_0"];
  const result = exports[base + "_result"];
  if (status(handle) !== 1) throw new Error("f must suspend at the wait site");
  if (driver.issues.length !== 1) throw new Error("f must issue getChunk exactly once, at bind time");
  if (driver.waits.length !== 1) throw new Error("f must wait exactly once");
  if (driver.waits[0] !== driver.issues[0]) throw new Error("f must wait on the issued token");
  const value = exports.mintString(42);
  if (resume(handle, value) !== 1) throw new Error("f resume must complete");
  const out = getString(memory, result(handle));
  if (out !== "got-token-42") throw new Error("f wrong result: " + out);
}
