// Mutual-cycle helpers for async-crossfile: each file awaits the other's
// async function, terminating on n <= 0. Distinct suspending imports per
// file keep the coordinator's import registry unambiguous.
//@ external("env", "getNumberA")
declare function getNumberA(): Promise<i32>;
import { cycleB } from "./_async-crossfile-cycle-b";

export async function cycleA(n: i32): Promise<i32> {
  if (n <= 0) return 0;
  let a = await getNumberA();
  let b = await cycleB(n - 1);
  return a + b;
}
