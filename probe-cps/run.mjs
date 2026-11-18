// Runs every probe driver in this directory and summarizes.
import { spawnSync } from "node:child_process";
import { readdirSync } from "node:fs";

const dir = new URL(".", import.meta.url).pathname;
const drivers = readdirSync(dir)
  .filter((f) => f.endsWith(".mjs") && f !== "run.mjs")
  .sort();

const failed = [];
for (const d of drivers) {
  const r = spawnSync(process.execPath, [d], { cwd: dir, encoding: "utf8" });
  process.stdout.write(r.stdout ?? "");
  if (r.stderr) process.stderr.write(r.stderr);
  if (r.status !== 0) failed.push(d);
}
console.log(failed.length === 0 ? "ALL PROBES PASS" : `FAIL: ${failed.join(", ")}`);
process.exit(failed.length === 0 ? 0 : 1);
