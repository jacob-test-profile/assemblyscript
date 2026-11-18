// Driver for probe A. Compiles a-statemachine.ts with the stock asc,
// drives the state machine through suspend/resume, and asserts the
// concatenated result and the issue order.
import { readFileSync } from "node:fs";
import { spawnSync } from "node:child_process";
import loader from "../lib/loader/index.js";

const dir = new URL(".", import.meta.url).pathname;
const name = "a-statemachine";

const compiled = spawnSync(
  process.execPath,
  ["../bin/asc.js", `${name}.ts`, "-o", `${name}.wasm`, "--exportRuntime", "--debug"],
  { cwd: dir, encoding: "utf8" }
);
if (compiled.status !== 0) {
  console.log(compiled.stdout);
  console.log(compiled.stderr);
  console.log(`FAIL ${name}: asc failed`);
  process.exit(1);
}

const requests = [];
const logs = [];
let api;
const inst = loader.instantiateSync(readFileSync(dir + `${name}.wasm`), {
  env: {
    __async_request(ptr) {
      requests.push(api.__getString(ptr));
      return 0;
    },
    __async_log(ptr) {
      logs.push(api.__getString(ptr));
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
check(requests.join(",") === "chunk0", `first request must be chunk0, got ${requests}`);
check(api.resumeTask(api.__newString("AAA")) === 0, "second step must suspend");
check(api.resumeTask(api.__newString("BBB")) === 0, "third step must suspend");
check(api.resumeTask(api.__newString("CCC")) === 1, "fourth step must finish");
check(api.__getString(api.getResult()) === "AAABBBCCC", "result must be AAABBBCCC");
check(requests.join(",") === "chunk0,chunk1,chunk2", `issue order, got ${requests}`);
check(logs.join(",") === "issue chunk0,issue chunk1,issue chunk2", `log order, got ${logs}`);
console.log(`PASS ${name}`);
