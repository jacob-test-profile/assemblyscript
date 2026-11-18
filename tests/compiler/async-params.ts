//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;
//@ external("env", "getString")
declare function getString(): Promise<string>;

// Default parameters are filled per call by the varargs stub, and the
// stub's defaults survive suspension (params are state fields).
export async function defInt(x: i32 = 5): Promise<i32> {
  const v = await getNumber();
  return x + v;
}
export async function defOther(a: i32, b: i32 = a + 1): Promise<i32> {
  const v = await getNumber();
  return b + v;
}
// Rest parameters are collected into an array by the caller; the array
// survives suspension as a state field.
export async function restNums(first: i32, ...rest: i32[]): Promise<i32> {
  const v = await getNumber();
  let sum = first + v;
  for (let i = 0; i < rest.length; ++i) sum += rest[i];
  return sum;
}
export async function restStrings(...words: string[]): Promise<string> {
  const v = await getString();
  return words.join(",") + "|" + v;
}
// Drivers for the rest functions: nested await passes elements, which
// the compiler collects into the array.
export async function driveRestNums(): Promise<i32> {
  return await restNums(1, 2, 3);
}
export async function driveRestStrings(): Promise<string> {
  return await restStrings("a", "b");
}
class Counter {
  count: i32 = 10;
  async add(step: i32 = 1): Promise<i32> {
    const v = await getNumber();
    this.count += step + v;
    return this.count;
  }
}
class Greeter {
  greeting: string;
  constructor(greeting: string = "hi") {
    this.greeting = greeting;
  }
  async greet(name: string = "there"): Promise<string> {
    const v = await getString();
    return this.greeting + " " + name + " " + v;
  }
}
// Drivers for the methods: nested await of a method with defaults.
export async function driveAdd(): Promise<i32> {
  const c = new Counter();
  return await c.add();
}
export async function driveAdd5(): Promise<i32> {
  const c = new Counter();
  return await c.add(5);
}
export async function driveGreeter(): Promise<string> {
  const g = new Greeter();
  return await g.greet();
}
export async function driveGreeterNamed(): Promise<string> {
  const g = new Greeter("hey");
  return await g.greet("bob");
}
// Test helper: a string value the glue passes to resume exports.
export function strS(): string {
  return "S";
}
// Test helpers: pre-built rest arrays the glue passes to the rest exports.
export function nums23(): Array<i32> {
  return [2, 3];
}
export function abStrings(): Array<string> {
  return ["a", "b"];
}
