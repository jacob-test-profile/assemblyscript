// Probe D2: async method + `this`, LIFTED — the shape CPS must emit.
// The arrow is gone: the callback is an ordinary method on the worker,
// and `this` is the worker itself, held as the state object across
// suspension. After resume the method runs against the same instance.
@external("env", "__async_request")
declare function request(arg: string): i32;

class Worker {
  count: i32 = 0;
  state: i32 = 0;
  pending: string = "";

  onData(s: string): void {
    this.count += s.length;
  }

  step(): i32 {
    while (true) {
      switch (this.state) {
        case 0: {
          if (request("x") == 0) {
            this.state = 1;
            return 0;
          }
          break;
        }
        case 1: {
          this.onData(this.pending);
          this.count += 100;
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

let worker: Worker | null = null;

export function start(): i32 {
  let w = new Worker();
  worker = w;
  return w.step();
}

export function resumeTask(value: string): i32 {
  let w = worker;
  if (w == null) return -1;
  w.pending = value;
  return w.step();
}

export function getCount(): i32 {
  let w = worker;
  return w == null ? -1 : w.count;
}
