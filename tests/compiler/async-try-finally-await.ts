//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "log")
declare function log(msg: string): void;

// A finally may suspend: it runs exactly once, never on suspend, and a
// rejection of a finally await replaces the pending outcome.
export async function f(mode: i32): Promise<string> {
  try {
    let c = await getChunk(0);
    if (mode == 1) throw "body-boom";
    return "ok-" + c;
  } catch (e) {
    log("catch:" + e);
    return "caught";
  } finally {
    let d = await getChunk(1);
    log("finally-" + d);
  }
}

export async function h(): Promise<string> {
  try {
    try {
      throw "body-boom";
    } finally {
      await getChunk(0);
    }
  } catch (e) {
    return "outer-caught:" + e;
  }
}

export function chunkString(i: i32): string {
  if (i == 0) return "A";
  return "B";
}

export function errString(): string {
  return "fin-boom";
}
