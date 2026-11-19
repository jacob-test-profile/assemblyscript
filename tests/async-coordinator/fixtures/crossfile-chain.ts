// Chain helper for the cross-file coordinator fixture.
import { helper } from "./crossfile-helper";

export async function chain(n: i32): Promise<string> {
  let c = await helper();
  return c + n.toString();
}
