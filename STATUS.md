# CPS Phase 0 — status

Track: `track/cps-phase0` (worktree `~/workspace/assemblyscript-cps-phase0`), off `async` @ `1f5b3143` (both earlier tracks merged).
Base: fork `jacob-test-profile/assemblyscript`, origin is Jacob's fork only. No PRs, no contact with anyone.

## Decisions in force (Jacob, 2026-11-17)
- CPS-FIRST (reverses the Asyncify-first recommendation). Do not build on Asyncify.
- Derisk first; do everything in v1: await in try/switch/closures, async methods/arrows, full external typeset, Promise.all first with race/allSettled/any on the same join primitive.
- Coordinator lives in generated JS.
- Externref across await is a first-class suspended value via proper spilling (table/global slots — externref cannot live in linear memory), NOT a permanent exclusion. Loud error only as a temporary guard if the spill is not ready; Phase 1 design must prove the spill or say exactly why not.

## Cross-track notes (not mine to implement)
- `//@ external("env", "someFunc")` (space after @, REQUIRED) is the current external-declaration form; a parallel worker is updating Change 1 to it on `track/external-space`. The `async` base merged here still has the old `//@external` form (commit 0ab91f09). Phase 0 tests therefore use the `@external` decorator form for now; swap fixture spelling to `//@ external(...)` once that lands in `async`.
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
