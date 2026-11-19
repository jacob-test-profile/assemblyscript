//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;
//@ external("env", "getHandle")
declare function getHandle(): Promise<externref>;
//@ external("env", "useHandle")
declare function useHandle(h: externref): Promise<i32>;

// An async arrow capturing an outer local, read across a suspension.
export async function arrowCapture(): Promise<i32> {
  let x: i32 = 1;
  let f = async (): Promise<i32> => {
    let m = await getNumber();
    return x + m + 1;
  };
  return await f();
}

// An async arrow writing to a captured plain local: the write is shared
// through the enclosing function's state object.
export async function arrowCaptureWrite(): Promise<i32> {
  let x: i32 = 10;
  let f = async (): Promise<i32> => {
    let m = await getNumber();
    x += 5;
    return x + m;
  };
  let v = await f();
  return v + x;
}

// An async arrow defined inside a block where `x` shadows the outer
// `x`: it captures the block's `x`, not the outer one.
export async function arrowCaptureShadow(): Promise<i32> {
  let x: i32 = 100;
  let f: () => Promise<i32>;
  {
    let x: i32 = 1000;
    f = async (): Promise<i32> => {
      let m = await getNumber();
      return x + m;
    };
  }
  return await f();
}

// An async arrow calling another async arrow from the same function.
export async function arrowCallsArrow(): Promise<i32> {
  let x: i32 = 2;
  let g = async (): Promise<i32> => {
    let m = await getNumber();
    return x + m;
  };
  let f = async (): Promise<i32> => {
    let v = await g();
    return v + 1;
  };
  return await f();
}

export class ArrowHolder {
  base: i32 = 7;

  // An async arrow in a method, capturing a method local and the receiver.
  async run(): Promise<i32> {
    let bonus: i32 = 3;
    let f = async (): Promise<i32> => {
      let m = await getNumber();
      return this.base + bonus + m;
    };
    return await f();
  }
}

// An async arrow capturing an externref local, read across a suspension
// through the spill slot.
export async function arrowCaptureExtern(): Promise<i32> {
  let h = await getHandle();
  let f = async (): Promise<i32> => {
    let m = await getNumber();
    let n = await useHandle(h);
    return n + m;
  };
  return await f();
}

// Entry point for the test driver: starting a method returns its task handle.
export function startHolderRun(): i32 {
  let h = new ArrowHolder();
  return changetype<i32>(h.run());
}
