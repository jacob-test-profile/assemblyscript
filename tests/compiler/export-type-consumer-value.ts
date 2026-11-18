import { Foo } from "./export-type-from.ts";

export function h(): i32 {
  return new Foo().bar();
}
