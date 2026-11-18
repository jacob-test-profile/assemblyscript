const orderLog = [];
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
  orderLog.length = 0;
  imports.env.getChunk = function(i) {
    orderLog.push(["chunk", i]);
    return 0; // suspended; the driver delivers via the resume export
  };
  imports.env.getNum = function(i) {
    orderLog.push(["num", i]);
    return 0; // suspended; the driver delivers via the resume export
  };
  imports.env.getFlag = function(i) {
    orderLog.push(["flag", i]);
    return 0; // suspended; the driver delivers via the resume export
  };
  imports.env.__async_wait = function(token) {
    return 0; // suspended; the driver delivers via the resume export
  };
}

// Drives one task to completion, delivering the next logged import call's
// value at each suspension: the chunk string for getChunk, the argument
// for getNum, and `i < 2` for getFlag. `cursor` tracks the log across
// tasks in call order.
let cursor = 0;

function driveTask(instance, qual, handle) {
  const exports = instance.exports;
  const base = `__async_async_await_position_${qual}`;
  const status = exports[base + "_status"];
  const result = exports[base + "_result"];
  const error = exports[base + "_error"];
  let guard = 0;
  while (true) {
    if (++guard > 20) throw new Error(`task ${qual}: loop guard`);
    const st = status(handle);
    if (st == -1) return result(handle);
    if (st == -2) throw new Error(`task ${qual} failed: ` + getString(error(handle)));
    if (st <= 0) throw new Error(`task ${qual}: unexpected status ` + st);
    const site = st - 1;
    const entry = orderLog[cursor++];
    if (!entry) throw new Error(`task ${qual}: no logged import for site ` + site);
    const value = entry[0] == "chunk" ? exports.chunkString(entry[1]) : entry[0] == "flag" ? entry[1] < 2 : entry[1];
    const resume = exports[base + `_resume_${site}`];
    const rc = resume(handle, value);
    if (rc != 0 && rc != 1) throw new Error(`task ${qual}: unexpected step return ` + rc);
  }
}

function expectLog(expected, label) {
  const got = orderLog.map((e) => e.join(":")).join(",");
  const want = expected.map((e) => e.join(":")).join(",");
  if (got !== want) throw new Error(`${label}: wrong issue order: ${got} (want ${want})`);
}

export async function postInstantiate(instance) {
  const exports = instance.exports;
  memory = exports.memory;
  cursor = 0;

  let out = driveTask(instance, "compoundStr", exports.compoundStr());
  if (getString(out) !== "AAABBB") throw new Error("compoundStr must be AAABBB");

  out = driveTask(instance, "compoundNum", exports.compoundNum());
  if (out !== 4) throw new Error("compoundNum must be 4, got " + out);

  out = driveTask(instance, "mixedCompound", exports.mixedCompound());
  if (out !== 10.5) throw new Error("mixedCompound must be 10.5, got " + out);

  out = driveTask(instance, "fieldAssign", exports.fieldAssign());
  if (getString(out) !== "CCC5") throw new Error("fieldAssign must be CCC5");

  out = driveTask(instance, "fieldCompound", exports.fieldCompound());
  if (getString(out) !== "xAAA5") throw new Error("fieldCompound must be xAAA5");

  out = driveTask(instance, "recvCall", exports.recvCall());
  if (getString(out) !== "AAA") throw new Error("recvCall must be AAA");

  out = driveTask(instance, "elemAssign", exports.elemAssign());
  if (getString(out) !== "AAABBB1") throw new Error("elemAssign must be AAABBB1");

  out = driveTask(instance, "indexOrder", exports.indexOrder());
  if (out !== 1) throw new Error("indexOrder must be 1");

  out = driveTask(instance, "elemCompound", exports.elemCompound());
  if (out !== 105) throw new Error("elemCompound must be 105");

  out = driveTask(instance, "storedField", exports.storedField());
  if (getString(out) !== "DDD") throw new Error("storedField must be DDD");

  out = driveTask(instance, "W_setField", exports.startSetField());
  if (getString(out) !== "BBB1") throw new Error("setField must be BBB1");

  out = driveTask(instance, "ifCond", exports.ifCond());
  if (getString(out) !== "YES") throw new Error("ifCond must be YES");

  out = driveTask(instance, "whileCond", exports.whileCond());
  if (getString(out) !== "AAABBB") throw new Error("whileCond must be AAABBB");

  out = driveTask(instance, "forCond", exports.forCond());
  if (getString(out) !== "AAABBB") throw new Error("forCond must be AAABBB");

  out = driveTask(instance, "doCond", exports.doCond());
  if (getString(out) !== "AAABBB") throw new Error("doCond must be AAABBB");

  out = driveTask(instance, "forIncr", exports.forIncr());
  if (getString(out) !== "AAABBB") throw new Error("forIncr must be AAABBB");

  out = driveTask(instance, "callArgs", exports.callArgs());
  if (getString(out) !== "AAABBB") throw new Error("callArgs must be AAABBB");

  out = driveTask(instance, "binaryOp", exports.binaryOp());
  if (out !== 6) throw new Error("binaryOp must be 6, got " + out);

  out = driveTask(instance, "binaryStr", exports.binaryStr());
  if (getString(out) !== "AAABBB") throw new Error("binaryStr must be AAABBB");

  out = driveTask(instance, "varInitCall", exports.varInitCall());
  if (getString(out) !== "AAA!") throw new Error("varInitCall must be AAA!");

  out = driveTask(instance, "varInitBinary", exports.varInitBinary());
  if (out !== 3) throw new Error("varInitBinary must be 3, got " + out);

  out = driveTask(instance, "returnAssign", exports.returnAssign());
  if (getString(out) !== "AAABBB") throw new Error("returnAssign must be AAABBB");

  out = driveTask(instance, "compoundRhs", exports.compoundRhs());
  if (out !== 13) throw new Error("compoundRhs must be 13, got " + out);

  out = driveTask(instance, "assignRhsField", exports.assignRhsField());
  if (getString(out) !== "AAA!") throw new Error("assignRhsField must be AAA!");

  out = driveTask(instance, "ternaryCond", exports.ternaryCond());
  if (getString(out) !== "YES") throw new Error("ternaryCond must be YES");

  out = driveTask(instance, "andLeft", exports.andLeft());
  if (getString(out) !== "YES") throw new Error("andLeft must be YES");

  out = driveTask(instance, "storedArg", exports.storedArg());
  if (getString(out) !== "AAA!") throw new Error("storedArg must be AAA!");

  out = driveTask(instance, "ifCondInTry", exports.ifCondInTry());
  if (getString(out) !== "YES") throw new Error("ifCondInTry must be YES");

  out = driveTask(instance, "W_checkFlag", exports.startCheckFlag());
  if (getString(out) !== "YES") throw new Error("checkFlag must be YES");

  out = driveTask(instance, "unaryOp", exports.unaryOp());
  if (out !== -1) throw new Error("unaryOp must be -1, got " + out);

  out = driveTask(instance, "arrayLit", exports.arrayLit());
  if (out !== 3) throw new Error("arrayLit must be 3, got " + out);

  out = driveTask(instance, "templateLit", exports.templateLit());
  if (getString(out) !== "AAA!") throw new Error("templateLit must be AAA!");

  expectLog([
    ["chunk", 0], ["chunk", 1],
    ["num", 1], ["num", 2], ["num", 3], ["num", 2], ["num", 3],
    ["num", 1], ["num", 7], ["num", 8], ["num", 3], ["num", 1],
    ["num", 2], ["num", 3],
    ["chunk", 2], ["num", 5],
    ["chunk", 0], ["num", 4],
    ["chunk", 0],
    ["chunk", 0], ["chunk", 1],
    ["chunk", 1],
    ["num", 5],
    ["chunk", 3],
    ["chunk", 1], ["num", 1],
    ["flag", 0],
    ["flag", 0], ["chunk", 0], ["flag", 1], ["chunk", 1], ["flag", 2],
    ["flag", 0], ["chunk", 0], ["flag", 1], ["chunk", 1], ["flag", 2],
    ["chunk", 0], ["flag", 1], ["chunk", 1], ["flag", 2],
    ["chunk", 0], ["num", 1], ["chunk", 1], ["num", 1],
    ["chunk", 0], ["chunk", 1],
    ["num", 2], ["num", 3],
    ["chunk", 0], ["chunk", 1],
    ["chunk", 0],
    ["num", 2],
    ["chunk", 0], ["chunk", 1],
    ["num", 2],
    ["chunk", 0],
    ["flag", 0],
    ["flag", 0],
    ["chunk", 0],
    ["flag", 0],
    ["flag", 0],
    ["num", 1],
    ["num", 1], ["num", 2],
    ["chunk", 0]
  ], "await-position");
}
