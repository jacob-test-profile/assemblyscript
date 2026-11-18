// Probe D1 (constraint pin): an arrow function inside a method that
// touches `this` does not compile in stock asc — `this` resolves to the
// enclosing method element, not the instance (TS2339). The CPS transform
// must therefore lift arrows/methods itself; it cannot lean on the
// compiler's arrow capture.
class W {
  count: i32 = 0;
  test(): void {
    let f = (s: string): void => {
      this.count += s.length;
    };
    f("ab");
  }
}

export function go(): i32 {
  let w = new W();
  w.test();
  return w.count;
}
