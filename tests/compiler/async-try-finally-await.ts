//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

// A finally must not suspend: `await` in a finally is a loud error.
export async function f(): Promise<string> {
  try {
    return await getChunk(0);
  } finally {
    await getChunk(1);
  }
}
