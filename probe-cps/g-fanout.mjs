// Driver for probe G: issue/join fan-out under CPS.
// Scenario 1: results delivered out of order must come back in argument
// order. Scenario 2: a member rejection fails fast and late results are
// dropped without crashing.
import { readFileSync } from "node:fs";
import { spawnSync } from "node:child_process";
import loader from "../lib/loader/index.js";

const dir = new URL(".", import.meta.url).pathname;
const name = "g-fanout";

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
  const issues = [];
  const logs = [];
  let nextReq = 1;
  let api;
  const inst = loader.instantiateSync(bytes, {
    env: {
      __async_issue(ptr) {
        const arg = api.__getString(ptr);
        issues.push(arg);
        return nextReq++;
      },
      __async_join() {
        return 0;
      },
      __async_log(ptr) {
        logs.push(api.__getString(ptr));
      },
    },
  });
  api = inst.exports;
  return { api, issues, logs };
}

function check(cond, msg) {
  if (!cond) {
    console.log(`FAIL ${name}: ${msg}`);
    process.exit(1);
  }
}

// Scenario 1: out-of-order delivery, in-order results.
{
  const { api, issues, logs } = fresh();
  check(api.start() === 0, "S1 start() must suspend on the join");
  check(issues.join(",") === "a,b,c", `S1 all issues must happen before suspend, got ${issues}`);
  check(logs.join(",") === "issued", `S1 issued log, got ${logs}`);
  api.storeResult(3, api.__newString("C"));
  api.storeResult(1, api.__newString("A"));
  api.storeResult(2, api.__newString("B"));
  check(api.reportJoinDone() === 1, "S1 reportJoinDone must finish");
  check(api.__getString(api.getResults()) === "A|B|C", `S1 results in argument order, got ${api.__getString(api.getResults())}`);
  console.log("S1 PASS (out-of-order delivery, in-order results)");
}

// Scenario 2: fail fast on first rejection; late results dropped.
{
  const { api, issues } = fresh();
  check(api.start() === 0, "S2 start() must suspend on the join");
  check(issues.join(",") === "a,b,c", `S2 all issues must happen before suspend, got ${issues}`);
  api.storeError(2, api.__newString("boom-b"));
  check(api.reportJoinDone() === 1, "S2 reportJoinDone must finish (throw path)");
  check(api.__getString(api.getError()) === "boom-b", `S2 error must be boom-b, got ${api.__getString(api.getError())}`);
  api.storeResult(1, api.__newString("A"));
  api.storeResult(3, api.__newString("C"));
  check(api.reportJoinDone() === 1, "S2 late results must not crash the finished task");
  console.log("S2 PASS (fail fast, late results dropped)");
}
console.log(`PASS ${name}`);
