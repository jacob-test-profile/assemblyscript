export async function f(): Promise<string> {
  return "hi";
}
async function g(p: Promise<i32>): Promise<i32> {
  let n = await p;
  return n + 1;
}
async function h(p: Promise<i32>): Promise<i32> {
  return (await p) + 1;
}
async function i(): Promise<void> {}
