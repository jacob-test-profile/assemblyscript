// Driver for the chunk-5 allSettled fixture (see STATUS-chunk5.md).
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

  // settledMixed: every member settles; per-member status/value/reason.
  {
    const before = driver.joins.length;
    const handle = exports.settledMixed();
    const status = exports.__async_async_join_allsettled_settledMixed_status;
    const store = exports.__async_async_join_allsettled_settledMixed_join_store_0;
    const err = exports.__async_async_join_allsettled_settledMixed_join_error_0;
    const done = exports.__async_async_join_allsettled_settledMixed_join_done_0;
    const result = exports.__async_async_join_allsettled_settledMixed_result;
    if (status(handle) !== 1) throw new Error("settledMixed must suspend at site 0");
    if (driver.joins.length !== before + 1) throw new Error("settledMixed must call the join once");
    const join = driver.joins[driver.joins.length - 1];
    if (join.policy !== 2) throw new Error("settledMixed join policy must be allSettled (2)");
    if (join.reqs.length !== 3) throw new Error("settledMixed must issue 3 members");
    store(handle, 2, exports.chunkString(2));
    err(handle, 1, exports.errorString(1));
    store(handle, 0, exports.chunkString(0));
    if (done(handle) !== 1) throw new Error("settledMixed join_done must complete");
    const out = getString(memory, result(handle));
    if (out !== "fulfilled:AAA|rejected:boom-b|fulfilled:CCC") {
      throw new Error("settledMixed wrong result: " + out);
    }
  }

  // settledEmpty: resolves immediately with no suspension and no join call.
  {
    const before = driver.joins.length;
    const handle = exports.settledEmpty();
    const status = exports.__async_async_join_allsettled_settledEmpty_status;
    const result = exports.__async_async_join_allsettled_settledEmpty_result;
    if (status(handle) !== -1) throw new Error("settledEmpty must complete immediately");
    if (driver.joins.length !== before) throw new Error("settledEmpty must not call the join");
    const out = getString(memory, result(handle));
    if (out !== "0") throw new Error("settledEmpty wrong result: " + out);
  }
}
