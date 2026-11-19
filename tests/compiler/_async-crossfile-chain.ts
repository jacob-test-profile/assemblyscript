// Chain helper for async-crossfile: awaits the helper in another file.
import { helper } from "./_async-crossfile-helper";

export async function chain(n: i32): Promise<string> {
  let c = await helper();
  return c + n.toString();
}
