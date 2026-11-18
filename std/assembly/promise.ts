import { E_NOTIMPLEMENTED } from "./util/error";

// Phase 0: the Promise type only. Instances are created by the runtime,
// never constructed in user code; `all`, `race`, `allSettled` and `any`
// are transformed by Phase 1 into the issue/join protocol when awaited.
// Until then their bodies throw.
export class Promise<T> {

  static all<T>(values: Array<Promise<T>>): Promise<Array<T>> {
    throw new Error(E_NOTIMPLEMENTED);
  }

  static race<T>(values: Array<Promise<T>>): Promise<T> {
    throw new Error(E_NOTIMPLEMENTED);
  }

  static allSettled<T>(values: Array<Promise<T>>): Promise<Array<PromiseSettledResult<T>>> {
    throw new Error(E_NOTIMPLEMENTED);
  }

  static any<T>(values: Array<Promise<T>>): Promise<T> {
    throw new Error(E_NOTIMPLEMENTED);
  }
}

/** One member outcome of `Promise.allSettled`. */
export class PromiseSettledResult<T> {
  status: string;
  value: T;
  reason: string;

  constructor(status: string, value: T, reason: string) {
    this.status = status;
    this.value = value;
    this.reason = reason;
  }
}

// Phase 1, chunk 5: the single suspending join import. The transform
// issues every member (each suspending import returns a fresh heap-pointer
// token — never a small integer, which would crash the GC if stored in an
// Array<Promise<T>>), then calls this once with the tokens in argument
// order and a completion-policy flag (0 = all, 1 = race, 2 = allSettled,
// 3 = any). Returns 0 (suspended); the coordinator resumes the task
// through the per-site join exports.
@external("env", "__async_join")
export declare function __async_join(reqs: Array<i32>, policy: i32): i32;
