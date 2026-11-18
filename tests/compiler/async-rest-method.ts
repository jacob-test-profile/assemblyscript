//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

// A rest method transforms fine and is drivable through nested await
// (elements wrap into the array normally), but its entry is skipped:
// the coordinator builds the rest array in JS and AssemblyScript cannot
// pass a pre-built array as a rest argument, so the method is not
// drivable through the coordinator. The warnings below pin that.
export class RestCounter {
  count: i32 = 10;
  async sumAll(base: i32, ...more: i32[]): Promise<i32> {
    const v = await getNumber();
    let sum = base + v;
    for (let i = 0; i < more.length; ++i) sum += more[i];
    return sum;
  }
}
export async function driveRest(): Promise<i32> {
  const c = new RestCounter();
  return await c.sumAll(1, 2, 3);
}
