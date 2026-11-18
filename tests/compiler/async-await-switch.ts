//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export async function f(n: i32): Promise<string> {
  let out = "";
  switch (n) {
    case 1: out = await getChunk(0); break;
    case 2: out = await getChunk(1);
    case 3: { let c = await getChunk(2); out = out + c; break; }
    default: out = "dflt";
  }
  return out;
}

export async function g(s: string): Promise<string> {
  switch (s) {
    case "one": return await getChunk(0);
    case "two": return "two";
    default: return "other";
  }
}

export async function h(): Promise<string> {
  let out = "";
  for (let i = 0; i < 4; i++) {
    switch (i) {
      case 1: continue;
      case 2: { let c = await getChunk(2); out = out + c; break; }
      default: out = out + "x";
    }
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

export function oneString(): string {
  return "one";
}

export function twoString(): string {
  return "two";
}

export function otherString(): string {
  return "zzz";
}
