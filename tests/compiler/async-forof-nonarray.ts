export async function f(): Promise<string> {
  let s = "ab";
  let out = "";
  for (const c of s) {
    out = out + c;
  }
  return out;
}
