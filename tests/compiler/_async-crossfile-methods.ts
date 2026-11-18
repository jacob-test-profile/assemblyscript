// Class helper for async-crossfile: an async method in another file.
//@ external("env", "getNumberW")
declare function getNumberW(): Promise<i32>;

export class W2 {
  async helper(n: i32): Promise<i32> {
    let v = await getNumberW();
    return n + v;
  }
}
