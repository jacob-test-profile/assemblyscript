// Probe B1 (rewritten): try/catch/finally DESUGARED — the shape CPS must
// emit, because asc has no native try (compileTryStatement errors
// "Not implemented: Exceptions" unconditionally). There is no `try`
// keyword in this file at all: a `throw` becomes "set the error slot and
// jump to the handler state", the catch is a handler state, and the
// finally body is an explicit runFinally() called at the real exits
// only, guarded so it runs exactly once — never on suspend.
// mode 0: normal completion. mode 1: throw after await. mode 2: throw
// before any await (synchronous throw inside try).
@external("env", "__async_request")
declare function request(arg: string): i32;

@external("env", "__async_log")
declare function log(msg: string): void;

let mode: i32 = 0;

class Task {
  state: i32 = 0;
  finallyDone: bool = false;
  error: string = "";

  runFinally(): void {
    if (!this.finallyDone) {
      this.finallyDone = true;
      log("finally");
    }
  }

  step(): i32 {
    while (true) {
      switch (this.state) {
        case 0: {
          log("enter");
          if (mode == 2) {
            this.error = "sync-boom";
            this.state = 10;
            break;
          }
          if (request("x") == 0) {
            this.state = 1;
            return 0;
          }
          break;
        }
        case 1: {
          log("after-await");
          if (mode == 1) {
            this.error = "async-boom";
            this.state = 10;
            break;
          }
          this.state = 2;
          break;
        }
        case 2: {
          this.runFinally();
          return 1;
        }
        case 10: {
          log("catch");
          this.runFinally();
          return 1;
        }
        default: {
          this.runFinally();
          return 1;
        }
      }
    }
  }
}

let task: Task | null = null;

export function setMode(m: i32): void {
  mode = m;
}

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
