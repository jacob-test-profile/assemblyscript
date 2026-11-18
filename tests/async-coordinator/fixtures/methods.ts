// Fixture for the async-methods coordinator e2e
// (tests/async-coordinator/run.mjs). Real transform, no hand-lowered
// state machines: every async method here is driven through the
// generated `<base>.async.js` coordinator.

//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

//@ external("env", "getHandle")
declare function getHandle(): Promise<externref>;

//@ external("env", "useHandle")
declare function useHandle(h: externref): Promise<i32>;

//@ external("env", "log")
declare function log(msg: string): void;

export class Counter {
  count: i32 = 0;

  // Fields mutated before and after the await; both visible in the result.
  async add(n: i32): Promise<i32> {
    this.count += n;
    let m = await getNumber();
    this.count += m;
    return this.count;
  }

  // An arrow inside an async method touching `this` across the await.
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

  // Rejects when the awaited import rejects.
  async fail(n: i32): Promise<i32> {
    let m = await getNumber();
    return n + m;
  }

  // Externref round-trip through the spill pool.
  async handleRoundtrip(): Promise<i32> {
    let h = await getHandle();
    let n = await useHandle(h);
    return n;
  }
}

export class Worker {
  count: i32 = 0;

  async helper(n: i32): Promise<i32> {
    let m = await getNumber();
    return n + m;
  }

  // `await this.helper()`: method awaiting a method of the same instance.
  async viaThis(n: i32): Promise<i32> {
    let h = await this.helper(n);
    this.count += h;
    return this.count;
  }

  // Nested: method -> method -> import.
  async viaNested(n: i32): Promise<i32> {
    let h = await this.viaThis(n);
    return h + 1;
  }

  // Method awaiting a method inside its own try/catch: the inner failure
  // must reach this catch, and the finally must run exactly once.
  async guardedNested(n: i32): Promise<i32> {
    try {
      let h = await this.helper(n);
      this.count += h;
      return this.count;
    } catch (e) {
      log("catch:" + e);
      return -1;
    } finally {
      log("finally");
    }
  }
}

// `await obj.method()` from an async top-level function.
export async function viaObj(n: i32): Promise<i32> {
  let w = new Worker();
  let h = await w.helper(n);
  return h;
}

// An inner method failure must reach the outer catch.
export async function viaObjGuarded(n: i32): Promise<i32> {
  let w = new Worker();
  try {
    let h = await w.helper(n);
    return h;
  } catch (e) {
    log("catch:" + e);
    return -1;
  }
}

// `super` in async methods: calls and member access route to the base
// implementation across suspension (see tests/compiler/async-super.ts).
class SuperBase {
  n: i32 = 20;
  protected _v: i32 = 10;
  get v(): i32 { return this._v; }
  set v(value: i32) { this._v = value; }
  foo(): i32 { return 2; }
  bar(): i32 { return 200; }
}

export class SuperChild extends SuperBase {
  foo(): i32 { return 3; }
  get v(): i32 { return 99; }
  set v(value: i32) { this._v = value + 1000; }

  // A `super` method call runs the base implementation, not the override.
  async superCall(): Promise<i32> {
    let m = await getNumber();
    return super.foo() + m;
  }

  // A `super` field read/write goes through the base field storage.
  async superField(): Promise<i32> {
    let m = await getNumber();
    super.n = 30;
    return super.n + m;
  }

  // A `super` accessor read/write runs the base getter/setter.
  async superAccessor(): Promise<i32> {
    let m = await getNumber();
    let before = super.v;
    super.v = 5;
    return before * 100 + super.v + m;
  }

  // A `super` call inside a lifted closure.
  async superInClosure(): Promise<i32> {
    let m = await getNumber();
    let f = (): i32 => { return super.foo(); };
    return f() + m;
  }

  // A `super` call to a method declared on the grandparent.
  async superInherited(): Promise<i32> {
    let m = await getNumber();
    return super.bar() + m;
  }

  // Compound assignment and `++` on a `super` accessor.
  async superCompound(): Promise<i32> {
    let m = await getNumber();
    super.v += 2;
    super.v++;
    return super.v + m;
  }
}

// Allocates garbage so the e2e can churn the heap (plus __collect) while
// a wrapper is alive, proving the pin keeps the instance alive.
export function allocSpam(n: i32): void {
  for (let i = 0; i < n; i++) {
    let s = "spam-" + i.toString() + "-spam";
    if (s.length == 0) throw new Error("unreachable");
  }
}
