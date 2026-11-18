// Async methods on a generic class are transformed once per class
// instantiation: `Box<T>.get` at `Box<i32>` becomes method `get_i32`
// (qualName `Box_get_i32`), with entry export
// `__async_<file>_Box_get_i32_entry` and class-new export
// `__async_<file>_Box_i32_new`. `run` awaits the method as a nested task;
// the glue also drives the method directly through the entry export.
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
}

export async function run(): Promise<i32> {
  let box = new Box<i32>(42);
  let v = await box.get();
  return v;
}
