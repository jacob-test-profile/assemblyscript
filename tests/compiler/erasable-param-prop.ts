class C {
  constructor(public x: i32) {}
}

export function f(): i32 {
  return new C(1).x;
}
