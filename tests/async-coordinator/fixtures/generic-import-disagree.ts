// A generic suspending import whose instantiations disagree on
// parameter types: the type parameter is the argument, so `fetch<i32>`
// takes an i32 and `fetch<string>` takes a string, and one wrapper
// cannot lift both. The coordinator stays loud (a stub that rejects
// with the reason) instead of wrapping it.
//@ external("env", "fetch")
declare function fetch<T>(x: T): Promise<i32>;

export async function run(): Promise<i32> {
  let a = await fetch<i32>(1);
  let b = await fetch<string>("hi");
  return a + b;
}
