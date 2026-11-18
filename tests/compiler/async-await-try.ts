//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "log")
declare function log(msg: string): void;

// Normal path, throw after the await, and throw before the await: the
// finally runs exactly once in every case, never on suspend.
export async function f(mode: i32): Promise<string> {
  try {
    let c = await getChunk(0);
    if (mode == 1) throw "async-boom";
    return "ok-" + c;
  } catch (e) {
    log("catch:" + e);
    return "caught";
  } finally {
    log("finally");
  }
}

export async function g(mode: i32): Promise<string> {
  try {
    if (mode == 2) throw "sync-boom";
    let c = await getChunk(0);
    return "ok-" + c;
  } catch (e) {
    log("catch:" + e);
    return "caught";
  } finally {
    log("finally");
  }
}

export function chunkString(i: i32): string {
  return "A";
}
