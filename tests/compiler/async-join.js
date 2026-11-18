// Driver for the chunk-5 join fixture: implements the test side of the
// issue/join protocol (see STATUS-chunk5.md) with raw WebAssembly.
const driver = { issues: [], joins: [], nextToken: 1 };
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

function getI32Array(memory, ptr) {
  const U32 = new Uint32Array(memory.buffer);
  const dataStart = U32[(ptr + 4) >>> 2];
  const length = U32[(ptr + 12) >>> 2];
  return Array.from(new Int32Array(memory.buffer, dataStart, length));
}

export function preInstantiate(imports, exports) {
  // The harness fills `exports` with the instance exports after
  // instantiation; the module owns its memory, so reads must use it.
  instanceExports = exports;
  imports.env.getNumber = function() {
    const token = instanceExports.mintString(driver.nextToken++);
    driver.issues.push(token);
    return token;
  };
  imports.env.getChunk = function(i) {
    const token = instanceExports.mintString(driver.nextToken++);
    driver.issues.push(token);
    return token;
  };
  imports.env.__async_join = function(reqsPtr, policy) {
    driver.joins.push({ reqs: getI32Array(instanceExports.memory, reqsPtr), policy });
    return 0;
  };
}

export async function postInstantiate(instance) {
  driver.issues = [];
  driver.joins = [];
  driver.nextToken = 1;
  const exports = instance.exports;
  const memory = exports.memory;

  // allNumbers: out-of-order delivery comes back in argument order.
  {
    const before = driver.joins.length;
    const handle = exports.allNumbers();
    const status = exports.__async_async_join_allNumbers_status;
    const store = exports.__async_async_join_allNumbers_join_store_0;
    const done = exports.__async_async_join_allNumbers_join_done_0;
    const result = exports.__async_async_join_allNumbers_result;
    if (status(handle) !== 1) throw new Error("allNumbers must suspend at site 0");
    if (driver.joins.length !== before + 1) throw new Error("allNumbers must call the join once");
    const join = driver.joins[driver.joins.length - 1];
    if (join.policy !== 0) throw new Error("allNumbers join policy must be all (0)");
    if (join.reqs.length !== 3) throw new Error("allNumbers must issue 3 members");
    if (join.reqs.join(",") !== driver.issues.slice(-3).join(",")) {
      throw new Error("allNumbers reqs must match the issued tokens in order");
    }
    store(handle, 1, 20);
    store(handle, 0, 10);
    store(handle, 2, 30);
    if (done(handle) !== 1) throw new Error("allNumbers join_done must complete");
    const out = getString(memory, result(handle));
    if (out !== "10|20|30") throw new Error("allNumbers wrong result: " + out);
  }

  // allFailFast: first rejection wins; late results are dropped.
  {
    const before = driver.joins.length;
    const handle = exports.allFailFast();
    const status = exports.__async_async_join_allFailFast_status;
    const store = exports.__async_async_join_allFailFast_join_store_0;
    const done = exports.__async_async_join_allFailFast_join_done_0;
    const reject = exports.__async_async_join_allFailFast_reject_0;
    const error = exports.__async_async_join_allFailFast_error;
    if (status(handle) !== 1) throw new Error("allFailFast must suspend at site 0");
    if (driver.joins.length !== before + 1) throw new Error("allFailFast must call the join once");
    if (reject(handle, exports.errorString(1)) !== 2) throw new Error("allFailFast reject must fail the task");
    if (status(handle) !== -2) throw new Error("allFailFast status must be -2 after reject");
    if (getString(memory, error(handle)) !== "boom-b") throw new Error("allFailFast wrong error");
    store(handle, 0, 10);
    if (done(handle) !== 2) throw new Error("allFailFast late join_done must not crash");
    if (status(handle) !== -2) throw new Error("allFailFast status must stay -2");
  }

  // allEmpty: resolves immediately with no suspension and no join call.
  {
    const before = driver.joins.length;
    const handle = exports.allEmpty();
    const status = exports.__async_async_join_allEmpty_status;
    const result = exports.__async_async_join_allEmpty_result;
    if (status(handle) !== -1) throw new Error("allEmpty must complete immediately");
    if (driver.joins.length !== before) throw new Error("allEmpty must not call the join");
    const out = getString(memory, result(handle));
    if (out !== "0") throw new Error("allEmpty wrong result: " + out);
  }
}
