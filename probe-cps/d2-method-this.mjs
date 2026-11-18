// Driver for probe D2: method + `this` across suspension (lifted shape).
import { readFileSync } from "node:fs";
import { spawnSync } from "node:child_process";
import loader from "../lib/loader/index.js";

const dir = new URL(".", import.meta.url).pathname;
const name = "d2-method-this";

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

let api;
const inst = loader.instantiateSync(readFileSync(dir + `${name}.wasm`), {
  env: {
    __async_request() {
      return 0;
    },
  },
});
api = inst.exports;

function check(cond, msg) {
  if (!cond) {
    console.log(`FAIL ${name}: ${msg}`);
    process.exit(1);
  }
}

check(api.start() === 0, "start() must suspend");
check(api.resumeTask(api.__newString("abcd")) === 1, "resume must finish");
check(api.getCount() === 104, `count must be 104 (4 from onData + 100), got ${api.getCount()}`);
console.log(`PASS ${name}`);
