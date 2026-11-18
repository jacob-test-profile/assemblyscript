// Driver for the join-member-await fixture: implements the test side of
// the issue/join protocol with raw WebAssembly. The hoisted member await
// is site 0 and the join itself is site 1: the task first suspends at
// site 0 with no join issued, and only after resume_0 does the join
// issue with the sentinel token 0 for the pre-resolved member.
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
  imports.env.getFailing = function() {
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
  const base = "__async_async_join_member";

  // allHoisted: the hoisted member suspends first; the join issues only
  // after resume_0, with the sentinel 0 for the pre-resolved member.
  {
    const before = driver.joins.length;
    const handle = exports.allHoisted();
    const status = exports[base + "_allHoisted_status"];
    const resume = exports[base + "_allHoisted_resume_0"];
    const store = exports[base + "_allHoisted_join_store_1"];
    const done = exports[base + "_allHoisted_join_done_1"];
    const result = exports[base + "_allHoisted_result"];
    if (status(handle) !== 1) throw new Error("allHoisted must suspend at hoisted site 0");
    if (driver.joins.length !== before) throw new Error("allHoisted must not join before the hoisted await settles");
    if (driver.issues.length !== 1) throw new Error("allHoisted must issue only the hoisted member first");
    if (resume(handle, 5) !== 0) throw new Error("allHoisted resume_0 must stay suspended at the join");
    if (status(handle) !== 2) throw new Error("allHoisted must suspend at join site 1 after resume_0");
    if (driver.joins.length !== before + 1) throw new Error("allHoisted must call the join once");
    const join = driver.joins[driver.joins.length - 1];
    if (join.policy !== 0) throw new Error("allHoisted join policy must be all (0)");
    if (join.reqs.length !== 3) throw new Error("allHoisted must issue 3 members");
    if (join.reqs[0] !== 0) throw new Error("allHoisted first req must be the pre-resolved sentinel 0");
    if (join.reqs.slice(1).join(",") !== driver.issues.slice(-2).join(",")) {
      throw new Error("allHoisted remaining reqs must match the issued tokens in order");
    }
    store(handle, 1, 20);
    store(handle, 2, 30);
    if (done(handle) !== 1) throw new Error("allHoisted join_done must complete");
    const out = getString(memory, result(handle));
    if (out !== "5|20|30") throw new Error("allHoisted wrong result: " + out);
  }

  // raceHoisted: the pre-resolved member wins via join_mark, and a late
  // store for the losing member is dropped.
  {
    const handle = exports.raceHoisted();
    const status = exports[base + "_raceHoisted_status"];
    const resume = exports[base + "_raceHoisted_resume_0"];
    const mark = exports[base + "_raceHoisted_join_mark_1"];
    const store = exports[base + "_raceHoisted_join_store_1"];
    const done = exports[base + "_raceHoisted_join_done_1"];
    const result = exports[base + "_raceHoisted_result"];
    if (status(handle) !== 1) throw new Error("raceHoisted must suspend at hoisted site 0");
    if (resume(handle, 5) !== 0) throw new Error("raceHoisted resume_0 must stay suspended at the join");
    if (status(handle) !== 2) throw new Error("raceHoisted must suspend at join site 1 after resume_0");
    const join = driver.joins[driver.joins.length - 1];
    if (join.policy !== 1) throw new Error("raceHoisted join policy must be race (1)");
    if (join.reqs.length !== 2 || join.reqs[0] !== 0) {
      throw new Error("raceHoisted reqs must be [0, token]");
    }
    mark(handle, 0);
    if (done(handle) !== 1) throw new Error("raceHoisted join_done must complete");
    if (result(handle) !== 5) throw new Error("raceHoisted wrong result");
    store(handle, 1, 99);
    if (result(handle) !== 5) throw new Error("raceHoisted late store must be dropped");
  }

  // settledHoisted: the pre-resolved member is fulfilled, the failing
  // member's reason is recorded via join_error.
  {
    const handle = exports.settledHoisted();
    const status = exports[base + "_settledHoisted_status"];
    const resume = exports[base + "_settledHoisted_resume_0"];
    const error = exports[base + "_settledHoisted_join_error_1"];
    const done = exports[base + "_settledHoisted_join_done_1"];
    const result = exports[base + "_settledHoisted_result"];
    if (status(handle) !== 1) throw new Error("settledHoisted must suspend at hoisted site 0");
    if (resume(handle, 5) !== 0) throw new Error("settledHoisted resume_0 must stay suspended at the join");
    if (status(handle) !== 2) throw new Error("settledHoisted must suspend at join site 1 after resume_0");
    const join = driver.joins[driver.joins.length - 1];
    if (join.policy !== 2) throw new Error("settledHoisted join policy must be allSettled (2)");
    error(handle, 1, exports.errorString(1));
    if (done(handle) !== 1) throw new Error("settledHoisted join_done must complete");
    const out = getString(memory, result(handle));
    if (out !== "ok5;noboom-b;") throw new Error("settledHoisted wrong result: " + out);
  }

  // allHoistedCaught: rejecting the hoisted await is caught by the
  // surrounding try, and the join never issues.
  {
    const before = driver.joins.length;
    const handle = exports.allHoistedCaught();
    const status = exports[base + "_allHoistedCaught_status"];
    const reject = exports[base + "_allHoistedCaught_reject_0"];
    const result = exports[base + "_allHoistedCaught_result"];
    if (status(handle) !== 1) throw new Error("allHoistedCaught must suspend at hoisted site 0");
    if (reject(handle, exports.errorString(1)) !== 1) throw new Error("allHoistedCaught reject_0 must complete via the catch");
    if (status(handle) !== -1) throw new Error("allHoistedCaught status must be -1 after the catch");
    if (driver.joins.length !== before) throw new Error("allHoistedCaught must never call the join");
    const out = getString(memory, result(handle));
    if (out !== "caught:boom-b") throw new Error("allHoistedCaught wrong result: " + out);
  }
}
