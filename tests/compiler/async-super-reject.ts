// Diagnostic fixture: the `super` cases that stay loud.
//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

import { CrossBase } from "./_async-super-crossfile-helper";

class GenBase<T> {
  foo(): i32 { return 1; }
}

class AccBase {
  protected _v: i32 = 10;
  get v(): i32 { return this._v; }
  set v(value: i32) { this._v = value; }
}

class PlainBase {
  foo(): i32 { return 2; }
}

// `super` to a member of a generic base class.
export class GenChild extends GenBase<i32> {
  async badGenericBase(): Promise<i32> {
    let m = await getNumber();
    return super.foo() + m;
  }
}

// `super` to a member of a base class in another file.
export class CrossChild extends CrossBase {
  async badCrossFile(): Promise<i32> {
    let m = await getNumber();
    return super.foo() + m;
  }
}

// A `super` method used as a value.
export class ValueChild extends PlainBase {
  async badMethodValue(): Promise<i32> {
    let m = await getNumber();
    let f = super.foo;
    return f() + m;
  }
}

// A `super` accessor write nested inside another expression.
export class NestedChild extends AccBase {
  async badNestedSet(): Promise<i32> {
    let m = await getNumber();
    let x = (super.v = 5);
    return x + m;
  }
}
