// Generic async functions are transformed once per instantiation: each
// call site resolves to a clone whose name carries the mangled type
// arguments (`f_i32`, `f_<string>`, `f_<Point>`), with its own state
// class and protocol exports. `run` awaits the i32 and string
// instantiations as nested tasks; `callPoint` calls the class
// instantiation directly from sync code, so its clone is created
// mid-compilation and driven by the glue through its entry export.
//@ external("env", "fetchValue")
declare function fetchValue(): Promise<i32>;

export async function f<T>(x: T): Promise<T> {
  let v = await fetchValue();
  return v > 0 ? x : x;
}

export class Point {
  x: i32 = 0;
  y: i32 = 0;
}

export function makePoint(x: i32, y: i32): Point {
  let p = new Point();
  p.x = x;
  p.y = y;
  return p;
}

export async function run(): Promise<i32> {
  let a = await f<i32>(42);
  let b = await f<string>("hi");
  return a + (b.length > 0 ? 1 : 0);
}

export function callPoint(p: Point): i32 {
  return changetype<i32>(f<Point>(p));
}
