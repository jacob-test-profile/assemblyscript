import { Foo } from "./export-type-star.ts";

export function h(): i32 {
  return new Foo().bar();
}
