//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

export async function f(): Promise<Array<i32>> {
  return await Promise.all([getNumber(), getNumber()]);
}
