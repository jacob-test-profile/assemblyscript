// Passing fixture for cross-file await (Group 3d): an imported async
// function awaited directly, inside try/catch, through a chain, across
// a terminating mutual cycle, and as a cross-file method call.
import { helper } from "./_async-crossfile-helper";
import { chain } from "./_async-crossfile-chain";
import { cycleA } from "./_async-crossfile-cycle-a";
import { W2 } from "./_async-crossfile-methods";

// Allocates a fresh string per call; the driver uses its pointer as the
// member token for the suspending imports.
export function mintString(i: i32): string {
  return "m" + i.toString();
}

// The string values the driver delivers to the getChunk resumes.
export function chunkString(i: i32): string {
  if (i == 0) return "hello";
  return "world";
}

export async function awaitOtherFile(): Promise<string> {
  let c = await helper();
  return c;
}

export async function awaitOtherFileGuarded(): Promise<string> {
  try {
    let c = await helper();
    return c;
  } catch (e) {
    return "caught";
  }
}

export async function awaitChain(): Promise<string> {
  let c = await chain(2);
  return c;
}

export async function awaitCycle(): Promise<i32> {
  let v = await cycleA(2);
  return v;
}

export async function awaitCrossMethod(): Promise<i32> {
  let w = new W2();
  let v = await w.helper(10);
  return v;
}
