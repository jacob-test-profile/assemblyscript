// Values fixture for the close-gaps track (Group 5b): array and plain
// class values across the async boundary — await values, parameters,
// results, join members, stored awaits, and async methods. Driven by
// tests/async-coordinator/run.mjs through the generated coordinator only.

//@ external("env", "getNumbers")
declare function getNumbers(): Promise<Array<i32>>;
//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;
//@ external("env", "getStrings")
declare function getStrings(): Promise<Array<string>>;
//@ external("env", "getPoint")
declare function getPoint(): Promise<Point>;
//@ external("env", "getPoints")
declare function getPoints(): Promise<Array<Point>>;
//@ external("env", "getMatrix")
declare function getMatrix(): Promise<Array<Array<i32>>>;
//@ external("env", "getBytes")
declare function getBytes(): Promise<Array<i8>>;
//@ external("env", "getFloats")
declare function getFloats(): Promise<Array<f64>>;
//@ external("env", "getStatic")
declare function getStatic(): Promise<StaticArray<i32>>;

class Point {
  x: i32;
  y: i32;
}

class Labeled {
  label: string = "";
  vals: Array<i32> = [];
}

export function allocSpam(n: i32): void {
  for (let i = 0; i < n; i++) {
    let s = "spam-" + i.toString();
    unchecked(s.length);
  }
}

export async function sumArr(): Promise<i32> {
  let arr = await getNumbers();
  let total = 0;
  for (let i = 0; i < arr.length; i++) total += arr[i];
  return total;
}

export async function getArr(): Promise<Array<i32>> {
  let n = await getNumber();
  return [n, n + 1];
}

export async function sumParam(arr: Array<i32>): Promise<i32> {
  let n = await getNumber();
  let total = n;
  for (let i = 0; i < arr.length; i++) total += arr[i];
  return total;
}

export async function concatStrs(): Promise<string> {
  let strs = await getStrings();
  return strs.join(",");
}

export async function sumPoint(): Promise<i32> {
  let p = await getPoint();
  return p.x + p.y;
}

export async function makePoint(): Promise<Point> {
  let n = await getNumber();
  let p = new Point();
  p.x = n;
  p.y = n * 2;
  return p;
}

export async function sumPoints(): Promise<i32> {
  let pts = await getPoints();
  let total = 0;
  for (let i = 0; i < pts.length; i++) total += pts[i].x + pts[i].y;
  return total;
}

export async function sumMatrix(): Promise<i32> {
  let m = await getMatrix();
  let total = 0;
  for (let i = 0; i < m.length; i++) {
    for (let j = 0; j < m[i].length; j++) total += m[i][j];
  }
  return total;
}

export async function getLabeled(): Promise<Labeled> {
  let n = await getNumber();
  let l = new Labeled();
  l.label = "L" + n.toString();
  l.vals = [n, n + 1];
  return l;
}

export async function sumLabeled(l: Labeled): Promise<i32> {
  let n = await getNumber();
  let total = n;
  for (let i = 0; i < l.vals.length; i++) total += l.vals[i];
  return total;
}

export async function joinArrs(): Promise<Array<Array<i32>>> {
  let arrs = await Promise.all([getNumbers(), getNumbers()]);
  return arrs;
}

export async function joinPoints(): Promise<Array<Point>> {
  let pts = await Promise.all([getPoint(), getPoint()]);
  return pts;
}

export async function storedArr(): Promise<i32> {
  const p = getNumbers();
  let arr = await p;
  let total = 0;
  for (let i = 0; i < arr.length; i++) total += arr[i];
  return total;
}

export async function maybeArr(flag: i32): Promise<Array<i32> | null> {
  if (flag) return await getNumbers();
  return null;
}

export async function sumBytes(): Promise<i32> {
  let b = await getBytes();
  let total = 0;
  for (let i = 0; i < b.length; i++) total += b[i];
  return total;
}

export async function sumFloats(): Promise<f64> {
  let f = await getFloats();
  let total = 0.0;
  for (let i = 0; i < f.length; i++) total += f[i];
  return total;
}

export async function sumStatic(): Promise<i32> {
  let a = await getStatic();
  return a[0] + a[1];
}

export async function getStaticArr(): Promise<StaticArray<i32>> {
  let n = await getNumber();
  let a = new StaticArray<i32>(2);
  a[0] = n;
  a[1] = n + 1;
  return a;
}

// An array awaited before a second await: the array lives in the state
// object's pending field across the suspension, so it must survive a
// GC collection between the two awaits.
export async function twoArrs(): Promise<i32> {
  let a = await getNumbers();
  let n = await getNumber();
  let total = n;
  for (let i = 0; i < a.length; i++) total += a[i];
  return total;
}

export class Box {
  base: i32;
  constructor(base: i32) {
    this.base = base;
  }

  async addAll(arr: Array<i32>): Promise<i32> {
    let n = await getNumber();
    let total = this.base + n;
    for (let i = 0; i < arr.length; i++) total += arr[i];
    return total;
  }

  async makePoint(): Promise<Point> {
    let n = await getNumber();
    let p = new Point();
    p.x = this.base + n;
    p.y = 0;
    return p;
  }
}
