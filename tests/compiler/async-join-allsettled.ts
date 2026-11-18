//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

// Allocates a fresh string per call; the driver uses its pointer as the
// member token. A small-integer token would crash the GC when stored in
// an Array<Promise<T>> (Array#push links the value as a reference).
export function mintString(i: i32): string {
  return "m" + i.toString();
}

export async function settledMixed(): Promise<string> {
  let xs = await Promise.allSettled([getChunk(0), getChunk(1), getChunk(2)]);
  let out = "";
  for (let i = 0; i < xs.length; i++) {
    if (i > 0) out = out + "|";
    if (xs[i].status == "fulfilled") out = out + "fulfilled:" + xs[i].value;
    else out = out + "rejected:" + xs[i].reason;
  }
  return out;
}

export async function settledEmpty(): Promise<string> {
  let xs: Array<PromiseSettledResult<string>> = await Promise.allSettled([]);
  return xs.length.toString();
}

export function chunkString(i: i32): string {
  if (i == 0) return "AAA";
  if (i == 1) return "BBB";
  return "CCC";
}

export function errorString(i: i32): string {
  if (i == 0) return "boom-a";
  return "boom-b";
}
