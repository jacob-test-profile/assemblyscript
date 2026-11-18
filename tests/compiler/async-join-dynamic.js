// Driver for the chunk-5 dynamic join fixture (see STATUS-chunk5.md).
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
  imports.env.getNumber = function() {
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

  // dynamicAll: members are issued in the loop before the single join.
  {
    const issuesBefore = driver.issues.length;
    const joinsBefore = driver.joins.length;
    const handle = exports.dynamicAll();
    const status = exports.__async_async_join_dynamic_dynamicAll_status;
    const store = exports.__async_async_join_dynamic_dynamicAll_join_store_0;
    const done = exports.__async_async_join_dynamic_dynamicAll_join_done_0;
    const result = exports.__async_async_join_dynamic_dynamicAll_result;
    if (status(handle) !== 1) throw new Error("dynamicAll must suspend at site 0");
    if (driver.issues.length !== issuesBefore + 3) throw new Error("dynamicAll must issue 3 members in the loop");
    if (driver.joins.length !== joinsBefore + 1) throw new Error("dynamicAll must call the join once");
    const join = driver.joins[driver.joins.length - 1];
    if (join.policy !== 0) throw new Error("dynamicAll join policy must be all (0)");
    if (join.reqs.length !== 3) throw new Error("dynamicAll must join 3 members");
    if (join.reqs.join(",") !== driver.issues.slice(-3).join(",")) {
      throw new Error("dynamicAll reqs must match the issued tokens in order");
    }
    store(handle, 2, 30);
    store(handle, 0, 10);
    store(handle, 1, 20);
    if (done(handle) !== 1) throw new Error("dynamicAll join_done must complete");
    const out = getString(memory, result(handle));
    if (out !== "10|20|30") throw new Error("dynamicAll wrong result: " + out);
  }

  // dynamicEmpty: a loop-built empty list resolves immediately.
  {
    const before = driver.joins.length;
    const handle = exports.dynamicEmpty();
    const status = exports.__async_async_join_dynamic_dynamicEmpty_status;
    const result = exports.__async_async_join_dynamic_dynamicEmpty_result;
    if (status(handle) !== -1) throw new Error("dynamicEmpty must complete immediately");
    if (driver.joins.length !== before) throw new Error("dynamicEmpty must not call the join");
    const out = getString(memory, result(handle));
    if (out !== "0") throw new Error("dynamicEmpty wrong result: " + out);
  }
}
