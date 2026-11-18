//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

// An async arrow assigned to a local and awaited (nested await).
export async function arrowed(): Promise<i32> {
  let getTen = async (): Promise<i32> => {
    let m = await getNumber();
    return m + 1;
  };
  let v = await getTen();
  return v + 1;
}

export class Worker {
  base: i32 = 5;

  // An async arrow in a method, closing over the receiver.
  async run(): Promise<i32> {
    let getBase = async (): Promise<i32> => {
      let m = await getNumber();
      return this.base + m;
    };
    let v = await getBase();
    return v;
  }
}

export class Holder {
  getValue: () => Promise<i32> = async (): Promise<i32> => {
    let m = await getNumber();
    return m + 2;
  };

  // An async arrow held in a field, awaited through the receiver.
  async fetch(): Promise<i32> {
    let v = await this.getValue();
    return v;
  }
}

// Entry points for the test driver: starting a method returns its task handle.
export function startWorker(): i32 {
  let w = new Worker();
  return changetype<i32>(w.run());
}

export function startHolderFetch(): i32 {
  let h = new Holder();
  return changetype<i32>(h.fetch());
}
