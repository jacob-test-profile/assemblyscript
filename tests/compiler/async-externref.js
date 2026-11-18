const sentinel = { tag: "handle" };
let seenHandle = null;

export function preInstantiate(imports, exports) {
  seenHandle = null;
  imports.env.getHandle = function() {
    return 0; // suspended
  };
  imports.env.useHandle = function(h) {
    seenHandle = h;
    return 0; // suspended
  };
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  const handle = exports.handleRoundtrip();
  const status = exports.__async_async_externref_handleRoundtrip_status;
  const result = exports.__async_async_externref_handleRoundtrip_result;
  const error = exports.__async_async_externref_handleRoundtrip_error;
  let st = status(handle);
  if (st != 1) throw new Error("expected status 1 (site 0), got " + st);
  exports.__async_async_externref_handleRoundtrip_resume_0(handle, sentinel);
  st = status(handle);
  if (st != 2) throw new Error("expected status 2 (site 1), got " + st);
  if (seenHandle !== sentinel) throw new Error("externref identity lost across await");
  exports.__async_async_externref_handleRoundtrip_resume_1(handle, 42);
  st = status(handle);
  if (st != -1) throw new Error("expected status -1 (completed), got " + st);
  const out = result(handle);
  if (out !== 42) throw new Error("wrong result: " + out);
}
