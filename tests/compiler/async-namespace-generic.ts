// A generic async function in a namespace is transformed once per
// instantiation, like a top-level generic function, but its clone
// qualifies with the namespace path (`NS_id_i32`,
// `Outer_Inner_id_i32`): the protocol members register under the file
// and the entry alias is top-level, so the coordinator can drive it
// (api.NS.id_i32). A clone in a non-exported namespace (`Plain`) stays
// inner-only, driven nested through `runPlain`.
//@ external("env", "fetchValue")
declare function fetchValue(): Promise<i32>;

export namespace NS {
  export async function id<T>(x: T): Promise<T> {
    let v = await fetchValue();
    return v > 0 ? x : x;
  }
}

export namespace Outer {
  export namespace Inner {
    export async function id<T>(x: T): Promise<T> {
      let v = await fetchValue();
      return v > 0 ? x : x;
    }
  }
}

namespace Plain {
  export async function id<T>(x: T): Promise<T> {
    let v = await fetchValue();
    return v > 0 ? x : x;
  }
}

export async function runNsGen(): Promise<i32> {
  let a = await NS.id<i32>(42);
  return a;
}

export async function runOuterGen(): Promise<i32> {
  let a = await Outer.Inner.id<i32>(7);
  return a;
}

export async function runPlain(): Promise<i32> {
  let a = await Plain.id<i32>(9);
  return a;
}

export async function runStr(): Promise<string> {
  let s = await NS.id<string>("hi");
  return s;
}
