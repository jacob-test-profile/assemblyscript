export function preInstantiate(imports, exports) {
  imports["external-comment"] = {
    foo: function() { /* nop */ },
    bar: function() { /* nop */ }
  };
  imports.foo = {
    baz: function() { /* nop */ },
    "var": 3
  };
}
