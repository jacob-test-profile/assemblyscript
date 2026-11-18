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
  const functionsByExport = new Map();
  metadata.functions.forEach(function (fn) { functionsByExport.set(fn.exportName, fn); });
  const importsByKey = new Map();
  metadata.imports.forEach(function (imp) { importsByKey.set(imp.module + '\\0' + imp.name, imp); });

  let instance = null;
  let wasmExports = null;
  let memory = null;
  let alloc = null;
  let pin = null;
  let unpin = null;
  let activeTask = null;
  const queues = new Map();
  const api = {};

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

  function needAlloc() {
    if (!alloc) throw new Error('async coordinator: this operation needs the wasm runtime (compile with --exportRuntime)');
    return alloc;
  }

  function newString(str) {
    return asyncNewString(memory, needAlloc(), str);
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
      case 'void': return undefined;
      default: throw new Error('async coordinator: cannot lower a ' + kind + ' value');
    }
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

  function drain(fileBase) {
    const queue = queues.get(fileBase);
    if (!queue || queue.length === 0 || queue.draining) return;
    queue.draining = true;
    try {
      while (queue.length > 0) {
        const head = queue[0];
        if (!attemptEntry(head.fn, head.args, head.resolve, head.reject, false)) return;
        queue.shift();
      }
    } finally {
      queue.draining = false;
    }
  }

  function settleComplete(task) {
    if (task.settled) return;
    task.settled = true;
    let result;
    try {
      result = lift(wasmExports[task.fn.resultExport](task.handle), task.fn.resultKind, task.fn.resultNullable);
    } catch (e) {
      dropPin(task);
      task.reject(e);
      drain(task.fn.fileBase);
      return;
    }
    dropPin(task);
    task.resolve(result);
    drain(task.fn.fileBase);
  }

  function settleFailed(task) {
    if (task.settled) return;
    task.settled = true;
    let message = 'async task failed';
    try {
      const ptr = wasmExports[task.fn.errorExport](task.handle);
      if (ptr) message = getString(ptr);
    } catch (e) { /* keep the fallback message */ }
    dropPin(task);
    task.reject(new Error(message));
    drain(task.fn.fileBase);
  }

  function settleError(task, error) {
    if (!task || task.settled) return;
    task.settled = true;
    dropPin(task);
    task.reject(error instanceof Error ? error : new Error(String(error)));
    drain(task.fn.fileBase);
  }

  function failTask(task, site, error) {
    const message = error instanceof Error ? error.message : String(error);
    try {
      wasmExports[task.fn.sites[site].rejectExport](task.handle, newString(message));
    } catch (e) {
      settleError(task, error);
      return;
    }
    settleError(task, error);
  }

  function afterStep(task, rc) {
    if (rc === 0) { drive(task); return; }
    if (rc === 1) { settleComplete(task); return; }
    settleFailed(task);
  }

  function failJoin(task, site, message) {
    try {
      wasmExports[site.rejectExport](task.handle, newString(message));
    } catch (e) { /* the task is failed either way */ }
    settleError(task, new Error(message));
  }

  function finishJoin(task, site) {
    if (task.settled) return;
    let rc;
    try {
      rc = wasmExports[site.doneExport](task.handle);
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
    task.pending = null;
    task.pendingToken = null;
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

  function attemptEntry(fn, jsArgs, resolve, reject, queueOnExhausted) {
    let task = null;
    let handle = 0;
    try {
      const wasmArgs = jsArgs.map(function (arg, i) {
        return lower(arg, fn.params[i].kind, fn.params[i].nullable);
      });
      task = { fn: fn, handle: 0, pending: null, pendingToken: 0, pendingJoin: null, settled: false, resolve: resolve, reject: reject };
      activeTask = task;
      try {
        handle = wasmExports[fn.exportName].apply(null, wasmArgs);
      } finally {
        activeTask = null;
      }
    } catch (e) {
      if (task) settleError(task, e);
      else reject(e instanceof Error ? e : new Error(String(e)));
      return true;
    }
    if (handle === 0) {
      if (queueOnExhausted) {
        let queue = queues.get(fn.fileBase);
        if (!queue) { queue = []; queues.set(fn.fileBase, queue); }
        queue.push({ fn: fn, args: jsArgs, resolve: resolve, reject: reject });
      }
      return false;
    }
    task.handle = handle;
    if (pin) {
      try { pin(handle); } catch (e) { /* best-effort */ }
    }
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

  function callAsync(fn, jsArgs) {
    return new Promise(function (resolve, reject) {
      attemptEntry(fn, jsArgs, resolve, reject, true);
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
          let token = newString("token" + nextToken++);
          while (joinMembers.has(token)) token = newString("token" + nextToken++);
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

  function attach(instanceArg) {
    instance = instanceArg;
    wasmExports = instance.exports;
    memory = wasmExports.memory || memory;
    alloc = wasmExports.__new || null;
    pin = wasmExports.__pin || null;
    unpin = wasmExports.__unpin || null;
    api.instance = instance;
    api.exports = wasmExports;
    functionsByExport.forEach(function (fn, exportName) {
      api[exportName] = function () {
        return callAsync(fn, Array.prototype.slice.call(arguments));
      };
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
