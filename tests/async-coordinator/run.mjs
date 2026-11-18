// End-to-end test for the chunk 6 generated-JS coordinator.
//
// Compiles tests/async-coordinator/fixtures/coordinator.ts with the real
// asc (real CPS transform), asserts the generated `<base>.async.js` was
// emitted next to the wasm, imports it, and drives the async functions
// through its public API only: loop+await, externref identity across an
// await, the join engine (via the test-only join driver — chunk 5 has
// not landed the wasm side of Promise.all), rejection propagation, a
// void task, the spill-pool FIFO queue, and heap churn + __collect
// mid-suspension. Also checks a sync-only module emits no coordinator.
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
for (const name of ["coordinator.ts", "sync.ts", "join.ts"]) {
  copyFileSync(join(fixtures, name), join(dir, name));
}

function compile(name) {
  const base = name.replace(/\.ts$/, "");
  const r = spawnSync(
    process.execPath,
    [ascBin, name, "-o", base + ".wasm", "--exportRuntime", "--debug", "--enable", "reference-types"],
    { cwd: dir, encoding: "utf8" }
  );
  if (r.status !== 0) {
    console.log(r.stdout, r.stderr);
    console.log("FAIL: asc failed for " + name);
    process.exit(1);
  }
  return join(dir, base + ".wasm");
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
      chunkCalls.push(i);
      const d = deferred();
      chunkDeferreds.push(d);
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
}

console.log("ALL COORDINATOR TESTS PASS");
