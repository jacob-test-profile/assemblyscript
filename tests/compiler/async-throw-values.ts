// Thrown values: the error channel carries the value, not just a string
// message. Uncaught throws fail the task with `__error` = the message and
// `__errorValue` = the thrown value (null for primitives / externref).
// `throw await X` throws the awaited value.
//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "getError")
declare function getError(): Promise<Error>;
//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

// Uncaught Error object: message is the Error's message, value is the Error.
export async function throwError(): Promise<string> {
  throw new Error("err-boom");
  return "unreachable";
}

// Uncaught string: message is the string, value is the string.
export async function throwString(): Promise<string> {
  throw "str-boom";
  return "unreachable";
}

// Uncaught number: message is "42", value is null.
export async function throwNumber(): Promise<string> {
  throw 42;
  return "unreachable";
}

// Caught Error: the catch sees the Error's message.
export async function catchError(): Promise<string> {
  try {
    throw new Error("caught-err");
  } catch (e) {
    return "caught:" + e;
  }
  return "unreachable";
}

// throw await <string>: the awaited string becomes the thrown value.
export async function throwAwaitString(): Promise<string> {
  throw await getChunk(0);
  return "unreachable";
}

// throw await <Error>: the awaited Error becomes the thrown value.
export async function throwAwaitError(): Promise<string> {
  throw await getError();
  return "unreachable";
}

// throw await <number>: the awaited number becomes the thrown value.
export async function throwAwaitNumber(): Promise<string> {
  throw await getNumber();
  return "unreachable";
}

// throw await caught: the awaited string is caught with its message.
export async function catchAwaitString(): Promise<string> {
  try {
    throw await getChunk(0);
  } catch (e) {
    return "caught:" + e;
  }
  return "unreachable";
}

// Nested propagation: the inner throw's value reaches the outer catch.
export async function nestedThrow(): Promise<string> {
  try {
    try {
      throw new Error("inner-err");
    } catch (e) {
      throw new Error("re-" + e);
    }
  } catch (e) {
    return "outer:" + e;
  }
  return "unreachable";
}

// Throw in a catch with no enclosing try: fails the task with the new error.
export async function throwInCatch(): Promise<string> {
  try {
    throw "first";
  } catch (e) {
    throw new Error("second-" + e);
  }
  return "unreachable";
}

// A class-typed thrown value: message "", value is the object.
class Box {
  v: i32 = 7;
}
export async function throwBox(): Promise<string> {
  let b = new Box();
  b.v = 21;
  throw b;
  return "unreachable";
}

export function chunkString(i: i32): string {
  return "A";
}
export function makeError(): Error {
  return new Error("made-err");
}
export function numValue(): i32 {
  return 42;
}
export function errMessage(e: Error): string {
  return e.message;
}
export function boxValue(b: Box): i32 {
  return b.v;
}
