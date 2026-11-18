//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "log")
declare function log(msg: string): void;

// A coordinator rejection of a suspended await lands in the enclosing
// try's catch (and runs its finally), like a lexical throw.
export async function f(mode: i32): Promise<string> {
  try {
    let c = await getChunk(0);
    return "ok-" + c;
  } catch (e) {
    log("catch:" + e);
    return "caught";
  } finally {
    log("finally");
  }
}

// Without a catch, the rejection runs the finally and fails the task.
export async function g(mode: i32): Promise<string> {
  try {
    let c = await getChunk(0);
    return "ok-" + c;
  } finally {
    log("finally");
  }
}

export function chunkString(i: i32): string {
  return "A";
}

// Mints the rejection message the glue passes to the reject export.
export function rejectMessage(): string {
  return "coord-boom";
}
