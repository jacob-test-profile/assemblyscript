// Driver for the join-argument-await fixture: implements the test side
// of the issue/join protocol with raw WebAssembly. The argument await is
// site 0 (a nested await of makeArray) and the join itself is site 1:
// the driver starts the inner task through the pending export, delivers
// its completed array pointer to resume_0, and only then does the join
// issue over the two member tokens.
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
  const base = "__async_async_join_arg_await";

  // argAwait: the inner makeArray runs inside the outer's first step and
  // completes (it has no awaits); the outer suspends at the argument
  // site until its array pointer is delivered to resume_0.
  {
    const before = driver.joins.length;
    const handle = exports.argAwait();
    const status = exports[base + "_argAwait_status"];
    const pending = exports[base + "_argAwait_pending_0"];
    const resume = exports[base + "_argAwait_resume_0"];
    const store = exports[base + "_argAwait_join_store_1"];
    const done = exports[base + "_argAwait_join_done_1"];
    const result = exports[base + "_argAwait_result"];
    if (status(handle) !== 1) throw new Error("argAwait must suspend at argument site 0");
    if (driver.joins.length !== before) throw new Error("argAwait must not join before the argument await settles");
    if (driver.issues.length !== 2) throw new Error("argAwait inner must issue both members during the first step");
    const innerHandle = pending(handle);
    if (!innerHandle) throw new Error("argAwait pending_0 must expose the inner handle");
    if (exports[base + "_makeArray_status"](innerHandle) !== -1) {
      throw new Error("argAwait inner makeArray must complete inline");
    }
    const arrayPtr = exports[base + "_makeArray_result"](innerHandle);
    if (!arrayPtr) throw new Error("argAwait inner makeArray must return the member array");
    if (resume(handle, arrayPtr) !== 0) throw new Error("argAwait resume_0 must stay suspended at the join");
    if (status(handle) !== 2) throw new Error("argAwait must suspend at join site 1 after resume_0");
    if (driver.joins.length !== before + 1) throw new Error("argAwait must call the join once");
    const join = driver.joins[driver.joins.length - 1];
    if (join.policy !== 0) throw new Error("argAwait join policy must be all (0)");
    if (join.reqs.length !== 2) throw new Error("argAwait must issue 2 members");
    if (join.reqs.join(",") !== driver.issues.join(",")) {
      throw new Error("argAwait reqs must match the issued tokens in order");
    }
    store(handle, 0, 10);
    store(handle, 1, 20);
    if (done(handle) !== 1) throw new Error("argAwait join_done must complete");
    const out = getString(memory, result(handle));
    if (out !== "10|20") throw new Error("argAwait wrong result: " + out);
  }
}
