// End-to-end test for the chunk 6 generated-JS coordinator.
//
// Compiles tests/async-coordinator/fixtures/coordinator.ts with the real
// asc (real CPS transform), asserts the generated `<base>.async.js` was
// emitted next to the wasm, imports it, and drives the async functions
// through its public API only: loop+await, externref identity across an
// await, the join engine (via the test-only join driver and via chunk 5's
// real wasm join), rejection propagation, a void task, the spill-pool FIFO
// queue, and heap churn + __collect mid-suspension. Also checks a sync-only
// module emits no coordinator.
//
// Run: npm run test:async-coordinator   (after npm run build)
import { spawnSync } from "node:child_process";
import { copyFileSync, existsSync, mkdtempSync, readFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { dirname, join } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const repo = join(dirname(fileURLToPath(import.meta.url)), "..", "..");
const ascBin = join(repo, "bin", "asc.js");
const fixtures = join(dirname(fileURLToPath(import.meta.url)), "fixtures");

if (!existsSync(join(repo, "dist", "asc.js"))) {
  console.log("FAIL: dist/asc.js is missing — run npm run build first");
  process.exit(1);
}

const dir = mkdtempSync(join(tmpdir(), "async-coord-"));
for (const name of ["coordinator.ts", "sync.ts", "join.ts", "methods.ts"]) {
  copyFileSync(join(fixtures, name), join(dir, name));
}

function compileTo(cwd, name, flags) {
  const base = name.replace(/\.ts$/, "");
  const r = spawnSync(
    process.execPath,
    [ascBin, name, "-o", base + ".wasm", ...flags],
    { cwd, encoding: "utf8" }
  );
  if (r.status !== 0) {
    console.log(r.stdout, r.stderr);
    console.log("FAIL: asc failed for " + name);
    process.exit(1);
  }
  return join(cwd, base + ".wasm");
}

function compile(name) {
  return compileTo(dir, name, ["--exportRuntime", "--debug", "--enable", "reference-types"]);
}

function check(cond, msg) {
  if (!cond) {
    console.log("FAIL: " + msg);
    process.exit(1);
  }
}

function deferred() {
  let resolve, reject;
  const promise = new Promise((res, rej) => { resolve = res; reject = rej; });
  return { promise, resolve, reject };
}

const tick = () => new Promise((resolve) => setImmediate(resolve));

async function assertRejects(promise, pattern, msg) {
  let error = null;
  try {
    await promise;
  } catch (e) {
    error = e;
  }
  check(error instanceof Error, msg + " (did not reject)");
  check(pattern.test(error.message), msg + " (wrong message: " + error.message + ")");
  return error;
}

// Decodes an AssemblyScript string from wasm memory by its pointer, as
// the compiler test glue does: sync imports receive the raw pointer, so
// a string-typed sync import (log) needs this to read what was logged.
function getStringFromMemory(memory, ptr) {
  const RUNTIME_HEADER_SIZE = 16;
  if (!ptr) return "null";
  const U32 = new Uint32Array(memory.buffer);
  const U16 = new Uint16Array(memory.buffer);
  const len16 = U32[(ptr - RUNTIME_HEADER_SIZE + 12) >>> 2] >>> 1;
  const ptr16 = ptr >>> 1;
  return String.fromCharCode.apply(String, U16.subarray(ptr16, ptr16 + len16));
}

compile("sync.ts");
check(!existsSync(join(dir, "sync.async.js")), "sync module must not emit a .async.js file");
console.log("PASS sync module emits no coordinator");

const wasmPath = compile("coordinator.ts");
const coordPath = join(dir, "coordinator.async.js");
check(existsSync(coordPath), "coordinator.async.js must be emitted next to the wasm");
const generated = await import(pathToFileURL(coordPath).href);
check(typeof generated.instantiateAsync === "function", "generated file must export instantiateAsync");
check(typeof generated.createJoinRegistry === "function", "generated file must export createJoinRegistry");
check(typeof generated.joinPromises === "function", "generated file must export joinPromises");
console.log("PASS coordinator file emitted with the public API");

const { instantiateAsync, createJoinRegistry, joinPromises } = generated;
const bytes = readFileSync(wasmPath);

await assertRejects(
  instantiateAsync(bytes, { env: {} }),
  /missing binding for suspending import env\.getChunk/,
  "instantiating without the suspending bindings must fail loudly"
);
console.log("PASS missing suspending binding fails loudly");

// Shared bindings. Every suspending import returns a test-controlled
// deferred promise; the test decides when (and whether) each settles.
const chunkCalls = [];
const chunkDeferreds = [];
const numDeferreds = [];
const handleDeferreds = [];
const useDeferreds = [];
const seenHandles = [];
const issueLog = [];
const memberDeferreds = [];
const registry = createJoinRegistry();
let issuesAtJoin = -1;
const sentinel = { tag: "handle" };

const api = await instantiateAsync(bytes, {
  env: {
    getChunk(i) {
      if (i === 9) return Promise.resolve("FAST");
      chunkCalls.push(i);
      const d = deferred();
      chunkDeferreds.push(d);
      return d.promise;
    },
    getNumber() {
      const d = deferred();
      numDeferreds.push(d);
      return d.promise;
    },
    getHandle() {
      const d = deferred();
      handleDeferreds.push(d);
      return d.promise;
    },
    useHandle(h) {
      seenHandles.push(h);
      const d = deferred();
      useDeferreds.push(d);
      return d.promise;
    },
    issueNumber(i) {
      issueLog.push(i);
      const d = deferred();
      memberDeferreds.push(d);
      return registry.issue(d.promise);
    },
    joinNumbers(policy) {
      issuesAtJoin = issueLog.length;
      return registry.join(policy === 0 ? "all" : "race").then((vals) => (Array.isArray(vals) ? vals.join("|") : String(vals)));
    }
  }
});

// Loop + await, driven through the generated coordinator only.
{
  const p = api.concatThree();
  await tick();
  check(chunkCalls.join(",") === "0", "concatThree must issue chunk 0 first, got " + chunkCalls);
  chunkDeferreds[0].resolve("AAA");
  await tick();
  check(chunkCalls.join(",") === "0,1", "concatThree must issue chunk 1 second, got " + chunkCalls);
  chunkDeferreds[1].resolve("BBB");
  await tick();
  check(chunkCalls.join(",") === "0,1,2", "concatThree must issue chunk 2 third, got " + chunkCalls);
  chunkDeferreds[2].resolve("CCC");
  check((await p) === "AAABBBCCC", "concatThree must resolve AAABBBCCC");
  console.log("PASS loop+await through the generated coordinator");
}

// Heap churn + __collect mid-suspension: the state object must survive.
{
  const before = chunkDeferreds.length;
  const p = api.concatThree();
  await tick();
  check(chunkDeferreds.length === before + 1, "churn task must suspend on chunk 0");
  api.exports.__collect();
  api.exports.allocSpam(2000);
  api.exports.__collect();
  api.exports.allocSpam(2000);
  api.exports.__collect();
  chunkDeferreds[before].resolve("AAA");
  await tick();
  chunkDeferreds[before + 1].resolve("BBB");
  await tick();
  chunkDeferreds[before + 2].resolve("CCC");
  check((await p) === "AAABBBCCC", "resume after churn+__collect must still work");
  console.log("PASS churn + __collect mid-suspension");
}

// Externref identity preserved across an await (wasm spill pool).
{
  const p = api.handleRoundtrip();
  await tick();
  check(handleDeferreds.length === 1, "handleRoundtrip must call getHandle once");
  handleDeferreds[0].resolve(sentinel);
  await tick();
  check(seenHandles[0] === sentinel, "externref identity must survive the await");
  useDeferreds[0].resolve(42);
  check((await p) === 42, "handleRoundtrip must resolve 42");
  console.log("PASS externref identity across await");
}

// Join (test-only driver): all members issued before the suspending join,
// out-of-order delivery, results in argument order.
{
  const base = memberDeferreds.length;
  const p = api.fanout(0);
  await tick();
  check(issueLog.slice(-3).join(",") === "0,1,2", "fanout must issue all three members, got " + issueLog);
  check(issuesAtJoin === issueLog.length, "all issues must happen before the join suspends");
  memberDeferreds[base + 2].resolve(30);
  memberDeferreds[base].resolve(10);
  memberDeferreds[base + 1].resolve(20);
  check((await p) === "10|20|30", "join all must deliver results in argument order");
  console.log("PASS join all, out-of-order delivery, in-order results");
}

// Join race: first settlement wins, late results dropped without crashing.
{
  const base = memberDeferreds.length;
  const p = api.fanout(1);
  await tick();
  memberDeferreds[base + 1].resolve(20);
  check((await p) === "20", "join race must resolve with the first settlement");
  memberDeferreds[base].resolve(10);
  memberDeferreds[base + 2].resolve(30);
  await tick();
  console.log("PASS join race, late results dropped");
}

// Join all, fail-fast: first rejection wins, late results dropped.
{
  const base = memberDeferreds.length;
  const p = api.fanout(0);
  await tick();
  memberDeferreds[base + 1].reject(new Error("boom-b"));
  await assertRejects(p, /boom-b/, "join all must fail fast on the first rejection");
  memberDeferreds[base].resolve(10);
  memberDeferreds[base + 2].resolve(30);
  await tick();
  console.log("PASS join all fail-fast, late results dropped");
}

// Rejection of an awaited import propagates to the caller's promise.
{
  const base = chunkDeferreds.length;
  const p = api.failingConcat();
  await tick();
  chunkDeferreds[base].resolve("A");
  await tick();
  chunkDeferreds[base + 1].reject(new Error("chunk-1 failed"));
  await assertRejects(p, /chunk-1 failed/, "a rejected await must reject the task promise");
  console.log("PASS rejection propagation");
}

// Stored promises: bind-then-await, in a loop, rebind, interleaved.
{
  let base = chunkDeferreds.length;
  let p = api.storedAwait();
  await tick();
  check(chunkDeferreds.length === base + 1, "storedAwait must issue exactly once, at bind time");
  chunkDeferreds[base].resolve("AAA");
  check((await p) === "got-AAA", "storedAwait must resolve with the awaited value");
  console.log("PASS stored promise, bind-then-await");

  base = chunkDeferreds.length;
  p = api.storedLoop();
  await tick();
  for (let i = 0; i < 3; i++) {
    check(chunkDeferreds.length === base + i + 1, "storedLoop must issue one promise per iteration");
    chunkDeferreds[base + i].resolve("ABC"[i]);
    await tick();
  }
  check((await p) === "ABC", "storedLoop must resolve results in order");
  console.log("PASS stored promise in a loop, in order");

  base = chunkDeferreds.length;
  p = api.storedRebind();
  await tick();
  check(chunkDeferreds.length === base + 2, "storedRebind must issue twice");
  chunkDeferreds[base].resolve("OLD");
  chunkDeferreds[base + 1].resolve("NEW");
  check((await p) === "got-NEW", "storedRebind must resolve with the rebound promise");
  console.log("PASS stored promise rebind to a fresh call");

  base = chunkDeferreds.length;
  p = api.storedInterleave();
  await tick();
  check(chunkDeferreds.length === base + 2, "storedInterleave must issue both promises before awaiting");
  chunkDeferreds[base].resolve("A");
  await tick();
  chunkDeferreds[base + 1].resolve("B");
  check((await p) === "AB", "storedInterleave must resolve both stored values");
  console.log("PASS stored promises interleaved, issue-all then await");

  check((await api.storedFast()) === "got-FAST", "a promise resolved before the await must still deliver its value");
  console.log("PASS stored promise already resolved before await");
}

// Double consumption of a stored promise fails loudly.
{
  const base = chunkDeferreds.length;
  const p = api.doubleAwait();
  await tick();
  chunkDeferreds[base].resolve("A");
  await assertRejects(p, /already-consumed/, "a second await of the same stored promise must fail loudly");
  console.log("PASS stored promise double consumption fails loudly");
}

// Stored externref promise: token at bind time, value through the spill slot.
{
  const hBase = handleDeferreds.length;
  const uBase = useDeferreds.length;
  const p = api.storedHandle();
  await tick();
  check(handleDeferreds.length === hBase + 1, "storedHandle must issue getHandle once, at bind time");
  handleDeferreds[hBase].resolve(sentinel);
  await tick();
  check(seenHandles[uBase] === sentinel, "storedHandle must keep externref identity across the stored await");
  useDeferreds[uBase].resolve(42);
  check((await p) === 42, "storedHandle must resolve 42");
  console.log("PASS stored externref promise");
}

// Nested await: the inner task is driven, its result (not the inner
// import's raw value) reaches the outer resume.
{
  let base = numDeferreds.length;
  const p = api.outerAdd(10);
  await tick();
  check(numDeferreds.length === base + 1, "outerAdd must issue the inner import once");
  numDeferreds[base].resolve(5);
  check((await p) === 30, "outerAdd(10) with inner 10+5 must resolve 30");
  console.log("PASS nested await, inner result delivered to outer");

  base = numDeferreds.length;
  const p2 = api.outerCatch(10);
  await tick();
  numDeferreds[base].reject(new Error("inner-boom"));
  check((await p2) === "caught:inner-boom", "an inner failure must land in the outer catch");
  console.log("PASS nested await, inner failure lands in outer catch");

  base = numDeferreds.length;
  const p3 = api.outerNoCatch(10);
  await tick();
  numDeferreds[base].reject(new Error("inner-boom-2"));
  await assertRejects(p3, /inner-boom-2/, "an inner failure without a catch must reject the outer with the inner message");
  console.log("PASS nested await, inner failure rejects outer");

  base = numDeferreds.length;
  const p4 = api.arrowed();
  await tick();
  check(numDeferreds.length === base + 1, "arrowed must issue the inner import once");
  numDeferreds[base].resolve(10);
  check((await p4) === 12, "awaited async arrow must resolve (10+1)+1");
  console.log("PASS nested await of an extracted async arrow");
}

// Closure counter across an await: 1 then 2, shared storage exact.
{
  const base = chunkDeferreds.length;
  const p = api.closureCounter();
  await tick();
  chunkDeferreds[base].resolve("X");
  check((await p) === 12, "closure counter must read 1 then 2 across the await");
  console.log("PASS closure counter 1-then-2 across await");
}

// A rejection that lands in a catch must drive the catch, not fail the task.
{
  const base = chunkDeferreds.length;
  const p = api.catchReject();
  await tick();
  chunkDeferreds[base].reject(new Error("caught-boom"));
  const caught = await p;
  check(caught === "caught:caught-boom", "a rejected await inside try/catch must resolve with the caught value, got " + caught);
  console.log("PASS rejection resumes into catch");
}

// The catch may await again: the resumed step must re-suspend and drive.
{
  const base = chunkDeferreds.length;
  const p = api.catchThenAwait();
  await tick();
  chunkDeferreds[base].reject(new Error("first-boom"));
  await tick();
  check(chunkDeferreds.length === base + 2, "catchThenAwait must issue the second await after the catch, got " + chunkDeferreds.length);
  chunkDeferreds[base + 1].resolve("D");
  check((await p) === "caught:first-boom+D", "catchThenAwait must resolve with the caught value plus the second await");
  console.log("PASS rejection resumes into catch, then awaits again");
}

// Finally runs exactly once across a caught rejection.
{
  const base = chunkDeferreds.length;
  const p = api.catchRejectFinally();
  await tick();
  chunkDeferreds[base].reject(new Error("fin-boom"));
  check((await p) === "caught:fin-boom!finally", "finally must run exactly once across a caught rejection");
  console.log("PASS finally exactly once across a caught rejection");
}

// Void task resolves undefined.
{
  const base = chunkDeferreds.length;
  const p = api.voidTask();
  await tick();
  chunkDeferreds[base].resolve("x");
  check((await p) === undefined, "void task must resolve undefined");
  console.log("PASS void task");
}

// Spill-pool FIFO queue: each handleRoundtrip holds 2 of the 8 slots, so
// 4 concurrent tasks fill the pool and the 5th must queue, then start
// when one settles. No other task is in flight here.
{
  const hBase = handleDeferreds.length;
  const uBase = useDeferreds.length;
  const results = [];
  const tasks = [];
  for (let i = 0; i < 5; i++) {
    const p = api.handleRoundtrip();
    p.then((v) => results.push(v));
    tasks.push(p);
  }
  await tick();
  check(handleDeferreds.length === hBase + 4, "only 4 of 5 externref tasks may start, got " + (handleDeferreds.length - hBase));
  for (let i = 0; i < 4; i++) {
    handleDeferreds[hBase + i].resolve(sentinel);
    await tick();
    check(seenHandles[uBase + i] === sentinel, "queued-pool task " + i + " must keep externref identity");
    useDeferreds[uBase + i].resolve(42);
    await tick();
  }
  check(handleDeferreds.length === hBase + 5, "the queued 5th task must start once a slot frees");
  handleDeferreds[hBase + 4].resolve(sentinel);
  await tick();
  check(seenHandles[uBase + 4] === sentinel, "queued task must keep externref identity");
  useDeferreds[uBase + 4].resolve(42);
  await Promise.all(tasks);
  check(results.join(",") === "42,42,42,42,42", "all 5 pool tasks must resolve 42, got " + results);
  console.log("PASS spill-pool FIFO queue (4 start, 5th queues, then runs)");
}

// Trap slot reclaim: fill the pool, trap a task on resume and a task on
// entry, and the queued tasks must run instead of stalling behind the
// leaked slots. No slots may leak: a fresh set of 4 tasks must all start
// after every trap.
{
  const hBase = handleDeferreds.length;
  const uBase = useDeferreds.length;
  const results = [];
  const traps = [];
  for (let i = 0; i < 4; i++) {
    const p = api.trapRoundtrip();
    p.then(
      () => results.push("ok"),
      (e) => results.push("trap:" + e.message)
    );
    traps.push(p);
  }
  await tick();
  check(handleDeferreds.length === hBase + 4, "4 trap tasks must fill the pool, got " + (handleDeferreds.length - hBase));
  const entryTrap = api.trapEntry(sentinel);
  entryTrap.then(
    () => results.push("entry-ok"),
    (e) => results.push("entry-trap:" + e.message)
  );
  const queued = api.handleRoundtrip();
  queued.then((v) => results.push(v));
  await tick();
  check(handleDeferreds.length === hBase + 4, "no queued task may start while the pool is full");
  handleDeferreds[hBase].resolve(sentinel);
  await tick();
  check(results[0] && results[0].startsWith("trap:"), "resumed trap task must reject, got " + results[0]);
  check(/unreachable/.test(results[0]), "resumed trap must report the trap, got " + results[0]);
  await tick();
  check(results[1] && results[1].startsWith("entry-trap:"), "entry trap task must reject, got " + results[1]);
  check(/unreachable/.test(results[1]), "entry trap must report the trap, got " + results[1]);
  check(handleDeferreds.length === hBase + 5, "the queued handleRoundtrip must start once the trapped slots free, got " + (handleDeferreds.length - hBase));
  handleDeferreds[hBase + 4].resolve(sentinel);
  await tick();
  check(seenHandles[uBase] === sentinel, "queued task must keep externref identity");
  useDeferreds[uBase].resolve(42);
  check((await queued) === 42, "queued task must resolve 42");
  for (let i = 1; i < 4; i++) {
    handleDeferreds[hBase + i].resolve(sentinel);
    await tick();
  }
  await Promise.allSettled(traps);
  check(
    results.filter((r) => typeof r === "string" && r.startsWith("trap:")).length === 4,
    "all 4 trap tasks must reject, got " + results.join(",")
  );
  const freshBase = handleDeferreds.length;
  const fresh = [];
  for (let i = 0; i < 4; i++) fresh.push(api.handleRoundtrip());
  await tick();
  check(handleDeferreds.length === freshBase + 4, "a fresh 4 tasks must all start (no leaked slots), got " + (handleDeferreds.length - freshBase));
  for (let i = 0; i < 4; i++) {
    handleDeferreds[freshBase + i].resolve(sentinel);
    await tick();
    useDeferreds[uBase + 1 + i].resolve(42);
  }
  check((await Promise.all(fresh)).join(",") === "42,42,42,42", "fresh tasks must all resolve 42");
  console.log("PASS trap slot reclaim (resume trap + entry trap, queued tasks run, no leak)");
}

// No --exportRuntime: the wasm-side mint exports replace __new for
// tokens, string lowering and error messages, so a module with no
// classes drives fully without the flag.
{
  const dirNoRt = mkdtempSync(join(tmpdir(), "async-coord-nort-"));
  copyFileSync(join(fixtures, "coordinator.ts"), join(dirNoRt, "coordinator.ts"));
  const wasmNoRt = compileTo(dirNoRt, "coordinator.ts", ["--debug", "--enable", "reference-types"]);
  const coordNoRt = join(dirNoRt, "coordinator.async.js");
  check(existsSync(coordNoRt), "coordinator.async.js must be emitted without --exportRuntime");
  const bytesNoRt = readFileSync(wasmNoRt);
  const exportNames = WebAssembly.Module.exports(new WebAssembly.Module(bytesNoRt)).map((e) => e.name);
  check(!exportNames.includes("__new"), "wasm without --exportRuntime must not export __new");
  check(exportNames.includes("__async_coordinator_mint"), "wasm must export the token mint");
  check(exportNames.includes("__async_coordinator_mint_string"), "wasm must export the string mint");
  const { instantiateAsync: instantiateNoRt } = await import(pathToFileURL(coordNoRt).href);
  const nrChunks = [];
  const nrHandles = [];
  const nrUses = [];
  const nrSentinel = { tag: "no-rt-handle" };
  const apiNoRt = await instantiateNoRt(bytesNoRt, {
    env: {
      getChunk(i) {
        const d = deferred();
        nrChunks.push(d);
        return d.promise;
      },
      getHandle() {
        const d = deferred();
        nrHandles.push(d);
        return d.promise;
      },
      useHandle(h) {
        check(h === nrSentinel, "no-rt handleRoundtrip must keep externref identity");
        const d = deferred();
        nrUses.push(d);
        return d.promise;
      },
      // Unused by the driven functions, but the coordinator requires a
      // binding for every suspending import in the module.
      getNumber() {
        return new Promise(() => {});
      },
      issueNumber() {
        return 0;
      },
      joinNumbers() {
        return new Promise(() => {});
      }
    }
  });
  const pNoRt = apiNoRt.concatThree();
  await tick();
  nrChunks[0].resolve("AAA");
  await tick();
  nrChunks[1].resolve("BBB");
  await tick();
  nrChunks[2].resolve("CCC");
  check((await pNoRt) === "AAABBBCCC", "loop+await must work without --exportRuntime");
  console.log("PASS no --exportRuntime: loop+await through the wasm mint");

  const pHandle = apiNoRt.handleRoundtrip();
  await tick();
  nrHandles[0].resolve(nrSentinel);
  await tick();
  nrUses[0].resolve(42);
  check((await pHandle) === 42, "externref roundtrip must work without --exportRuntime");
  console.log("PASS no --exportRuntime: externref identity across await");

  const base = nrChunks.length;
  const pFail = apiNoRt.failingConcat();
  await tick();
  nrChunks[base].resolve("A");
  await tick();
  nrChunks[base + 1].reject(new Error("chunk-1 failed"));
  await assertRejects(pFail, /chunk-1 failed/, "rejection must propagate without --exportRuntime (error message via the string mint)");
  console.log("PASS no --exportRuntime: rejection propagates with its message");
}

// Join engine unit checks for the policies the e2e does not drive.
{
  const settled = await joinPromises("allSettled", [
    Promise.resolve(1),
    Promise.reject(new Error("x")),
    Promise.resolve(3)
  ]);
  check(settled.length === 3, "allSettled must report every member");
  check(settled[0].status === "fulfilled" && settled[0].value === 1, "allSettled member 0");
  check(settled[1].status === "rejected" && settled[1].reason.message === "x", "allSettled member 1");
  check(settled[2].status === "fulfilled" && settled[2].value === 3, "allSettled member 2");
  const anyValue = await joinPromises("any", [
    Promise.reject(new Error("a")),
    Promise.resolve(7),
    Promise.reject(new Error("b"))
  ]);
  check(anyValue === 7, "any must resolve with the first fulfillment");
  const anyError = await assertRejects(
    joinPromises("any", [Promise.reject(new Error("a")), Promise.reject(new Error("b"))]),
    /All promises were rejected/,
    "any must reject when every member rejects"
  );
  check(Array.isArray(anyError.errors) && anyError.errors.length === 2, "any rejection must carry all errors");
  console.log("PASS join engine allSettled/any");
}

// Real join through chunk 5's wasm side + the generated coordinator:
// Promise.all/race/any, driven by plain async getNumber bindings.
{
  const wasmBytes = readFileSync(compile("join.ts"));
  const joinCoord = join(dir, "join.async.js");
  check(existsSync(joinCoord), "join.async.js must be emitted for the join fixture");
  const { instantiateAsync: instantiateJoin } = await import(pathToFileURL(joinCoord).href);
  const joinMembers = [];
  const joinApi = await instantiateJoin(wasmBytes, {
    env: {
      getNumber() {
        const d = deferred();
        joinMembers.push(d);
        return d.promise;
      }
    }
  });

  let base = joinMembers.length;
  let p = joinApi.allNumbers();
  await tick();
  check(joinMembers.length === base + 3, "allNumbers must issue 3 members");
  joinMembers[base + 2].resolve(30);
  joinMembers[base].resolve(10);
  joinMembers[base + 1].resolve(20);
  check((await p) === "10|20|30", "real join all must deliver results in argument order");
  console.log("PASS real join all, out-of-order delivery, in-order results");

  base = joinMembers.length;
  p = joinApi.allFailFast();
  await tick();
  joinMembers[base].resolve(1);
  joinMembers[base + 1].reject(new Error("boom-b"));
  await assertRejects(p, /boom-b/, "real join all must fail fast on the first rejection");
  console.log("PASS real join all fail-fast");

  check((await joinApi.allEmpty()) === "0", "real join all([]) must resolve empty");
  console.log("PASS real join all([])");

  base = joinMembers.length;
  p = joinApi.raceNumbers();
  await tick();
  joinMembers[base + 1].resolve(20);
  check((await p) === 20, "real join race must resolve with the first fulfillment");
  joinMembers[base].resolve(10);
  await tick();
  console.log("PASS real join race, late result dropped");

  base = joinMembers.length;
  p = joinApi.raceNumbers();
  await tick();
  joinMembers[base].reject(new Error("race-boom"));
  await assertRejects(p, /race-boom/, "real join race must reject on the first rejection");
  joinMembers[base + 1].resolve(99);
  await tick();
  console.log("PASS real join race rejection");

  base = joinMembers.length;
  p = joinApi.anyNumbers();
  await tick();
  joinMembers[base].reject(new Error("no-a"));
  joinMembers[base + 1].resolve(42);
  check((await p) === 42, "real join any must resolve with the first fulfillment");
  console.log("PASS real join any");

  base = joinMembers.length;
  p = joinApi.anyNumbers();
  await tick();
  joinMembers[base].reject(new Error("no-a"));
  joinMembers[base + 1].reject(new Error("no-b"));
  const anyError = await assertRejects(p, /AggregateError: no-a; no-b/, "real join any must reject when all members reject");
  check(anyError.message === "AggregateError: no-a; no-b", "real join any rejection message must list errors in order");
  console.log("PASS real join any all-rejected");

  // Dynamic join: loop-built member list. The coordinator must return a
  // fresh heap-pointer token per suspending-import call: a small-int token
  // is a bogus reference that the GC links in Array#push and traps.
  base = joinMembers.length;
  p = joinApi.dynamicAll();
  await tick();
  check(joinMembers.length === base + 3, "dynamicAll must issue 3 members");
  joinMembers[base + 2].resolve(30);
  joinMembers[base].resolve(10);
  joinMembers[base + 1].resolve(20);
  check((await p) === "10|20|30", "real dynamic join must deliver results in argument order");
  console.log("PASS real dynamic join, loop-built member list");

  // An await site after a join site in the same function: the site
  // enumeration must include both (join sites have no resume_<n>).
  base = joinMembers.length;
  p = joinApi.joinThenAwait();
  await tick();
  check(joinMembers.length === base + 2, "joinThenAwait must issue 2 join members first, got " + (joinMembers.length - base));
  joinMembers[base].resolve(1);
  joinMembers[base + 1].resolve(2);
  await tick();
  check(joinMembers.length === base + 3, "joinThenAwait must issue the post-join await after the join, got " + (joinMembers.length - base));
  joinMembers[base + 2].resolve(3);
  check((await p) === "1|2:3", "join followed by await must return both results in order");
  console.log("PASS await site after join site");

  // allSettled through the real wasm join, mixed fulfill/reject.
  base = joinMembers.length;
  p = joinApi.settledNumbers();
  await tick();
  joinMembers[base].resolve(10);
  joinMembers[base + 1].reject(new Error("bad"));
  joinMembers[base + 2].resolve(30);
  const settled = await p;
  check(settled === "ok10;nobad;ok30;", "real join allSettled must report every member, got " + settled);
  console.log("PASS real join allSettled, mixed fulfill/reject");
}

// Async methods through the generated coordinator: wrapper classes,
// instance state across await, concurrent instances, method->method
// (incl. nested), rejection, method awaited from an async top-level fn,
// guardedNested through the coordinator, externref method tasks through
// the slot pool, and dispose() behaviour.
{
  const wasmBytes = readFileSync(compile("methods.ts"));
  const methodsCoord = join(dir, "methods.async.js");
  check(existsSync(methodsCoord), "methods.async.js must be emitted for the methods fixture");
  const { instantiateAsync: instantiateMethods } = await import(pathToFileURL(methodsCoord).href);
  const methodNums = [];
  const methodHandles = [];
  const methodUses = [];
  const methodSeenHandles = [];
  const methodLogs = [];
  let methodsMemory = null;
  const sentinel = { tag: "method-handle" };
  const methodsApi = await instantiateMethods(wasmBytes, {
    env: {
      getNumber() {
        const d = deferred();
        methodNums.push(d);
        return d.promise;
      },
      getHandle() {
        const d = deferred();
        methodHandles.push(d);
        return d.promise;
      },
      useHandle(h) {
        methodSeenHandles.push(h);
        const d = deferred();
        methodUses.push(d);
        return d.promise;
      },
      log(p) {
        methodLogs.push(getStringFromMemory(methodsMemory, p));
      }
    }
  });
  methodsMemory = methodsApi.exports.memory;
  check(typeof methodsApi.Counter === "function", "generated coordinator must expose a Counter wrapper class");
  check(typeof methodsApi.Worker === "function", "generated coordinator must expose a Worker wrapper class");
  check(typeof methodsApi.viaObj === "function", "generated coordinator must expose the async top-level fn viaObj");
  console.log("PASS methods coordinator file emitted with the wrapper classes");

  // Basic method, known values from the integration probe: add(5) with
  // getNumber()=7 gives 12, then add(100) gives 119, viaArrow(1) gives
  // 130. Fields mutated before and after the await are both observed.
  {
    const c = new methodsApi.Counter();
    let p = c.add(5);
    await tick();
    methodNums[0].resolve(7);
    check((await p) === 12, "Counter.add(5) with getNumber()=7 must give 12");
    p = c.add(100);
    await tick();
    methodNums[1].resolve(7);
    check((await p) === 119, "Counter.add(100) on the same instance must give 119");
    p = c.viaArrow(1);
    await tick();
    methodNums[2].resolve(7);
    check((await p) === 130, "Counter.viaArrow(1) must give 130");
    c.dispose();
    console.log("PASS basic async method, known values 12/119/130");
  }

  // Two instances driven concurrently keep independent counts.
  {
    const c = new methodsApi.Counter();
    const d = new methodsApi.Counter();
    const base = methodNums.length;
    const p1 = c.add(1);
    const p2 = d.add(2);
    await tick();
    check(methodNums.length === base + 2, "concurrent method calls must issue two awaits");
    methodNums[base].resolve(7);
    methodNums[base + 1].resolve(7);
    const v1 = await p1;
    const v2 = await p2;
    check(v1 === 8, "first concurrent instance must give 8, got " + v1);
    check(v2 === 9, "second concurrent instance must give 9, got " + v2);
    c.dispose();
    d.dispose();
    console.log("PASS two instances driven concurrently, independent counts");
  }

  // Method awaiting a method of the same instance.
  {
    const w = new methodsApi.Worker();
    const base = methodNums.length;
    const p = w.viaThis(5);
    await tick();
    methodNums[base].resolve(7);
    check((await p) === 12, "viaThis(5) with helper 5+7 must give 12");
    w.dispose();
    console.log("PASS method awaiting a method of the same instance");
  }

  // Nested: method -> method -> import.
  {
    const w = new methodsApi.Worker();
    const base = methodNums.length;
    const p = w.viaNested(5);
    await tick();
    methodNums[base].resolve(7);
    check((await p) === 13, "viaNested(5) must give 12+1");
    w.dispose();
    console.log("PASS nested method -> method -> import");
  }

  // A method whose awaited import rejects rejects its Promise.
  {
    const c = new methodsApi.Counter();
    const base = methodNums.length;
    const p = c.fail(3);
    await tick();
    methodNums[base].reject(new Error("method-boom"));
    await assertRejects(p, /method-boom/, "a rejecting method await must reject the method promise");
    c.dispose();
    console.log("PASS method rejection propagates to the Promise");
  }

  // Method awaited from an async top-level fn, with and without a catch.
  {
    let base = methodNums.length;
    const p = methodsApi.viaObj(10);
    await tick();
    methodNums[base].resolve(7);
    check((await p) === 17, "viaObj(10) with helper 10+7 must give 17");
    console.log("PASS method awaited from an async top-level fn");

    base = methodNums.length;
    const p2 = methodsApi.viaObjGuarded(10);
    await tick();
    methodNums[base].reject(new Error("inner-boom"));
    check((await p2) === -1, "an inner method failure must land in the outer catch and return -1");
    check(methodLogs.join(",") === "catch:inner-boom", "outer catch must log the inner message, got " + methodLogs);
    methodLogs.length = 0;
    console.log("PASS inner method failure reaches the outer catch");
  }

  // guardedNested through the coordinator: method awaiting a method
  // inside its own try/catch, deliver and reject paths.
  {
    const w = new methodsApi.Worker();
    let base = methodNums.length;
    const p = w.guardedNested(5);
    await tick();
    methodNums[base].resolve(7);
    check((await p) === 12, "guardedNested deliver must give 12");
    check(methodLogs.join(",") === "finally", "guardedNested deliver must log only finally, got " + methodLogs);
    methodLogs.length = 0;
    console.log("PASS guardedNested deliver through the coordinator");

    base = methodNums.length;
    const p2 = w.guardedNested(5);
    await tick();
    methodNums[base].reject(new Error("coord-boom"));
    check((await p2) === -1, "guardedNested reject must return -1");
    check(methodLogs.join(",") === "catch:coord-boom,finally", "guardedNested reject must log catch then finally, got " + methodLogs);
    methodLogs.length = 0;
    w.dispose();
    console.log("PASS guardedNested reject through the coordinator");
  }

  // Externref-carrying method task through the slot pool: identity
  // preserved across suspension.
  {
    const c = new methodsApi.Counter();
    const hBase = methodHandles.length;
    const uBase = methodUses.length;
    const p = c.handleRoundtrip();
    await tick();
    check(methodHandles.length === hBase + 1, "method handleRoundtrip must call getHandle once");
    methodHandles[hBase].resolve(sentinel);
    await tick();
    check(methodSeenHandles[uBase] === sentinel, "externref identity must survive the method await");
    methodUses[uBase].resolve(42);
    check((await p) === 42, "method handleRoundtrip must resolve 42");
    c.dispose();
    console.log("PASS externref identity across a method await");
  }

  // Method externref tasks share the slot pool with the same bound: each
  // holds 2 of the 8 slots, so 4 concurrent tasks fill the pool and the
  // 5th must queue, then start when one settles.
  {
    const hBase = methodHandles.length;
    const uBase = methodUses.length;
    const results = [];
    const tasks = [];
    const counters = [];
    for (let i = 0; i < 5; i++) {
      const cc = new methodsApi.Counter();
      counters.push(cc);
      const p = cc.handleRoundtrip();
      p.then((v) => results.push(v));
      tasks.push(p);
    }
    await tick();
    check(methodHandles.length === hBase + 4, "only 4 of 5 method externref tasks may start, got " + (methodHandles.length - hBase));
    for (let i = 0; i < 4; i++) {
      methodHandles[hBase + i].resolve(sentinel);
      await tick();
      check(methodSeenHandles[uBase + i] === sentinel, "queued-pool method task " + i + " must keep externref identity");
      methodUses[uBase + i].resolve(42);
      await tick();
    }
    check(methodHandles.length === hBase + 5, "the queued 5th method task must start once a slot frees");
    methodHandles[hBase + 4].resolve(sentinel);
    await tick();
    check(methodSeenHandles[uBase + 4] === sentinel, "queued method task must keep externref identity");
    methodUses[uBase + 4].resolve(42);
    await Promise.all(tasks);
    check(results.join(",") === "42,42,42,42,42", "all 5 method pool tasks must resolve 42, got " + results);
    for (const cc of counters) cc.dispose();
    console.log("PASS method externref tasks through the spill-pool FIFO queue");
  }

  // dispose() is idempotent and disposed calls throw synchronously.
  {
    const doomed = new methodsApi.Counter();
    doomed.dispose();
    doomed.dispose();
    let threw = null;
    try {
      doomed.add(5);
    } catch (e) {
      threw = e;
    }
    check(threw instanceof Error && /has been disposed/.test(threw.message), "a disposed call must throw synchronously, got " + threw);
    console.log("PASS dispose is idempotent, disposed calls throw synchronously");
  }

  // A live wrapper survives heap churn + __collect: the pin keeps the
  // instance alive between tasks, so a later method call still works.
  {
    const c = new methodsApi.Counter();
    methodsApi.exports.__collect();
    methodsApi.exports.allocSpam(2000);
    methodsApi.exports.__collect();
    methodsApi.exports.allocSpam(2000);
    methodsApi.exports.__collect();
    const base = methodNums.length;
    const p = c.add(5);
    await tick();
    methodNums[base].resolve(7);
    check((await p) === 12, "pinned instance must still drive after churn + __collect");
    c.dispose();
    console.log("PASS pinned instance survives churn + __collect");
  }
}

console.log("ALL COORDINATOR TESTS PASS");
