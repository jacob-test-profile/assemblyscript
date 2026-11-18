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

//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

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

// Stored promises read out of an array or an object field, and copied
// from a tracked binding, all suspend on the issued token.
export async function storedMember(): Promise<string> {
  let arr = new Array<Promise<string>>(2);
  arr[0] = getChunk(0);
  arr[1] = getChunk(1);
  let a = await arr[0];
  let b = await arr[1];
  return a + b;
}

class PromiseBox {
  p: Promise<string> = changetype<Promise<string>>(0);
}

export async function storedField(): Promise<string> {
  let box = new PromiseBox();
  box.p = getChunk(0);
  let c = await box.p;
  return "got-" + c;
}

export async function storedCopy(): Promise<string> {
  let p = getChunk(0);
  let q = p;
  let c = await q;
  return "got-" + c;
}

export async function storedCopyRebind(): Promise<string> {
  let p = getChunk(0);
  let q: Promise<string>;
  q = p;
  let c = await q;
  return "got-" + c;
}

export async function storedCopyMember(): Promise<string> {
  let arr = new Array<Promise<string>>(1);
  arr[0] = getChunk(0);
  let p = arr[0];
  let c = await p;
  return "got-" + c;
}

// A stored promise is issued at bind time and awaited later; the await
// must not re-issue the import.
export async function storedAwait(): Promise<string> {
  let p = getChunk(0);
  let c = await p;
  return "got-" + c;
}

export async function storedLoop(): Promise<string> {
  let out = "";
  for (let i = 0; i < 3; i++) {
    let p = getChunk(i);
    let c = await p;
    out = out + c;
  }
  return out;
}

// Rebinding to a fresh import call binds a fresh token; the orphaned
// first issue is ignored.
export async function storedRebind(): Promise<string> {
  let p = getChunk(0);
  p = getChunk(1);
  let c = await p;
  return "got-" + c;
}

// Two stored promises issued before either is awaited.
export async function storedInterleave(): Promise<string> {
  let p = getChunk(0);
  let q = getChunk(1);
  let a = await p;
  let b = await q;
  return a + b;
}

// Already resolved before the await: the wait still delivers the value.
export async function storedFast(): Promise<string> {
  let p = getChunk(9);
  let c = await p;
  return "got-" + c;
}

// A second await of the same stored promise fails loudly.
export async function doubleAwait(): Promise<string> {
  let p = getChunk(0);
  let a = await p;
  let b = await p;
  return a + b;
}

// A stored externref promise: the token is issued at bind time, the
// externref value crosses the await through the spill slot.
export async function storedHandle(): Promise<i32> {
  let h = getHandle();
  let v = await h;
  let n = await useHandle(v);
  return n;
}

// Nested await: the coordinator drives the inner task and delivers its
// result to the outer resume export (it must not deliver the inner
// import's raw value).
export async function innerAdd(n: i32): Promise<i32> {
  let m = await getNumber();
  return n + m;
}

export async function outerAdd(n: i32): Promise<i32> {
  let r = await innerAdd(n);
  return r * 2;
}

// An inner failure becomes the outer await's rejection, catchable here.
export async function outerCatch(n: i32): Promise<string> {
  try {
    let r = await innerAdd(n);
    return "ok-" + r.toString();
  } catch (e) {
    return "caught:" + e;
  }
}

export async function outerNoCatch(n: i32): Promise<i32> {
  let r = await innerAdd(n);
  return r * 2;
}

// An async arrow awaited as a nested call: the extracted arrow function
// has no export, so the coordinator drives it through the inners map.
export async function arrowed(): Promise<i32> {
  let getTen = async (): Promise<i32> => {
    let m = await getNumber();
    return m + 1;
  };
  let v = await getTen();
  return v + 1;
}

// A closure over a shared counter, called before and after an await:
// the counter must read 1 then 2 across the suspension.
export async function closureCounter(): Promise<i32> {
  let count = 0;
  let inc = (): i32 => {
    count += 1;
    return count;
  };
  let a = inc();
  await getChunk(0);
  let b = inc();
  return a * 10 + b;
}

export async function voidTask(): Promise<void> {
  await getChunk(0);
}

//@ external("env", "getVoid")
declare function getVoid(): Promise<void>;

// Awaiting a Promise<void> completes the suspension with no value: as a
// statement, as the return of a Promise<void> function, through a catch
// when the awaited import rejects, and nested through another async fn.
export async function voidStmt(): Promise<string> {
  await getVoid();
  return "after-void";
}

export async function voidReturn(): Promise<void> {
  return await getVoid();
}

export async function voidCatch(): Promise<string> {
  try {
    await getVoid();
    return "ok";
  } catch (e) {
    return "caught:" + e;
  }
}

export async function innerVoid(): Promise<void> {
  await getVoid();
}

export async function outerVoid(): Promise<string> {
  await innerVoid();
  return "outer-void-done";
}

// Allocates garbage so the e2e can churn the heap (plus __collect) while
// a task is suspended, proving the roots registry keeps it alive.
export function allocSpam(n: i32): void {
  for (let i = 0; i < n; i++) {
    let s = "spam-" + i.toString() + "-spam";
    if (s.length == 0) throw new Error("unreachable");
  }
}
