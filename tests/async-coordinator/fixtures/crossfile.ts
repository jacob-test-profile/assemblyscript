// Cross-file await through the generated coordinator: an imported async
// function awaited directly, inside try/catch, through a chain, across a
// terminating mutual cycle, and as a cross-file method call.
import { helper } from "./crossfile-helper";
import { chain } from "./crossfile-chain";
import { cycleA } from "./crossfile-cycle-a";
import { W2 } from "./crossfile-methods";

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
