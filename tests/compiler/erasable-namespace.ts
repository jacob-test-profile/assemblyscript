namespace N {
  export function f(): i32 {
    return 1;
  }
}

export function g(): i32 {
  return N.f();
}
