// Diagnostic fixture: one function per loud rejection that had no
// pinned fixture (throw-await, try-in-switch, member-call await,
// cross-file await, join member/argument await, arrow misuse,
// field-assignment await, generic-class methods).
//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "getArray")
declare function getArray(): Promise<Array<Promise<i32>>>;
import { helper } from "./_async-crossfile-helper";

export function takeFn(f: () => Promise<i32>): void {}

class W {
  async m(): Promise<string> {
    let c = await getChunk(0);
    return c;
  }
}

class G<T> {
  async fetch(): Promise<string> {
    let c = await getChunk(0);
    return c;
  }
}

export async function throwAwait(): Promise<string> {
  throw await getChunk(0);
}

export async function tryInSwitch(x: i32): Promise<string> {
  switch (x) {
    case 1: {
      try {
        let c = await getChunk(0);
        return c;
      } catch (e) {
        return "caught";
      }
    }
    default:
      return "d";
  }
}

export async function awaitMember(): Promise<string> {
  let w = new W();
  let c = await w.m();
  return c;
}

export async function awaitOtherFile(): Promise<string> {
  let c = await helper();
  return c;
}

export async function joinMemberAwait(): Promise<string> {
  let rs = await Promise.all([await getChunk(0)]);
  return rs[0];
}

export async function joinArgAwait(): Promise<string> {
  let rs = await Promise.all(await getArray());
  return rs[0].toString();
}

export async function arrowPassed(): Promise<i32> {
  let f = async (): Promise<i32> => 1;
  takeFn(f);
  return 0;
}

export async function elemArrowAssign(): Promise<i32> {
  let arr = new Array<() => Promise<i32>>(1);
  arr[0] = async (): Promise<i32> => 1;
  return 0;
}

export async function arrowInClosure(): Promise<i32> {
  let f = (x: i32): i32 => {
    let g = async (): Promise<i32> => 1;
    return x;
  };
  return f(1);
}

export async function arrowCalledInClosure(): Promise<i32> {
  let g = async (): Promise<i32> => 1;
  let f = (x: i32): i32 => {
    g();
    return x;
  };
  return f(1);
}

export async function arrowAssignedInClosure(): Promise<i32> {
  let g: () => Promise<i32>;
  let f = (x: i32): i32 => {
    g = async (): Promise<i32> => 1;
    return x;
  };
  return f(1);
}

export async function fieldAssignAwait(): Promise<void> {
  let w = new W();
  w.x = await getChunk(0);
}
