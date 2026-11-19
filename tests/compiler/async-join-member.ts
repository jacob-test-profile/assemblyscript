// Passing fixture for join-member await (Group 3d): an await expression
// as a Promise.all/race/allSettled member suspends first, then the join
// issues with the delivered value as a pre-resolved member (sentinel
// token 0 in the join's request list).

//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;
//@ external("env", "getFailing")
declare function getFailing(): Promise<i32>;

// Allocates a fresh string per call; the driver uses its pointer as the
// member token.
export function mintString(i: i32): string {
  return "m" + i.toString();
}

export function errorString(i: i32): string {
  if (i == 0) return "boom-a";
  return "boom-b";
}

export async function allHoisted(): Promise<string> {
  let xs = await Promise.all([await getNumber(), getNumber(), getNumber()]);
  return xs.join("|");
}

export async function raceHoisted(): Promise<i32> {
  return await Promise.race([await getNumber(), getNumber()]);
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

export async function allHoistedCaught(): Promise<string> {
  try {
    let xs = await Promise.all([await getFailing(), getNumber()]);
    return xs.join("|");
  } catch (e) {
    return "caught:" + e.toString();
  }
}
