//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

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

// A nested closure writing to an outer-closure local is rejected
// loudly: the outer capture is passed by value, so the write could
// not be shared with the outer closure.
export async function badNestedWrite(): Promise<i32> {
  let m = await getNumber();
  let outer = (x: i32): i32 => {
    let n: i32 = 0;
    let inner = (): void => { n += x; };
    inner();
    return n;
  };
  return outer(1) + m;
}

// A nested closure capturing an unannotated outer-closure local is
// rejected loudly: the capture has no type to pass by value.
export async function badNestedUnannotated(): Promise<i32> {
  let m = await getNumber();
  let outer = (x: i32): i32 => {
    let z = 5;
    let inner = (y: i32): i32 => x + y + z;
    return inner(10);
  };
  return outer(1) + m;
}

// A nested closure returned as a value is rejected loudly: it cannot
// leave its defining scope.
export async function badNestedEscape(): Promise<i32> {
  let m = await getNumber();
  let outer = (x: i32): (y: i32) => i32 => {
    let inner = (y: i32): i32 => x + y;
    return inner;
  };
  return outer(1)(10) + m;
}
