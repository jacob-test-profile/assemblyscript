//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export async function f(): Promise<string> {
  let p = getChunk(0);
  return await p;
}
