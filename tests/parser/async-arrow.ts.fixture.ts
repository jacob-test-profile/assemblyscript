const f = async (): Promise<i32> => 1;
const g = async (x: Promise<i32>): Promise<i32> => await x;
const h = async x => x;
const i = async function(): Promise<i32> {
  return 1;
};
const j = async (x: Promise<i32>): Promise<i32> => {
  return await x;
};
