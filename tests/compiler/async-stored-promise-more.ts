//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

// Awaiting a promise read out of an array or an object field, and
// awaiting a local copied from a tracked binding, all suspend on the
// issued token through __async_wait.
export async function memberIndex(): Promise<string> {
  let arr = new Array<Promise<string>>(2);
  arr[0] = getChunk(0);
  arr[1] = getChunk(1);
  let a = await arr[0];
  let b = await arr[1];
  return a + b;
}

class Box {
  p: Promise<string> = changetype<Promise<string>>(0);
}

export async function memberField(): Promise<string> {
  let box = new Box();
  box.p = getChunk(0);
  let c = await box.p;
  return "got-" + c;
}

export async function copyInit(): Promise<string> {
  let p = getChunk(0);
  let q = p;
  let c = await q;
  return "got-" + c;
}

export async function copyRebind(): Promise<string> {
  let p = getChunk(0);
  let q: Promise<string>;
  q = p;
  let c = await q;
  return "got-" + c;
}

export async function copyMember(): Promise<string> {
  let arr = new Array<Promise<string>>(1);
  arr[0] = getChunk(0);
  let p = arr[0];
  let c = await p;
  return "got-" + c;
}

export function mintString(i: i32): string {
  return "token-" + i.toString();
}

export function chunkString(i: i32): string {
  return i == 0 ? "A" : "B";
}
