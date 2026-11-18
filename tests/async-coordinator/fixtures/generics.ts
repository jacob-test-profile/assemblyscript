// Generic async functions and generic-class methods, driven through the
// generated coordinator. Each instantiation is a separate exported clone
// (`id_i32`, `id_<string>`, `withHandle_<externref>`); `runGeneric`,
// `runHandle` and `runBox` await them as nested tasks. `runPoint` awaits
// a class-typed instantiation, which the coordinator cannot drive (the
// pre-existing class-await limit): it is transformed and compilable, but
// has no JS method — the test pins that absence.
//@ external("env", "fetchValue")
declare function fetchValue(): Promise<i32>;
//@ external("env", "fetchHandle")
declare function fetchHandle(): Promise<externref>;

export async function id<T>(x: T): Promise<T> {
  let v = await fetchValue();
  return v > 0 ? x : x;
}

export async function withHandle<T>(x: T): Promise<i32> {
  let h = await fetchHandle();
  return 1;
}

export async function runGeneric(): Promise<i32> {
  let a = await id<i32>(42);
  let b = await id<string>("hi");
  return a + (b.length > 0 ? 1 : 0);
}

export async function runHandle(): Promise<i32> {
  let h = await fetchHandle();
  let a = await withHandle<externref>(h);
  let b = await withHandle<i32>(42);
  return a + b;
}

export class Box<T> {
  value: T;
  constructor(value: T) {
    this.value = value;
  }
  async get(): Promise<T> {
    let v = await fetchValue();
    return v > 0 ? this.value : this.value;
  }
}

export async function runBox(): Promise<i32> {
  let box = new Box<i32>(42);
  let v = await box.get();
  return v;
}

export class Point {
  x: i32 = 0;
  y: i32 = 0;
}

export async function runPoint(): Promise<i32> {
  let p = new Point();
  p.x = 7;
  let q = await id<Point>(p);
  return q.x;
}

// A generic suspending import: one wrapper serves all instantiations
// whose parameter types agree (here every call passes an i32); each
// instantiation's result is delivered through its own await site.
//@ external("env", "fetch")
declare function fetch<T>(x: i32): Promise<T>;

export async function runFetch(): Promise<i32> {
  let a = await fetch<i32>(1);
  let b = await fetch<string>(2);
  return a + (b.length > 0 ? 1 : 0);
}
