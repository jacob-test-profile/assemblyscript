//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

// Closures created inside a loop, each capturing the loop variable and
// called directly within its iteration.
export async function loopClosures(): Promise<i32> {
  let total = 0;
  for (let i = 0; i < 3; i++) {
    let f = (x: i32): i32 => x + i;
    total += f(10);
    let m = await getNumber();
    total += m;
  }
  return total;
}
