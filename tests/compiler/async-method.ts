//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

export class Counter {
  count: i32 = 0;

  // `this` field access across an await.
  async add(n: i32): Promise<i32> {
    this.count += n;
    let m = await getNumber();
    this.count += m;
    return this.count;
  }

  // An arrow inside an async method touching `this`: 4 + 100 = 104.
  async viaArrow(n: i32): Promise<i32> {
    let bump = (x: i32): i32 => {
      this.count += x;
      return this.count;
    };
    bump(4);
    let m = await getNumber();
    bump(m);
    return this.count;
  }
}

// Entry points for the test driver: starting a method returns its task handle.
export function startAdd(): i32 {
  let c = new Counter();
  return changetype<i32>(c.add(0));
}

export function startViaArrow(): i32 {
  let c = new Counter();
  return changetype<i32>(c.viaArrow(0));
}
