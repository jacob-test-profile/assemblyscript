// Loop-closure fixture for the close-gaps track (Group 5b): closures
// created in a loop, stored, and called after the loop. JS semantics:
// each closure sees its own iteration's values, not the final value.
// Driven by tests/async-coordinator/run.mjs through the generated
// coordinator only.

//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;
//@ external("env", "getObj")
declare function getObj(): Promise<externref>;

// Loop-variable capture (the original gap: 33, not 39).
export async function loopStored(): Promise<i32> {
  let fns = new Array<(x: i32) => i32>();
  for (let i = 0; i < 3; i++) {
    let f = (x: i32): i32 => x + i;
    fns.push(f);
    let m = await getNumber();
    unchecked(m);
  }
  let total = 0;
  for (let j = 0; j < 3; j++) total += fns[j](10);
  return total;
}

// Loop-body `let` capture: a fresh binding per iteration.
export async function loopBodyLet(): Promise<i32> {
  let fns = new Array<() => i32>();
  for (let i = 0; i < 3; i++) {
    let y = i * 10;
    let f = (): i32 => y;
    fns.push(f);
    let m = await getNumber();
    unchecked(m);
  }
  let total = 0;
  for (let j = 0; j < 3; j++) total += fns[j]();
  return total;
}

// Multiple captures across nested loops, plus a shared outer capture.
export async function loopNested(): Promise<i32> {
  let fns = new Array<() => i32>();
  let base = 100;
  for (let i = 0; i < 2; i++) {
    for (let j = 0; j < 2; j++) {
      let f = (): i32 => base + i * 10 + j;
      fns.push(f);
      let m = await getNumber();
      unchecked(m);
    }
  }
  let total = 0;
  for (let k = 0; k < 4; k++) total += fns[k]();
  return total;
}

// A variable declared OUTSIDE the loop is one shared binding: every
// stored closure sees its final value, as in JS.
export async function loopWhileOuter(): Promise<i32> {
  let fns = new Array<() => i32>();
  let i = 0;
  while (i < 3) {
    let f = (): i32 => i;
    fns.push(f);
    let m = await getNumber();
    unchecked(m);
    i++;
  }
  let total = 0;
  for (let j = 0; j < 3; j++) total += fns[j]();
  return total;
}

// A `let` declared inside a while body is fresh per iteration.
export async function loopWhileInner(): Promise<i32> {
  let fns = new Array<() => i32>();
  let i = 0;
  while (i < 3) {
    let y = i * 10;
    let f = (): i32 => y;
    fns.push(f);
    let m = await getNumber();
    unchecked(m);
    i++;
  }
  let total = 0;
  for (let j = 0; j < 3; j++) total += fns[j]();
  return total;
}

// Reference-typed capture: each closure keeps its own string.
export async function loopStrings(): Promise<string> {
  let fns = new Array<() => string>();
  for (let i = 0; i < 3; i++) {
    let s = "s" + i.toString();
    let f = (): string => s;
    fns.push(f);
    let m = await getNumber();
    unchecked(m);
  }
  let out = "";
  for (let j = 0; j < 3; j++) out += fns[j]();
  return out;
}

// Externref capture: the loop variable is a spill slot, read at creation.
export async function loopExtern(): Promise<externref> {
  let fns = new Array<() => externref>();
  for (let i = 0; i < 2; i++) {
    let o = await getObj();
    let f = (): externref => o;
    fns.push(f);
  }
  return fns[1]();
}

// In-iteration calls still work (the pre-existing behaviour).
export async function loopInline(): Promise<i32> {
  let total = 0;
  for (let i = 0; i < 3; i++) {
    let f = (x: i32): i32 => x + i;
    total += f(10);
    let m = await getNumber();
    total += m;
  }
  return total;
}

// A loop closure capturing nothing loop-scoped keeps the plain adapter.
export async function loopNoCapture(): Promise<i32> {
  let fns = new Array<() => i32>();
  for (let i = 0; i < 3; i++) {
    let f = (): i32 => 7;
    fns.push(f);
    let m = await getNumber();
    unchecked(m);
  }
  let total = 0;
  for (let j = 0; j < 3; j++) total += fns[j]();
  return total;
}

export class Counter {
  base: i32;
  constructor(base: i32) {
    this.base = base;
  }

  async loopStored(): Promise<i32> {
    let fns = new Array<(x: i32) => i32>();
    for (let i = 0; i < 3; i++) {
      let f = (x: i32): i32 => x + i + this.base;
      fns.push(f);
      let m = await getNumber();
      unchecked(m);
    }
    let total = 0;
    for (let j = 0; j < 3; j++) total += fns[j](10);
    return total;
  }
}
