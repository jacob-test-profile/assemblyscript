//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

// Awaiting a promise that was not bound by a direct call to a suspending
// import in this function is loud: a parameter carries no coordinator
// token, and neither does a local bound from another value.
export async function f(p: Promise<string>): Promise<string> {
  let c = await p;
  return c;
}

export async function g(q: Promise<string>): Promise<string> {
  let p: Promise<string> = q;
  let c = await p;
  return c;
}
