//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;
//@ external("env", "getHandle")
declare function getHandle(): Promise<externref>;

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

// An async arrow writing to a captured externref local is rejected
// loudly: the spill slot is a value copy, so the write could not be
// shared with the enclosing function.
export async function badSpilledWrite(): Promise<i32> {
  let h = await getHandle();
  let f = async (): Promise<i32> => {
    let m = await getNumber();
    h = await getHandle();
    return m;
  };
  return await f();
}

// An async arrow inside an async arrow capturing the enclosing
// function's local is rejected loudly: transitive captures are not
// threaded through the intermediate arrow.
export async function badAncestorCapture(): Promise<i32> {
  let x: i32 = 1;
  let f = async (): Promise<i32> => {
    let g = async (): Promise<i32> => {
      let m = await getNumber();
      return x + m;
    };
    return await g();
  };
  return await f();
}
