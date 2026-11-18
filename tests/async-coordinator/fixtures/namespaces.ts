//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

export namespace NS {
  export async function take(): Promise<string> {
    let c = await getChunk(0);
    return "got-" + c;
  }

  export async function takeTwo(i: i32): Promise<string> {
    let c = await getChunk(i);
    return "two-" + c;
  }

  export async function viaOther(): Promise<string> {
    let c = await takeTwo(1);
    return "via-" + c;
  }

  export async function failing(): Promise<string> {
    let c = await getChunk(9);
    return "got-" + c;
  }
}

export namespace Outer {
  export namespace Inner {
    export async function deep(): Promise<string> {
      let c = await getChunk(2);
      return "deep-" + c;
    }
  }
}

export async function topViaNs(): Promise<string> {
  let c = await NS.take();
  return "top-" + c;
}

namespace Hidden {
  export async function secret(): Promise<string> {
    let c = await getChunk(3);
    return "secret-" + c;
  }
}

export async function viaHidden(): Promise<string> {
  let c = await Hidden.secret();
  return "via-hidden-" + c;
}
