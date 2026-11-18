//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export function mintString(i: i32): string {
  return "token-" + i.toString();
}

// A stored promise is issued at bind time and awaited later through
// __async_wait; the await must not re-issue the import.
export async function f(): Promise<string> {
  let p = getChunk(0);
  let c = await p;
  return "got-" + c;
}
