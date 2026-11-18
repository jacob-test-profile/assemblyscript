//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

export class Base {
  n: i32 = 1;
}

export class Child extends Base {
  // `super` cannot be lifted: it is rejected loudly.
  async badSuper(): Promise<i32> {
    let m = await getNumber();
    return super.n + m;
  }
}

// An async arrow capturing an outer local is rejected loudly.
export async function badCapture(): Promise<i32> {
  let x = 1;
  let f = async (): Promise<i32> => {
    return x + 1;
  };
  return await f();
}

// A closure with a default parameter is rejected loudly.
export async function badDefault(): Promise<i32> {
  let f = (x: i32 = 1): i32 => x;
  return f();
}

// A nested closure capturing the outer closure's parameter is rejected loudly.
export async function badNestedCapture(): Promise<i32> {
  let outer = (x: i32): i32 => {
    let inner = (y: i32): i32 => x + y;
    return inner(10);
  };
  return outer(1);
}
