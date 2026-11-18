// Sync-only control fixture: compiling it must NOT emit a .async.js file.
export function add(a: i32, b: i32): i32 {
  return a + b;
}
