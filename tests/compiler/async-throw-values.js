let memory = null;

function getString(ptr) {
  const RUNTIME_HEADER_SIZE = 16;
  if (!ptr) return "null";
  const U32 = new Uint32Array(memory.buffer);
  const U16 = new Uint16Array(memory.buffer);
  const len16 = U32[(ptr - RUNTIME_HEADER_SIZE + 12) >>> 2] >>> 1;
  const ptr16 = ptr >>> 1;
  return String.fromCharCode.apply(String, U16.subarray(ptr16, ptr16 + len16));
}

export function preInstantiate(imports, exports) {
  memory = imports.env.memory;
  imports.env.getChunk = function(i) {
    return 0; // suspended; the glue delivers via the resume export
  };
  imports.env.getError = function() {
    return 0;
  };
  imports.env.getNumber = function() {
    return 0;
  };
}

// Drives one task: resume values are delivered in order (one per suspend).
// Returns { failed, value, errorValue } where value is the result string or
// the error message, and errorValue is the raw __errorValue pointer (0 = null).
function drive(exports, fn, resumeValues) {
  const base = `__async_async_throw_values_${fn}`;
  const handle = exports[fn]();
  const status = exports[base + "_status"];
  const resume = exports[base + "_resume_0"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  const errorValue = exports[base + "_errorValue"];
  let guard = 0;
  let ri = 0;
  while (true) {
    if (++guard > 10) throw new Error("loop guard in " + fn);
    const st = status(handle);
    if (st == -1) return { failed: false, value: getString(result(handle)), errorValue: 0 };
    if (st == -2) return { failed: true, value: getString(error(handle)), errorValue: errorValue(handle) };
    if (st <= 0) throw new Error("unexpected status " + st + " in " + fn);
    if (ri >= resumeValues.length) throw new Error("no more resume values for " + fn);
    const rc = resume(handle, resumeValues[ri++]);
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected step return " + rc + " in " + fn);
  }
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;

  const chunk = exports.chunkString(0);
  const errPtr = exports.makeError();
  const num = exports.numValue();

  let r = drive(exports, "throwError", []);
  if (!r.failed || r.value !== "err-boom") throw new Error("throwError: " + JSON.stringify(r));
  if (!r.errorValue || getString(exports.errMessage(r.errorValue)) !== "err-boom") throw new Error("throwError value: " + JSON.stringify(r));

  r = drive(exports, "throwString", []);
  if (!r.failed || r.value !== "str-boom") throw new Error("throwString: " + JSON.stringify(r));
  if (!r.errorValue || getString(r.errorValue) !== "str-boom") throw new Error("throwString value: " + JSON.stringify(r));

  r = drive(exports, "throwNumber", []);
  if (!r.failed || r.value !== "42") throw new Error("throwNumber: " + JSON.stringify(r));
  if (r.errorValue !== 0) throw new Error("throwNumber value: " + JSON.stringify(r));

  r = drive(exports, "catchError", []);
  if (r.failed || r.value !== "caught:caught-err") throw new Error("catchError: " + JSON.stringify(r));

  r = drive(exports, "throwAwaitString", [chunk]);
  if (!r.failed || r.value !== "A") throw new Error("throwAwaitString: " + JSON.stringify(r));
  if (!r.errorValue || getString(r.errorValue) !== "A") throw new Error("throwAwaitString value: " + JSON.stringify(r));

  r = drive(exports, "throwAwaitError", [errPtr]);
  if (!r.failed || r.value !== "made-err") throw new Error("throwAwaitError: " + JSON.stringify(r));
  if (!r.errorValue || getString(exports.errMessage(r.errorValue)) !== "made-err") throw new Error("throwAwaitError value: " + JSON.stringify(r));

  r = drive(exports, "throwAwaitNumber", [num]);
  if (!r.failed || r.value !== "42") throw new Error("throwAwaitNumber: " + JSON.stringify(r));
  if (r.errorValue !== 0) throw new Error("throwAwaitNumber value: " + JSON.stringify(r));

  r = drive(exports, "catchAwaitString", [chunk]);
  if (r.failed || r.value !== "caught:A") throw new Error("catchAwaitString: " + JSON.stringify(r));

  r = drive(exports, "nestedThrow", []);
  if (r.failed || r.value !== "outer:re-inner-err") throw new Error("nestedThrow: " + JSON.stringify(r));

  r = drive(exports, "throwInCatch", []);
  if (!r.failed || r.value !== "second-first") throw new Error("throwInCatch: " + JSON.stringify(r));
  if (!r.errorValue || getString(exports.errMessage(r.errorValue)) !== "second-first") throw new Error("throwInCatch value: " + JSON.stringify(r));

  r = drive(exports, "throwBox", []);
  if (!r.failed || r.value !== "") throw new Error("throwBox: " + JSON.stringify(r));
  if (!r.errorValue || exports.boxValue(r.errorValue) !== 21) throw new Error("throwBox value: " + JSON.stringify(r));
}
