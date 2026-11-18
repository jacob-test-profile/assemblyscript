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
  static total: i32 = 0;
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

  // Static state across awaits: `this` in a static method is the class.
  static async create(n: i32): Promise<i32> {
    let m = await getNumber();
    this.total += n + m;
    return this.total;
  }

  // A static method awaiting an import.
  static async fetch(n: i32): Promise<i32> {
    let m = await getNumber();
    return n + m;
  }

  // A static method awaiting an instance method of a fresh instance.
  static async viaInstance(n: i32): Promise<i32> {
    let c = new Counter();
    let v = await c.add(n);
    return v;
  }

  // A static async `dispose` lives on the constructor and does not
  // collide with the wrapper's sync dispose() on the prototype.
  static async dispose(n: i32): Promise<i32> {
    let m = await getNumber();
    return n + m;
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

// Not exported: no wrapper class, no entry export. Its async methods
// stay reachable only from within async code, as nested inners.
class Hidden {
  count: i32 = 0;

  async add(n: i32): Promise<i32> {
    this.count += n;
    let m = await getNumber();
    this.count += m;
    return this.count;
  }

  static async make(n: i32): Promise<i32> {
    let m = await getNumber();
    return n + m;
  }
}

export async function viaHidden(n: i32): Promise<i32> {
  let h = new Hidden();
  let v = await h.add(n);
  return v;
}

export async function viaHiddenStatic(n: i32): Promise<i32> {
  let v = await Hidden.make(n);
  return v;
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

// Allocates garbage so the e2e can churn the heap (plus __collect) while
// a wrapper is alive, proving the pin keeps the instance alive.
export function allocSpam(n: i32): void {
  for (let i = 0; i < n; i++) {
    let s = "spam-" + i.toString() + "-spam";
    if (s.length == 0) throw new Error("unreachable");
  }
}
