// Probe A: the CPS target shape, hand-written.
// A loop with an await inside, lowered by hand to a state machine whose
// locals live as fields. Suspension is modelled exactly as CPS will do it:
// the "request" import returns 0 (= suspended), step() returns 0, and the
// driver resumes later through the resume export with the delivered value.

@external("env", "__async_request")
declare function request(arg: string): i32;

@external("env", "__async_log")
declare function log(msg: string): void;

class ConcatTask {
  state: i32 = 0;
  i: i32 = 0;
  acc: string = "";
  pending: string = "";

  step(): i32 {
    while (true) {
      switch (this.state) {
        case 0: {
          this.i = 0;
          this.acc = "";
          this.state = 1;
          break;
        }
        case 1: {
          if (this.i >= 3) {
            this.state = 3;
            break;
          }
          log("issue chunk" + this.i.toString());
          if (request("chunk" + this.i.toString()) == 0) {
            this.state = 2;
            return 0;
          }
          break;
        }
        case 2: {
          this.acc += this.pending;
          this.i++;
          this.state = 1;
          break;
        }
        default: {
          return 1;
        }
      }
    }
  }
}

let task: ConcatTask | null = null;

export function start(): i32 {
  let t = new ConcatTask();
  task = t;
  return t.step();
}

export function resumeTask(value: string): i32 {
  let t = task;
  if (t == null) return -1;
  t.pending = value;
  return t.step();
}

export function getResult(): string {
  let t = task;
  return t == null ? "" : t.acc;
}
