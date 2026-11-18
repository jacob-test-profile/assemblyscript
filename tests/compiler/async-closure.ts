//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

// A closure capturing and mutating a local, called on both sides of a
// suspension: the counter reads 1 then 2.
export async function counter(): Promise<i32> {
  let n = 0;
  let inc = (): i32 => {
    n = n + 1;
    return n;
  };
  let first = inc();
  let m = await getNumber();
  let second = inc();
  return first * 10 + second + m;
}

// A closure passed as an argument, capturing a local.
function apply(f: (x: i32) => i32, x: i32): i32 {
  return f(x);
}

export async function passed(): Promise<i32> {
  let base = 40;
  let add = (x: i32): i32 => x + base;
  let m = await getNumber();
  return apply(add, 2) + m;
}

// A nested closure: the inner captures only an async-function local
// (a state field), not the outer closure's parameter.
export async function nested(): Promise<i32> {
  let n = 5;
  let outer = (x: i32): i32 => {
    let inner = (y: i32): i32 => y + n;
    return inner(10) + x;
  };
  let m = await getNumber();
  return outer(1) + m;
}

// A closure capturing a string, read after the captured local is mutated.
export async function greeting(): Promise<string> {
  let who = "world";
  let greet = (): string => "hello " + who;
  let m = await getNumber();
  who = "there";
  return greet() + m.toString();
}
