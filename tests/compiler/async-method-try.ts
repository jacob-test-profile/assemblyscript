//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;
//@ external("env", "log")
declare function log(msg: string): void;

export class Worker {
  count: i32 = 0;

  // try/catch/finally around an await in a method: success returns the
  // count, a coordinator rejection lands in the catch and returns -1.
  async guarded(n: i32): Promise<i32> {
    try {
      let m = await getNumber();
      this.count += m;
      return this.count;
    } catch (e) {
      log("catch:" + e);
      return -1;
    } finally {
      log("finally");
    }
  }

  // try/finally in a method: the finally runs exactly once, never on
  // suspend, on both the success and the rejection path.
  async guardedFinally(n: i32): Promise<i32> {
    try {
      let m = await getNumber();
      this.count += m;
      return this.count;
    } finally {
      log("finally");
    }
  }

  async helper(n: i32): Promise<i32> {
    let m = await getNumber();
    return n + m;
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

// Entry points for the test driver: starting a method returns its task handle.
export function startGuarded(): i32 {
  let w = new Worker();
  return changetype<i32>(w.guarded(0));
}

export function startGuardedFinally(): i32 {
  let w = new Worker();
  return changetype<i32>(w.guardedFinally(0));
}

export function startGuardedNested(): i32 {
  let w = new Worker();
  return changetype<i32>(w.guardedNested(5));
}

// Mints the rejection message the glue passes to the reject export.
export function rejectMessage(): string {
  return "coord-boom";
}
