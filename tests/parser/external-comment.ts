//@external("env", "someFunc")
export declare function someFunc(input: string): string;

// @external("bar")
export declare function two(): void;

//@external('foo', 'baz')
export declare function three(): void;

//@external("foo", "var")
export declare const var_: i32;
