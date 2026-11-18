//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;
//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export async function mixedTypes(): Promise<string> {
  let xs = await Promise.all([getNumber(), getChunk(0)]);
  return xs.join("|");
}
