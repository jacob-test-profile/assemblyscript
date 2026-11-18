//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export async function f(): Promise<string> {
  try {
    return await getChunk(0);
  } catch (e) {
    return "err";
  }
}
