//@ external("env", "getNumber")
declare function getNumber(): i32;

export async function f(): Promise<i32> {
  return await getNumber();
}
