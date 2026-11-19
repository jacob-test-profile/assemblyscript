//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "getNum")
declare function getNum(i: i32): Promise<i32>;

export async function f(): Promise<string> {
  let xs = [0, 1, 2];
  let out = "";
  for (const x of xs) {
    let c = await getChunk(x);
    out = out + c;
  }
  return out;
}

export async function g(): Promise<i32> {
  let xs = [10, 20, 30, 40];
  let s = 0;
  for (const x of xs) {
    let v = await getNum(x);
    if (v == 20) break;
    s += v;
  }
  return s;
}

export async function h(): Promise<string> {
  let xs = [0, 1];
  let out = "";
  for (const x of xs) {
    try {
      let c = await getChunk(x);
      out = out + c;
    } catch (e) {
      out = out + "E";
    }
  }
  return out;
}

export function chunkString(i: i32): string {
  if (i == 0) return "AAA";
  if (i == 1) return "BBB";
  return "CCC";
}
