class C {
  async m(): Promise<i32> {
    return 1;
  }
  static async s(): Promise<i32> {
    return 2;
  }
  async(): void {}
  async: i32 = 0;
}
abstract class A {
  abstract async m(): Promise<i32>;
}
