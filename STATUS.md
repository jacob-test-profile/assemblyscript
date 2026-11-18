# STATUS — track/ts7-native (TS 7.1.0-beta native API migration) — DONE

Base: `async` @ 1f5b3143 (both earlier tracks merged). Worktree: ~/workspace/assemblyscript-ts7.
Branch: track/ts7-native. Push target: origin (Jacob's fork) track branch only — never main, never async, never upstream.

## Commits on track/ts7-native
- `c24ee087` Migrate TypeScript usage to the native 7.1.0-beta API (toolchain + build-dts.js rewrite).
- `b36ef101` Fix .bin/tsc pointing at the TS 6 compat copy (postinstall re-links it).

## Done
- Base verified (TS 6.0.3): build green (66s, dts step 61s); check green (tsc 38s + lint); test:parser SUCCESS; test:compiler --parallel SUCCESS (115s). Baseline .d.ts in /tmp/ts7-baseline (assemblyscript 11204 lines, asc 9992 lines, sha256 recorded).
- Probed the real typescript@7.1.0-beta surface (in /tmp/ts7-probe): root export version-only; programmatic API is `typescript/sync` `API` class over the Go worker binary; AST under `typescript/ast`; NO `ts.transform` (hand-rolled visitor proved working, with a proper TypeReferenceNode — the old bare-Identifier trick throws in native); `parseConfigFile`/`createProgram`/`getDeclarationEmit`/`printer.printFile` all proved; file order identical to TS6 on the real src project; Diagnostics shape changed to `{fileName, pos, end, startPosition, endPosition, text, code, category}`.
- Toolchain (split, sanctioned by the TS 7.0 announcement blog's side-by-side section): package.json `typescript` 6.0.3 → `7.1.0-beta` (exact pin); `.npmrc` `legacy-peer-deps=true` (typescript-eslint 8.73.0 latest STILL peers TS <6.1.0 and refuses TS 7 at import time, typescript-eslint#10940; npm `overrides` alias AND plain both fail ERESOLVE); `@typescript/typescript6@6.0.2` root devDep (official compat package, ships `tsc6`); `scripts/postinstall.js` symlinks it to `node_modules/typescript-eslint/node_modules/typescript` (eslint runs on TS 6, everything else on native 7.1).
- build-dts.js rewritten against the native API. One real bug found and fixed: `visitEachChild` clones ancestors of replaced nodes without carrying the text range over (clones are local objects with pos/end -1, and the printer recovers leading comments from source positions), so the transform restores pos/end (+jsDoc) on clones or the printer drops leading JSDoc. Proved in /tmp/ts7-probe/probe-jsdoc2.mjs.
- Generated .d.ts output is CONTENT-IDENTICAL to the TS 6 baseline after normalizing quotes (diff 0 lines on both files; line counts identical 11204/9992; AS-type replacement counts identical). The only remaining diff is quote style: native printer emits single quotes, TS6 double quotes. Accepted as-is (documented, no post-processing — a regex re-quote risks corrupting string/comment content). Generated files are gitignored; no tracked file changes.
- `.bin/tsc` trap found and fixed: @typescript/typescript6 depends on typescript@6 (installed as `@typescript/old`), which also declares a `tsc` bin; npm links .bin/tsc to it, so bare `tsc` ran TS 6.0.3. `scripts/postinstall.js` re-links .bin/tsc at the native compiler after every install. Reproduced by fresh `npm ci` before the fix, verified fixed by fresh `npm ci` after it (.bin/tsc → ../typescript/bin/tsc, 7.1.0-beta; nested eslint typescript 6.0.2; .bin/tsc6 → 6.0.3). TS 7 ships no tsserver, so .bin/tsserver is left pointing at the TS 6 copy.
- Verification (all green, native tsc where it matters):
  - `npm run build`: green, total ~8s (dts step 61s → ~4s).
  - `npm run check`: green in 22s; check:config under native tsc 0.704s (vs 38.45s TS6) with zero errors; check:import clean; lint clean (TS6 via symlink).
  - `test:parser`: SUCCESS.
  - `test:compiler --parallel`: SUCCESS, 123.8s, 1228 steps green, 0 failures, 7 pre-existing feature-gated skips.
  - `test:transform`, `test:cli`, `test:asconfig`: all green.
- src/tsconfig.json module setting: NOT changed (Jacob). The only change to how asc's own sources are typechecked is that check:config/check:import now run the native tsc binary via the swapped dep.

## Open questions (for Jacob / main agent)
- Accept the single-quote style in generated .d.ts (done here) vs post-process to double quotes? Generated files are gitignored, so this is cosmetic.
- typescript-eslint stays on TS 6 via the compat package until it supports TS 7 (tracked in typescript-eslint#10940) — lint rules therefore see TS 6 semantics.
- /tmp on this VM is a 512MB tmpfs and filled up during the work (two npm ci scratch dirs); freed to 418MB available. Future scratch clones should go under ~/workspace, not /tmp.

## Do NOT merge into async — main agent merges.
