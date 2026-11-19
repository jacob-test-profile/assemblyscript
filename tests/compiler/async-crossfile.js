// Driver for the cross-file-await fixture: implements the test side of
// the nested-await protocol with raw WebAssembly. Each awaited function
// lives in another file; the driver starts it through the outer's pending
// export, drives it through its own resume/reject exports (re-exported
// from the entry module by the transform), and delivers its result to
// the outer's resume export.
const driver = { issues: 0, nextToken: 1 };
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
  const mint = function() {
    driver.issues++;
    return instanceExports.mintString(driver.nextToken++);
  };
  imports.env.getChunk = mint;
  imports.env.getNumberA = mint;
  imports.env.getNumberB = mint;
  imports.env.getNumberW = mint;
}

export async function postInstantiate(instance) {
  driver.issues = 0;
  driver.nextToken = 1;
  const exports = instance.exports;
  const memory = exports.memory;
  const base = "__async_async_crossfile";
  const helper = "__async__async_crossfile_helper_helper";
  const chain = "__async__async_crossfile_chain_chain";
  const cycleA = "__async__async_crossfile_cycle_a_cycleA";
  const cycleB = "__async__async_crossfile_cycle_b_cycleB";
  const method = "__async__async_crossfile_methods_W2_helper";

  // awaitOtherFile: the helper suspends on getChunk; its result is
  // delivered to the outer resume.
  {
    const handle = exports.awaitOtherFile();
    const status = exports[base + "_awaitOtherFile_status"];
    if (status(handle) !== 1) throw new Error("awaitOtherFile must suspend at nested site 0");
    const inner = exports[base + "_awaitOtherFile_pending_0"](handle);
    if (!inner) throw new Error("awaitOtherFile pending_0 must expose the helper handle");
    if (exports[helper + "_status"](inner) !== 1) throw new Error("helper must suspend at its getChunk site 0");
    if (exports[helper + "_resume_0"](inner, exports.chunkString(0)) !== 1) {
      throw new Error("helper resume_0 must complete");
    }
    if (exports[helper + "_status"](inner) !== -1) throw new Error("helper status must be -1 after resume_0");
    const innerResult = exports[helper + "_result"](inner);
    if (exports[base + "_awaitOtherFile_resume_0"](handle, innerResult) !== 1) {
      throw new Error("awaitOtherFile resume_0 must complete");
    }
    if (status(handle) !== -1) throw new Error("awaitOtherFile status must be -1");
    const out = getString(memory, exports[base + "_awaitOtherFile_result"](handle));
    if (out !== "hello") throw new Error("awaitOtherFile wrong result: " + out);
  }

  // awaitOtherFileGuarded: the helper fails, the outer rejection lands
  // in the catch.
  {
    const handle = exports.awaitOtherFileGuarded();
    const status = exports[base + "_awaitOtherFileGuarded_status"];
    if (status(handle) !== 1) throw new Error("awaitOtherFileGuarded must suspend at nested site 0");
    const inner = exports[base + "_awaitOtherFileGuarded_pending_0"](handle);
    if (!inner) throw new Error("awaitOtherFileGuarded pending_0 must expose the helper handle");
    const msg = exports.mintString(99);
    if (exports[helper + "_reject_0"](inner, msg) !== 2) throw new Error("helper reject_0 must fail the helper task");
    if (exports[helper + "_status"](inner) !== -2) throw new Error("helper status must be -2 after reject_0");
    if (exports[base + "_awaitOtherFileGuarded_reject_0"](handle, msg) !== 1) {
      throw new Error("awaitOtherFileGuarded reject_0 must complete via the catch");
    }
    if (status(handle) !== -1) throw new Error("awaitOtherFileGuarded status must be -1");
    const out = getString(memory, exports[base + "_awaitOtherFileGuarded_result"](handle));
    if (out !== "caught") throw new Error("awaitOtherFileGuarded wrong result: " + out);
  }

  // awaitChain: helper -> chain -> outer, each delivering its result up.
  {
    const handle = exports.awaitChain();
    const status = exports[base + "_awaitChain_status"];
    if (status(handle) !== 1) throw new Error("awaitChain must suspend at nested site 0");
    const chainHandle = exports[base + "_awaitChain_pending_0"](handle);
    if (!chainHandle) throw new Error("awaitChain pending_0 must expose the chain handle");
    if (exports[chain + "_status"](chainHandle) !== 1) throw new Error("chain must suspend at its nested site 0");
    const helperHandle = exports[chain + "_pending_0"](chainHandle);
    if (!helperHandle) throw new Error("chain pending_0 must expose the helper handle");
    if (exports[helper + "_resume_0"](helperHandle, exports.chunkString(0)) !== 1) {
      throw new Error("chain helper resume_0 must complete");
    }
    const helperResult = exports[helper + "_result"](helperHandle);
    if (exports[chain + "_resume_0"](chainHandle, helperResult) !== 1) {
      throw new Error("chain resume_0 must complete");
    }
    const chainResult = exports[chain + "_result"](chainHandle);
    if (exports[base + "_awaitChain_resume_0"](handle, chainResult) !== 1) {
      throw new Error("awaitChain resume_0 must complete");
    }
    const out = getString(memory, exports[base + "_awaitChain_result"](handle));
    if (out !== "hello2") throw new Error("awaitChain wrong result: " + out);
  }

  // awaitCycle: cycleA(2) = 1 + cycleB(1) = 1 + (10 + cycleA(0)) = 11.
  {
    const handle = exports.awaitCycle();
    const status = exports[base + "_awaitCycle_status"];
    if (status(handle) !== 1) throw new Error("awaitCycle must suspend at nested site 0");
    const aHandle = exports[base + "_awaitCycle_pending_0"](handle);
    if (!aHandle) throw new Error("awaitCycle pending_0 must expose the cycleA handle");
    if (exports[cycleA + "_status"](aHandle) !== 1) throw new Error("cycleA must suspend at its getNumberA site 0");
    if (exports[cycleA + "_resume_0"](aHandle, 1) !== 0) throw new Error("cycleA resume_0 must stay suspended at cycleB");
    if (exports[cycleA + "_status"](aHandle) !== 2) throw new Error("cycleA must suspend at nested site 1 after resume_0");
    const bHandle = exports[cycleA + "_pending_1"](aHandle);
    if (!bHandle) throw new Error("cycleA pending_1 must expose the cycleB handle");
    if (exports[cycleB + "_status"](bHandle) !== 1) throw new Error("cycleB must suspend at its getNumberB site 0");
    if (exports[cycleB + "_resume_0"](bHandle, 10) !== 0) throw new Error("cycleB resume_0 must stay suspended at cycleA");
    if (exports[cycleB + "_status"](bHandle) !== 2) throw new Error("cycleB must suspend at nested site 1 after resume_0");
    const a2Handle = exports[cycleB + "_pending_1"](bHandle);
    if (!a2Handle) throw new Error("cycleB pending_1 must expose the second cycleA handle");
    if (exports[cycleA + "_status"](a2Handle) !== -1) throw new Error("cycleA(0) must complete inline");
    if (exports[cycleA + "_result"](a2Handle) !== 0) throw new Error("cycleA(0) must return 0");
    if (exports[cycleB + "_resume_1"](bHandle, 0) !== 1) throw new Error("cycleB resume_1 must complete");
    if (exports[cycleB + "_result"](bHandle) !== 10) throw new Error("cycleB(1) must return 10");
    if (exports[cycleA + "_resume_1"](aHandle, 10) !== 1) throw new Error("cycleA resume_1 must complete");
    if (exports[cycleA + "_result"](aHandle) !== 11) throw new Error("cycleA(2) must return 11");
    if (exports[base + "_awaitCycle_resume_0"](handle, 11) !== 1) {
      throw new Error("awaitCycle resume_0 must complete");
    }
    if (exports[base + "_awaitCycle_result"](handle) !== 11) throw new Error("awaitCycle wrong result");
  }

  // awaitCrossMethod: the method suspends on getNumberW; its result is
  // delivered to the outer resume.
  {
    const handle = exports.awaitCrossMethod();
    const status = exports[base + "_awaitCrossMethod_status"];
    if (status(handle) !== 1) throw new Error("awaitCrossMethod must suspend at nested site 0");
    const methodHandle = exports[base + "_awaitCrossMethod_pending_0"](handle);
    if (!methodHandle) throw new Error("awaitCrossMethod pending_0 must expose the method handle");
    if (exports[method + "_status"](methodHandle) !== 1) throw new Error("method must suspend at its getNumberW site 0");
    if (exports[method + "_resume_0"](methodHandle, 7) !== 1) throw new Error("method resume_0 must complete");
    if (exports[method + "_result"](methodHandle) !== 17) throw new Error("method must return 17");
    if (exports[base + "_awaitCrossMethod_resume_0"](handle, 17) !== 1) {
      throw new Error("awaitCrossMethod resume_0 must complete");
    }
    if (exports[base + "_awaitCrossMethod_result"](handle) !== 17) throw new Error("awaitCrossMethod wrong result");
  }

  if (driver.issues !== 6) throw new Error("cross-file imports must be called exactly 6 times, got " + driver.issues);
}
