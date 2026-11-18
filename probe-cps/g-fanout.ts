// Probe G: issue/join fan-out under CPS.
// All members are issued (non-suspending imports returning reqIds)
// before a single suspending join. Results are delivered out of order
// and must come back in argument order; on a member rejection the join
// reports early (fail fast) and the task throws; late results are dropped.
@external("env", "__async_issue")
declare function issue(arg: string): i32;

@external("env", "__async_join")
declare function join(a: i32, b: i32, c: i32): i32;

@external("env", "__async_log")
declare function log(msg: string): void;

class Task {
  state: i32 = 0;
  req0: i32 = -1;
  req1: i32 = -1;
  req2: i32 = -1;
  results: Array<string> = new Array<string>(3);
  hasError: bool = false;
  errorMsg: string = "";

  step(): i32 {
    while (true) {
      switch (this.state) {
        case 0: {
          this.req0 = issue("a");
          this.req1 = issue("b");
          this.req2 = issue("c");
          log("issued");
          if (join(this.req0, this.req1, this.req2) == 0) {
            this.state = 1;
            return 0;
          }
          break;
        }
        case 1: {
          if (this.hasError) {
            log("throw:" + this.errorMsg);
            this.state = 3;
            break;
          }
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

export function storeResult(reqId: i32, value: string): void {
  let t = task;
  if (t == null) return;
  if (reqId == t.req0) t.results[0] = value;
  else if (reqId == t.req1) t.results[1] = value;
  else if (reqId == t.req2) t.results[2] = value;
}

export function storeError(reqId: i32, msg: string): void {
  let t = task;
  if (t == null) return;
  t.hasError = true;
  t.errorMsg = msg;
}

export function reportJoinDone(): i32 {
  let t = task;
  if (t == null) return -1;
  return t.step();
}

export function getResults(): string {
  let t = task;
  return t == null ? "" : t.results.join("|");
}

export function getError(): string {
  let t = task;
  return t == null ? "" : t.errorMsg;
}
