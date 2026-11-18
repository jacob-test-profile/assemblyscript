import {
  add,
  sub,
  renamed_mul as mul,
  a,
  b,
  renamed_c as c
} from "./export.ts";

add(a, b) + sub(b, c) + mul(c, a);

import * as other from "./export.js";

other.add(other.a, other.b);

import theDefault from "./export-default.ts";

theDefault();

export { renamed_mul } from "./export.ts";
