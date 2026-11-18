//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;
//@ external("env", "log")
declare function log(msg: string): void;

export class W {
  total: i32 = 0;

  // Inner method: awaits the suspending import, returns n + delivered.
  async helper(n: i32): Promise<i32> {
    let m = await getNumber();
    return n + m;
  }

  // `await this.helper()`: the receiver is the outer's lifted `__async_this`.
  async viaThis(n: i32): Promise<i32> {
    let h = await this.helper(n);
    this.total += h;
    return this.total;
  }

  // Nested: method -> method -> import.
  async viaNested(n: i32): Promise<i32> {
    let h = await this.viaThis(n);
    return h + 1;
  }
}

// `await obj.method()`: the receiver is a local in a top-level function.
export async function viaObj(n: i32): Promise<i32> {
  let w = new W();
  let h = await w.helper(n);
  return h;
}

// `await new W().helper()`: the receiver is an expression, not a local.
export async function viaNew(n: i32): Promise<i32> {
  let h = await new W().helper(n);
  return h;
}

// try/catch around a member await: an inner failure must reach the outer
// catch through the existing nested failure path (outer reject export).
export async function viaObjGuarded(n: i32): Promise<i32> {
  let w = new W();
  try {
    let h = await w.helper(n);
    return h;
  } catch (e) {
    log("catch:" + e);
    return -1;
  }
}

// Entry points for the test driver: starting a task returns its handle.
export function startViaThis(): i32 {
  let w = new W();
  return changetype<i32>(w.viaThis(5));
}

export function startViaNested(): i32 {
  let w = new W();
  return changetype<i32>(w.viaNested(5));
}

export function startViaObj(n: i32): i32 {
  return changetype<i32>(viaObj(n));
}

export function startViaNew(n: i32): i32 {
  return changetype<i32>(viaNew(n));
}

export function startViaObjGuarded(n: i32): i32 {
  return changetype<i32>(viaObjGuarded(n));
}

// Mints the rejection message the glue passes to the reject export.
export function rejectMessage(): string {
  return "inner-boom";
}
