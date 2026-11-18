export class C {
  //@ external("env", "inClass")
  foo(): void {}
}

export declare function afterClass(): void;

export function f(): void {
  //@ external("env", "inFunction")
  let x: i32 = 0;
}
