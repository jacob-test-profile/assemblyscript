// Driver for the chunk-5 any fixture (see STATUS-chunk5.md).
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
  instanceExports = exports;
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

  // anySecond: a rejection does not win; the first fulfillment does.
  {
    const before = driver.joins.length;
    const handle = exports.anySecond();
    const status = exports.__async_async_join_any_anySecond_status;
    const store = exports.__async_async_join_any_anySecond_join_store_0;
    const err = exports.__async_async_join_any_anySecond_join_error_0;
    const done = exports.__async_async_join_any_anySecond_join_done_0;
    const result = exports.__async_async_join_any_anySecond_result;
    if (status(handle) !== 1) throw new Error("anySecond must suspend at site 0");
    if (driver.joins.length !== before + 1) throw new Error("anySecond must call the join once");
    const join = driver.joins[driver.joins.length - 1];
    if (join.policy !== 3) throw new Error("anySecond join policy must be any (3)");
    if (join.reqs.length !== 2) throw new Error("anySecond must issue 2 members");
    err(handle, 0, exports.errorString(0));
    store(handle, 1, exports.chunkString(1));
    if (done(handle) !== 1) throw new Error("anySecond join_done must complete");
    if (getString(memory, result(handle)) !== "BBB") throw new Error("anySecond wrong result");
  }

  // anyAllReject: all rejections fail with the AggregateError-style message.
  {
    const handle = exports.anyAllReject();
    const status = exports.__async_async_join_any_anyAllReject_status;
    const err = exports.__async_async_join_any_anyAllReject_join_error_0;
    const reject = exports.__async_async_join_any_anyAllReject_reject_0;
    const error = exports.__async_async_join_any_anyAllReject_error;
    if (status(handle) !== 1) throw new Error("anyAllReject must suspend at site 0");
    err(handle, 0, exports.errorString(0));
    err(handle, 1, exports.errorString(1));
    if (reject(handle, exports.aggregateString()) !== 2) throw new Error("anyAllReject reject must fail the task");
    if (status(handle) !== -2) throw new Error("anyAllReject status must be -2 after reject");
    const out = getString(memory, error(handle));
    if (out !== "AggregateError: boom-a; boom-b") throw new Error("anyAllReject wrong error: " + out);
  }

  // anyEmpty: fails immediately with an empty AggregateError-style message.
  {
    const before = driver.joins.length;
    const handle = exports.anyEmpty();
    const status = exports.__async_async_join_any_anyEmpty_status;
    const error = exports.__async_async_join_any_anyEmpty_error;
    if (status(handle) !== -2) throw new Error("anyEmpty must fail immediately");
    if (driver.joins.length !== before) throw new Error("anyEmpty must not call the join");
    const out = getString(memory, error(handle));
    if (out !== "AggregateError: ") throw new Error("anyEmpty wrong error: " + out);
  }
}
