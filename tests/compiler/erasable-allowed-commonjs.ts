enum Color {
  Red,
  Green
}

namespace N {
  export function f(): i32 {
    return 1;
  }
}

class C {
  constructor(public x: i32) {}
}

export function g(c: Color): i32 {
  return c + N.f() + new C(1).x;
}
