// A generic suspending import is wrapped once and serves every
// instantiation whose parameter types agree (here every call passes an
// i32); each instantiation's result is delivered through its own await
// site. The wasm has two imports with the same module/name but different
// signatures; the coordinator installs one wrapper for them.
//@ external("env", "fetch")
declare function fetch<T>(x: i32): Promise<T>;

export async function run(): Promise<i32> {
  let a = await fetch<i32>(1);
  let b = await fetch<string>(2);
  return a + (b.length > 0 ? 1 : 0);
}

// Mints the string the glue delivers to the string-typed resume export.
export function hi(): string {
  return "hi";
}
