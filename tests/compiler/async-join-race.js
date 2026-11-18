// Driver for the chunk-5 race fixture (see STATUS-chunk5.md).
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

  // raceFirst: the first settlement wins; late results are dropped.
  {
    const before = driver.joins.length;
    const handle = exports.raceFirst();
    const status = exports.__async_async_join_race_raceFirst_status;
    const store = exports.__async_async_join_race_raceFirst_join_store_0;
    const done = exports.__async_async_join_race_raceFirst_join_done_0;
    const result = exports.__async_async_join_race_raceFirst_result;
    if (status(handle) !== 1) throw new Error("raceFirst must suspend at site 0");
    if (driver.joins.length !== before + 1) throw new Error("raceFirst must call the join once");
    const join = driver.joins[driver.joins.length - 1];
    if (join.policy !== 1) throw new Error("raceFirst join policy must be race (1)");
    if (join.reqs.length !== 2) throw new Error("raceFirst must issue 2 members");
    store(handle, 1, exports.chunkString(1));
    if (done(handle) !== 1) throw new Error("raceFirst join_done must complete");
    if (getString(memory, result(handle)) !== "BBB") throw new Error("raceFirst wrong result");
    store(handle, 0, exports.chunkString(0));
    if (getString(memory, result(handle)) !== "BBB") throw new Error("raceFirst late store must not change the result");
  }

  // raceReject: a first-settlement rejection fails the task.
  {
    const handle = exports.raceReject();
    const status = exports.__async_async_join_race_raceReject_status;
    const reject = exports.__async_async_join_race_raceReject_reject_0;
    const error = exports.__async_async_join_race_raceReject_error;
    if (status(handle) !== 1) throw new Error("raceReject must suspend at site 0");
    if (reject(handle, exports.errorString(1)) !== 2) throw new Error("raceReject reject must fail the task");
    if (status(handle) !== -2) throw new Error("raceReject status must be -2 after reject");
    if (getString(memory, error(handle)) !== "boom-b") throw new Error("raceReject wrong error");
  }

  // raceEmpty: suspends on an empty join and never settles.
  {
    const before = driver.joins.length;
    const handle = exports.raceEmpty();
    const status = exports.__async_async_join_race_raceEmpty_status;
    if (status(handle) !== 1) throw new Error("raceEmpty must suspend at site 0");
    if (driver.joins.length !== before + 1) throw new Error("raceEmpty must call the join once");
    const join = driver.joins[driver.joins.length - 1];
    if (join.policy !== 1) throw new Error("raceEmpty join policy must be race (1)");
    if (join.reqs.length !== 0) throw new Error("raceEmpty must issue 0 members");
    if (status(handle) !== 1) throw new Error("raceEmpty must stay suspended");
  }
}
