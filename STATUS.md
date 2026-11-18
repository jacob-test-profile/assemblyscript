# close-gaps track — coordinator notes (UNTRACKED, do not commit)

Base: track/close-gaps @ 9ce00b81 (async: Phase 1 + async-methods merged, all green).
Jacob's decision: close the remaining gaps NOW. Nothing stays loud by choice;
infeasible gaps must be reported with evidence + what it would take.

## Wave 1 (parallel, each on its own sub-branch + worktree, off track/close-gaps)
- g1   track/close-gaps-g1   ~/workspace/assemblyscript-close-gaps-g1   compound assignment, field-assignment await, mechanical await positions
- g2a  track/close-gaps-g2a  ...-g2a  await in switch/finally, try in switch, for-of, labeled break/continue
- g2b  track/close-gaps-g2b  ...-g2b  default/optional/rest params, non-string throws, throw await, stored-promise non-import bindings, void await
- g3a  track/close-gaps-g3a  ...-g3a  super, async arrow capturing outer local, nested closure capture, arrow-as-value verdict
- g3b  track/close-gaps-g3b  ...-g3b  generic async fns, generic-class methods, generic suspending imports
- g3c  track/close-gaps-g3c  ...-g3c  namespaces (top-level entry alias) — functions only
- g3d  track/close-gaps-g3d  ...-g3d  cross-file await, join-member/join-argument await
- g5a  track/close-gaps-g5a  ...-g5a  token mint --exportRuntime re-examination, trap slot reclaim
- g5b  track/close-gaps-g5b  ...-g5b  array/class await values, per-iteration loop-closure slots, EH-limit verification (no EH build)
- g4a  track/close-gaps-g4a  ...-g4a  static async methods, non-exported-class methods (decision), dispose shadowing

## Wave 2 (after g3b + g3c merge)
- g4b: methods on generic/namespaced classes (builds on g3b/g3c entry naming).

## NOT gaps (do not fix)
- race([]) suspends forever (correct JS semantics).
- Wasm traps/throws from sync callees uncatchable without EH (g5b verifies + reports).
- Private async methods drivable through the wrapper (acceptable).

## Merge log
- g3c (namespaces, functions): merged 33e02c20 into track/close-gaps, pushed. Integrated verification: build + check + parser green, probes 9/9, coordinator 59/59, compiler suite --parallel SUCCESS (372.5s under load).
- g4a (static methods, non-exported decision, dispose loud): merged a2d79d78 into track/close-gaps, pushed. Merge had 3 conflicted files (coordinator, meta, transform); resolved by union (methodClassOf + namespacePath in qualNameOf/lookupParent/loop, conditional toBound for non-statics, g4a's namespace-fail else-if dropped as superseded by g3c, emitFunctionEntry + dispose checks both kept). Resolution needed TWO fixes, both in follow-up commit 1a79aaba (pushed): (1) my hunk-2 resolution left a duplicated closing brace (git had aligned the two blocks' closers as one shared line) — esbuild failed until removed; lesson: never pipe verification through `tail` — it masks exit codes (that is also how the next bug slipped through). (2) TS7022 in g3c's `lookupNamespaceFunction` (`let next` circular inference) — PRE-EXISTING on the g3c branch (verified: same error at line 1614 there); the g3c worker's "check exit 0" was wrong, same pipe-masking trap. Fixed with an explicit `Element | null` annotation. Integrated verification at 1a79aaba: build exit 0, check exit 0, parser exit 0, probes 9/9, coordinator 66/66 (52 + 7 g3c + 7 g4a), compiler suite --parallel SUCCESS (235.8s).

## Interruptions / re-dispatches
- g5b worker (d30403f5) ERRORED 2026-11-18 ~21:42 UTC: service restart drain mid-run, while polling a test suite. Branch had no commits; worktree held uncommitted Item-1 work (506 insertions, 5 files + values.ts fixture). Replacement worker dispatched with resume brief: verify state, finish Item 1 first, then Items 2+3. No work lost.
- g1 worker (0406339d) INTERRUPTED ~21:42 UTC: had pushed c1fd1870 (compound + field/element assignment await); worktree held uncommitted asyncTryDesugar.ts change. Resumed in place via subagent.resume; no replacement needed.
- g1 resume FAILED (second interruption, same restart wave): agent still shows interrupted, no new commits. Replacement worker dispatched with NARROWED scope (item 3 only, minus `throw await` which belongs to g2b): await in conditions / call args / binary operands + verify the 957 diagnostic is unreachable. Inherited uncommitted asyncTryDesugar.ts change left for the replacement to assess (looks like throw-await scaffolding — g2b's area).
