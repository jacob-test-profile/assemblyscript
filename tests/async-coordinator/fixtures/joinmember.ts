// Join-member and join-argument await through the generated coordinator:
// hoisted member awaits suspend first, then the join issues with the
// delivered value pre-resolved; the join argument awaited delivers the
// member array built wasm-side by a nested helper.

//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;
//@ external("env", "getFailing")
declare function getFailing(): Promise<i32>;
//@ external("env", "getSlow")
declare function getSlow(): Promise<i32>;

export async function allHoisted(): Promise<string> {
  let xs = await Promise.all([await getNumber(), getNumber(), getNumber()]);
  return xs.join("|");
}

export async function raceHoisted(): Promise<i32> {
  return await Promise.race([await getNumber(), getSlow()]);
}

export async function anyHoisted(): Promise<i32> {
  return await Promise.any([getFailing(), await getNumber()]);
}

export async function settledHoisted(): Promise<string> {
  let rs = await Promise.allSettled([await getNumber(), getFailing()]);
  let out = "";
  for (let i = 0; i < rs.length; i++) {
    let r = rs[i];
    if (r.status == "fulfilled") out += "ok" + r.value.toString() + ";";
    else out += "no" + r.reason + ";";
  }
  return out;
}

export async function allHoistedFail(): Promise<string> {
  let xs = await Promise.all([await getFailing(), getNumber()]);
  return xs.join("|");
}

export async function allHoistedCaught(): Promise<string> {
  try {
    let xs = await Promise.all([await getFailing(), getNumber()]);
    return xs.join("|");
  } catch (e) {
    return "caught:" + e.toString();
  }
}

async function makeArray(): Promise<Array<Promise<i32>>> {
  return [getNumber(), getNumber()];
}

export async function argAwait(): Promise<string> {
  let xs = await Promise.all(await makeArray());
  return xs.join("|");
}

export async function argAwaitRace(): Promise<i32> {
  return await Promise.race(await makeArray());
}
