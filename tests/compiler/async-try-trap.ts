//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "log")
declare function log(msg: string): void;

// A wasm trap (and a throw from a sync callee) cannot be caught by this
// desugar: there is no wasm exception handling in asc. The trap must
// propagate, not be swallowed by the catch.
export function boom(): void {
  unreachable();
}

export async function trap(): Promise<string> {
  try {
    let c = await getChunk(0);
    boom();
    return "unreached-" + c;
  } catch (e) {
    return "swallowed-" + e;
  } finally {
    log("trap-finally");
  }
}

export function chunkString(i: i32): string {
  return "A";
}
