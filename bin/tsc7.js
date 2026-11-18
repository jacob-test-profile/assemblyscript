#!/usr/bin/env node

// `tsc` resolves to the TS 6 root package; tsc7 reaches the native 7.1.0-beta compiler.
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";
import path from "node:path";

const tsc = path.join(path.dirname(fileURLToPath(import.meta.url)), "..", "node_modules", "typescript-7", "bin", "tsc");
const { status, signal } = spawnSync(process.execPath, [tsc, ...process.argv.slice(2)], { stdio: "inherit" });
if (status || signal) process.exitCode = 1;
