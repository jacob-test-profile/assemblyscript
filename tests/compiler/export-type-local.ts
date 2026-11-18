import { Foo } from "./type-plain.ts";

export type { Foo };

export function g(x: Foo): i32 {
  return x.x;
}
