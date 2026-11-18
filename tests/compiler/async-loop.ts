//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export async function concatThree(): Promise<string> {
  let out = "";
  for (let i = 0; i < 3; i++) {
    let chunk = await getChunk(i);
    out = out + chunk;
  }
  return out;
}

// Mints the chunk strings the coordinator delivers, so the glue can pass
// real string pointers to the resume export without a loader.
export function chunkString(i: i32): string {
  if (i == 0) return "AAA";
  if (i == 1) return "BBB";
  return "CCC";
}
