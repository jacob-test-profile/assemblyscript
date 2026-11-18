// Probe C (rewritten): closures, ENV-LIFTED — the shape CPS must emit,
// because asc has no closures at all (any capture of an outer local is
// AS100 "Not implemented: Closures", pinned by tests/compiler/closure.ts).
// The captured variables live as fields of an explicit Env object, and
// the "closures" are ordinary methods on it. Same assertions as before:
// C1 arrow-equivalent reads a captured value after resume; C2 the
// counter closure mutates shared storage (1 then 2).
@external("env", "__async_request")
declare function request(arg: string): i32;

class Env {
  greeting: string = "";
  n: i32 = 0;

  greet(s: string): string {
    return this.greeting + "-" + s;
  }

  inc(): i32 {
    this.n += 1;
    return this.n;
  }
}

class Task {
  state: i32 = 0;
  env: Env = new Env();
  first: i32 = 0;
  result: string = "";
  pending: string = "";

  step(): i32 {
    while (true) {
      switch (this.state) {
        case 0: {
          this.env.greeting = "hello";
          this.first = this.env.inc();
          if (request("x") == 0) {
            this.state = 1;
            return 0;
          }
          break;
        }
        case 1: {
          this.result = this.env.greet(this.pending) + "|" + this.env.inc().toString();
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

export function getFirst(): i32 {
  let t = task;
  return t == null ? -1 : t.first;
}

export function getResult(): string {
  let t = task;
  return t == null ? "" : t.result;
}
