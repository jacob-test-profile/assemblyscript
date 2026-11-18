//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

class Base {
  n: i32 = 20;
  protected _v: i32 = 10;
  get v(): i32 { return this._v; }
  set v(value: i32) { this._v = value; }
  foo(): i32 { return 2; }
  bar(): i32 { return 200; }
}

export class Child extends Base {
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

  // A `super` call inside an extracted async arrow.
  async superInArrow(): Promise<i32> {
    let g = async (): Promise<i32> => {
      let m = await getNumber();
      return super.foo() + m;
    };
    return await g();
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

// Entry points for the test driver: starting a method returns its task handle.
export function startSuperCall(): i32 {
  return changetype<i32>(new Child().superCall());
}
export function startSuperField(): i32 {
  return changetype<i32>(new Child().superField());
}
export function startSuperAccessor(): i32 {
  return changetype<i32>(new Child().superAccessor());
}
export function startSuperInClosure(): i32 {
  return changetype<i32>(new Child().superInClosure());
}
export function startSuperInArrow(): i32 {
  return changetype<i32>(new Child().superInArrow());
}
export function startSuperInherited(): i32 {
  return changetype<i32>(new Child().superInherited());
}
export function startSuperCompound(): i32 {
  return changetype<i32>(new Child().superCompound());
}
