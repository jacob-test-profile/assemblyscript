//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export async function f(): Promise<string> {
  let x = 1;
  switch (x) {
    case 1: return await getChunk(0);
    default: return "d";
  }
}
