//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export async function f(): Promise<string> {
  let out = "";
  out += await getChunk(0);
  return out;
}
