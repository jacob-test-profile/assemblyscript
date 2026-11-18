//@ external("env", "getRef")
declare function getRef(): Promise<externref>;

export async function externrefMember(): Promise<string> {
  let xs = await Promise.all([getRef()]);
  return xs.length.toString();
}
