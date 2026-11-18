// Diagnostic fixture: an instance async method named `dispose` collides
// with the coordinator wrapper's sync dispose(), so it fails loudly
// with the remedy (rename the method) instead of being shadowed.
//@ external("env", "getNumber")
declare function getNumber(): Promise<i32>;

export class HasDispose {
  async dispose(): Promise<i32> {
    let m = await getNumber();
    return m;
  }
}
