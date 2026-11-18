// Driver for probe B1. Three modes, each in a fresh instance:
// mode 0 normal completion, mode 1 throw after await, mode 2 throw
// before any await. In every mode finally must run exactly once, and
// never on suspend.
import { readFileSync } from "node:fs";
import { spawnSync } from "node:child_process";
import loader from "../lib/loader/index.js";

const dir = new URL(".", import.meta.url).pathname;
const name = "b1-try-finally";

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

function runMode(mode, expectedLogs) {
  const logs = [];
  let api;
  const inst = loader.instantiateSync(bytes, {
    env: {
      __async_request() {
        return 0;
      },
      __async_log(ptr) {
        logs.push(api.__getString(ptr));
      },
    },
  });
  api = inst.exports;
  api.setMode(mode);
  const first = api.start();
  if (mode === 2) {
    if (first !== 1) {
      console.log(`FAIL ${name} mode ${mode}: sync throw path must finish without suspending, got ${first}`);
      process.exit(1);
    }
  } else {
    if (first !== 0) {
      console.log(`FAIL ${name} mode ${mode}: start() must suspend, got ${first}`);
      process.exit(1);
    }
    if (logs.includes("finally")) {
      console.log(`FAIL ${name} mode ${mode}: finally ran on suspend, logs: ${logs.join(",")}`);
      process.exit(1);
    }
    const second = api.resumeTask(api.__newString("v"));
    if (second !== 1) {
      console.log(`FAIL ${name} mode ${mode}: resume must finish, got ${second}`);
      process.exit(1);
    }
  }
  if (logs.join(",") !== expectedLogs) {
    console.log(`FAIL ${name} mode ${mode}: expected ${expectedLogs}, got ${logs.join(",")}`);
    process.exit(1);
  }
}

runMode(0, "enter,after-await,finally");
runMode(1, "enter,after-await,catch,finally");
runMode(2, "enter,catch,finally");
console.log(`PASS ${name}`);
