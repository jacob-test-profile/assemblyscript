//@ external("env", "getChunk")
declare function getChunk(i: i32): Promise<string>;

// Namespaced async functions are rejected loudly: stock asc does not
// export namespace members, so the entry is not a WebAssembly export
// and the coordinator cannot drive it.
export namespace NS {
  export async function take(): Promise<string> {
    let c = await getChunk(0);
    return "got-" + c;
  }
}

// Same for async methods on classes in namespaces.
export namespace Outer {
  export class Holder {
    async fetch(): Promise<string> {
      let c = await getChunk(1);
      return "got-" + c;
    }
  }
}
