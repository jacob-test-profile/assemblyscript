// Passing fixture for join-argument await (Group 3d): the whole join
// argument awaited. The member array is built wasm-side by a nested async
// helper and handed to the outer resume as a wasm pointer (nested-only
// passthrough — the coordinator never lowers an array from JS).

//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

// Allocates a fresh string per call; the driver uses its pointer as the
// member token.
export function mintString(i: i32): string {
  return "m" + i.toString();
}

async function makeArray(): Promise<Array<Promise<i32>>> {
  return [getNumber(), getNumber()];
}

export async function argAwait(): Promise<string> {
  let xs = await Promise.all(await makeArray());
  return xs.join("|");
}
