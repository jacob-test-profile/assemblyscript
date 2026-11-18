import type { Foo } from "./type-plain.ts";

export function g(): i32 {
  return new Foo().bar();
}
