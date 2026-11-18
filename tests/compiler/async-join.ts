//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

// Allocates a fresh string per call; the driver uses its pointer as the
// member token. A small-integer token would crash the GC when stored in
// an Array<Promise<T>> (Array#push links the value as a reference).
export function mintString(i: i32): string {
  return "m" + i.toString();
}

export async function allNumbers(): Promise<string> {
  let xs = await Promise.all([getNumber(), getNumber(), getNumber()]);
  return xs.join("|");
}

export async function allFailFast(): Promise<string> {
  let xs = await Promise.all([getNumber(), getNumber()]);
  return xs.join("|");
}

export async function allEmpty(): Promise<string> {
  let xs: Array<i32> = await Promise.all([]);
  return xs.length.toString();
}

// Mints the chunk strings the glue can pass to the join exports without
// a loader, and the rejection messages for the fail-fast path.
export function chunkString(i: i32): string {
  if (i == 0) return "AAA";
  if (i == 1) return "BBB";
  return "CCC";
}

export function errorString(i: i32): string {
  if (i == 0) return "boom-a";
  return "boom-b";
}
