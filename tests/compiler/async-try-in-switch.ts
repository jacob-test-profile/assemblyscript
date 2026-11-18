//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "getNum")
declare function getNum(i: i32): Promise<i32>;
//@ external("env", "log")
declare function log(msg: string): void;

export async function f(n: i32): Promise<string> {
  let out = "";
  switch (n) {
    case 1:
      try {
        let c = await getChunk(0);
        out = "t-" + c;
      } catch (e) {
        out = "t-caught";
      } finally {
        log("t-finally");
      }
      break;
    case 2:
      try {
        await getChunk(0);
        throw "sw-boom";
      } catch (e) {
        out = "sw-caught:" + e;
      }
      break;
    default: out = "sw-dflt";
  }
  return out;
}

export async function g(): Promise<string> {
  try {
    let n = await getNum(0);
    switch (n) {
      case 1: return await getChunk(0);
      default: return "dflt";
    }
  } catch (e) {
    return "caught:" + e;
  }
}

export async function retInTryInSwitch(x: i32): Promise<string> {
  switch (x) {
    case 1: {
      try {
        let c = await getChunk(0);
        return c;
      } catch (e) {
        return "caught";
      }
    }
    default:
      return "d";
  }
}

export function chunkString(i: i32): string {
  if (i == 0) return "A";
  return "B";
}
