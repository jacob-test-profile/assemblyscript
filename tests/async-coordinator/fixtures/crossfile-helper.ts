// Helper for the cross-file coordinator fixture: an async function in
// another file.
//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export async function helper(): Promise<string> {
  let c = await getChunk(0);
  return c;
}
