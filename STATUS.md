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
- Q9a DONE + verified, committed `3e5b38e5`, pushed to track/nodenext-module.
  Diagnostic TS1145 ("'{0}' is not allowed when 'erasableSyntaxOnly' is
  enabled."); parser rejects enums, namespaces, parameter properties when
  module == nodenext and the source is not under ~lib/ (stdlib uses all
  three). Fixtures erasable-enum/namespace/param-prop (stderr TS1145),
  erasable-allowed-commonjs (compiles under the default module).
- Q9b DONE + verified, committed `924bff6c`, pushed to track/nodenext-module.
  `import type` (leading + inline specifiers) parsed into an `isType` flag
  on ImportStatement/ImportDeclaration, gated on nodenext; commonjs keeps
  today's misparse (TS1005). File.typeOnlyImports records type-only
  bindings at import init (immediate + queued paths); the resolver rejects
  value uses with TS1147 ("'{0}' cannot be used as a value because it is a
  type-only import." — reworded in Q9c from "imported using 'import type'",
  which is wrong for transitive bindings). Value-use paths: identifiers
  (lookupIdentifierExpression) and `new` (lookupNewExpression — `new Foo()`
  resolves its callee as a type name, not an identifier, so it needed its
  own check; `x as Foo` / `instanceof` / `changetype<Foo>` are type
  positions and are NOT checked). Fixtures: import-type-ok/star/inline
  (compile; .wat has zero mentions of the type-only class),
  import-type-value (`new`), import-type-value-call, import-type-commonjs.
  `new`-plus-`instanceof` probe: `instanceof` was checked and left alone
  (type position, ReportMode.Swallow).
- Q9c DONE + verified, committed `a43f6f33`, pushed to track/nodenext-module.
  `export type` (leading
  `export type {…}` / `export type *` + inline `export { type Foo }`),
  gated on nodenext; commonjs keeps TS2304 "Cannot find name 'type'."
  AST `isType` on ExportStatement/ExportMember. Program: File.typeExports
  + typeExportsStar maps, ensureTypeExport/ensureTypeExportStar (also
  propagate to alias namespaces so `ns.Foo` resolves as a type),
  lookupExport checks both maps, File.getMember traverses typeExportsStar,
  QueuedExport/QueuedExportStar carry isType. Kind validation via
  isTypeExportable (ClassPrototype/Class/InterfacePrototype/Interface/Enum/
  Namespace/TypeDefinition); values => TS1148 ("'{0}' is a value and cannot
  be exported as a type.") at both the immediate and queued export paths
  (incl. the `export { memory }` global fallback).
  Transitive type-only: a value import from a type re-export is itself
  type-only — new lookupForeignIsType mirrors lookupForeign (incl. queued
  exports) and is consulted at import init + in the queued-import loop.
  Two bugs found by the fixtures and fixed: (1) lookupForeign never
  followed typeExportsStar, so a type-star re-export could not be imported
  at all; (2) lookupExportIsType recursed into a type-star target and asked
  *that* file (which said the name is a value export), losing the
  "came through a type star" fact — now returns true when found through a
  type star. Fixtures (11): export-type-from/local/inline/star (compile;
  .wat exports only the function + memory, no Foo runtime export),
  export-type-value (foreign value) + export-type-value-local (queued local
  value) => TS1148, export-type-consumer-ok/value (transitive through
  `export type {…}` => type use compiles, `new` => TS1147),
  export-type-star-consumer-ok/value (transitive through `export type *`),
  export-type-commonjs (TS2304).
- Known gaps (not fixed, recorded): value use of a type-only name through a
  namespace alias (`new plain.Foo()` where `plain` is a value namespace
  import) is not caught — the check keys on the imported binding name,
  not on members; `export type *` re-exports value members too (consumer
  can only use them as types, consistent with TS); `export type` of a
  namespace member / `export type` inside a namespace is untested.

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
- Final acceptance (this run): build green; test:compiler --parallel
  SUCCESS (rc 0, 112.8s, 68 expected-error FAILURE lines, no mismatches);
  test:parser SUCCESS (rc 0); npm run check green (rc 0).
- Report back to the main agent (main agent merges into async).
