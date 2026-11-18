// Driver for probe F: GC-rooting of suspended locals.
// F1: state object rooted in a module global — must survive __collect.
// F2: root dropped, only a raw JS-held pointer remains — outcome is
// recorded, not asserted; it shows why the coordinator must pin or keep
// a wasm-side root.
import { readFileSync } from "node:fs";
import { spawnSync } from "node:child_process";
import loader from "../lib/loader/index.js";

const dir = new URL(".", import.meta.url).pathname;
const name = "f-gcroot";

const compiled = spawnSync(
  process.execPath,
  ["../bin/asc.js", `${name}.ts`, "-o", `${name}.wasm`, "--exportRuntime", "--debug"],
  { cwd: dir, encoding: "utf8" }
);
if (compiled.status !== 0) {
  console.log(compiled.stdout, compiled.stderr);
  console.log(`FAIL ${name}: asc failed`);
  process.exit(1);
}

const bytes = readFileSync(dir + `${name}.wasm`);

function fresh() {
  let api;
  const inst = loader.instantiateSync(bytes, {
    env: {
      __async_request() {
        return 0;
      },
    },
  });
  return inst.exports;
}

function check(cond, msg) {
  if (!cond) {
    console.log(`FAIL ${name}: ${msg}`);
    process.exit(1);
  }
}

// F1: rooted in the module global.
{
  const api = fresh();
  check(api.start() === 0, "F1 start() must suspend");
  api.__collect();
  check(api.resumeTask(api.__newString("c")) === 1, "F1 resume must finish");
  check(
    api.__getString(api.getDataJoined()) === "a,b,c",
    `F1 data must be a,b,c, got ${api.__getString(api.getDataJoined())}`
  );
  console.log("F1 PASS (global-rooted state survives __collect)");
}

// F2: root dropped; only a raw pointer survives in JS.
{
  const api = fresh();
  check(api.start() === 0, "F2 start() must suspend");
  const ptr = api.getTaskPtr();
  check(ptr !== 0, "F2 must get a non-zero task pointer");
  api.dropGlobal();
  api.churn();
  api.__collect();
  api.churn();
  api.__collect();
  let outcome;
  try {
    const rc = api.resumeByPtr(ptr, api.__newString("c"));
    outcome = rc === 1 ? api.__getString(api.getDataJoined()) : `resume returned ${rc}`;
  } catch (e) {
    outcome = `trapped: ${e.message}`;
  }
  console.log(`F2 outcome (unrooted, JS-held pointer): ${outcome}`);
  if (outcome === "a,b,c") {
    console.log("F2 NOTE: unrooted object happened to survive — hazard not demonstrated, pin/root by design anyway");
  } else {
    console.log("F2 NOTE: unrooted object did not survive — confirms a bare JS-held pointer is not a root");
  }
}
console.log(`PASS ${name}`);
