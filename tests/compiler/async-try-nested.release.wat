(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32) (result i32)))
 (type $2 (func (param i32 i32)))
 (type $3 (func (result i32)))
 (type $4 (func (param i32)))
 (type $5 (func))
 (type $6 (func (param i32 i32 i32)))
 (type $7 (func (param i32 i32 i32 i32)))
 (type $8 (func (param i32 i32 i64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "log" (func $async-try-nested/log (param i32)))
 (import "env" "getChunk" (func $async-try-nested/getChunk (param i32) (result i32)))
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
 (global $async-try-nested/__async_roots_nested (mut i32) (i32.const 0))
 (global $async-try-nested/__async_roots_inLoop (mut i32) (i32.const 0))
 (global $async-try-nested/__async_roots_noCatch (mut i32) (i32.const 0))
 (global $async-try-nested/__async_roots_finThrow (mut i32) (i32.const 0))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 37372))
 (memory $0 1)
 (data $0 (i32.const 1036) ",")
 (data $0.1 (i32.const 1048) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $1 (i32.const 1084) ",")
 (data $1.1 (i32.const 1096) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $2 (i32.const 1132) "<")
 (data $2.1 (i32.const 1144) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $3 (i32.const 1196) "<")
 (data $3.1 (i32.const 1208) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s")
 (data $6 (i32.const 1324) "<")
 (data $6.1 (i32.const 1336) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $7 (i32.const 1388) ",")
 (data $7.1 (i32.const 1400) "\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
 (data $9 (i32.const 1468) "<")
 (data $9.1 (i32.const 1480) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data $10 (i32.const 1532) "\1c")
 (data $10.1 (i32.const 1544) "\02")
 (data $11 (i32.const 1564) ",")
 (data $11.1 (i32.const 1576) "\02\00\00\00\14\00\00\00i\00n\00n\00e\00r\00-\00b\00o\00o\00m")
 (data $12 (i32.const 1612) "\1c")
 (data $12.1 (i32.const 1624) "\02\00\00\00\06\00\00\00i\00n\00-")
 (data $13 (i32.const 1644) ",")
 (data $13.1 (i32.const 1656) "\02\00\00\00\1a\00\00\00i\00n\00n\00e\00r\00-\00f\00i\00n\00a\00l\00l\00y")
 (data $14 (i32.const 1692) ",")
 (data $14.1 (i32.const 1704) "\02\00\00\00\18\00\00\00i\00n\00n\00e\00r\00-\00c\00a\00t\00c\00h\00:")
 (data $15 (i32.const 1740) ",")
 (data $15.1 (i32.const 1752) "\02\00\00\00\0e\00\00\00r\00e\00t\00h\00r\00o\00w")
 (data $16 (i32.const 1788) ",")
 (data $16.1 (i32.const 1800) "\02\00\00\00\18\00\00\00i\00n\00n\00e\00r\00-\00c\00a\00u\00g\00h\00t")
 (data $17 (i32.const 1836) ",")
 (data $17.1 (i32.const 1848) "\02\00\00\00\1a\00\00\00o\00u\00t\00e\00r\00-\00f\00i\00n\00a\00l\00l\00y")
 (data $18 (i32.const 1884) ",")
 (data $18.1 (i32.const 1896) "\02\00\00\00\18\00\00\00o\00u\00t\00e\00r\00-\00c\00a\00t\00c\00h\00:")
 (data $19 (i32.const 1932) ",")
 (data $19.1 (i32.const 1944) "\02\00\00\00\18\00\00\00o\00u\00t\00e\00r\00-\00c\00a\00u\00g\00h\00t")
 (data $20 (i32.const 1980) "\1c")
 (data $20.1 (i32.const 1992) "\02\00\00\00\n\00\00\00d\00o\00n\00e\00-")
 (data $21 (i32.const 2012) "\1c")
 (data $21.1 (i32.const 2024) "\02\00\00\00\08\00\00\00f\00i\00n\00-")
 (data $22 (i32.const 2044) "|")
 (data $22.1 (i32.const 2056) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $23 (i32.const 2172) "<")
 (data $23.1 (i32.const 2184) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $24 (i32.const 2236) "\1c")
 (data $24.1 (i32.const 2248) "\02\00\00\00\02\00\00\000")
 (data $25 (i32.const 2268) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
 (data $26 (i32.const 2668) "\1c\04")
 (data $26.1 (i32.const 2680) "\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
 (data $27 (i32.const 3724) "\\")
 (data $27.1 (i32.const 3736) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $28 (i32.const 3820) "\1c")
 (data $28.1 (i32.const 3832) "\02\00\00\00\0c\00\00\00e\00a\00r\00l\00y\00-")
 (data $29 (i32.const 3852) ",")
 (data $29.1 (i32.const 3864) "\02\00\00\00\14\00\00\00n\00c\00-\00f\00i\00n\00a\00l\00l\00y")
 (data $30 (i32.const 3900) ",")
 (data $30.1 (i32.const 3912) "\02\00\00\00\18\00\00\00n\00o\00c\00a\00t\00c\00h\00-\00b\00o\00o\00m")
 (data $31 (i32.const 3948) "\1c")
 (data $31.1 (i32.const 3960) "\02\00\00\00\06\00\00\00o\00k\00-")
 (data $32 (i32.const 3980) "\1c")
 (data $32.1 (i32.const 3992) "\02\00\00\00\08\00\00\00r\00e\00t\00-")
 (data $33 (i32.const 4012) "\1c")
 (data $33.1 (i32.const 4024) "\02\00\00\00\0c\00\00\00p\00l\00a\00i\00n\00-")
 (data $34 (i32.const 4044) ",")
 (data $34.1 (i32.const 4056) "\02\00\00\00\14\00\00\00f\00t\00-\00f\00i\00n\00a\00l\00l\00y")
 (data $35 (i32.const 4092) "\1c")
 (data $35.1 (i32.const 4104) "\02\00\00\00\0c\00\00\00c\00a\00t\00c\00h\00-")
 (data $36 (i32.const 4124) ",")
 (data $36.1 (i32.const 4136) "\02\00\00\00\10\00\00\00f\00i\00n\00-\00b\00o\00o\00m")
 (data $37 (i32.const 4172) "\1c")
 (data $37.1 (i32.const 4184) "\02\00\00\00\02\00\00\00A")
 (data $38 (i32.const 4204) "\1c")
 (data $38.1 (i32.const 4216) "\02\00\00\00\02\00\00\00B")
 (data $39 (i32.const 4236) "\1c")
 (data $39.1 (i32.const 4248) "\02\00\00\00\02\00\00\00C")
 (data $40 (i32.const 4268) "<")
 (data $40.1 (i32.const 4280) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data $41 (i32.const 4332) "\1c")
 (data $41.1 (i32.const 4344) "\02\00\00\00\02\00\00\00 ")
 (data $42 (i32.const 4364) ",")
 (data $42.1 (i32.const 4376) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $43 (i32.const 4412) "|")
 (data $43.1 (i32.const 4424) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $44 (i32.const 4544) "\0e\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\02\t")
 (export "nested" (func $async-try-nested/nested))
 (export "inLoop" (func $async-try-nested/inLoop))
 (export "noCatch" (func $async-try-nested/noCatch))
 (export "finThrow" (func $async-try-nested/finThrow))
 (export "chunkString" (func $async-try-nested/chunkString))
 (export "__async_async_try_nested_mint" (func $async-try-nested/__async_async_try_nested_mint))
 (export "__async_async_try_nested_mint_string" (func $async-try-nested/__async_async_try_nested_mint_string))
 (export "__async_async_try_nested_nested_last_handle" (func $async-try-nested/__async_async_try_nested_nested_last_handle))
 (export "__async_async_try_nested_inLoop_last_handle" (func $async-try-nested/__async_async_try_nested_inLoop_last_handle))
 (export "__async_async_try_nested_noCatch_last_handle" (func $async-try-nested/__async_async_try_nested_noCatch_last_handle))
 (export "__async_async_try_nested_finThrow_last_handle" (func $async-try-nested/__async_async_try_nested_finThrow_last_handle))
 (export "memory" (memory $0))
 (export "__async_async_try_nested_nested_reclaim" (func $export:async-try-nested/__async_async_try_nested_nested_reclaim))
 (export "__async_async_try_nested_nested_resume_0" (func $export:async-try-nested/__async_async_try_nested_nested_resume_0))
 (export "__async_async_try_nested_nested_reject_0" (func $export:async-try-nested/__async_async_try_nested_nested_reject_0))
 (export "__async_async_try_nested_nested_result" (func $export:async-try-nested/__async_async_try_nested_nested_result))
 (export "__async_async_try_nested_nested_error" (func $export:async-try-nested/__async_async_try_nested_nested_error))
 (export "__async_async_try_nested_nested_status" (func $export:async-try-nested/__async_async_try_nested_nested_status))
 (export "__async_async_try_nested_inLoop_reclaim" (func $export:async-try-nested/__async_async_try_nested_inLoop_reclaim))
 (export "__async_async_try_nested_inLoop_resume_0" (func $export:async-try-nested/__async_async_try_nested_inLoop_resume_0))
 (export "__async_async_try_nested_inLoop_reject_0" (func $export:async-try-nested/__async_async_try_nested_inLoop_reject_0))
 (export "__async_async_try_nested_inLoop_result" (func $export:async-try-nested/__async_async_try_nested_nested_result))
 (export "__async_async_try_nested_inLoop_error" (func $export:async-try-nested/__async_async_try_nested_nested_error))
 (export "__async_async_try_nested_inLoop_status" (func $export:async-try-nested/__async_async_try_nested_nested_status))
 (export "__async_async_try_nested_noCatch_reclaim" (func $export:async-try-nested/__async_async_try_nested_noCatch_reclaim))
 (export "__async_async_try_nested_noCatch_resume_0" (func $export:async-try-nested/__async_async_try_nested_noCatch_resume_0))
 (export "__async_async_try_nested_noCatch_reject_0" (func $export:async-try-nested/__async_async_try_nested_noCatch_reject_0))
 (export "__async_async_try_nested_noCatch_result" (func $export:async-try-nested/__async_async_try_nested_nested_result))
 (export "__async_async_try_nested_noCatch_error" (func $export:async-try-nested/__async_async_try_nested_nested_error))
 (export "__async_async_try_nested_noCatch_status" (func $export:async-try-nested/__async_async_try_nested_nested_status))
 (export "__async_async_try_nested_finThrow_reclaim" (func $export:async-try-nested/__async_async_try_nested_finThrow_reclaim))
 (export "__async_async_try_nested_finThrow_resume_0" (func $export:async-try-nested/__async_async_try_nested_finThrow_resume_0))
 (export "__async_async_try_nested_finThrow_reject_0" (func $export:async-try-nested/__async_async_try_nested_finThrow_reject_0))
 (export "__async_async_try_nested_finThrow_result" (func $export:async-try-nested/__async_async_try_nested_nested_result))
 (export "__async_async_try_nested_finThrow_error" (func $export:async-try-nested/__async_async_try_nested_nested_error))
 (export "__async_async_try_nested_finThrow_status" (func $export:async-try-nested/__async_async_try_nested_nested_status))
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
   i32.const 1216
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
   i32.const 1152
   i32.const 1216
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
   i32.const 1152
   i32.const 1488
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
    i32.const 1488
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
   i32.const 1488
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
   i32.const 1488
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
 (func $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
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
 (func $~lib/string/String.__concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
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
   i32.const 4604
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   local.tee $2
   i32.store
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const -2
   i32.and
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   block $__inlined_func$~lib/string/String#concat$907
    local.get $1
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const -2
    i32.and
    local.tee $4
    local.get $3
    i32.add
    local.tee $0
    i32.eqz
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 1552
     local.set $0
     br $__inlined_func$~lib/string/String#concat$907
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.const 2
    call $~lib/rt/itcms/__new
    local.tee $0
    i32.store offset=4
    local.get $0
    local.get $2
    local.get $3
    memory.copy
    local.get $0
    local.get $3
    i32.add
    local.get $1
    local.get $4
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
   local.get $0
   return
  end
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/array/Array<async-try-nested/__Cps_nested>#get:length (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
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
 (func $~lib/rt/__newArray (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
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
 (func $~lib/object/Object#constructor (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
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
 (func $~lib/array/Array<async-try-nested/__Cps_nested>#push (param $0 i32) (param $1 i32)
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
   i32.const 4604
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
   i32.const 4604
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
     i32.const 1056
     i32.const 1104
     i32.const 19
     i32.const 48
     call $~lib/builtins/abort
     unreachable
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    block $__inlined_func$~lib/rt/itcms/__renew$883
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
      br $__inlined_func$~lib/rt/itcms/__renew$883
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/array/Array<async-try-nested/__Cps_nested>#__get (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
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
   i32.const 1344
   i32.const 1104
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
   i32.const 4432
   i32.const 1104
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
 (func $export:async-try-nested/__async_async_try_nested_nested_status (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_nested_result (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_nested_error (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
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
   i32.const 1488
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
   i32.const 1488
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
   i32.const 1488
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
   i32.const 1488
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
   i32.const 1488
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
    i32.const 1488
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
   i32.const 1488
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
   i32.const 1488
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
   i32.const 1488
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
    i32.const 1216
    i32.const 148
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   global.set $~lib/rt/itcms/iter
  end
  block $__inlined_func$~lib/rt/itcms/Object#unlink$901
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
    i32.const 37372
    i32.lt_u
    i32.and
    i32.eqz
    if
     i32.const 0
     i32.const 1216
     i32.const 128
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    br $__inlined_func$~lib/rt/itcms/Object#unlink$901
   end
   local.get $0
   i32.load offset=8
   local.tee $2
   i32.eqz
   if
    i32.const 0
    i32.const 1216
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
   i32.const 4544
   i32.load
   i32.gt_u
   if
    i32.const 1344
    i32.const 1408
    i32.const 21
    i32.const 28
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   i32.const 2
   i32.shl
   i32.const 4548
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
     block $~lib/array/Array<i32>
      block $async-try-nested/__Cps_finThrow
       block $async-try-nested/__Cps_noCatch
        block $async-try-nested/__Cps_inLoop
         block $async-try-nested/__Cps_nested
          block $~lib/promise/Promise<~lib/string/String>
           block $~lib/arraybuffer/ArrayBufferView
            block $~lib/string/String
             block $~lib/arraybuffer/ArrayBuffer
              block $~lib/object/Object
               local.get $0
               i32.const 8
               i32.sub
               i32.load
               br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $~lib/promise/Promise<~lib/string/String> $async-try-nested/__Cps_nested $folding-inner0 $async-try-nested/__Cps_inLoop $folding-inner0 $async-try-nested/__Cps_noCatch $folding-inner0 $async-try-nested/__Cps_finThrow $folding-inner0 $~lib/array/Array<i32> $invalid
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
         local.get $0
         i32.load offset=4
         call $~lib/rt/itcms/__visit
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
         i32.load offset=40
         call $~lib/rt/itcms/__visit
         local.get $0
         i32.load offset=48
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
         return
        end
        local.get $0
        i32.load offset=4
        call $~lib/rt/itcms/__visit
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
        i32.load offset=48
        call $~lib/rt/itcms/__visit
        local.get $0
        i32.load offset=52
        call $~lib/rt/itcms/__visit
        return
       end
       local.get $0
       i32.load offset=4
       call $~lib/rt/itcms/__visit
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
       i32.load offset=40
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=44
       call $~lib/rt/itcms/__visit
       return
      end
      local.get $0
      i32.load offset=4
      call $~lib/rt/itcms/__visit
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
      i32.load offset=40
      call $~lib/rt/itcms/__visit
      local.get $0
      i32.load offset=44
      call $~lib/rt/itcms/__visit
      local.get $0
      i32.load offset=48
      call $~lib/rt/itcms/__visit
      return
     end
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.sub
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     i32.const 4604
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
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/array/Array<async-try-nested/__Cps_noCatch>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
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
  i32.const 10
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
 (func $~lib/array/Array<async-try-nested/__Cps_nested>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
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
  i32.const 6
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
 (func $~lib/array/Array<async-try-nested/__Cps_inLoop>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
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
 (func $~lib/array/Array<async-try-nested/__Cps_finThrow>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
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
  i32.const 12
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
 (func $async-try-nested/__Cps_noCatch#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
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
                       i32.store8 offset=20
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=21
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=22
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1552
                       i32.store offset=24
                       local.get $0
                       i32.const 1552
                       i32.const 0
                       call $~lib/rt/itcms/__link
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
                       i32.store8 offset=36
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1552
                       i32.store offset=40
                       local.get $0
                       i32.const 1552
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
                      i32.store8 offset=48
                      i32.const 3872
                      call $async-try-nested/log
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=36
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
                     i32.const 1027
                     i32.store
                     br $while-continue|0
                    end
                    i32.const 0
                    call $async-try-nested/getChunk
                    drop
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1
                    i32.store
                    global.get $~lib/memory/__stack_pointer
                    i32.const 16
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
                   i32.store offset=8
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.load offset=12
                   local.tee $1
                   i32.store offset=4
                   local.get $0
                   local.get $1
                   i32.store offset=44
                   local.get $0
                   local.get $1
                   i32.const 0
                   call $~lib/rt/itcms/__link
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=36
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=20
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=21
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=22
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=28
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
                  i32.store
                  local.get $0
                  i32.load offset=16
                  i32.const 1
                  i32.eq
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
                i32.load8_u offset=36
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=20
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=21
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=22
                end
                if (result i32)
                 i32.const 1
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.load8_u offset=28
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
                 i32.const 1034
                 i32.store
                end
                br $while-continue|0
               end
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 0
               i32.store8 offset=20
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 0
               i32.store8 offset=21
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 0
               i32.store8 offset=22
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 3920
               i32.store offset=40
               local.get $0
               i32.const 3920
               i32.const 0
               call $~lib/rt/itcms/__link
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 1
               i32.store8 offset=36
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.load8_u offset=36
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=20
               end
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=21
               end
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=22
               end
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=28
               end
               if
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 1033
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
             i32.store8 offset=20
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 0
             i32.store8 offset=21
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 0
             i32.store8 offset=22
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store offset=12
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.load offset=44
             local.tee $1
             i32.store offset=8
             i32.const 3968
             local.get $1
             call $~lib/string/String.__concat
             local.set $1
             global.get $~lib/memory/__stack_pointer
             local.get $1
             i32.store offset=4
             local.get $0
             local.get $1
             i32.store offset=32
             local.get $0
             local.get $1
             i32.const 0
             call $~lib/rt/itcms/__link
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1
             i32.store8 offset=20
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.load8_u offset=36
             if (result i32)
              i32.const 1
             else
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.load8_u offset=20
             end
             if (result i32)
              i32.const 1
             else
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.load8_u offset=21
             end
             if (result i32)
              i32.const 1
             else
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.load8_u offset=22
             end
             if (result i32)
              i32.const 1
             else
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.load8_u offset=28
             end
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
              i32.const 1036
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
         i32.load offset=40
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
       i32.store8 offset=28
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
       br $folding-inner0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load8_u offset=20
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
     i32.store8 offset=20
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
     local.get $0
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-try-nested/__async_roots_noCatch
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-try-nested/__async_roots_noCatch
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
     call $~lib/array/Array<async-try-nested/__Cps_noCatch>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 16
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
   i32.const 16
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
  global.get $async-try-nested/__async_roots_noCatch
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_noCatch
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
  call $~lib/array/Array<async-try-nested/__Cps_noCatch>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 2
 )
 (func $async-try-nested/__Cps_nested#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  block $folding-inner0
   loop $while-continue|0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    block $case39|1
     block $case38|1
      block $case37|1
       block $case36|1
        block $case35|1
         block $case34|1
          block $case33|1
           block $case32|1
            block $case31|1
             block $case30|1
              block $case29|1
               block $case28|1
                block $case27|1
                 block $case26|1
                  block $case25|1
                   block $case24|1
                    block $case23|1
                     block $case22|1
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
                                            local.get $1
                                            i32.const 1043
                                            i32.eq
                                            br_if $case21|1
                                            local.get $1
                                            i32.const 1044
                                            i32.eq
                                            br_if $case22|1
                                            local.get $1
                                            i32.const 1045
                                            i32.eq
                                            br_if $case23|1
                                            local.get $1
                                            i32.const 1046
                                            i32.eq
                                            br_if $case24|1
                                            local.get $1
                                            i32.const 1047
                                            i32.eq
                                            br_if $case25|1
                                            local.get $1
                                            i32.const 1048
                                            i32.eq
                                            br_if $case26|1
                                            local.get $1
                                            i32.const 1049
                                            i32.eq
                                            br_if $case27|1
                                            local.get $1
                                            i32.const 1050
                                            i32.eq
                                            br_if $case28|1
                                            local.get $1
                                            i32.const 1051
                                            i32.eq
                                            br_if $case29|1
                                            local.get $1
                                            i32.const 1052
                                            i32.eq
                                            br_if $case30|1
                                            local.get $1
                                            i32.const 1053
                                            i32.eq
                                            br_if $case31|1
                                            local.get $1
                                            i32.const 1054
                                            i32.eq
                                            br_if $case32|1
                                            local.get $1
                                            i32.const 1055
                                            i32.eq
                                            br_if $case33|1
                                            local.get $1
                                            i32.const 1056
                                            i32.eq
                                            br_if $case34|1
                                            local.get $1
                                            i32.const 1057
                                            i32.eq
                                            br_if $case35|1
                                            local.get $1
                                            i32.const 1058
                                            i32.eq
                                            br_if $case36|1
                                            local.get $1
                                            i32.const 1059
                                            i32.eq
                                            br_if $case37|1
                                            local.get $1
                                            i32.const 1060
                                            i32.eq
                                            br_if $case38|1
                                            br $case39|1
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
                                          i32.const 1031
                                          i32.store
                                          br $while-continue|0
                                         end
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.store
                                         local.get $0
                                         i32.const 0
                                         i32.store8 offset=20
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.store
                                         local.get $0
                                         i32.const 0
                                         i32.store8 offset=21
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.store
                                         local.get $0
                                         i32.const 0
                                         i32.store8 offset=22
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.store
                                         local.get $0
                                         i32.const 1552
                                         i32.store offset=24
                                         local.get $0
                                         i32.const 1552
                                         i32.const 0
                                         call $~lib/rt/itcms/__link
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
                                         i32.store8 offset=36
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.store
                                         local.get $0
                                         i32.const 1552
                                         i32.store offset=40
                                         local.get $0
                                         i32.const 1552
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
                                        i32.load8_u offset=36
                                        if
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.store
                                         local.get $0
                                         i32.const 1054
                                         i32.store
                                        else
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.store
                                         local.get $0
                                         i32.const 1053
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
                                      local.get $0
                                      i32.const 0
                                      i32.store8 offset=44
                                      global.get $~lib/memory/__stack_pointer
                                      local.get $0
                                      i32.store
                                      local.get $0
                                      i32.const 1552
                                      i32.store offset=48
                                      local.get $0
                                      i32.const 1552
                                      i32.const 0
                                      call $~lib/rt/itcms/__link
                                      global.get $~lib/memory/__stack_pointer
                                      local.get $0
                                      i32.store
                                      local.get $0
                                      i32.const 1029
                                      i32.store
                                      br $while-continue|0
                                     end
                                     global.get $~lib/memory/__stack_pointer
                                     local.get $0
                                     i32.store
                                     local.get $0
                                     i32.load8_u offset=44
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
                                      i32.const 1041
                                      i32.store
                                     end
                                     br $while-continue|0
                                    end
                                    global.get $~lib/memory/__stack_pointer
                                    local.get $0
                                    i32.store
                                    local.get $0
                                    i32.const 1030
                                    i32.store
                                    br $while-continue|0
                                   end
                                   i32.const 0
                                   call $async-try-nested/getChunk
                                   drop
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.const 1
                                   i32.store
                                   global.get $~lib/memory/__stack_pointer
                                   i32.const 16
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
                                  i32.store offset=8
                                  global.get $~lib/memory/__stack_pointer
                                  local.get $0
                                  i32.load offset=12
                                  local.tee $1
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
                                  i32.load8_u offset=44
                                  if (result i32)
                                   i32.const 1
                                  else
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.load8_u offset=20
                                  end
                                  if (result i32)
                                   i32.const 1
                                  else
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.load8_u offset=21
                                  end
                                  if (result i32)
                                   i32.const 1
                                  else
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.load8_u offset=22
                                  end
                                  if (result i32)
                                   i32.const 1
                                  else
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.load8_u offset=28
                                  end
                                  if
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.const 1033
                                   i32.store
                                  else
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.const 1032
                                   i32.store
                                  end
                                  br $while-continue|0
                                 end
                                 global.get $~lib/memory/__stack_pointer
                                 local.get $0
                                 i32.store
                                 local.get $0
                                 i32.load offset=16
                                 i32.const 0
                                 i32.gt_s
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
                                  i32.const 1034
                                  i32.store
                                 end
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
                               i32.load8_u offset=44
                               if (result i32)
                                i32.const 1
                               else
                                global.get $~lib/memory/__stack_pointer
                                local.get $0
                                i32.store
                                local.get $0
                                i32.load8_u offset=20
                               end
                               if (result i32)
                                i32.const 1
                               else
                                global.get $~lib/memory/__stack_pointer
                                local.get $0
                                i32.store
                                local.get $0
                                i32.load8_u offset=21
                               end
                               if (result i32)
                                i32.const 1
                               else
                                global.get $~lib/memory/__stack_pointer
                                local.get $0
                                i32.store
                                local.get $0
                                i32.load8_u offset=22
                               end
                               if (result i32)
                                i32.const 1
                               else
                                global.get $~lib/memory/__stack_pointer
                                local.get $0
                                i32.store
                                local.get $0
                                i32.load8_u offset=28
                               end
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
                              i32.store8 offset=20
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.const 0
                              i32.store8 offset=21
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.const 0
                              i32.store8 offset=22
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.const 1584
                              i32.store offset=48
                              local.get $0
                              i32.const 1584
                              i32.const 0
                              call $~lib/rt/itcms/__link
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.const 1
                              i32.store8 offset=44
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.load8_u offset=44
                              if (result i32)
                               i32.const 1
                              else
                               global.get $~lib/memory/__stack_pointer
                               local.get $0
                               i32.store
                               local.get $0
                               i32.load8_u offset=20
                              end
                              if (result i32)
                               i32.const 1
                              else
                               global.get $~lib/memory/__stack_pointer
                               local.get $0
                               i32.store
                               local.get $0
                               i32.load8_u offset=21
                              end
                              if (result i32)
                               i32.const 1
                              else
                               global.get $~lib/memory/__stack_pointer
                               local.get $0
                               i32.store
                               local.get $0
                               i32.load8_u offset=22
                              end
                              if (result i32)
                               i32.const 1
                              else
                               global.get $~lib/memory/__stack_pointer
                               local.get $0
                               i32.store
                               local.get $0
                               i32.load8_u offset=28
                              end
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
                               i32.const 1034
                               i32.store
                              end
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
                            i32.store8 offset=20
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 0
                            i32.store8 offset=21
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 0
                            i32.store8 offset=22
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store offset=12
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.load offset=52
                            local.tee $1
                            i32.store offset=8
                            i32.const 1632
                            local.get $1
                            call $~lib/string/String.__concat
                            local.set $1
                            global.get $~lib/memory/__stack_pointer
                            local.get $1
                            i32.store offset=4
                            local.get $0
                            local.get $1
                            i32.store offset=32
                            local.get $0
                            local.get $1
                            i32.const 0
                            call $~lib/rt/itcms/__link
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 1
                            i32.store8 offset=20
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.load8_u offset=44
                            if (result i32)
                             i32.const 1
                            else
                             global.get $~lib/memory/__stack_pointer
                             local.get $0
                             i32.store
                             local.get $0
                             i32.load8_u offset=20
                            end
                            if (result i32)
                             i32.const 1
                            else
                             global.get $~lib/memory/__stack_pointer
                             local.get $0
                             i32.store
                             local.get $0
                             i32.load8_u offset=21
                            end
                            if (result i32)
                             i32.const 1
                            else
                             global.get $~lib/memory/__stack_pointer
                             local.get $0
                             i32.store
                             local.get $0
                             i32.load8_u offset=22
                            end
                            if (result i32)
                             i32.const 1
                            else
                             global.get $~lib/memory/__stack_pointer
                             local.get $0
                             i32.store
                             local.get $0
                             i32.load8_u offset=28
                            end
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
                             i32.const 1039
                             i32.store
                            end
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
                          i32.const 1028
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
                        i32.store8 offset=60
                        i32.const 1664
                        call $async-try-nested/log
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=44
                        if
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.const 1048
                         i32.store
                        else
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.const 1049
                         i32.store
                        end
                        br $while-continue|0
                       end
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=44
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store offset=8
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.load offset=48
                       local.tee $1
                       i32.store offset=4
                       local.get $0
                       local.get $1
                       i32.store offset=56
                       local.get $0
                       local.get $1
                       i32.const 0
                       call $~lib/rt/itcms/__link
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store offset=8
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.load offset=56
                       local.tee $1
                       i32.store offset=4
                       i32.const 1712
                       local.get $1
                       call $~lib/string/String.__concat
                       local.set $1
                       global.get $~lib/memory/__stack_pointer
                       local.get $1
                       i32.store
                       local.get $1
                       call $async-try-nested/log
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.load8_u offset=36
                       if (result i32)
                        i32.const 1
                       else
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=20
                       end
                       if (result i32)
                        i32.const 1
                       else
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=21
                       end
                       if (result i32)
                        i32.const 1
                       else
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=22
                       end
                       if (result i32)
                        i32.const 1
                       else
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=28
                       end
                       if
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.const 1041
                        i32.store
                       else
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.const 1043
                        i32.store
                       end
                       br $while-continue|0
                      end
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load offset=16
                      i32.const 2
                      i32.eq
                      if
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1045
                       i32.store
                      else
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1044
                       i32.store
                      end
                      br $while-continue|0
                     end
                     global.get $~lib/memory/__stack_pointer
                     local.get $0
                     i32.store
                     local.get $0
                     i32.load8_u offset=36
                     if (result i32)
                      i32.const 1
                     else
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=20
                     end
                     if (result i32)
                      i32.const 1
                     else
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=21
                     end
                     if (result i32)
                      i32.const 1
                     else
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=22
                     end
                     if (result i32)
                      i32.const 1
                     else
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=28
                     end
                     if
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.const 1041
                      i32.store
                     else
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.const 1046
                      i32.store
                     end
                     br $while-continue|0
                    end
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=20
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=21
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=22
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1760
                    i32.store offset=40
                    local.get $0
                    i32.const 1760
                    i32.const 0
                    call $~lib/rt/itcms/__link
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1
                    i32.store8 offset=36
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1044
                    i32.store
                    br $while-continue|0
                   end
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 0
                   i32.store8 offset=20
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 0
                   i32.store8 offset=21
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 0
                   i32.store8 offset=22
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1808
                   i32.store offset=32
                   local.get $0
                   i32.const 1808
                   i32.const 0
                   call $~lib/rt/itcms/__link
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1
                   i32.store8 offset=20
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1041
                   i32.store
                   br $while-continue|0
                  end
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.load8_u offset=36
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=20
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=21
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=22
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=28
                  end
                  if
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1052
                   i32.store
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1051
                   i32.store
                  end
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
                 i32.load offset=48
                 local.tee $1
                 i32.store offset=4
                 local.get $0
                 local.get $1
                 i32.store offset=40
                 local.get $0
                 local.get $1
                 i32.const 0
                 call $~lib/rt/itcms/__link
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1
                 i32.store8 offset=36
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1047
                 i32.store
                 br $while-continue|0
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
                 i32.const 1050
                 i32.store
                else
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1047
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
               i32.store offset=8
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.load offset=24
               local.tee $1
               i32.store offset=4
               local.get $0
               local.get $1
               i32.store offset=40
               local.get $0
               local.get $1
               i32.const 0
               call $~lib/rt/itcms/__link
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 1
               i32.store8 offset=36
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 1047
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
            i32.const 1856
            call $async-try-nested/log
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=36
            if
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1056
             i32.store
            else
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1057
             i32.store
            end
            br $while-continue|0
           end
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.const 0
           i32.store8 offset=36
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store offset=8
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.load offset=40
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
           i32.const 1904
           local.get $1
           call $~lib/string/String.__concat
           local.set $1
           global.get $~lib/memory/__stack_pointer
           local.get $1
           i32.store
           local.get $1
           call $async-try-nested/log
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.load8_u offset=20
           if (result i32)
            i32.const 1
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=21
           end
           if (result i32)
            i32.const 1
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=22
           end
           if (result i32)
            i32.const 1
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=28
           end
           if
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 1053
            i32.store
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 1055
            i32.store
           end
           br $while-continue|0
          end
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=20
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=21
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=22
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1952
          i32.store offset=32
          local.get $0
          i32.const 1952
          i32.const 0
          call $~lib/rt/itcms/__link
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1
          i32.store8 offset=20
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1053
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
         i32.load offset=40
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
         i32.const 1058
         i32.store
        else
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.const 1059
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
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=24
       local.tee $1
       i32.store offset=4
       br $folding-inner0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load8_u offset=20
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1060
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
     i32.store8 offset=20
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
     local.get $0
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-try-nested/__async_roots_nested
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-try-nested/__async_roots_nested
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
     call $~lib/array/Array<async-try-nested/__Cps_nested>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 16
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
   i32.const 16
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
  global.get $async-try-nested/__async_roots_nested
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_nested
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
  call $~lib/array/Array<async-try-nested/__Cps_nested>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 2
 )
 (func $async-try-nested/__Cps_inLoop#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  block $folding-inner1
   block $folding-inner0
    loop $while-continue|0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     block $case39|1
      block $case38|1
       block $case37|1
        block $case36|1
         block $case35|1
          block $case34|1
           block $case33|1
            block $case32|1
             block $case31|1
              block $case30|1
               block $case29|1
                block $case28|1
                 block $case27|1
                  block $case26|1
                   block $case25|1
                    block $case24|1
                     block $case23|1
                      block $case22|1
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
                                             local.get $1
                                             i32.const 1043
                                             i32.eq
                                             br_if $case21|1
                                             local.get $1
                                             i32.const 1044
                                             i32.eq
                                             br_if $case22|1
                                             local.get $1
                                             i32.const 1045
                                             i32.eq
                                             br_if $case23|1
                                             local.get $1
                                             i32.const 1046
                                             i32.eq
                                             br_if $case24|1
                                             local.get $1
                                             i32.const 1047
                                             i32.eq
                                             br_if $case25|1
                                             local.get $1
                                             i32.const 1048
                                             i32.eq
                                             br_if $case26|1
                                             local.get $1
                                             i32.const 1049
                                             i32.eq
                                             br_if $case27|1
                                             local.get $1
                                             i32.const 1050
                                             i32.eq
                                             br_if $case28|1
                                             local.get $1
                                             i32.const 1051
                                             i32.eq
                                             br_if $case29|1
                                             local.get $1
                                             i32.const 1052
                                             i32.eq
                                             br_if $case30|1
                                             local.get $1
                                             i32.const 1053
                                             i32.eq
                                             br_if $case31|1
                                             local.get $1
                                             i32.const 1054
                                             i32.eq
                                             br_if $case32|1
                                             local.get $1
                                             i32.const 1055
                                             i32.eq
                                             br_if $case33|1
                                             local.get $1
                                             i32.const 1056
                                             i32.eq
                                             br_if $case34|1
                                             local.get $1
                                             i32.const 1057
                                             i32.eq
                                             br_if $case35|1
                                             local.get $1
                                             i32.const 1058
                                             i32.eq
                                             br_if $case36|1
                                             local.get $1
                                             i32.const 1059
                                             i32.eq
                                             br_if $case37|1
                                             local.get $1
                                             i32.const 1060
                                             i32.eq
                                             br_if $case38|1
                                             br $case39|1
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
                                           i32.const 1032
                                           i32.store
                                           br $while-continue|0
                                          end
                                          global.get $~lib/memory/__stack_pointer
                                          local.get $0
                                          i32.store
                                          local.get $0
                                          i32.const 0
                                          i32.store8 offset=20
                                          global.get $~lib/memory/__stack_pointer
                                          local.get $0
                                          i32.store
                                          local.get $0
                                          i32.const 0
                                          i32.store8 offset=21
                                          global.get $~lib/memory/__stack_pointer
                                          local.get $0
                                          i32.store
                                          local.get $0
                                          i32.const 0
                                          i32.store8 offset=22
                                          global.get $~lib/memory/__stack_pointer
                                          local.get $0
                                          i32.store
                                          local.get $0
                                          i32.const 1552
                                          i32.store offset=24
                                          local.get $0
                                          i32.const 1552
                                          i32.const 0
                                          call $~lib/rt/itcms/__link
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
                                          i32.const 1552
                                          i32.store offset=36
                                          local.get $0
                                          i32.const 1552
                                          i32.const 0
                                          call $~lib/rt/itcms/__link
                                          global.get $~lib/memory/__stack_pointer
                                          local.get $0
                                          i32.store
                                          local.get $0
                                          i32.const 0
                                          i32.store offset=40
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
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.store offset=12
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.load offset=36
                                         local.tee $1
                                         i32.store offset=8
                                         i32.const 2000
                                         local.get $1
                                         call $~lib/string/String.__concat
                                         local.set $1
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $1
                                         i32.store offset=4
                                         br $folding-inner0
                                        end
                                        global.get $~lib/memory/__stack_pointer
                                        local.get $0
                                        i32.store
                                        local.get $0
                                        i32.load offset=40
                                        i32.const 3
                                        i32.lt_s
                                        if
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.store
                                         local.get $0
                                         i32.const 1027
                                         i32.store
                                        else
                                         global.get $~lib/memory/__stack_pointer
                                         local.get $0
                                         i32.store
                                         local.get $0
                                         i32.const 1025
                                         i32.store
                                        end
                                        br $while-continue|0
                                       end
                                       global.get $~lib/memory/__stack_pointer
                                       local.get $0
                                       i32.store
                                       local.get $0
                                       i32.const 0
                                       i32.store8 offset=44
                                       global.get $~lib/memory/__stack_pointer
                                       local.get $0
                                       i32.store
                                       local.get $0
                                       i32.const 1552
                                       i32.store offset=48
                                       local.get $0
                                       i32.const 1552
                                       i32.const 0
                                       call $~lib/rt/itcms/__link
                                       global.get $~lib/memory/__stack_pointer
                                       local.get $0
                                       i32.store
                                       local.get $0
                                       i32.const 1030
                                       i32.store
                                       br $while-continue|0
                                      end
                                      global.get $~lib/memory/__stack_pointer
                                      local.get $0
                                      i32.store
                                      global.get $~lib/memory/__stack_pointer
                                      local.get $0
                                      i32.store offset=4
                                      local.get $0
                                      local.get $0
                                      i32.load offset=40
                                      i32.const 1
                                      i32.add
                                      i32.store offset=40
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
                                     i32.store8 offset=56
                                     global.get $~lib/memory/__stack_pointer
                                     local.get $0
                                     i32.store offset=8
                                     local.get $0
                                     i32.load offset=40
                                     call $~lib/number/I32#toString
                                     local.set $1
                                     global.get $~lib/memory/__stack_pointer
                                     local.get $1
                                     i32.store offset=4
                                     i32.const 2032
                                     local.get $1
                                     call $~lib/string/String.__concat
                                     local.set $1
                                     global.get $~lib/memory/__stack_pointer
                                     local.get $1
                                     i32.store
                                     local.get $1
                                     call $async-try-nested/log
                                     global.get $~lib/memory/__stack_pointer
                                     local.get $0
                                     i32.store
                                     local.get $0
                                     i32.load8_u offset=44
                                     if
                                      global.get $~lib/memory/__stack_pointer
                                      local.get $0
                                      i32.store
                                      local.get $0
                                      i32.const 1052
                                      i32.store
                                     else
                                      global.get $~lib/memory/__stack_pointer
                                      local.get $0
                                      i32.store
                                      local.get $0
                                      i32.const 1053
                                      i32.store
                                     end
                                     br $while-continue|0
                                    end
                                    global.get $~lib/memory/__stack_pointer
                                    local.get $0
                                    i32.store
                                    local.get $0
                                    i32.const 1031
                                    i32.store
                                    br $while-continue|0
                                   end
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.load offset=40
                                   call $async-try-nested/getChunk
                                   drop
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.const 1
                                   i32.store
                                   global.get $~lib/memory/__stack_pointer
                                   i32.const 20
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
                                  i32.store offset=8
                                  global.get $~lib/memory/__stack_pointer
                                  local.get $0
                                  i32.load offset=12
                                  local.tee $1
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
                                  i32.load8_u offset=44
                                  if (result i32)
                                   i32.const 1
                                  else
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.load8_u offset=20
                                  end
                                  if (result i32)
                                   i32.const 1
                                  else
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.load8_u offset=21
                                  end
                                  if (result i32)
                                   i32.const 1
                                  else
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.load8_u offset=22
                                  end
                                  if (result i32)
                                   i32.const 1
                                  else
                                   global.get $~lib/memory/__stack_pointer
                                   local.get $0
                                   i32.store
                                   local.get $0
                                   i32.load8_u offset=28
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
                                 global.get $~lib/memory/__stack_pointer
                                 local.get $0
                                 i32.store offset=16
                                 global.get $~lib/memory/__stack_pointer
                                 local.get $0
                                 i32.load offset=36
                                 local.tee $1
                                 i32.store offset=8
                                 global.get $~lib/memory/__stack_pointer
                                 local.get $0
                                 i32.store offset=16
                                 global.get $~lib/memory/__stack_pointer
                                 local.get $0
                                 i32.load offset=52
                                 local.tee $2
                                 i32.store offset=12
                                 local.get $1
                                 local.get $2
                                 call $~lib/string/String.__concat
                                 local.set $1
                                 global.get $~lib/memory/__stack_pointer
                                 local.get $1
                                 i32.store offset=4
                                 local.get $0
                                 local.get $1
                                 i32.store offset=36
                                 local.get $0
                                 local.get $1
                                 i32.const 0
                                 call $~lib/rt/itcms/__link
                                 global.get $~lib/memory/__stack_pointer
                                 local.get $0
                                 i32.store
                                 local.get $0
                                 i32.load8_u offset=44
                                 if (result i32)
                                  i32.const 1
                                 else
                                  global.get $~lib/memory/__stack_pointer
                                  local.get $0
                                  i32.store
                                  local.get $0
                                  i32.load8_u offset=20
                                 end
                                 if (result i32)
                                  i32.const 1
                                 else
                                  global.get $~lib/memory/__stack_pointer
                                  local.get $0
                                  i32.store
                                  local.get $0
                                  i32.load8_u offset=21
                                 end
                                 if (result i32)
                                  i32.const 1
                                 else
                                  global.get $~lib/memory/__stack_pointer
                                  local.get $0
                                  i32.store
                                  local.get $0
                                  i32.load8_u offset=22
                                 end
                                 if (result i32)
                                  i32.const 1
                                 else
                                  global.get $~lib/memory/__stack_pointer
                                  local.get $0
                                  i32.store
                                  local.get $0
                                  i32.load8_u offset=28
                                 end
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
                                i32.const 1029
                                i32.store
                                br $while-continue|0
                               end
                               global.get $~lib/memory/__stack_pointer
                               local.get $0
                               i32.store
                               local.get $0
                               i32.load offset=16
                               i32.const 1
                               i32.eq
                               if (result i32)
                                global.get $~lib/memory/__stack_pointer
                                local.get $0
                                i32.store
                                local.get $0
                                i32.load offset=40
                                i32.const 1
                                i32.eq
                               else
                                i32.const 0
                               end
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
                                i32.const 1037
                                i32.store
                               end
                               br $while-continue|0
                              end
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.const 1029
                              i32.store
                              br $while-continue|0
                             end
                             global.get $~lib/memory/__stack_pointer
                             local.get $0
                             i32.store
                             local.get $0
                             i32.load8_u offset=44
                             if (result i32)
                              i32.const 1
                             else
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.load8_u offset=20
                             end
                             if (result i32)
                              i32.const 1
                             else
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.load8_u offset=21
                             end
                             if (result i32)
                              i32.const 1
                             else
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.load8_u offset=22
                             end
                             if (result i32)
                              i32.const 1
                             else
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.load8_u offset=28
                             end
                             if
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.const 1041
                              i32.store
                             else
                              global.get $~lib/memory/__stack_pointer
                              local.get $0
                              i32.store
                              local.get $0
                              i32.const 1040
                              i32.store
                             end
                             br $while-continue|0
                            end
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 0
                            i32.store8 offset=20
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 0
                            i32.store8 offset=21
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 0
                            i32.store8 offset=22
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 1
                            i32.store8 offset=21
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.load8_u offset=44
                            if (result i32)
                             i32.const 1
                            else
                             global.get $~lib/memory/__stack_pointer
                             local.get $0
                             i32.store
                             local.get $0
                             i32.load8_u offset=20
                            end
                            if (result i32)
                             i32.const 1
                            else
                             global.get $~lib/memory/__stack_pointer
                             local.get $0
                             i32.store
                             local.get $0
                             i32.load8_u offset=21
                            end
                            if (result i32)
                             i32.const 1
                            else
                             global.get $~lib/memory/__stack_pointer
                             local.get $0
                             i32.store
                             local.get $0
                             i32.load8_u offset=22
                            end
                            if (result i32)
                             i32.const 1
                            else
                             global.get $~lib/memory/__stack_pointer
                             local.get $0
                             i32.store
                             local.get $0
                             i32.load8_u offset=28
                            end
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
                             i32.const 1037
                             i32.store
                            end
                            br $while-continue|0
                           end
                           global.get $~lib/memory/__stack_pointer
                           local.get $0
                           i32.store
                           local.get $0
                           i32.const 1029
                           i32.store
                           br $while-continue|0
                          end
                          global.get $~lib/memory/__stack_pointer
                          local.get $0
                          i32.store
                          local.get $0
                          i32.load offset=16
                          i32.const 2
                          i32.eq
                          if (result i32)
                           global.get $~lib/memory/__stack_pointer
                           local.get $0
                           i32.store
                           local.get $0
                           i32.load offset=40
                          else
                           i32.const 1
                          end
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
                           i32.const 1043
                           i32.store
                          end
                          br $while-continue|0
                         end
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.const 1029
                         i32.store
                         br $while-continue|0
                        end
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=44
                        if (result i32)
                         i32.const 1
                        else
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.load8_u offset=20
                        end
                        if (result i32)
                         i32.const 1
                        else
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.load8_u offset=21
                        end
                        if (result i32)
                         i32.const 1
                        else
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.load8_u offset=22
                        end
                        if (result i32)
                         i32.const 1
                        else
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.load8_u offset=28
                        end
                        if
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.const 1046
                         i32.store
                        else
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.const 1045
                         i32.store
                        end
                        br $while-continue|0
                       end
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=20
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=21
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=22
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1
                       i32.store8 offset=22
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.load8_u offset=44
                       if (result i32)
                        i32.const 1
                       else
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=20
                       end
                       if (result i32)
                        i32.const 1
                       else
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=21
                       end
                       if (result i32)
                        i32.const 1
                       else
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=22
                       end
                       if (result i32)
                        i32.const 1
                       else
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=28
                       end
                       if
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.const 1044
                        i32.store
                       else
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.const 1042
                        i32.store
                       end
                       br $while-continue|0
                      end
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.const 1029
                      i32.store
                      br $while-continue|0
                     end
                     global.get $~lib/memory/__stack_pointer
                     local.get $0
                     i32.store
                     local.get $0
                     i32.load offset=16
                     i32.const 3
                     i32.eq
                     if (result i32)
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load offset=40
                      i32.const 1
                      i32.eq
                     else
                      i32.const 0
                     end
                     if
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.const 1048
                      i32.store
                     else
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.const 1047
                      i32.store
                     end
                     br $while-continue|0
                    end
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1029
                    i32.store
                    br $while-continue|0
                   end
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=44
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=20
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=21
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=22
                   end
                   if (result i32)
                    i32.const 1
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=28
                   end
                   if
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1051
                    i32.store
                   else
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1050
                    i32.store
                   end
                   br $while-continue|0
                  end
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.const 0
                  i32.store8 offset=20
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.const 0
                  i32.store8 offset=21
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.const 0
                  i32.store8 offset=22
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store offset=12
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.load offset=36
                  local.tee $1
                  i32.store offset=8
                  i32.const 3840
                  local.get $1
                  call $~lib/string/String.__concat
                  local.set $1
                  global.get $~lib/memory/__stack_pointer
                  local.get $1
                  i32.store offset=4
                  local.get $0
                  local.get $1
                  i32.store offset=32
                  local.get $0
                  local.get $1
                  i32.const 0
                  call $~lib/rt/itcms/__link
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.const 1
                  i32.store8 offset=20
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.load8_u offset=44
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=20
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=21
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=22
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=28
                  end
                  if
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1049
                   i32.store
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.const 1047
                   i32.store
                  end
                  br $while-continue|0
                 end
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1029
                 i32.store
                 br $while-continue|0
                end
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 1029
                i32.store
                br $while-continue|0
               end
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 1029
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
              i32.load offset=48
              local.tee $1
              i32.store offset=4
              br $folding-inner1
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
              i32.const 1054
              i32.store
             else
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.const 1055
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
            i32.store offset=8
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.load offset=24
            local.tee $1
            i32.store offset=4
            br $folding-inner1
           end
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.load8_u offset=20
           if
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 1056
            i32.store
           else
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 1057
            i32.store
           end
           br $while-continue|0
          end
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=20
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
         i32.load8_u offset=21
         if
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1058
          i32.store
         else
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1059
          i32.store
         end
         br $while-continue|0
        end
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.const 0
        i32.store8 offset=21
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
       i32.load8_u offset=22
       if
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.const 1060
        i32.store
       else
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.const 1028
        i32.store
       end
       br $while-continue|0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 0
      i32.store8 offset=22
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 1028
      i32.store
      br $while-continue|0
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
    i32.const 20
    i32.add
    global.set $~lib/memory/__stack_pointer
    return
   end
   local.get $0
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const -1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-try-nested/__async_roots_inLoop
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-try-nested/__async_roots_inLoop
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
   call $~lib/array/Array<async-try-nested/__Cps_inLoop>#splice
   global.get $~lib/memory/__stack_pointer
   i32.const 20
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 1
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
  global.get $async-try-nested/__async_roots_inLoop
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_inLoop
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
  call $~lib/array/Array<async-try-nested/__Cps_inLoop>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 2
 )
 (func $async-try-nested/__Cps_finThrow#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  block $folding-inner0
   loop $while-continue|0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    block $case26|1
     block $case25|1
      block $case24|1
       block $case23|1
        block $case22|1
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
                               local.get $1
                               i32.const 1043
                               i32.eq
                               br_if $case21|1
                               local.get $1
                               i32.const 1044
                               i32.eq
                               br_if $case22|1
                               local.get $1
                               i32.const 1045
                               i32.eq
                               br_if $case23|1
                               local.get $1
                               i32.const 1046
                               i32.eq
                               br_if $case24|1
                               local.get $1
                               i32.const 1047
                               i32.eq
                               br_if $case25|1
                               br $case26|1
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
                            i32.store8 offset=20
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 0
                            i32.store8 offset=21
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 0
                            i32.store8 offset=22
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 1552
                            i32.store offset=24
                            local.get $0
                            i32.const 1552
                            i32.const 0
                            call $~lib/rt/itcms/__link
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
                            i32.store8 offset=36
                            global.get $~lib/memory/__stack_pointer
                            local.get $0
                            i32.store
                            local.get $0
                            i32.const 1552
                            i32.store offset=40
                            local.get $0
                            i32.const 1552
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
                           i32.load8_u offset=36
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
                            i32.const 1038
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
                         i32.const 0
                         call $async-try-nested/getChunk
                         drop
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.const 1
                         i32.store
                         global.get $~lib/memory/__stack_pointer
                         i32.const 16
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
                        i32.store offset=8
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.load offset=12
                        local.tee $1
                        i32.store offset=4
                        local.get $0
                        local.get $1
                        i32.store offset=44
                        local.get $0
                        local.get $1
                        i32.const 0
                        call $~lib/rt/itcms/__link
                        global.get $~lib/memory/__stack_pointer
                        local.get $0
                        i32.store
                        local.get $0
                        i32.load8_u offset=36
                        if (result i32)
                         i32.const 1
                        else
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.load8_u offset=20
                        end
                        if (result i32)
                         i32.const 1
                        else
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.load8_u offset=21
                        end
                        if (result i32)
                         i32.const 1
                        else
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.load8_u offset=22
                        end
                        if (result i32)
                         i32.const 1
                        else
                         global.get $~lib/memory/__stack_pointer
                         local.get $0
                         i32.store
                         local.get $0
                         i32.load8_u offset=28
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
                       i32.store
                       local.get $0
                       i32.load offset=16
                       i32.const 1
                       i32.eq
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
                     i32.load8_u offset=36
                     if (result i32)
                      i32.const 1
                     else
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=20
                     end
                     if (result i32)
                      i32.const 1
                     else
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=21
                     end
                     if (result i32)
                      i32.const 1
                     else
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=22
                     end
                     if (result i32)
                      i32.const 1
                     else
                      global.get $~lib/memory/__stack_pointer
                      local.get $0
                      i32.store
                      local.get $0
                      i32.load8_u offset=28
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
                      i32.const 1034
                      i32.store
                     end
                     br $while-continue|0
                    end
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=20
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=21
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 0
                    i32.store8 offset=22
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store offset=12
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.load offset=44
                    local.tee $1
                    i32.store offset=8
                    i32.const 4000
                    local.get $1
                    call $~lib/string/String.__concat
                    local.set $1
                    global.get $~lib/memory/__stack_pointer
                    local.get $1
                    i32.store offset=4
                    local.get $0
                    local.get $1
                    i32.store offset=32
                    local.get $0
                    local.get $1
                    i32.const 0
                    call $~lib/rt/itcms/__link
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.const 1
                    i32.store8 offset=20
                    global.get $~lib/memory/__stack_pointer
                    local.get $0
                    i32.store
                    local.get $0
                    i32.load8_u offset=36
                    if (result i32)
                     i32.const 1
                    else
                     global.get $~lib/memory/__stack_pointer
                     local.get $0
                     i32.store
                     local.get $0
                     i32.load8_u offset=20
                    end
                    if (result i32)
                     i32.const 1
                    else
                     global.get $~lib/memory/__stack_pointer
                     local.get $0
                     i32.store
                     local.get $0
                     i32.load8_u offset=21
                    end
                    if (result i32)
                     i32.const 1
                    else
                     global.get $~lib/memory/__stack_pointer
                     local.get $0
                     i32.store
                     local.get $0
                     i32.load8_u offset=22
                    end
                    if (result i32)
                     i32.const 1
                    else
                     global.get $~lib/memory/__stack_pointer
                     local.get $0
                     i32.store
                     local.get $0
                     i32.load8_u offset=28
                    end
                    if
                     global.get $~lib/memory/__stack_pointer
                     local.get $0
                     i32.store
                     local.get $0
                     i32.const 1033
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
                  i32.store8 offset=20
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.const 0
                  i32.store8 offset=21
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.const 0
                  i32.store8 offset=22
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store offset=12
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.load offset=44
                  local.tee $1
                  i32.store offset=8
                  i32.const 4032
                  local.get $1
                  call $~lib/string/String.__concat
                  local.set $1
                  global.get $~lib/memory/__stack_pointer
                  local.get $1
                  i32.store offset=4
                  local.get $0
                  local.get $1
                  i32.store offset=32
                  local.get $0
                  local.get $1
                  i32.const 0
                  call $~lib/rt/itcms/__link
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.const 1
                  i32.store8 offset=20
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.load8_u offset=36
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=20
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=21
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=22
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=28
                  end
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
                   i32.const 1036
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
              i32.store8 offset=52
              i32.const 4064
              call $async-try-nested/log
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              local.get $0
              i32.load8_u offset=52
              if (result i32)
               i32.const 1
              else
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.load8_u offset=28
              end
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
             i32.store8 offset=36
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store offset=8
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.load offset=40
             local.tee $1
             i32.store offset=4
             local.get $0
             local.get $1
             i32.store offset=48
             local.get $0
             local.get $1
             i32.const 0
             call $~lib/rt/itcms/__link
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 0
             i32.store8 offset=20
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 0
             i32.store8 offset=21
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 0
             i32.store8 offset=22
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store offset=12
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.load offset=48
             local.tee $1
             i32.store offset=8
             i32.const 4112
             local.get $1
             call $~lib/string/String.__concat
             local.set $1
             global.get $~lib/memory/__stack_pointer
             local.get $1
             i32.store offset=4
             local.get $0
             local.get $1
             i32.store offset=32
             local.get $0
             local.get $1
             i32.const 0
             call $~lib/rt/itcms/__link
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1
             i32.store8 offset=20
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1038
             i32.store
             br $while-continue|0
            end
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.load8_u offset=36
            if
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1043
             i32.store
            else
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 1044
             i32.store
            end
            br $while-continue|0
           end
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.load offset=16
           i32.const 1
           i32.eq
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
            i32.const 1040
            i32.store
           end
           br $while-continue|0
          end
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=36
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=20
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=21
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=22
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 4144
          i32.store offset=24
          local.get $0
          i32.const 4144
          i32.const 0
          call $~lib/rt/itcms/__link
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
          i32.const 1040
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
         i32.load offset=40
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
         i32.const 1045
         i32.store
        else
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.const 1046
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
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=24
       local.tee $1
       i32.store offset=4
       br $folding-inner0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load8_u offset=20
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1047
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
     i32.store8 offset=20
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
     local.get $0
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-try-nested/__async_roots_finThrow
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-try-nested/__async_roots_finThrow
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
     call $~lib/array/Array<async-try-nested/__Cps_finThrow>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 16
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
   i32.const 16
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
  global.get $async-try-nested/__async_roots_finThrow
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_finThrow
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
  call $~lib/array/Array<async-try-nested/__Cps_finThrow>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 2
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
   i32.const 1488
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
     i32.const 1488
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
  i32.const 37376
  i32.const 0
  i32.store
  i32.const 38944
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
    i32.const 37376
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
      i32.const 37376
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
  i32.const 37376
  i32.const 38948
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 37376
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
   i32.const 1488
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
    i32.const 1488
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
    i32.const 1488
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
  i32.const 1344
  call $~lib/rt/itcms/__visit
  i32.const 1056
  call $~lib/rt/itcms/__visit
  i32.const 4432
  call $~lib/rt/itcms/__visit
  i32.const 1152
  call $~lib/rt/itcms/__visit
  i32.const 2688
  call $~lib/rt/itcms/__visit
  i32.const 3744
  call $~lib/rt/itcms/__visit
  global.get $async-try-nested/__async_roots_nested
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-try-nested/__async_roots_inLoop
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-try-nested/__async_roots_noCatch
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-try-nested/__async_roots_finThrow
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
     i32.const 1216
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
 (func $~start
  call $start:async-try-nested
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
      i32.const 37372
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
     i32.const 1216
     i32.const 229
     i32.const 20
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 37372
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
     i32.const 37372
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
       i32.const 1488
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
 (func $~lib/number/I32#toString (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  block $__inlined_func$~lib/util/number/itoa32$82
   local.get $0
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 2256
    local.set $2
    br $__inlined_func$~lib/util/number/itoa32$82
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   local.get $0
   i32.sub
   local.get $0
   local.get $0
   i32.const 31
   i32.shr_u
   i32.const 1
   i32.shl
   local.tee $3
   select
   local.tee $0
   i32.const 100000
   i32.lt_u
   if (result i32)
    local.get $0
    i32.const 100
    i32.lt_u
    if (result i32)
     local.get $0
     i32.const 10
     i32.ge_u
     i32.const 1
     i32.add
    else
     local.get $0
     i32.const 10000
     i32.ge_u
     i32.const 3
     i32.add
     local.get $0
     i32.const 1000
     i32.ge_u
     i32.add
    end
   else
    local.get $0
    i32.const 10000000
    i32.lt_u
    if (result i32)
     local.get $0
     i32.const 1000000
     i32.ge_u
     i32.const 6
     i32.add
    else
     local.get $0
     i32.const 1000000000
     i32.ge_u
     i32.const 8
     i32.add
     local.get $0
     i32.const 100000000
     i32.ge_u
     i32.add
    end
   end
   local.tee $1
   i32.const 1
   i32.shl
   local.get $3
   i32.add
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $2
   i32.store
   local.get $2
   local.get $3
   i32.add
   local.set $5
   loop $while-continue|0
    local.get $0
    i32.const 10000
    i32.ge_u
    if
     local.get $0
     i32.const 10000
     i32.rem_u
     local.set $4
     local.get $0
     i32.const 10000
     i32.div_u
     local.set $0
     local.get $5
     local.get $1
     i32.const 4
     i32.sub
     local.tee $1
     i32.const 1
     i32.shl
     i32.add
     local.get $4
     i32.const 100
     i32.div_u
     i32.const 2
     i32.shl
     i32.const 2268
     i32.add
     i64.load32_u
     local.get $4
     i32.const 100
     i32.rem_u
     i32.const 2
     i32.shl
     i32.const 2268
     i32.add
     i64.load32_u
     i64.const 32
     i64.shl
     i64.or
     i64.store
     br $while-continue|0
    end
   end
   local.get $0
   i32.const 100
   i32.ge_u
   if
    local.get $5
    local.get $1
    i32.const 2
    i32.sub
    local.tee $1
    i32.const 1
    i32.shl
    i32.add
    local.get $0
    i32.const 100
    i32.rem_u
    i32.const 2
    i32.shl
    i32.const 2268
    i32.add
    i32.load
    i32.store
    local.get $0
    i32.const 100
    i32.div_u
    local.set $0
   end
   local.get $0
   i32.const 10
   i32.ge_u
   if
    local.get $5
    local.get $1
    i32.const 2
    i32.sub
    i32.const 1
    i32.shl
    i32.add
    local.get $0
    i32.const 2
    i32.shl
    i32.const 2268
    i32.add
    i32.load
    i32.store
   else
    local.get $5
    local.get $1
    i32.const 1
    i32.sub
    i32.const 1
    i32.shl
    i32.add
    local.get $0
    i32.const 48
    i32.add
    i32.store16
   end
   local.get $3
   if
    local.get $2
    i32.const 45
    i32.store16
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
  end
  local.get $2
 )
 (func $start:async-try-nested
  (local $0 i32)
  (local $1 i32)
  memory.size
  i32.const 16
  i32.shl
  i32.const 37372
  i32.sub
  i32.const 1
  i32.shr_u
  global.set $~lib/rt/itcms/threshold
  i32.const 1268
  i32.const 1264
  i32.store
  i32.const 1272
  i32.const 1264
  i32.store
  i32.const 1264
  global.set $~lib/rt/itcms/pinSpace
  i32.const 1300
  i32.const 1296
  i32.store
  i32.const 1304
  i32.const 1296
  i32.store
  i32.const 1296
  global.set $~lib/rt/itcms/toSpace
  i32.const 1444
  i32.const 1440
  i32.store
  i32.const 1448
  i32.const 1440
  i32.store
  i32.const 1440
  global.set $~lib/rt/itcms/fromSpace
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 6
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
   global.set $async-try-nested/__async_roots_nested
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   global.set $async-try-nested/__async_roots_inLoop
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 10
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
   global.set $async-try-nested/__async_roots_noCatch
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 12
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
   global.set $async-try-nested/__async_roots_finThrow
   return
  end
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_noCatch_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
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
   local.get $0
   call $async-try-nested/__Cps_noCatch#step
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_noCatch_reject_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
   i32.store8 offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=40
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-try-nested/__Cps_noCatch#step
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_noCatch_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
    global.get $async-try-nested/__async_roots_noCatch
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-try-nested/__async_roots_noCatch
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
    call $~lib/array/Array<async-try-nested/__Cps_noCatch>#splice
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_nested_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
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
   local.get $0
   call $async-try-nested/__Cps_nested#step
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_nested_reject_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
   i32.store8 offset=44
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=48
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-try-nested/__Cps_nested#step
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_nested_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
    global.get $async-try-nested/__async_roots_nested
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-try-nested/__async_roots_nested
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
    call $~lib/array/Array<async-try-nested/__Cps_nested>#splice
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_inLoop_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
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
   local.get $0
   call $async-try-nested/__Cps_inLoop#step
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_inLoop_reject_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
   i32.store8 offset=44
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=48
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-try-nested/__Cps_inLoop#step
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_inLoop_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
    global.get $async-try-nested/__async_roots_inLoop
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-try-nested/__async_roots_inLoop
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
    call $~lib/array/Array<async-try-nested/__Cps_inLoop>#splice
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_finThrow_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
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
   local.get $0
   call $async-try-nested/__Cps_finThrow#step
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_finThrow_reject_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
   i32.store8 offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=40
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-try-nested/__Cps_finThrow#step
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-try-nested/__async_async_try_nested_finThrow_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
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
    global.get $async-try-nested/__async_roots_finThrow
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-try-nested/__async_roots_finThrow
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-try-nested/__Cps_nested>#indexOf
    call $~lib/array/Array<async-try-nested/__Cps_finThrow>#splice
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
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-try-nested/noCatch (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 49
   i32.const 9
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   call $~lib/object/Object#constructor
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=8
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=12
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=21
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=22
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=24
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=32
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=40
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=44
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=48
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   local.get $0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   global.get $async-try-nested/__async_roots_noCatch
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-try-nested/__Cps_nested>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-try-nested/__Cps_noCatch#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-try-nested/nested (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 69
   i32.const 5
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
   i32.const 1552
   i32.store offset=4
   local.get $2
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1552
   i32.store offset=8
   local.get $2
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1552
   i32.store offset=12
   local.get $2
   i32.const 1552
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
   i32.store8 offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=21
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=22
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1552
   i32.store offset=24
   local.get $2
   i32.const 1552
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
   i32.const 1552
   i32.store offset=32
   local.get $2
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1552
   i32.store offset=40
   local.get $2
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=44
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1552
   i32.store offset=48
   local.get $2
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1552
   i32.store offset=52
   local.get $2
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1552
   i32.store offset=56
   local.get $2
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store8 offset=60
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 1552
   i32.store offset=64
   local.get $2
   i32.const 1552
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
   local.get $0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   global.get $async-try-nested/__async_roots_nested
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $0
   local.get $2
   call $~lib/array/Array<async-try-nested/__Cps_nested>#push
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $async-try-nested/__Cps_nested#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-try-nested/inLoop (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 57
   i32.const 7
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   call $~lib/object/Object#constructor
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=8
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=12
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=21
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=22
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=24
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=32
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=36
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=40
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=44
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=48
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=52
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=56
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   local.get $0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   global.get $async-try-nested/__async_roots_inLoop
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-try-nested/__Cps_nested>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-try-nested/__Cps_inLoop#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-try-nested/finThrow (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4604
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
   i32.const 4604
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 53
   i32.const 11
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   call $~lib/object/Object#constructor
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=8
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=12
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=21
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=22
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=24
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=32
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=40
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=44
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=48
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=52
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   local.get $0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   global.get $async-try-nested/__async_roots_finThrow
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-try-nested/__Cps_nested>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-try-nested/__Cps_finThrow#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37392
  i32.const 37440
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-try-nested/chunkString (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4192
   return
  end
  local.get $0
  i32.const 1
  i32.eq
  if
   i32.const 4224
   return
  end
  i32.const 4256
 )
 (func $async-try-nested/__async_async_try_nested_noCatch_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_noCatch
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-try-nested/__Cps_nested>#get:length
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
  global.get $async-try-nested/__async_roots_noCatch
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_noCatch
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-try-nested/__Cps_nested>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-try-nested/__Cps_nested>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-try-nested/__async_async_try_nested_nested_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_nested
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-try-nested/__Cps_nested>#get:length
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
  global.get $async-try-nested/__async_roots_nested
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_nested
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-try-nested/__Cps_nested>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-try-nested/__Cps_nested>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-try-nested/__async_async_try_nested_mint_string (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4352
  i32.store
  i32.const 4348
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
   i32.const 1056
   i32.const 4384
   i32.const 334
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  block $__inlined_func$~lib/string/String#repeat$84
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
    i32.const 1552
    local.set $1
    br $__inlined_func$~lib/string/String#repeat$84
   end
   local.get $0
   i32.const 1
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 4352
    local.set $1
    br $__inlined_func$~lib/string/String#repeat$84
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
     i32.const 4352
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
 (func $async-try-nested/__async_async_try_nested_mint (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
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
 (func $async-try-nested/__async_async_try_nested_inLoop_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_inLoop
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-try-nested/__Cps_nested>#get:length
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
  global.get $async-try-nested/__async_roots_inLoop
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_inLoop
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-try-nested/__Cps_nested>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-try-nested/__Cps_nested>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-try-nested/__async_async_try_nested_finThrow_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4604
  i32.lt_s
  if
   i32.const 37392
   i32.const 37440
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_finThrow
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-try-nested/__Cps_nested>#get:length
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
  global.get $async-try-nested/__async_roots_finThrow
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-try-nested/__async_roots_finThrow
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-try-nested/__Cps_nested>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-try-nested/__Cps_nested>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
)
