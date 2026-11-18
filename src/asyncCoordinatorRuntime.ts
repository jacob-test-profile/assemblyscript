/**
 * @fileoverview JS source of the CPS async coordinator driver loop.
 *
 * Plain JavaScript text (not TypeScript): the coordinator generator
 * appends it after the join engine in the generated `<base>.async.js`
 * file, together with per-module metadata, so a compiled module ships a
 * working driver with no manual wiring and no runtime dependency. Keep
 * this file free of backticks and `${` sequences: it lives inside a
 * template literal.
 * @license Apache-2.0
 */

/** JS source of the driver loop, without the metadata line. */
export const ASYNC_COORDINATOR_RUNTIME = `const STRING_ID = 2;
const SIZE_OFFSET = -4;
// Must match CPS_SEGMENT_BASE in src/asyncTransform.ts: a task observed
// with status >= this value was executing a segment when it trapped;
// a suspended task reads site + 1 (1..sites).
const CPS_SEGMENT_BASE = 1024;

function asyncGetString(buffer, ptr) {
  if (!ptr) return null;
  const len = new Uint32Array(buffer)[ptr + SIZE_OFFSET >>> 2] >>> 1;
  const view = new Uint16Array(buffer, ptr, len);
  let str = '';
  let off = 0;
  while (len - off > 1024) {
    str += String.fromCharCode.apply(String, view.subarray(off, off += 1024));
  }
  return str + String.fromCharCode.apply(String, view.subarray(off));
}

function asyncNewString(memory, alloc, str) {
  if (str == null) return 0;
  const ptr = alloc(str.length << 1, STRING_ID);
  const view = new Uint16Array(memory.buffer);
  for (let i = 0, p = ptr >>> 1; i < str.length; ++i) view[p + i] = str.charCodeAt(i);
  return ptr;
}

// Builds a coordinator for the metadata baked into the generated file.
export function createCoordinator(metadata) {
  metadata = metadata || __ASYNC_METADATA__;
  const innerFunctionsByKey = new Map();
  Object.keys(metadata.inners || {}).forEach(function (key) { innerFunctionsByKey.set(key, metadata.inners[key]); });
  const importsByKey = new Map();
  metadata.imports.forEach(function (imp) { importsByKey.set(imp.module + '\\0' + imp.name, imp); });

  let instance = null;
  let wasmExports = null;
  let memory = null;
  let alloc = null;
  let mint = null;
  let mintString = null;
  let pin = null;
  let unpin = null;
  let activeTask = null;
  const queues = new Map();
  const liveHandles = new Set();
  const api = {};

  // Functions per file, for the trap sweep: a task that traps during
  // entry stays on its function's roots registry, which the sweep reads
  // through the last-handle export.
  const functionsByFile = new Map();
  function noteFunctions(list) {
    if (!list) return;
    list.forEach(function (fn) {
      let filed = functionsByFile.get(fn.fileBase);
      if (!filed) { filed = []; functionsByFile.set(fn.fileBase, filed); }
      filed.push(fn);
    });
  }
  noteFunctions(metadata.functions);
  (metadata.classes || []).forEach(function (cls) { noteFunctions(cls.methods); });
  Object.keys(metadata.inners || {}).forEach(function (key) { noteFunctions([metadata.inners[key]]); });

  // Member tokens: one fresh heap-pointer token per suspending-import
  // call (chunk 5's protocol). The token must be a heap pointer, not a
  // small integer: a member value stored in the user's Array<Promise<T>>
  // is linked by the GC, and a small int is a bogus reference that traps.
  // Only the pointer is the token; the string content is meaningless.
  // A minted pointer can never equal a live token's pointer (a live
  // token's string still occupies its address), but a collected token's
  // address can be reused, so re-mint on a clash with a live key.
  let nextToken = 1;
  const joinMembers = new Map();

  function newString(str) {
    if (alloc) return asyncNewString(memory, alloc, str);
    if (mintString) {
      const ptr = mintString(str.length);
      const view = new Uint16Array(memory.buffer);
      for (let i = 0, p = ptr >>> 1; i < str.length; ++i) view[p + i] = str.charCodeAt(i);
      return ptr;
    }
    throw new Error('async coordinator: this operation needs the wasm runtime (compile with --exportRuntime)');
  }

  function getString(ptr) {
    return asyncGetString(memory.buffer, ptr);
  }

  // Reads an Array<i32> from wasm memory by its pointer (chunk 5's
  // __async_join argument layout: dataStart at ptr + 4, length at ptr + 12).
  function readI32Array(ptr) {
    const U32 = new Uint32Array(memory.buffer);
    const dataStart = U32[ptr + 4 >>> 2];
    const length = U32[ptr + 12 >>> 2];
    return Array.from(new Int32Array(memory.buffer, dataStart, length));
  }

  function tryGetString(ptr) {
    try {
      if (!memory || !ptr) return '<ptr ' + ptr + '>';
      return getString(ptr);
    } catch (e) {
      return '<ptr ' + ptr + '>';
    }
  }

  function lower(value, kind, nullable) {
    if (value == null) {
      if (!nullable) throw new TypeError('async coordinator: null is not a valid ' + kind + ' value');
      return 0;
    }
    switch (kind) {
      case 'string': {
        if (typeof value !== 'string') throw new TypeError('async coordinator: expected a string, got ' + typeof value);
        return newString(value);
      }
      case 'i32': return value | 0;
      case 'u32': return value >>> 0;
      case 'i64': case 'u64': return typeof value === 'bigint' ? value : BigInt(value);
      case 'f32': case 'f64': {
        if (typeof value !== 'number') throw new TypeError('async coordinator: expected a number, got ' + typeof value);
        return value;
      }
      case 'bool': return value ? 1 : 0;
      case 'externref': return value;
      case 'pointer': {
        // A wasm-produced heap pointer (nested array/class result),
        // handed through untouched. Anything else here is a misuse,
        // not a value: fail loudly rather than pass garbage to wasm.
        if (typeof value !== 'number') throw new TypeError('async coordinator: expected a wasm pointer, got ' + typeof value);
        return value;
      }
      case 'void': return undefined;
      default: throw new Error('async coordinator: cannot lower a ' + kind + ' value');
    }
  }

  function lowerArgs(jsArgs, params) {
    return jsArgs.map(function (arg, i) {
      return lower(arg, params[i].kind, params[i].nullable);
    });
  }

  function lift(value, kind, nullable) {
    if (kind === 'string') {
      if (!value) return null;
      return getString(value);
    }
    if (kind === 'bool') return value !== 0;
    return value;
  }

  function statusOf(fn, handle) {
    return wasmExports[fn.statusExport](handle);
  }

  function dropPin(task) {
    if (unpin && task.handle) {
      try { unpin(task.handle); } catch (e) { /* pinning is best-effort; the roots registry is the real root */ }
    }
  }

  function reclaimTask(task) {
    if (!task || !task.handle || !task.fn.reclaimExport) return;
    const reclaim = wasmExports[task.fn.reclaimExport];
    if (typeof reclaim !== 'function') return;
    try { reclaim(task.handle); } catch (e) { /* reclaim is best-effort; the task is already dead */ }
  }

  // Sweeps each file's roots registries for tasks that trapped during
  // entry: status 0 (never stepped) or >= CPS_SEGMENT_BASE (a step was
  // executing a segment when it trapped) means the task never suspended,
  // completed or failed, so it is dead and its slots are leaked. The
  // live set disambiguates status 1024, which a task suspended at the
  // last site of a 1024-site function also reads: a live handle is never
  // reclaimed. Reclaiming splices the task out, so the loop re-reads
  // until the registry top is live or empty; the guard bounds it. This
  // also covers a nested inner entry trapping inside the abandoned
  // task's step, since the inner never registered live.
  function sweepTrapped(fileBase) {
    const list = functionsByFile.get(fileBase);
    if (!list) return;
    for (let i = 0; i < list.length; ++i) {
      const fn = list[i];
      if (!fn.lastHandleExport || !fn.reclaimExport) continue;
      for (let guard = 0; guard < 1024; ++guard) {
        let handle = 0;
        try { handle = wasmExports[fn.lastHandleExport](); } catch (e) { break; }
        if (!handle || liveHandles.has(handle)) break;
        let st = 0;
        try { st = wasmExports[fn.statusExport](handle); } catch (e) { break; }
        if (st !== 0 && st < CPS_SEGMENT_BASE) break;
        try { wasmExports[fn.reclaimExport](handle); } catch (e) { break; }
      }
    }
  }

  function reclaimTrap(task) {
    if (!task) return;
    reclaimTask(task);
    sweepTrapped(task.fn.fileBase);
  }

  function drain(fileBase) {
    const queue = queues.get(fileBase);
    if (!queue || queue.length === 0 || queue.draining) return;
    queue.draining = true;
    try {
      while (queue.length > 0) {
        const head = queue[0];
        if (!attemptEntry(head.fn, head.args, head.resolve, head.reject, false, head.receiver)) return;
        queue.shift();
      }
    } finally {
      queue.draining = false;
    }
  }

  function settleComplete(task) {
    if (task.settled) return;
    task.settled = true;
    liveHandles.delete(task.handle);
    let result;
    try {
      result = lift(wasmExports[task.fn.resultExport](task.handle), task.fn.resultKind, task.fn.resultNullable);
    } catch (e) {
      dropPin(task);
      if (task.parent) { deliverInnerFailure(task, e); return; }
      task.reject(e);
      drain(task.fn.fileBase);
      return;
    }
    dropPin(task);
    if (task.parent) { deliverInnerResult(task, result); return; }
    task.resolve(result);
    drain(task.fn.fileBase);
  }

  function settleFailed(task) {
    if (task.settled) return;
    task.settled = true;
    liveHandles.delete(task.handle);
    let message = 'async task failed';
    try {
      const ptr = wasmExports[task.fn.errorExport](task.handle);
      if (ptr) message = getString(ptr);
    } catch (e) { /* keep the fallback message */ }
    dropPin(task);
    if (task.parent) { deliverInnerFailure(task, new Error(message)); return; }
    task.reject(new Error(message));
    drain(task.fn.fileBase);
  }

  function settleError(task, error) {
    if (!task || task.settled) return;
    task.settled = true;
    liveHandles.delete(task.handle);
    // The task will never be driven again, so release its spill slots
    // here: every abandonment (trap, logic error, missing binding) flows
    // through this function, and the reclaim is a no-op for a task that
    // already reached a terminal state.
    reclaimTrap(task);
    dropPin(task);
    if (task.parent) { deliverInnerFailure(task, error); return; }
    task.reject(error instanceof Error ? error : new Error(String(error)));
    drain(task.fn.fileBase);
  }

  // Delivers a settled inner task's result to the outer task that awaited
  // it: the inner task's failure becomes the outer await's rejection, so
  // the outer's catch can catch it, exactly like a rejected promise.
  function deliverInnerResult(innerTask, result) {
    const parent = innerTask.parent;
    const site = parent.fn.sites[innerTask.parentSite];
    let lowered;
    try {
      lowered = lower(result, site.kind, site.nullable);
    } catch (e) {
      settleError(parent, e);
      drain(innerTask.fn.fileBase);
      return;
    }
    let rc;
    try {
      activeTask = parent;
      try {
        rc = wasmExports[site.resumeExport](parent.handle, lowered);
      } finally {
        activeTask = null;
      }
    } catch (e) {
      settleError(parent, e);
      drain(innerTask.fn.fileBase);
      return;
    }
    afterStep(parent, rc);
    drain(innerTask.fn.fileBase);
  }

  function deliverInnerFailure(innerTask, error) {
    failTask(innerTask.parent, innerTask.parentSite, error);
    drain(innerTask.fn.fileBase);
  }

  function failTask(task, site, error) {
    const message = error instanceof Error ? error.message : String(error);
    let rc;
    try {
      activeTask = task;
      try {
        rc = wasmExports[task.fn.sites[site].rejectExport](task.handle, newString(message));
      } finally {
        activeTask = null;
      }
    } catch (e) {
      settleError(task, error);
      return;
    }
    afterStep(task, rc);
  }

  function afterStep(task, rc) {
    if (rc === 0) { drive(task); return; }
    if (rc === 1) { settleComplete(task); return; }
    settleFailed(task);
  }

  function failJoin(task, site, message) {
    let rc;
    try {
      activeTask = task;
      try {
        rc = wasmExports[site.rejectExport](task.handle, newString(message));
      } finally {
        activeTask = null;
      }
    } catch (e) {
      settleError(task, new Error(message));
      return;
    }
    afterStep(task, rc);
  }

  function finishJoin(task, site) {
    if (task.settled) return;
    let rc;
    try {
      activeTask = task;
      try {
        rc = wasmExports[site.doneExport](task.handle);
      } finally {
        activeTask = null;
      }
    } catch (e) {
      settleError(task, e);
      return;
    }
    afterStep(task, rc);
  }

  function joinMessage(error) {
    return error instanceof Error ? error.message : String(error);
  }

  // Drives one suspended join (chunk 5's protocol): the members were
  // issued before the single suspending __async_join call, which recorded
  // their tokens and the policy on the task. Store/error calls deliver
  // settlements to the wasm side; join_done resumes once the policy is
  // satisfied, reject_<j> fails fast. Late settlements are dropped.
  // A member awaited before the join issues carries the sentinel token 0
  // in the reqs array (real tokens are fresh heap pointers, never 0);
  // its value is already stored wasm-side, so the member resolves here
  // to PRE_RESOLVED and is counted without a store/lower. For race/any
  // a pre-resolved winner is recorded via the join_mark export.
  const PRE_RESOLVED = {};
  function runJoin(task, site) {
    const join = task.pendingJoin;
    task.pendingJoin = null;
    if (!join) {
      settleError(task, new Error('async coordinator: task suspended at a join site with no pending join'));
      return;
    }
    const reqs = join.reqs;
    const policy = join.policy;
    if (reqs.length === 0) {
      if (policy === 1) return; // race([]) suspends forever by design
      if (policy === 3) { failJoin(task, site, 'AggregateError: '); return; }
      finishJoin(task, site); // all([]) / allSettled([]) resolve at once
      return;
    }
    const members = new Array(reqs.length);
    for (let i = 0; i < reqs.length; ++i) {
      if (reqs[i] === 0) {
        members[i] = Promise.resolve(PRE_RESOLVED);
        continue;
      }
      const p = joinMembers.get(reqs[i]);
      if (!p) {
        failJoin(task, site, 'async coordinator: unknown join member ' + reqs[i]);
        return;
      }
      joinMembers.delete(reqs[i]);
      members[i] = p;
    }
    if (policy === 0) {
      let remaining = members.length;
      let settled = false;
      members.forEach(function (p, i) {
        p.then(function (v) {
          if (settled) return;
          if (v === PRE_RESOLVED) {
            if (--remaining === 0) { settled = true; finishJoin(task, site); }
            return;
          }
          let lowered;
          try {
            lowered = lower(v, site.kind, site.nullable);
          } catch (e) {
            settled = true;
            failJoin(task, site, joinMessage(e));
            return;
          }
          try {
            wasmExports[site.storeExport](task.handle, i, lowered);
          } catch (e) {
            settled = true;
            settleError(task, e);
            return;
          }
          if (--remaining === 0) { settled = true; finishJoin(task, site); }
        }, function (e) {
          if (settled) return;
          settled = true;
          failJoin(task, site, joinMessage(e));
        });
      });
      return;
    }
    if (policy === 1) {
      let settled = false;
      members.forEach(function (p, i) {
        p.then(function (v) {
          if (settled) return;
          settled = true;
          if (v === PRE_RESOLVED) {
            try {
              wasmExports[site.markExport](task.handle, i);
            } catch (e) {
              settleError(task, e);
              return;
            }
            finishJoin(task, site);
            return;
          }
          let lowered;
          try {
            lowered = lower(v, site.kind, site.nullable);
          } catch (e) {
            failJoin(task, site, joinMessage(e));
            return;
          }
          try {
            wasmExports[site.storeExport](task.handle, i, lowered);
          } catch (e) {
            settleError(task, e);
            return;
          }
          finishJoin(task, site);
        }, function (e) {
          if (settled) return;
          settled = true;
          failJoin(task, site, joinMessage(e));
        });
      });
      return;
    }
    if (policy === 2) {
      let remaining = members.length;
      members.forEach(function (p, i) {
        p.then(function (v) {
          if (v === PRE_RESOLVED) {
            if (--remaining === 0) finishJoin(task, site);
            return;
          }
          let lowered;
          try {
            lowered = lower(v, site.kind, site.nullable);
          } catch (e) {
            try { wasmExports[site.errorExport](task.handle, i, newString(joinMessage(e))); } catch (e2) { /* keep counting */ }
            if (--remaining === 0) finishJoin(task, site);
            return;
          }
          try {
            wasmExports[site.storeExport](task.handle, i, lowered);
          } catch (e) {
            settleError(task, e);
            return;
          }
          if (--remaining === 0) finishJoin(task, site);
        }, function (e) {
          try { wasmExports[site.errorExport](task.handle, i, newString(joinMessage(e))); } catch (e2) { /* keep counting */ }
          if (--remaining === 0) finishJoin(task, site);
        });
      });
      return;
    }
    if (policy === 3) {
      let remaining = members.length;
      let settled = false;
      const errors = new Array(members.length);
      members.forEach(function (p, i) {
        p.then(function (v) {
          if (settled) return;
          settled = true;
          if (v === PRE_RESOLVED) {
            try {
              wasmExports[site.markExport](task.handle, i);
            } catch (e) {
              settleError(task, e);
              return;
            }
            finishJoin(task, site);
            return;
          }
          let lowered;
          try {
            lowered = lower(v, site.kind, site.nullable);
          } catch (e) {
            failJoin(task, site, joinMessage(e));
            return;
          }
          try {
            wasmExports[site.storeExport](task.handle, i, lowered);
          } catch (e) {
            settleError(task, e);
            return;
          }
          finishJoin(task, site);
        }, function (e) {
          if (settled) return;
          const message = joinMessage(e);
          errors[i] = message;
          try { wasmExports[site.errorExport](task.handle, i, newString(message)); } catch (e2) { /* keep counting */ }
          if (--remaining === 0) {
            settled = true;
            failJoin(task, site, 'AggregateError: ' + errors.join('; '));
          }
        });
      });
      return;
    }
    failJoin(task, site, 'async coordinator: unknown join policy ' + policy);
  }

  // Drives a nested await: the outer task suspended after starting the
  // inner task, whose handle the pending export exposes. The inner
  // task's first step already ran during the outer step, so whatever it
  // issued (a pending promise, a pending join, a token) was recorded on
  // the outer task and is transferred here; settlement delivers the
  // inner result (or failure) to the outer resume/reject export.
  function driveNested(task, site, siteMeta, pending, pendingToken, pendingJoin) {
    let innerHandle = 0;
    try {
      innerHandle = wasmExports[siteMeta.pendingExport](task.handle);
    } catch (e) {
      settleError(task, e);
      return;
    }
    if (!innerHandle) {
      settleError(task, new Error("async coordinator: nested async call could not start"));
      return;
    }
    const innerMeta = innerFunctionsByKey.get(task.fn.fileBase + "\0" + siteMeta.innerExportName);
    if (!innerMeta) {
      settleError(task, new Error("async coordinator: nested async function '" + siteMeta.innerExportName.split('#').pop() + "' cannot be driven"));
      return;
    }
    const innerTask = {
      fn: innerMeta, handle: innerHandle,
      pending: pending, pendingToken: pendingToken, pendingJoin: pendingJoin, pendingWaitMissing: 0,
      parent: task, parentSite: site,
      settled: false, resolve: null, reject: null
    };
    if (pin) {
      try { pin(innerHandle); } catch (e) { /* best-effort */ }
    }
    liveHandles.add(innerHandle);
    drive(innerTask);
  }

  function drive(task) {
    let st;
    try {
      st = statusOf(task.fn, task.handle);
    } catch (e) {
      settleError(task, e);
      return;
    }
    if (st === -1) { settleComplete(task); return; }
    if (st === -2) { settleFailed(task); return; }
    if (st <= 0) {
      settleError(task, new Error('async coordinator: unexpected status ' + st));
      return;
    }
    const site = st - 1;
    const siteMeta = task.fn.sites[site];
    if (!siteMeta) {
      settleError(task, new Error('async coordinator: unknown await site ' + site));
      return;
    }
    const pending = task.pending;
    const pendingToken = task.pendingToken;
    const pendingWaitMissing = task.pendingWaitMissing;
    task.pending = null;
    task.pendingToken = null;
    task.pendingWaitMissing = null;
    if (siteMeta.nested) {
      const pendingJoin = task.pendingJoin;
      task.pendingJoin = null;
      if (pendingWaitMissing) {
        failTask(task, site, new Error("async coordinator: await of a stored promise with an unknown or already-consumed token " + pendingWaitMissing));
        return;
      }
      driveNested(task, site, siteMeta, pending, pendingToken, pendingJoin);
      return;
    }
    if (pendingWaitMissing) {
      settleError(task, new Error("async coordinator: await of a stored promise with an unknown or already-consumed token " + pendingWaitMissing));
      return;
    }
    if (siteMeta.join) {
      runJoin(task, siteMeta);
      return;
    }
    if (pendingToken) joinMembers.delete(pendingToken);
    if (!pending) {
      settleError(task, new Error('async coordinator: task suspended with no pending operation'));
      return;
    }
    pending.then(function (value) {
      if (task.settled) return;
      let lowered;
      try {
        lowered = lower(value, siteMeta.kind, siteMeta.nullable);
      } catch (e) {
        failTask(task, site, e);
        return;
      }
      let rc;
      try {
        activeTask = task;
        try {
          rc = wasmExports[siteMeta.resumeExport](task.handle, lowered);
        } finally {
          activeTask = null;
        }
      } catch (e) {
        settleError(task, e);
        return;
      }
      afterStep(task, rc);
    }, function (error) {
      if (task.settled) return;
      failTask(task, site, error);
    });
  }

  // A method task starts through its generated entry export, which takes
  // the receiver pointer as its first argument ahead of the declared
  // params; a plain function starts through its export with no receiver.
  // A zero handle means the externref spill pool is exhausted: the call
  // queues behind the running tasks for its file and starts when one
  // settles, with the receiver carried along.
  function attemptEntry(fn, jsArgs, resolve, reject, queueOnExhausted, receiver) {
    let wasmArgs;
    try {
      wasmArgs = lowerArgs(jsArgs, fn.params);
      if (receiver != null) wasmArgs.unshift(receiver);
    } catch (e) {
      reject(e instanceof Error ? e : new Error(String(e)));
      return true;
    }
    const task = { fn: fn, handle: 0, pending: null, pendingToken: 0, pendingJoin: null, pendingWaitMissing: 0, parent: null, parentSite: -1, settled: false, resolve: resolve, reject: reject };
    let handle = 0;
    try {
      activeTask = task;
      try {
        handle = wasmExports[fn.entryExport || fn.exportName].apply(null, wasmArgs);
      } finally {
        activeTask = null;
      }
    } catch (e) {
      settleError(task, e);
      return true;
    }
    if (handle === 0) {
      if (queueOnExhausted) {
        let queue = queues.get(fn.fileBase);
        if (!queue) { queue = []; queues.set(fn.fileBase, queue); }
        queue.push({ fn: fn, args: jsArgs, resolve: resolve, reject: reject, receiver: receiver });
      }
      return false;
    }
    task.handle = handle;
    if (pin) {
      try { pin(handle); } catch (e) { /* best-effort */ }
    }
    liveHandles.add(handle);
    let st;
    try {
      st = statusOf(fn, handle);
    } catch (e) {
      settleError(task, e);
      return true;
    }
    if (st === -1) { settleComplete(task); return true; }
    if (st === -2) { settleFailed(task); return true; }
    if (st <= 0) {
      settleError(task, new Error('async coordinator: unexpected status ' + st + ' after entry'));
      return true;
    }
    drive(task);
    return true;
  }

  function callAsync(fn, jsArgs, receiver) {
    return new Promise(function (resolve, reject) {
      attemptEntry(fn, jsArgs, resolve, reject, true, receiver);
    });
  }

  function wrapImports(bindings) {
    const imports = {};
    Object.keys(bindings || {}).forEach(function (mod) {
      imports[mod] = Object.assign({}, bindings[mod]);
    });
    const env = imports.env || (imports.env = {});
    if (!env.memory) env.memory = new WebAssembly.Memory({ initial: 10 });
    memory = env.memory;
    if (!env.abort) {
      env.abort = function (msg, file, line, colm) {
        throw new Error('abort: ' + tryGetString(msg) + ' at ' + tryGetString(file) + ':' + line + ':' + colm);
      };
    }
    if (!env.seed) env.seed = function () { return Date.now(); };
    importsByKey.forEach(function (imp) {
      const mod = imports[imp.module] || (imports[imp.module] = {});
      if (imp.joinImport) {
        mod[imp.name] = function (reqsPtr, policy) {
          const task = activeTask;
          if (task) task.pendingJoin = { reqs: readI32Array(reqsPtr), policy: policy };
          return 0;
        };
        return;
      }
      if (imp.waitImport) {
        mod[imp.name] = function (token) {
          const task = activeTask;
          if (task) {
            const promise = joinMembers.get(token);
            if (promise) {
              joinMembers.delete(token);
              task.pending = promise;
            } else {
              task.pendingWaitMissing = token;
            }
            task.pendingToken = 0;
          }
          return 0;
        };
        return;
      }
      if (imp.unsupported) {
        mod[imp.name] = function () {
          const task = activeTask;
          const result = Promise.reject(new Error(imp.unsupported));
          if (task) task.pending = result;
          return 0;
        };
        return;
      }
      const userFn = mod[imp.name];
      if (typeof userFn !== 'function') {
        throw new Error('async coordinator: missing binding for suspending import ' + imp.module + '.' + imp.name);
      }
      mod[imp.name] = function () {
        const task = activeTask;
        const args = new Array(arguments.length);
        for (let i = 0; i < arguments.length; ++i) {
          args[i] = lift(arguments[i], imp.params[i].kind, imp.params[i].nullable);
        }
        let result;
        try {
          result = userFn.apply(null, args);
        } catch (e) {
          result = Promise.reject(e);
        }
        if (task) {
          let token;
          if (mint) {
            token = mint();
            while (joinMembers.has(token)) token = mint();
          } else {
            token = newString("token" + nextToken++);
            while (joinMembers.has(token)) token = newString("token" + nextToken++);
          }
          const promise = Promise.resolve(result);
          joinMembers.set(token, promise);
          task.pending = promise;
          task.pendingToken = token;
          return token;
        }
        return 0;
      };
    });
    return imports;
  }

  // Builds one JS wrapper class for a metadata class entry. The
  // constructor allocates the instance through the generated _new export
  // and pins it, so the GC cannot collect it between tasks; each async
  // method drives its task with the stored pointer as the receiver, and
  // each static async method lives on the constructor and drives
  // through its entry with the declared params only.
  // dispose() releases the pin and is idempotent; a disposed wrapper
  // refuses further method calls instead of trapping on a dead pointer.
  // A constructor that traps throws out of new, so no half-constructed
  // wrapper can escape.
  function buildClass(cls) {
    function Wrapper() {
      if (!pin) throw new Error("async coordinator: class '" + cls.name + "' needs the wasm runtime (compile with --exportRuntime)");
      let ptr = 0;
      try {
        ptr = wasmExports[cls.newExport].apply(null, lowerArgs(Array.prototype.slice.call(arguments), cls.newParams));
      } catch (e) {
        throw e instanceof Error ? e : new Error(String(e));
      }
      if (!ptr) throw new Error("async coordinator: constructor for '" + cls.name + "' returned a null pointer");
      this.pointer = ptr;
      try { pin(ptr); } catch (e) { /* pinning is best-effort; the task handle root covers suspension */ }
    }
    cls.methods.forEach(function (method) {
      if (method.isStatic) {
        Wrapper[method.name] = function () {
          return callAsync(method, Array.prototype.slice.call(arguments));
        };
      } else {
        Wrapper.prototype[method.name] = function () {
          if (!this.pointer) throw new Error("async coordinator: '" + cls.name + "' instance has been disposed");
          return callAsync(method, Array.prototype.slice.call(arguments), this.pointer);
        };
      }
    });
    Wrapper.prototype.dispose = function () {
      if (!this.pointer) return;
      const ptr = this.pointer;
      this.pointer = 0;
      if (unpin) {
        try { unpin(ptr); } catch (e) { /* pinning is best-effort */ }
      }
    };
    return Wrapper;
  }

  function attach(instanceArg) {
    instance = instanceArg;
    wasmExports = instance.exports;
    memory = wasmExports.memory || memory;
    alloc = wasmExports.__new || null;
    mint = (metadata.mintExport && wasmExports[metadata.mintExport]) || null;
    mintString = (metadata.mintStringExport && wasmExports[metadata.mintStringExport]) || null;
    pin = wasmExports.__pin || null;
    unpin = wasmExports.__unpin || null;
    api.instance = instance;
    api.exports = wasmExports;
    // A top-level function lands at api[exportName]; a namespaced one
    // lands at api.NS.take, in nested objects mirroring its namespace
    // path, and is driven through its entry export.
    metadata.functions.forEach(function (fn) {
      let target = api;
      (fn.path || []).forEach(function (segment) {
        if (!target[segment]) target[segment] = {};
        target = target[segment];
      });
      target[fn.name || fn.exportName] = function () {
        return callAsync(fn, Array.prototype.slice.call(arguments));
      };
    });
    (metadata.classes || []).forEach(function (cls) {
      api[cls.name] = buildClass(cls);
    });
    return api;
  }

  return {
    wrapImports: wrapImports,
    attach: attach,
    api: api
  };
}

// Instantiates a module with the coordinator driving its async functions.
// source: WebAssembly.Module, BufferSource, or Response. bindings: the
// imports object; suspending imports are plain async JS functions.
export async function instantiateAsync(source, bindings) {
  const coordinator = createCoordinator(__ASYNC_METADATA__);
  const imports = coordinator.wrapImports(bindings);
  const instance = await WebAssembly.instantiate(source, imports);
  return coordinator.attach(instance.instance);
}
`;
