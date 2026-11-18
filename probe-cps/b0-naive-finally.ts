// Probe B0: the NAIVE try/finally shape — expected to demonstrate the bug.
// A real try/finally wrapped around the dispatch switch: the `return 0`
// that signals suspension triggers the finally immediately, so the
// finally body runs on suspend (wrong) and again on real completion.
@external("env", "__async_request")
declare function request(arg: string): i32;

@external("env", "__async_log")
declare function log(msg: string): void;

class Task {
  state: i32 = 0;

  step(): i32 {
    try {
      while (true) {
        switch (this.state) {
          case 0: {
            log("enter");
            if (request("x") == 0) {
              this.state = 1;
              return 0;
            }
            break;
          }
          case 1: {
            log("after-await");
            this.state = 2;
            break;
          }
          default: {
            return 1;
          }
        }
      }
    } finally {
      log("finally");
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
