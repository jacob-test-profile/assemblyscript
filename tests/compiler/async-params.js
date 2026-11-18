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
  imports.env.getNumber = function() {
    return 0; // suspended; the glue delivers via the resume export
  };
  imports.env.getString = function() {
    return 0; // suspended; the glue delivers via the resume export
  };
}

// Drives one async fn's raw protocol: calls the export (the varargs
// stub) with `args` after setting __setArgumentsLength, then delivers
// the awaited value through the resume export until the task completes.
function drive(exports, fn, args, deliver) {
  const base = `__async_async_params_${fn}`;
  const setArgs = exports.__setArgumentsLength;
  if (setArgs) setArgs(args.length);
  const handle = exports[fn](...args);
  const status = exports[base + "_status"];
  const resume = exports[base + "_resume_0"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  while (true) {
    if (++guard > 10) throw new Error("loop guard");
    const st = status(handle);
    if (st == -1) return { failed: false, value: result(handle) };
    if (st == -2) return { failed: true, value: getString(error(handle)) };
    if (st <= 0) throw new Error("unexpected status " + st);
    const rc = resume(handle, deliver(exports));
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected step return " + rc);
  }
}

// Drives a driver fn whose single await is a nested call to `inner`
// (an async fn or method in this file): starts the outer task, reads
// the inner handle from the outer's pending export, drives the inner
// task's single site with `deliver`, then resumes the outer with the
// inner's result.
function driveNested(exports, outerFn, innerFn, deliver) {
  const outerBase = `__async_async_params_${outerFn}`;
  const innerBase = `__async_async_params_${innerFn}`;
  const handle = exports[outerFn]();
  const outerStatus = exports[outerBase + "_status"];
  const outerResume = exports[outerBase + "_resume_0"];
  const outerResult = exports[outerBase + "_result"];
  const outerError = exports[outerBase + "_error"];
  const pending = exports[outerBase + "_pending_0"];
  const innerStatus = exports[innerBase + "_status"];
  const innerResume = exports[innerBase + "_resume_0"];
  const innerResult = exports[innerBase + "_result"];
  const innerError = exports[innerBase + "_error"];
  let guard = 0;
  while (true) {
    if (++guard > 10) throw new Error("loop guard");
    const st = outerStatus(handle);
    if (st == -1) return { failed: false, value: outerResult(handle) };
    if (st == -2) return { failed: true, value: getString(outerError(handle)) };
    if (st <= 0) throw new Error("unexpected status " + st);
    const innerHandle = pending(handle);
    let innerGuard = 0;
    while (true) {
      if (++innerGuard > 10) throw new Error("inner loop guard");
      const ist = innerStatus(innerHandle);
      if (ist == -1) break;
      if (ist == -2) throw new Error("inner task failed: " + getString(innerError(innerHandle)));
      if (ist <= 0) throw new Error("unexpected inner status " + ist);
      const irc = innerResume(innerHandle, deliver(exports));
      if (irc != 0 && irc != 1 && irc != 2) throw new Error("unexpected inner step return " + irc);
    }
    const rc = outerResume(handle, innerResult(innerHandle));
    if (rc != 0 && rc != 1 && rc != 2) throw new Error("unexpected step return " + rc);
  }
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;

  let r = drive(exports, "defInt", [], () => 100);
  if (r.failed || r.value !== 105) throw new Error("defInt() must give 105, got " + JSON.stringify(r));
  r = drive(exports, "defInt", [2], () => 100);
  if (r.failed || r.value !== 102) throw new Error("defInt(2) must give 102, got " + JSON.stringify(r));
  r = drive(exports, "defOther", [3], () => 100);
  if (r.failed || r.value !== 104) throw new Error("defOther(3) must give 104, got " + JSON.stringify(r));
  r = drive(exports, "defOther", [3, 10], () => 100);
  if (r.failed || r.value !== 110) throw new Error("defOther(3, 10) must give 110, got " + JSON.stringify(r));
  r = drive(exports, "restNums", [1, exports.nums23()], () => 100);
  if (r.failed || r.value !== 106) throw new Error("restNums(1, [2, 3]) must give 106, got " + JSON.stringify(r));
  r = drive(exports, "restStrings", [exports.abStrings()], (exports) => exports.strS());
  if (r.failed || getString(r.value) !== "a,b|S") throw new Error("restStrings(['a', 'b']) must give 'a,b|S', got " + JSON.stringify(r));
  r = driveNested(exports, "driveRestNums", "restNums", () => 100);
  if (r.failed || r.value !== 106) throw new Error("driveRestNums must give 106, got " + JSON.stringify(r));
  r = driveNested(exports, "driveRestStrings", "restStrings", (exports) => exports.strS());
  if (r.failed || getString(r.value) !== "a,b|S") throw new Error("driveRestStrings must give 'a,b|S', got " + JSON.stringify(r));
  r = driveNested(exports, "driveAdd", "Counter_add", () => 100);
  if (r.failed || r.value !== 111) throw new Error("driveAdd must give 111, got " + JSON.stringify(r));
  r = driveNested(exports, "driveAdd5", "Counter_add", () => 100);
  if (r.failed || r.value !== 115) throw new Error("driveAdd5 must give 115, got " + JSON.stringify(r));
  r = driveNested(exports, "driveGreeter", "Greeter_greet", (exports) => exports.strS());
  if (r.failed || getString(r.value) !== "hi there S") throw new Error("driveGreeter must give 'hi there S', got " + JSON.stringify(r));
  r = driveNested(exports, "driveGreeterNamed", "Greeter_greet", (exports) => exports.strS());
  if (r.failed || getString(r.value) !== "hey bob S") throw new Error("driveGreeterNamed must give 'hey bob S', got " + JSON.stringify(r));
}
