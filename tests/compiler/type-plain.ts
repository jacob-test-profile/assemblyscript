export class Foo {
  x: i32 = 1;
  bar(): i32 {
    return this.x;
  }
}

export function makeFoo(): Foo {
  return new Foo();
}
