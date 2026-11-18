import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const eslintDir = path.join(root, "node_modules", "typescript-eslint");
const compatDir = path.join(root, "node_modules", "@typescript", "typescript6");
const linkPath = path.join(eslintDir, "node_modules", "typescript");

if (!fs.existsSync(eslintDir)) process.exit(0);
if (!fs.existsSync(compatDir)) {
  console.error("install-eslint-typescript: @typescript/typescript6 is missing; run npm install first.");
  process.exit(1);
}

const compatVersion = JSON.parse(fs.readFileSync(path.join(compatDir, "package.json"), "utf8")).version;
const target = path.relative(path.dirname(linkPath), compatDir);
const existing = fs.existsSync(linkPath) ? fs.readlinkSync(linkPath) : null;
if (existing === target) {
  console.log(`install-eslint-typescript: typescript-eslint already uses typescript ${compatVersion}.`);
  process.exit(0);
}
if (existing !== null || fs.existsSync(linkPath)) fs.rmSync(linkPath, { recursive: true, force: true });
fs.mkdirSync(path.dirname(linkPath), { recursive: true });
fs.symlinkSync(target, linkPath, "junction");
console.log(`install-eslint-typescript: typescript-eslint now uses typescript ${compatVersion}.`);
