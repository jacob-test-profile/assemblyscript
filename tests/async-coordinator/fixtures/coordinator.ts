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

//@ external("env", "getFlag")
declare function getFlag(i: i32): Promise<bool>;

//@ external("env", "joinNumbers")
declare function joinNumbers(policy: i32): Promise<string>;

export function combine(a: string, b: string): string {
  return a + b;
}

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

export function boom(): void {
  unreachable();
}

// Traps after the first await, while holding both spill slots: the
// coordinator must reclaim them so a queued task can start.
export async function trapRoundtrip(): Promise<i32> {
  let h = await getHandle();
  boom();
  let n = await useHandle(h);
  return n;
}

// Traps before the first await, while holding the parameter's spill slot:
// the entry never returns a handle, so the coordinator must recover it
// from the last-handle global.
export async function trapEntry(h: externref): Promise<i32> {
  boom();
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

// An uncaught Error object rejects the task with the Error's message.
export async function throwErrorUncaught(): Promise<string> {
  throw new Error("coord-err");
  return "unreachable";
}

// An uncaught string rejects the task with the string.
export async function throwStringUncaught(): Promise<string> {
  throw "coord-str";
  return "unreachable";
}

// An uncaught number rejects the task with its toString.
export async function throwNumberUncaught(): Promise<string> {
  throw 42;
  return "unreachable";
}

// A caught Error: the catch sees the Error's message.
export async function throwErrorCaught(): Promise<string> {
  try {
    throw new Error("coord-caught");
  } catch (e) {
    return "caught:" + e;
  }
  return "unreachable";
}

// throw await <string>: the awaited string is the thrown value.
export async function throwAwaitString(): Promise<string> {
  throw await getChunk(0);
  return "unreachable";
}

// throw await <number>: the awaited number is the thrown value.
export async function throwAwaitNumber(): Promise<string> {
  throw await getNumber();
  return "unreachable";
}

// throw await caught: the awaited string is caught with its message.
export async function throwAwaitCaught(): Promise<string> {
  try {
    throw await getChunk(0);
  } catch (e) {
    return "caught:" + e;
  }
  return "unreachable";
}

// A rejection of the await inside `throw await` reaches the catch, not
// the throw's (zero) bound value.
export async function throwAwaitRejected(): Promise<string> {
  try {
    throw await getChunk(0);
  } catch (e) {
    return "caught:" + e;
  }
  return "unreachable";
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

export async function storedFieldRead(): Promise<string> {
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

// Await in switch: the dispatch survives suspension; fallthrough from
// one case into the next and the default keep their ordinary meaning.
export async function switchAwait(n: i32): Promise<string> {
  let out = "";
  switch (n) {
    case 1: out = await getChunk(0); break;
    case 2: out = await getChunk(1);
    case 3: { let c = await getChunk(2); out = out + c; break; }
    default: out = "dflt";
  }
  return out;
}

// Compound assignment with await: the read happens before the suspension.
export async function compoundStr(): Promise<string> {
  let out = "";
  out += await getChunk(0);
  out += await getChunk(1);
  return out;
}

export async function compoundNum(): Promise<i32> {
  let n = 10;
  n += await getNumber();
  n -= await getNumber();
  n *= await getNumber();
  n /= await getNumber();
  n %= await getNumber();
  n <<= await getNumber();
  n &= await getNumber();
  n |= await getNumber();
  n ^= await getNumber();
  n >>= await getNumber();
  return n;
}

class Box {
  s: string = "";
  n: i32 = 0;
  chunks: Array<string> = new Array<string>();
}

// Field-assignment await and compound assignment to a field.
export async function fieldAssign(): Promise<string> {
  let w = new Box();
  w.s = await getChunk(2);
  w.n = await getNumber();
  return w.s + w.n.toString();
}

export async function fieldCompound(): Promise<string> {
  let w = new Box();
  w.s = "x";
  w.s += await getChunk(0);
  w.n = 1;
  w.n += await getNumber();
  return w.s + w.n.toString();
}

// A join awaited into a field.
export async function fieldJoin(): Promise<string> {
  let w = new Box();
  w.chunks = await Promise.all([getChunk(0), getChunk(1)]);
  return w.chunks[0] + w.chunks[1];
}

// Element-assignment await; the index side effect happens before the suspension.
export async function elemAssign(): Promise<string> {
  let arr = new Array<string>(2);
  let i = 0;
  arr[i++] = await getChunk(0);
  arr[i] = await getChunk(1);
  return arr[0] + arr[1] + i.toString();
}

// The awaited call's argument observes the index side effect: j is 1 here.
export async function indexOrder(): Promise<i32> {
  let arr = new Array<string>(2);
  let j = 0;
  arr[j++] = await getChunk(j);
  return j;
}

export async function elemCompound(): Promise<i32> {
  let arr = new Array<i32>(1);
  arr[0] = 100;
  arr[0] += await getNumber();
  return arr[0];
}

// A stored promise awaited into a field.
export async function storedField(): Promise<string> {
  let w = new Box();
  let p = getChunk(3);
  w.s = await p;
  return w.s;
}

// Await in an if condition.
export async function ifCondFlag(): Promise<string> {
  if (await getFlag(0)) {
    return "YES";
  }
  return "NO";
}

// Await in a while condition: re-evaluated on every iteration.
export async function whileCondFlag(): Promise<string> {
  let out = "";
  let i = 0;
  while (await getFlag(i)) {
    out += await getChunk(i);
    i++;
  }
  return out;
}

// A switch inside a loop: continue skips to the next iteration, break
// leaves the switch only.
export async function switchInLoop(): Promise<string> {
  let out = "";
  for (let i = 0; i < 4; i++) {
    switch (i) {
      case 1: continue;
      case 2: { let c = await getChunk(2); out = out + c; break; }
      default: out = out + "x";
    }
  }
  return out;
}

// Await in a for condition: re-evaluated on every iteration.
export async function forCondFlag(): Promise<string> {
  let out = "";
  for (let i = 0; await getFlag(i); i++) {
    out += await getChunk(i);
  }
  return out;
}

// A finally may await: it runs exactly once, never on suspend.
export async function finallyAwait(mode: i32): Promise<string> {
  let out = "";
  try {
    let c = await getChunk(0);
    if (mode == 1) throw "body-boom";
    out = "ok-" + c;
  } catch (e) {
    out = "caught";
  } finally {
    let d = await getChunk(1);
    out = out + "/" + d;
  }
  return out;
}

// Await in a do-while condition: evaluated after each body run.
export async function doCondFlag(): Promise<string> {
  let out = "";
  let i = 0;
  do {
    out += await getChunk(i);
    i++;
  } while (await getFlag(i));
  return out;
}

// Await in a for incrementor: runs after each body run.
export async function forIncrFlag(): Promise<string> {
  let out = "";
  for (let i = 0; i < 2; i += await getNumber()) {
    out += await getChunk(i);
  }
  return out;
}

// A rejection of a finally await replaces the pending body error.
export async function finallyRejectOuter(): Promise<string> {
  try {
    try {
      throw "body-boom";
    } finally {
      await getChunk(0);
    }
  } catch (e) {
    return "outer-caught:" + e;
  }
}

// Try inside a switch case, with catch and finally; a break out of the
// switch from inside the try must still run the finally, then leave.
export async function tryInSwitch(n: i32): Promise<string> {
  let out = "";
  switch (n) {
    case 1:
      try {
        let c = await getChunk(0);
        out = "t-" + c;
        break;
      } catch (e) {
        out = "t-caught";
      } finally {
        out = out + "!";
      }
      out = out + "unreached";
      break;
    case 2:
      try {
        await getChunk(0);
        throw "sw-boom";
      } catch (e) {
        out = "sw-caught:" + e;
      }
      break;
    default: out = "sw-dflt";
  }
  return out;
}

// For-of over an array: the iterator state survives suspension.
export async function forOfAwait(): Promise<string> {
  let xs = [0, 1, 2];
  let out = "";
  for (const x of xs) {
    let c = await getChunk(x);
    out = out + c;
  }
  return out;
}

export async function forOfBreak(): Promise<i32> {
  let xs = [10, 20, 30, 40];
  let s = 0;
  for (const x of xs) {
    let v = await getNumber();
    if (v == 20) break;
    s += v;
  }
  return s;
}

// Awaits in call arguments, in order.
export async function callArgsHoist(): Promise<string> {
  return combine(await getChunk(0), await getChunk(1));
}

// Awaits as binary operands, in order.
export async function binaryHoist(): Promise<i32> {
  return 1 + await getNumber() + await getNumber();
}

// Await in a ternary condition.
export async function ternaryCondFlag(): Promise<string> {
  return (await getFlag(0)) ? "YES" : "NO";
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

// Default / optional / rest parameters: defaults are filled per call by
// the varargs stub, rest arguments collect into an array, and both
// survive suspension as state fields.
export async function defInt(x: i32 = 5): Promise<i32> {
  const v = await getNumber();
  return x + v;
}
export async function defOther(a: i32, b: i32 = a + 1): Promise<i32> {
  const v = await getNumber();
  return b + v;
}
export async function restNums(first: i32, ...rest: i32[]): Promise<i32> {
  const v = await getNumber();
  let sum = first + v;
  for (let i = 0; i < rest.length; ++i) sum += rest[i];
  return sum;
}
export async function restStrings(...words: string[]): Promise<string> {
  const v = await getChunk(0);
  return words.join(",") + "|" + v;
}

// Allocates garbage so the e2e can churn the heap (plus __collect) while
// a task is suspended, proving the roots registry keeps it alive.
export function allocSpam(n: i32): void {
  for (let i = 0; i < n; i++) {
    let s = "spam-" + i.toString() + "-spam";
    if (s.length == 0) throw new Error("unreachable");
  }
}
