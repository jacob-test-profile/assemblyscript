(module
 (type $0 (func (param i32 i32) (result i32)))
 (type $1 (func (param i32) (result i32)))
 (type $2 (func (result i32)))
 (type $3 (func (param i32 i32)))
 (type $4 (func (param i32)))
 (type $5 (func))
 (type $6 (func (param i32 i32 i32 i32)))
 (type $7 (func (param i32 i32 i32)))
 (type $8 (func (param i32 i32 i64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "log" (func $async-method-try/log (param i32)))
 (import "env" "getNumber" (func $async-method-try/getNumber (result i32)))
 (global $~lib/rt/itcms/total (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/threshold (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/state (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/visitCount (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/pinSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/iter (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/toSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/white (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/fromSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $async-method-try/__async_roots_Worker_guarded (mut i32) (i32.const 0))
 (global $async-method-try/__async_roots_Worker_guardedFinally (mut i32) (i32.const 0))
 (global $async-method-try/__async_roots_Worker_guardedNested (mut i32) (i32.const 0))
 (global $async-method-try/__async_roots_Worker_helper (mut i32) (i32.const 0))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 34804))
 (memory $0 1)
 (data $0 (i32.const 1036) "<")
 (data $0.1 (i32.const 1048) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $1 (i32.const 1100) "<")
 (data $1.1 (i32.const 1112) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s")
 (data $4 (i32.const 1228) "<")
 (data $4.1 (i32.const 1240) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $5 (i32.const 1292) ",")
 (data $5.1 (i32.const 1304) "\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
 (data $7 (i32.const 1372) "<")
 (data $7.1 (i32.const 1384) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data $8 (i32.const 1436) "\1c")
 (data $8.1 (i32.const 1448) "\02")
 (data $9 (i32.const 1468) ",")
 (data $9.1 (i32.const 1480) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $10 (i32.const 1516) ",")
 (data $10.1 (i32.const 1528) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $11 (i32.const 1564) ",")
 (data $11.1 (i32.const 1576) "\02\00\00\00\0e\00\00\00f\00i\00n\00a\00l\00l\00y")
 (data $12 (i32.const 1612) "\1c")
 (data $12.1 (i32.const 1624) "\02\00\00\00\0c\00\00\00c\00a\00t\00c\00h\00:")
 (data $13 (i32.const 1644) ",")
 (data $13.1 (i32.const 1656) "\02\00\00\00\14\00\00\00c\00o\00o\00r\00d\00-\00b\00o\00o\00m")
 (data $14 (i32.const 1692) "<")
 (data $14.1 (i32.const 1704) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data $15 (i32.const 1756) "\1c")
 (data $15.1 (i32.const 1768) "\02\00\00\00\02\00\00\00 ")
 (data $16 (i32.const 1788) ",")
 (data $16.1 (i32.const 1800) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $17 (i32.const 1836) "|")
 (data $17.1 (i32.const 1848) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $18 (i32.const 1968) "\10\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00 \00\00\00 ")
 (data $18.1 (i32.const 2004) "\02A\00\00\02\t\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A")
 (export "startGuarded" (func $async-method-try/startGuarded))
 (export "startGuardedFinally" (func $async-method-try/startGuardedFinally))
 (export "startGuardedNested" (func $async-method-try/startGuardedNested))
 (export "rejectMessage" (func $async-method-try/rejectMessage))
 (export "__async_async_method_try_mint" (func $async-method-try/__async_async_method_try_mint))
 (export "__async_async_method_try_mint_string" (func $async-method-try/__async_async_method_try_mint_string))
 (export "__async_async_method_try_Worker_guarded_last_handle" (func $async-method-try/__async_async_method_try_Worker_guarded_last_handle))
 (export "__async_async_method_try_Worker_new" (func $async-method-try/__async_async_method_try_Worker_new))
 (export "__async_async_method_try_Worker_guardedFinally_last_handle" (func $async-method-try/__async_async_method_try_Worker_guardedFinally_last_handle))
 (export "__async_async_method_try_Worker_helper_last_handle" (func $async-method-try/__async_async_method_try_Worker_helper_last_handle))
 (export "__async_async_method_try_Worker_guardedNested_last_handle" (func $async-method-try/__async_async_method_try_Worker_guardedNested_last_handle))
 (export "memory" (memory $0))
 (export "__async_async_method_try_Worker_guarded_reclaim" (func $export:async-method-try/__async_async_method_try_Worker_guarded_reclaim))
 (export "__async_async_method_try_Worker_guarded_resume_0" (func $export:async-method-try/__async_async_method_try_Worker_guarded_resume_0))
 (export "__async_async_method_try_Worker_guarded_reject_0" (func $export:async-method-try/__async_async_method_try_Worker_guarded_reject_0))
 (export "__async_async_method_try_Worker_guarded_result" (func $export:async-method-try/__async_async_method_try_Worker_guarded_result))
 (export "__async_async_method_try_Worker_guarded_error" (func $export:async-method-try/__async_async_method_try_Worker_guarded_error))
 (export "__async_async_method_try_Worker_guarded_errorValue" (func $export:async-method-try/__async_async_method_try_Worker_guarded_errorValue))
 (export "__async_async_method_try_Worker_guarded_status" (func $export:async-method-try/__async_async_method_try_Worker_guarded_status))
 (export "__async_async_method_try_Worker_guarded_entry" (func $export:async-method-try/__async_async_method_try_Worker_guarded_entry))
 (export "__async_async_method_try_Worker_guardedFinally_reclaim" (func $export:async-method-try/__async_async_method_try_Worker_guardedFinally_reclaim))
 (export "__async_async_method_try_Worker_guardedFinally_resume_0" (func $export:async-method-try/__async_async_method_try_Worker_guardedFinally_resume_0))
 (export "__async_async_method_try_Worker_guardedFinally_reject_0" (func $export:async-method-try/__async_async_method_try_Worker_guardedFinally_reject_0))
 (export "__async_async_method_try_Worker_guardedFinally_result" (func $export:async-method-try/__async_async_method_try_Worker_guarded_result))
 (export "__async_async_method_try_Worker_guardedFinally_error" (func $export:async-method-try/__async_async_method_try_Worker_guarded_error))
 (export "__async_async_method_try_Worker_guardedFinally_errorValue" (func $export:async-method-try/__async_async_method_try_Worker_guarded_errorValue))
 (export "__async_async_method_try_Worker_guardedFinally_status" (func $export:async-method-try/__async_async_method_try_Worker_guarded_status))
 (export "__async_async_method_try_Worker_guardedFinally_entry" (func $export:async-method-try/__async_async_method_try_Worker_guardedFinally_entry))
 (export "__async_async_method_try_Worker_helper_reclaim" (func $export:async-method-try/__async_async_method_try_Worker_helper_reclaim))
 (export "__async_async_method_try_Worker_helper_resume_0" (func $export:async-method-try/__async_async_method_try_Worker_helper_resume_0))
 (export "__async_async_method_try_Worker_helper_reject_0" (func $export:async-method-try/__async_async_method_try_Worker_helper_reject_0))
 (export "__async_async_method_try_Worker_helper_result" (func $export:async-method-try/__async_async_method_try_Worker_guarded_result))
 (export "__async_async_method_try_Worker_helper_error" (func $export:async-method-try/__async_async_method_try_Worker_guarded_error))
 (export "__async_async_method_try_Worker_helper_errorValue" (func $export:async-method-try/__async_async_method_try_Worker_guarded_errorValue))
 (export "__async_async_method_try_Worker_helper_status" (func $export:async-method-try/__async_async_method_try_Worker_guarded_status))
 (export "__async_async_method_try_Worker_helper_entry" (func $export:async-method-try/__async_async_method_try_Worker_helper_entry))
 (export "__async_async_method_try_Worker_guardedNested_reclaim" (func $export:async-method-try/__async_async_method_try_Worker_guardedNested_reclaim))
 (export "__async_async_method_try_Worker_guardedNested_pending_0" (func $export:async-method-try/__async_async_method_try_Worker_guardedNested_pending_0))
 (export "__async_async_method_try_Worker_guardedNested_resume_0" (func $export:async-method-try/__async_async_method_try_Worker_guardedNested_resume_0))
 (export "__async_async_method_try_Worker_guardedNested_reject_0" (func $export:async-method-try/__async_async_method_try_Worker_guardedNested_reject_0))
 (export "__async_async_method_try_Worker_guardedNested_result" (func $export:async-method-try/__async_async_method_try_Worker_guarded_result))
 (export "__async_async_method_try_Worker_guardedNested_error" (func $export:async-method-try/__async_async_method_try_Worker_guarded_error))
 (export "__async_async_method_try_Worker_guardedNested_errorValue" (func $export:async-method-try/__async_async_method_try_Worker_guarded_errorValue))
 (export "__async_async_method_try_Worker_guardedNested_status" (func $export:async-method-try/__async_async_method_try_Worker_guarded_status))
 (export "__async_async_method_try_Worker_guardedNested_entry" (func $export:async-method-try/__async_async_method_try_Worker_guardedNested_entry))
 (start $~start)
 (func $~lib/rt/itcms/__link (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  i32.eqz
  if
   return
  end
  local.get $0
  i32.eqz
  if
   i32.const 0
   i32.const 1120
   i32.const 295
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/white
  local.get $1
  i32.const 20
  i32.sub
  local.tee $1
  i32.load offset=4
  i32.const 3
  i32.and
  i32.eq
  if
   local.get $0
   i32.const 20
   i32.sub
   local.tee $0
   i32.load offset=4
   i32.const 3
   i32.and
   local.tee $3
   global.get $~lib/rt/itcms/white
   i32.eqz
   i32.eq
   if
    local.get $0
    local.get $1
    local.get $2
    select
    call $~lib/rt/itcms/Object#makeGray
   else
    global.get $~lib/rt/itcms/state
    i32.const 1
    i32.eq
    local.get $3
    i32.const 3
    i32.eq
    i32.and
    if
     local.get $1
     call $~lib/rt/itcms/Object#makeGray
    end
   end
  end
 )
 (func $~lib/rt/itcms/__visit (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  global.get $~lib/rt/itcms/white
  local.get $0
  i32.const 20
  i32.sub
  local.tee $0
  i32.load offset=4
  i32.const 3
  i32.and
  i32.eq
  if
   local.get $0
   call $~lib/rt/itcms/Object#makeGray
   global.get $~lib/rt/itcms/visitCount
   i32.const 1
   i32.add
   global.set $~lib/rt/itcms/visitCount
  end
 )
 (func $~lib/rt/itcms/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.const 1073741804
  i32.ge_u
  if
   i32.const 1056
   i32.const 1120
   i32.const 261
   i32.const 31
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.ge_u
  if
   block $__inlined_func$~lib/rt/itcms/interrupt$69
    i32.const 2048
    local.set $2
    loop $do-loop|0
     local.get $2
     call $~lib/rt/itcms/step
     i32.sub
     local.set $2
     global.get $~lib/rt/itcms/state
     i32.eqz
     if
      global.get $~lib/rt/itcms/total
      i32.const 1
      i32.shl
      i32.const 1024
      i32.add
      global.set $~lib/rt/itcms/threshold
      br $__inlined_func$~lib/rt/itcms/interrupt$69
     end
     local.get $2
     i32.const 0
     i32.gt_s
     br_if $do-loop|0
    end
    global.get $~lib/rt/itcms/total
    global.get $~lib/rt/itcms/total
    global.get $~lib/rt/itcms/threshold
    i32.sub
    i32.const 1024
    i32.lt_u
    i32.const 10
    i32.shl
    i32.add
    global.set $~lib/rt/itcms/threshold
   end
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.set $4
  local.get $0
  i32.const 16
  i32.add
  local.tee $2
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1056
   i32.const 1392
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  local.get $2
  i32.const 12
  i32.le_u
  if (result i32)
   i32.const 12
  else
   local.get $2
   i32.const 19
   i32.add
   i32.const -16
   i32.and
   i32.const 4
   i32.sub
  end
  local.tee $5
  call $~lib/rt/tlsf/searchBlock
  local.tee $2
  i32.eqz
  if
   local.get $5
   i32.const 256
   i32.ge_u
   if (result i32)
    local.get $5
    i32.const 536870910
    i32.lt_u
    if (result i32)
     local.get $5
     i32.const 1
     i32.const 27
     local.get $5
     i32.clz
     i32.sub
     i32.shl
     i32.add
     i32.const 1
     i32.sub
    else
     local.get $5
    end
   else
    local.get $5
   end
   i32.const 4
   local.get $4
   i32.load offset=1568
   memory.size
   local.tee $2
   i32.const 16
   i32.shl
   i32.const 4
   i32.sub
   i32.ne
   i32.shl
   i32.add
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.set $3
   local.get $2
   local.get $3
   local.get $2
   local.get $3
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $3
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
   local.get $4
   local.get $2
   i32.const 16
   i32.shl
   memory.size
   i64.extend_i32_s
   i64.const 16
   i64.shl
   call $~lib/rt/tlsf/addMemory
   local.get $4
   local.get $5
   call $~lib/rt/tlsf/searchBlock
   local.tee $2
   i32.eqz
   if
    i32.const 0
    i32.const 1392
    i32.const 499
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $5
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.gt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 501
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  local.get $2
  call $~lib/rt/tlsf/removeBlock
  local.get $2
  i32.load
  local.set $6
  local.get $5
  i32.const 4
  i32.add
  i32.const 15
  i32.and
  if
   i32.const 0
   i32.const 1392
   i32.const 361
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $6
  i32.const -4
  i32.and
  local.get $5
  i32.sub
  local.tee $3
  i32.const 16
  i32.ge_u
  if
   local.get $2
   local.get $5
   local.get $6
   i32.const 2
   i32.and
   i32.or
   i32.store
   local.get $2
   i32.const 4
   i32.add
   local.get $5
   i32.add
   local.tee $5
   local.get $3
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   i32.store
   local.get $4
   local.get $5
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $2
   local.get $6
   i32.const -2
   i32.and
   i32.store
   local.get $2
   i32.const 4
   i32.add
   local.get $2
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   local.get $3
   i32.load
   i32.const -3
   i32.and
   i32.store
  end
  local.get $2
  local.get $1
  i32.store offset=12
  local.get $2
  local.get $0
  i32.store offset=16
  global.get $~lib/rt/itcms/fromSpace
  local.tee $1
  i32.load offset=8
  local.set $3
  local.get $2
  local.get $1
  global.get $~lib/rt/itcms/white
  i32.or
  i32.store offset=4
  local.get $2
  local.get $3
  i32.store offset=8
  local.get $3
  local.get $2
  local.get $3
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  global.get $~lib/rt/itcms/total
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.const 4
  i32.add
  i32.add
  global.set $~lib/rt/itcms/total
  local.get $2
  i32.const 20
  i32.add
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill
  local.get $1
 )
 (func $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=12
  local.tee $3
  i32.eqz
  local.get $3
  i32.const 0
  i32.le_s
  i32.or
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const -1
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.set $0
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_s
   if
    local.get $0
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $1
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $2
     return
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const -1
 )
 (func $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#get:length (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/object/Object#constructor (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/rt/__newArray (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  i32.const 16
  local.get $1
  call $~lib/rt/itcms/__new
  local.tee $1
  local.get $2
  i32.store
  local.get $1
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=12
   local.tee $7
   i32.const 1
   i32.add
   local.tee $6
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $4
   local.get $0
   i32.load offset=8
   local.tee $2
   i32.const 2
   i32.shr_u
   i32.gt_u
   if
    local.get $4
    i32.const 268435455
    i32.gt_u
    if
     i32.const 1488
     i32.const 1536
     i32.const 19
     i32.const 48
     call $~lib/builtins/abort
     unreachable
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    block $__inlined_func$~lib/rt/itcms/__renew$665
     i32.const 1073741820
     local.get $2
     i32.const 1
     i32.shl
     local.tee $2
     local.get $2
     i32.const 1073741820
     i32.ge_u
     select
     local.tee $3
     i32.const 8
     local.get $4
     local.get $4
     i32.const 8
     i32.le_u
     select
     i32.const 2
     i32.shl
     local.tee $2
     local.get $2
     local.get $3
     i32.lt_u
     select
     local.tee $5
     local.get $0
     i32.load
     local.tee $2
     i32.const 20
     i32.sub
     local.tee $4
     i32.load
     i32.const -4
     i32.and
     i32.const 16
     i32.sub
     i32.le_u
     if
      local.get $4
      local.get $5
      i32.store offset=16
      local.get $2
      local.set $3
      br $__inlined_func$~lib/rt/itcms/__renew$665
     end
     local.get $5
     local.get $4
     i32.load offset=12
     call $~lib/rt/itcms/__new
     local.tee $3
     local.get $2
     local.get $5
     local.get $4
     i32.load offset=16
     local.tee $4
     local.get $4
     local.get $5
     i32.gt_u
     select
     memory.copy
    end
    local.get $2
    local.get $3
    i32.ne
    if
     local.get $0
     local.get $3
     i32.store
     local.get $0
     local.get $3
     i32.store offset=4
     local.get $0
     local.get $3
     i32.const 0
     call $~lib/rt/itcms/__link
    end
    local.get $0
    local.get $5
    i32.store offset=8
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=4
   local.get $7
   i32.const 2
   i32.shl
   i32.add
   local.get $1
   i32.store
   local.get $0
   local.get $1
   i32.const 1
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $6
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#__get (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 1248
   i32.const 1536
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  i32.store offset=4
  local.get $0
  i32.eqz
  if
   i32.const 1856
   i32.const 1536
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guarded_status (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guarded_result (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guarded_errorValue (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guarded_error (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-method-try/Worker#constructor (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.const 4
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/object/Object#constructor
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/rt/tlsf/removeBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 268
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const -4
  i32.and
  local.tee $3
  i32.const 12
  i32.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 270
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $3
   local.get $3
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $3
   i32.clz
   i32.sub
   local.tee $4
   i32.const 7
   i32.sub
   local.set $2
   local.get $3
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $3
  i32.const 16
  i32.lt_u
  local.get $2
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 284
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load offset=8
  local.set $5
  local.get $1
  i32.load offset=4
  local.tee $4
  if
   local.get $4
   local.get $5
   i32.store offset=8
  end
  local.get $5
  if
   local.get $5
   local.get $4
   i32.store offset=4
  end
  local.get $1
  local.get $0
  local.get $2
  i32.const 4
  i32.shl
  local.get $3
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.tee $1
  i32.load offset=96
  i32.eq
  if
   local.get $1
   local.get $5
   i32.store offset=96
   local.get $5
   i32.eqz
   if
    local.get $0
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    local.tee $1
    i32.load offset=4
    i32.const -2
    local.get $3
    i32.rotl
    i32.and
    local.set $3
    local.get $1
    local.get $3
    i32.store offset=4
    local.get $3
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const -2
     local.get $2
     i32.rotl
     i32.and
     i32.store
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 201
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 203
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 4
  i32.add
  local.get $1
  i32.load
  i32.const -4
  i32.and
  i32.add
  local.tee $4
  i32.load
  local.tee $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.get $4
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $3
   i32.const 4
   i32.add
   local.get $2
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   i32.store
   local.get $1
   i32.const 4
   i32.add
   local.get $1
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $4
   i32.load
   local.set $2
  end
  local.get $3
  i32.const 2
  i32.and
  if
   local.get $1
   i32.const 4
   i32.sub
   i32.load
   local.tee $1
   i32.load
   local.tee $6
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 1392
    i32.const 221
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $6
   i32.const 4
   i32.add
   local.get $3
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   i32.store
  end
  local.get $4
  local.get $2
  i32.const 2
  i32.or
  i32.store
  local.get $3
  i32.const -4
  i32.and
  local.tee $2
  i32.const 12
  i32.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 233
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  local.get $1
  i32.const 4
  i32.add
  local.get $2
  i32.add
  i32.ne
  if
   i32.const 0
   i32.const 1392
   i32.const 234
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $2
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $2
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $2
   local.get $2
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $2
   i32.clz
   i32.sub
   local.tee $3
   i32.const 7
   i32.sub
   local.set $5
   local.get $2
   local.get $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $2
  i32.const 16
  i32.lt_u
  local.get $5
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 251
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  local.set $3
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  local.get $3
  if
   local.get $3
   local.get $1
   i32.store offset=4
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store offset=96
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $5
  i32.shl
  i32.or
  i32.store
  local.get $0
  local.get $5
  i32.const 2
  i32.shl
  i32.add
  local.tee $0
  local.get $0
  i32.load offset=4
  i32.const 1
  local.get $2
  i32.shl
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/itcms/Object#makeGray (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  global.get $~lib/rt/itcms/iter
  i32.eq
  if
   local.get $0
   i32.load offset=8
   local.tee $1
   i32.eqz
   if
    i32.const 0
    i32.const 1120
    i32.const 148
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   global.set $~lib/rt/itcms/iter
  end
  block $__inlined_func$~lib/rt/itcms/Object#unlink$690
   local.get $0
   i32.load offset=4
   i32.const -4
   i32.and
   local.tee $1
   i32.eqz
   if
    local.get $0
    i32.load offset=8
    i32.eqz
    local.get $0
    i32.const 34804
    i32.lt_u
    i32.and
    i32.eqz
    if
     i32.const 0
     i32.const 1120
     i32.const 128
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    br $__inlined_func$~lib/rt/itcms/Object#unlink$690
   end
   local.get $0
   i32.load offset=8
   local.tee $2
   i32.eqz
   if
    i32.const 0
    i32.const 1120
    i32.const 132
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   local.get $2
   i32.store offset=8
   local.get $2
   local.get $1
   local.get $2
   i32.load offset=4
   i32.const 3
   i32.and
   i32.or
   i32.store offset=4
  end
  global.get $~lib/rt/itcms/toSpace
  local.set $2
  local.get $0
  i32.load offset=12
  local.tee $1
  i32.const 2
  i32.le_u
  if (result i32)
   i32.const 1
  else
   local.get $1
   i32.const 1968
   i32.load
   i32.gt_u
   if
    i32.const 1248
    i32.const 1312
    i32.const 21
    i32.const 28
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   i32.const 2
   i32.shl
   i32.const 1972
   i32.add
   i32.load
   i32.const 32
   i32.and
  end
  local.set $3
  local.get $2
  i32.load offset=8
  local.set $1
  local.get $0
  global.get $~lib/rt/itcms/white
  i32.eqz
  i32.const 2
  local.get $3
  select
  local.get $2
  i32.or
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $1
  local.get $0
  local.get $1
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  i32.store offset=4
  local.get $2
  local.get $0
  i32.store offset=8
 )
 (func $~lib/rt/__visit_members (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  block $folding-inner1
   block $folding-inner0
    block $invalid
     block $async-method-try/__Cps_Worker_helper
      block $async-method-try/__Cps_Worker_guardedNested
       block $async-method-try/__Cps_Worker_guardedFinally
        block $~lib/array/Array<i32>
         block $async-method-try/__Cps_Worker_guarded
          block $~lib/error/Error
           block $~lib/promise/Promise<i32>
            block $async-method-try/Worker
             block $~lib/arraybuffer/ArrayBufferView
              block $~lib/string/String
               block $~lib/arraybuffer/ArrayBuffer
                block $~lib/object/Object
                 local.get $0
                 i32.const 8
                 i32.sub
                 i32.load
                 br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $async-method-try/Worker $~lib/promise/Promise<i32> $~lib/error/Error $async-method-try/__Cps_Worker_guarded $folding-inner0 $~lib/array/Array<i32> $async-method-try/__Cps_Worker_guardedFinally $folding-inner0 $async-method-try/__Cps_Worker_guardedNested $folding-inner0 $async-method-try/__Cps_Worker_helper $folding-inner0 $invalid
                end
                return
               end
               return
              end
              return
             end
             local.get $0
             i32.load
             call $~lib/rt/itcms/__visit
             return
            end
            return
           end
           return
          end
          local.get $0
          i32.load
          call $~lib/rt/itcms/__visit
          local.get $0
          i32.load offset=4
          call $~lib/rt/itcms/__visit
          local.get $0
          i32.load offset=8
          call $~lib/rt/itcms/__visit
          return
         end
         local.get $0
         call $async-method-try/__Cps_Worker_guarded~visit
         return
        end
        global.get $~lib/memory/__stack_pointer
        i32.const 4
        i32.sub
        global.set $~lib/memory/__stack_pointer
        global.get $~lib/memory/__stack_pointer
        i32.const 2036
        i32.lt_s
        br_if $folding-inner1
        global.get $~lib/memory/__stack_pointer
        i32.const 0
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.load
        call $~lib/rt/itcms/__visit
        global.get $~lib/memory/__stack_pointer
        i32.const 4
        i32.add
        global.set $~lib/memory/__stack_pointer
        return
       end
       local.get $0
       i32.load offset=8
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=12
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=24
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=32
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=36
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=52
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=56
       call $~lib/rt/itcms/__visit
       return
      end
      local.get $0
      call $async-method-try/__Cps_Worker_guarded~visit
      return
     end
     local.get $0
     i32.load offset=8
     call $~lib/rt/itcms/__visit
     local.get $0
     i32.load offset=12
     call $~lib/rt/itcms/__visit
     local.get $0
     i32.load offset=24
     call $~lib/rt/itcms/__visit
     return
    end
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=4
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $1
   local.get $0
   i32.load offset=12
   i32.const 2
   i32.shl
   i32.add
   local.set $2
   loop $while-continue|0
    local.get $1
    local.get $2
    i32.lt_u
    if
     local.get $1
     i32.load
     local.tee $3
     if
      local.get $3
      call $~lib/rt/itcms/__visit
     end
     local.get $1
     i32.const 4
     i32.add
     local.set $1
     br $while-continue|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load
   call $~lib/rt/itcms/__visit
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/array/Array<async-method-try/__Cps_Worker_helper>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1
  local.get $0
  i32.load offset=12
  local.tee $2
  local.get $1
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $1
   local.get $2
   i32.add
   local.tee $1
   i32.const 0
   local.get $1
   i32.const 0
   i32.gt_s
   select
  else
   local.get $1
   local.get $2
   local.get $1
   local.get $2
   i32.lt_s
   select
  end
  local.tee $4
  i32.sub
  local.tee $1
  local.get $1
  i32.const 1
  i32.gt_s
  select
  local.tee $1
  i32.const 0
  local.get $1
  i32.const 0
  i32.gt_s
  select
  local.tee $1
  i32.const 15
  call $~lib/rt/__newArray
  local.tee $3
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  i32.load offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.tee $3
  local.get $4
  i32.const 2
  i32.shl
  i32.add
  local.tee $5
  local.get $1
  i32.const 2
  i32.shl
  memory.copy
  local.get $2
  local.get $1
  local.get $4
  i32.add
  local.tee $4
  i32.ne
  if
   local.get $5
   local.get $3
   local.get $4
   i32.const 2
   i32.shl
   i32.add
   local.get $2
   local.get $4
   i32.sub
   i32.const 2
   i32.shl
   memory.copy
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  local.get $1
  i32.sub
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-method-try/__Cps_Worker_guardedNested>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1
  local.get $0
  i32.load offset=12
  local.tee $2
  local.get $1
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $1
   local.get $2
   i32.add
   local.tee $1
   i32.const 0
   local.get $1
   i32.const 0
   i32.gt_s
   select
  else
   local.get $1
   local.get $2
   local.get $1
   local.get $2
   i32.lt_s
   select
  end
  local.tee $4
  i32.sub
  local.tee $1
  local.get $1
  i32.const 1
  i32.gt_s
  select
  local.tee $1
  i32.const 0
  local.get $1
  i32.const 0
  i32.gt_s
  select
  local.tee $1
  i32.const 13
  call $~lib/rt/__newArray
  local.tee $3
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  i32.load offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.tee $3
  local.get $4
  i32.const 2
  i32.shl
  i32.add
  local.tee $5
  local.get $1
  i32.const 2
  i32.shl
  memory.copy
  local.get $2
  local.get $1
  local.get $4
  i32.add
  local.tee $4
  i32.ne
  if
   local.get $5
   local.get $3
   local.get $4
   i32.const 2
   i32.shl
   i32.add
   local.get $2
   local.get $4
   i32.sub
   i32.const 2
   i32.shl
   memory.copy
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  local.get $1
  i32.sub
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-method-try/__Cps_Worker_guardedFinally>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1
  local.get $0
  i32.load offset=12
  local.tee $2
  local.get $1
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $1
   local.get $2
   i32.add
   local.tee $1
   i32.const 0
   local.get $1
   i32.const 0
   i32.gt_s
   select
  else
   local.get $1
   local.get $2
   local.get $1
   local.get $2
   i32.lt_s
   select
  end
  local.tee $4
  i32.sub
  local.tee $1
  local.get $1
  i32.const 1
  i32.gt_s
  select
  local.tee $1
  i32.const 0
  local.get $1
  i32.const 0
  i32.gt_s
  select
  local.tee $1
  i32.const 11
  call $~lib/rt/__newArray
  local.tee $3
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  i32.load offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.tee $3
  local.get $4
  i32.const 2
  i32.shl
  i32.add
  local.tee $5
  local.get $1
  i32.const 2
  i32.shl
  memory.copy
  local.get $2
  local.get $1
  local.get $4
  i32.add
  local.tee $4
  i32.ne
  if
   local.get $5
   local.get $3
   local.get $4
   i32.const 2
   i32.shl
   i32.add
   local.get $2
   local.get $4
   i32.sub
   i32.const 2
   i32.shl
   memory.copy
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  local.get $1
  i32.sub
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1
  local.get $0
  i32.load offset=12
  local.tee $2
  local.get $1
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $1
   local.get $2
   i32.add
   local.tee $1
   i32.const 0
   local.get $1
   i32.const 0
   i32.gt_s
   select
  else
   local.get $1
   local.get $2
   local.get $1
   local.get $2
   i32.lt_s
   select
  end
  local.tee $4
  i32.sub
  local.tee $1
  local.get $1
  i32.const 1
  i32.gt_s
  select
  local.tee $1
  i32.const 0
  local.get $1
  i32.const 0
  i32.gt_s
  select
  local.tee $1
  i32.const 8
  call $~lib/rt/__newArray
  local.tee $3
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  i32.load offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.tee $3
  local.get $4
  i32.const 2
  i32.shl
  i32.add
  local.tee $5
  local.get $1
  i32.const 2
  i32.shl
  memory.copy
  local.get $2
  local.get $1
  local.get $4
  i32.add
  local.tee $4
  i32.ne
  if
   local.get $5
   local.get $3
   local.get $4
   i32.const 2
   i32.shl
   i32.add
   local.get $2
   local.get $4
   i32.sub
   i32.const 2
   i32.shl
   memory.copy
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  local.get $1
  i32.sub
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-method-try/__Cps_Worker_guardedNested#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  block $folding-inner0
   loop $while-continue|0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    block $case21|1
     block $case20|1
      block $case19|1
       block $case18|1
        block $case17|1
         block $case16|1
          block $case15|1
           block $case14|1
            block $case13|1
             block $case12|1
              block $case11|1
               block $case10|1
                block $case9|1
                 block $case8|1
                  block $case7|1
                   block $case6|1
                    block $case5|1
                     block $case4|1
                      block $case3|1
                       block $case2|1
                        block $case1|1
                         local.get $0
                         i32.load
                         local.tee $1
                         if
                          local.get $1
                          i32.const 1
                          i32.eq
                          br_if $case1|1
                          local.get $1
                          i32.const 1024
                          i32.eq
                          br_if $case2|1
                          local.get $1
                          i32.const 1025
                          i32.eq
                          br_if $case3|1
                          local.get $1
                          i32.const 1026
                          i32.eq
                          br_if $case4|1
                          local.get $1
                          i32.const 1027
                          i32.eq
                          br_if $case5|1
                          local.get $1
                          i32.const 1028
                          i32.eq
                          br_if $case6|1
                          local.get $1
                          i32.const 1029
                          i32.eq
                          br_if $case7|1
                          local.get $1
                          i32.const 1030
                          i32.eq
                          br_if $case8|1
                          local.get $1
                          i32.const 1031
                          i32.eq
                          br_if $case9|1
                          local.get $1
                          i32.const 1032
                          i32.eq
                          br_if $case10|1
                          local.get $1
                          i32.const 1033
                          i32.eq
                          br_if $case11|1
                          local.get $1
                          i32.const 1034
                          i32.eq
                          br_if $case12|1
                          local.get $1
                          i32.const 1035
                          i32.eq
                          br_if $case13|1
                          local.get $1
                          i32.const 1036
                          i32.eq
                          br_if $case14|1
                          local.get $1
                          i32.const 1037
                          i32.eq
                          br_if $case15|1
                          local.get $1
                          i32.const 1038
                          i32.eq
                          br_if $case16|1
                          local.get $1
                          i32.const 1039
                          i32.eq
                          br_if $case17|1
                          local.get $1
                          i32.const 1040
                          i32.eq
                          br_if $case18|1
                          local.get $1
                          i32.const 1041
                          i32.eq
                          br_if $case19|1
                          local.get $1
                          i32.const 1042
                          i32.eq
                          br_if $case20|1
                          br $case21|1
                         end
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.const 1024
                         i32.store
                         br $while-continue|0
                        end
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.const 1028
                        i32.store
                        br $while-continue|0
                       end
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=28
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=29
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=30
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1456
                       i32.store offset=32
                       local.get $0
                       i32.const 1456
                       i32.const 0
                       call $~lib/rt/itcms/__link
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=40
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=48
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1456
                       i32.store offset=52
                       local.get $0
                       i32.const 1456
                       i32.const 0
                       call $~lib/rt/itcms/__link
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1026
                       i32.store
                       br $while-continue|0
                      end
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=48
                      if
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1036
                       i32.store
                      else
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1035
                       i32.store
                      end
                      br $while-continue|0
                     end
                     global.get $~lib/memory/__stack_pointer
                     local.get $0
                     i32.store
                     local.get $0
                     i32.const 1027
                     i32.store
                     br $while-continue|0
                    end
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store offset=8
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.load offset=24
                    local.tee $1
                    i32.store offset=4
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store offset=8
                    local.get $0
                    local.get $1
                    local.get $0
                    i32.load offset=20
                    call $async-method-try/Worker#helper
                    i32.store offset=72
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1
                    i32.store
                    global.get $~lib/memory/__stack_pointer
                    i32.const 12
                    i32.add
                    global.set $~lib/memory/__stack_pointer
                    i32.const 0
                    return
                   end
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store offset=4
                   local.get $0
                   local.get $0
                   i32.load offset=16
                   i32.store offset=60
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=48
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=28
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=29
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=30
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=40
                   end
                   if
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1030
                    i32.store
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1029
                    i32.store
                   end
                   br $while-continue|0
                  end
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store offset=4
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.load offset=24
                  local.tee $1
                  i32.store
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store offset=8
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.load offset=24
                  local.tee $2
                  i32.store offset=4
                  local.get $2
                  i32.load
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store offset=4
                  local.get $1
                  local.get $2
                  local.get $0
                  i32.load offset=60
                  i32.add
                  i32.store
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.load8_u offset=48
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=28
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=29
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=30
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=40
                  end
                  if
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1032
                   i32.store
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1031
                   i32.store
                  end
                  br $while-continue|0
                 end
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1025
                 i32.store
                 br $while-continue|0
                end
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 0
                i32.store8 offset=28
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 0
                i32.store8 offset=29
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 0
                i32.store8 offset=30
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store offset=8
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.load offset=24
                local.tee $1
                i32.store offset=4
                local.get $0
                local.get $1
                i32.load
                i32.store offset=44
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 1
                i32.store8 offset=28
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=48
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=28
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=29
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=30
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=40
                end
                if
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1034
                 i32.store
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1033
                 i32.store
                end
                br $while-continue|0
               end
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 1025
               i32.store
               br $while-continue|0
              end
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.const 1025
              i32.store
              br $while-continue|0
             end
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1025
             i32.store
             br $while-continue|0
            end
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 0
            i32.store8 offset=68
            i32.const 1584
            call $async-method-try/log
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=48
            if
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1038
             i32.store
            else
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1039
             i32.store
            end
            br $while-continue|0
           end
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.const 0
           i32.store8 offset=48
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store offset=8
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.load offset=52
           local.tee $1
           i32.store offset=4
           local.get $0
           local.get $1
           i32.store offset=64
           local.get $0
           local.get $1
           i32.const 0
           call $~lib/rt/itcms/__link
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store offset=8
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.load offset=64
           local.tee $1
           i32.store offset=4
           local.get $1
           call $~lib/string/String.__concat
           local.set $1
           global.get $~lib/memory/__stack_pointer
           local.get $1
           i32.store
           local.get $1
           call $async-method-try/log
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.load8_u offset=28
           if (result i32)
            i32.const 1
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=29
           end
           if (result i32)
            i32.const 1
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=30
           end
           if (result i32)
            i32.const 1
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=40
           end
           if
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 1035
            i32.store
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 1037
            i32.store
           end
           br $while-continue|0
          end
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=28
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=29
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=30
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const -1
          i32.store offset=44
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1
          i32.store8 offset=28
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1035
          i32.store
          br $while-continue|0
         end
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.load offset=56
         local.tee $1
         i32.store offset=4
         local.get $0
         local.get $1
         i32.store offset=12
         local.get $0
         local.get $1
         i32.const 0
         call $~lib/rt/itcms/__link
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.load offset=52
         local.tee $1
         i32.store offset=4
         br $folding-inner0
        end
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.load8_u offset=40
        if
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.const 1040
         i32.store
        else
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.const 1041
         i32.store
        end
        br $while-continue|0
       end
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 0
       i32.store8 offset=40
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=36
       local.tee $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=12
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=32
       local.tee $1
       i32.store offset=4
       br $folding-inner0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load8_u offset=28
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1042
       i32.store
      else
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1023
       i32.store
      end
      br $while-continue|0
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const 0
     i32.store8 offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     i32.load offset=44
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-method-try/__async_roots_Worker_guardedNested
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-method-try/__async_roots_Worker_guardedNested
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
     call $~lib/array/Array<async-method-try/__Cps_Worker_guardedNested>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 1
     return
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   i32.const 1
   i32.const 2
   local.get $0
   i32.load
   i32.const -1
   i32.eq
   select
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const -2
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guardedNested
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guardedNested
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
  call $~lib/array/Array<async-method-try/__Cps_Worker_guardedNested>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 2
 )
 (func $async-method-try/__Cps_Worker_guardedFinally#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  block $folding-inner0
   loop $while-continue|0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    block $case18|1
     block $case17|1
      block $case16|1
       block $case15|1
        block $case14|1
         block $case13|1
          block $case12|1
           block $case11|1
            block $case10|1
             block $case9|1
              block $case8|1
               block $case7|1
                block $case6|1
                 block $case5|1
                  block $case4|1
                   block $case3|1
                    block $case2|1
                     block $case1|1
                      local.get $0
                      i32.load
                      local.tee $1
                      if
                       local.get $1
                       i32.const 1
                       i32.eq
                       br_if $case1|1
                       local.get $1
                       i32.const 1024
                       i32.eq
                       br_if $case2|1
                       local.get $1
                       i32.const 1025
                       i32.eq
                       br_if $case3|1
                       local.get $1
                       i32.const 1026
                       i32.eq
                       br_if $case4|1
                       local.get $1
                       i32.const 1027
                       i32.eq
                       br_if $case5|1
                       local.get $1
                       i32.const 1028
                       i32.eq
                       br_if $case6|1
                       local.get $1
                       i32.const 1029
                       i32.eq
                       br_if $case7|1
                       local.get $1
                       i32.const 1030
                       i32.eq
                       br_if $case8|1
                       local.get $1
                       i32.const 1031
                       i32.eq
                       br_if $case9|1
                       local.get $1
                       i32.const 1032
                       i32.eq
                       br_if $case10|1
                       local.get $1
                       i32.const 1033
                       i32.eq
                       br_if $case11|1
                       local.get $1
                       i32.const 1034
                       i32.eq
                       br_if $case12|1
                       local.get $1
                       i32.const 1035
                       i32.eq
                       br_if $case13|1
                       local.get $1
                       i32.const 1036
                       i32.eq
                       br_if $case14|1
                       local.get $1
                       i32.const 1037
                       i32.eq
                       br_if $case15|1
                       local.get $1
                       i32.const 1038
                       i32.eq
                       br_if $case16|1
                       local.get $1
                       i32.const 1039
                       i32.eq
                       br_if $case17|1
                       br $case18|1
                      end
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.const 1024
                      i32.store
                      br $while-continue|0
                     end
                     global.get $~lib/memory/__stack_pointer
                     local.get $0
                     i32.store
                     local.get $0
                     i32.const 1028
                     i32.store
                     br $while-continue|0
                    end
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=28
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=29
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=30
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1456
                    i32.store offset=32
                    local.get $0
                    i32.const 1456
                    i32.const 0
                    call $~lib/rt/itcms/__link
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=40
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=48
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1456
                    i32.store offset=52
                    local.get $0
                    i32.const 1456
                    i32.const 0
                    call $~lib/rt/itcms/__link
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1026
                    i32.store
                    br $while-continue|0
                   end
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 0
                   i32.store8 offset=64
                   i32.const 1584
                   call $async-method-try/log
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=48
                   if
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1035
                    i32.store
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1036
                    i32.store
                   end
                   br $while-continue|0
                  end
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.const 1027
                  i32.store
                  br $while-continue|0
                 end
                 call $async-method-try/getNumber
                 drop
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1
                 i32.store
                 global.get $~lib/memory/__stack_pointer
                 i32.const 12
                 i32.add
                 global.set $~lib/memory/__stack_pointer
                 i32.const 0
                 return
                end
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store offset=4
                local.get $0
                local.get $0
                i32.load offset=16
                i32.store offset=60
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=48
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=28
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=29
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=30
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=40
                end
                if
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1030
                 i32.store
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1029
                 i32.store
                end
                br $while-continue|0
               end
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store offset=4
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.load offset=24
               local.tee $1
               i32.store
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store offset=8
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.load offset=24
               local.tee $2
               i32.store offset=4
               local.get $2
               i32.load
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store offset=4
               local.get $1
               local.get $2
               local.get $0
               i32.load offset=60
               i32.add
               i32.store
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.load8_u offset=48
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=28
               end
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=29
               end
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=30
               end
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=40
               end
               if
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 1032
                i32.store
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 1031
                i32.store
               end
               br $while-continue|0
              end
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.const 1025
              i32.store
              br $while-continue|0
             end
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 0
             i32.store8 offset=28
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 0
             i32.store8 offset=29
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 0
             i32.store8 offset=30
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store offset=8
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.load offset=24
             local.tee $1
             i32.store offset=4
             local.get $0
             local.get $1
             i32.load
             i32.store offset=44
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1
             i32.store8 offset=28
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.load8_u offset=48
             if (result i32)
              i32.const 1
             else
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.load8_u offset=28
             end
             if (result i32)
              i32.const 1
             else
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.load8_u offset=29
             end
             if (result i32)
              i32.const 1
             else
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.load8_u offset=30
             end
             if (result i32)
              i32.const 1
             else
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.load8_u offset=40
             end
             if
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.const 1034
              i32.store
             else
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.const 1033
              i32.store
             end
             br $while-continue|0
            end
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 1025
            i32.store
            br $while-continue|0
           end
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.const 1025
           i32.store
           br $while-continue|0
          end
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1025
          i32.store
          br $while-continue|0
         end
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.load offset=56
         local.tee $1
         i32.store offset=4
         local.get $0
         local.get $1
         i32.store offset=12
         local.get $0
         local.get $1
         i32.const 0
         call $~lib/rt/itcms/__link
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.load offset=52
         local.tee $1
         i32.store offset=4
         br $folding-inner0
        end
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.load8_u offset=40
        if
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.const 1037
         i32.store
        else
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.const 1038
         i32.store
        end
        br $while-continue|0
       end
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 0
       i32.store8 offset=40
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=36
       local.tee $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=12
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=32
       local.tee $1
       i32.store offset=4
       br $folding-inner0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load8_u offset=28
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1039
       i32.store
      else
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1023
       i32.store
      end
      br $while-continue|0
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const 0
     i32.store8 offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     i32.load offset=44
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-method-try/__async_roots_Worker_guardedFinally
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-method-try/__async_roots_Worker_guardedFinally
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
     call $~lib/array/Array<async-method-try/__Cps_Worker_guardedFinally>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 1
     return
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   i32.const 1
   i32.const 2
   local.get $0
   i32.load
   i32.const -1
   i32.eq
   select
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const -2
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guardedFinally
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guardedFinally
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
  call $~lib/array/Array<async-method-try/__Cps_Worker_guardedFinally>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 2
 )
 (func $async-method-try/__Cps_Worker_guarded#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  block $folding-inner0
   loop $while-continue|0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    block $case21|1
     block $case20|1
      block $case19|1
       block $case18|1
        block $case17|1
         block $case16|1
          block $case15|1
           block $case14|1
            block $case13|1
             block $case12|1
              block $case11|1
               block $case10|1
                block $case9|1
                 block $case8|1
                  block $case7|1
                   block $case6|1
                    block $case5|1
                     block $case4|1
                      block $case3|1
                       block $case2|1
                        block $case1|1
                         local.get $0
                         i32.load
                         local.tee $1
                         if
                          local.get $1
                          i32.const 1
                          i32.eq
                          br_if $case1|1
                          local.get $1
                          i32.const 1024
                          i32.eq
                          br_if $case2|1
                          local.get $1
                          i32.const 1025
                          i32.eq
                          br_if $case3|1
                          local.get $1
                          i32.const 1026
                          i32.eq
                          br_if $case4|1
                          local.get $1
                          i32.const 1027
                          i32.eq
                          br_if $case5|1
                          local.get $1
                          i32.const 1028
                          i32.eq
                          br_if $case6|1
                          local.get $1
                          i32.const 1029
                          i32.eq
                          br_if $case7|1
                          local.get $1
                          i32.const 1030
                          i32.eq
                          br_if $case8|1
                          local.get $1
                          i32.const 1031
                          i32.eq
                          br_if $case9|1
                          local.get $1
                          i32.const 1032
                          i32.eq
                          br_if $case10|1
                          local.get $1
                          i32.const 1033
                          i32.eq
                          br_if $case11|1
                          local.get $1
                          i32.const 1034
                          i32.eq
                          br_if $case12|1
                          local.get $1
                          i32.const 1035
                          i32.eq
                          br_if $case13|1
                          local.get $1
                          i32.const 1036
                          i32.eq
                          br_if $case14|1
                          local.get $1
                          i32.const 1037
                          i32.eq
                          br_if $case15|1
                          local.get $1
                          i32.const 1038
                          i32.eq
                          br_if $case16|1
                          local.get $1
                          i32.const 1039
                          i32.eq
                          br_if $case17|1
                          local.get $1
                          i32.const 1040
                          i32.eq
                          br_if $case18|1
                          local.get $1
                          i32.const 1041
                          i32.eq
                          br_if $case19|1
                          local.get $1
                          i32.const 1042
                          i32.eq
                          br_if $case20|1
                          br $case21|1
                         end
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.const 1024
                         i32.store
                         br $while-continue|0
                        end
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.const 1028
                        i32.store
                        br $while-continue|0
                       end
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=28
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=29
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=30
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1456
                       i32.store offset=32
                       local.get $0
                       i32.const 1456
                       i32.const 0
                       call $~lib/rt/itcms/__link
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=40
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=48
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1456
                       i32.store offset=52
                       local.get $0
                       i32.const 1456
                       i32.const 0
                       call $~lib/rt/itcms/__link
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1026
                       i32.store
                       br $while-continue|0
                      end
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=48
                      if
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1036
                       i32.store
                      else
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1035
                       i32.store
                      end
                      br $while-continue|0
                     end
                     global.get $~lib/memory/__stack_pointer
                     local.get $0
                     i32.store
                     local.get $0
                     i32.const 1027
                     i32.store
                     br $while-continue|0
                    end
                    call $async-method-try/getNumber
                    drop
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1
                    i32.store
                    global.get $~lib/memory/__stack_pointer
                    i32.const 12
                    i32.add
                    global.set $~lib/memory/__stack_pointer
                    i32.const 0
                    return
                   end
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store offset=4
                   local.get $0
                   local.get $0
                   i32.load offset=16
                   i32.store offset=60
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=48
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=28
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=29
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=30
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=40
                   end
                   if
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1030
                    i32.store
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1029
                    i32.store
                   end
                   br $while-continue|0
                  end
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store offset=4
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.load offset=24
                  local.tee $1
                  i32.store
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store offset=8
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.load offset=24
                  local.tee $2
                  i32.store offset=4
                  local.get $2
                  i32.load
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store offset=4
                  local.get $1
                  local.get $2
                  local.get $0
                  i32.load offset=60
                  i32.add
                  i32.store
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.load8_u offset=48
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=28
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=29
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=30
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=40
                  end
                  if
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1032
                   i32.store
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1031
                   i32.store
                  end
                  br $while-continue|0
                 end
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1025
                 i32.store
                 br $while-continue|0
                end
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 0
                i32.store8 offset=28
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 0
                i32.store8 offset=29
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 0
                i32.store8 offset=30
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store offset=8
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.load offset=24
                local.tee $1
                i32.store offset=4
                local.get $0
                local.get $1
                i32.load
                i32.store offset=44
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 1
                i32.store8 offset=28
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=48
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=28
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=29
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=30
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=40
                end
                if
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1034
                 i32.store
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1033
                 i32.store
                end
                br $while-continue|0
               end
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 1025
               i32.store
               br $while-continue|0
              end
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.const 1025
              i32.store
              br $while-continue|0
             end
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1025
             i32.store
             br $while-continue|0
            end
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 0
            i32.store8 offset=68
            i32.const 1584
            call $async-method-try/log
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=48
            if
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1038
             i32.store
            else
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1039
             i32.store
            end
            br $while-continue|0
           end
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.const 0
           i32.store8 offset=48
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store offset=8
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.load offset=52
           local.tee $1
           i32.store offset=4
           local.get $0
           local.get $1
           i32.store offset=64
           local.get $0
           local.get $1
           i32.const 0
           call $~lib/rt/itcms/__link
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store offset=8
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.load offset=64
           local.tee $1
           i32.store offset=4
           local.get $1
           call $~lib/string/String.__concat
           local.set $1
           global.get $~lib/memory/__stack_pointer
           local.get $1
           i32.store
           local.get $1
           call $async-method-try/log
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.load8_u offset=28
           if (result i32)
            i32.const 1
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=29
           end
           if (result i32)
            i32.const 1
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=30
           end
           if (result i32)
            i32.const 1
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=40
           end
           if
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 1035
            i32.store
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 1037
            i32.store
           end
           br $while-continue|0
          end
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=28
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=29
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=30
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const -1
          i32.store offset=44
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1
          i32.store8 offset=28
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1035
          i32.store
          br $while-continue|0
         end
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.load offset=56
         local.tee $1
         i32.store offset=4
         local.get $0
         local.get $1
         i32.store offset=12
         local.get $0
         local.get $1
         i32.const 0
         call $~lib/rt/itcms/__link
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.load offset=52
         local.tee $1
         i32.store offset=4
         br $folding-inner0
        end
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.load8_u offset=40
        if
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.const 1040
         i32.store
        else
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.const 1041
         i32.store
        end
        br $while-continue|0
       end
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 0
       i32.store8 offset=40
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=36
       local.tee $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=12
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=32
       local.tee $1
       i32.store offset=4
       br $folding-inner0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load8_u offset=28
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1042
       i32.store
      else
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1023
       i32.store
      end
      br $while-continue|0
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const 0
     i32.store8 offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     i32.load offset=44
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-method-try/__async_roots_Worker_guarded
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-method-try/__async_roots_Worker_guarded
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
     call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 1
     return
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   i32.const 1
   i32.const 2
   local.get $0
   i32.load
   i32.const -1
   i32.eq
   select
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const -2
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guarded
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guarded
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 2
 )
 (func $~lib/string/String.__concat (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1632
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1632
   i32.store
   i32.const 1628
   i32.load
   i32.const -2
   i32.and
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   block $__inlined_func$~lib/string/String#concat$696
    local.get $0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const -2
    i32.and
    local.tee $3
    local.get $2
    i32.add
    local.tee $1
    i32.eqz
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 1456
     local.set $1
     br $__inlined_func$~lib/string/String#concat$696
    end
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.const 2
    call $~lib/rt/itcms/__new
    local.tee $1
    i32.store offset=4
    local.get $1
    i32.const 1632
    local.get $2
    memory.copy
    local.get $1
    local.get $2
    i32.add
    local.get $0
    local.get $3
    memory.copy
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.add
    global.set $~lib/memory/__stack_pointer
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/rt/tlsf/searchBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if
   local.get $1
   i32.const 4
   i32.shr_u
   local.set $1
  else
   local.get $1
   i32.const 536870910
   i32.lt_u
   if
    local.get $1
    i32.const 1
    i32.const 27
    local.get $1
    i32.clz
    i32.sub
    i32.shl
    i32.add
    i32.const 1
    i32.sub
    local.set $1
   end
   local.get $1
   i32.const 31
   local.get $1
   i32.clz
   i32.sub
   local.tee $2
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
   local.set $1
   local.get $2
   i32.const 7
   i32.sub
   local.set $2
  end
  local.get $1
  i32.const 16
  i32.lt_u
  local.get $2
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 334
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const -1
  local.get $1
  i32.shl
  i32.and
  local.tee $1
  if (result i32)
   local.get $0
   local.get $1
   i32.ctz
   local.get $2
   i32.const 4
   i32.shl
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
  else
   local.get $0
   i32.load
   i32.const -1
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.tee $1
   if (result i32)
    local.get $0
    local.get $1
    i32.ctz
    local.tee $1
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.tee $2
    i32.eqz
    if
     i32.const 0
     i32.const 1392
     i32.const 347
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    local.get $2
    i32.ctz
    local.get $1
    i32.const 4
    i32.shl
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
   else
    i32.const 0
   end
  end
 )
 (func $~lib/rt/tlsf/initialize
  (local $0 i32)
  (local $1 i32)
  memory.size
  local.tee $1
  i32.const 0
  i32.le_s
  if (result i32)
   i32.const 1
   local.get $1
   i32.sub
   memory.grow
   i32.const 0
   i32.lt_s
  else
   i32.const 0
  end
  if
   unreachable
  end
  i32.const 34816
  i32.const 0
  i32.store
  i32.const 36384
  i32.const 0
  i32.store
  loop $for-loop|0
   local.get $0
   i32.const 23
   i32.lt_u
   if
    local.get $0
    i32.const 2
    i32.shl
    i32.const 34816
    i32.add
    i32.const 0
    i32.store offset=4
    i32.const 0
    local.set $1
    loop $for-loop|1
     local.get $1
     i32.const 16
     i32.lt_u
     if
      local.get $0
      i32.const 4
      i32.shl
      local.get $1
      i32.add
      i32.const 2
      i32.shl
      i32.const 34816
      i32.add
      i32.const 0
      i32.store offset=96
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|1
     end
    end
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  i32.const 34816
  i32.const 36388
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 34816
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/tlsf/addMemory (param $0 i32) (param $1 i32) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $2
  local.get $1
  i64.extend_i32_u
  i64.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 382
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.set $1
  local.get $0
  i32.load offset=1568
  local.tee $3
  if
   local.get $3
   i32.const 4
   i32.add
   local.get $1
   i32.gt_u
   if
    i32.const 0
    i32.const 1392
    i32.const 389
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $3
   local.get $1
   i32.const 16
   i32.sub
   local.tee $5
   i32.eq
   if
    local.get $3
    i32.load
    local.set $4
    local.get $5
    local.set $1
   end
  else
   local.get $0
   i32.const 1572
   i32.add
   local.get $1
   i32.gt_u
   if
    i32.const 0
    i32.const 1392
    i32.const 402
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $2
  i32.wrap_i64
  i32.const -16
  i32.and
  local.get $1
  i32.sub
  local.tee $3
  i32.const 20
  i32.lt_u
  if
   return
  end
  local.get $1
  local.get $4
  i32.const 2
  i32.and
  local.get $3
  i32.const 8
  i32.sub
  local.tee $3
  i32.const 1
  i32.or
  i32.or
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.add
  local.get $3
  i32.add
  local.tee $3
  i32.const 2
  i32.store
  local.get $0
  local.get $3
  i32.store offset=1568
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/itcms/visitRoots
  (local $0 i32)
  (local $1 i32)
  i32.const 1248
  call $~lib/rt/itcms/__visit
  i32.const 1488
  call $~lib/rt/itcms/__visit
  i32.const 1856
  call $~lib/rt/itcms/__visit
  i32.const 1056
  call $~lib/rt/itcms/__visit
  global.get $async-method-try/__async_roots_Worker_guarded
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-method-try/__async_roots_Worker_guardedFinally
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-method-try/__async_roots_Worker_helper
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-method-try/__async_roots_Worker_guardedNested
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $~lib/rt/itcms/pinSpace
  local.tee $1
  i32.load offset=4
  i32.const -4
  i32.and
  local.set $0
  loop $while-continue|0
   local.get $0
   local.get $1
   i32.ne
   if
    local.get $0
    i32.load offset=4
    i32.const 3
    i32.and
    i32.const 3
    i32.ne
    if
     i32.const 0
     i32.const 1120
     i32.const 160
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 20
    i32.add
    call $~lib/rt/__visit_members
    local.get $0
    i32.load offset=4
    i32.const -4
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
 )
 (func $async-method-try/__Cps_Worker_helper#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  loop $while-continue|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   block $case4|1
    block $case3|1
     block $case2|1
      block $case1|1
       local.get $0
       i32.load
       local.tee $1
       if
        local.get $1
        i32.const 1
        i32.eq
        br_if $case1|1
        local.get $1
        i32.const 1024
        i32.eq
        br_if $case2|1
        local.get $1
        i32.const 1025
        i32.eq
        br_if $case3|1
        br $case4|1
       end
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1024
       i32.store
       br $while-continue|0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 1025
      i32.store
      br $while-continue|0
     end
     call $async-method-try/getNumber
     drop
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const 1
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 0
     return
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $0
    i32.load offset=16
    i32.store offset=28
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    i32.load offset=20
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $1
    local.get $0
    i32.load offset=28
    i32.add
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-method-try/__async_roots_Worker_helper
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-method-try/__async_roots_Worker_helper
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
    call $~lib/array/Array<async-method-try/__Cps_Worker_helper>#splice
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 1
    return
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  i32.const 1
  i32.const 2
  local.get $0
  i32.load
  i32.const -1
  i32.eq
  select
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-method-try/__Cps_Worker_guarded~visit (param $0 i32)
  local.get $0
  i32.load offset=8
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=12
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=24
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=32
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=36
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=52
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=56
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=64
  call $~lib/rt/itcms/__visit
 )
 (func $async-method-try/Worker#helper (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 14
   call $~lib/rt/itcms/__new
   local.tee $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   call $~lib/object/Object#constructor
   local.tee $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 1456
   i32.store offset=8
   local.get $3
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=12
   local.get $3
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=24
   local.get $3
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   local.get $1
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $3
   local.get $0
   i32.store offset=24
   local.get $3
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   global.get $async-method-try/__async_roots_Worker_helper
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=8
   local.get $0
   local.get $3
   call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#push
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   call $async-method-try/__Cps_Worker_helper#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-method-try/Worker#guardedNested (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 76
   i32.const 12
   call $~lib/rt/itcms/__new
   local.tee $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   call $~lib/object/Object#constructor
   local.tee $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 1456
   i32.store offset=8
   local.get $3
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=12
   local.get $3
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=24
   local.get $3
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store8 offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store8 offset=29
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store8 offset=30
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 1456
   i32.store offset=32
   local.get $3
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=36
   local.get $3
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store8 offset=40
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=44
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store8 offset=48
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 1456
   i32.store offset=52
   local.get $3
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=56
   local.get $3
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=60
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 1456
   i32.store offset=64
   local.get $3
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store8 offset=68
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store offset=72
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   local.get $1
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $3
   local.get $0
   i32.store offset=24
   local.get $3
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   global.get $async-method-try/__async_roots_Worker_guardedNested
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=8
   local.get $0
   local.get $3
   call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#push
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   call $async-method-try/__Cps_Worker_guardedNested#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-method-try/Worker#guardedFinally (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 65
   i32.const 10
   call $~lib/rt/itcms/__new
   local.tee $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   call $~lib/object/Object#constructor
   local.tee $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1456
   i32.store offset=8
   local.get $2
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=12
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=24
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=29
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=30
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1456
   i32.store offset=32
   local.get $2
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=36
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=40
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=44
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=48
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1456
   i32.store offset=52
   local.get $2
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=56
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=60
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=64
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   local.get $1
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $2
   local.get $0
   i32.store offset=24
   local.get $2
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   global.get $async-method-try/__async_roots_Worker_guardedFinally
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $0
   local.get $2
   call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#push
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $async-method-try/__Cps_Worker_guardedFinally#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-method-try/Worker#guarded (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 69
   i32.const 7
   call $~lib/rt/itcms/__new
   local.tee $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   call $~lib/object/Object#constructor
   local.tee $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1456
   i32.store offset=8
   local.get $2
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=12
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=24
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=29
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=30
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1456
   i32.store offset=32
   local.get $2
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=36
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=40
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=44
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=48
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1456
   i32.store offset=52
   local.get $2
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=56
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=60
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1456
   i32.store offset=64
   local.get $2
   i32.const 1456
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=68
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   local.get $1
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $2
   local.get $0
   i32.store offset=24
   local.get $2
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   global.get $async-method-try/__async_roots_Worker_guarded
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $0
   local.get $2
   call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#push
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $async-method-try/__Cps_Worker_guarded#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~start
  (local $0 i32)
  (local $1 i32)
  memory.size
  i32.const 16
  i32.shl
  i32.const 34804
  i32.sub
  i32.const 1
  i32.shr_u
  global.set $~lib/rt/itcms/threshold
  i32.const 1172
  i32.const 1168
  i32.store
  i32.const 1176
  i32.const 1168
  i32.store
  i32.const 1168
  global.set $~lib/rt/itcms/pinSpace
  i32.const 1204
  i32.const 1200
  i32.store
  i32.const 1208
  i32.const 1200
  i32.store
  i32.const 1200
  global.set $~lib/rt/itcms/toSpace
  i32.const 1348
  i32.const 1344
  i32.store
  i32.const 1352
  i32.const 1344
  i32.store
  i32.const 1344
  global.set $~lib/rt/itcms/fromSpace
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 8
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 1
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   local.get $0
   local.get $1
   i32.store
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 32
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   global.set $async-method-try/__async_roots_Worker_guarded
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 11
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 1
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   local.get $0
   local.get $1
   i32.store
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 32
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   global.set $async-method-try/__async_roots_Worker_guardedFinally
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 13
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 1
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   local.get $0
   local.get $1
   i32.store
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 32
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   global.set $async-method-try/__async_roots_Worker_guardedNested
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 15
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 1
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   local.get $0
   local.get $1
   i32.store
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 32
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   global.set $async-method-try/__async_roots_Worker_helper
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/rt/itcms/step (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      global.get $~lib/rt/itcms/state
      br_table $case0|0 $case1|0 $case2|0 $break|0
     end
     i32.const 1
     global.set $~lib/rt/itcms/state
     i32.const 0
     global.set $~lib/rt/itcms/visitCount
     call $~lib/rt/itcms/visitRoots
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/iter
     global.get $~lib/rt/itcms/visitCount
     return
    end
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.set $1
    global.get $~lib/rt/itcms/iter
    i32.load offset=4
    i32.const -4
    i32.and
    local.set $0
    loop $while-continue|1
     local.get $0
     global.get $~lib/rt/itcms/toSpace
     i32.ne
     if
      local.get $0
      global.set $~lib/rt/itcms/iter
      local.get $1
      local.get $0
      i32.load offset=4
      local.tee $2
      i32.const 3
      i32.and
      i32.ne
      if
       local.get $0
       local.get $2
       i32.const -4
       i32.and
       local.get $1
       i32.or
       i32.store offset=4
       i32.const 0
       global.set $~lib/rt/itcms/visitCount
       local.get $0
       i32.const 20
       i32.add
       call $~lib/rt/__visit_members
       global.get $~lib/rt/itcms/visitCount
       return
      end
      local.get $0
      i32.load offset=4
      i32.const -4
      i32.and
      local.set $0
      br $while-continue|1
     end
    end
    i32.const 0
    global.set $~lib/rt/itcms/visitCount
    call $~lib/rt/itcms/visitRoots
    global.get $~lib/rt/itcms/toSpace
    global.get $~lib/rt/itcms/iter
    i32.load offset=4
    i32.const -4
    i32.and
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     local.set $0
     loop $while-continue|0
      local.get $0
      i32.const 34804
      i32.lt_u
      if
       local.get $0
       i32.load
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.const 4
       i32.add
       local.set $0
       br $while-continue|0
      end
     end
     global.get $~lib/rt/itcms/iter
     i32.load offset=4
     i32.const -4
     i32.and
     local.set $0
     loop $while-continue|2
      local.get $0
      global.get $~lib/rt/itcms/toSpace
      i32.ne
      if
       local.get $1
       local.get $0
       i32.load offset=4
       local.tee $2
       i32.const 3
       i32.and
       i32.ne
       if
        local.get $0
        local.get $2
        i32.const -4
        i32.and
        local.get $1
        i32.or
        i32.store offset=4
        local.get $0
        i32.const 20
        i32.add
        call $~lib/rt/__visit_members
       end
       local.get $0
       i32.load offset=4
       i32.const -4
       i32.and
       local.set $0
       br $while-continue|2
      end
     end
     global.get $~lib/rt/itcms/fromSpace
     local.set $0
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/fromSpace
     local.get $0
     global.set $~lib/rt/itcms/toSpace
     local.get $1
     global.set $~lib/rt/itcms/white
     local.get $0
     i32.load offset=4
     i32.const -4
     i32.and
     global.set $~lib/rt/itcms/iter
     i32.const 2
     global.set $~lib/rt/itcms/state
    end
    global.get $~lib/rt/itcms/visitCount
    return
   end
   global.get $~lib/rt/itcms/iter
   local.tee $0
   global.get $~lib/rt/itcms/toSpace
   i32.ne
   if
    local.get $0
    i32.load offset=4
    local.tee $1
    i32.const -4
    i32.and
    global.set $~lib/rt/itcms/iter
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.get $1
    i32.const 3
    i32.and
    i32.ne
    if
     i32.const 0
     i32.const 1120
     i32.const 229
     i32.const 20
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 34804
    i32.lt_u
    if
     local.get $0
     i32.const 0
     i32.store offset=4
     local.get $0
     i32.const 0
     i32.store offset=8
    else
     global.get $~lib/rt/itcms/total
     local.get $0
     i32.load
     i32.const -4
     i32.and
     i32.const 4
     i32.add
     i32.sub
     global.set $~lib/rt/itcms/total
     local.get $0
     i32.const 4
     i32.add
     local.tee $0
     i32.const 34804
     i32.ge_u
     if
      global.get $~lib/rt/tlsf/ROOT
      i32.eqz
      if
       call $~lib/rt/tlsf/initialize
      end
      global.get $~lib/rt/tlsf/ROOT
      local.get $0
      i32.const 4
      i32.sub
      local.set $2
      local.get $0
      i32.const 15
      i32.and
      i32.const 1
      local.get $0
      select
      if (result i32)
       i32.const 1
      else
       local.get $2
       i32.load
       i32.const 1
       i32.and
      end
      if
       i32.const 0
       i32.const 1392
       i32.const 562
       i32.const 3
       call $~lib/builtins/abort
       unreachable
      end
      local.get $2
      local.get $2
      i32.load
      i32.const 1
      i32.or
      i32.store
      local.get $2
      call $~lib/rt/tlsf/insertBlock
     end
    end
    i32.const 10
    return
   end
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   i32.store offset=4
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   i32.store offset=8
   i32.const 0
   global.set $~lib/rt/itcms/state
  end
  i32.const 0
 )
 (func $export:async-method-try/__async_async_method_try_Worker_helper_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-method-try/__Cps_Worker_helper#step
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_helper_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const -2
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-method-try/__async_roots_Worker_helper
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-method-try/__async_roots_Worker_helper
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
   call $~lib/array/Array<async-method-try/__Cps_Worker_helper>#splice
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 2
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_helper_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load
   i32.const 0
   i32.ge_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -2
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-method-try/__async_roots_Worker_helper
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-method-try/__async_roots_Worker_helper
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
    call $~lib/array/Array<async-method-try/__Cps_Worker_helper>#splice
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 2
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_helper_entry (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   call $async-method-try/Worker#helper
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guarded_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-method-try/__Cps_Worker_guarded#step
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guarded_reject_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 1
   i32.store8 offset=48
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=52
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-method-try/__Cps_Worker_guarded#step
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guarded_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load
   i32.const 0
   i32.ge_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -2
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-method-try/__async_roots_Worker_guarded
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-method-try/__async_roots_Worker_guarded
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
    call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#splice
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 2
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guarded_entry (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   call $async-method-try/Worker#guarded
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guardedNested_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-method-try/__Cps_Worker_guardedNested#step
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guardedNested_reject_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 1
   i32.store8 offset=48
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=52
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-method-try/__Cps_Worker_guardedNested#step
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guardedNested_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load
   i32.const 0
   i32.ge_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -2
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-method-try/__async_roots_Worker_guardedNested
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-method-try/__async_roots_Worker_guardedNested
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
    call $~lib/array/Array<async-method-try/__Cps_Worker_guardedNested>#splice
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 2
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guardedNested_pending_0 (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=72
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guardedNested_entry (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   call $async-method-try/Worker#guardedNested
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guardedFinally_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-method-try/__Cps_Worker_guardedFinally#step
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guardedFinally_reject_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 1
   i32.store8 offset=48
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=52
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-method-try/__Cps_Worker_guardedFinally#step
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guardedFinally_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load
   i32.const 0
   i32.ge_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -2
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-method-try/__async_roots_Worker_guardedFinally
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-method-try/__async_roots_Worker_guardedFinally
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#indexOf
    call $~lib/array/Array<async-method-try/__Cps_Worker_guardedFinally>#splice
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 2
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-method-try/__async_async_method_try_Worker_guardedFinally_entry (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2036
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $1
   call $async-method-try/Worker#guardedFinally
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 34832
  i32.const 34880
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-method-try/startGuardedNested (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  call $async-method-try/Worker#constructor
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 5
  call $async-method-try/Worker#guardedNested
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-method-try/startGuardedFinally (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  call $async-method-try/Worker#constructor
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $async-method-try/Worker#guardedFinally
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-method-try/startGuarded (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  call $async-method-try/Worker#constructor
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $async-method-try/Worker#guarded
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-method-try/rejectMessage (result i32)
  i32.const 1664
 )
 (func $async-method-try/__async_async_method_try_mint_string (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1776
  i32.store
  i32.const 1772
  i32.load
  i32.const 1
  i32.shr_u
  local.set $3
  local.get $0
  i32.const 0
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $3
   i64.extend_i32_s
   local.get $0
   i64.extend_i32_s
   i64.mul
   i64.const 268435456
   i64.gt_u
  end
  if
   i32.const 1488
   i32.const 1808
   i32.const 334
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  block $__inlined_func$~lib/string/String#repeat$79
   local.get $3
   i32.eqz
   local.get $0
   i32.eqz
   i32.or
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 1456
    local.set $1
    br $__inlined_func$~lib/string/String#repeat$79
   end
   local.get $0
   i32.const 1
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 1776
    local.set $1
    br $__inlined_func$~lib/string/String#repeat$79
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   local.get $3
   i32.mul
   i32.const 1
   i32.shl
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store offset=4
   local.get $3
   i32.const 1
   i32.shl
   local.tee $3
   local.get $0
   i32.mul
   local.set $0
   loop $while-continue|0
    local.get $0
    local.get $2
    i32.gt_u
    if
     local.get $1
     local.get $2
     i32.add
     i32.const 1776
     local.get $3
     memory.copy
     local.get $2
     local.get $3
     i32.add
     local.set $2
     br $while-continue|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
  end
  local.get $1
 )
 (func $async-method-try/__async_async_method_try_mint (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $async-method-try/__async_async_method_try_Worker_new (result i32)
  call $async-method-try/Worker#constructor
 )
 (func $async-method-try/__async_async_method_try_Worker_helper_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_helper
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#get:length
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 0
   return
  end
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_helper
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_helper
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-method-try/__async_async_method_try_Worker_guarded_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guarded
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#get:length
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 0
   return
  end
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guarded
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guarded
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-method-try/__async_async_method_try_Worker_guardedNested_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guardedNested
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#get:length
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 0
   return
  end
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guardedNested
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guardedNested
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-method-try/__async_async_method_try_Worker_guardedFinally_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2036
  i32.lt_s
  if
   i32.const 34832
   i32.const 34880
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guardedFinally
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#get:length
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 0
   return
  end
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guardedFinally
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-method-try/__async_roots_Worker_guardedFinally
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-method-try/__Cps_Worker_guarded>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
)
