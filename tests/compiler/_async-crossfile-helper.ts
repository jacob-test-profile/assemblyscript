// Helper for async-reject-more: an async function in another file.
// Underscore-prefixed, so the compiler-test harness does not treat it
// as a test of its own.
//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export async function helper(): Promise<string> {
  let c = await getChunk(0);
  return c;
}
