//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

export function allNumbers(): Promise<Array<i32>> {
  return Promise.all([getNumber(), getNumber()]);
}

export function raceNumber(): Promise<i32> {
  return Promise.race([getNumber(), getNumber()]);
}
