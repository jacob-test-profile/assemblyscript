(module
 (type $0 (func (param i32 i32) (result i32)))
 (type $1 (func (param i32) (result i32)))
 (type $2 (func (param i32 i32)))
 (type $3 (func (result i32)))
 (type $4 (func (param i32)))
 (type $5 (func))
 (type $6 (func (param i32 i32 i32 i32)))
 (type $7 (func (param i32 i32 i32)))
 (type $8 (func (param i32 i32 i64)))
 (type $9 (func (param i32 externref) (result i32)))
 (type $10 (func (param externref) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "getNumber" (func $async-arrow-capture/getNumber (result i32)))
 (import "env" "useHandle" (func $async-arrow-capture/useHandle (param externref) (result i32)))
 (import "env" "getHandle" (func $async-arrow-capture/getHandle (result i32)))
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
 (global $async-arrow-capture/__async_roots_arrowCapture (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_state_async_arrow_capture_arrowCapture (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots_arrowCaptureWrite (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_state_async_arrow_capture_arrowCaptureWrite (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots_arrowCaptureShadow (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_state_async_arrow_capture_arrowCaptureShadow (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots_arrowCallsArrow (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_state_async_arrow_capture_arrowCallsArrow (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_spill_0 (mut externref) (ref.null noextern))
 (global $async-arrow-capture/__async_spill_1 (mut externref) (ref.null noextern))
 (global $async-arrow-capture/__async_spill_2 (mut externref) (ref.null noextern))
 (global $async-arrow-capture/__async_spill_3 (mut externref) (ref.null noextern))
 (global $async-arrow-capture/__async_spill_4 (mut externref) (ref.null noextern))
 (global $async-arrow-capture/__async_spill_5 (mut externref) (ref.null noextern))
 (global $async-arrow-capture/__async_spill_6 (mut externref) (ref.null noextern))
 (global $async-arrow-capture/__async_spill_7 (mut externref) (ref.null noextern))
 (global $async-arrow-capture/__async_roots_arrowCaptureExtern (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_state_async_arrow_capture_arrowCaptureExtern (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots_ArrowHolder_run (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_state_async_arrow_capture_ArrowHolder_run (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots___async_arrow_arrowCapture_0 (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots___async_arrow_arrowCaptureWrite_0 (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots___async_arrow_arrowCaptureShadow_0 (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_0 (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_1 (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots___async_arrow_arrowCaptureExtern_0 (mut i32) (i32.const 0))
 (global $async-arrow-capture/__async_roots___async_arrow_ArrowHolder_run_0 (mut i32) (i32.const 0))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 34868))
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
 (data $10 (i32.const 1532) "<")
 (data $10.1 (i32.const 1544) "\01\00\00\00 \00\00\00\07\00\00\00\06\00\00\00\05\00\00\00\04\00\00\00\03\00\00\00\02\00\00\00\01")
 (data $11 (i32.const 1596) ",")
 (data $11.1 (i32.const 1608) "\13\00\00\00\10\00\00\00\10\06\00\00\10\06\00\00 \00\00\00\08")
 (data $12 (i32.const 1644) "\1c")
 (data $12.1 (i32.const 1656) "\02")
 (data $13 (i32.const 1676) "\1c")
 (data $13.1 (i32.const 1688) "\05\00\00\00\08\00\00\00\01")
 (data $14 (i32.const 1708) "\1c")
 (data $14.1 (i32.const 1720) "\05\00\00\00\08\00\00\00\02")
 (data $15 (i32.const 1740) "\1c")
 (data $15.1 (i32.const 1752) "\05\00\00\00\08\00\00\00\03")
 (data $16 (i32.const 1772) "\1c")
 (data $16.1 (i32.const 1784) "\05\00\00\00\08\00\00\00\04")
 (data $17 (i32.const 1804) "\1c")
 (data $17.1 (i32.const 1816) "\05\00\00\00\08\00\00\00\05")
 (data $18 (i32.const 1836) ",")
 (data $18.1 (i32.const 1848) "\02\00\00\00\1c\00\00\00A\00r\00r\00a\00y\00 \00i\00s\00 \00e\00m\00p\00t\00y")
 (data $19 (i32.const 1884) "\1c")
 (data $19.1 (i32.const 1896) "\05\00\00\00\08\00\00\00\06")
 (data $20 (i32.const 1916) "\1c")
 (data $20.1 (i32.const 1928) "\08\00\00\00\08\00\00\00\07")
 (data $21 (i32.const 1952) "$\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00 ")
 (data $21.1 (i32.const 2016) "\02A\00\00\02A\00\00\02A\00\00\02A\00\00\02\t\00\00\02A\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A")
 (export "arrowCapture" (func $async-arrow-capture/arrowCapture))
 (export "arrowCaptureWrite" (func $async-arrow-capture/arrowCaptureWrite))
 (export "arrowCaptureShadow" (func $async-arrow-capture/arrowCaptureShadow))
 (export "arrowCallsArrow" (func $async-arrow-capture/arrowCallsArrow))
 (export "arrowCaptureExtern" (func $async-arrow-capture/arrowCaptureExtern))
 (export "startHolderRun" (func $async-arrow-capture/startHolderRun))
 (export "__async_async_arrow_capture_ArrowHolder_new" (func $async-arrow-capture/__async_async_arrow_capture_ArrowHolder_new))
 (export "memory" (memory $0))
 (export "__async_async_arrow_capture_arrowCapture_pending_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_pending_0))
 (export "__async_async_arrow_capture_arrowCapture_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_resume_0))
 (export "__async_async_arrow_capture_arrowCapture_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_reject_0))
 (export "__async_async_arrow_capture_arrowCapture_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture_arrowCapture_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture_arrowCapture_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture_arrowCaptureWrite_pending_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureWrite_pending_0))
 (export "__async_async_arrow_capture_arrowCaptureWrite_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureWrite_resume_0))
 (export "__async_async_arrow_capture_arrowCaptureWrite_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureWrite_reject_0))
 (export "__async_async_arrow_capture_arrowCaptureWrite_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture_arrowCaptureWrite_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture_arrowCaptureWrite_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture_arrowCaptureShadow_pending_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureWrite_pending_0))
 (export "__async_async_arrow_capture_arrowCaptureShadow_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureShadow_resume_0))
 (export "__async_async_arrow_capture_arrowCaptureShadow_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureShadow_reject_0))
 (export "__async_async_arrow_capture_arrowCaptureShadow_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture_arrowCaptureShadow_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture_arrowCaptureShadow_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture_arrowCallsArrow_pending_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureWrite_pending_0))
 (export "__async_async_arrow_capture_arrowCallsArrow_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCallsArrow_resume_0))
 (export "__async_async_arrow_capture_arrowCallsArrow_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCallsArrow_reject_0))
 (export "__async_async_arrow_capture_arrowCallsArrow_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture_arrowCallsArrow_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture_arrowCallsArrow_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture_arrowCaptureExtern_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureExtern_resume_0))
 (export "__async_async_arrow_capture_arrowCaptureExtern_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureExtern_reject_0))
 (export "__async_async_arrow_capture_arrowCaptureExtern_pending_1" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureExtern_pending_1))
 (export "__async_async_arrow_capture_arrowCaptureExtern_resume_1" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureExtern_resume_1))
 (export "__async_async_arrow_capture_arrowCaptureExtern_reject_1" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureExtern_reject_0))
 (export "__async_async_arrow_capture_arrowCaptureExtern_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture_arrowCaptureExtern_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture_arrowCaptureExtern_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture_ArrowHolder_run_pending_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureWrite_pending_0))
 (export "__async_async_arrow_capture_ArrowHolder_run_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture_ArrowHolder_run_resume_0))
 (export "__async_async_arrow_capture_ArrowHolder_run_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture_ArrowHolder_run_reject_0))
 (export "__async_async_arrow_capture_ArrowHolder_run_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture_ArrowHolder_run_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture_ArrowHolder_run_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture_ArrowHolder_run_entry" (func $export:async-arrow-capture/__async_async_arrow_capture_ArrowHolder_run_entry))
 (export "__async_async_arrow_capture___async_arrow_arrowCapture_0_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCapture_0_resume_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCapture_0_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCapture_0_reject_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCapture_0_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture___async_arrow_arrowCapture_0_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture___async_arrow_arrowCapture_0_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureWrite_0_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureWrite_0_resume_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureWrite_0_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureWrite_0_reject_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureWrite_0_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureWrite_0_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureWrite_0_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureShadow_0_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureShadow_0_resume_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureShadow_0_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureShadow_0_reject_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureShadow_0_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureShadow_0_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureShadow_0_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_0_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCallsArrow_0_resume_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_0_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCallsArrow_0_reject_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_0_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_0_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_0_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_pending_0" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_pending_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_resume_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_reject_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_resume_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_reject_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_resume_1" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_resume_1))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_reject_1" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_reject_0))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
 (export "__async_async_arrow_capture___async_arrow_ArrowHolder_run_0_resume_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_ArrowHolder_run_0_resume_0))
 (export "__async_async_arrow_capture___async_arrow_ArrowHolder_run_0_reject_0" (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_ArrowHolder_run_0_reject_0))
 (export "__async_async_arrow_capture___async_arrow_ArrowHolder_run_0_result" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result))
 (export "__async_async_arrow_capture___async_arrow_ArrowHolder_run_0_error" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error))
 (export "__async_async_arrow_capture___async_arrow_ArrowHolder_run_0_status" (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status))
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
 (func $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
 (func $~lib/object/Object#constructor (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
 (func $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 1
  i32.add
  local.tee $3
  call $~lib/array/ensureCapacity
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.get $2
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
  local.get $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_status (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_result (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_error (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__async_spill_release (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1616
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1616
   i32.store
   i32.const 1616
   i32.const 1628
   i32.load
   local.tee $1
   i32.const 1
   i32.add
   local.tee $2
   call $~lib/array/ensureCapacity
   global.get $~lib/memory/__stack_pointer
   i32.const 1616
   i32.store
   i32.const 1620
   i32.load
   local.get $1
   i32.const 2
   i32.shl
   i32.add
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1616
   i32.store
   i32.const 1628
   local.get $2
   i32.store
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureWrite_pending_0 (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=28
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
  i32.const 34896
  i32.const 34944
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
  block $__inlined_func$~lib/rt/itcms/Object#unlink$845
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
    i32.const 34868
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
    br $__inlined_func$~lib/rt/itcms/Object#unlink$845
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
   i32.const 1952
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
   i32.const 1956
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
  block $folding-inner3
   block $folding-inner2
    block $folding-inner1
     block $folding-inner0
      block $invalid
       block $async-arrow-capture/__Cps___async_arrow_ArrowHolder_run_0
        block $~lib/array/Array<i32>
         block $async-arrow-capture/__Cps_ArrowHolder_run
          block $async-arrow-capture/__Cps_arrowCallsArrow
           block $~lib/function/Function<%28async-arrow-capture/ArrowHolder%29=>~lib/promise/Promise<i32>>
            block $async-arrow-capture/ArrowHolder
             block $~lib/promise/Promise<ref_extern|null>
              block $~lib/function/Function<%28%29=>~lib/promise/Promise<i32>>
               block $~lib/promise/Promise<i32>
                block $~lib/arraybuffer/ArrayBufferView
                 block $~lib/string/String
                  block $~lib/arraybuffer/ArrayBuffer
                   block $~lib/object/Object
                    local.get $0
                    i32.const 8
                    i32.sub
                    i32.load
                    br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $~lib/promise/Promise<i32> $~lib/function/Function<%28%29=>~lib/promise/Promise<i32>> $~lib/promise/Promise<ref_extern|null> $async-arrow-capture/ArrowHolder $~lib/function/Function<%28async-arrow-capture/ArrowHolder%29=>~lib/promise/Promise<i32>> $folding-inner0 $folding-inner0 $folding-inner0 $async-arrow-capture/__Cps_arrowCallsArrow $folding-inner1 $async-arrow-capture/__Cps_ArrowHolder_run $folding-inner2 $folding-inner2 $folding-inner2 $folding-inner2 $~lib/array/Array<i32> $folding-inner2 $folding-inner2 $folding-inner1 $folding-inner2 $folding-inner1 $folding-inner2 $folding-inner1 $folding-inner2 $folding-inner1 $folding-inner2 $folding-inner1 $folding-inner2 $folding-inner0 $folding-inner2 $async-arrow-capture/__Cps___async_arrow_ArrowHolder_run_0 $folding-inner2 $invalid
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
              call $~lib/function/Function<%28%29=>~lib/promise/Promise<i32>>~visit
              return
             end
             return
            end
            return
           end
           local.get $0
           call $~lib/function/Function<%28%29=>~lib/promise/Promise<i32>>~visit
           return
          end
          local.get $0
          i32.load offset=8
          call $~lib/rt/itcms/__visit
          local.get $0
          i32.load offset=20
          call $~lib/rt/itcms/__visit
          local.get $0
          i32.load offset=24
          call $~lib/rt/itcms/__visit
          return
         end
         local.get $0
         i32.load offset=8
         call $~lib/rt/itcms/__visit
         local.get $0
         i32.load offset=16
         call $~lib/rt/itcms/__visit
         local.get $0
         i32.load offset=24
         call $~lib/rt/itcms/__visit
         return
        end
        global.get $~lib/memory/__stack_pointer
        i32.const 4
        i32.sub
        global.set $~lib/memory/__stack_pointer
        global.get $~lib/memory/__stack_pointer
        i32.const 2100
        i32.lt_s
        br_if $folding-inner3
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
       i32.load offset=16
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=20
       call $~lib/rt/itcms/__visit
       return
      end
      unreachable
     end
     local.get $0
     i32.load offset=8
     call $~lib/rt/itcms/__visit
     local.get $0
     i32.load offset=20
     call $~lib/rt/itcms/__visit
     return
    end
    local.get $0
    i32.load offset=8
    call $~lib/rt/itcms/__visit
    local.get $0
    i32.load offset=16
    call $~lib/rt/itcms/__visit
    return
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner3
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__Cps_arrowCaptureExtern#step (param $0 i32) (result i32)
  (local $1 externref)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   local.get $0
   global.set $async-arrow-capture/__async_state_async_arrow_capture_arrowCaptureExtern
   block $folding-inner0
    loop $while-continue|0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     block $case6|1
      block $case5|1
       block $case4|1
        block $case3|1
         block $case2|1
          block $case1|1
           local.get $0
           i32.load
           local.tee $2
           if
            local.get $2
            i32.const 1
            i32.eq
            br_if $case1|1
            local.get $2
            i32.const 2
            i32.eq
            br_if $case2|1
            local.get $2
            i32.const 1024
            i32.eq
            br_if $case3|1
            local.get $2
            i32.const 1025
            i32.eq
            br_if $case4|1
            local.get $2
            i32.const 1026
            i32.eq
            br_if $case5|1
            br $case6|1
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
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.const 1026
         i32.store
         br $while-continue|0
        end
        call $async-arrow-capture/getHandle
        drop
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.const 1
        i32.store
        br $folding-inner0
       end
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.load offset=28
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       block $__inlined_func$async-arrow-capture/__async_spill_get$432 (result externref)
        block $case8|0
         block $case7|0
          block $case6|0
           block $case5|0
            block $case4|0
             block $case3|0
              block $case2|0
               block $case1|0
                block $case0|0
                 local.get $0
                 i32.load offset=24
                 br_table $case0|0 $case1|0 $case2|0 $case3|0 $case4|0 $case5|0 $case6|0 $case7|0 $case8|0
                end
                global.get $async-arrow-capture/__async_spill_0
                br $__inlined_func$async-arrow-capture/__async_spill_get$432
               end
               global.get $async-arrow-capture/__async_spill_1
               br $__inlined_func$async-arrow-capture/__async_spill_get$432
              end
              global.get $async-arrow-capture/__async_spill_2
              br $__inlined_func$async-arrow-capture/__async_spill_get$432
             end
             global.get $async-arrow-capture/__async_spill_3
             br $__inlined_func$async-arrow-capture/__async_spill_get$432
            end
            global.get $async-arrow-capture/__async_spill_4
            br $__inlined_func$async-arrow-capture/__async_spill_get$432
           end
           global.get $async-arrow-capture/__async_spill_5
           br $__inlined_func$async-arrow-capture/__async_spill_get$432
          end
          global.get $async-arrow-capture/__async_spill_6
          br $__inlined_func$async-arrow-capture/__async_spill_get$432
         end
         global.get $async-arrow-capture/__async_spill_7
         br $__inlined_func$async-arrow-capture/__async_spill_get$432
        end
        ref.null noextern
       end
       local.set $1
       block $break|00
        block $case7|02
         block $case6|03
          block $case5|04
           block $case4|05
            block $case3|06
             block $case2|07
              block $case1|08
               block $case0|09
                local.get $2
                br_table $case0|09 $case1|08 $case2|07 $case3|06 $case4|05 $case5|04 $case6|03 $case7|02 $break|00
               end
               local.get $1
               global.set $async-arrow-capture/__async_spill_0
               br $break|00
              end
              local.get $1
              global.set $async-arrow-capture/__async_spill_1
              br $break|00
             end
             local.get $1
             global.set $async-arrow-capture/__async_spill_2
             br $break|00
            end
            local.get $1
            global.set $async-arrow-capture/__async_spill_3
            br $break|00
           end
           local.get $1
           global.set $async-arrow-capture/__async_spill_4
           br $break|00
          end
          local.get $1
          global.set $async-arrow-capture/__async_spill_5
          br $break|00
         end
         local.get $1
         global.set $async-arrow-capture/__async_spill_6
         br $break|00
        end
        local.get $1
        global.set $async-arrow-capture/__async_spill_7
       end
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       i32.const 1904
       i32.store offset=4
       local.get $0
       i32.const 1904
       i32.store offset=16
       local.get $0
       i32.const 1904
       i32.const 0
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       block $__inlined_func$async-arrow-capture/__async_arrow_arrowCaptureExtern_0$8 (result i32)
        global.get $~lib/memory/__stack_pointer
        i32.const 12
        i32.sub
        global.set $~lib/memory/__stack_pointer
        block $folding-inner00
         global.get $~lib/memory/__stack_pointer
         i32.const 2100
         i32.lt_s
         br_if $folding-inner00
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
         i32.const 2100
         i32.lt_s
         br_if $folding-inner00
         global.get $~lib/memory/__stack_pointer
         i64.const 0
         i64.store
         global.get $~lib/memory/__stack_pointer
         i32.const 32
         i32.const 32
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
         i32.const 1664
         i32.store offset=8
         local.get $3
         i32.const 1664
         i32.const 0
         call $~lib/rt/itcms/__link
         global.get $~lib/memory/__stack_pointer
         local.get $3
         i32.store offset=4
         local.get $3
         i32.const 0
         i32.store offset=12
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
         local.get $3
         i32.const 0
         i32.const 0
         call $~lib/rt/itcms/__link
         global.get $~lib/memory/__stack_pointer
         local.get $3
         i32.store offset=4
         local.get $3
         i32.const 0
         i32.store offset=24
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
         global.get $~lib/memory/__stack_pointer
         global.get $async-arrow-capture/__async_state_async_arrow_capture_arrowCaptureExtern
         local.tee $2
         i32.store offset=8
         local.get $3
         local.get $2
         i32.store offset=20
         local.get $3
         local.get $2
         i32.const 0
         call $~lib/rt/itcms/__link
         global.get $~lib/memory/__stack_pointer
         global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureExtern_0
         local.tee $2
         i32.store offset=4
         global.get $~lib/memory/__stack_pointer
         local.get $3
         i32.store offset=8
         local.get $2
         local.get $3
         call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
         global.get $~lib/memory/__stack_pointer
         local.get $3
         i32.store offset=4
         local.get $3
         call $async-arrow-capture/__Cps___async_arrow_arrowCaptureExtern_0#step
         drop
         global.get $~lib/memory/__stack_pointer
         i32.const 12
         i32.add
         global.set $~lib/memory/__stack_pointer
         local.get $3
         br $__inlined_func$async-arrow-capture/__async_arrow_arrowCaptureExtern_0$8
        end
        br $folding-inner1
       end
       i32.store offset=20
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 2
       i32.store
       br $folding-inner0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      local.get $0
      i32.load offset=12
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const -1
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load offset=24
      call $async-arrow-capture/__async_spill_release
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load offset=28
      call $async-arrow-capture/__async_spill_release
      global.get $~lib/memory/__stack_pointer
      global.get $async-arrow-capture/__async_roots_arrowCaptureExtern
      local.tee $2
      i32.store
      global.get $~lib/memory/__stack_pointer
      global.get $async-arrow-capture/__async_roots_arrowCaptureExtern
      local.tee $3
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=8
      local.get $2
      local.get $3
      local.get $0
      call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
      call $~lib/array/Array<async-arrow-capture/__Cps_arrowCaptureExtern>#splice
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
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 0
   return
  end
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__Cps___async_arrow_arrowCaptureExtern_0#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
           i32.const 2
           i32.eq
           br_if $case2|1
           local.get $1
           i32.const 1024
           i32.eq
           br_if $case3|1
           local.get $1
           i32.const 1025
           i32.eq
           br_if $case4|1
           local.get $1
           i32.const 1026
           i32.eq
           br_if $case5|1
           br $case6|1
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
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.const 1026
        i32.store
        br $while-continue|0
       end
       call $async-arrow-capture/getNumber
       drop
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1
       i32.store
       br $folding-inner0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      local.get $0
      i32.load offset=12
      i32.store offset=24
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=20
      local.tee $1
      i32.store
      block $__inlined_func$async-arrow-capture/__async_spill_get$408 (result externref)
       block $case8|0
        block $case7|0
         block $case6|0
          block $case5|0
           block $case4|0
            block $case3|0
             block $case2|0
              block $case1|0
               block $case0|0
                local.get $1
                i32.load offset=28
                br_table $case0|0 $case1|0 $case2|0 $case3|0 $case4|0 $case5|0 $case6|0 $case7|0 $case8|0
               end
               global.get $async-arrow-capture/__async_spill_0
               br $__inlined_func$async-arrow-capture/__async_spill_get$408
              end
              global.get $async-arrow-capture/__async_spill_1
              br $__inlined_func$async-arrow-capture/__async_spill_get$408
             end
             global.get $async-arrow-capture/__async_spill_2
             br $__inlined_func$async-arrow-capture/__async_spill_get$408
            end
            global.get $async-arrow-capture/__async_spill_3
            br $__inlined_func$async-arrow-capture/__async_spill_get$408
           end
           global.get $async-arrow-capture/__async_spill_4
           br $__inlined_func$async-arrow-capture/__async_spill_get$408
          end
          global.get $async-arrow-capture/__async_spill_5
          br $__inlined_func$async-arrow-capture/__async_spill_get$408
         end
         global.get $async-arrow-capture/__async_spill_6
         br $__inlined_func$async-arrow-capture/__async_spill_get$408
        end
        global.get $async-arrow-capture/__async_spill_7
        br $__inlined_func$async-arrow-capture/__async_spill_get$408
       end
       ref.null noextern
      end
      call $async-arrow-capture/useHandle
      drop
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 2
      i32.store
      br $folding-inner0
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
     i32.load offset=28
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $1
     local.get $0
     i32.load offset=24
     i32.add
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureExtern_0
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureExtern_0
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
     call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCaptureExtern_0>#splice
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
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
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
  i32.const 34880
  i32.const 0
  i32.store
  i32.const 36448
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
    i32.const 34880
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
      i32.const 34880
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
  i32.const 34880
  i32.const 36452
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 34880
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
  i32.const 1856
  call $~lib/rt/itcms/__visit
  i32.const 1152
  call $~lib/rt/itcms/__visit
  global.get $async-arrow-capture/__async_roots_arrowCapture
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots_arrowCaptureWrite
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots_arrowCaptureShadow
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots_arrowCallsArrow
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  i32.const 1616
  call $~lib/rt/itcms/__visit
  global.get $async-arrow-capture/__async_roots_arrowCaptureExtern
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots_ArrowHolder_run
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots___async_arrow_arrowCapture_0
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureWrite_0
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureShadow_0
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_0
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_1
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureExtern_0
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-arrow-capture/__async_roots___async_arrow_ArrowHolder_run_0
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
 (func $~lib/function/Function<%28%29=>~lib/promise/Promise<i32>>~visit (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.load offset=4
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/ensureCapacity (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  local.get $1
  local.get $0
  i32.load offset=8
  local.tee $2
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
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
   block $__inlined_func$~lib/rt/itcms/__renew$793
    i32.const 1073741820
    local.get $2
    i32.const 1
    i32.shl
    local.tee $2
    local.get $2
    i32.const 1073741820
    i32.ge_u
    select
    local.tee $2
    i32.const 8
    local.get $1
    local.get $1
    i32.const 8
    i32.le_u
    select
    i32.const 2
    i32.shl
    local.tee $1
    local.get $1
    local.get $2
    i32.lt_u
    select
    local.tee $3
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
     local.get $3
     i32.store offset=16
     local.get $2
     local.set $1
     br $__inlined_func$~lib/rt/itcms/__renew$793
    end
    local.get $3
    local.get $4
    i32.load offset=12
    call $~lib/rt/itcms/__new
    local.tee $1
    local.get $2
    local.get $3
    local.get $4
    i32.load offset=16
    local.tee $4
    local.get $3
    local.get $4
    i32.lt_u
    select
    memory.copy
   end
   local.get $1
   local.get $2
   i32.ne
   if
    local.get $0
    local.get $1
    i32.store
    local.get $0
    local.get $1
    i32.store offset=4
    local.get $0
    local.get $1
    i32.const 0
    call $~lib/rt/itcms/__link
   end
   local.get $0
   local.get $3
   i32.store offset=8
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-arrow-capture/__Cps_arrowCaptureWrite>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 16
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
 (func $~lib/array/Array<async-arrow-capture/__Cps_arrowCaptureShadow>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 17
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
 (func $~lib/array/Array<async-arrow-capture/__Cps_arrowCaptureExtern>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 20
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
 (func $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
 (func $~lib/array/Array<async-arrow-capture/__Cps_arrowCallsArrow>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 18
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
 (func $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 23
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
 (func $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCaptureWrite_0>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 25
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
 (func $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCaptureShadow_0>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 27
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
 (func $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCaptureExtern_0>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 33
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
 (func $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_1>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 31
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
 (func $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_0>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 29
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
 (func $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_ArrowHolder_run_0>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 35
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
 (func $~lib/array/Array<async-arrow-capture/__Cps_ArrowHolder_run>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 21
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
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_pending_0 (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=24
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureExtern_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   local.get $0
   i32.store
   local.get $0
   i32.load offset=24
   call $async-arrow-capture/__async_spill_release
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=28
   call $async-arrow-capture/__async_spill_release
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_arrowCaptureExtern
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_arrowCaptureExtern
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps_arrowCaptureExtern>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureExtern_0
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureExtern_0
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCaptureExtern_0>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__async_spill_acquire (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1616
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1616
   i32.store
   i32.const 1628
   i32.load
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const -1
    return
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 1616
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1616
   i32.store
   i32.const 1628
   i32.load
   local.tee $0
   i32.const 0
   i32.le_s
   if
    i32.const 1856
    i32.const 1104
    i32.const 271
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 1616
   i32.store
   i32.const 1620
   i32.load
   local.get $0
   i32.const 1
   i32.sub
   local.tee $0
   i32.const 2
   i32.shl
   i32.add
   i32.load
   global.get $~lib/memory/__stack_pointer
   i32.const 1616
   i32.store
   i32.const 1628
   local.get $0
   i32.store
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__Cps_arrowCaptureWrite#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   local.get $0
   global.set $async-arrow-capture/__async_state_async_arrow_capture_arrowCaptureWrite
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
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 10
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 1728
      i32.store offset=4
      local.get $0
      i32.const 1728
      i32.store offset=20
      local.get $0
      i32.const 1728
      i32.const 0
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      block $__inlined_func$async-arrow-capture/__async_arrow_arrowCaptureWrite_0$4 (result i32)
       global.get $~lib/memory/__stack_pointer
       i32.const 12
       i32.sub
       global.set $~lib/memory/__stack_pointer
       block $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i32.const 2100
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
        i32.const 2100
        i32.lt_s
        br_if $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i64.const 0
        i64.store
        global.get $~lib/memory/__stack_pointer
        i32.const 24
        i32.const 24
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
        i32.const 1664
        i32.store offset=8
        local.get $2
        i32.const 1664
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=12
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=16
        local.get $2
        i32.const 0
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=20
        global.get $~lib/memory/__stack_pointer
        i32.const 8
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_state_async_arrow_capture_arrowCaptureWrite
        local.tee $1
        i32.store offset=8
        local.get $2
        local.get $1
        i32.store offset=16
        local.get $2
        local.get $1
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureWrite_0
        local.tee $1
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $1
        local.get $2
        call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-arrow-capture/__Cps___async_arrow_arrowCaptureWrite_0#step
        drop
        global.get $~lib/memory/__stack_pointer
        i32.const 12
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        br $__inlined_func$async-arrow-capture/__async_arrow_arrowCaptureWrite_0$4
       end
       br $folding-inner1
      end
      i32.store offset=28
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
     i32.load offset=12
     i32.store offset=24
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     i32.load offset=24
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $1
     local.get $0
     i32.load offset=16
     i32.add
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots_arrowCaptureWrite
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots_arrowCaptureWrite
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
     call $~lib/array/Array<async-arrow-capture/__Cps_arrowCaptureWrite>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__Cps_arrowCaptureShadow#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   local.get $0
   global.set $async-arrow-capture/__async_state_async_arrow_capture_arrowCaptureShadow
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
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 100
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 1000
      i32.store offset=24
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 1760
      i32.store offset=4
      local.get $0
      i32.const 1760
      i32.store offset=20
      local.get $0
      i32.const 1760
      i32.const 0
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      block $__inlined_func$async-arrow-capture/__async_arrow_arrowCaptureShadow_0$5 (result i32)
       global.get $~lib/memory/__stack_pointer
       i32.const 12
       i32.sub
       global.set $~lib/memory/__stack_pointer
       block $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i32.const 2100
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
        i32.const 2100
        i32.lt_s
        br_if $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i64.const 0
        i64.store
        global.get $~lib/memory/__stack_pointer
        i32.const 24
        i32.const 26
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
        i32.const 1664
        i32.store offset=8
        local.get $2
        i32.const 1664
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=12
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=16
        local.get $2
        i32.const 0
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=20
        global.get $~lib/memory/__stack_pointer
        i32.const 8
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_state_async_arrow_capture_arrowCaptureShadow
        local.tee $1
        i32.store offset=8
        local.get $2
        local.get $1
        i32.store offset=16
        local.get $2
        local.get $1
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureShadow_0
        local.tee $1
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $1
        local.get $2
        call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-arrow-capture/__Cps___async_arrow_arrowCaptureShadow_0#step
        drop
        global.get $~lib/memory/__stack_pointer
        i32.const 12
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        br $__inlined_func$async-arrow-capture/__async_arrow_arrowCaptureShadow_0$5
       end
       br $folding-inner1
      end
      i32.store offset=28
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
     i32.load offset=12
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots_arrowCaptureShadow
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots_arrowCaptureShadow
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
     call $~lib/array/Array<async-arrow-capture/__Cps_arrowCaptureShadow>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__Cps_arrowCapture#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   local.get $0
   global.set $async-arrow-capture/__async_state_async_arrow_capture_arrowCapture
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
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 1
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 1696
      i32.store offset=4
      local.get $0
      i32.const 1696
      i32.store offset=20
      local.get $0
      i32.const 1696
      i32.const 0
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      block $__inlined_func$async-arrow-capture/__async_arrow_arrowCapture_0$3 (result i32)
       global.get $~lib/memory/__stack_pointer
       i32.const 12
       i32.sub
       global.set $~lib/memory/__stack_pointer
       block $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i32.const 2100
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
        i32.const 2100
        i32.lt_s
        br_if $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i64.const 0
        i64.store
        global.get $~lib/memory/__stack_pointer
        i32.const 24
        i32.const 22
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
        i32.const 1664
        i32.store offset=8
        local.get $2
        i32.const 1664
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=12
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=16
        local.get $2
        i32.const 0
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=20
        global.get $~lib/memory/__stack_pointer
        i32.const 8
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_state_async_arrow_capture_arrowCapture
        local.tee $1
        i32.store offset=8
        local.get $2
        local.get $1
        i32.store offset=16
        local.get $2
        local.get $1
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_roots___async_arrow_arrowCapture_0
        local.tee $1
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $1
        local.get $2
        call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-arrow-capture/__Cps___async_arrow_arrowCapture_0#step
        drop
        global.get $~lib/memory/__stack_pointer
        i32.const 12
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        br $__inlined_func$async-arrow-capture/__async_arrow_arrowCapture_0$3
       end
       br $folding-inner1
      end
      i32.store offset=24
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
     i32.load offset=12
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots_arrowCapture
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots_arrowCapture
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
     call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__Cps_arrowCallsArrow#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   local.get $0
   global.set $async-arrow-capture/__async_state_async_arrow_capture_arrowCallsArrow
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
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 2
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 1792
      i32.store offset=4
      local.get $0
      i32.const 1792
      i32.store offset=20
      local.get $0
      i32.const 1792
      i32.const 0
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 1824
      i32.store offset=4
      local.get $0
      i32.const 1824
      i32.store offset=24
      local.get $0
      i32.const 1824
      i32.const 0
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      block $__inlined_func$async-arrow-capture/__async_arrow_arrowCallsArrow_1$7 (result i32)
       global.get $~lib/memory/__stack_pointer
       i32.const 12
       i32.sub
       global.set $~lib/memory/__stack_pointer
       block $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i32.const 2100
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
        i32.const 2100
        i32.lt_s
        br_if $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i64.const 0
        i64.store
        global.get $~lib/memory/__stack_pointer
        i32.const 28
        i32.const 30
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
        i32.const 1664
        i32.store offset=8
        local.get $2
        i32.const 1664
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=12
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=16
        local.get $2
        i32.const 0
        i32.const 0
        call $~lib/rt/itcms/__link
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
        global.get $~lib/memory/__stack_pointer
        i32.const 8
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_state_async_arrow_capture_arrowCallsArrow
        local.tee $1
        i32.store offset=8
        local.get $2
        local.get $1
        i32.store offset=16
        local.get $2
        local.get $1
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_1
        local.tee $1
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $1
        local.get $2
        call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_1#step
        drop
        global.get $~lib/memory/__stack_pointer
        i32.const 12
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        br $__inlined_func$async-arrow-capture/__async_arrow_arrowCallsArrow_1$7
       end
       br $folding-inner1
      end
      i32.store offset=28
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
     i32.load offset=12
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots_arrowCallsArrow
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots_arrowCallsArrow
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
     call $~lib/array/Array<async-arrow-capture/__Cps_arrowCallsArrow>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__Cps___async_arrow_arrowCapture_0#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
     call $async-arrow-capture/getNumber
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
    i32.load offset=12
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $1
    i32.store offset=4
    local.get $1
    i32.load offset=16
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $1
    local.get $0
    i32.load offset=20
    i32.add
    i32.const 1
    i32.add
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots___async_arrow_arrowCapture_0
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots___async_arrow_arrowCapture_0
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
    call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#splice
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
 (func $async-arrow-capture/__Cps___async_arrow_arrowCaptureWrite_0#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
     call $async-arrow-capture/getNumber
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
    i32.load offset=12
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $2
    i32.store offset=4
    local.get $1
    local.get $2
    i32.load offset=16
    i32.const 5
    i32.add
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $1
    i32.store offset=4
    local.get $1
    i32.load offset=16
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $1
    local.get $0
    i32.load offset=20
    i32.add
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureWrite_0
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureWrite_0
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
    call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCaptureWrite_0>#splice
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
 (func $async-arrow-capture/__Cps___async_arrow_arrowCaptureShadow_0#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
     call $async-arrow-capture/getNumber
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
    i32.load offset=12
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $1
    i32.store offset=4
    local.get $1
    i32.load offset=24
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $1
    local.get $0
    i32.load offset=20
    i32.add
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureShadow_0
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureShadow_0
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
    call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCaptureShadow_0>#splice
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
 (func $async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_1#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner1
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
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      block $__inlined_func$async-arrow-capture/__async_arrow_arrowCallsArrow_0$6 (result i32)
       global.get $~lib/memory/__stack_pointer
       i32.const 12
       i32.sub
       global.set $~lib/memory/__stack_pointer
       block $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i32.const 2100
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
        i32.const 2100
        i32.lt_s
        br_if $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i64.const 0
        i64.store
        global.get $~lib/memory/__stack_pointer
        i32.const 24
        i32.const 28
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
        i32.const 1664
        i32.store offset=8
        local.get $2
        i32.const 1664
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=12
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=16
        local.get $2
        i32.const 0
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        i32.const 0
        i32.store offset=20
        global.get $~lib/memory/__stack_pointer
        i32.const 8
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_state_async_arrow_capture_arrowCallsArrow
        local.tee $1
        i32.store offset=8
        local.get $2
        local.get $1
        i32.store offset=16
        local.get $2
        local.get $1
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_0
        local.tee $1
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=8
        local.get $1
        local.get $2
        call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_0#step
        drop
        global.get $~lib/memory/__stack_pointer
        i32.const 12
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $2
        br $__inlined_func$async-arrow-capture/__async_arrow_arrowCallsArrow_0$6
       end
       br $folding-inner1
      end
      i32.store offset=24
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
     i32.load offset=12
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     i32.load offset=20
     i32.const 1
     i32.add
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_1
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_1
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
     call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_1>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_0#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
     call $async-arrow-capture/getNumber
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
    i32.load offset=12
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $1
    i32.store offset=4
    local.get $1
    i32.load offset=16
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $1
    local.get $0
    i32.load offset=20
    i32.add
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_0
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_0
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
    call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_0>#splice
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
 (func $async-arrow-capture/__Cps___async_arrow_ArrowHolder_run_0#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
     call $async-arrow-capture/getNumber
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
    i32.load offset=12
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $1
    i32.store offset=4
    local.get $1
    i32.load
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=20
    local.tee $2
    i32.store offset=4
    local.get $2
    i32.load offset=20
    i32.add
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $1
    local.get $0
    i32.load offset=24
    i32.add
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots___async_arrow_ArrowHolder_run_0
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots___async_arrow_ArrowHolder_run_0
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
    call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_ArrowHolder_run_0>#splice
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
 (func $async-arrow-capture/__Cps_ArrowHolder_run#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
   i32.lt_s
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   local.get $0
   global.set $async-arrow-capture/__async_state_async_arrow_capture_ArrowHolder_run
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
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 3
      i32.store offset=20
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 1936
      i32.store offset=4
      local.get $0
      i32.const 1936
      i32.store offset=24
      local.get $0
      i32.const 1936
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
      i32.load offset=16
      local.tee $1
      i32.store offset=4
      local.get $0
      block $__inlined_func$async-arrow-capture/__async_arrow_ArrowHolder_run_0$9 (result i32)
       global.get $~lib/memory/__stack_pointer
       i32.const 12
       i32.sub
       global.set $~lib/memory/__stack_pointer
       block $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i32.const 2100
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
        i32.const 2100
        i32.lt_s
        br_if $folding-inner0
        global.get $~lib/memory/__stack_pointer
        i64.const 0
        i64.store
        global.get $~lib/memory/__stack_pointer
        i32.const 28
        i32.const 34
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
        i32.const 1664
        i32.store offset=8
        local.get $3
        i32.const 1664
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=4
        local.get $3
        i32.const 0
        i32.store offset=12
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=4
        local.get $3
        i32.const 0
        i32.store offset=16
        local.get $3
        i32.const 0
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=4
        local.get $3
        i32.const 0
        i32.store offset=20
        local.get $3
        i32.const 0
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=4
        local.get $3
        i32.const 0
        i32.store offset=24
        global.get $~lib/memory/__stack_pointer
        i32.const 8
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $3
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_state_async_arrow_capture_ArrowHolder_run
        local.tee $2
        i32.store offset=8
        local.get $3
        local.get $2
        i32.store offset=20
        local.get $3
        local.get $2
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $1
        i32.store offset=8
        local.get $3
        local.get $1
        i32.store offset=16
        local.get $3
        local.get $1
        i32.const 0
        call $~lib/rt/itcms/__link
        global.get $~lib/memory/__stack_pointer
        global.get $async-arrow-capture/__async_roots___async_arrow_ArrowHolder_run_0
        local.tee $1
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=8
        local.get $1
        local.get $3
        call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=4
        local.get $3
        call $async-arrow-capture/__Cps___async_arrow_ArrowHolder_run_0#step
        drop
        global.get $~lib/memory/__stack_pointer
        i32.const 12
        i32.add
        global.set $~lib/memory/__stack_pointer
        local.get $3
        br $__inlined_func$async-arrow-capture/__async_arrow_ArrowHolder_run_0$9
       end
       br $folding-inner1
      end
      i32.store offset=28
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
     i32.load offset=12
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots_ArrowHolder_run
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-arrow-capture/__async_roots_ArrowHolder_run
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
     call $~lib/array/Array<async-arrow-capture/__Cps_ArrowHolder_run>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/ArrowHolder#run (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 14
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
   i32.const 1664
   i32.store offset=8
   local.get $2
   i32.const 1664
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=16
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
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
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $2
   local.get $0
   i32.store offset=16
   local.get $2
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_ArrowHolder_run
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $0
   local.get $2
   call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $async-arrow-capture/__Cps_ArrowHolder_run#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/ArrowHolder#constructor (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
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
  i32.const 7
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
  i32.const 7
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~start
  call $start:async-arrow-capture
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
      i32.const 34868
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
    i32.const 34868
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
     i32.const 34868
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
 (func $start:async-arrow-capture
  (local $0 i32)
  (local $1 i32)
  memory.size
  i32.const 16
  i32.shl
  i32.const 34868
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
   i32.const 2100
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
   global.set $async-arrow-capture/__async_roots_arrowCapture
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 16
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
   global.set $async-arrow-capture/__async_roots_arrowCaptureWrite
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 17
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
   global.set $async-arrow-capture/__async_roots_arrowCaptureShadow
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 18
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
   global.set $async-arrow-capture/__async_roots_arrowCallsArrow
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 20
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
   global.set $async-arrow-capture/__async_roots_arrowCaptureExtern
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 21
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
   global.set $async-arrow-capture/__async_roots_ArrowHolder_run
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 23
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
   global.set $async-arrow-capture/__async_roots___async_arrow_arrowCapture_0
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 25
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
   global.set $async-arrow-capture/__async_roots___async_arrow_arrowCaptureWrite_0
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 27
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
   global.set $async-arrow-capture/__async_roots___async_arrow_arrowCaptureShadow_0
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 29
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
   global.set $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_0
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 31
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
   global.set $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_1
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 33
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
   global.set $async-arrow-capture/__async_roots___async_arrow_arrowCaptureExtern_0
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 35
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
   global.set $async-arrow-capture/__async_roots___async_arrow_ArrowHolder_run_0
   return
  end
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps_arrowCapture#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCapture_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots_arrowCapture
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_arrowCapture
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureWrite_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps_arrowCaptureWrite#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureWrite_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots_arrowCaptureWrite
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_arrowCaptureWrite
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps_arrowCaptureWrite>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureShadow_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps_arrowCaptureShadow#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureShadow_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots_arrowCaptureShadow
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_arrowCaptureShadow
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps_arrowCaptureShadow>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureExtern_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps_arrowCaptureExtern#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureExtern_resume_0 (param $0 i32) (param $1 externref) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   block $break|0
    block $case7|0
     block $case6|0
      block $case5|0
       block $case4|0
        block $case3|0
         block $case2|0
          block $case1|0
           block $case0|0
            local.get $0
            i32.load offset=24
            br_table $case0|0 $case1|0 $case2|0 $case3|0 $case4|0 $case5|0 $case6|0 $case7|0 $break|0
           end
           local.get $1
           global.set $async-arrow-capture/__async_spill_0
           br $break|0
          end
          local.get $1
          global.set $async-arrow-capture/__async_spill_1
          br $break|0
         end
         local.get $1
         global.set $async-arrow-capture/__async_spill_2
         br $break|0
        end
        local.get $1
        global.set $async-arrow-capture/__async_spill_3
        br $break|0
       end
       local.get $1
       global.set $async-arrow-capture/__async_spill_4
       br $break|0
      end
      local.get $1
      global.set $async-arrow-capture/__async_spill_5
      br $break|0
     end
     local.get $1
     global.set $async-arrow-capture/__async_spill_6
     br $break|0
    end
    local.get $1
    global.set $async-arrow-capture/__async_spill_7
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps_arrowCaptureExtern#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCaptureExtern_pending_1 (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=20
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCallsArrow_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps_arrowCallsArrow#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_arrowCallsArrow_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots_arrowCallsArrow
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_arrowCallsArrow
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps_arrowCallsArrow>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCapture_0_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps___async_arrow_arrowCapture_0#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCapture_0_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCapture_0
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCapture_0
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureWrite_0_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps___async_arrow_arrowCaptureWrite_0#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureWrite_0_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureWrite_0
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureWrite_0
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCaptureWrite_0>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureShadow_0_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps___async_arrow_arrowCaptureShadow_0#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureShadow_0_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureShadow_0
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCaptureShadow_0
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCaptureShadow_0>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   call $async-arrow-capture/__Cps___async_arrow_arrowCaptureExtern_0#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCaptureExtern_0_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps___async_arrow_arrowCaptureExtern_0#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_1#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCallsArrow_1_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_1
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_1
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_1>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCallsArrow_0_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_0#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_arrowCallsArrow_0_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_0
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots___async_arrow_arrowCallsArrow_0
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCallsArrow_0>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_ArrowHolder_run_0_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps___async_arrow_ArrowHolder_run_0#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture___async_arrow_ArrowHolder_run_0_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots___async_arrow_ArrowHolder_run_0
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots___async_arrow_ArrowHolder_run_0
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_ArrowHolder_run_0>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_ArrowHolder_run_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/__Cps_ArrowHolder_run#step
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_ArrowHolder_run_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
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
   global.get $async-arrow-capture/__async_roots_ArrowHolder_run
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_ArrowHolder_run
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-arrow-capture/__Cps___async_arrow_arrowCapture_0>#indexOf
   call $~lib/array/Array<async-arrow-capture/__Cps_ArrowHolder_run>#splice
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-arrow-capture/__async_async_arrow_capture_ArrowHolder_run_entry (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-arrow-capture/ArrowHolder#run
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
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/startHolderRun (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 2100
  i32.lt_s
  if
   i32.const 34896
   i32.const 34944
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  call $async-arrow-capture/ArrowHolder#constructor
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $async-arrow-capture/ArrowHolder#run
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-arrow-capture/arrowCaptureWrite (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 10
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
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1664
   i32.store offset=8
   local.get $1
   i32.const 1664
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=12
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
   i32.store offset=20
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_arrowCaptureWrite
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-arrow-capture/__Cps_arrowCaptureWrite#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/arrowCaptureShadow (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 32
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
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1664
   i32.store offset=8
   local.get $1
   i32.const 1664
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=12
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
   i32.store offset=20
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_arrowCaptureShadow
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-arrow-capture/__Cps_arrowCaptureShadow#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/arrowCaptureExtern (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner1
   block $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i32.const 2100
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i64.const 0
    i64.store
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store offset=8
    call $async-arrow-capture/__async_spill_acquire
    local.tee $1
    i32.const 0
    i32.lt_s
    br_if $folding-inner1
    call $async-arrow-capture/__async_spill_acquire
    local.tee $2
    i32.const 0
    i32.lt_s
    if
     local.get $1
     call $async-arrow-capture/__async_spill_release
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.sub
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    i32.const 2100
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    i64.const 0
    i64.store
    global.get $~lib/memory/__stack_pointer
    i32.const 32
    i32.const 13
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
    i32.const 1664
    i32.store offset=8
    local.get $3
    i32.const 1664
    i32.const 0
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $3
    i32.const 0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $3
    i32.const 0
    i32.store offset=16
    local.get $3
    i32.const 0
    i32.const 0
    call $~lib/rt/itcms/__link
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
    i32.const -1
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $3
    i32.const -1
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
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $3
    local.get $2
    i32.store offset=28
    global.get $~lib/memory/__stack_pointer
    global.get $async-arrow-capture/__async_roots_arrowCaptureExtern
    local.tee $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=8
    local.get $0
    local.get $3
    call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $3
    call $async-arrow-capture/__Cps_arrowCaptureExtern#step
    drop
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    local.get $3
    return
   end
   i32.const 34896
   i32.const 34944
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-arrow-capture/arrowCapture (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 28
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
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1664
   i32.store offset=8
   local.get $1
   i32.const 1664
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=12
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
   i32.store offset=20
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_arrowCapture
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-arrow-capture/__Cps_arrowCapture#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/arrowCallsArrow (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 2100
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
   i32.const 2100
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 12
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
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1664
   i32.store offset=8
   local.get $1
   i32.const 1664
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=12
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
   i32.store offset=20
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=24
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-arrow-capture/__async_roots_arrowCallsArrow
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-arrow-capture/__Cps_arrowCapture>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-arrow-capture/__Cps_arrowCallsArrow#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 34896
  i32.const 34944
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-arrow-capture/__async_async_arrow_capture_ArrowHolder_new (result i32)
  call $async-arrow-capture/ArrowHolder#constructor
 )
)
