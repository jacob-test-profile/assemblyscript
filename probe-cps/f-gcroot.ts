// Probe F: GC-rooting of suspended locals.
// F1: the state object is held in a module global (a GC root); suspend,
// force a full collection with __collect, resume — fields must be intact.
// F2 (hazard demo): drop the global root so only a raw JS-held pointer
// remains, churn allocations, force __collect, then re-enter through the
// raw pointer and report whether the object survived. The F2 outcome is
// recorded, not asserted — it shows why the coordinator must pin or keep
// a wasm-side root instead of holding a bare pointer.
@external("env", "__async_request")
declare function request(arg: string): i32;

class Task {
  state: i32 = 0;
  data: Array<string> = new Array<string>();
  pending: string = "";

  step(): i32 {
    while (true) {
      switch (this.state) {
        case 0: {
          this.data.push("a");
          this.data.push("b");
          if (request("x") == 0) {
            this.state = 1;
            return 0;
          }
          break;
        }
        case 1: {
          this.data.push(this.pending);
          this.state = 2;
          break;
        }
        default: {
          return 1;
        }
      }
    }
  }
}

let task: Task | null = null;

export function start(): i32 {
  let t = new Task();
  task = t;
  return t.step();
}

export function resumeTask(value: string): i32 {
  let t = task;
  if (t == null) return -1;
  t.pending = value;
  return t.step();
}

export function resumeByPtr(ptr: i32, value: string): i32 {
  let t = changetype<Task>(ptr);
  task = t;
  t.pending = value;
  return t.step();
}

export function getDataJoined(): string {
  let t = task;
  return t == null ? "" : t.data.join(",");
}

export function getTaskPtr(): i32 {
  let t = task;
  return t == null ? 0 : changetype<i32>(t);
}

export function dropGlobal(): void {
  task = null;
}

export function churn(): void {
  for (let i = 0; i < 1000; i++) {
    let s = "churn" + i.toString();
    s.length;
  }
}
