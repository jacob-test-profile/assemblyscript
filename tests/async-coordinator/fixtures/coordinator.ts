// Fixture for the chunk 6 generated-JS coordinator e2e
// (tests/async-coordinator/run.mjs). Real transform, no hand-lowered
// state machines: every async fn here is driven by the generated
// `<base>.async.js` coordinator.

//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

//@ external("env", "getHandle")
declare function getHandle(): Promise<externref>;

//@ external("env", "useHandle")
declare function useHandle(h: externref): Promise<i32>;

//@ external("env", "issueNumber")
declare function issueNumber(i: i32): i32;

//@ external("env", "joinNumbers")
declare function joinNumbers(policy: i32): Promise<string>;

export async function concatThree(): Promise<string> {
  let out = "";
  for (let i = 0; i < 3; i++) {
    let chunk = await getChunk(i);
    out = out + chunk;
  }
  return out;
}

export async function handleRoundtrip(): Promise<i32> {
  let h = await getHandle();
  let n = await useHandle(h);
  return n;
}

// Test-only join driver shape (chunk 5 has not landed the wasm side of
// Promise.all): the test bindings issue member promises through
// createJoinRegistry() and join them in joinNumbers().
export async function fanout(policy: i32): Promise<string> {
  issueNumber(0);
  issueNumber(1);
  issueNumber(2);
  return await joinNumbers(policy);
}

export async function failingConcat(): Promise<string> {
  let a = await getChunk(0);
  let b = await getChunk(1);
  return a + b;
}

// A rejection of the awaited import lands in the enclosing catch and the
// task resolves with the caught value instead of failing.
export async function catchReject(): Promise<string> {
  try {
    let c = await getChunk(0);
    return "ok-" + c;
  } catch (e) {
    return "caught:" + e;
  }
}

// The catch body may await again: the resumed step re-suspends and the
// coordinator drives the second await.
export async function catchThenAwait(): Promise<string> {
  try {
    let c = await getChunk(0);
    return "ok-" + c;
  } catch (e) {
    let d = await getChunk(1);
    return "caught:" + e + "+" + d;
  }
}

// Finally runs exactly once across a caught rejection.
export async function catchRejectFinally(): Promise<string> {
  let out = "";
  try {
    let c = await getChunk(0);
    return "ok-" + c;
  } catch (e) {
    out = "caught:" + e;
  } finally {
    out = out + "!finally";
  }
  return out;
}

export async function voidTask(): Promise<void> {
  await getChunk(0);
}

// Allocates garbage so the e2e can churn the heap (plus __collect) while
// a task is suspended, proving the roots registry keeps it alive.
export function allocSpam(n: i32): void {
  for (let i = 0; i < n; i++) {
    let s = "spam-" + i.toString() + "-spam";
    if (s.length == 0) throw new Error("unreachable");
  }
}
