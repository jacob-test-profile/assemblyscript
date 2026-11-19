// Helper for async-super-reject: a base class in another file.
// Underscore-prefixed, so the compiler-test harness does not treat it
// as a test of its own.
export class CrossBase {
  foo(): i32 { return 1; }
}
