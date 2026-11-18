// Probe E (rewritten): externref spill across suspension, GLOBAL slots.
// A managed class CANNOT hold an externref field (resolver: "Reference
// typed fields", src/resolver.ts:3447), and asc exposes no table.get/set
// API (std/assembly/table.ts is stubs; Binaryen has the ops but asc
// does not surface them). What remains at the AS level is module
// globals — two slots here, to show the shape generalises per slot.
// The host supplies two distinct JS objects; after suspend/resume the
// wasm code hands them back and the host checks identity (===).
// Compile with --enable reference-types.
@external("env", "__async_request")
declare function request(arg: string): i32;

@external("env", "makeRefA")
declare function makeRefA(): externref;

@external("env", "makeRefB")
declare function makeRefB(): externref;

@external("env", "checkRef")
declare function checkRef(r: externref, which: i32): i32;

let savedA: externref = null;
let savedB: externref = null;

class Task {
  state: i32 = 0;
  okA: i32 = -1;
  okB: i32 = -1;

  step(): i32 {
    while (true) {
      switch (this.state) {
        case 0: {
          savedA = makeRefA();
          savedB = makeRefB();
          if (request("x") == 0) {
            this.state = 1;
            return 0;
          }
          break;
        }
        case 1: {
          this.okA = checkRef(savedA, 0);
          this.okB = checkRef(savedB, 1);
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
  return t.step();
}

export function getOkA(): i32 {
  let t = task;
  return t == null ? -1 : t.okA;
}

export function getOkB(): i32 {
  let t = task;
  return t == null ? -1 : t.okB;
}
