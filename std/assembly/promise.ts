import { E_NOTIMPLEMENTED } from "./util/error";

// Phase 0: the Promise type only. Instances are created by the runtime,
// never constructed in user code; `all` and `race` are transformed by
// Phase 1 into the issue/join protocol. Until then their bodies throw.
export class Promise<T> {

  static all<T>(values: Array<Promise<T>>): Promise<Array<T>> {
    throw new Error(E_NOTIMPLEMENTED);
  }

  static race<T>(values: Array<Promise<T>>): Promise<T> {
    throw new Error(E_NOTIMPLEMENTED);
  }
}
