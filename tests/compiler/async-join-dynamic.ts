//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

// Allocates a fresh string per call; the driver uses its pointer as the
// member token. A small-integer token would crash the GC when stored in
// an Array<Promise<T>> (Array#push links the value as a reference).
export function mintString(i: i32): string {
  return "m" + i.toString();
}

export async function dynamicAll(): Promise<string> {
  let ps = new Array<Promise<i32>>();
  for (let i = 0; i < 3; i++) {
    ps.push(getNumber());
  }
  let xs = await Promise.all(ps);
  return xs.join("|");
}

export async function dynamicEmpty(): Promise<string> {
  let ps = new Array<Promise<i32>>();
  let xs = await Promise.all(ps);
  return xs.length.toString();
}
