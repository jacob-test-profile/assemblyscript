// Mutual-cycle helpers for the cross-file coordinator fixture: each
// file awaits the other's async function, terminating on n <= 0.
// Distinct suspending imports per file keep the coordinator's import
// registry unambiguous.
//@ external("env", "getNumberB")
declare function getNumberB(): Promise<i32>;
import { cycleA } from "./crossfile-cycle-a";

export async function cycleB(n: i32): Promise<i32> {
  if (n <= 0) return 0;
  let b = await getNumberB();
  let a = await cycleA(n - 1);
  return b + a;
}
