// Diagnostic fixture: one function per loud rejection that had no
// pinned fixture (throw-await, labeled break, member-call await,
// arrow misuse, field-assignment await, generic/namespaced-class
// methods, void await).
//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;
//@ external("env", "getVoid")
declare function getVoid(): Promise<void>;

export function takeFn(f: () => Promise<i32>): void {}

class W {
  async m(): Promise<string> {
    let c = await getChunk(0);
    return c;
  }

  sync(n: i32): Promise<string> {
    return getChunk(n);
  }
}

class G<T> {
  async fetch(): Promise<string> {
    let c = await getChunk(0);
    return c;
  }
}

namespace NS2 {
  export class H {
    async m(): Promise<string> {
      let c = await getChunk(0);
      return c;
    }
  }
}

export async function throwAwait(): Promise<string> {
  throw await getChunk(0);
}

export async function labeledBreak(): Promise<string> {
  let i = 0;
  while (i < 3) {
    i++;
    if (i == 2) break outer;
    let c = await getChunk(i);
  }
  return "x";
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

export async function awaitVoid(): Promise<string> {
  await getVoid();
  return "x";
}

// Member-call await stays loud when the callee is not a transformed
// async method: a sync method, an unresolvable member, a generic-class
// method, and a namespaced-class method. (A static method is drivable:
// see async-static-method.ts.)
export async function awaitSync(): Promise<string> {
  let w = new W();
  let c = await w.sync(0);
  return c;
}

export async function awaitNope(): Promise<string> {
  let w = new W();
  let c = await w.nope(0);
  return c;
}

export async function awaitGeneric(): Promise<string> {
  let g = new G<i32>();
  let c = await g.fetch();
  return c;
}

export async function awaitNamespaced(): Promise<string> {
  let h = new NS2.H();
  let c = await h.m();
  return c;
}
