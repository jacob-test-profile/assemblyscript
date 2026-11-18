async function f(p: Promise<i32>): Promise<i32> {
  let a = await p;
  let b = await p + 1;
  return await (await p);
}
function g(): i32 {
  return await 1;
}
let x = await 1;
