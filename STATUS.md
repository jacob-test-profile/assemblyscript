# Change 2 — module-driven — STATUS

Branch: `track/nodenext-module` (base `async` @ `1f5b3143`, both earlier tracks
merged). Worktree: `~/workspace/assemblyscript-nodenext-module`.
Origin is Jacob's fork only. No PRs/issues/comments to upstream, ever.
Do NOT push to main or to async. Do NOT merge into async — main agent merges.

## Task (Jacob's answers to Q7 + Q9)
- Q7: extension requirement DETECTED FROM MODULE TYPE, not a standalone flag
  default. Module nodenext => relative imports require extensions (reuse TS6055
  + `--requireImportExtensions` machinery from 2ca3b308; decide flag's fate).
  Default module type changes commonjs -> nodenext on the new path.
  Create a NEW config file (Jacob wrote "stc/assembly-async.json" — see finding
  below); do NOT change `std/assembly.json`; do NOT change `src/tsconfig.json`.
- Q9: `erasableSyntaxOnly` + `verbatimModuleSyntax` come from the RESOLVED
  tsconfig, ENABLED WHEN MODULE IS nodenext. Gated enforcement:
  erasableSyntaxOnly rejects enums, namespaces, parameter properties;
  verbatimModuleSyntax implements `import type` / `export type` (parser + AST
  + program; type-only imports explicit and elided). Both gated on nodenext;
  commonjs behaviour unchanged.

## Finding: std/assembly.json (checked first, before guessing)
- `std/assembly.json` EXISTS. It is a tsconfig base (extends
  `../tsconfig-base.json`) with `module: commonjs`, `target: esnext`,
  `noLib`, `paths: { "*": ["./assembly/*"] }`.
- It governs **tsc type-checking of AS sources** (editor/language-service
  support), NOT asc's own resolution. It is extended by user-project-style
  tsconfigs: `tests/compiler/tsconfig.json`, `tests/parser/tsconfig.json`,
  `std/assembly/tsconfig.json`, `src/glue/wasm/tsconfig.json`,
  `tests/allocators/*/assembly/tsconfig.json`.
- Conclusion: Jacob's "stc/assembly-async.json" is a typo for
  `std/assembly-async.json` — a new tsconfig base next to `std/assembly.json`
  carrying the nodenext config from the original task, for user projects
  opting into modules + async/promise support.

## Decisions (documented for the final report)
- asc has NO module option and NO tsconfig reading today (grep: zero
  "tsconfig" refs in src/*.ts / cli/index.js; the only "module: commonjs"
  default is in `std/assembly.json` + `std/portable.json`). So "the default
  changes commonjs -> nodenext" is realized on the NEW path by
  `std/assembly-async.json` (module nodenext), and asc gains a `--module`
  option (commonjs | nodenext) whose value derives the enforcement.
  asc's own default stays commonjs: flipping it globally would break ~9
  fixtures with extensionless imports + 7 enum + 10 namespace + 7
  param-property fixtures (counted), i.e. the large migration Jacob was
  warned about. A future global flip = that fixture migration.
- `--requireImportExtensions` stays as an explicit override: effective
  requirement = flag OR module == nodenext. Under nodenext it cannot be
  switched off; the flag only forces it on under commonjs.
- "Resolved tsconfig": asc does not read tsconfig.json; the flags live in
  the resolved tsconfig (`std/assembly-async.json`, for tsc/editors) and asc
  mirrors them via its resolved `module` option. No new tsconfig-reading
  subsystem in this chunk.

## Done
- Worktree created on `track/nodenext-module` off `async` @ 1f5b3143.
- BASE VERIFIED: `npm install` + `npm run build` green; `test:parser` +
  `test:compiler --parallel` both `[ SUCCESS ]` (exit 0, ~263s for compiler).
  The merge itself is sound; building on it.
- Q7 DONE + verified, committed `f851cd3f`, pushed to track/nodenext-module.
  `--module` option (commonjs | nodenext, default commonjs); extension
  requirement = flag OR module == nodenext (TS6055); invalid module is a
  clean FAILURE via prepareResult. New `std/assembly-async.json`
  (module nodenext + full flag set + preserveConstEnums for TS5091),
  verified with tsc --showConfig/--noEmit (also proved tsc enforces
  erasableSyntaxOnly from it: TS1294 on the namespace in export.ts).
  New fixtures module-nodenext-requires-extension (stderr),
  module-commonjs-allows-extensionless (+ export-plain helper, itself a
  fixture per the export.ts pattern). Checks: build, test:compiler
  --parallel (exit 0, 57 expected-error FAILURE lines, no mismatches),
  test:parser, check. Lesson: never pipe a suite through `tail` when
  checking its exit code — the pipe masks failures (caught an export-plain
  fixture mismatch this way; fixed by generating its fixtures).
- Q9 exploration: elision probe PROVED asc already elides imports used only
  as types (Foo used only as a type leaves zero mentions in .wat) — so
  verbatim work is parsing + AST flag + value-use/export checks, not
  codegen elision. Stdlib uses enums, namespaces, parameter properties, so
  erasable enforcement must exempt ~lib/ like checkImportExtension does.

## Q9 plan
- Diagnostics: AVOID AS1144 (taken on async by the `//@ external` space
  update, commit 93700a4a — not in this worktree's base). Planned: 1145
  erasable ("'{0}' is not allowed when 'erasableSyntaxOnly' is enabled."),
  1147 type-only import used as a value, 1148 export-type of a value
  (all three verified free in this tree; 1144 also free here but taken
  upstream — do not use).
- Erasable (parser, gated module==nodenext, ~lib/ exempt): parseEnum,
  parseNamespace, parseParameter (accessFlags != None) error + continue.
- Verbatim (gated module==nodenext): `import type` / `export type` leading
  forms (+ inline `type` specifiers if trivial); AST `isType` on
  ImportStatement/ExportStatement; File.typeOnlyImports map populated at
  import init; resolver lookupIdentifierExpression errors on value use;
  `export type` records type-only exports without runtime export
  (parallel File.typeExports map + lookupExport checks both).
- Tests per construct, self-contained entries (Q7 lesson: helpers that
  import banned constructs break nodenext fixtures — reuse export-plain,
  add type-plain helper).

## Remains
- Q9 implementation + tests (erasable rejections, import/export type).
- `check` + `build` green; test:compiler --parallel + test:parser green;
  commit + push per chunk to track/nodenext-module.
