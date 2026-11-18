import { type Foo, makeFoo } from "./type-plain.ts";

export function g(): i32 {
  return makeFoo().bar();
}

export function h(x: Foo): i32 {
  return 1;
}
