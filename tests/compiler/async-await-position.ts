//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "getNum")
declare function getNum(i: i32): Promise<i32>;
//@ external("env", "getFlag")
declare function getFlag(i: i32): Promise<bool>;

export function combine(a: string, b: string): string {
  return a + b;
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
  n += await getNum(1);
  n -= await getNum(2);
  n *= await getNum(3);
  n /= await getNum(2);
  n %= await getNum(3);
  n <<= await getNum(1);
  n &= await getNum(7);
  n |= await getNum(8);
  n ^= await getNum(3);
  n >>= await getNum(1);
  return n;
}

// A compound read may change type across the suspension: f64 += i32.
export async function mixedCompound(): Promise<f64> {
  let f: f64 = 1.5;
  f += await getNum(2);
  f *= await getNum(3);
  return f;
}

export class W {
  s: string = "";
  n: i32 = 0;

  async setField(i: i32): Promise<string> {
    this.s = await getChunk(i);
    this.n += await getNum(i);
    return this.s + this.n.toString();
  }

  async checkFlag(i: i32): Promise<string> {
    if (await getFlag(i)) {
      return "YES";
    }
    return "NO";
  }
}

// Field-assignment await on a plain object.
export async function fieldAssign(): Promise<string> {
  let w = new W();
  w.s = await getChunk(2);
  w.n = await getNum(5);
  return w.s + w.n.toString();
}

// Compound assignment to a field.
export async function fieldCompound(): Promise<string> {
  let w = new W();
  w.s = "x";
  w.s += await getChunk(0);
  w.n = 1;
  w.n += await getNum(4);
  return w.s + w.n.toString();
}

// The receiver may be a call: it is evaluated before the suspension.
export function getW(w: W): W {
  return w;
}

export async function recvCall(): Promise<string> {
  let w = new W();
  getW(w).s = await getChunk(0);
  return w.s;
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
  arr[0] += await getNum(5);
  return arr[0];
}

// A stored promise may be awaited into a field.
export async function storedField(): Promise<string> {
  let w = new W();
  let p = getChunk(3);
  w.s = await p;
  return w.s;
}

// Mints the chunk strings the driver delivers, so the glue can pass real
// string pointers to the resume export without a loader.
export function chunkString(i: i32): string {
  if (i == 0) return "AAA";
  if (i == 1) return "BBB";
  if (i == 2) return "CCC";
  return "DDD";
}

// Entry point for the test driver: starting the method returns its task handle.
export function startSetField(): i32 {
  let w = new W();
  return changetype<i32>(w.setField(1));
}

export function startCheckFlag(): i32 {
  let w = new W();
  return changetype<i32>(w.checkFlag(0));
}

// Await in an if condition: the temp is evaluated before the dispatch.
export async function ifCond(): Promise<string> {
  if (await getFlag(0)) {
    return "YES";
  }
  return "NO";
}

// Await in a while condition: re-evaluated on every iteration.
export async function whileCond(): Promise<string> {
  let out = "";
  let i = 0;
  while (await getFlag(i)) {
    out += await getChunk(i);
    i++;
  }
  return out;
}

// Await in a for condition: re-evaluated on every iteration.
export async function forCond(): Promise<string> {
  let out = "";
  for (let i = 0; await getFlag(i); i++) {
    out += await getChunk(i);
  }
  return out;
}

// Await in a do-while condition: evaluated after each body run.
export async function doCond(): Promise<string> {
  let out = "";
  let i = 0;
  do {
    out += await getChunk(i);
    i++;
  } while (await getFlag(i));
  return out;
}

// Await in a for incrementor: runs after each body run.
export async function forIncr(): Promise<string> {
  let out = "";
  for (let i = 0; i < 2; i += await getNum(1)) {
    out += await getChunk(i);
  }
  return out;
}

// Awaits in call arguments, in order.
export async function callArgs(): Promise<string> {
  return combine(await getChunk(0), await getChunk(1));
}

// Awaits as binary operands, in order.
export async function binaryOp(): Promise<i32> {
  return 1 + await getNum(2) + await getNum(3);
}

export async function binaryStr(): Promise<string> {
  return await getChunk(0) + await getChunk(1);
}

// Await inside a variable initializer that is not the whole initializer.
export async function varInitCall(): Promise<string> {
  let x = combine(await getChunk(0), "!");
  return x;
}

export async function varInitBinary(): Promise<i32> {
  let y = 1 + await getNum(2);
  return y;
}

// Await inside an assignment RHS that is not the whole RHS.
export async function returnAssign(): Promise<string> {
  let s = "";
  s = await getChunk(0) + await getChunk(1);
  return s;
}

// Compound assignment whose RHS contains an await: the current value is
// captured before the suspension.
export async function compoundRhs(): Promise<i32> {
  let n = 10;
  n += 1 + await getNum(2);
  return n;
}

export async function assignRhsField(): Promise<string> {
  let w = new W();
  w.s = await getChunk(0) + "!";
  return w.s;
}

// Await in a ternary condition is hoisted; the branches are not.
export async function ternaryCond(): Promise<string> {
  return (await getFlag(0)) ? "YES" : "NO";
}

// Await on the left of && is hoisted; the right side is not.
export async function andLeft(): Promise<string> {
  if ((await getFlag(0)) && true) {
    return "YES";
  }
  return "NO";
}

// A stored promise awaited in a call argument.
export async function storedArg(): Promise<string> {
  let p = getChunk(0);
  return combine(await p, "!");
}

// An if-condition await inside a try: if conditions are not guarded, so
// the await hoists and a rejection still lands in the catch.
export async function ifCondInTry(): Promise<string> {
  try {
    if (await getFlag(0)) {
      return "YES";
    }
    return "NO";
  } catch (e) {
    return "CAUGHT";
  }
}

// Await as a unary operand.
export async function unaryOp(): Promise<i32> {
  return -(await getNum(1));
}

// Awaits in an array literal, in order.
export async function arrayLit(): Promise<i32> {
  let arr = [await getNum(1), await getNum(2)];
  return arr[0] + arr[1];
}

// Await inside a template literal.
export async function templateLit(): Promise<string> {
  return `${await getChunk(0)}!`;
}
