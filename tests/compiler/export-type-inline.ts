import { Foo, makeFoo } from "./type-plain.ts";

export { type Foo };

export function g(): i32 {
  return makeFoo().bar();
}
