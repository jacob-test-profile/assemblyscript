// Async methods on a generic class are transformed once per class
// instantiation: `Box<T>.get` at `Box<i32>` becomes method `get_i32`
// (qualName `Box_get_i32`), with entry export
// `__async_<file>_Box_get_i32_entry` and class-new export
// `__async_<file>_Box_i32_new`. A generic method's own type args join
// the mangled name (`Box<T>.wrap<U>` at `Box<i32>.wrap<string>` becomes
// `wrap_i32_string`, qualName `Box_wrap_i32_string`). `run` and `runWrap`
// await the methods as nested tasks; the glue also drives the methods
// directly through the entry exports.
//@ external("env", "fetchValue")
declare function fetchValue(): Promise<i32>;

export class Box<T> {
  value: T;
  constructor(value: T) {
    this.value = value;
  }
  async get(): Promise<T> {
    let v = await fetchValue();
    return v > 0 ? this.value : this.value;
  }
  async wrap<U>(x: U): Promise<U> {
    let v = await fetchValue();
    return v > 0 ? x : x;
  }
}

export async function run(): Promise<i32> {
  let box = new Box<i32>(42);
  let v = await box.get();
  return v;
}

export async function runWrap(): Promise<string> {
  let box = new Box<i32>(42);
  let v = await box.wrap<string>("hey");
  return v;
}
