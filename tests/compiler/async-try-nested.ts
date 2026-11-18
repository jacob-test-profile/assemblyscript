//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "log")
declare function log(msg: string): void;

// Nested try: the inner catch handles the throw, a rethrow from the inner
// catch lands in the outer catch, and each finally runs exactly once.
export async function nested(mode: i32): Promise<string> {
  try {
    try {
      let c = await getChunk(0);
      if (mode >= 1) throw "inner-boom";
      return "in-" + c;
    } catch (e) {
      log("inner-catch:" + e);
      if (mode == 2) throw "rethrow";
      return "inner-caught";
    } finally {
      log("inner-finally");
    }
  } catch (e) {
    log("outer-catch:" + e);
    return "outer-caught";
  } finally {
    log("outer-finally");
  }
}

// Try/finally inside a loop with an await in the loop body: break,
// continue and return from the try all run the finally exactly once
// for the iterations that execute.
export async function inLoop(mode: i32): Promise<string> {
  let out = "";
  for (let i = 0; i < 3; i++) {
    try {
      let c = await getChunk(i);
      out += c;
      if (mode == 1 && i == 1) break;
      if (mode == 2 && i == 0) continue;
      if (mode == 3 && i == 1) return "early-" + out;
    } finally {
      log("fin-" + i.toString());
    }
  }
  return "done-" + out;
}

// try/finally without catch: a throw propagates and the task fails,
// after the finally has run.
export async function noCatch(mode: i32): Promise<string> {
  try {
    let c = await getChunk(0);
    if (mode == 1) throw "nocatch-boom";
    return "ok-" + c;
  } finally {
    log("nc-finally");
  }
}

// A throw in the finally replaces a pending return.
export async function finThrow(mode: i32): Promise<string> {
  try {
    let c = await getChunk(0);
    if (mode == 1) return "ret-" + c;
    return "plain-" + c;
  } catch (e) {
    return "catch-" + e;
  } finally {
    log("ft-finally");
    if (mode == 1) throw "fin-boom";
  }
}

export function chunkString(i: i32): string {
  if (i == 0) return "A";
  if (i == 1) return "B";
  return "C";
}
