// Fixture for the chunk 6 real-join e2e (tests/async-coordinator/run.mjs).
// Drives chunk 5's wasm join (Promise.all/race/any) through the generated
// coordinator — no test-only driver. Mirrors the chunk 5 protocol
// fixture; kept here so the coordinator e2e does not depend on chunk 5's
// in-flux compiler fixture. allSettled is deliberately NOT covered here:
// chunk 5's allSettled result assembly traps wasm-side (holey array
// abort in step after join_done) — see STATUS-chunk6.md.

//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

export async function allNumbers(): Promise<string> {
  let xs = await Promise.all([getNumber(), getNumber(), getNumber()]);
  return xs.join("|");
}

export async function allFailFast(): Promise<string> {
  let xs = await Promise.all([getNumber(), getNumber()]);
  return xs.join("|");
}

export async function allEmpty(): Promise<string> {
  let xs: Array<i32> = await Promise.all([]);
  return xs.length.toString();
}

export async function raceNumbers(): Promise<i32> {
  return await Promise.race([getNumber(), getNumber()]);
}

export async function anyNumbers(): Promise<i32> {
  return await Promise.any([getNumber(), getNumber()]);
}
