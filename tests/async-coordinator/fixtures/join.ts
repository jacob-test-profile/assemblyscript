// Fixture for the chunk 6 real-join e2e (tests/async-coordinator/run.mjs).
// Drives chunk 5's wasm join (Promise.all/race/any/allSettled) through the
// generated coordinator — no test-only driver. Mirrors the chunk 5 protocol
// fixture; kept here so the coordinator e2e does not depend on chunk 5's
// in-flux compiler fixture.

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

export async function dynamicAll(): Promise<string> {
  let ps = new Array<Promise<i32>>();
  for (let i = 0; i < 3; i++) {
    ps.push(getNumber());
  }
  let xs = await Promise.all(ps);
  return xs.join("|");
}

export async function joinThenAwait(): Promise<string> {
  let xs = await Promise.all([getNumber(), getNumber()]);
  let y = await getNumber();
  return xs.join("|") + ":" + y.toString();
}

// A join awaited as a method-call receiver: the join result is hoisted
// into a temp before the call.
export async function joinHoist(): Promise<string> {
  return (await Promise.all([getNumber(), getNumber()])).join("|");
}

export async function settledNumbers(): Promise<string> {
  let rs = await Promise.allSettled([getNumber(), getNumber(), getNumber()]);
  let out = "";
  for (let i = 0; i < rs.length; i++) {
    let r = rs[i];
    if (r.status == "fulfilled") out += "ok" + r.value.toString() + ";";
    else out += "no" + r.reason + ";";
  }
  return out;
}
