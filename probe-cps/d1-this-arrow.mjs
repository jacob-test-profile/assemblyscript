// Driver for probe D1. PASS means the constraint is pinned: an arrow
// capturing `this` fails with TS2339 in stock asc.
import { spawnSync } from "node:child_process";

const dir = new URL(".", import.meta.url).pathname;
const name = "d1-this-arrow";

const compiled = spawnSync(
  process.execPath,
  ["../bin/asc.js", `${name}.ts`, "-o", `${name}.wasm`, "--exportRuntime", "--debug"],
  { cwd: dir, encoding: "utf8" }
);
const output = (compiled.stdout ?? "") + (compiled.stderr ?? "");
if (compiled.status === 0 || !output.includes("Property 'count' does not exist")) {
  console.log(output);
  console.log(`FAIL ${name}: expected asc to fail with TS2339 on this.count in an arrow`);
  process.exit(1);
}
console.log(`PASS ${name} (arrow capturing this fails — CPS must lift arrows/methods itself)`);
