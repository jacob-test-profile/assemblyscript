//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

// A nested closure capturing the outer closure's parameter.
export async function nestedParam(): Promise<i32> {
  let m = await getNumber();
  let outer = (x: i32): i32 => {
    let inner = (y: i32): i32 => x + y;
    return inner(10);
  };
  return outer(1) + m;
}

// A nested closure capturing an outer-closure parameter AND an
// async-function local: the outer capture becomes an extra parameter
// of the lifted inner closure.
export async function nestedMixed(): Promise<i32> {
  let base: i32 = 100;
  let m = await getNumber();
  let outer = (x: i32): i32 => {
    let inner = (y: i32): i32 => x + y + base;
    return inner(10);
  };
  return outer(1) + m;
}

// A nested closure capturing an outer-closure parameter, an
// outer-closure annotated local, and an async-function local.
export async function nestedMixedLocal(): Promise<i32> {
  let base: i32 = 1000;
  let m = await getNumber();
  let outer = (x: i32): i32 => {
    let z: i32 = 5;
    let inner = (y: i32): i32 => x + y + z + base;
    return inner(10);
  };
  return outer(2) + m;
}
