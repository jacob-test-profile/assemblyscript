//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "getNum")
declare function getNum(i: i32): Promise<i32>;

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
