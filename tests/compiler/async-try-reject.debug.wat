(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32)))
 (type $2 (func (param i32 i32) (result i32)))
 (type $3 (func (param i32)))
 (type $4 (func (result i32)))
 (type $5 (func (param i32 i32 i32) (result i32)))
 (type $6 (func))
 (type $7 (func (param i32 i32 i32 i32)))
 (type $8 (func (param i32 i32 i32)))
 (type $9 (func (param i32 i32 i64) (result i32)))
 (type $10 (func (param i32 i32 i32 i32) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "getChunk" (func $async-try-reject/getChunk (param i32) (result i32)))
 (import "env" "log" (func $async-try-reject/log (param i32)))
 (global $~lib/rt/itcms/total (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/threshold (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/state (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/visitCount (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/pinSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/iter (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/toSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/white (mut i32) (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Stub i32 (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Minimal i32 (i32.const 1))
 (global $~lib/shared/runtime/Runtime.Incremental i32 (i32.const 2))
 (global $~lib/rt/itcms/fromSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/native/ASC_LOW_MEMORY_LIMIT i32 (i32.const 0))
 (global $~lib/native/ASC_RUNTIME i32 (i32.const 2))
 (global $async-try-reject/__async_roots_f (mut i32) (i32.const 0))
 (global $async-try-reject/__async_roots_g (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 1040))
 (global $~lib/memory/__data_end i32 (i32.const 1088))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 33856))
 (global $~lib/memory/__heap_base i32 (i32.const 33856))
 (memory $0 1)
 (data $0 (i32.const 12) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $1 (i32.const 76) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $2 (i32.const 144) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $3 (i32.const 176) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $4 (i32.const 204) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00\00\00\00\00\00\00\00\00")
 (data $5 (i32.const 268) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s\00\00\00\00\00\00\00\00\00")
 (data $6 (i32.const 320) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $7 (i32.const 348) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $8 (i32.const 412) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $9 (i32.const 444) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data $10 (i32.const 492) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00")
 (data $11 (i32.const 540) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00o\00k\00-\00\00\00\00\00\00\00")
 (data $12 (i32.const 572) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0e\00\00\00f\00i\00n\00a\00l\00l\00y\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $13 (i32.const 620) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0c\00\00\00c\00a\00t\00c\00h\00:\00")
 (data $14 (i32.const 652) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0c\00\00\00c\00a\00u\00g\00h\00t\00")
 (data $15 (i32.const 684) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00A\00\00\00\00\00\00\00\00\00\00\00")
 (data $16 (i32.const 716) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00c\00o\00o\00r\00d\00-\00b\00o\00o\00m\00\00\00\00\00\00\00\00\00")
 (data $17 (i32.const 764) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $18 (i32.const 828) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00 \00\00\00\00\00\00\00\00\00\00\00")
 (data $19 (i32.const 860) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s\00")
 (data $20 (i32.const 908) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $21 (i32.const 1040) "\0b\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00\00\00\00\00\02A\00\00\02\t\00\00\00\00\00\00\02A\00\00")
 (table $0 1 1 funcref)
 (elem $0 (i32.const 1))
 (export "f" (func $async-try-reject/f))
 (export "g" (func $async-try-reject/g))
 (export "chunkString" (func $async-try-reject/chunkString))
 (export "rejectMessage" (func $async-try-reject/rejectMessage))
 (export "__async_async_try_reject_mint" (func $async-try-reject/__async_async_try_reject_mint))
 (export "__async_async_try_reject_mint_string" (func $async-try-reject/__async_async_try_reject_mint_string))
 (export "__async_async_try_reject_f_last_handle" (func $async-try-reject/__async_async_try_reject_f_last_handle))
 (export "__async_async_try_reject_g_last_handle" (func $async-try-reject/__async_async_try_reject_g_last_handle))
 (export "memory" (memory $0))
 (export "__async_async_try_reject_f_reclaim" (func $export:async-try-reject/__async_async_try_reject_f_reclaim))
 (export "__async_async_try_reject_f_resume_0" (func $export:async-try-reject/__async_async_try_reject_f_resume_0))
 (export "__async_async_try_reject_f_reject_0" (func $export:async-try-reject/__async_async_try_reject_f_reject_0))
 (export "__async_async_try_reject_f_result" (func $export:async-try-reject/__async_async_try_reject_f_result))
 (export "__async_async_try_reject_f_error" (func $export:async-try-reject/__async_async_try_reject_f_error))
 (export "__async_async_try_reject_f_errorValue" (func $export:async-try-reject/__async_async_try_reject_f_errorValue))
 (export "__async_async_try_reject_f_status" (func $export:async-try-reject/__async_async_try_reject_f_status))
 (export "__async_async_try_reject_g_reclaim" (func $export:async-try-reject/__async_async_try_reject_g_reclaim))
 (export "__async_async_try_reject_g_resume_0" (func $export:async-try-reject/__async_async_try_reject_g_resume_0))
 (export "__async_async_try_reject_g_reject_0" (func $export:async-try-reject/__async_async_try_reject_g_reject_0))
 (export "__async_async_try_reject_g_result" (func $export:async-try-reject/__async_async_try_reject_g_result))
 (export "__async_async_try_reject_g_error" (func $export:async-try-reject/__async_async_try_reject_g_error))
 (export "__async_async_try_reject_g_errorValue" (func $export:async-try-reject/__async_async_try_reject_g_errorValue))
 (export "__async_async_try_reject_g_status" (func $export:async-try-reject/__async_async_try_reject_g_status))
 (start $~start)
 (func $~lib/rt/itcms/Object#set:nextWithColor (param $this i32) (param $nextWithColor i32)
  local.get $this
  local.get $nextWithColor
  i32.store offset=4
 )
 (func $~lib/rt/itcms/Object#set:prev (param $this i32) (param $prev i32)
  local.get $this
  local.get $prev
  i32.store offset=8
 )
 (func $~lib/rt/itcms/initLazy (param $space i32) (result i32)
  local.get $space
  local.get $space
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $space
  local.get $space
  call $~lib/rt/itcms/Object#set:prev
  local.get $space
  return
 )
 (func $~lib/rt/itcms/Object#get:nextWithColor (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/rt/itcms/Object#get:next (param $this i32) (result i32)
  local.get $this
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  return
 )
 (func $~lib/rt/itcms/Object#get:color (param $this i32) (result i32)
  local.get $this
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.and
  return
 )
 (func $~lib/rt/itcms/visitRoots (param $cookie i32)
  (local $pn i32)
  (local $iter i32)
  local.get $cookie
  call $~lib/rt/__visit_globals
  global.get $~lib/rt/itcms/pinSpace
  local.set $pn
  local.get $pn
  call $~lib/rt/itcms/Object#get:next
  local.set $iter
  loop $while-continue|0
   local.get $iter
   local.get $pn
   i32.ne
   if
    i32.const 1
    drop
    local.get $iter
    call $~lib/rt/itcms/Object#get:color
    i32.const 3
    i32.eq
    i32.eqz
    if
     i32.const 0
     i32.const 96
     i32.const 160
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $iter
    i32.const 20
    i32.add
    local.get $cookie
    call $~lib/rt/__visit_members
    local.get $iter
    call $~lib/rt/itcms/Object#get:next
    local.set $iter
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/itcms/Object#set:color (param $this i32) (param $color i32)
  local.get $this
  local.get $this
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $color
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
 )
 (func $~lib/rt/itcms/Object#get:prev (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/rt/itcms/Object#set:next (param $this i32) (param $obj i32)
  local.get $this
  local.get $obj
  local.get $this
  call $~lib/rt/itcms/Object#get:nextWithColor
  i32.const 3
  i32.and
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
 )
 (func $~lib/rt/itcms/Object#unlink (param $this i32)
  (local $next i32)
  (local $prev i32)
  local.get $this
  call $~lib/rt/itcms/Object#get:next
  local.set $next
  local.get $next
  i32.const 0
  i32.eq
  if
   i32.const 1
   drop
   local.get $this
   call $~lib/rt/itcms/Object#get:prev
   i32.const 0
   i32.eq
   if (result i32)
    local.get $this
    global.get $~lib/memory/__heap_base
    i32.lt_u
   else
    i32.const 0
   end
   i32.eqz
   if
    i32.const 0
    i32.const 96
    i32.const 128
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   return
  end
  local.get $this
  call $~lib/rt/itcms/Object#get:prev
  local.set $prev
  i32.const 1
  drop
  local.get $prev
  i32.eqz
  if
   i32.const 0
   i32.const 96
   i32.const 132
   i32.const 16
   call $~lib/builtins/abort
   unreachable
  end
  local.get $next
  local.get $prev
  call $~lib/rt/itcms/Object#set:prev
  local.get $prev
  local.get $next
  call $~lib/rt/itcms/Object#set:next
 )
 (func $~lib/rt/itcms/Object#get:rtId (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/shared/typeinfo/Typeinfo#get:flags (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/__typeinfo (param $id i32) (result i32)
  (local $ptr i32)
  global.get $~lib/rt/__rtti_base
  local.set $ptr
  local.get $id
  local.get $ptr
  i32.load
  i32.gt_u
  if
   i32.const 224
   i32.const 288
   i32.const 21
   i32.const 28
   call $~lib/builtins/abort
   unreachable
  end
  local.get $ptr
  i32.const 4
  i32.add
  local.get $id
  i32.const 4
  i32.mul
  i32.add
  call $~lib/shared/typeinfo/Typeinfo#get:flags
  return
 )
 (func $~lib/rt/itcms/Object#get:isPointerfree (param $this i32) (result i32)
  (local $rtId i32)
  local.get $this
  call $~lib/rt/itcms/Object#get:rtId
  local.set $rtId
  local.get $rtId
  i32.const 2
  i32.le_u
  if (result i32)
   i32.const 1
  else
   local.get $rtId
   call $~lib/rt/__typeinfo
   i32.const 32
   i32.and
   i32.const 0
   i32.ne
  end
  return
 )
 (func $~lib/rt/itcms/Object#linkTo (param $this i32) (param $list i32) (param $withColor i32)
  (local $prev i32)
  local.get $list
  call $~lib/rt/itcms/Object#get:prev
  local.set $prev
  local.get $this
  local.get $list
  local.get $withColor
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $this
  local.get $prev
  call $~lib/rt/itcms/Object#set:prev
  local.get $prev
  local.get $this
  call $~lib/rt/itcms/Object#set:next
  local.get $list
  local.get $this
  call $~lib/rt/itcms/Object#set:prev
 )
 (func $~lib/rt/itcms/Object#makeGray (param $this i32)
  (local $1 i32)
  local.get $this
  global.get $~lib/rt/itcms/iter
  i32.eq
  if
   local.get $this
   call $~lib/rt/itcms/Object#get:prev
   local.tee $1
   i32.eqz
   if (result i32)
    i32.const 0
    i32.const 96
    i32.const 148
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   else
    local.get $1
   end
   global.set $~lib/rt/itcms/iter
  end
  local.get $this
  call $~lib/rt/itcms/Object#unlink
  local.get $this
  global.get $~lib/rt/itcms/toSpace
  local.get $this
  call $~lib/rt/itcms/Object#get:isPointerfree
  if (result i32)
   global.get $~lib/rt/itcms/white
   i32.eqz
  else
   i32.const 2
  end
  call $~lib/rt/itcms/Object#linkTo
 )
 (func $~lib/rt/itcms/__visit (param $ptr i32) (param $cookie i32)
  (local $obj i32)
  local.get $ptr
  i32.eqz
  if
   return
  end
  local.get $ptr
  i32.const 20
  i32.sub
  local.set $obj
  i32.const 0
  drop
  local.get $obj
  call $~lib/rt/itcms/Object#get:color
  global.get $~lib/rt/itcms/white
  i32.eq
  if
   local.get $obj
   call $~lib/rt/itcms/Object#makeGray
   global.get $~lib/rt/itcms/visitCount
   i32.const 1
   i32.add
   global.set $~lib/rt/itcms/visitCount
  end
 )
 (func $~lib/rt/itcms/visitStack (param $cookie i32)
  (local $ptr i32)
  global.get $~lib/memory/__stack_pointer
  local.set $ptr
  loop $while-continue|0
   local.get $ptr
   global.get $~lib/memory/__heap_base
   i32.lt_u
   if
    local.get $ptr
    i32.load
    local.get $cookie
    call $~lib/rt/itcms/__visit
    local.get $ptr
    i32.const 4
    i32.add
    local.set $ptr
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/common/BLOCK#get:mmInfo (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/itcms/Object#get:size (param $this i32) (result i32)
  i32.const 4
  local.get $this
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.add
  return
 )
 (func $~lib/rt/tlsf/Root#set:flMap (param $this i32) (param $flMap i32)
  local.get $this
  local.get $flMap
  i32.store
 )
 (func $~lib/rt/common/BLOCK#set:mmInfo (param $this i32) (param $mmInfo i32)
  local.get $this
  local.get $mmInfo
  i32.store
 )
 (func $~lib/rt/tlsf/Block#set:prev (param $this i32) (param $prev i32)
  local.get $this
  local.get $prev
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/Block#set:next (param $this i32) (param $next i32)
  local.get $this
  local.get $next
  i32.store offset=8
 )
 (func $~lib/rt/tlsf/Block#get:prev (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/rt/tlsf/Block#get:next (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/rt/tlsf/Root#get:flMap (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/tlsf/removeBlock (param $root i32) (param $block i32)
  (local $blockInfo i32)
  (local $size i32)
  (local $fl i32)
  (local $sl i32)
  (local $6 i32)
  (local $7 i32)
  (local $boundedSize i32)
  (local $prev i32)
  (local $next i32)
  (local $root|11 i32)
  (local $fl|12 i32)
  (local $sl|13 i32)
  (local $root|14 i32)
  (local $fl|15 i32)
  (local $sl|16 i32)
  (local $head i32)
  (local $root|18 i32)
  (local $fl|19 i32)
  (local $slMap i32)
  (local $root|21 i32)
  (local $fl|22 i32)
  (local $slMap|23 i32)
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $blockInfo
  i32.const 1
  drop
  local.get $blockInfo
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 268
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $blockInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $size
  i32.const 1
  drop
  local.get $size
  i32.const 12
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 270
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $size
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $fl
   local.get $size
   i32.const 4
   i32.shr_u
   local.set $sl
  else
   local.get $size
   local.tee $6
   i32.const 1073741820
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_u
   select
   local.set $boundedSize
   i32.const 31
   local.get $boundedSize
   i32.clz
   i32.sub
   local.set $fl
   local.get $boundedSize
   local.get $fl
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $sl
   local.get $fl
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $fl
  end
  i32.const 1
  drop
  local.get $fl
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $sl
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 284
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $block
  call $~lib/rt/tlsf/Block#get:prev
  local.set $prev
  local.get $block
  call $~lib/rt/tlsf/Block#get:next
  local.set $next
  local.get $prev
  if
   local.get $prev
   local.get $next
   call $~lib/rt/tlsf/Block#set:next
  end
  local.get $next
  if
   local.get $next
   local.get $prev
   call $~lib/rt/tlsf/Block#set:prev
  end
  local.get $block
  block $~lib/rt/tlsf/GETHEAD|inlined.0 (result i32)
   local.get $root
   local.set $root|11
   local.get $fl
   local.set $fl|12
   local.get $sl
   local.set $sl|13
   local.get $root|11
   local.get $fl|12
   i32.const 4
   i32.shl
   local.get $sl|13
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
   br $~lib/rt/tlsf/GETHEAD|inlined.0
  end
  i32.eq
  if
   local.get $root
   local.set $root|14
   local.get $fl
   local.set $fl|15
   local.get $sl
   local.set $sl|16
   local.get $next
   local.set $head
   local.get $root|14
   local.get $fl|15
   i32.const 4
   i32.shl
   local.get $sl|16
   i32.add
   i32.const 2
   i32.shl
   i32.add
   local.get $head
   i32.store offset=96
   local.get $next
   i32.eqz
   if
    block $~lib/rt/tlsf/GETSL|inlined.0 (result i32)
     local.get $root
     local.set $root|18
     local.get $fl
     local.set $fl|19
     local.get $root|18
     local.get $fl|19
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
     br $~lib/rt/tlsf/GETSL|inlined.0
    end
    local.set $slMap
    local.get $root
    local.set $root|21
    local.get $fl
    local.set $fl|22
    local.get $slMap
    i32.const 1
    local.get $sl
    i32.shl
    i32.const -1
    i32.xor
    i32.and
    local.tee $slMap
    local.set $slMap|23
    local.get $root|21
    local.get $fl|22
    i32.const 2
    i32.shl
    i32.add
    local.get $slMap|23
    i32.store offset=4
    local.get $slMap
    i32.eqz
    if
     local.get $root
     local.get $root
     call $~lib/rt/tlsf/Root#get:flMap
     i32.const 1
     local.get $fl
     i32.shl
     i32.const -1
     i32.xor
     i32.and
     call $~lib/rt/tlsf/Root#set:flMap
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $root i32) (param $block i32)
  (local $blockInfo i32)
  (local $block|3 i32)
  (local $right i32)
  (local $rightInfo i32)
  (local $block|6 i32)
  (local $block|7 i32)
  (local $left i32)
  (local $leftInfo i32)
  (local $size i32)
  (local $fl i32)
  (local $sl i32)
  (local $13 i32)
  (local $14 i32)
  (local $boundedSize i32)
  (local $root|16 i32)
  (local $fl|17 i32)
  (local $sl|18 i32)
  (local $head i32)
  (local $root|20 i32)
  (local $fl|21 i32)
  (local $sl|22 i32)
  (local $head|23 i32)
  (local $root|24 i32)
  (local $fl|25 i32)
  (local $root|26 i32)
  (local $fl|27 i32)
  (local $slMap i32)
  i32.const 1
  drop
  local.get $block
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 201
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $blockInfo
  i32.const 1
  drop
  local.get $blockInfo
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 203
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETRIGHT|inlined.0 (result i32)
   local.get $block
   local.set $block|3
   local.get $block|3
   i32.const 4
   i32.add
   local.get $block|3
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   br $~lib/rt/tlsf/GETRIGHT|inlined.0
  end
  local.set $right
  local.get $right
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $rightInfo
  local.get $rightInfo
  i32.const 1
  i32.and
  if
   local.get $root
   local.get $right
   call $~lib/rt/tlsf/removeBlock
   local.get $block
   local.get $blockInfo
   i32.const 4
   i32.add
   local.get $rightInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.tee $blockInfo
   call $~lib/rt/common/BLOCK#set:mmInfo
   block $~lib/rt/tlsf/GETRIGHT|inlined.1 (result i32)
    local.get $block
    local.set $block|6
    local.get $block|6
    i32.const 4
    i32.add
    local.get $block|6
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.1
   end
   local.set $right
   local.get $right
   call $~lib/rt/common/BLOCK#get:mmInfo
   local.set $rightInfo
  end
  local.get $blockInfo
  i32.const 2
  i32.and
  if
   block $~lib/rt/tlsf/GETFREELEFT|inlined.0 (result i32)
    local.get $block
    local.set $block|7
    local.get $block|7
    i32.const 4
    i32.sub
    i32.load
    br $~lib/rt/tlsf/GETFREELEFT|inlined.0
   end
   local.set $left
   local.get $left
   call $~lib/rt/common/BLOCK#get:mmInfo
   local.set $leftInfo
   i32.const 1
   drop
   local.get $leftInfo
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 368
    i32.const 221
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $root
   local.get $left
   call $~lib/rt/tlsf/removeBlock
   local.get $left
   local.set $block
   local.get $block
   local.get $leftInfo
   i32.const 4
   i32.add
   local.get $blockInfo
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.tee $blockInfo
   call $~lib/rt/common/BLOCK#set:mmInfo
  end
  local.get $right
  local.get $rightInfo
  i32.const 2
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $blockInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $size
  i32.const 1
  drop
  local.get $size
  i32.const 12
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 233
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 1
  drop
  local.get $block
  i32.const 4
  i32.add
  local.get $size
  i32.add
  local.get $right
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 234
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $right
  i32.const 4
  i32.sub
  local.get $block
  i32.store
  local.get $size
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $fl
   local.get $size
   i32.const 4
   i32.shr_u
   local.set $sl
  else
   local.get $size
   local.tee $13
   i32.const 1073741820
   local.tee $14
   local.get $13
   local.get $14
   i32.lt_u
   select
   local.set $boundedSize
   i32.const 31
   local.get $boundedSize
   i32.clz
   i32.sub
   local.set $fl
   local.get $boundedSize
   local.get $fl
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $sl
   local.get $fl
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $fl
  end
  i32.const 1
  drop
  local.get $fl
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $sl
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 251
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETHEAD|inlined.1 (result i32)
   local.get $root
   local.set $root|16
   local.get $fl
   local.set $fl|17
   local.get $sl
   local.set $sl|18
   local.get $root|16
   local.get $fl|17
   i32.const 4
   i32.shl
   local.get $sl|18
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
   br $~lib/rt/tlsf/GETHEAD|inlined.1
  end
  local.set $head
  local.get $block
  i32.const 0
  call $~lib/rt/tlsf/Block#set:prev
  local.get $block
  local.get $head
  call $~lib/rt/tlsf/Block#set:next
  local.get $head
  if
   local.get $head
   local.get $block
   call $~lib/rt/tlsf/Block#set:prev
  end
  local.get $root
  local.set $root|20
  local.get $fl
  local.set $fl|21
  local.get $sl
  local.set $sl|22
  local.get $block
  local.set $head|23
  local.get $root|20
  local.get $fl|21
  i32.const 4
  i32.shl
  local.get $sl|22
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $head|23
  i32.store offset=96
  local.get $root
  local.get $root
  call $~lib/rt/tlsf/Root#get:flMap
  i32.const 1
  local.get $fl
  i32.shl
  i32.or
  call $~lib/rt/tlsf/Root#set:flMap
  local.get $root
  local.set $root|26
  local.get $fl
  local.set $fl|27
  block $~lib/rt/tlsf/GETSL|inlined.1 (result i32)
   local.get $root
   local.set $root|24
   local.get $fl
   local.set $fl|25
   local.get $root|24
   local.get $fl|25
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=4
   br $~lib/rt/tlsf/GETSL|inlined.1
  end
  i32.const 1
  local.get $sl
  i32.shl
  i32.or
  local.set $slMap
  local.get $root|26
  local.get $fl|27
  i32.const 2
  i32.shl
  i32.add
  local.get $slMap
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $root i32) (param $start i32) (param $endU64 i64) (result i32)
  (local $end i32)
  (local $root|4 i32)
  (local $tail i32)
  (local $tailInfo i32)
  (local $size i32)
  (local $leftSize i32)
  (local $left i32)
  (local $root|10 i32)
  (local $tail|11 i32)
  local.get $endU64
  i32.wrap_i64
  local.set $end
  i32.const 1
  drop
  local.get $start
  i64.extend_i32_u
  local.get $endU64
  i64.le_u
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 382
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $start
  i32.const 4
  i32.add
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  i32.const 4
  i32.sub
  local.set $start
  local.get $end
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $end
  block $~lib/rt/tlsf/GETTAIL|inlined.0 (result i32)
   local.get $root
   local.set $root|4
   local.get $root|4
   i32.load offset=1568
   br $~lib/rt/tlsf/GETTAIL|inlined.0
  end
  local.set $tail
  i32.const 0
  local.set $tailInfo
  local.get $tail
  if
   i32.const 1
   drop
   local.get $start
   local.get $tail
   i32.const 4
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 368
    i32.const 389
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $start
   i32.const 16
   i32.sub
   local.get $tail
   i32.eq
   if
    local.get $start
    i32.const 16
    i32.sub
    local.set $start
    local.get $tail
    call $~lib/rt/common/BLOCK#get:mmInfo
    local.set $tailInfo
   else
   end
  else
   i32.const 1
   drop
   local.get $start
   local.get $root
   i32.const 1572
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 368
    i32.const 402
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $end
  local.get $start
  i32.sub
  local.set $size
  local.get $size
  i32.const 4
  i32.const 12
  i32.add
  i32.const 4
  i32.add
  i32.lt_u
  if
   i32.const 0
   return
  end
  local.get $size
  i32.const 2
  i32.const 4
  i32.mul
  i32.sub
  local.set $leftSize
  local.get $start
  local.set $left
  local.get $left
  local.get $leftSize
  i32.const 1
  i32.or
  local.get $tailInfo
  i32.const 2
  i32.and
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $left
  i32.const 0
  call $~lib/rt/tlsf/Block#set:prev
  local.get $left
  i32.const 0
  call $~lib/rt/tlsf/Block#set:next
  local.get $start
  i32.const 4
  i32.add
  local.get $leftSize
  i32.add
  local.set $tail
  local.get $tail
  i32.const 0
  i32.const 2
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $root
  local.set $root|10
  local.get $tail
  local.set $tail|11
  local.get $root|10
  local.get $tail|11
  i32.store offset=1568
  local.get $root
  local.get $left
  call $~lib/rt/tlsf/insertBlock
  i32.const 1
  return
 )
 (func $~lib/rt/tlsf/initialize
  (local $rootOffset i32)
  (local $pagesBefore i32)
  (local $pagesNeeded i32)
  (local $root i32)
  (local $root|4 i32)
  (local $tail i32)
  (local $fl i32)
  (local $root|7 i32)
  (local $fl|8 i32)
  (local $slMap i32)
  (local $sl i32)
  (local $root|11 i32)
  (local $fl|12 i32)
  (local $sl|13 i32)
  (local $head i32)
  (local $memStart i32)
  i32.const 0
  drop
  global.get $~lib/memory/__heap_base
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $rootOffset
  memory.size
  local.set $pagesBefore
  local.get $rootOffset
  i32.const 1572
  i32.add
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $pagesNeeded
  local.get $pagesNeeded
  local.get $pagesBefore
  i32.gt_s
  if (result i32)
   local.get $pagesNeeded
   local.get $pagesBefore
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
  local.get $rootOffset
  local.set $root
  local.get $root
  i32.const 0
  call $~lib/rt/tlsf/Root#set:flMap
  local.get $root
  local.set $root|4
  i32.const 0
  local.set $tail
  local.get $root|4
  local.get $tail
  i32.store offset=1568
  i32.const 0
  local.set $fl
  loop $for-loop|0
   local.get $fl
   i32.const 23
   i32.lt_u
   if
    local.get $root
    local.set $root|7
    local.get $fl
    local.set $fl|8
    i32.const 0
    local.set $slMap
    local.get $root|7
    local.get $fl|8
    i32.const 2
    i32.shl
    i32.add
    local.get $slMap
    i32.store offset=4
    i32.const 0
    local.set $sl
    loop $for-loop|1
     local.get $sl
     i32.const 16
     i32.lt_u
     if
      local.get $root
      local.set $root|11
      local.get $fl
      local.set $fl|12
      local.get $sl
      local.set $sl|13
      i32.const 0
      local.set $head
      local.get $root|11
      local.get $fl|12
      i32.const 4
      i32.shl
      local.get $sl|13
      i32.add
      i32.const 2
      i32.shl
      i32.add
      local.get $head
      i32.store offset=96
      local.get $sl
      i32.const 1
      i32.add
      local.set $sl
      br $for-loop|1
     end
    end
    local.get $fl
    i32.const 1
    i32.add
    local.set $fl
    br $for-loop|0
   end
  end
  local.get $rootOffset
  i32.const 1572
  i32.add
  local.set $memStart
  i32.const 0
  drop
  local.get $root
  local.get $memStart
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  drop
  local.get $root
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/tlsf/checkUsedBlock (param $ptr i32) (result i32)
  (local $block i32)
  local.get $ptr
  i32.const 4
  i32.sub
  local.set $block
  local.get $ptr
  i32.const 0
  i32.ne
  if (result i32)
   local.get $ptr
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $block
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 1
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 562
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $block
  return
 )
 (func $~lib/rt/tlsf/freeBlock (param $root i32) (param $block i32)
  i32.const 0
  drop
  local.get $block
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 1
  i32.or
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $root
  local.get $block
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/__free (param $ptr i32)
  local.get $ptr
  global.get $~lib/memory/__heap_base
  i32.lt_u
  if
   return
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $ptr
  call $~lib/rt/tlsf/checkUsedBlock
  call $~lib/rt/tlsf/freeBlock
 )
 (func $~lib/rt/itcms/free (param $obj i32)
  local.get $obj
  global.get $~lib/memory/__heap_base
  i32.lt_u
  if
   local.get $obj
   i32.const 0
   call $~lib/rt/itcms/Object#set:nextWithColor
   local.get $obj
   i32.const 0
   call $~lib/rt/itcms/Object#set:prev
  else
   global.get $~lib/rt/itcms/total
   local.get $obj
   call $~lib/rt/itcms/Object#get:size
   i32.sub
   global.set $~lib/rt/itcms/total
   i32.const 0
   drop
   local.get $obj
   i32.const 4
   i32.add
   call $~lib/rt/tlsf/__free
  end
 )
 (func $~lib/rt/itcms/step (result i32)
  (local $obj i32)
  (local $1 i32)
  (local $black i32)
  (local $from i32)
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      global.get $~lib/rt/itcms/state
      local.set $1
      local.get $1
      i32.const 0
      i32.eq
      br_if $case0|0
      local.get $1
      i32.const 1
      i32.eq
      br_if $case1|0
      local.get $1
      i32.const 2
      i32.eq
      br_if $case2|0
      br $break|0
     end
     i32.const 1
     global.set $~lib/rt/itcms/state
     i32.const 0
     global.set $~lib/rt/itcms/visitCount
     i32.const 0
     call $~lib/rt/itcms/visitRoots
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/iter
     global.get $~lib/rt/itcms/visitCount
     i32.const 1
     i32.mul
     return
    end
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.set $black
    global.get $~lib/rt/itcms/iter
    call $~lib/rt/itcms/Object#get:next
    local.set $obj
    loop $while-continue|1
     local.get $obj
     global.get $~lib/rt/itcms/toSpace
     i32.ne
     if
      local.get $obj
      global.set $~lib/rt/itcms/iter
      local.get $obj
      call $~lib/rt/itcms/Object#get:color
      local.get $black
      i32.ne
      if
       local.get $obj
       local.get $black
       call $~lib/rt/itcms/Object#set:color
       i32.const 0
       global.set $~lib/rt/itcms/visitCount
       local.get $obj
       i32.const 20
       i32.add
       i32.const 0
       call $~lib/rt/__visit_members
       global.get $~lib/rt/itcms/visitCount
       i32.const 1
       i32.mul
       return
      end
      local.get $obj
      call $~lib/rt/itcms/Object#get:next
      local.set $obj
      br $while-continue|1
     end
    end
    i32.const 0
    global.set $~lib/rt/itcms/visitCount
    i32.const 0
    call $~lib/rt/itcms/visitRoots
    global.get $~lib/rt/itcms/iter
    call $~lib/rt/itcms/Object#get:next
    local.set $obj
    local.get $obj
    global.get $~lib/rt/itcms/toSpace
    i32.eq
    if
     i32.const 0
     call $~lib/rt/itcms/visitStack
     global.get $~lib/rt/itcms/iter
     call $~lib/rt/itcms/Object#get:next
     local.set $obj
     loop $while-continue|2
      local.get $obj
      global.get $~lib/rt/itcms/toSpace
      i32.ne
      if
       local.get $obj
       call $~lib/rt/itcms/Object#get:color
       local.get $black
       i32.ne
       if
        local.get $obj
        local.get $black
        call $~lib/rt/itcms/Object#set:color
        local.get $obj
        i32.const 20
        i32.add
        i32.const 0
        call $~lib/rt/__visit_members
       end
       local.get $obj
       call $~lib/rt/itcms/Object#get:next
       local.set $obj
       br $while-continue|2
      end
     end
     global.get $~lib/rt/itcms/fromSpace
     local.set $from
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/fromSpace
     local.get $from
     global.set $~lib/rt/itcms/toSpace
     local.get $black
     global.set $~lib/rt/itcms/white
     local.get $from
     call $~lib/rt/itcms/Object#get:next
     global.set $~lib/rt/itcms/iter
     i32.const 2
     global.set $~lib/rt/itcms/state
    end
    global.get $~lib/rt/itcms/visitCount
    i32.const 1
    i32.mul
    return
   end
   global.get $~lib/rt/itcms/iter
   local.set $obj
   local.get $obj
   global.get $~lib/rt/itcms/toSpace
   i32.ne
   if
    local.get $obj
    call $~lib/rt/itcms/Object#get:next
    global.set $~lib/rt/itcms/iter
    i32.const 1
    drop
    local.get $obj
    call $~lib/rt/itcms/Object#get:color
    global.get $~lib/rt/itcms/white
    i32.eqz
    i32.eq
    i32.eqz
    if
     i32.const 0
     i32.const 96
     i32.const 229
     i32.const 20
     call $~lib/builtins/abort
     unreachable
    end
    local.get $obj
    call $~lib/rt/itcms/free
    i32.const 10
    return
   end
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   call $~lib/rt/itcms/Object#set:nextWithColor
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   call $~lib/rt/itcms/Object#set:prev
   i32.const 0
   global.set $~lib/rt/itcms/state
   br $break|0
  end
  i32.const 0
  return
 )
 (func $~lib/rt/itcms/interrupt
  (local $budget i32)
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1024
  i32.const 200
  i32.mul
  i32.const 100
  i32.div_u
  local.set $budget
  loop $do-loop|0
   local.get $budget
   call $~lib/rt/itcms/step
   i32.sub
   local.set $budget
   global.get $~lib/rt/itcms/state
   i32.const 0
   i32.eq
   if
    i32.const 0
    drop
    i32.const 200
    i32.const 100
    i32.rem_u
    i32.const 0
    i32.eq
    drop
    global.get $~lib/rt/itcms/total
    i32.const 200
    i32.const 100
    i32.div_u
    i32.mul
    i32.const 1024
    i32.add
    global.set $~lib/rt/itcms/threshold
    i32.const 0
    drop
    return
   end
   local.get $budget
   i32.const 0
   i32.gt_s
   br_if $do-loop|0
  end
  i32.const 0
  drop
  global.get $~lib/rt/itcms/total
  i32.const 1024
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.sub
  i32.const 1024
  i32.lt_u
  i32.mul
  i32.add
  global.set $~lib/rt/itcms/threshold
  i32.const 0
  drop
 )
 (func $~lib/rt/tlsf/computeSize (param $size i32) (result i32)
  local.get $size
  i32.const 12
  i32.le_u
  if (result i32)
   i32.const 12
  else
   local.get $size
   i32.const 4
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   i32.const 4
   i32.sub
  end
  return
 )
 (func $~lib/rt/tlsf/prepareSize (param $size i32) (result i32)
  local.get $size
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 32
   i32.const 368
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $size
  call $~lib/rt/tlsf/computeSize
  return
 )
 (func $~lib/rt/tlsf/roundSize (param $size i32) (result i32)
  local.get $size
  i32.const 536870910
  i32.lt_u
  if (result i32)
   local.get $size
   i32.const 1
   i32.const 27
   local.get $size
   i32.clz
   i32.sub
   i32.shl
   i32.add
   i32.const 1
   i32.sub
  else
   local.get $size
  end
  return
 )
 (func $~lib/rt/tlsf/searchBlock (param $root i32) (param $size i32) (result i32)
  (local $fl i32)
  (local $sl i32)
  (local $requestSize i32)
  (local $root|5 i32)
  (local $fl|6 i32)
  (local $slMap i32)
  (local $head i32)
  (local $flMap i32)
  (local $root|10 i32)
  (local $fl|11 i32)
  (local $root|12 i32)
  (local $fl|13 i32)
  (local $sl|14 i32)
  (local $root|15 i32)
  (local $fl|16 i32)
  (local $sl|17 i32)
  local.get $size
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $fl
   local.get $size
   i32.const 4
   i32.shr_u
   local.set $sl
  else
   local.get $size
   call $~lib/rt/tlsf/roundSize
   local.set $requestSize
   i32.const 4
   i32.const 8
   i32.mul
   i32.const 1
   i32.sub
   local.get $requestSize
   i32.clz
   i32.sub
   local.set $fl
   local.get $requestSize
   local.get $fl
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $sl
   local.get $fl
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $fl
  end
  i32.const 1
  drop
  local.get $fl
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $sl
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 334
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETSL|inlined.2 (result i32)
   local.get $root
   local.set $root|5
   local.get $fl
   local.set $fl|6
   local.get $root|5
   local.get $fl|6
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=4
   br $~lib/rt/tlsf/GETSL|inlined.2
  end
  i32.const 0
  i32.const -1
  i32.xor
  local.get $sl
  i32.shl
  i32.and
  local.set $slMap
  i32.const 0
  local.set $head
  local.get $slMap
  i32.eqz
  if
   local.get $root
   call $~lib/rt/tlsf/Root#get:flMap
   i32.const 0
   i32.const -1
   i32.xor
   local.get $fl
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.set $flMap
   local.get $flMap
   i32.eqz
   if
    i32.const 0
    local.set $head
   else
    local.get $flMap
    i32.ctz
    local.set $fl
    block $~lib/rt/tlsf/GETSL|inlined.3 (result i32)
     local.get $root
     local.set $root|10
     local.get $fl
     local.set $fl|11
     local.get $root|10
     local.get $fl|11
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
     br $~lib/rt/tlsf/GETSL|inlined.3
    end
    local.set $slMap
    i32.const 1
    drop
    local.get $slMap
    i32.eqz
    if
     i32.const 0
     i32.const 368
     i32.const 347
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    block $~lib/rt/tlsf/GETHEAD|inlined.2 (result i32)
     local.get $root
     local.set $root|12
     local.get $fl
     local.set $fl|13
     local.get $slMap
     i32.ctz
     local.set $sl|14
     local.get $root|12
     local.get $fl|13
     i32.const 4
     i32.shl
     local.get $sl|14
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=96
     br $~lib/rt/tlsf/GETHEAD|inlined.2
    end
    local.set $head
   end
  else
   block $~lib/rt/tlsf/GETHEAD|inlined.3 (result i32)
    local.get $root
    local.set $root|15
    local.get $fl
    local.set $fl|16
    local.get $slMap
    i32.ctz
    local.set $sl|17
    local.get $root|15
    local.get $fl|16
    i32.const 4
    i32.shl
    local.get $sl|17
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
    br $~lib/rt/tlsf/GETHEAD|inlined.3
   end
   local.set $head
  end
  local.get $head
  return
 )
 (func $~lib/rt/tlsf/growMemory (param $root i32) (param $size i32)
  (local $pagesBefore i32)
  (local $root|3 i32)
  (local $pagesNeeded i32)
  (local $5 i32)
  (local $6 i32)
  (local $pagesWanted i32)
  (local $pagesAfter i32)
  i32.const 0
  drop
  local.get $size
  i32.const 256
  i32.ge_u
  if
   local.get $size
   call $~lib/rt/tlsf/roundSize
   local.set $size
  end
  memory.size
  local.set $pagesBefore
  local.get $size
  i32.const 4
  local.get $pagesBefore
  i32.const 16
  i32.shl
  i32.const 4
  i32.sub
  block $~lib/rt/tlsf/GETTAIL|inlined.1 (result i32)
   local.get $root
   local.set $root|3
   local.get $root|3
   i32.load offset=1568
   br $~lib/rt/tlsf/GETTAIL|inlined.1
  end
  i32.ne
  i32.shl
  i32.add
  local.set $size
  local.get $size
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $pagesNeeded
  local.get $pagesBefore
  local.tee $5
  local.get $pagesNeeded
  local.tee $6
  local.get $5
  local.get $6
  i32.gt_s
  select
  local.set $pagesWanted
  local.get $pagesWanted
  memory.grow
  i32.const 0
  i32.lt_s
  if
   local.get $pagesNeeded
   memory.grow
   i32.const 0
   i32.lt_s
   if
    unreachable
   end
  end
  memory.size
  local.set $pagesAfter
  local.get $root
  local.get $pagesBefore
  i32.const 16
  i32.shl
  local.get $pagesAfter
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  drop
 )
 (func $~lib/rt/tlsf/prepareBlock (param $root i32) (param $block i32) (param $size i32)
  (local $blockInfo i32)
  (local $remaining i32)
  (local $spare i32)
  (local $block|6 i32)
  (local $block|7 i32)
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $blockInfo
  i32.const 1
  drop
  local.get $size
  i32.const 4
  i32.add
  i32.const 15
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 361
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $blockInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $size
  i32.sub
  local.set $remaining
  local.get $remaining
  i32.const 4
  i32.const 12
  i32.add
  i32.ge_u
  if
   local.get $block
   local.get $size
   local.get $blockInfo
   i32.const 2
   i32.and
   i32.or
   call $~lib/rt/common/BLOCK#set:mmInfo
   local.get $block
   i32.const 4
   i32.add
   local.get $size
   i32.add
   local.set $spare
   local.get $spare
   local.get $remaining
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   call $~lib/rt/common/BLOCK#set:mmInfo
   local.get $root
   local.get $spare
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $block
   local.get $blockInfo
   i32.const 1
   i32.const -1
   i32.xor
   i32.and
   call $~lib/rt/common/BLOCK#set:mmInfo
   block $~lib/rt/tlsf/GETRIGHT|inlined.3 (result i32)
    local.get $block
    local.set $block|7
    local.get $block|7
    i32.const 4
    i32.add
    local.get $block|7
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.3
   end
   block $~lib/rt/tlsf/GETRIGHT|inlined.2 (result i32)
    local.get $block
    local.set $block|6
    local.get $block|6
    i32.const 4
    i32.add
    local.get $block|6
    call $~lib/rt/common/BLOCK#get:mmInfo
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    br $~lib/rt/tlsf/GETRIGHT|inlined.2
   end
   call $~lib/rt/common/BLOCK#get:mmInfo
   i32.const 2
   i32.const -1
   i32.xor
   i32.and
   call $~lib/rt/common/BLOCK#set:mmInfo
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (param $root i32) (param $size i32) (result i32)
  (local $payloadSize i32)
  (local $block i32)
  local.get $size
  call $~lib/rt/tlsf/prepareSize
  local.set $payloadSize
  local.get $root
  local.get $payloadSize
  call $~lib/rt/tlsf/searchBlock
  local.set $block
  local.get $block
  i32.eqz
  if
   local.get $root
   local.get $payloadSize
   call $~lib/rt/tlsf/growMemory
   local.get $root
   local.get $payloadSize
   call $~lib/rt/tlsf/searchBlock
   local.set $block
   i32.const 1
   drop
   local.get $block
   i32.eqz
   if
    i32.const 0
    i32.const 368
    i32.const 499
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
  end
  i32.const 1
  drop
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $payloadSize
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 368
   i32.const 501
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $root
  local.get $block
  call $~lib/rt/tlsf/removeBlock
  local.get $root
  local.get $block
  local.get $payloadSize
  call $~lib/rt/tlsf/prepareBlock
  i32.const 0
  drop
  local.get $block
  return
 )
 (func $~lib/rt/tlsf/__alloc (param $size i32) (result i32)
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $size
  call $~lib/rt/tlsf/allocateBlock
  i32.const 4
  i32.add
  return
 )
 (func $~lib/rt/itcms/Object#set:rtId (param $this i32) (param $rtId i32)
  local.get $this
  local.get $rtId
  i32.store offset=12
 )
 (func $~lib/rt/itcms/Object#set:rtSize (param $this i32) (param $rtSize i32)
  local.get $this
  local.get $rtSize
  i32.store offset=16
 )
 (func $~lib/rt/itcms/__new (param $size i32) (param $id i32) (result i32)
  (local $obj i32)
  (local $ptr i32)
  local.get $size
  i32.const 1073741804
  i32.ge_u
  if
   i32.const 32
   i32.const 96
   i32.const 261
   i32.const 31
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.ge_u
  if
   call $~lib/rt/itcms/interrupt
  end
  i32.const 16
  local.get $size
  i32.add
  call $~lib/rt/tlsf/__alloc
  i32.const 4
  i32.sub
  local.set $obj
  local.get $obj
  local.get $id
  call $~lib/rt/itcms/Object#set:rtId
  local.get $obj
  local.get $size
  call $~lib/rt/itcms/Object#set:rtSize
  local.get $obj
  global.get $~lib/rt/itcms/fromSpace
  global.get $~lib/rt/itcms/white
  call $~lib/rt/itcms/Object#linkTo
  global.get $~lib/rt/itcms/total
  local.get $obj
  call $~lib/rt/itcms/Object#get:size
  i32.add
  global.set $~lib/rt/itcms/total
  local.get $obj
  i32.const 20
  i32.add
  local.set $ptr
  local.get $ptr
  i32.const 0
  local.get $size
  memory.fill
  local.get $ptr
  return
 )
 (func $async-try-reject/__Cps_f#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $~lib/rt/itcms/__link (param $parentPtr i32) (param $childPtr i32) (param $expectMultiple i32)
  (local $child i32)
  (local $parent i32)
  (local $parentColor i32)
  local.get $childPtr
  i32.eqz
  if
   return
  end
  i32.const 1
  drop
  local.get $parentPtr
  i32.eqz
  if
   i32.const 0
   i32.const 96
   i32.const 295
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $childPtr
  i32.const 20
  i32.sub
  local.set $child
  local.get $child
  call $~lib/rt/itcms/Object#get:color
  global.get $~lib/rt/itcms/white
  i32.eq
  if
   local.get $parentPtr
   i32.const 20
   i32.sub
   local.set $parent
   local.get $parent
   call $~lib/rt/itcms/Object#get:color
   local.set $parentColor
   local.get $parentColor
   global.get $~lib/rt/itcms/white
   i32.eqz
   i32.eq
   if
    local.get $expectMultiple
    if
     local.get $parent
     call $~lib/rt/itcms/Object#makeGray
    else
     local.get $child
     call $~lib/rt/itcms/Object#makeGray
    end
   else
    local.get $parentColor
    i32.const 3
    i32.eq
    if (result i32)
     global.get $~lib/rt/itcms/state
     i32.const 1
     i32.eq
    else
     i32.const 0
    end
    if
     local.get $child
     call $~lib/rt/itcms/Object#makeGray
    end
   end
  end
 )
 (func $async-try-reject/__Cps_f#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__pend0 (param $this i32) (param $__pend0 i32)
  local.get $this
  local.get $__pend0
  i32.store offset=16
  local.get $this
  local.get $__pend0
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__cps_mode_0 (param $this i32) (param $__cps_mode_0 i32)
  local.get $this
  local.get $__cps_mode_0
  i32.store offset=20
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_ret_0_1 (param $this i32) (param $__cps___async_try_ret_0_1 i32)
  local.get $this
  local.get $__cps___async_try_ret_0_1
  i32.store8 offset=24
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_brk_1_2 (param $this i32) (param $__cps___async_try_brk_1_2 i32)
  local.get $this
  local.get $__cps___async_try_brk_1_2
  i32.store8 offset=25
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_cnt_2_3 (param $this i32) (param $__cps___async_try_cnt_2_3 i32)
  local.get $this
  local.get $__cps___async_try_cnt_2_3
  i32.store8 offset=26
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_pendErr_3_4 (param $this i32) (param $__cps___async_try_pendErr_3_4 i32)
  local.get $this
  local.get $__cps___async_try_pendErr_3_4
  i32.store offset=28
  local.get $this
  local.get $__cps___async_try_pendErr_3_4
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_pendVal_4_5 (param $this i32) (param $__cps___async_try_pendVal_4_5 i32)
  local.get $this
  local.get $__cps___async_try_pendVal_4_5
  i32.store offset=32
  local.get $this
  local.get $__cps___async_try_pendVal_4_5
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_pendFail_5_6 (param $this i32) (param $__cps___async_try_pendFail_5_6 i32)
  local.get $this
  local.get $__cps___async_try_pendFail_5_6
  i32.store8 offset=36
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_retVal_6_7 (param $this i32) (param $__cps___async_try_retVal_6_7 i32)
  local.get $this
  local.get $__cps___async_try_retVal_6_7
  i32.store offset=40
  local.get $this
  local.get $__cps___async_try_retVal_6_7
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_flag_9_8 (param $this i32) (param $__cps___async_try_flag_9_8 i32)
  local.get $this
  local.get $__cps___async_try_flag_9_8
  i32.store8 offset=44
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_err_7_9 (param $this i32) (param $__cps___async_try_err_7_9 i32)
  local.get $this
  local.get $__cps___async_try_err_7_9
  i32.store offset=48
  local.get $this
  local.get $__cps___async_try_err_7_9
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_errVal_8_10 (param $this i32) (param $__cps___async_try_errVal_8_10 i32)
  local.get $this
  local.get $__cps___async_try_errVal_8_10
  i32.store offset=52
  local.get $this
  local.get $__cps___async_try_errVal_8_10
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__cps_c_11 (param $this i32) (param $__cps_c_11 i32)
  local.get $this
  local.get $__cps_c_11
  i32.store offset=56
  local.get $this
  local.get $__cps_c_11
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__cps_e_12 (param $this i32) (param $__cps_e_12 i32)
  local.get $this
  local.get $__cps_e_12
  i32.store offset=60
  local.get $this
  local.get $__cps_e_12
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_f#set:__cps___async_try_fin_10_13 (param $this i32) (param $__cps___async_try_fin_10_13 i32)
  local.get $this
  local.get $__cps___async_try_fin_10_13
  i32.store8 offset=64
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/itcms/Object#get:rtSize (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/rt/itcms/__renew (param $oldPtr i32) (param $size i32) (result i32)
  (local $oldObj i32)
  (local $newPtr i32)
  (local $4 i32)
  (local $5 i32)
  local.get $oldPtr
  i32.const 20
  i32.sub
  local.set $oldObj
  local.get $size
  local.get $oldObj
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.sub
  i32.le_u
  if
   local.get $oldObj
   local.get $size
   call $~lib/rt/itcms/Object#set:rtSize
   local.get $oldPtr
   return
  end
  local.get $size
  local.get $oldObj
  call $~lib/rt/itcms/Object#get:rtId
  call $~lib/rt/itcms/__new
  local.set $newPtr
  local.get $newPtr
  local.get $oldPtr
  local.get $size
  local.tee $4
  local.get $oldObj
  call $~lib/rt/itcms/Object#get:rtSize
  local.tee $5
  local.get $4
  local.get $5
  i32.lt_u
  select
  memory.copy
  local.get $newPtr
  return
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-try-reject/__Cps_f#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-try-reject/__Cps_f#get:__cps___async_try_flag_9_8 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=44
 )
 (func $async-try-reject/__Cps_f#get:__pend0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $async-try-reject/__Cps_f#get:__cps___async_try_ret_0_1 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=24
 )
 (func $async-try-reject/__Cps_f#get:__cps___async_try_brk_1_2 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=25
 )
 (func $async-try-reject/__Cps_f#get:__cps___async_try_cnt_2_3 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=26
 )
 (func $async-try-reject/__Cps_f#get:__cps___async_try_pendFail_5_6 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=36
 )
 (func $async-try-reject/__Cps_f#get:__cps_c_11 (param $this i32) (result i32)
  local.get $this
  i32.load offset=56
 )
 (func $~lib/rt/common/OBJECT#get:rtSize (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/string/String#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 1
  i32.shr_u
  return
 )
 (func $async-try-reject/__Cps_f#get:__cps___async_try_err_7_9 (param $this i32) (result i32)
  local.get $this
  i32.load offset=48
 )
 (func $async-try-reject/__Cps_f#get:__cps_e_12 (param $this i32) (result i32)
  local.get $this
  i32.load offset=60
 )
 (func $async-try-reject/__Cps_f#get:__cps___async_try_errVal_8_10 (param $this i32) (result i32)
  local.get $this
  i32.load offset=52
 )
 (func $~lib/rt/__newBuffer (param $size i32) (param $id i32) (param $data i32) (result i32)
  (local $buffer i32)
  local.get $size
  local.get $id
  call $~lib/rt/itcms/__new
  local.set $buffer
  local.get $data
  if
   local.get $buffer
   local.get $data
   local.get $size
   memory.copy
  end
  local.get $buffer
  return
 )
 (func $async-try-reject/__Cps_f#get:__cps___async_try_pendVal_4_5 (param $this i32) (result i32)
  local.get $this
  i32.load offset=32
 )
 (func $async-try-reject/__Cps_f#get:__cps___async_try_pendErr_3_4 (param $this i32) (result i32)
  local.get $this
  i32.load offset=28
 )
 (func $async-try-reject/__Cps_f#get:__cps___async_try_retVal_6_7 (param $this i32) (result i32)
  local.get $this
  i32.load offset=40
 )
 (func $async-try-reject/__Cps_g#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-try-reject/__Cps_g#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_g#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_g#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_g#set:__pend0 (param $this i32) (param $__pend0 i32)
  local.get $this
  local.get $__pend0
  i32.store offset=16
  local.get $this
  local.get $__pend0
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_g#set:__cps_mode_0 (param $this i32) (param $__cps_mode_0 i32)
  local.get $this
  local.get $__cps_mode_0
  i32.store offset=20
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_ret_0_1 (param $this i32) (param $__cps___async_try_ret_0_1 i32)
  local.get $this
  local.get $__cps___async_try_ret_0_1
  i32.store8 offset=24
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_brk_1_2 (param $this i32) (param $__cps___async_try_brk_1_2 i32)
  local.get $this
  local.get $__cps___async_try_brk_1_2
  i32.store8 offset=25
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_cnt_2_3 (param $this i32) (param $__cps___async_try_cnt_2_3 i32)
  local.get $this
  local.get $__cps___async_try_cnt_2_3
  i32.store8 offset=26
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_pendErr_3_4 (param $this i32) (param $__cps___async_try_pendErr_3_4 i32)
  local.get $this
  local.get $__cps___async_try_pendErr_3_4
  i32.store offset=28
  local.get $this
  local.get $__cps___async_try_pendErr_3_4
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_pendVal_4_5 (param $this i32) (param $__cps___async_try_pendVal_4_5 i32)
  local.get $this
  local.get $__cps___async_try_pendVal_4_5
  i32.store offset=32
  local.get $this
  local.get $__cps___async_try_pendVal_4_5
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_pendFail_5_6 (param $this i32) (param $__cps___async_try_pendFail_5_6 i32)
  local.get $this
  local.get $__cps___async_try_pendFail_5_6
  i32.store8 offset=36
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_retVal_6_7 (param $this i32) (param $__cps___async_try_retVal_6_7 i32)
  local.get $this
  local.get $__cps___async_try_retVal_6_7
  i32.store offset=40
  local.get $this
  local.get $__cps___async_try_retVal_6_7
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_flag_9_8 (param $this i32) (param $__cps___async_try_flag_9_8 i32)
  local.get $this
  local.get $__cps___async_try_flag_9_8
  i32.store8 offset=44
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_err_7_9 (param $this i32) (param $__cps___async_try_err_7_9 i32)
  local.get $this
  local.get $__cps___async_try_err_7_9
  i32.store offset=48
  local.get $this
  local.get $__cps___async_try_err_7_9
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_errVal_8_10 (param $this i32) (param $__cps___async_try_errVal_8_10 i32)
  local.get $this
  local.get $__cps___async_try_errVal_8_10
  i32.store offset=52
  local.get $this
  local.get $__cps___async_try_errVal_8_10
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_g#set:__cps_c_11 (param $this i32) (param $__cps_c_11 i32)
  local.get $this
  local.get $__cps_c_11
  i32.store offset=56
  local.get $this
  local.get $__cps_c_11
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-try-reject/__Cps_g#set:__cps___async_try_fin_10_12 (param $this i32) (param $__cps___async_try_fin_10_12 i32)
  local.get $this
  local.get $__cps___async_try_fin_10_12
  i32.store8 offset=60
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-try-reject/__Cps_g#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-try-reject/__Cps_g#get:__cps___async_try_flag_9_8 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=44
 )
 (func $async-try-reject/__Cps_g#get:__pend0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $async-try-reject/__Cps_g#get:__cps___async_try_ret_0_1 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=24
 )
 (func $async-try-reject/__Cps_g#get:__cps___async_try_brk_1_2 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=25
 )
 (func $async-try-reject/__Cps_g#get:__cps___async_try_cnt_2_3 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=26
 )
 (func $async-try-reject/__Cps_g#get:__cps___async_try_pendFail_5_6 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=36
 )
 (func $async-try-reject/__Cps_g#get:__cps_c_11 (param $this i32) (result i32)
  local.get $this
  i32.load offset=56
 )
 (func $async-try-reject/__Cps_g#get:__cps___async_try_errVal_8_10 (param $this i32) (result i32)
  local.get $this
  i32.load offset=52
 )
 (func $async-try-reject/__Cps_g#get:__cps___async_try_err_7_9 (param $this i32) (result i32)
  local.get $this
  i32.load offset=48
 )
 (func $async-try-reject/__Cps_g#get:__cps___async_try_pendVal_4_5 (param $this i32) (result i32)
  local.get $this
  i32.load offset=32
 )
 (func $async-try-reject/__Cps_g#get:__cps___async_try_pendErr_3_4 (param $this i32) (result i32)
  local.get $this
  i32.load offset=28
 )
 (func $async-try-reject/__Cps_g#get:__cps___async_try_retVal_6_7 (param $this i32) (result i32)
  local.get $this
  i32.load offset=40
 )
 (func $async-try-reject/chunkString (param $i i32) (result i32)
  i32.const 704
  return
 )
 (func $async-try-reject/rejectMessage (result i32)
  i32.const 736
  return
 )
 (func $async-try-reject/__async_async_try_reject_mint (result i32)
  i32.const 0
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  return
 )
 (func $~lib/memory/memory.repeat (param $dst i32) (param $src i32) (param $srcLength i32) (param $count i32)
  (local $index i32)
  (local $total i32)
  i32.const 0
  local.set $index
  local.get $srcLength
  local.get $count
  i32.mul
  local.set $total
  loop $while-continue|0
   local.get $index
   local.get $total
   i32.lt_u
   if
    local.get $dst
    local.get $index
    i32.add
    local.get $src
    local.get $srcLength
    memory.copy
    local.get $index
    local.get $srcLength
    i32.add
    local.set $index
    br $while-continue|0
   end
  end
 )
 (func $async-try-reject/__async_async_try_reject_mint_string (param $len i32) (result i32)
  i32.const 848
  local.get $len
  call $~lib/string/String#repeat
  return
 )
 (func $async-try-reject/__Cps_f#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-try-reject/__Cps_f#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-try-reject/__Cps_f#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-try-reject/__Cps_g#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-try-reject/__Cps_g#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-try-reject/__Cps_g#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/rt/__visit_globals (param $0 i32)
  (local $1 i32)
  i32.const 224
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 464
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 928
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 32
  local.get $0
  call $~lib/rt/itcms/__visit
  global.get $async-try-reject/__async_roots_f
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-try-reject/__async_roots_g
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
 )
 (func $~lib/arraybuffer/ArrayBufferView~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/object/Object~visit (param $0 i32) (param $1 i32)
 )
 (func $~lib/error/Error~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $async-try-reject/__Cps_f~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=12
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=16
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=28
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=32
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=40
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=48
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=52
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=56
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=60
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-try-reject/__Cps_f>#__visit
 )
 (func $~lib/array/Array<i32>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<i32>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<i32>#__visit
 )
 (func $async-try-reject/__Cps_g~visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=12
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=16
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=28
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=32
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=40
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=48
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=52
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=56
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-try-reject/__Cps_g>#__visit
 )
 (func $~lib/rt/__visit_members (param $0 i32) (param $1 i32)
  block $invalid
   block $~lib/array/Array<async-try-reject/__Cps_g>
    block $async-try-reject/__Cps_g
     block $~lib/array/Array<i32>
      block $~lib/array/Array<async-try-reject/__Cps_f>
       block $async-try-reject/__Cps_f
        block $~lib/error/Error
         block $~lib/promise/Promise<~lib/string/String>
          block $~lib/arraybuffer/ArrayBufferView
           block $~lib/string/String
            block $~lib/arraybuffer/ArrayBuffer
             block $~lib/object/Object
              local.get $0
              i32.const 8
              i32.sub
              i32.load
              br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $~lib/promise/Promise<~lib/string/String> $~lib/error/Error $async-try-reject/__Cps_f $~lib/array/Array<async-try-reject/__Cps_f> $~lib/array/Array<i32> $async-try-reject/__Cps_g $~lib/array/Array<async-try-reject/__Cps_g> $invalid
             end
             return
            end
            return
           end
           return
          end
          local.get $0
          local.get $1
          call $~lib/arraybuffer/ArrayBufferView~visit
          return
         end
         return
        end
        local.get $0
        local.get $1
        call $~lib/error/Error~visit
        return
       end
       local.get $0
       local.get $1
       call $async-try-reject/__Cps_f~visit
       return
      end
      local.get $0
      local.get $1
      call $~lib/array/Array<async-try-reject/__Cps_f>~visit
      return
     end
     local.get $0
     local.get $1
     call $~lib/array/Array<i32>~visit
     return
    end
    local.get $0
    local.get $1
    call $async-try-reject/__Cps_g~visit
    return
   end
   local.get $0
   local.get $1
   call $~lib/array/Array<async-try-reject/__Cps_g>~visit
   return
  end
  unreachable
 )
 (func $~start
  memory.size
  i32.const 16
  i32.shl
  global.get $~lib/memory/__heap_base
  i32.sub
  i32.const 1
  i32.shr_u
  global.set $~lib/rt/itcms/threshold
  i32.const 144
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/pinSpace
  i32.const 176
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/toSpace
  i32.const 320
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/fromSpace
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_f>#constructor
  global.set $async-try-reject/__async_roots_f
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_g>#constructor
  global.set $async-try-reject/__async_roots_g
 )
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__data_end
  i32.lt_s
  if
   i32.const 33888
   i32.const 33936
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $async-try-reject/__Cps_f#constructor (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 65
   i32.const 6
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $~lib/object/Object#constructor
  local.tee $this
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_f#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_f#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_f#set:__pend0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:__cps_mode_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:__cps___async_try_ret_0_1
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:__cps___async_try_brk_1_2
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:__cps___async_try_cnt_2_3
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_f#set:__cps___async_try_pendErr_3_4
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:__cps___async_try_pendVal_4_5
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:__cps___async_try_pendFail_5_6
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_f#set:__cps___async_try_retVal_6_7
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:__cps___async_try_flag_9_8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_f#set:__cps___async_try_err_7_9
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:__cps___async_try_errVal_8_10
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_f#set:__cps_c_11
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_f#set:__cps_e_12
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_f#set:__cps___async_try_fin_10_13
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 7
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_f>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_f>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_f>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_f>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 464
   i32.const 512
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  global.get $~lib/memory/__stack_pointer
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $buffer
  i32.store offset=8
  i32.const 2
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=12
  local.get $6
  call $~lib/array/Array<async-try-reject/__Cps_f>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-try-reject/__Cps_f>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-try-reject/__Cps_f>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-try-reject/__Cps_f>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/ensureCapacity (param $array i32) (param $newSize i32) (param $alignLog2 i32) (param $canGrow i32)
  (local $oldCapacity i32)
  (local $oldData i32)
  (local $6 i32)
  (local $7 i32)
  (local $newCapacity i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $newData i32)
  (local $14 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $array
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.get $14
  i32.store
  local.get $14
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  local.set $oldCapacity
  local.get $newSize
  local.get $oldCapacity
  local.get $alignLog2
  i32.shr_u
  i32.gt_u
  if
   local.get $newSize
   i32.const 1073741820
   local.get $alignLog2
   i32.shr_u
   i32.gt_u
   if
    i32.const 464
    i32.const 512
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   local.get $array
   local.set $14
   global.get $~lib/memory/__stack_pointer
   local.get $14
   i32.store
   local.get $14
   call $~lib/arraybuffer/ArrayBufferView#get:buffer
   local.set $oldData
   local.get $newSize
   local.tee $6
   i32.const 8
   local.tee $7
   local.get $6
   local.get $7
   i32.gt_u
   select
   local.get $alignLog2
   i32.shl
   local.set $newCapacity
   local.get $canGrow
   if
    local.get $oldCapacity
    i32.const 1
    i32.shl
    local.tee $9
    i32.const 1073741820
    local.tee $10
    local.get $9
    local.get $10
    i32.lt_u
    select
    local.tee $11
    local.get $newCapacity
    local.tee $12
    local.get $11
    local.get $12
    i32.gt_u
    select
    local.set $newCapacity
   end
   local.get $oldData
   local.get $newCapacity
   call $~lib/rt/itcms/__renew
   local.set $newData
   i32.const 2
   global.get $~lib/shared/runtime/Runtime.Incremental
   i32.ne
   drop
   local.get $newData
   local.get $oldData
   i32.ne
   if
    local.get $array
    local.get $newData
    i32.store
    local.get $array
    local.get $newData
    i32.store offset=4
    local.get $array
    local.get $newData
    i32.const 0
    call $~lib/rt/itcms/__link
   end
   local.get $array
   local.get $newCapacity
   i32.store offset=8
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/itcms/__link
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $len
  call $~lib/array/Array<async-try-reject/__Cps_f>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/string/String#concat (param $this i32) (param $other i32) (result i32)
  (local $thisSize i32)
  (local $otherSize i32)
  (local $outSize i32)
  (local $out i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $thisSize
  local.get $other
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $otherSize
  local.get $thisSize
  local.get $otherSize
  i32.add
  local.set $outSize
  local.get $outSize
  i32.const 0
  i32.eq
  if
   i32.const 432
   local.set $6
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $6
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $outSize
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $out
  i32.store offset=4
  local.get $out
  local.get $this
  local.get $thisSize
  memory.copy
  local.get $out
  local.get $thisSize
  i32.add
  local.get $other
  local.get $otherSize
  memory.copy
  local.get $out
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
  return
 )
 (func $~lib/string/String.__concat (param $left i32) (param $right i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $left
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $right
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $~lib/string/String#concat
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
  (local $len i32)
  (local $4 i32)
  (local $5 i32)
  (local $ptr i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:length_
  local.set $len
  local.get $len
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1
  else
   local.get $fromIndex
   local.get $len
   i32.ge_s
  end
  if
   i32.const -1
   local.set $7
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $7
   return
  end
  local.get $fromIndex
  i32.const 0
  i32.lt_s
  if
   local.get $len
   local.get $fromIndex
   i32.add
   local.tee $4
   i32.const 0
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   local.set $fromIndex
  end
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:dataStart
  local.set $ptr
  loop $while-continue|0
   local.get $fromIndex
   local.get $len
   i32.lt_s
   if
    local.get $ptr
    local.get $fromIndex
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $value
    i32.eq
    if
     local.get $fromIndex
     local.set $7
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $7
     return
    end
    local.get $fromIndex
    i32.const 1
    i32.add
    local.set $fromIndex
    br $while-continue|0
   end
  end
  i32.const -1
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
  (local $len i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $result i32)
  (local $resultStart i32)
  (local $thisStart i32)
  (local $thisBase i32)
  (local $offset i32)
  (local $17 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:length_
  local.set $len
  local.get $start
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $len
   local.get $start
   i32.add
   local.tee $4
   i32.const 0
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
  else
   local.get $start
   local.tee $6
   local.get $len
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
  end
  local.set $start
  local.get $deleteCount
  local.tee $8
  local.get $len
  local.get $start
  i32.sub
  local.tee $9
  local.get $8
  local.get $9
  i32.lt_s
  select
  local.tee $10
  i32.const 0
  local.tee $11
  local.get $10
  local.get $11
  i32.gt_s
  select
  local.set $deleteCount
  global.get $~lib/memory/__stack_pointer
  local.get $deleteCount
  i32.const 2
  i32.const 7
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $result
  i32.store offset=4
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:dataStart
  local.set $thisStart
  local.get $thisStart
  local.get $start
  i32.const 2
  i32.shl
  i32.add
  local.set $thisBase
  local.get $resultStart
  local.get $thisBase
  local.get $deleteCount
  i32.const 2
  i32.shl
  memory.copy
  local.get $start
  local.get $deleteCount
  i32.add
  local.set $offset
  local.get $len
  local.get $offset
  i32.ne
  if
   local.get $thisBase
   local.get $thisStart
   local.get $offset
   i32.const 2
   i32.shl
   i32.add
   local.get $len
   local.get $offset
   i32.sub
   i32.const 2
   i32.shl
   memory.copy
  end
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  local.get $len
  local.get $deleteCount
  i32.sub
  call $~lib/array/Array<async-try-reject/__Cps_f>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-try-reject/__Cps_f#step (param $this i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  loop $while-continue|0
   i32.const 1
   if
    block $break|1
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
                        block $case0|1
                         local.get $this
                         local.set $2
                         global.get $~lib/memory/__stack_pointer
                         local.get $2
                         i32.store
                         local.get $2
                         call $async-try-reject/__Cps_f#get:state
                         local.set $1
                         local.get $1
                         i32.const 0
                         i32.eq
                         br_if $case0|1
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
                         br $case19|1
                        end
                        local.get $this
                        local.set $2
                        global.get $~lib/memory/__stack_pointer
                        local.get $2
                        i32.store
                        local.get $2
                        i32.const 1024
                        call $async-try-reject/__Cps_f#set:state
                        br $break|1
                       end
                       local.get $this
                       local.set $2
                       global.get $~lib/memory/__stack_pointer
                       local.get $2
                       i32.store
                       local.get $2
                       i32.const 1028
                       call $async-try-reject/__Cps_f#set:state
                       br $break|1
                      end
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 0
                      call $async-try-reject/__Cps_f#set:__cps___async_try_ret_0_1
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 0
                      call $async-try-reject/__Cps_f#set:__cps___async_try_brk_1_2
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 0
                      call $async-try-reject/__Cps_f#set:__cps___async_try_cnt_2_3
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 432
                      call $async-try-reject/__Cps_f#set:__cps___async_try_pendErr_3_4
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 0
                      call $async-try-reject/__Cps_f#set:__cps___async_try_pendFail_5_6
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 0
                      call $async-try-reject/__Cps_f#set:__cps___async_try_flag_9_8
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 432
                      call $async-try-reject/__Cps_f#set:__cps___async_try_err_7_9
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 1026
                      call $async-try-reject/__Cps_f#set:state
                      br $break|1
                     end
                     local.get $this
                     local.set $2
                     global.get $~lib/memory/__stack_pointer
                     local.get $2
                     i32.store
                     local.get $2
                     call $async-try-reject/__Cps_f#get:__cps___async_try_flag_9_8
                     if
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 1034
                      call $async-try-reject/__Cps_f#set:state
                     else
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 1033
                      call $async-try-reject/__Cps_f#set:state
                     end
                     br $break|1
                    end
                    i32.const 1
                    drop
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 1027
                    call $async-try-reject/__Cps_f#set:state
                    br $break|1
                   end
                   i32.const 0
                   call $async-try-reject/getChunk
                   drop
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1
                   call $async-try-reject/__Cps_f#set:state
                   i32.const 0
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   i32.const 16
                   i32.add
                   global.set $~lib/memory/__stack_pointer
                   local.get $2
                   return
                  end
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store offset=8
                  local.get $2
                  call $async-try-reject/__Cps_f#get:__pend0
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store offset=4
                  local.get $2
                  call $async-try-reject/__Cps_f#set:__cps_c_11
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  call $async-try-reject/__Cps_f#get:__cps___async_try_flag_9_8
                  if (result i32)
                   i32.const 1
                  else
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   call $async-try-reject/__Cps_f#get:__cps___async_try_ret_0_1
                  end
                  if (result i32)
                   i32.const 1
                  else
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   call $async-try-reject/__Cps_f#get:__cps___async_try_brk_1_2
                  end
                  if (result i32)
                   i32.const 1
                  else
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   call $async-try-reject/__Cps_f#get:__cps___async_try_cnt_2_3
                  end
                  if (result i32)
                   i32.const 1
                  else
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   call $async-try-reject/__Cps_f#get:__cps___async_try_pendFail_5_6
                  end
                  if
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1030
                   call $async-try-reject/__Cps_f#set:state
                  else
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1029
                   call $async-try-reject/__Cps_f#set:state
                  end
                  br $break|1
                 end
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 0
                 call $async-try-reject/__Cps_f#set:__cps___async_try_ret_0_1
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 0
                 call $async-try-reject/__Cps_f#set:__cps___async_try_brk_1_2
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 0
                 call $async-try-reject/__Cps_f#set:__cps___async_try_cnt_2_3
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 560
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store offset=12
                 local.get $2
                 call $async-try-reject/__Cps_f#get:__cps_c_11
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store offset=8
                 local.get $2
                 call $~lib/string/String.__concat
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store offset=4
                 local.get $2
                 call $async-try-reject/__Cps_f#set:__cps___async_try_retVal_6_7
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1
                 call $async-try-reject/__Cps_f#set:__cps___async_try_ret_0_1
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 call $async-try-reject/__Cps_f#get:__cps___async_try_flag_9_8
                 if (result i32)
                  i32.const 1
                 else
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  call $async-try-reject/__Cps_f#get:__cps___async_try_ret_0_1
                 end
                 if (result i32)
                  i32.const 1
                 else
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  call $async-try-reject/__Cps_f#get:__cps___async_try_brk_1_2
                 end
                 if (result i32)
                  i32.const 1
                 else
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  call $async-try-reject/__Cps_f#get:__cps___async_try_cnt_2_3
                 end
                 if (result i32)
                  i32.const 1
                 else
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  call $async-try-reject/__Cps_f#get:__cps___async_try_pendFail_5_6
                 end
                 if
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  i32.const 1032
                  call $async-try-reject/__Cps_f#set:state
                 else
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  i32.const 1031
                  call $async-try-reject/__Cps_f#set:state
                 end
                 br $break|1
                end
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 1025
                call $async-try-reject/__Cps_f#set:state
                br $break|1
               end
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store
               local.get $2
               i32.const 1025
               call $async-try-reject/__Cps_f#set:state
               br $break|1
              end
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1025
              call $async-try-reject/__Cps_f#set:state
              br $break|1
             end
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             i32.const 0
             call $async-try-reject/__Cps_f#set:__cps___async_try_fin_10_13
             i32.const 592
             call $async-try-reject/log
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             call $async-try-reject/__Cps_f#get:__cps___async_try_flag_9_8
             if
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1036
              call $async-try-reject/__Cps_f#set:state
             else
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1037
              call $async-try-reject/__Cps_f#set:state
             end
             br $break|1
            end
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-try-reject/__Cps_f#set:__cps___async_try_flag_9_8
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=8
            local.get $2
            call $async-try-reject/__Cps_f#get:__cps___async_try_err_7_9
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=4
            local.get $2
            call $async-try-reject/__Cps_f#set:__cps_e_12
            i32.const 640
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=8
            local.get $2
            call $async-try-reject/__Cps_f#get:__cps_e_12
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=4
            local.get $2
            call $~lib/string/String.__concat
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            call $async-try-reject/log
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            call $async-try-reject/__Cps_f#get:__cps___async_try_ret_0_1
            if (result i32)
             i32.const 1
            else
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             call $async-try-reject/__Cps_f#get:__cps___async_try_brk_1_2
            end
            if (result i32)
             i32.const 1
            else
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             call $async-try-reject/__Cps_f#get:__cps___async_try_cnt_2_3
            end
            if (result i32)
             i32.const 1
            else
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             call $async-try-reject/__Cps_f#get:__cps___async_try_pendFail_5_6
            end
            i32.eqz
            if
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             i32.const 1035
             call $async-try-reject/__Cps_f#set:state
            else
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             i32.const 1033
             call $async-try-reject/__Cps_f#set:state
            end
            br $break|1
           end
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 0
           call $async-try-reject/__Cps_f#set:__cps___async_try_ret_0_1
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 0
           call $async-try-reject/__Cps_f#set:__cps___async_try_brk_1_2
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 0
           call $async-try-reject/__Cps_f#set:__cps___async_try_cnt_2_3
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 672
           call $async-try-reject/__Cps_f#set:__cps___async_try_retVal_6_7
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 1
           call $async-try-reject/__Cps_f#set:__cps___async_try_ret_0_1
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 1033
           call $async-try-reject/__Cps_f#set:state
           br $break|1
          end
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=8
          local.get $2
          call $async-try-reject/__Cps_f#get:__cps___async_try_errVal_8_10
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-try-reject/__Cps_f#set:__errorValue
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=8
          local.get $2
          call $async-try-reject/__Cps_f#get:__cps___async_try_err_7_9
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-try-reject/__Cps_f#set:__error
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const -2
          call $async-try-reject/__Cps_f#set:state
          global.get $async-try-reject/__async_roots_f
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          global.get $async-try-reject/__async_roots_f
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=8
          local.get $2
          i32.const 0
          call $~lib/array/Array<async-try-reject/__Cps_f>#indexOf
          i32.const 1
          call $~lib/array/Array<async-try-reject/__Cps_f>#splice
          drop
          i32.const 2
          local.set $2
          global.get $~lib/memory/__stack_pointer
          i32.const 16
          i32.add
          global.set $~lib/memory/__stack_pointer
          local.get $2
          return
         end
         local.get $this
         local.set $2
         global.get $~lib/memory/__stack_pointer
         local.get $2
         i32.store
         local.get $2
         call $async-try-reject/__Cps_f#get:__cps___async_try_pendFail_5_6
         if
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1038
          call $async-try-reject/__Cps_f#set:state
         else
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1039
          call $async-try-reject/__Cps_f#set:state
         end
         br $break|1
        end
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 0
        call $async-try-reject/__Cps_f#set:__cps___async_try_pendFail_5_6
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $2
        call $async-try-reject/__Cps_f#get:__cps___async_try_pendVal_4_5
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-try-reject/__Cps_f#set:__errorValue
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $2
        call $async-try-reject/__Cps_f#get:__cps___async_try_pendErr_3_4
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-try-reject/__Cps_f#set:__error
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const -2
        call $async-try-reject/__Cps_f#set:state
        global.get $async-try-reject/__async_roots_f
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        global.get $async-try-reject/__async_roots_f
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $2
        i32.const 0
        call $~lib/array/Array<async-try-reject/__Cps_f>#indexOf
        i32.const 1
        call $~lib/array/Array<async-try-reject/__Cps_f>#splice
        drop
        i32.const 2
        local.set $2
        global.get $~lib/memory/__stack_pointer
        i32.const 16
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        return
       end
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       call $async-try-reject/__Cps_f#get:__cps___async_try_ret_0_1
       if
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1040
        call $async-try-reject/__Cps_f#set:state
       else
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1023
        call $async-try-reject/__Cps_f#set:state
       end
       br $break|1
      end
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const 0
      call $async-try-reject/__Cps_f#set:__cps___async_try_ret_0_1
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=8
      local.get $2
      call $async-try-reject/__Cps_f#get:__cps___async_try_retVal_6_7
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      local.get $2
      call $async-try-reject/__Cps_f#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-try-reject/__Cps_f#set:state
      global.get $async-try-reject/__async_roots_f
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-try-reject/__async_roots_f
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      local.get $2
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=8
      local.get $2
      i32.const 0
      call $~lib/array/Array<async-try-reject/__Cps_f>#indexOf
      i32.const 1
      call $~lib/array/Array<async-try-reject/__Cps_f>#splice
      drop
      i32.const 1
      local.set $2
      global.get $~lib/memory/__stack_pointer
      i32.const 16
      i32.add
      global.set $~lib/memory/__stack_pointer
      local.get $2
      return
     end
     local.get $this
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     call $async-try-reject/__Cps_f#get:state
     i32.const -1
     i32.eq
     if (result i32)
      i32.const 1
     else
      i32.const 2
     end
     local.set $2
     global.get $~lib/memory/__stack_pointer
     i32.const 16
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $2
     return
    end
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $async-try-reject/f (param $mode i32) (result i32)
  (local $__st i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-try-reject/__Cps_f#constructor
  local.tee $__st
  i32.store
  local.get $__st
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $mode
  call $async-try-reject/__Cps_f#set:__cps_mode_0
  global.get $async-try-reject/__async_roots_f
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $__st
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $~lib/array/Array<async-try-reject/__Cps_f>#push
  drop
  local.get $__st
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $async-try-reject/__Cps_f#step
  drop
  local.get $__st
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-try-reject/__Cps_g#constructor (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 61
   i32.const 9
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $~lib/object/Object#constructor
  local.tee $this
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_g#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_g#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_g#set:__pend0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:__cps_mode_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:__cps___async_try_ret_0_1
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:__cps___async_try_brk_1_2
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:__cps___async_try_cnt_2_3
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_g#set:__cps___async_try_pendErr_3_4
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:__cps___async_try_pendVal_4_5
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:__cps___async_try_pendFail_5_6
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_g#set:__cps___async_try_retVal_6_7
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:__cps___async_try_flag_9_8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_g#set:__cps___async_try_err_7_9
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:__cps___async_try_errVal_8_10
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-try-reject/__Cps_g#set:__cps_c_11
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-try-reject/__Cps_g#set:__cps___async_try_fin_10_12
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 10
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_g>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_g>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_g>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_g>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 464
   i32.const 512
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  global.get $~lib/memory/__stack_pointer
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $buffer
  i32.store offset=8
  i32.const 2
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=12
  local.get $6
  call $~lib/array/Array<async-try-reject/__Cps_g>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-try-reject/__Cps_g>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-try-reject/__Cps_g>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-try-reject/__Cps_g>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/itcms/__link
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $len
  call $~lib/array/Array<async-try-reject/__Cps_g>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
  (local $len i32)
  (local $4 i32)
  (local $5 i32)
  (local $ptr i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:length_
  local.set $len
  local.get $len
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1
  else
   local.get $fromIndex
   local.get $len
   i32.ge_s
  end
  if
   i32.const -1
   local.set $7
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $7
   return
  end
  local.get $fromIndex
  i32.const 0
  i32.lt_s
  if
   local.get $len
   local.get $fromIndex
   i32.add
   local.tee $4
   i32.const 0
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   local.set $fromIndex
  end
  local.get $this
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:dataStart
  local.set $ptr
  loop $while-continue|0
   local.get $fromIndex
   local.get $len
   i32.lt_s
   if
    local.get $ptr
    local.get $fromIndex
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $value
    i32.eq
    if
     local.get $fromIndex
     local.set $7
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $7
     return
    end
    local.get $fromIndex
    i32.const 1
    i32.add
    local.set $fromIndex
    br $while-continue|0
   end
  end
  i32.const -1
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
  (local $len i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $result i32)
  (local $resultStart i32)
  (local $thisStart i32)
  (local $thisBase i32)
  (local $offset i32)
  (local $17 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:length_
  local.set $len
  local.get $start
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $len
   local.get $start
   i32.add
   local.tee $4
   i32.const 0
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
  else
   local.get $start
   local.tee $6
   local.get $len
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
  end
  local.set $start
  local.get $deleteCount
  local.tee $8
  local.get $len
  local.get $start
  i32.sub
  local.tee $9
  local.get $8
  local.get $9
  i32.lt_s
  select
  local.tee $10
  i32.const 0
  local.tee $11
  local.get $10
  local.get $11
  i32.gt_s
  select
  local.set $deleteCount
  global.get $~lib/memory/__stack_pointer
  local.get $deleteCount
  i32.const 2
  i32.const 10
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $result
  i32.store offset=4
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:dataStart
  local.set $thisStart
  local.get $thisStart
  local.get $start
  i32.const 2
  i32.shl
  i32.add
  local.set $thisBase
  local.get $resultStart
  local.get $thisBase
  local.get $deleteCount
  i32.const 2
  i32.shl
  memory.copy
  local.get $start
  local.get $deleteCount
  i32.add
  local.set $offset
  local.get $len
  local.get $offset
  i32.ne
  if
   local.get $thisBase
   local.get $thisStart
   local.get $offset
   i32.const 2
   i32.shl
   i32.add
   local.get $len
   local.get $offset
   i32.sub
   i32.const 2
   i32.shl
   memory.copy
  end
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  local.get $len
  local.get $deleteCount
  i32.sub
  call $~lib/array/Array<async-try-reject/__Cps_g>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-try-reject/__Cps_g#step (param $this i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  loop $while-continue|0
   i32.const 1
   if
    block $break|1
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
                     block $case0|1
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      call $async-try-reject/__Cps_g#get:state
                      local.set $1
                      local.get $1
                      i32.const 0
                      i32.eq
                      br_if $case0|1
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
                      br $case16|1
                     end
                     local.get $this
                     local.set $2
                     global.get $~lib/memory/__stack_pointer
                     local.get $2
                     i32.store
                     local.get $2
                     i32.const 1024
                     call $async-try-reject/__Cps_g#set:state
                     br $break|1
                    end
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 1028
                    call $async-try-reject/__Cps_g#set:state
                    br $break|1
                   end
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-try-reject/__Cps_g#set:__cps___async_try_ret_0_1
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-try-reject/__Cps_g#set:__cps___async_try_brk_1_2
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-try-reject/__Cps_g#set:__cps___async_try_cnt_2_3
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 432
                   call $async-try-reject/__Cps_g#set:__cps___async_try_pendErr_3_4
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-try-reject/__Cps_g#set:__cps___async_try_pendFail_5_6
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-try-reject/__Cps_g#set:__cps___async_try_flag_9_8
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 432
                   call $async-try-reject/__Cps_g#set:__cps___async_try_err_7_9
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1026
                   call $async-try-reject/__Cps_g#set:state
                   br $break|1
                  end
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  i32.const 0
                  call $async-try-reject/__Cps_g#set:__cps___async_try_fin_10_12
                  i32.const 592
                  call $async-try-reject/log
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  call $async-try-reject/__Cps_g#get:__cps___async_try_flag_9_8
                  if
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1033
                   call $async-try-reject/__Cps_g#set:state
                  else
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1034
                   call $async-try-reject/__Cps_g#set:state
                  end
                  br $break|1
                 end
                 i32.const 1
                 drop
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1027
                 call $async-try-reject/__Cps_g#set:state
                 br $break|1
                end
                i32.const 0
                call $async-try-reject/getChunk
                drop
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 1
                call $async-try-reject/__Cps_g#set:state
                i32.const 0
                local.set $2
                global.get $~lib/memory/__stack_pointer
                i32.const 16
                i32.add
                global.set $~lib/memory/__stack_pointer
                local.get $2
                return
               end
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store
               local.get $2
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store offset=8
               local.get $2
               call $async-try-reject/__Cps_g#get:__pend0
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store offset=4
               local.get $2
               call $async-try-reject/__Cps_g#set:__cps_c_11
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store
               local.get $2
               call $async-try-reject/__Cps_g#get:__cps___async_try_flag_9_8
               if (result i32)
                i32.const 1
               else
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                call $async-try-reject/__Cps_g#get:__cps___async_try_ret_0_1
               end
               if (result i32)
                i32.const 1
               else
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                call $async-try-reject/__Cps_g#get:__cps___async_try_brk_1_2
               end
               if (result i32)
                i32.const 1
               else
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                call $async-try-reject/__Cps_g#get:__cps___async_try_cnt_2_3
               end
               if (result i32)
                i32.const 1
               else
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                call $async-try-reject/__Cps_g#get:__cps___async_try_pendFail_5_6
               end
               if
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 1030
                call $async-try-reject/__Cps_g#set:state
               else
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 1029
                call $async-try-reject/__Cps_g#set:state
               end
               br $break|1
              end
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 0
              call $async-try-reject/__Cps_g#set:__cps___async_try_ret_0_1
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 0
              call $async-try-reject/__Cps_g#set:__cps___async_try_brk_1_2
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 0
              call $async-try-reject/__Cps_g#set:__cps___async_try_cnt_2_3
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 560
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store offset=12
              local.get $2
              call $async-try-reject/__Cps_g#get:__cps_c_11
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store offset=8
              local.get $2
              call $~lib/string/String.__concat
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store offset=4
              local.get $2
              call $async-try-reject/__Cps_g#set:__cps___async_try_retVal_6_7
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1
              call $async-try-reject/__Cps_g#set:__cps___async_try_ret_0_1
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              call $async-try-reject/__Cps_g#get:__cps___async_try_flag_9_8
              if (result i32)
               i32.const 1
              else
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store
               local.get $2
               call $async-try-reject/__Cps_g#get:__cps___async_try_ret_0_1
              end
              if (result i32)
               i32.const 1
              else
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store
               local.get $2
               call $async-try-reject/__Cps_g#get:__cps___async_try_brk_1_2
              end
              if (result i32)
               i32.const 1
              else
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store
               local.get $2
               call $async-try-reject/__Cps_g#get:__cps___async_try_cnt_2_3
              end
              if (result i32)
               i32.const 1
              else
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store
               local.get $2
               call $async-try-reject/__Cps_g#get:__cps___async_try_pendFail_5_6
              end
              if
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store
               local.get $2
               i32.const 1032
               call $async-try-reject/__Cps_g#set:state
              else
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store
               local.get $2
               i32.const 1031
               call $async-try-reject/__Cps_g#set:state
              end
              br $break|1
             end
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             i32.const 1025
             call $async-try-reject/__Cps_g#set:state
             br $break|1
            end
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 1025
            call $async-try-reject/__Cps_g#set:state
            br $break|1
           end
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 1025
           call $async-try-reject/__Cps_g#set:state
           br $break|1
          end
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=8
          local.get $2
          call $async-try-reject/__Cps_g#get:__cps___async_try_errVal_8_10
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-try-reject/__Cps_g#set:__errorValue
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=8
          local.get $2
          call $async-try-reject/__Cps_g#get:__cps___async_try_err_7_9
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-try-reject/__Cps_g#set:__error
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const -2
          call $async-try-reject/__Cps_g#set:state
          global.get $async-try-reject/__async_roots_g
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          global.get $async-try-reject/__async_roots_g
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=8
          local.get $2
          i32.const 0
          call $~lib/array/Array<async-try-reject/__Cps_g>#indexOf
          i32.const 1
          call $~lib/array/Array<async-try-reject/__Cps_g>#splice
          drop
          i32.const 2
          local.set $2
          global.get $~lib/memory/__stack_pointer
          i32.const 16
          i32.add
          global.set $~lib/memory/__stack_pointer
          local.get $2
          return
         end
         local.get $this
         local.set $2
         global.get $~lib/memory/__stack_pointer
         local.get $2
         i32.store
         local.get $2
         call $async-try-reject/__Cps_g#get:__cps___async_try_pendFail_5_6
         if
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1035
          call $async-try-reject/__Cps_g#set:state
         else
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1036
          call $async-try-reject/__Cps_g#set:state
         end
         br $break|1
        end
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 0
        call $async-try-reject/__Cps_g#set:__cps___async_try_pendFail_5_6
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $2
        call $async-try-reject/__Cps_g#get:__cps___async_try_pendVal_4_5
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-try-reject/__Cps_g#set:__errorValue
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $2
        call $async-try-reject/__Cps_g#get:__cps___async_try_pendErr_3_4
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-try-reject/__Cps_g#set:__error
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const -2
        call $async-try-reject/__Cps_g#set:state
        global.get $async-try-reject/__async_roots_g
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        global.get $async-try-reject/__async_roots_g
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $2
        i32.const 0
        call $~lib/array/Array<async-try-reject/__Cps_g>#indexOf
        i32.const 1
        call $~lib/array/Array<async-try-reject/__Cps_g>#splice
        drop
        i32.const 2
        local.set $2
        global.get $~lib/memory/__stack_pointer
        i32.const 16
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        return
       end
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       call $async-try-reject/__Cps_g#get:__cps___async_try_ret_0_1
       if
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1037
        call $async-try-reject/__Cps_g#set:state
       else
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1023
        call $async-try-reject/__Cps_g#set:state
       end
       br $break|1
      end
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const 0
      call $async-try-reject/__Cps_g#set:__cps___async_try_ret_0_1
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=8
      local.get $2
      call $async-try-reject/__Cps_g#get:__cps___async_try_retVal_6_7
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      local.get $2
      call $async-try-reject/__Cps_g#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-try-reject/__Cps_g#set:state
      global.get $async-try-reject/__async_roots_g
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-try-reject/__async_roots_g
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      local.get $2
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=8
      local.get $2
      i32.const 0
      call $~lib/array/Array<async-try-reject/__Cps_g>#indexOf
      i32.const 1
      call $~lib/array/Array<async-try-reject/__Cps_g>#splice
      drop
      i32.const 1
      local.set $2
      global.get $~lib/memory/__stack_pointer
      i32.const 16
      i32.add
      global.set $~lib/memory/__stack_pointer
      local.get $2
      return
     end
     local.get $this
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     call $async-try-reject/__Cps_g#get:state
     i32.const -1
     i32.eq
     if (result i32)
      i32.const 1
     else
      i32.const 2
     end
     local.set $2
     global.get $~lib/memory/__stack_pointer
     i32.const 16
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $2
     return
    end
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $async-try-reject/g (param $mode i32) (result i32)
  (local $__st i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-try-reject/__Cps_g#constructor
  local.tee $__st
  i32.store
  local.get $__st
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $mode
  call $async-try-reject/__Cps_g#set:__cps_mode_0
  global.get $async-try-reject/__async_roots_g
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $__st
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $~lib/array/Array<async-try-reject/__Cps_g>#push
  drop
  local.get $__st
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $async-try-reject/__Cps_g#step
  drop
  local.get $__st
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $~lib/string/String#repeat (param $this i32) (param $count i32) (result i32)
  (local $length i32)
  (local $out i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $this
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/string/String#get:length
  local.set $length
  local.get $count
  i32.const 0
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $length
   i64.extend_i32_s
   local.get $count
   i64.extend_i32_s
   i64.mul
   i64.const 1
   i64.const 28
   i64.shl
   i64.gt_u
  end
  if
   i32.const 464
   i32.const 880
   i32.const 334
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  local.get $count
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1
  else
   local.get $length
   i32.eqz
  end
  if
   i32.const 432
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  local.get $count
  i32.const 1
  i32.eq
  if
   local.get $this
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $length
  local.get $count
  i32.mul
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $out
  i32.store offset=4
  local.get $out
  local.get $this
  local.get $length
  i32.const 1
  i32.shl
  local.get $count
  call $~lib/memory/memory.repeat
  local.get $out
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#get:length (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $index
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:length_
  i32.ge_u
  if
   i32.const 224
   i32.const 512
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $value
  i32.store offset=4
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 928
   i32.const 512
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $async-try-reject/__async_async_try_reject_f_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-try-reject/__async_roots_f
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:length
  i32.const 0
  i32.eq
  if
   i32.const 0
   local.set $0
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  global.get $async-try-reject/__async_roots_f
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-try-reject/__async_roots_f
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-try-reject/__Cps_f>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-try-reject/__async_async_try_reject_f_reclaim (param $state i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-try-reject/__Cps_f#get:state
  i32.const 0
  i32.lt_s
  if
   i32.const 2
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const -2
  call $async-try-reject/__Cps_f#set:state
  global.get $async-try-reject/__async_roots_f
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-try-reject/__async_roots_f
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_f>#indexOf
  i32.const 1
  call $~lib/array/Array<async-try-reject/__Cps_f>#splice
  drop
  i32.const 2
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-try-reject/__async_async_try_reject_f_resume_0 (param $state i32) (param $value i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $value
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $async-try-reject/__Cps_f#set:__pend0
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $async-try-reject/__Cps_f#step
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-try-reject/__async_async_try_reject_f_reject_0 (param $state i32) (param $message i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 1
  call $async-try-reject/__Cps_f#set:__cps___async_try_flag_9_8
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $message
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $async-try-reject/__Cps_f#set:__cps___async_try_err_7_9
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $async-try-reject/__Cps_f#step
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-try-reject/__async_async_try_reject_f_result (param $state i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-try-reject/__Cps_f#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-try-reject/__async_async_try_reject_f_error (param $state i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-try-reject/__Cps_f#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-try-reject/__async_async_try_reject_f_errorValue (param $state i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-try-reject/__Cps_f#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-try-reject/__async_async_try_reject_f_status (param $state i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-try-reject/__Cps_f#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#get:length (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $index
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:length_
  i32.ge_u
  if
   i32.const 224
   i32.const 512
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $this
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $value
  i32.store offset=4
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 928
   i32.const 512
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $async-try-reject/__async_async_try_reject_g_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-try-reject/__async_roots_g
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:length
  i32.const 0
  i32.eq
  if
   i32.const 0
   local.set $0
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  global.get $async-try-reject/__async_roots_g
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-try-reject/__async_roots_g
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-try-reject/__Cps_g>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-try-reject/__async_async_try_reject_g_reclaim (param $state i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-try-reject/__Cps_g#get:state
  i32.const 0
  i32.lt_s
  if
   i32.const 2
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const -2
  call $async-try-reject/__Cps_g#set:state
  global.get $async-try-reject/__async_roots_g
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-try-reject/__async_roots_g
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  i32.const 0
  call $~lib/array/Array<async-try-reject/__Cps_g>#indexOf
  i32.const 1
  call $~lib/array/Array<async-try-reject/__Cps_g>#splice
  drop
  i32.const 2
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-try-reject/__async_async_try_reject_g_resume_0 (param $state i32) (param $value i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $value
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $async-try-reject/__Cps_g#set:__pend0
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $async-try-reject/__Cps_g#step
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-try-reject/__async_async_try_reject_g_reject_0 (param $state i32) (param $message i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const 1
  call $async-try-reject/__Cps_g#set:__cps___async_try_flag_9_8
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $message
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $async-try-reject/__Cps_g#set:__cps___async_try_err_7_9
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $async-try-reject/__Cps_g#step
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-try-reject/__async_async_try_reject_g_result (param $state i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-try-reject/__Cps_g#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-try-reject/__async_async_try_reject_g_error (param $state i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-try-reject/__Cps_g#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-try-reject/__async_async_try_reject_g_errorValue (param $state i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-try-reject/__Cps_g#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-try-reject/__async_async_try_reject_g_status (param $state i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-try-reject/__Cps_g#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-try-reject/__Cps_f>#__visit (param $this i32) (param $cookie i32)
  (local $cur i32)
  (local $end i32)
  (local $val i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 1
  drop
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:length_
  i32.const 2
  i32.shl
  i32.add
  local.set $end
  loop $while-continue|0
   local.get $cur
   local.get $end
   i32.lt_u
   if
    local.get $cur
    i32.load
    local.set $val
    local.get $val
    if
     local.get $val
     local.get $cookie
     call $~lib/rt/itcms/__visit
    end
    local.get $cur
    i32.const 4
    i32.add
    local.set $cur
    br $while-continue|0
   end
  end
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-try-reject/__Cps_f>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<i32>#__visit (param $this i32) (param $cookie i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 0
  drop
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<i32>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-try-reject/__Cps_g>#__visit (param $this i32) (param $cookie i32)
  (local $cur i32)
  (local $end i32)
  (local $val i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 1
  drop
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:length_
  i32.const 2
  i32.shl
  i32.add
  local.set $end
  loop $while-continue|0
   local.get $cur
   local.get $end
   i32.lt_u
   if
    local.get $cur
    i32.load
    local.set $val
    local.get $val
    if
     local.get $val
     local.get $cookie
     call $~lib/rt/itcms/__visit
    end
    local.get $cur
    i32.const 4
    i32.add
    local.set $cur
    br $while-continue|0
   end
  end
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-try-reject/__Cps_g>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/object/Object#constructor (param $this i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/rt/__newArray (param $length i32) (param $alignLog2 i32) (param $id i32) (param $data i32) (result i32)
  (local $bufferSize i32)
  (local $buffer i32)
  (local $array i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $length
  local.get $alignLog2
  i32.shl
  local.set $bufferSize
  global.get $~lib/memory/__stack_pointer
  local.get $bufferSize
  i32.const 1
  local.get $data
  call $~lib/rt/__newBuffer
  local.tee $buffer
  i32.store
  i32.const 16
  local.get $id
  call $~lib/rt/itcms/__new
  local.set $array
  local.get $array
  local.get $buffer
  i32.store
  local.get $array
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
  local.get $array
  local.get $buffer
  i32.store offset=4
  local.get $array
  local.get $bufferSize
  i32.store offset=8
  local.get $array
  local.get $length
  i32.store offset=12
  local.get $array
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $this i32) (param $length i32) (result i32)
  (local $buffer i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $length
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 464
   i32.const 784
   i32.const 52
   i32.const 43
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $length
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $buffer
  i32.store
  i32.const 2
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  return
 )
 (func $export:async-try-reject/__async_async_try_reject_f_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $async-try-reject/__async_async_try_reject_f_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-try-reject/__async_async_try_reject_f_resume_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $async-try-reject/__async_async_try_reject_f_resume_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-try-reject/__async_async_try_reject_f_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $async-try-reject/__async_async_try_reject_f_reject_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-try-reject/__async_async_try_reject_f_result (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $async-try-reject/__async_async_try_reject_f_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-try-reject/__async_async_try_reject_f_error (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $async-try-reject/__async_async_try_reject_f_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-try-reject/__async_async_try_reject_f_errorValue (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $async-try-reject/__async_async_try_reject_f_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-try-reject/__async_async_try_reject_f_status (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $async-try-reject/__async_async_try_reject_f_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-try-reject/__async_async_try_reject_g_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $async-try-reject/__async_async_try_reject_g_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-try-reject/__async_async_try_reject_g_resume_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $async-try-reject/__async_async_try_reject_g_resume_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-try-reject/__async_async_try_reject_g_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $async-try-reject/__async_async_try_reject_g_reject_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-try-reject/__async_async_try_reject_g_result (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $async-try-reject/__async_async_try_reject_g_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-try-reject/__async_async_try_reject_g_error (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $async-try-reject/__async_async_try_reject_g_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-try-reject/__async_async_try_reject_g_errorValue (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $async-try-reject/__async_async_try_reject_g_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-try-reject/__async_async_try_reject_g_status (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $async-try-reject/__async_async_try_reject_g_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
)
