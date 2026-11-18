// Diagnostic fixture: one function per loud rejection that had no
// pinned fixture (try-in-switch, member-call await,
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

  sync(n: i32): Promise<string> {
    return getChunk(n);
  }

  static async staticM(n: i32): Promise<string> {
    let c = await getChunk(n);
    return c;
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

// Member-call await stays loud when the callee is not a transformed
// async method: a sync method, a static method, an unresolvable member,
// a generic-class method, and a namespaced-class method.
export async function awaitSync(): Promise<string> {
  let w = new W();
  let c = await w.sync(0);
  return c;
}

export async function awaitStatic(): Promise<string> {
  let c = await W.staticM(0);
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
