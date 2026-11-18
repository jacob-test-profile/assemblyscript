// Driver for probe E (rewritten): externref in module globals across
// suspension, two slots, identity checked by the host.
import { readFileSync } from "node:fs";
import { spawnSync } from "node:child_process";
import loader from "../lib/loader/index.js";

const dir = new URL(".", import.meta.url).pathname;
const name = "e-externref";

const compiled = spawnSync(
  process.execPath,
  [
    "../bin/asc.js",
    `${name}.ts`,
    "-o",
    `${name}.wasm`,
    "--exportRuntime",
    "--debug",
    "--enable",
    "reference-types",
  ],
  { cwd: dir, encoding: "utf8" }
);
if (compiled.status !== 0) {
  console.log(compiled.stdout, compiled.stderr);
  console.log(`FAIL ${name}: asc failed`);
  process.exit(1);
}

const originalA = { marker: "externref-A" };
const originalB = { marker: "externref-B" };
let api;
const inst = loader.instantiateSync(readFileSync(dir + `${name}.wasm`), {
  env: {
    __async_request() {
      return 0;
    },
    makeRefA() {
      return originalA;
    },
    makeRefB() {
      return originalB;
    },
    checkRef(value, which) {
      if (which === 0) return value === originalA ? 1 : 0;
      return value === originalB ? 1 : 0;
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
check(api.resumeTask(api.__newString("v")) === 1, "resume must finish");
check(api.getOkA() === 1, "externref slot A must keep identity across suspension");
check(api.getOkB() === 1, "externref slot B must keep identity across suspension");
console.log(`PASS ${name}`);
