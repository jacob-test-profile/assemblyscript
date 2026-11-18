# CPS Phase 0 — status

Track: `track/cps-phase0` (worktree `~/workspace/assemblyscript-cps-phase0`), off `async` @ `1f5b3143` (both earlier tracks merged).
Base: fork `jacob-test-profile/assemblyscript`, origin is Jacob's fork only. No PRs, no contact with anyone.

## Decisions in force (Jacob, 2026-11-17)
- CPS-FIRST (reverses the Asyncify-first recommendation). Do not build on Asyncify.
- Derisk first; do everything in v1: await in try/switch/closures, async methods/arrows, full external typeset, Promise.all first with race/allSettled/any on the same join primitive.
- Coordinator lives in generated JS.
- Externref across await is a first-class suspended value via proper spilling (table/global slots — externref cannot live in linear memory), NOT a permanent exclusion. Loud error only as a temporary guard if the spill is not ready; Phase 1 design must prove the spill or say exactly why not.

## Phase 0 (frontend) — DONE 2026-11-18 (commits a9f6806c + tests pending)

- Base for Phase 0 is `async` @ 39f98d0d (Change 1 space form c44a3642 +
  Change 2 TS 7 migration b0a3657c merged). Rebased twice; probes re-verified
  after each rebase (`ALL PROBES PASS`).
- `CommonFlags.Async` reuses the dead `Quoted` bit (1<<30). `NodeKind.Await`
  appended after `Comment`; `AwaitExpression extends UnaryExpression`.
- Diagnostics: 1145 async must return `Promise<T>`; 1147 async in ambient
  context; 1148 await only in async fn; 1149 await operand must be a
  `Promise`; 1150 async on accessor/constructor; 1151 async on a property.
  (1144 was taken by the Change 1 space-form update.)
- Parser: top-level `async function`, methods (`abstract async` order; a
  member named `async` still works), function-expression and parenthesized /
  single-param async arrows, `await` at UnaryPrefix precedence. Async
  context tracked with save/restore around every body parse. Tokenizer
  subtlety that bit once: in `parseExpressionStart` the current token IS
  `async`, so the lookahead must `peek()`, not `next()` then `peek()`;
  `readIdentifier()` must run before `peek()` (pos sits at an identifier's
  start until it is read).
- Resolver: async fns must return `Promise<T>` (1145); `await` unwraps
  `Promise<T>` to `T`, flattening nested promises (public
  `unwrapPromiseType`, name-based on `Promise`).
- Compiler: async fns rejected loudly (AS100 guard in `compileFunction`)
  so a valid async fn never compiles as sync; `await` resolves first
  (swallowing diagnostics) so an operand error stays specific. Exporting
  an async fn also emits the AS235 warning (the fn never becomes Compiled,
  so the exporter warns) — expected Phase 0 fallout, pinned in fixtures.
- Stdlib: field-less `Promise<T>` with `all`/`race` stubs
  (`std/assembly/promise.ts`, auto-globbed into the build) + `index.d.ts`.
- Deviations from the pre-Phase-0 plan, both deliberate:
  - 1149 is IMPLEMENTED but NOT reachable through the CLI in Phase 0:
    the parser rejects await outside async fns (1148, parse aborts) and
    the compiler guard rejects async fns before their bodies resolve, so
    no fixture can pin 1149. The resolver code stands for Phase 1's
    transform to call when it processes await operands.
  - No `compileReturnStatement` unwrap: it is unreachable behind the
    `compileFunction` guard in Phase 0, so it would be dead code. Phase 1's
    transform owns the rewritten body's return semantics and decides then.
- Tests: 4 parser fixtures (async-function, async-arrow, async-method,
  await-expression incl. 2x 1148) + 7 compiler fixtures (1145, 1148, 1147,
  1150, 1151, AS100 guard, passing `Promise.all`/`Promise.race` with
  generated .wat + glue for the `env.getNumber` import).
- Checks: build green, check (tsc + eslint) green, test:parser SUCCESS,
  test:compiler --parallel SUCCESS (257 run, 7 pre-existing feature-gated
  skips, 157s), transform/cli/asconfig/browser all exit 0.

## Cross-track notes (not mine to implement)
- `//@ external("env", "someFunc")` (space after @, REQUIRED) LANDED in
  `async` as c44a3642 (track/external-space 93700a4a): no-space
  `//@external` is now an ordinary comment, misplaced directives are
  loud (new diagnostic AS1144). Phase 0 tests use `//@ external(...)`.
- Change 2 TS 7 migration merged into `async` as b0a3657c (HEAD 39f98d0d).
  Track rebased onto 39f98d0d (derisk 4e732d8d, Phase 0 impl a9f6806c).
- `std/assembly-async.json` (decision 7) does not exist on this base yet — Change 2 follow-up, not this track.
- `//@ external("env", "someFunc")` (space after @, REQUIRED) LANDED in
  `async` as c44a3642 (track/external-space 93700a4a): no-space
  `//@external` is now an ordinary comment, misplaced directives are
  loud (new diagnostic AS1144). Phase 0 tests use `//@ external(...)`.
  (Rebased track/cps-phase0 onto c44a3642; derisk commit is now c0027248.)
- Change 2 TS 7 migration merged into `async` as b0a3657c (HEAD 39f98d0d).
  Rebase pending: track/cps-phase0 must move onto 39f98d0d before fixtures.
- `std/assembly-async.json` (decision 7) does not exist on this base yet — Change 2 follow-up, not this track.

## Plan
1. Verify base builds + relevant tests pass (parser, compiler).
2. DERISK PROBES (timeboxed): minimal CPS/state-machine prototype; probe suspension across try/catch/finally, closures capturing locals, async methods/arrows + `this`, externref spill, GC-rooting of suspended locals, issue/join fan-out for Promise.all under CPS.
3. PHASE 0 FRONTEND only: parser (async/await, AwaitExpression, CommonFlags.Async), resolver (Promise<T> typing, await unwrap, async fns must return Promise<T>), stdlib Promise<T> stub + Promise.all declared, diagnostics, parser + compiler fixtures. No Phase 1 implementation.

## Done
- [x] Worktree created on `track/cps-phase0` @ 1f5b3143; base clean.
- [x] Base build + tests verified: `npm run build` green; `test:parser` SUCCESS; `test:compiler --parallel` SUCCESS (exit 0, ~289s).
- [x] Derisk probes + verdict (all 9 probes pass, `probe-cps/run.mjs`).
- [ ] Phase 0 implementation + tests green.

## Derisk verdict: CPS is feasible — with three hard constraints that shape Phase 1

Probes live in `probe-cps/` (hand-written state machines + Node drivers
against the stock asc; `node probe-cps/run.mjs` runs all 9). Per unknown:

- **State-machine shape (A): PASS.** A loop with an await inside, lowered
  by hand to a state machine with locals as fields, suspends/resumes
  through a sentinel-returning import and produces `AAABBBCCC` in order.
- **Try/catch/finally (B0/B1): FEASIBLE ONLY VIA AST DESUGAR.**
  Native `try` does not compile at all: `compileTryStatement`
  (`src/compiler.ts:3042`) errors `AS100 Not implemented: Exceptions`
  unconditionally — no feature flag gates it. The naive shape (real
  try/finally around the dispatch) is therefore not even available, and
  would be wrong anyway (a suspend-return would trigger finally). The
  desugared shape works and is proven: no `try` keyword; a `throw`
  becomes "set the error slot, jump to the handler state"; the catch is
  a handler state; finally is an explicit guarded `runFinally()` at the
  real exits only. All three paths verified (normal, throw-after-await,
  throw-before-await): finally runs exactly once, never on suspend.
  Consequence: the Phase 1 transform must desugar try/catch/finally
  itself. Limitation to carry into Phase 1: desugar catches throws
  lexically inside the async fn; wasm traps and throws from sync
  callees cannot be caught this way (no wasm EH in asc).
- **Closures (C): FEASIBLE ONLY VIA ENV-LIFTING.** asc has no closures
  at all: any capture of an outer local is `AS100 Not implemented:
  Closures` (`src/compiler.ts:5713,7567`, `!local.declaredByFlow(flow)`),
  pinned by the expected-error fixture `tests/compiler/closure.ts`
  (its .json expects 5× AS100). The env-lifted shape works: captured
  variables as fields of an explicit Env object, "closures" as ordinary
  methods on it — shared mutable storage verified (counter 1 then 2
  across a suspension). Consequence: the transform must lift every
  captured variable; it cannot lean on the compiler for closures.
- **Async methods/arrows + `this` (D1/D2): FEASIBLE ONLY VIA LIFTING.**
  An arrow inside a method that touches `this` fails in stock asc:
  `this` resolves to the enclosing method element (`W#test`), not the
  instance (TS2339, minimal repro pinned by probe D1). The lifted
  shape works: the callback is an ordinary method on the state object
  and `this` is the state object itself (count 104 = 4 + 100 verified).
  Consequence: async arrows/methods are state-machine methods, not
  closures, in the transform.
- **Externref spill (E): PROVEN VIA MODULE GLOBALS, with a concurrency
  caveat.** A managed class CANNOT hold an externref field (resolver:
  "Reference typed fields", `src/resolver.ts:3447`), and asc exposes
  no table.get/set API (`std/assembly/table.ts` is stubs; Binaryen has
  the ops but asc does not surface them). Module globals DO hold
  externrefs: two distinct JS objects stored in two globals across a
  suspension kept identity (===) on read-back. Consequence: the spill
  is proven mechanically, but globals are module-wide, not per-task —
  concurrent tasks carrying externrefs would clobber each other's
  slots. Phase 1 must either serialize externref-carrying tasks, pool
  a bounded set of global slots, or add table support (new compiler
  work) for per-task indices. This is the one Phase 1 design item the
  probes do NOT close.
- **GC-rooting of suspended locals (F): PASS, with a rule.** A state
  object rooted in a module global survives `__collect` with fields
  intact. A bare JS-held pointer is NOT a root: with the global
  dropped, resume trapped (memory access out of bounds) after churn
  + `__collect`. Consequence: the coordinator must keep a wasm-side
  root (global) or `__pin` the state object; it must never hold only
  a raw pointer.
- **Issue/join fan-out (G): PASS.** All members issued before one
  suspending join; out-of-order delivery returns results in argument
  order; first-rejection-wins fail-fast; late results dropped without
  crashing. The async-as §4b/§14.4 protocol transfers to CPS unchanged
  (the join is just another state transition).
- **Correction to the research report:** `CommonFlags` bit 30 is NOT
  free as stated — `Quoted = 1<<30` occupies it. It is, however,
  defined-but-unused (zero references to `CommonFlags.Quoted` in
  src/cli/std/tests), so Phase 0 repurposes it as `Async` by renaming
  the dead member. Verified before use.

## Phase 0 plan (frontend only, no Phase 1 codegen)
Parser (async/await syntax, AwaitExpression node, CommonFlags.Async),
resolver (Promise<T> typing, await unwraps Promise<T> to T, async fns
must return Promise<T>), stdlib Promise<T> stub + Promise.all declared
(race/allSettled/any designed on the same join primitive — see below),
diagnostics, parser + compiler fixtures. Compiler guard: untransformed
async fns / await error loudly until Phase 1 replaces them with state
machines.

### Join-primitive design (all four combinators, Promise.all first)
One primitive: issue N non-suspending imports (reqIds), then one
suspending join keyed by a completion policy. Policies: `all` (all
settle, in order, first rejection wins fail-fast), `race` (first
settles wins), `allSettled` (all settle, never rejects, per-member
status), `any` (first fulfillment wins, else AggregateError-style
rejection). Each combinator is a new `Promise` static + a policy flag
on the same join, not a new mechanism. Phase 0 declares `all` (+ `race`
if the stub stays small) and documents the rest; Phase 1 implements
`all` first, then the other policies in sequence.
