// Driver for probe B0. PASS means the constraint is pinned: native
// `try` does not compile in asc at all ("Not implemented: Exceptions"),
// so CPS cannot lean on the compiler for try/catch — it must desugar.
import { spawnSync } from "node:child_process";

const dir = new URL(".", import.meta.url).pathname;
const name = "b0-naive-finally";

const compiled = spawnSync(
  process.execPath,
  ["../bin/asc.js", `${name}.ts`, "-o", `${name}.wasm`, "--exportRuntime", "--debug"],
  { cwd: dir, encoding: "utf8" }
);
const output = (compiled.stdout ?? "") + (compiled.stderr ?? "");
if (compiled.status === 0 || !output.includes("Not implemented: Exceptions")) {
  console.log(output);
  console.log(`FAIL ${name}: expected asc to fail with 'Not implemented: Exceptions'`);
  process.exit(1);
}
console.log(`PASS ${name} (native try is unimplemented — CPS must desugar try/catch/finally)`);
