//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

export class Counter {
  static total: i32 = 0;
  count: i32 = 0;

  async add(n: i32): Promise<i32> {
    this.count += n;
    let m = await getNumber();
    this.count += m;
    return this.count;
  }

  // `this` in a static method is the class: the this-lift rewrites it
  // to the class name, so static state survives across the await.
  static async create(n: i32): Promise<i32> {
    let m = await getNumber();
    this.total += n + m;
    return this.total;
  }

  // A static method awaiting an instance method of a fresh instance.
  static async viaInstance(n: i32): Promise<i32> {
    let c = new Counter();
    let v = await c.add(n);
    return v;
  }

  // A static async `dispose` does not collide with the wrapper's sync
  // dispose(): the static lives on the constructor, the sync one on
  // the prototype.
  static async dispose(n: i32): Promise<i32> {
    let m = await getNumber();
    return n + m;
  }
}

// `await Counter.create(...)` from an async top-level function.
export async function callStatic(n: i32): Promise<i32> {
  let v = await Counter.create(n);
  return v;
}

// Entry points for the test driver: starting a static method returns its task handle.
export function startCreate(): i32 {
  return changetype<i32>(Counter.create(0));
}

export function startViaInstance(): i32 {
  return changetype<i32>(Counter.viaInstance(0));
}
