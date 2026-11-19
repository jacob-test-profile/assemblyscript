// Async methods on namespaced classes are driven through top-level
// entry aliases, mirroring namespaced functions: `NS2.H.m` gets entry
// export `__async_<file>_NS2_H_m_entry` and class-new export
// `__async_<file>_NS2_H_new` (qualName `NS2_H_m`), and a nested
// namespace (`Outer.Inner.Deep.m`) qualifies the same way. `runNs`,
// `runNsStatic` and `runDeep` await the methods as nested tasks; the
// glue also drives the methods directly through the entry exports.
//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

// Sync helper the glue uses to allocate the string delivered to a resume
// export.
export function chunkString(i: i32): string {
  return "C" + i.toString();
}

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
