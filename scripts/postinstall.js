import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");

function linkIfStale(linkPath, target) {
  let existing = null;
  try {
    existing = fs.readlinkSync(linkPath);
  } catch {
    if (fs.existsSync(linkPath)) return false;
  }
  if (existing === target) return false;
  if (existing !== null || fs.existsSync(linkPath)) fs.rmSync(linkPath, { recursive: true, force: true });
  fs.mkdirSync(path.dirname(linkPath), { recursive: true });
  fs.symlinkSync(target, linkPath, "junction");
  return true;
}

// node_modules/.bin/tsc must point at the native compiler. The TS 6 compat
// package depends on typescript@6 (installed as @typescript/old), which also
// declares a `tsc` bin, and npm links .bin/tsc to it instead of to the root
// typescript@7.1.0-beta. (TS 7 ships no tsserver, so .bin/tsserver is left
// pointing at the TS 6 copy, the only one available.)
const binTsc = path.join(root, "node_modules", ".bin", "tsc");
if (linkIfStale(binTsc, path.join("..", "typescript", "bin", "tsc"))) {
  console.log("postinstall: node_modules/.bin/tsc now points at typescript 7.1.0-beta.");
}

// typescript-eslint 8.65 peers typescript <6.1.0 and refuses TS 7, so it runs
// on the official @typescript/typescript6 compat package instead. npm cannot
// nest a second typescript under typescript-eslint while the root depends on
// typescript directly, so link the compat package in by hand.
const eslintDir = path.join(root, "node_modules", "typescript-eslint");
const compatDir = path.join(root, "node_modules", "@typescript", "typescript6");
const linkPath = path.join(eslintDir, "node_modules", "typescript");

if (fs.existsSync(eslintDir)) {
  if (!fs.existsSync(compatDir)) {
    console.error("postinstall: @typescript/typescript6 is missing; run npm install first.");
    process.exit(1);
  }
  const compatVersion = JSON.parse(fs.readFileSync(path.join(compatDir, "package.json"), "utf8")).version;
  const target = path.relative(path.dirname(linkPath), compatDir);
  if (linkIfStale(linkPath, target)) {
    console.log(`postinstall: typescript-eslint now uses typescript ${compatVersion}.`);
  }
}
