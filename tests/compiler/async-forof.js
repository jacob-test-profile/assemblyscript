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
  imports.env.getNum = function(i) {
    return 0; // suspended; the glue delivers via the resume export
  };
}

// Drives one string-returning async call to completion: `values` is the
// queue of chunkString indices delivered to each suspending site.
function drive(exports, base, fn, args, values) {
  const handle = exports[fn](...args);
  const status = exports[base + "_status"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  let next = 0;
  while (true) {
    if (++guard > 20) throw new Error("loop guard");
    const st = status(handle);
    if (st == -1) return { failed: false, value: getString(result(handle)) };
    if (st == -2) return { failed: true, value: getString(error(handle)) };
    if (st <= 0) throw new Error("unexpected status " + st);
    const site = st - 1;
    const resume = exports[base + "_resume_" + site];
    if (!resume) throw new Error("missing resume export for site " + site);
    const rc = resume(handle, exports.chunkString(values[next++]));
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected step return " + rc);
  }
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;

  let r = drive(exports, "__async_async_forof_f", "f", [], [0, 1, 2]);
  if (r.failed || r.value !== "AAABBBCCC") throw new Error("f(): " + JSON.stringify(r));

  // g(): site 0 awaits getNum (i32) each iteration; break on 20.
  {
    const base = "__async_async_forof_g";
    const handle = exports.g();
    const status = exports[base + "_status"];
    const result = exports[base + "_result"];
    let st = status(handle);
    if (st != 1) throw new Error("g(): expected site 0, got status " + st);
    let rc = exports[base + "_resume_0"](handle, 10);
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("g(): unexpected step return " + rc);
    st = status(handle);
    if (st != 1) throw new Error("g(): expected site 0 again, got status " + st);
    rc = exports[base + "_resume_0"](handle, 20);
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("g(): unexpected step return " + rc);
    st = status(handle);
    if (st != -1) throw new Error("g(): expected completion, got status " + st);
    if (result(handle) !== 10) throw new Error("g(): wrong result " + result(handle));
  }

  r = drive(exports, "__async_async_forof_h", "h", [], [0, 1]);
  if (r.failed || r.value !== "AAABBB") throw new Error("h(): " + JSON.stringify(r));
}
