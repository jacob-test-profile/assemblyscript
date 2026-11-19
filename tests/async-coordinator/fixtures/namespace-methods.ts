// Async methods on namespaced classes, driven through the generated
// coordinator. The wrapper class mirrors the namespace path
// (`api.NS2.H`, `api.Outer.Inner.Deep`), instance methods live on the
// prototype under their plain name, statics on the constructor; a
// generic class in a namespace composes both (`api.NS.GBox_i32`).
//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "fetchValue")
declare function fetchValue(): Promise<i32>;

export namespace NS2 {
  export class H {
    v: i32;
    constructor(v: i32) {
      this.v = v;
    }
    async m(): Promise<string> {
      let c = await getChunk(0);
      return c + this.v.toString();
    }
    static async make(v: i32): Promise<i32> {
      let c = await getChunk(v);
      return v + c.length;
    }
  }
}

export namespace Outer {
  export namespace Inner {
    export class Deep {
      async m(): Promise<string> {
        let c = await getChunk(2);
        return "deep-" + c;
      }
    }
  }
}

export namespace NS {
  export class GBox<T> {
    value: T;
    constructor(value: T) {
      this.value = value;
    }
    async get(): Promise<T> {
      let v = await fetchValue();
      return v > 0 ? this.value : this.value;
    }
  }
}

export async function runNs(): Promise<string> {
  let h = new NS2.H(5);
  let c = await h.m();
  return c;
}

export async function runNsStatic(): Promise<i32> {
  return await NS2.H.make(3);
}

export async function runDeep(): Promise<string> {
  let d = new Outer.Inner.Deep();
  let c = await d.m();
  return c;
}

export async function runCombo(): Promise<i32> {
  let box = new NS.GBox<i32>(42);
  let v = await box.get();
  return v;
}
