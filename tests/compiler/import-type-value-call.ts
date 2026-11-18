import type { makeFoo } from "./type-plain.ts";

export function g(): i32 {
  return makeFoo().bar();
}
