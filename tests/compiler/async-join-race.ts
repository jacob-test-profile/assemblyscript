//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

// Allocates a fresh string per call; the driver uses its pointer as the
// member token. A small-integer token would crash the GC when stored in
// an Array<Promise<T>> (Array#push links the value as a reference).
export function mintString(i: i32): string {
  return "m" + i.toString();
}

export async function raceFirst(): Promise<string> {
  let s = await Promise.race([getChunk(0), getChunk(1)]);
  return s;
}

export async function raceReject(): Promise<string> {
  let s = await Promise.race([getChunk(0), getChunk(1)]);
  return s;
}

export async function raceEmpty(): Promise<string> {
  let s: string = await Promise.race([]);
  return s;
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
