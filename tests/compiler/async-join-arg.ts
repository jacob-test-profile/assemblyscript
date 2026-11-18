//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

export async function nonArrayArg(): Promise<string> {
  let xs = await Promise.all(getNumber());
  return xs.join("|");
}
