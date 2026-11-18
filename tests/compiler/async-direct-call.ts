//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export async function g(): Promise<string> {
  return await getChunk(0);
}

export async function f(): Promise<string> {
  return g();
}
