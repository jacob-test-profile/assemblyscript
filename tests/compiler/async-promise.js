export function preInstantiate(imports, exports) {
  imports.env.getNumber = function() {
    return 0; // a null Promise pointer; never called, instantiation only
  };
}
