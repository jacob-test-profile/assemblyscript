(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32)))
 (type $2 (func (param i32 i32) (result i32)))
 (type $3 (func (result i32)))
 (type $4 (func (param i32 i32 i32) (result i32)))
 (type $5 (func (param i32)))
 (type $6 (func (param i32 i32 i32)))
 (type $7 (func))
 (type $8 (func (param i32 i32 i32 i32)))
 (type $9 (func (param i32 i32 i64) (result i32)))
 (type $10 (func (param i32 i64 i32)))
 (type $11 (func (param i64 i32) (result i32)))
 (type $12 (func (param i32 i64 i32 i32)))
 (type $13 (func (param i32 i32 i32 i32) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "getChunk" (func $async-throw-values/getChunk (param i32) (result i32)))
 (import "env" "getError" (func $async-throw-values/getError (result i32)))
 (import "env" "getNumber" (func $async-throw-values/getNumber (result i32)))
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
 (global $async-throw-values/__async_roots_throwError (mut i32) (i32.const 0))
 (global $async-throw-values/__async_roots_throwString (mut i32) (i32.const 0))
 (global $async-throw-values/__async_roots_throwNumber (mut i32) (i32.const 0))
 (global $~lib/native/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $async-throw-values/__async_roots_catchError (mut i32) (i32.const 0))
 (global $async-throw-values/__async_roots_throwAwaitString (mut i32) (i32.const 0))
 (global $async-throw-values/__async_roots_throwAwaitError (mut i32) (i32.const 0))
 (global $async-throw-values/__async_roots_throwAwaitNumber (mut i32) (i32.const 0))
 (global $async-throw-values/__async_roots_catchAwaitString (mut i32) (i32.const 0))
 (global $async-throw-values/__async_roots_nestedThrow (mut i32) (i32.const 0))
 (global $async-throw-values/__async_roots_throwInCatch (mut i32) (i32.const 0))
 (global $async-throw-values/__async_roots_throwBox (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 3136))
 (global $~lib/memory/__data_end i32 (i32.const 3268))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 36036))
 (global $~lib/memory/__heap_base i32 (i32.const 36036))
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
 (data $11 (i32.const 540) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\n\00\00\00E\00r\00r\00o\00r\00\00\00")
 (data $12 (i32.const 572) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\10\00\00\00e\00r\00r\00-\00b\00o\00o\00m\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $13 (i32.const 620) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00u\00n\00r\00e\00a\00c\00h\00a\00b\00l\00e\00\00\00\00\00\00\00")
 (data $14 (i32.const 668) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\10\00\00\00s\00t\00r\00-\00b\00o\00o\00m\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $15 (i32.const 716) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006\00\00\00\00\00\00\00\00\00")
 (data $16 (i32.const 844) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $17 (i32.const 908) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\000\00\00\00\00\00\00\00\00\00\00\00")
 (data $18 (i32.const 940) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\00")
 (data $19 (i32.const 1340) "\1c\04\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $20 (i32.const 2396) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z\00\00\00\00\00")
 (data $21 (i32.const 2492) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00c\00a\00u\00g\00h\00t\00-\00e\00r\00r\00\00\00\00\00\00\00\00\00")
 (data $22 (i32.const 2540) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0e\00\00\00c\00a\00u\00g\00h\00t\00:\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $23 (i32.const 2588) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\12\00\00\00i\00n\00n\00e\00r\00-\00e\00r\00r\00\00\00\00\00\00\00\00\00\00\00")
 (data $24 (i32.const 2636) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00r\00e\00-\00\00\00\00\00\00\00")
 (data $25 (i32.const 2668) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0c\00\00\00o\00u\00t\00e\00r\00:\00")
 (data $26 (i32.const 2700) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\n\00\00\00f\00i\00r\00s\00t\00\00\00")
 (data $27 (i32.const 2732) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0e\00\00\00s\00e\00c\00o\00n\00d\00-\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $28 (i32.const 2780) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00A\00\00\00\00\00\00\00\00\00\00\00")
 (data $29 (i32.const 2812) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\10\00\00\00m\00a\00d\00e\00-\00e\00r\00r\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $30 (i32.const 2860) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $31 (i32.const 2924) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00 \00\00\00\00\00\00\00\00\00\00\00")
 (data $32 (i32.const 2956) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s\00")
 (data $33 (i32.const 3004) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $34 (i32.const 3136) " \00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00\02A\00\00\02\t\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00")
 (table $0 1 1 funcref)
 (elem $0 (i32.const 1))
 (export "throwError" (func $async-throw-values/throwError))
 (export "throwString" (func $async-throw-values/throwString))
 (export "throwNumber" (func $async-throw-values/throwNumber))
 (export "catchError" (func $async-throw-values/catchError))
 (export "throwAwaitString" (func $async-throw-values/throwAwaitString))
 (export "throwAwaitError" (func $async-throw-values/throwAwaitError))
 (export "throwAwaitNumber" (func $async-throw-values/throwAwaitNumber))
 (export "catchAwaitString" (func $async-throw-values/catchAwaitString))
 (export "nestedThrow" (func $async-throw-values/nestedThrow))
 (export "throwInCatch" (func $async-throw-values/throwInCatch))
 (export "throwBox" (func $async-throw-values/throwBox))
 (export "chunkString" (func $async-throw-values/chunkString))
 (export "makeError" (func $async-throw-values/makeError))
 (export "numValue" (func $async-throw-values/numValue))
 (export "__async_async_throw_values_mint" (func $async-throw-values/__async_async_throw_values_mint))
 (export "__async_async_throw_values_mint_string" (func $async-throw-values/__async_async_throw_values_mint_string))
 (export "__async_async_throw_values_throwError_last_handle" (func $async-throw-values/__async_async_throw_values_throwError_last_handle))
 (export "__async_async_throw_values_throwString_last_handle" (func $async-throw-values/__async_async_throw_values_throwString_last_handle))
 (export "__async_async_throw_values_throwNumber_last_handle" (func $async-throw-values/__async_async_throw_values_throwNumber_last_handle))
 (export "__async_async_throw_values_catchError_last_handle" (func $async-throw-values/__async_async_throw_values_catchError_last_handle))
 (export "__async_async_throw_values_throwAwaitString_last_handle" (func $async-throw-values/__async_async_throw_values_throwAwaitString_last_handle))
 (export "__async_async_throw_values_throwAwaitError_last_handle" (func $async-throw-values/__async_async_throw_values_throwAwaitError_last_handle))
 (export "__async_async_throw_values_throwAwaitNumber_last_handle" (func $async-throw-values/__async_async_throw_values_throwAwaitNumber_last_handle))
 (export "__async_async_throw_values_catchAwaitString_last_handle" (func $async-throw-values/__async_async_throw_values_catchAwaitString_last_handle))
 (export "__async_async_throw_values_nestedThrow_last_handle" (func $async-throw-values/__async_async_throw_values_nestedThrow_last_handle))
 (export "__async_async_throw_values_throwInCatch_last_handle" (func $async-throw-values/__async_async_throw_values_throwInCatch_last_handle))
 (export "__async_async_throw_values_throwBox_last_handle" (func $async-throw-values/__async_async_throw_values_throwBox_last_handle))
 (export "memory" (memory $0))
 (export "errMessage" (func $export:async-throw-values/errMessage))
 (export "boxValue" (func $export:async-throw-values/boxValue))
 (export "__async_async_throw_values_throwError_reclaim" (func $export:async-throw-values/__async_async_throw_values_throwError_reclaim))
 (export "__async_async_throw_values_throwError_result" (func $export:async-throw-values/__async_async_throw_values_throwError_result))
 (export "__async_async_throw_values_throwError_error" (func $export:async-throw-values/__async_async_throw_values_throwError_error))
 (export "__async_async_throw_values_throwError_errorValue" (func $export:async-throw-values/__async_async_throw_values_throwError_errorValue))
 (export "__async_async_throw_values_throwError_status" (func $export:async-throw-values/__async_async_throw_values_throwError_status))
 (export "__async_async_throw_values_throwString_reclaim" (func $export:async-throw-values/__async_async_throw_values_throwString_reclaim))
 (export "__async_async_throw_values_throwString_result" (func $export:async-throw-values/__async_async_throw_values_throwString_result))
 (export "__async_async_throw_values_throwString_error" (func $export:async-throw-values/__async_async_throw_values_throwString_error))
 (export "__async_async_throw_values_throwString_errorValue" (func $export:async-throw-values/__async_async_throw_values_throwString_errorValue))
 (export "__async_async_throw_values_throwString_status" (func $export:async-throw-values/__async_async_throw_values_throwString_status))
 (export "__async_async_throw_values_throwNumber_reclaim" (func $export:async-throw-values/__async_async_throw_values_throwNumber_reclaim))
 (export "__async_async_throw_values_throwNumber_result" (func $export:async-throw-values/__async_async_throw_values_throwNumber_result))
 (export "__async_async_throw_values_throwNumber_error" (func $export:async-throw-values/__async_async_throw_values_throwNumber_error))
 (export "__async_async_throw_values_throwNumber_errorValue" (func $export:async-throw-values/__async_async_throw_values_throwNumber_errorValue))
 (export "__async_async_throw_values_throwNumber_status" (func $export:async-throw-values/__async_async_throw_values_throwNumber_status))
 (export "__async_async_throw_values_catchError_reclaim" (func $export:async-throw-values/__async_async_throw_values_catchError_reclaim))
 (export "__async_async_throw_values_catchError_result" (func $export:async-throw-values/__async_async_throw_values_catchError_result))
 (export "__async_async_throw_values_catchError_error" (func $export:async-throw-values/__async_async_throw_values_catchError_error))
 (export "__async_async_throw_values_catchError_errorValue" (func $export:async-throw-values/__async_async_throw_values_catchError_errorValue))
 (export "__async_async_throw_values_catchError_status" (func $export:async-throw-values/__async_async_throw_values_catchError_status))
 (export "__async_async_throw_values_throwAwaitString_reclaim" (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_reclaim))
 (export "__async_async_throw_values_throwAwaitString_resume_0" (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_resume_0))
 (export "__async_async_throw_values_throwAwaitString_reject_0" (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_reject_0))
 (export "__async_async_throw_values_throwAwaitString_result" (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_result))
 (export "__async_async_throw_values_throwAwaitString_error" (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_error))
 (export "__async_async_throw_values_throwAwaitString_errorValue" (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_errorValue))
 (export "__async_async_throw_values_throwAwaitString_status" (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_status))
 (export "__async_async_throw_values_throwAwaitError_reclaim" (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_reclaim))
 (export "__async_async_throw_values_throwAwaitError_resume_0" (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_resume_0))
 (export "__async_async_throw_values_throwAwaitError_reject_0" (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_reject_0))
 (export "__async_async_throw_values_throwAwaitError_result" (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_result))
 (export "__async_async_throw_values_throwAwaitError_error" (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_error))
 (export "__async_async_throw_values_throwAwaitError_errorValue" (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_errorValue))
 (export "__async_async_throw_values_throwAwaitError_status" (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_status))
 (export "__async_async_throw_values_throwAwaitNumber_reclaim" (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_reclaim))
 (export "__async_async_throw_values_throwAwaitNumber_resume_0" (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_resume_0))
 (export "__async_async_throw_values_throwAwaitNumber_reject_0" (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_reject_0))
 (export "__async_async_throw_values_throwAwaitNumber_result" (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_result))
 (export "__async_async_throw_values_throwAwaitNumber_error" (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_error))
 (export "__async_async_throw_values_throwAwaitNumber_errorValue" (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_errorValue))
 (export "__async_async_throw_values_throwAwaitNumber_status" (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_status))
 (export "__async_async_throw_values_catchAwaitString_reclaim" (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_reclaim))
 (export "__async_async_throw_values_catchAwaitString_resume_0" (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_resume_0))
 (export "__async_async_throw_values_catchAwaitString_reject_0" (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_reject_0))
 (export "__async_async_throw_values_catchAwaitString_result" (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_result))
 (export "__async_async_throw_values_catchAwaitString_error" (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_error))
 (export "__async_async_throw_values_catchAwaitString_errorValue" (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_errorValue))
 (export "__async_async_throw_values_catchAwaitString_status" (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_status))
 (export "__async_async_throw_values_nestedThrow_reclaim" (func $export:async-throw-values/__async_async_throw_values_nestedThrow_reclaim))
 (export "__async_async_throw_values_nestedThrow_result" (func $export:async-throw-values/__async_async_throw_values_nestedThrow_result))
 (export "__async_async_throw_values_nestedThrow_error" (func $export:async-throw-values/__async_async_throw_values_nestedThrow_error))
 (export "__async_async_throw_values_nestedThrow_errorValue" (func $export:async-throw-values/__async_async_throw_values_nestedThrow_errorValue))
 (export "__async_async_throw_values_nestedThrow_status" (func $export:async-throw-values/__async_async_throw_values_nestedThrow_status))
 (export "__async_async_throw_values_throwInCatch_reclaim" (func $export:async-throw-values/__async_async_throw_values_throwInCatch_reclaim))
 (export "__async_async_throw_values_throwInCatch_result" (func $export:async-throw-values/__async_async_throw_values_throwInCatch_result))
 (export "__async_async_throw_values_throwInCatch_error" (func $export:async-throw-values/__async_async_throw_values_throwInCatch_error))
 (export "__async_async_throw_values_throwInCatch_errorValue" (func $export:async-throw-values/__async_async_throw_values_throwInCatch_errorValue))
 (export "__async_async_throw_values_throwInCatch_status" (func $export:async-throw-values/__async_async_throw_values_throwInCatch_status))
 (export "__async_async_throw_values_throwBox_reclaim" (func $export:async-throw-values/__async_async_throw_values_throwBox_reclaim))
 (export "__async_async_throw_values_throwBox_result" (func $export:async-throw-values/__async_async_throw_values_throwBox_result))
 (export "__async_async_throw_values_throwBox_error" (func $export:async-throw-values/__async_async_throw_values_throwBox_error))
 (export "__async_async_throw_values_throwBox_errorValue" (func $export:async-throw-values/__async_async_throw_values_throwBox_errorValue))
 (export "__async_async_throw_values_throwBox_status" (func $export:async-throw-values/__async_async_throw_values_throwBox_status))
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
 (func $async-throw-values/__Cps_throwError#set:state (param $this i32) (param $state i32)
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
 (func $async-throw-values/__Cps_throwError#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwError#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwError#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwError#set:__cps___async_try_throwVal_0_0 (param $this i32) (param $__cps___async_try_throwVal_0_0 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_0_0
  i32.store offset=16
  local.get $this
  local.get $__cps___async_try_throwVal_0_0
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#get:length_ (param $this i32) (result i32)
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwError#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/error/Error#set:message (param $this i32) (param $message i32)
  local.get $this
  local.get $message
  i32.store offset=8
  local.get $this
  local.get $message
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/error/Error#set:name (param $this i32) (param $name i32)
  local.get $this
  local.get $name
  i32.store
  local.get $this
  local.get $name
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/error/Error#set:stack (param $this i32) (param $stack i32)
  local.get $this
  local.get $stack
  i32.store offset=4
  local.get $this
  local.get $stack
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwError#get:__cps___async_try_throwVal_0_0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/error/Error#get:message (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
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
 (func $async-throw-values/__Cps_throwString#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-throw-values/__Cps_throwString#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwString#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwString#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwString#set:__cps___async_try_throwVal_0_0 (param $this i32) (param $__cps___async_try_throwVal_0_0 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_0_0
  i32.store offset=16
  local.get $this
  local.get $__cps___async_try_throwVal_0_0
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwString#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/__Cps_throwString#get:__cps___async_try_throwVal_0_0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $async-throw-values/__Cps_throwNumber#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-throw-values/__Cps_throwNumber#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwNumber#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwNumber#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwNumber#set:__cps___async_try_throwVal_0_0 (param $this i32) (param $__cps___async_try_throwVal_0_0 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_0_0
  i32.store offset=16
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwNumber#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/__Cps_throwNumber#get:__cps___async_try_throwVal_0_0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/util/number/decimalCount32 (param $value i32) (result i32)
  local.get $value
  i32.const 100000
  i32.lt_u
  if
   local.get $value
   i32.const 100
   i32.lt_u
   if
    i32.const 1
    local.get $value
    i32.const 10
    i32.ge_u
    i32.add
    return
   else
    i32.const 3
    local.get $value
    i32.const 10000
    i32.ge_u
    i32.add
    local.get $value
    i32.const 1000
    i32.ge_u
    i32.add
    return
   end
   unreachable
  else
   local.get $value
   i32.const 10000000
   i32.lt_u
   if
    i32.const 6
    local.get $value
    i32.const 1000000
    i32.ge_u
    i32.add
    return
   else
    i32.const 8
    local.get $value
    i32.const 1000000000
    i32.ge_u
    i32.add
    local.get $value
    i32.const 100000000
    i32.ge_u
    i32.add
    return
   end
   unreachable
  end
  unreachable
 )
 (func $~lib/util/number/utoa32_dec_lut (param $buffer i32) (param $num i32) (param $offset i32)
  (local $t i32)
  (local $r i32)
  (local $d1 i32)
  (local $d2 i32)
  (local $digits1 i64)
  (local $digits2 i64)
  (local $t|9 i32)
  (local $d1|10 i32)
  (local $digits i32)
  (local $digits|12 i32)
  (local $digit i32)
  loop $while-continue|0
   local.get $num
   i32.const 10000
   i32.ge_u
   if
    local.get $num
    i32.const 10000
    i32.div_u
    local.set $t
    local.get $num
    i32.const 10000
    i32.rem_u
    local.set $r
    local.get $t
    local.set $num
    local.get $r
    i32.const 100
    i32.div_u
    local.set $d1
    local.get $r
    i32.const 100
    i32.rem_u
    local.set $d2
    i32.const 940
    local.get $d1
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits1
    i32.const 940
    local.get $d2
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits2
    local.get $offset
    i32.const 4
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    local.get $digits1
    local.get $digits2
    i64.const 32
    i64.shl
    i64.or
    i64.store
    br $while-continue|0
   end
  end
  local.get $num
  i32.const 100
  i32.ge_u
  if
   local.get $num
   i32.const 100
   i32.div_u
   local.set $t|9
   local.get $num
   i32.const 100
   i32.rem_u
   local.set $d1|10
   local.get $t|9
   local.set $num
   local.get $offset
   i32.const 2
   i32.sub
   local.set $offset
   i32.const 940
   local.get $d1|10
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $digits
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digits
   i32.store
  end
  local.get $num
  i32.const 10
  i32.ge_u
  if
   local.get $offset
   i32.const 2
   i32.sub
   local.set $offset
   i32.const 940
   local.get $num
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $digits|12
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digits|12
   i32.store
  else
   local.get $offset
   i32.const 1
   i32.sub
   local.set $offset
   i32.const 48
   local.get $num
   i32.add
   local.set $digit
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digit
   i32.store16
  end
 )
 (func $~lib/util/number/utoa_hex_lut (param $buffer i32) (param $num i64) (param $offset i32)
  loop $while-continue|0
   local.get $offset
   i32.const 2
   i32.ge_u
   if
    local.get $offset
    i32.const 2
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 1360
    local.get $num
    i32.wrap_i64
    i32.const 255
    i32.and
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store
    local.get $num
    i64.const 8
    i64.shr_u
    local.set $num
    br $while-continue|0
   end
  end
  local.get $offset
  i32.const 1
  i32.and
  if
   local.get $buffer
   i32.const 1360
   local.get $num
   i32.wrap_i64
   i32.const 6
   i32.shl
   i32.add
   i32.load16_u
   i32.store16
  end
 )
 (func $~lib/util/number/ulog_base (param $num i64) (param $base i32) (result i32)
  (local $value i32)
  (local $b64 i64)
  (local $b i64)
  (local $e i32)
  block $~lib/util/number/isPowerOf2<i32>|inlined.0 (result i32)
   local.get $base
   local.set $value
   local.get $value
   i32.popcnt
   i32.const 1
   i32.eq
   br $~lib/util/number/isPowerOf2<i32>|inlined.0
  end
  if
   i32.const 63
   local.get $num
   i64.clz
   i32.wrap_i64
   i32.sub
   i32.const 31
   local.get $base
   i32.clz
   i32.sub
   i32.div_u
   i32.const 1
   i32.add
   return
  end
  local.get $base
  i64.extend_i32_s
  local.set $b64
  local.get $b64
  local.set $b
  i32.const 1
  local.set $e
  loop $while-continue|0
   local.get $num
   local.get $b
   i64.ge_u
   if
    local.get $num
    local.get $b
    i64.div_u
    local.set $num
    local.get $b
    local.get $b
    i64.mul
    local.set $b
    local.get $e
    i32.const 1
    i32.shl
    local.set $e
    br $while-continue|0
   end
  end
  loop $while-continue|1
   local.get $num
   i64.const 1
   i64.ge_u
   if
    local.get $num
    local.get $b64
    i64.div_u
    local.set $num
    local.get $e
    i32.const 1
    i32.add
    local.set $e
    br $while-continue|1
   end
  end
  local.get $e
  i32.const 1
  i32.sub
  return
 )
 (func $~lib/util/number/utoa64_any_core (param $buffer i32) (param $num i64) (param $offset i32) (param $radix i32)
  (local $base i64)
  (local $shift i64)
  (local $mask i64)
  (local $q i64)
  local.get $radix
  i64.extend_i32_s
  local.set $base
  local.get $radix
  local.get $radix
  i32.const 1
  i32.sub
  i32.and
  i32.const 0
  i32.eq
  if
   local.get $radix
   i32.ctz
   i32.const 7
   i32.and
   i64.extend_i32_s
   local.set $shift
   local.get $base
   i64.const 1
   i64.sub
   local.set $mask
   loop $do-loop|0
    local.get $offset
    i32.const 1
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 2416
    local.get $num
    local.get $mask
    i64.and
    i32.wrap_i64
    i32.const 1
    i32.shl
    i32.add
    i32.load16_u
    i32.store16
    local.get $num
    local.get $shift
    i64.shr_u
    local.set $num
    local.get $num
    i64.const 0
    i64.ne
    br_if $do-loop|0
   end
  else
   loop $do-loop|1
    local.get $offset
    i32.const 1
    i32.sub
    local.set $offset
    local.get $num
    local.get $base
    i64.div_u
    local.set $q
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 2416
    local.get $num
    local.get $q
    local.get $base
    i64.mul
    i64.sub
    i32.wrap_i64
    i32.const 1
    i32.shl
    i32.add
    i32.load16_u
    i32.store16
    local.get $q
    local.set $num
    local.get $num
    i64.const 0
    i64.ne
    br_if $do-loop|1
   end
  end
 )
 (func $~lib/number/I32#toString (param $this i32) (param $radix i32) (result i32)
  local.get $this
  local.get $radix
  call $~lib/util/number/itoa32
  return
 )
 (func $async-throw-values/__Cps_catchError#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-throw-values/__Cps_catchError#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchError#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchError#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_ret_0_0 (param $this i32) (param $__cps___async_try_ret_0_0 i32)
  local.get $this
  local.get $__cps___async_try_ret_0_0
  i32.store8 offset=16
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_brk_1_1 (param $this i32) (param $__cps___async_try_brk_1_1 i32)
  local.get $this
  local.get $__cps___async_try_brk_1_1
  i32.store8 offset=17
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_cnt_2_2 (param $this i32) (param $__cps___async_try_cnt_2_2 i32)
  local.get $this
  local.get $__cps___async_try_cnt_2_2
  i32.store8 offset=18
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_pendErr_3_3 (param $this i32) (param $__cps___async_try_pendErr_3_3 i32)
  local.get $this
  local.get $__cps___async_try_pendErr_3_3
  i32.store offset=20
  local.get $this
  local.get $__cps___async_try_pendErr_3_3
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_pendVal_4_4 (param $this i32) (param $__cps___async_try_pendVal_4_4 i32)
  local.get $this
  local.get $__cps___async_try_pendVal_4_4
  i32.store offset=24
  local.get $this
  local.get $__cps___async_try_pendVal_4_4
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_pendFail_5_5 (param $this i32) (param $__cps___async_try_pendFail_5_5 i32)
  local.get $this
  local.get $__cps___async_try_pendFail_5_5
  i32.store8 offset=28
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_retVal_6_6 (param $this i32) (param $__cps___async_try_retVal_6_6 i32)
  local.get $this
  local.get $__cps___async_try_retVal_6_6
  i32.store offset=32
  local.get $this
  local.get $__cps___async_try_retVal_6_6
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_flag_9_7 (param $this i32) (param $__cps___async_try_flag_9_7 i32)
  local.get $this
  local.get $__cps___async_try_flag_9_7
  i32.store8 offset=36
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_err_7_8 (param $this i32) (param $__cps___async_try_err_7_8 i32)
  local.get $this
  local.get $__cps___async_try_err_7_8
  i32.store offset=40
  local.get $this
  local.get $__cps___async_try_err_7_8
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_errVal_8_9 (param $this i32) (param $__cps___async_try_errVal_8_9 i32)
  local.get $this
  local.get $__cps___async_try_errVal_8_9
  i32.store offset=44
  local.get $this
  local.get $__cps___async_try_errVal_8_9
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchError#set:__cps___async_try_throwVal_10_10 (param $this i32) (param $__cps___async_try_throwVal_10_10 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_10_10
  i32.store offset=48
  local.get $this
  local.get $__cps___async_try_throwVal_10_10
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchError#set:__cps_e_11 (param $this i32) (param $__cps_e_11 i32)
  local.get $this
  local.get $__cps_e_11
  i32.store offset=52
  local.get $this
  local.get $__cps_e_11
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_catchError#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_flag_9_7 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=36
 )
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_throwVal_10_10 (param $this i32) (result i32)
  local.get $this
  i32.load offset=48
 )
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_ret_0_0 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=16
 )
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_brk_1_1 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=17
 )
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_cnt_2_2 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=18
 )
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_pendFail_5_5 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=28
 )
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_err_7_8 (param $this i32) (result i32)
  local.get $this
  i32.load offset=40
 )
 (func $async-throw-values/__Cps_catchError#get:__cps_e_11 (param $this i32) (result i32)
  local.get $this
  i32.load offset=52
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
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_errVal_8_9 (param $this i32) (result i32)
  local.get $this
  i32.load offset=44
 )
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_pendVal_4_4 (param $this i32) (result i32)
  local.get $this
  i32.load offset=24
 )
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_pendErr_3_3 (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $async-throw-values/__Cps_catchError#get:__cps___async_try_retVal_6_6 (param $this i32) (result i32)
  local.get $this
  i32.load offset=32
 )
 (func $async-throw-values/__Cps_throwAwaitString#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-throw-values/__Cps_throwAwaitString#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitString#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitString#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitString#set:__pend0 (param $this i32) (param $__pend0 i32)
  local.get $this
  local.get $__pend0
  i32.store offset=16
  local.get $this
  local.get $__pend0
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitString#set:__cps___async_try_throwVal_0_0 (param $this i32) (param $__cps___async_try_throwVal_0_0 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_0_0
  i32.store offset=20
  local.get $this
  local.get $__cps___async_try_throwVal_0_0
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwAwaitString#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/__Cps_throwAwaitString#get:__pend0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $async-throw-values/__Cps_throwAwaitString#get:__cps___async_try_throwVal_0_0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $async-throw-values/__Cps_throwAwaitError#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-throw-values/__Cps_throwAwaitError#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitError#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitError#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitError#set:__pend0 (param $this i32) (param $__pend0 i32)
  local.get $this
  local.get $__pend0
  i32.store offset=16
  local.get $this
  local.get $__pend0
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitError#set:__cps___async_try_throwVal_0_0 (param $this i32) (param $__cps___async_try_throwVal_0_0 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_0_0
  i32.store offset=20
  local.get $this
  local.get $__cps___async_try_throwVal_0_0
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwAwaitError#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/__Cps_throwAwaitError#get:__pend0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $async-throw-values/__Cps_throwAwaitError#get:__cps___async_try_throwVal_0_0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#set:__pend0 (param $this i32) (param $__pend0 i32)
  local.get $this
  local.get $__pend0
  i32.store offset=16
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#set:__cps___async_try_throwVal_0_0 (param $this i32) (param $__cps___async_try_throwVal_0_0 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_0_0
  i32.store offset=20
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#get:__pend0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#get:__cps___async_try_throwVal_0_0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__pend0 (param $this i32) (param $__pend0 i32)
  local.get $this
  local.get $__pend0
  i32.store offset=16
  local.get $this
  local.get $__pend0
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_ret_0_0 (param $this i32) (param $__cps___async_try_ret_0_0 i32)
  local.get $this
  local.get $__cps___async_try_ret_0_0
  i32.store8 offset=20
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_brk_1_1 (param $this i32) (param $__cps___async_try_brk_1_1 i32)
  local.get $this
  local.get $__cps___async_try_brk_1_1
  i32.store8 offset=21
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_cnt_2_2 (param $this i32) (param $__cps___async_try_cnt_2_2 i32)
  local.get $this
  local.get $__cps___async_try_cnt_2_2
  i32.store8 offset=22
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_pendErr_3_3 (param $this i32) (param $__cps___async_try_pendErr_3_3 i32)
  local.get $this
  local.get $__cps___async_try_pendErr_3_3
  i32.store offset=24
  local.get $this
  local.get $__cps___async_try_pendErr_3_3
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_pendVal_4_4 (param $this i32) (param $__cps___async_try_pendVal_4_4 i32)
  local.get $this
  local.get $__cps___async_try_pendVal_4_4
  i32.store offset=28
  local.get $this
  local.get $__cps___async_try_pendVal_4_4
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_pendFail_5_5 (param $this i32) (param $__cps___async_try_pendFail_5_5 i32)
  local.get $this
  local.get $__cps___async_try_pendFail_5_5
  i32.store8 offset=32
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_retVal_6_6 (param $this i32) (param $__cps___async_try_retVal_6_6 i32)
  local.get $this
  local.get $__cps___async_try_retVal_6_6
  i32.store offset=36
  local.get $this
  local.get $__cps___async_try_retVal_6_6
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_flag_9_7 (param $this i32) (param $__cps___async_try_flag_9_7 i32)
  local.get $this
  local.get $__cps___async_try_flag_9_7
  i32.store8 offset=40
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_err_7_8 (param $this i32) (param $__cps___async_try_err_7_8 i32)
  local.get $this
  local.get $__cps___async_try_err_7_8
  i32.store offset=44
  local.get $this
  local.get $__cps___async_try_err_7_8
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_errVal_8_9 (param $this i32) (param $__cps___async_try_errVal_8_9 i32)
  local.get $this
  local.get $__cps___async_try_errVal_8_9
  i32.store offset=48
  local.get $this
  local.get $__cps___async_try_errVal_8_9
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_throwVal_10_10 (param $this i32) (param $__cps___async_try_throwVal_10_10 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_10_10
  i32.store offset=52
  local.get $this
  local.get $__cps___async_try_throwVal_10_10
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_catchAwaitString#set:__cps_e_11 (param $this i32) (param $__cps_e_11 i32)
  local.get $this
  local.get $__cps_e_11
  i32.store offset=56
  local.get $this
  local.get $__cps_e_11
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_flag_9_7 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=40
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__pend0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_throwVal_10_10 (param $this i32) (result i32)
  local.get $this
  i32.load offset=52
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_ret_0_0 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=20
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_brk_1_1 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=21
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_cnt_2_2 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=22
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_pendFail_5_5 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=32
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_err_7_8 (param $this i32) (result i32)
  local.get $this
  i32.load offset=44
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps_e_11 (param $this i32) (result i32)
  local.get $this
  i32.load offset=56
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_errVal_8_9 (param $this i32) (result i32)
  local.get $this
  i32.load offset=48
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_pendVal_4_4 (param $this i32) (result i32)
  local.get $this
  i32.load offset=28
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_pendErr_3_3 (param $this i32) (result i32)
  local.get $this
  i32.load offset=24
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_retVal_6_6 (param $this i32) (result i32)
  local.get $this
  i32.load offset=36
 )
 (func $async-throw-values/__Cps_nestedThrow#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_ret_0_0 (param $this i32) (param $__cps___async_try_ret_0_0 i32)
  local.get $this
  local.get $__cps___async_try_ret_0_0
  i32.store8 offset=16
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_brk_1_1 (param $this i32) (param $__cps___async_try_brk_1_1 i32)
  local.get $this
  local.get $__cps___async_try_brk_1_1
  i32.store8 offset=17
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_cnt_2_2 (param $this i32) (param $__cps___async_try_cnt_2_2 i32)
  local.get $this
  local.get $__cps___async_try_cnt_2_2
  i32.store8 offset=18
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_pendErr_3_3 (param $this i32) (param $__cps___async_try_pendErr_3_3 i32)
  local.get $this
  local.get $__cps___async_try_pendErr_3_3
  i32.store offset=20
  local.get $this
  local.get $__cps___async_try_pendErr_3_3
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_pendVal_4_4 (param $this i32) (param $__cps___async_try_pendVal_4_4 i32)
  local.get $this
  local.get $__cps___async_try_pendVal_4_4
  i32.store offset=24
  local.get $this
  local.get $__cps___async_try_pendVal_4_4
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_pendFail_5_5 (param $this i32) (param $__cps___async_try_pendFail_5_5 i32)
  local.get $this
  local.get $__cps___async_try_pendFail_5_5
  i32.store8 offset=28
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_retVal_6_6 (param $this i32) (param $__cps___async_try_retVal_6_6 i32)
  local.get $this
  local.get $__cps___async_try_retVal_6_6
  i32.store offset=32
  local.get $this
  local.get $__cps___async_try_retVal_6_6
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_9_7 (param $this i32) (param $__cps___async_try_flag_9_7 i32)
  local.get $this
  local.get $__cps___async_try_flag_9_7
  i32.store8 offset=36
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_err_7_8 (param $this i32) (param $__cps___async_try_err_7_8 i32)
  local.get $this
  local.get $__cps___async_try_err_7_8
  i32.store offset=40
  local.get $this
  local.get $__cps___async_try_err_7_8
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_errVal_8_9 (param $this i32) (param $__cps___async_try_errVal_8_9 i32)
  local.get $this
  local.get $__cps___async_try_errVal_8_9
  i32.store offset=44
  local.get $this
  local.get $__cps___async_try_errVal_8_9
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_12_10 (param $this i32) (param $__cps___async_try_flag_12_10 i32)
  local.get $this
  local.get $__cps___async_try_flag_12_10
  i32.store8 offset=48
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_err_10_11 (param $this i32) (param $__cps___async_try_err_10_11 i32)
  local.get $this
  local.get $__cps___async_try_err_10_11
  i32.store offset=52
  local.get $this
  local.get $__cps___async_try_err_10_11
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_errVal_11_12 (param $this i32) (param $__cps___async_try_errVal_11_12 i32)
  local.get $this
  local.get $__cps___async_try_errVal_11_12
  i32.store offset=56
  local.get $this
  local.get $__cps___async_try_errVal_11_12
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_throwVal_13_13 (param $this i32) (param $__cps___async_try_throwVal_13_13 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_13_13
  i32.store offset=60
  local.get $this
  local.get $__cps___async_try_throwVal_13_13
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps_e_14 (param $this i32) (param $__cps_e_14 i32)
  local.get $this
  local.get $__cps_e_14
  i32.store offset=64
  local.get $this
  local.get $__cps_e_14
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_throwVal_14_15 (param $this i32) (param $__cps___async_try_throwVal_14_15 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_14_15
  i32.store offset=68
  local.get $this
  local.get $__cps___async_try_throwVal_14_15
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_nestedThrow#set:__cps_e_16 (param $this i32) (param $__cps_e_16 i32)
  local.get $this
  local.get $__cps_e_16
  i32.store offset=72
  local.get $this
  local.get $__cps_e_16
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_nestedThrow#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_flag_9_7 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=36
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_flag_12_10 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=48
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_throwVal_13_13 (param $this i32) (result i32)
  local.get $this
  i32.load offset=60
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_ret_0_0 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=16
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_brk_1_1 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=17
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_cnt_2_2 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=18
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendFail_5_5 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=28
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_err_10_11 (param $this i32) (result i32)
  local.get $this
  i32.load offset=52
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps_e_14 (param $this i32) (result i32)
  local.get $this
  i32.load offset=64
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_throwVal_14_15 (param $this i32) (result i32)
  local.get $this
  i32.load offset=68
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_errVal_11_12 (param $this i32) (result i32)
  local.get $this
  i32.load offset=56
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendErr_3_3 (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendVal_4_4 (param $this i32) (result i32)
  local.get $this
  i32.load offset=24
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_err_7_8 (param $this i32) (result i32)
  local.get $this
  i32.load offset=40
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps_e_16 (param $this i32) (result i32)
  local.get $this
  i32.load offset=72
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_errVal_8_9 (param $this i32) (result i32)
  local.get $this
  i32.load offset=44
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_retVal_6_6 (param $this i32) (result i32)
  local.get $this
  i32.load offset=32
 )
 (func $async-throw-values/__Cps_throwInCatch#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_ret_0_0 (param $this i32) (param $__cps___async_try_ret_0_0 i32)
  local.get $this
  local.get $__cps___async_try_ret_0_0
  i32.store8 offset=16
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_brk_1_1 (param $this i32) (param $__cps___async_try_brk_1_1 i32)
  local.get $this
  local.get $__cps___async_try_brk_1_1
  i32.store8 offset=17
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_cnt_2_2 (param $this i32) (param $__cps___async_try_cnt_2_2 i32)
  local.get $this
  local.get $__cps___async_try_cnt_2_2
  i32.store8 offset=18
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendErr_3_3 (param $this i32) (param $__cps___async_try_pendErr_3_3 i32)
  local.get $this
  local.get $__cps___async_try_pendErr_3_3
  i32.store offset=20
  local.get $this
  local.get $__cps___async_try_pendErr_3_3
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendVal_4_4 (param $this i32) (param $__cps___async_try_pendVal_4_4 i32)
  local.get $this
  local.get $__cps___async_try_pendVal_4_4
  i32.store offset=24
  local.get $this
  local.get $__cps___async_try_pendVal_4_4
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendFail_5_5 (param $this i32) (param $__cps___async_try_pendFail_5_5 i32)
  local.get $this
  local.get $__cps___async_try_pendFail_5_5
  i32.store8 offset=28
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_flag_8_6 (param $this i32) (param $__cps___async_try_flag_8_6 i32)
  local.get $this
  local.get $__cps___async_try_flag_8_6
  i32.store8 offset=29
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_err_6_7 (param $this i32) (param $__cps___async_try_err_6_7 i32)
  local.get $this
  local.get $__cps___async_try_err_6_7
  i32.store offset=32
  local.get $this
  local.get $__cps___async_try_err_6_7
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_errVal_7_8 (param $this i32) (param $__cps___async_try_errVal_7_8 i32)
  local.get $this
  local.get $__cps___async_try_errVal_7_8
  i32.store offset=36
  local.get $this
  local.get $__cps___async_try_errVal_7_8
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_throwVal_9_9 (param $this i32) (param $__cps___async_try_throwVal_9_9 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_9_9
  i32.store offset=40
  local.get $this
  local.get $__cps___async_try_throwVal_9_9
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps_e_10 (param $this i32) (param $__cps_e_10 i32)
  local.get $this
  local.get $__cps_e_10
  i32.store offset=44
  local.get $this
  local.get $__cps_e_10
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_throwVal_10_11 (param $this i32) (param $__cps___async_try_throwVal_10_11 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_10_11
  i32.store offset=48
  local.get $this
  local.get $__cps___async_try_throwVal_10_11
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwInCatch#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_flag_8_6 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=29
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_throwVal_9_9 (param $this i32) (result i32)
  local.get $this
  i32.load offset=40
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_ret_0_0 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=16
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_brk_1_1 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=17
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_cnt_2_2 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=18
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_pendFail_5_5 (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=28
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_err_6_7 (param $this i32) (result i32)
  local.get $this
  i32.load offset=32
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps_e_10 (param $this i32) (result i32)
  local.get $this
  i32.load offset=44
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_throwVal_10_11 (param $this i32) (result i32)
  local.get $this
  i32.load offset=48
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_errVal_7_8 (param $this i32) (result i32)
  local.get $this
  i32.load offset=36
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_pendVal_4_4 (param $this i32) (result i32)
  local.get $this
  i32.load offset=24
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_pendErr_3_3 (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $async-throw-values/__Cps_throwBox#set:state (param $this i32) (param $state i32)
  local.get $this
  local.get $state
  i32.store
 )
 (func $async-throw-values/__Cps_throwBox#set:__result (param $this i32) (param $__result i32)
  local.get $this
  local.get $__result
  i32.store offset=4
  local.get $this
  local.get $__result
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwBox#set:__error (param $this i32) (param $__error i32)
  local.get $this
  local.get $__error
  i32.store offset=8
  local.get $this
  local.get $__error
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwBox#set:__errorValue (param $this i32) (param $__errorValue i32)
  local.get $this
  local.get $__errorValue
  i32.store offset=12
  local.get $this
  local.get $__errorValue
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwBox#set:__cps_b_0 (param $this i32) (param $__cps_b_0 i32)
  local.get $this
  local.get $__cps_b_0
  i32.store offset=16
  local.get $this
  local.get $__cps_b_0
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $async-throw-values/__Cps_throwBox#set:__cps___async_try_throwVal_0_1 (param $this i32) (param $__cps___async_try_throwVal_0_1 i32)
  local.get $this
  local.get $__cps___async_try_throwVal_0_1
  i32.store offset=20
  local.get $this
  local.get $__cps___async_try_throwVal_0_1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwBox#get:state (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/Box#set:v (param $this i32) (param $v i32)
  local.get $this
  local.get $v
  i32.store
 )
 (func $async-throw-values/__Cps_throwBox#get:__cps_b_0 (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $async-throw-values/__Cps_throwBox#get:__cps___async_try_throwVal_0_1 (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $async-throw-values/chunkString (param $i i32) (result i32)
  i32.const 2800
  return
 )
 (func $async-throw-values/makeError (result i32)
  i32.const 0
  i32.const 2832
  call $~lib/error/Error#constructor
  return
 )
 (func $async-throw-values/numValue (result i32)
  i32.const 42
  return
 )
 (func $async-throw-values/Box#get:v (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $async-throw-values/__async_async_throw_values_mint (result i32)
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
 (func $async-throw-values/__async_async_throw_values_mint_string (param $len i32) (result i32)
  i32.const 2944
  local.get $len
  call $~lib/string/String#repeat
  return
 )
 (func $async-throw-values/__Cps_throwError#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwError#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_throwError#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-throw-values/__Cps_throwString#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwString#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_throwString#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-throw-values/__Cps_throwNumber#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwNumber#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_throwNumber#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-throw-values/__Cps_catchError#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_catchError#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_catchError#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-throw-values/__Cps_throwAwaitString#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwAwaitString#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_throwAwaitString#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-throw-values/__Cps_throwAwaitError#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwAwaitError#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_throwAwaitError#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_catchAwaitString#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_nestedThrow#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_throwInCatch#get:__errorValue (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $async-throw-values/__Cps_throwBox#get:__result (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $async-throw-values/__Cps_throwBox#get:__error (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $async-throw-values/__Cps_throwBox#get:__errorValue (param $this i32) (result i32)
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
  i32.const 3024
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 32
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 1360
  local.get $0
  call $~lib/rt/itcms/__visit
  i32.const 2416
  local.get $0
  call $~lib/rt/itcms/__visit
  global.get $async-throw-values/__async_roots_throwError
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-throw-values/__async_roots_throwString
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-throw-values/__async_roots_throwNumber
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-throw-values/__async_roots_catchError
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-throw-values/__async_roots_throwAwaitString
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-throw-values/__async_roots_throwAwaitError
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-throw-values/__async_roots_throwAwaitNumber
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-throw-values/__async_roots_catchAwaitString
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-throw-values/__async_roots_nestedThrow
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-throw-values/__async_roots_throwInCatch
  local.tee $1
  if
   local.get $1
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-throw-values/__async_roots_throwBox
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
 (func $async-throw-values/__Cps_throwError~visit (param $0 i32) (param $1 i32)
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
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#__visit
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
 (func $async-throw-values/__Cps_throwString~visit (param $0 i32) (param $1 i32)
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
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#__visit
 )
 (func $async-throw-values/__Cps_throwNumber~visit (param $0 i32) (param $1 i32)
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
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#__visit
 )
 (func $async-throw-values/__Cps_catchError~visit (param $0 i32) (param $1 i32)
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
  i32.load offset=20
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=24
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
  i32.load offset=44
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
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#__visit
 )
 (func $async-throw-values/__Cps_throwAwaitString~visit (param $0 i32) (param $1 i32)
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
  i32.load offset=20
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#__visit
 )
 (func $async-throw-values/__Cps_throwAwaitError~visit (param $0 i32) (param $1 i32)
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
  i32.load offset=20
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#__visit
 )
 (func $async-throw-values/__Cps_throwAwaitNumber~visit (param $0 i32) (param $1 i32)
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
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#__visit
 )
 (func $async-throw-values/__Cps_catchAwaitString~visit (param $0 i32) (param $1 i32)
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
  i32.load offset=24
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=28
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=36
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=44
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
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#__visit
 )
 (func $async-throw-values/__Cps_nestedThrow~visit (param $0 i32) (param $1 i32)
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
  i32.load offset=20
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=24
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
  i32.load offset=44
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
  local.get $0
  i32.load offset=64
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=68
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=72
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#__visit
 )
 (func $async-throw-values/__Cps_throwInCatch~visit (param $0 i32) (param $1 i32)
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
  i32.load offset=20
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=24
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=32
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=36
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=40
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=44
  local.get $1
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=48
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#__visit
 )
 (func $async-throw-values/__Cps_throwBox~visit (param $0 i32) (param $1 i32)
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
  i32.load offset=20
  local.get $1
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>~visit (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/object/Object~visit
  local.get $0
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#__visit
 )
 (func $~lib/rt/__visit_members (param $0 i32) (param $1 i32)
  block $invalid
   block $~lib/array/Array<async-throw-values/__Cps_throwBox>
    block $async-throw-values/__Cps_throwBox
     block $~lib/array/Array<async-throw-values/__Cps_throwInCatch>
      block $async-throw-values/__Cps_throwInCatch
       block $~lib/array/Array<async-throw-values/__Cps_nestedThrow>
        block $async-throw-values/__Cps_nestedThrow
         block $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>
          block $async-throw-values/__Cps_catchAwaitString
           block $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>
            block $async-throw-values/__Cps_throwAwaitNumber
             block $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>
              block $async-throw-values/__Cps_throwAwaitError
               block $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>
                block $async-throw-values/__Cps_throwAwaitString
                 block $~lib/array/Array<async-throw-values/__Cps_catchError>
                  block $async-throw-values/__Cps_catchError
                   block $~lib/array/Array<async-throw-values/__Cps_throwNumber>
                    block $async-throw-values/__Cps_throwNumber
                     block $~lib/array/Array<async-throw-values/__Cps_throwString>
                      block $async-throw-values/__Cps_throwString
                       block $~lib/array/Array<i32>
                        block $~lib/array/Array<async-throw-values/__Cps_throwError>
                         block $async-throw-values/__Cps_throwError
                          block $async-throw-values/Box
                           block $~lib/promise/Promise<i32>
                            block $~lib/promise/Promise<~lib/error/Error>
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
                                   br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $~lib/promise/Promise<~lib/string/String> $~lib/error/Error $~lib/promise/Promise<~lib/error/Error> $~lib/promise/Promise<i32> $async-throw-values/Box $async-throw-values/__Cps_throwError $~lib/array/Array<async-throw-values/__Cps_throwError> $~lib/array/Array<i32> $async-throw-values/__Cps_throwString $~lib/array/Array<async-throw-values/__Cps_throwString> $async-throw-values/__Cps_throwNumber $~lib/array/Array<async-throw-values/__Cps_throwNumber> $async-throw-values/__Cps_catchError $~lib/array/Array<async-throw-values/__Cps_catchError> $async-throw-values/__Cps_throwAwaitString $~lib/array/Array<async-throw-values/__Cps_throwAwaitString> $async-throw-values/__Cps_throwAwaitError $~lib/array/Array<async-throw-values/__Cps_throwAwaitError> $async-throw-values/__Cps_throwAwaitNumber $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber> $async-throw-values/__Cps_catchAwaitString $~lib/array/Array<async-throw-values/__Cps_catchAwaitString> $async-throw-values/__Cps_nestedThrow $~lib/array/Array<async-throw-values/__Cps_nestedThrow> $async-throw-values/__Cps_throwInCatch $~lib/array/Array<async-throw-values/__Cps_throwInCatch> $async-throw-values/__Cps_throwBox $~lib/array/Array<async-throw-values/__Cps_throwBox> $invalid
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
                            return
                           end
                           return
                          end
                          return
                         end
                         local.get $0
                         local.get $1
                         call $async-throw-values/__Cps_throwError~visit
                         return
                        end
                        local.get $0
                        local.get $1
                        call $~lib/array/Array<async-throw-values/__Cps_throwError>~visit
                        return
                       end
                       local.get $0
                       local.get $1
                       call $~lib/array/Array<i32>~visit
                       return
                      end
                      local.get $0
                      local.get $1
                      call $async-throw-values/__Cps_throwString~visit
                      return
                     end
                     local.get $0
                     local.get $1
                     call $~lib/array/Array<async-throw-values/__Cps_throwString>~visit
                     return
                    end
                    local.get $0
                    local.get $1
                    call $async-throw-values/__Cps_throwNumber~visit
                    return
                   end
                   local.get $0
                   local.get $1
                   call $~lib/array/Array<async-throw-values/__Cps_throwNumber>~visit
                   return
                  end
                  local.get $0
                  local.get $1
                  call $async-throw-values/__Cps_catchError~visit
                  return
                 end
                 local.get $0
                 local.get $1
                 call $~lib/array/Array<async-throw-values/__Cps_catchError>~visit
                 return
                end
                local.get $0
                local.get $1
                call $async-throw-values/__Cps_throwAwaitString~visit
                return
               end
               local.get $0
               local.get $1
               call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>~visit
               return
              end
              local.get $0
              local.get $1
              call $async-throw-values/__Cps_throwAwaitError~visit
              return
             end
             local.get $0
             local.get $1
             call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>~visit
             return
            end
            local.get $0
            local.get $1
            call $async-throw-values/__Cps_throwAwaitNumber~visit
            return
           end
           local.get $0
           local.get $1
           call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>~visit
           return
          end
          local.get $0
          local.get $1
          call $async-throw-values/__Cps_catchAwaitString~visit
          return
         end
         local.get $0
         local.get $1
         call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>~visit
         return
        end
        local.get $0
        local.get $1
        call $async-throw-values/__Cps_nestedThrow~visit
        return
       end
       local.get $0
       local.get $1
       call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>~visit
       return
      end
      local.get $0
      local.get $1
      call $async-throw-values/__Cps_throwInCatch~visit
      return
     end
     local.get $0
     local.get $1
     call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>~visit
     return
    end
    local.get $0
    local.get $1
    call $async-throw-values/__Cps_throwBox~visit
    return
   end
   local.get $0
   local.get $1
   call $~lib/array/Array<async-throw-values/__Cps_throwBox>~visit
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#constructor
  global.set $async-throw-values/__async_roots_throwError
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#constructor
  global.set $async-throw-values/__async_roots_throwString
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#constructor
  global.set $async-throw-values/__async_roots_throwNumber
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#constructor
  global.set $async-throw-values/__async_roots_catchError
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#constructor
  global.set $async-throw-values/__async_roots_throwAwaitString
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#constructor
  global.set $async-throw-values/__async_roots_throwAwaitError
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#constructor
  global.set $async-throw-values/__async_roots_throwAwaitNumber
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#constructor
  global.set $async-throw-values/__async_roots_catchAwaitString
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#constructor
  global.set $async-throw-values/__async_roots_nestedThrow
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#constructor
  global.set $async-throw-values/__async_roots_throwInCatch
  i32.const 0
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#constructor
  global.set $async-throw-values/__async_roots_throwBox
 )
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__data_end
  i32.lt_s
  if
   i32.const 36064
   i32.const 36112
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $async-throw-values/__Cps_throwError#constructor (param $this i32) (result i32)
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
   i32.const 20
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
  call $async-throw-values/__Cps_throwError#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwError#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwError#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwError#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwError#set:__cps___async_try_throwVal_0_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#constructor (param $this i32) (param $length i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#set:length_
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/error/Error#constructor (param $this i32) (param $message i32) (result i32)
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
  local.get $this
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.const 5
   call $~lib/rt/itcms/__new
   local.tee $this
   i32.store
  end
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $message
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $~lib/error/Error#set:message
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 560
  call $~lib/error/Error#set:name
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 432
  call $~lib/error/Error#set:stack
  local.get $this
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_throwError#step (param $this i32) (result i32)
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
         call $async-throw-values/__Cps_throwError#get:state
         local.set $1
         local.get $1
         i32.const 0
         i32.eq
         br_if $case0|1
         local.get $1
         i32.const 1024
         i32.eq
         br_if $case1|1
         local.get $1
         i32.const 1025
         i32.eq
         br_if $case2|1
         br $case3|1
        end
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1024
        call $async-throw-values/__Cps_throwError#set:state
        br $break|1
       end
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const 0
       i32.const 592
       call $~lib/error/Error#constructor
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwError#set:__cps___async_try_throwVal_0_0
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
       call $async-throw-values/__Cps_throwError#get:__cps___async_try_throwVal_0_0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwError#set:__errorValue
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
       i32.store offset=12
       local.get $2
       call $async-throw-values/__Cps_throwError#get:__cps___async_try_throwVal_0_0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=8
       local.get $2
       call $~lib/error/Error#get:message
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwError#set:__error
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const -2
       call $async-throw-values/__Cps_throwError#set:state
       global.get $async-throw-values/__async_roots_throwError
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       global.get $async-throw-values/__async_roots_throwError
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
       call $~lib/array/Array<async-throw-values/__Cps_throwError>#indexOf
       i32.const 1
       call $~lib/array/Array<async-throw-values/__Cps_throwError>#splice
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
      i32.const 640
      call $async-throw-values/__Cps_throwError#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_throwError#set:state
      global.get $async-throw-values/__async_roots_throwError
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_throwError
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
      call $~lib/array/Array<async-throw-values/__Cps_throwError>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_throwError>#splice
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
     call $async-throw-values/__Cps_throwError#get:state
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
 (func $async-throw-values/throwError (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_throwError#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_throwError
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_throwError#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__Cps_throwString#constructor (param $this i32) (result i32)
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
   i32.const 20
   i32.const 12
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
  call $async-throw-values/__Cps_throwString#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwString#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwString#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwString#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwString#set:__cps___async_try_throwVal_0_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#constructor (param $this i32) (param $length i32) (result i32)
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
   i32.const 13
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:length_
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
  i32.const 13
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_throwString#step (param $this i32) (result i32)
  (local $1 i32)
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
  loop $while-continue|0
   i32.const 1
   if
    block $break|1
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
         call $async-throw-values/__Cps_throwString#get:state
         local.set $1
         local.get $1
         i32.const 0
         i32.eq
         br_if $case0|1
         local.get $1
         i32.const 1024
         i32.eq
         br_if $case1|1
         local.get $1
         i32.const 1025
         i32.eq
         br_if $case2|1
         br $case3|1
        end
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1024
        call $async-throw-values/__Cps_throwString#set:state
        br $break|1
       end
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const 688
       call $async-throw-values/__Cps_throwString#set:__cps___async_try_throwVal_0_0
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
       call $async-throw-values/__Cps_throwString#get:__cps___async_try_throwVal_0_0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwString#set:__errorValue
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
       call $async-throw-values/__Cps_throwString#get:__cps___async_try_throwVal_0_0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwString#set:__error
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const -2
       call $async-throw-values/__Cps_throwString#set:state
       global.get $async-throw-values/__async_roots_throwString
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       global.get $async-throw-values/__async_roots_throwString
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
       call $~lib/array/Array<async-throw-values/__Cps_throwString>#indexOf
       i32.const 1
       call $~lib/array/Array<async-throw-values/__Cps_throwString>#splice
       drop
       i32.const 2
       local.set $2
       global.get $~lib/memory/__stack_pointer
       i32.const 12
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
      i32.const 640
      call $async-throw-values/__Cps_throwString#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_throwString#set:state
      global.get $async-throw-values/__async_roots_throwString
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_throwString
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
      call $~lib/array/Array<async-throw-values/__Cps_throwString>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_throwString>#splice
      drop
      i32.const 1
      local.set $2
      global.get $~lib/memory/__stack_pointer
      i32.const 12
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
     call $async-throw-values/__Cps_throwString#get:state
     i32.const -1
     i32.eq
     if (result i32)
      i32.const 1
     else
      i32.const 2
     end
     local.set $2
     global.get $~lib/memory/__stack_pointer
     i32.const 12
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
 (func $async-throw-values/throwString (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_throwString#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_throwString
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_throwString#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__Cps_throwNumber#constructor (param $this i32) (result i32)
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
   i32.const 20
   i32.const 14
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
  call $async-throw-values/__Cps_throwNumber#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwNumber#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwNumber#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwNumber#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwNumber#set:__cps___async_try_throwVal_0_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#constructor (param $this i32) (param $length i32) (result i32)
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
   i32.const 15
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:length_
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
  i32.const 15
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_throwNumber#step (param $this i32) (result i32)
  (local $1 i32)
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
  loop $while-continue|0
   i32.const 1
   if
    block $break|1
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
         call $async-throw-values/__Cps_throwNumber#get:state
         local.set $1
         local.get $1
         i32.const 0
         i32.eq
         br_if $case0|1
         local.get $1
         i32.const 1024
         i32.eq
         br_if $case1|1
         local.get $1
         i32.const 1025
         i32.eq
         br_if $case2|1
         br $case3|1
        end
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1024
        call $async-throw-values/__Cps_throwNumber#set:state
        br $break|1
       end
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const 42
       call $async-throw-values/__Cps_throwNumber#set:__cps___async_try_throwVal_0_0
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const 0
       call $async-throw-values/__Cps_throwNumber#set:__errorValue
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
       call $async-throw-values/__Cps_throwNumber#get:__cps___async_try_throwVal_0_0
       i32.const 10
       call $~lib/number/I32#toString
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwNumber#set:__error
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const -2
       call $async-throw-values/__Cps_throwNumber#set:state
       global.get $async-throw-values/__async_roots_throwNumber
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       global.get $async-throw-values/__async_roots_throwNumber
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
       call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#indexOf
       i32.const 1
       call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#splice
       drop
       i32.const 2
       local.set $2
       global.get $~lib/memory/__stack_pointer
       i32.const 12
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
      i32.const 640
      call $async-throw-values/__Cps_throwNumber#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_throwNumber#set:state
      global.get $async-throw-values/__async_roots_throwNumber
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_throwNumber
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
      call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#splice
      drop
      i32.const 1
      local.set $2
      global.get $~lib/memory/__stack_pointer
      i32.const 12
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
     call $async-throw-values/__Cps_throwNumber#get:state
     i32.const -1
     i32.eq
     if (result i32)
      i32.const 1
     else
      i32.const 2
     end
     local.set $2
     global.get $~lib/memory/__stack_pointer
     i32.const 12
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
 (func $async-throw-values/throwNumber (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_throwNumber#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_throwNumber
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_throwNumber#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__Cps_catchError#constructor (param $this i32) (result i32)
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
   i32.const 56
   i32.const 16
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
  call $async-throw-values/__Cps_catchError#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchError#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchError#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchError#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_ret_0_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_brk_1_1
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_cnt_2_2
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_pendErr_3_3
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_pendVal_4_4
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_pendFail_5_5
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_retVal_6_6
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_flag_9_7
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_err_7_8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_errVal_8_9
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchError#set:__cps___async_try_throwVal_10_10
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchError#set:__cps_e_11
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#constructor (param $this i32) (param $length i32) (result i32)
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
   i32.const 17
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#set:length_
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
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:length_
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
  i32.const 17
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_catchError#step (param $this i32) (result i32)
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
                     call $async-throw-values/__Cps_catchError#get:state
                     local.set $1
                     local.get $1
                     i32.const 0
                     i32.eq
                     br_if $case0|1
                     local.get $1
                     i32.const 1024
                     i32.eq
                     br_if $case1|1
                     local.get $1
                     i32.const 1025
                     i32.eq
                     br_if $case2|1
                     local.get $1
                     i32.const 1026
                     i32.eq
                     br_if $case3|1
                     local.get $1
                     i32.const 1027
                     i32.eq
                     br_if $case4|1
                     local.get $1
                     i32.const 1028
                     i32.eq
                     br_if $case5|1
                     local.get $1
                     i32.const 1029
                     i32.eq
                     br_if $case6|1
                     local.get $1
                     i32.const 1030
                     i32.eq
                     br_if $case7|1
                     local.get $1
                     i32.const 1031
                     i32.eq
                     br_if $case8|1
                     local.get $1
                     i32.const 1032
                     i32.eq
                     br_if $case9|1
                     local.get $1
                     i32.const 1033
                     i32.eq
                     br_if $case10|1
                     local.get $1
                     i32.const 1034
                     i32.eq
                     br_if $case11|1
                     local.get $1
                     i32.const 1035
                     i32.eq
                     br_if $case12|1
                     local.get $1
                     i32.const 1036
                     i32.eq
                     br_if $case13|1
                     local.get $1
                     i32.const 1037
                     i32.eq
                     br_if $case14|1
                     br $case15|1
                    end
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 1024
                    call $async-throw-values/__Cps_catchError#set:state
                    br $break|1
                   end
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-throw-values/__Cps_catchError#set:__cps___async_try_ret_0_0
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-throw-values/__Cps_catchError#set:__cps___async_try_brk_1_1
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-throw-values/__Cps_catchError#set:__cps___async_try_cnt_2_2
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 432
                   call $async-throw-values/__Cps_catchError#set:__cps___async_try_pendErr_3_3
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-throw-values/__Cps_catchError#set:__cps___async_try_pendFail_5_5
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-throw-values/__Cps_catchError#set:__cps___async_try_flag_9_7
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 432
                   call $async-throw-values/__Cps_catchError#set:__cps___async_try_err_7_8
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1026
                   call $async-throw-values/__Cps_catchError#set:state
                   br $break|1
                  end
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  call $async-throw-values/__Cps_catchError#get:__cps___async_try_flag_9_7
                  if
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1031
                   call $async-throw-values/__Cps_catchError#set:state
                  else
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1030
                   call $async-throw-values/__Cps_catchError#set:state
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
                 call $async-throw-values/__Cps_catchError#set:state
                 br $break|1
                end
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 0
                i32.const 2512
                call $~lib/error/Error#constructor
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store offset=4
                local.get $2
                call $async-throw-values/__Cps_catchError#set:__cps___async_try_throwVal_10_10
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 0
                call $async-throw-values/__Cps_catchError#set:__cps___async_try_ret_0_0
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 0
                call $async-throw-values/__Cps_catchError#set:__cps___async_try_brk_1_1
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 0
                call $async-throw-values/__Cps_catchError#set:__cps___async_try_cnt_2_2
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                call $async-throw-values/__Cps_catchError#get:__cps___async_try_flag_9_7
                i32.eqz
                if
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
                 i32.store offset=12
                 local.get $2
                 call $async-throw-values/__Cps_catchError#get:__cps___async_try_throwVal_10_10
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store offset=8
                 local.get $2
                 call $~lib/error/Error#get:message
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store offset=4
                 local.get $2
                 call $async-throw-values/__Cps_catchError#set:__cps___async_try_err_7_8
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
                 call $async-throw-values/__Cps_catchError#get:__cps___async_try_throwVal_10_10
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store offset=4
                 local.get $2
                 call $async-throw-values/__Cps_catchError#set:__cps___async_try_errVal_8_9
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1
                 call $async-throw-values/__Cps_catchError#set:__cps___async_try_flag_9_7
                end
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                call $async-throw-values/__Cps_catchError#get:__cps___async_try_flag_9_7
                if (result i32)
                 i32.const 1
                else
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 call $async-throw-values/__Cps_catchError#get:__cps___async_try_ret_0_0
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
                 call $async-throw-values/__Cps_catchError#get:__cps___async_try_brk_1_1
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
                 call $async-throw-values/__Cps_catchError#get:__cps___async_try_cnt_2_2
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
                 call $async-throw-values/__Cps_catchError#get:__cps___async_try_pendFail_5_5
                end
                if
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1029
                 call $async-throw-values/__Cps_catchError#set:state
                else
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1028
                 call $async-throw-values/__Cps_catchError#set:state
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
               call $async-throw-values/__Cps_catchError#set:state
               br $break|1
              end
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1025
              call $async-throw-values/__Cps_catchError#set:state
              br $break|1
             end
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             call $async-throw-values/__Cps_catchError#get:__cps___async_try_flag_9_7
             if
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1033
              call $async-throw-values/__Cps_catchError#set:state
             else
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1034
              call $async-throw-values/__Cps_catchError#set:state
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
            call $async-throw-values/__Cps_catchError#set:__cps___async_try_flag_9_7
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
            call $async-throw-values/__Cps_catchError#get:__cps___async_try_err_7_8
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=4
            local.get $2
            call $async-throw-values/__Cps_catchError#set:__cps_e_11
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_catchError#set:__cps___async_try_ret_0_0
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_catchError#set:__cps___async_try_brk_1_1
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_catchError#set:__cps___async_try_cnt_2_2
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 2560
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=12
            local.get $2
            call $async-throw-values/__Cps_catchError#get:__cps_e_11
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
            call $async-throw-values/__Cps_catchError#set:__cps___async_try_retVal_6_6
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 1
            call $async-throw-values/__Cps_catchError#set:__cps___async_try_ret_0_0
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 1030
            call $async-throw-values/__Cps_catchError#set:state
            br $break|1
           end
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 640
           call $async-throw-values/__Cps_catchError#set:__result
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const -1
           call $async-throw-values/__Cps_catchError#set:state
           global.get $async-throw-values/__async_roots_catchError
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           global.get $async-throw-values/__async_roots_catchError
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
           call $~lib/array/Array<async-throw-values/__Cps_catchError>#indexOf
           i32.const 1
           call $~lib/array/Array<async-throw-values/__Cps_catchError>#splice
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
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=8
          local.get $2
          call $async-throw-values/__Cps_catchError#get:__cps___async_try_errVal_8_9
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-throw-values/__Cps_catchError#set:__errorValue
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
          call $async-throw-values/__Cps_catchError#get:__cps___async_try_err_7_8
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-throw-values/__Cps_catchError#set:__error
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const -2
          call $async-throw-values/__Cps_catchError#set:state
          global.get $async-throw-values/__async_roots_catchError
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          global.get $async-throw-values/__async_roots_catchError
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
          call $~lib/array/Array<async-throw-values/__Cps_catchError>#indexOf
          i32.const 1
          call $~lib/array/Array<async-throw-values/__Cps_catchError>#splice
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
         call $async-throw-values/__Cps_catchError#get:__cps___async_try_pendFail_5_5
         if
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1035
          call $async-throw-values/__Cps_catchError#set:state
         else
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1036
          call $async-throw-values/__Cps_catchError#set:state
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
        call $async-throw-values/__Cps_catchError#set:__cps___async_try_pendFail_5_5
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
        call $async-throw-values/__Cps_catchError#get:__cps___async_try_pendVal_4_4
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-throw-values/__Cps_catchError#set:__errorValue
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
        call $async-throw-values/__Cps_catchError#get:__cps___async_try_pendErr_3_3
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-throw-values/__Cps_catchError#set:__error
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const -2
        call $async-throw-values/__Cps_catchError#set:state
        global.get $async-throw-values/__async_roots_catchError
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        global.get $async-throw-values/__async_roots_catchError
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
        call $~lib/array/Array<async-throw-values/__Cps_catchError>#indexOf
        i32.const 1
        call $~lib/array/Array<async-throw-values/__Cps_catchError>#splice
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
       call $async-throw-values/__Cps_catchError#get:__cps___async_try_ret_0_0
       if
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1037
        call $async-throw-values/__Cps_catchError#set:state
       else
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1032
        call $async-throw-values/__Cps_catchError#set:state
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
      call $async-throw-values/__Cps_catchError#set:__cps___async_try_ret_0_0
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
      call $async-throw-values/__Cps_catchError#get:__cps___async_try_retVal_6_6
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      local.get $2
      call $async-throw-values/__Cps_catchError#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_catchError#set:state
      global.get $async-throw-values/__async_roots_catchError
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_catchError
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
      call $~lib/array/Array<async-throw-values/__Cps_catchError>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_catchError>#splice
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
     call $async-throw-values/__Cps_catchError#get:state
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
 (func $async-throw-values/catchError (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_catchError#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_catchError
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_catchError#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__Cps_throwAwaitString#constructor (param $this i32) (result i32)
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
   i32.const 24
   i32.const 18
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
  call $async-throw-values/__Cps_throwAwaitString#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwAwaitString#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwAwaitString#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwAwaitString#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwAwaitString#set:__pend0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwAwaitString#set:__cps___async_try_throwVal_0_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#constructor (param $this i32) (param $length i32) (result i32)
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
   i32.const 19
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:length_
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
  i32.const 19
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_throwAwaitString#step (param $this i32) (result i32)
  (local $1 i32)
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
  loop $while-continue|0
   i32.const 1
   if
    block $break|1
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
           call $async-throw-values/__Cps_throwAwaitString#get:state
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
           br $case5|1
          end
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1024
          call $async-throw-values/__Cps_throwAwaitString#set:state
          br $break|1
         end
         local.get $this
         local.set $2
         global.get $~lib/memory/__stack_pointer
         local.get $2
         i32.store
         local.get $2
         i32.const 1025
         call $async-throw-values/__Cps_throwAwaitString#set:state
         br $break|1
        end
        i32.const 0
        call $async-throw-values/getChunk
        drop
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1
        call $async-throw-values/__Cps_throwAwaitString#set:state
        i32.const 0
        local.set $2
        global.get $~lib/memory/__stack_pointer
        i32.const 12
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
       call $async-throw-values/__Cps_throwAwaitString#get:__pend0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwAwaitString#set:__cps___async_try_throwVal_0_0
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
       call $async-throw-values/__Cps_throwAwaitString#get:__cps___async_try_throwVal_0_0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwAwaitString#set:__errorValue
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
       call $async-throw-values/__Cps_throwAwaitString#get:__cps___async_try_throwVal_0_0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwAwaitString#set:__error
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const -2
       call $async-throw-values/__Cps_throwAwaitString#set:state
       global.get $async-throw-values/__async_roots_throwAwaitString
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       global.get $async-throw-values/__async_roots_throwAwaitString
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
       call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#indexOf
       i32.const 1
       call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#splice
       drop
       i32.const 2
       local.set $2
       global.get $~lib/memory/__stack_pointer
       i32.const 12
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
      i32.const 640
      call $async-throw-values/__Cps_throwAwaitString#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_throwAwaitString#set:state
      global.get $async-throw-values/__async_roots_throwAwaitString
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_throwAwaitString
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
      call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#splice
      drop
      i32.const 1
      local.set $2
      global.get $~lib/memory/__stack_pointer
      i32.const 12
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
     call $async-throw-values/__Cps_throwAwaitString#get:state
     i32.const -1
     i32.eq
     if (result i32)
      i32.const 1
     else
      i32.const 2
     end
     local.set $2
     global.get $~lib/memory/__stack_pointer
     i32.const 12
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
 (func $async-throw-values/throwAwaitString (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_throwAwaitString#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_throwAwaitString
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_throwAwaitString#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__Cps_throwAwaitError#constructor (param $this i32) (result i32)
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
   i32.const 24
   i32.const 20
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
  call $async-throw-values/__Cps_throwAwaitError#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwAwaitError#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwAwaitError#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwAwaitError#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwAwaitError#set:__pend0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwAwaitError#set:__cps___async_try_throwVal_0_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#constructor (param $this i32) (param $length i32) (result i32)
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
   i32.const 21
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:length_
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
  i32.const 21
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_throwAwaitError#step (param $this i32) (result i32)
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
           call $async-throw-values/__Cps_throwAwaitError#get:state
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
           br $case5|1
          end
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1024
          call $async-throw-values/__Cps_throwAwaitError#set:state
          br $break|1
         end
         local.get $this
         local.set $2
         global.get $~lib/memory/__stack_pointer
         local.get $2
         i32.store
         local.get $2
         i32.const 1025
         call $async-throw-values/__Cps_throwAwaitError#set:state
         br $break|1
        end
        call $async-throw-values/getError
        drop
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1
        call $async-throw-values/__Cps_throwAwaitError#set:state
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
       call $async-throw-values/__Cps_throwAwaitError#get:__pend0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwAwaitError#set:__cps___async_try_throwVal_0_0
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
       call $async-throw-values/__Cps_throwAwaitError#get:__cps___async_try_throwVal_0_0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwAwaitError#set:__errorValue
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
       i32.store offset=12
       local.get $2
       call $async-throw-values/__Cps_throwAwaitError#get:__cps___async_try_throwVal_0_0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=8
       local.get $2
       call $~lib/error/Error#get:message
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwAwaitError#set:__error
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const -2
       call $async-throw-values/__Cps_throwAwaitError#set:state
       global.get $async-throw-values/__async_roots_throwAwaitError
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       global.get $async-throw-values/__async_roots_throwAwaitError
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
       call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#indexOf
       i32.const 1
       call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#splice
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
      i32.const 640
      call $async-throw-values/__Cps_throwAwaitError#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_throwAwaitError#set:state
      global.get $async-throw-values/__async_roots_throwAwaitError
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_throwAwaitError
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
      call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#splice
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
     call $async-throw-values/__Cps_throwAwaitError#get:state
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
 (func $async-throw-values/throwAwaitError (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_throwAwaitError#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_throwAwaitError
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_throwAwaitError#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#constructor (param $this i32) (result i32)
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
   i32.const 24
   i32.const 22
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
  call $async-throw-values/__Cps_throwAwaitNumber#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwAwaitNumber#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwAwaitNumber#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwAwaitNumber#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwAwaitNumber#set:__pend0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwAwaitNumber#set:__cps___async_try_throwVal_0_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#constructor (param $this i32) (param $length i32) (result i32)
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
   i32.const 23
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:length_
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
  i32.const 23
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_throwAwaitNumber#step (param $this i32) (result i32)
  (local $1 i32)
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
  loop $while-continue|0
   i32.const 1
   if
    block $break|1
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
           call $async-throw-values/__Cps_throwAwaitNumber#get:state
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
           br $case5|1
          end
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1024
          call $async-throw-values/__Cps_throwAwaitNumber#set:state
          br $break|1
         end
         local.get $this
         local.set $2
         global.get $~lib/memory/__stack_pointer
         local.get $2
         i32.store
         local.get $2
         i32.const 1025
         call $async-throw-values/__Cps_throwAwaitNumber#set:state
         br $break|1
        end
        call $async-throw-values/getNumber
        drop
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1
        call $async-throw-values/__Cps_throwAwaitNumber#set:state
        i32.const 0
        local.set $2
        global.get $~lib/memory/__stack_pointer
        i32.const 12
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
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwAwaitNumber#get:__pend0
       call $async-throw-values/__Cps_throwAwaitNumber#set:__cps___async_try_throwVal_0_0
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const 0
       call $async-throw-values/__Cps_throwAwaitNumber#set:__errorValue
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
       call $async-throw-values/__Cps_throwAwaitNumber#get:__cps___async_try_throwVal_0_0
       i32.const 10
       call $~lib/number/I32#toString
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwAwaitNumber#set:__error
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const -2
       call $async-throw-values/__Cps_throwAwaitNumber#set:state
       global.get $async-throw-values/__async_roots_throwAwaitNumber
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       global.get $async-throw-values/__async_roots_throwAwaitNumber
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
       call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#indexOf
       i32.const 1
       call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#splice
       drop
       i32.const 2
       local.set $2
       global.get $~lib/memory/__stack_pointer
       i32.const 12
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
      i32.const 640
      call $async-throw-values/__Cps_throwAwaitNumber#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_throwAwaitNumber#set:state
      global.get $async-throw-values/__async_roots_throwAwaitNumber
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_throwAwaitNumber
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
      call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#splice
      drop
      i32.const 1
      local.set $2
      global.get $~lib/memory/__stack_pointer
      i32.const 12
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
     call $async-throw-values/__Cps_throwAwaitNumber#get:state
     i32.const -1
     i32.eq
     if (result i32)
      i32.const 1
     else
      i32.const 2
     end
     local.set $2
     global.get $~lib/memory/__stack_pointer
     i32.const 12
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
 (func $async-throw-values/throwAwaitNumber (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_throwAwaitNumber#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_throwAwaitNumber
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_throwAwaitNumber#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__Cps_catchAwaitString#constructor (param $this i32) (result i32)
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
   i32.const 60
   i32.const 24
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
  call $async-throw-values/__Cps_catchAwaitString#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchAwaitString#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchAwaitString#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchAwaitString#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchAwaitString#set:__pend0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_ret_0_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_brk_1_1
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_cnt_2_2
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_pendErr_3_3
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_pendVal_4_4
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_pendFail_5_5
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_retVal_6_6
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_flag_9_7
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_err_7_8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_errVal_8_9
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_throwVal_10_10
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_catchAwaitString#set:__cps_e_11
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#constructor (param $this i32) (param $length i32) (result i32)
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
   i32.const 25
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:length_
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
  i32.const 25
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_catchAwaitString#step (param $this i32) (result i32)
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
                       call $async-throw-values/__Cps_catchAwaitString#get:state
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
                       br $case17|1
                      end
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 1024
                      call $async-throw-values/__Cps_catchAwaitString#set:state
                      br $break|1
                     end
                     local.get $this
                     local.set $2
                     global.get $~lib/memory/__stack_pointer
                     local.get $2
                     i32.store
                     local.get $2
                     i32.const 1028
                     call $async-throw-values/__Cps_catchAwaitString#set:state
                     br $break|1
                    end
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 0
                    call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_ret_0_0
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 0
                    call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_brk_1_1
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 0
                    call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_cnt_2_2
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 432
                    call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_pendErr_3_3
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 0
                    call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_pendFail_5_5
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 0
                    call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_flag_9_7
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 432
                    call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_err_7_8
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 1026
                    call $async-throw-values/__Cps_catchAwaitString#set:state
                    br $break|1
                   end
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_flag_9_7
                   if
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 1032
                    call $async-throw-values/__Cps_catchAwaitString#set:state
                   else
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 1031
                    call $async-throw-values/__Cps_catchAwaitString#set:state
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
                  call $async-throw-values/__Cps_catchAwaitString#set:state
                  br $break|1
                 end
                 i32.const 0
                 call $async-throw-values/getChunk
                 drop
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1
                 call $async-throw-values/__Cps_catchAwaitString#set:state
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
                call $async-throw-values/__Cps_catchAwaitString#get:__pend0
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store offset=4
                local.get $2
                call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_throwVal_10_10
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 0
                call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_ret_0_0
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 0
                call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_brk_1_1
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 0
                call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_cnt_2_2
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_flag_9_7
                i32.eqz
                if
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
                 call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_throwVal_10_10
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store offset=4
                 local.get $2
                 call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_err_7_8
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
                 call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_throwVal_10_10
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store offset=4
                 local.get $2
                 call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_errVal_8_9
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1
                 call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_flag_9_7
                end
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_flag_9_7
                if (result i32)
                 i32.const 1
                else
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_ret_0_0
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
                 call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_brk_1_1
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
                 call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_cnt_2_2
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
                 call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_pendFail_5_5
                end
                if
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1030
                 call $async-throw-values/__Cps_catchAwaitString#set:state
                else
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1029
                 call $async-throw-values/__Cps_catchAwaitString#set:state
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
               call $async-throw-values/__Cps_catchAwaitString#set:state
               br $break|1
              end
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1025
              call $async-throw-values/__Cps_catchAwaitString#set:state
              br $break|1
             end
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_flag_9_7
             if
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1034
              call $async-throw-values/__Cps_catchAwaitString#set:state
             else
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1035
              call $async-throw-values/__Cps_catchAwaitString#set:state
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
            call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_flag_9_7
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
            call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_err_7_8
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=4
            local.get $2
            call $async-throw-values/__Cps_catchAwaitString#set:__cps_e_11
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_ret_0_0
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_brk_1_1
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_cnt_2_2
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 2560
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=12
            local.get $2
            call $async-throw-values/__Cps_catchAwaitString#get:__cps_e_11
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
            call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_retVal_6_6
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 1
            call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_ret_0_0
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 1031
            call $async-throw-values/__Cps_catchAwaitString#set:state
            br $break|1
           end
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 640
           call $async-throw-values/__Cps_catchAwaitString#set:__result
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const -1
           call $async-throw-values/__Cps_catchAwaitString#set:state
           global.get $async-throw-values/__async_roots_catchAwaitString
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           global.get $async-throw-values/__async_roots_catchAwaitString
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
           call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#indexOf
           i32.const 1
           call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#splice
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
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=8
          local.get $2
          call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_errVal_8_9
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-throw-values/__Cps_catchAwaitString#set:__errorValue
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
          call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_err_7_8
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-throw-values/__Cps_catchAwaitString#set:__error
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const -2
          call $async-throw-values/__Cps_catchAwaitString#set:state
          global.get $async-throw-values/__async_roots_catchAwaitString
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          global.get $async-throw-values/__async_roots_catchAwaitString
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
          call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#indexOf
          i32.const 1
          call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#splice
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
         call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_pendFail_5_5
         if
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1036
          call $async-throw-values/__Cps_catchAwaitString#set:state
         else
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1037
          call $async-throw-values/__Cps_catchAwaitString#set:state
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
        call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_pendFail_5_5
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
        call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_pendVal_4_4
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-throw-values/__Cps_catchAwaitString#set:__errorValue
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
        call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_pendErr_3_3
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-throw-values/__Cps_catchAwaitString#set:__error
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const -2
        call $async-throw-values/__Cps_catchAwaitString#set:state
        global.get $async-throw-values/__async_roots_catchAwaitString
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        global.get $async-throw-values/__async_roots_catchAwaitString
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
        call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#indexOf
        i32.const 1
        call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#splice
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
       call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_ret_0_0
       if
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1038
        call $async-throw-values/__Cps_catchAwaitString#set:state
       else
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1033
        call $async-throw-values/__Cps_catchAwaitString#set:state
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
      call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_ret_0_0
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
      call $async-throw-values/__Cps_catchAwaitString#get:__cps___async_try_retVal_6_6
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      local.get $2
      call $async-throw-values/__Cps_catchAwaitString#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_catchAwaitString#set:state
      global.get $async-throw-values/__async_roots_catchAwaitString
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_catchAwaitString
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
      call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#splice
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
     call $async-throw-values/__Cps_catchAwaitString#get:state
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
 (func $async-throw-values/catchAwaitString (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_catchAwaitString#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_catchAwaitString
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_catchAwaitString#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__Cps_nestedThrow#constructor (param $this i32) (result i32)
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
   i32.const 76
   i32.const 26
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
  call $async-throw-values/__Cps_nestedThrow#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_nestedThrow#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_nestedThrow#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_ret_0_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_brk_1_1
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_cnt_2_2
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_pendErr_3_3
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_pendVal_4_4
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_pendFail_5_5
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_retVal_6_6
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_9_7
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_err_7_8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_errVal_8_9
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_12_10
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_err_10_11
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_errVal_11_12
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_throwVal_13_13
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_nestedThrow#set:__cps_e_14
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_throwVal_14_15
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_nestedThrow#set:__cps_e_16
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#constructor (param $this i32) (param $length i32) (result i32)
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
   i32.const 27
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:length_
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
  i32.const 27
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_nestedThrow#step (param $this i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  loop $while-continue|0
   i32.const 1
   if
    block $break|1
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
                               block $case0|1
                                local.get $this
                                local.set $2
                                global.get $~lib/memory/__stack_pointer
                                local.get $2
                                i32.store
                                local.get $2
                                call $async-throw-values/__Cps_nestedThrow#get:state
                                local.set $1
                                local.get $1
                                i32.const 0
                                i32.eq
                                br_if $case0|1
                                local.get $1
                                i32.const 1024
                                i32.eq
                                br_if $case1|1
                                local.get $1
                                i32.const 1025
                                i32.eq
                                br_if $case2|1
                                local.get $1
                                i32.const 1026
                                i32.eq
                                br_if $case3|1
                                local.get $1
                                i32.const 1027
                                i32.eq
                                br_if $case4|1
                                local.get $1
                                i32.const 1028
                                i32.eq
                                br_if $case5|1
                                local.get $1
                                i32.const 1029
                                i32.eq
                                br_if $case6|1
                                local.get $1
                                i32.const 1030
                                i32.eq
                                br_if $case7|1
                                local.get $1
                                i32.const 1031
                                i32.eq
                                br_if $case8|1
                                local.get $1
                                i32.const 1032
                                i32.eq
                                br_if $case9|1
                                local.get $1
                                i32.const 1033
                                i32.eq
                                br_if $case10|1
                                local.get $1
                                i32.const 1034
                                i32.eq
                                br_if $case11|1
                                local.get $1
                                i32.const 1035
                                i32.eq
                                br_if $case12|1
                                local.get $1
                                i32.const 1036
                                i32.eq
                                br_if $case13|1
                                local.get $1
                                i32.const 1037
                                i32.eq
                                br_if $case14|1
                                local.get $1
                                i32.const 1038
                                i32.eq
                                br_if $case15|1
                                local.get $1
                                i32.const 1039
                                i32.eq
                                br_if $case16|1
                                local.get $1
                                i32.const 1040
                                i32.eq
                                br_if $case17|1
                                local.get $1
                                i32.const 1041
                                i32.eq
                                br_if $case18|1
                                local.get $1
                                i32.const 1042
                                i32.eq
                                br_if $case19|1
                                local.get $1
                                i32.const 1043
                                i32.eq
                                br_if $case20|1
                                local.get $1
                                i32.const 1044
                                i32.eq
                                br_if $case21|1
                                local.get $1
                                i32.const 1045
                                i32.eq
                                br_if $case22|1
                                local.get $1
                                i32.const 1046
                                i32.eq
                                br_if $case23|1
                                local.get $1
                                i32.const 1047
                                i32.eq
                                br_if $case24|1
                                local.get $1
                                i32.const 1048
                                i32.eq
                                br_if $case25|1
                                br $case26|1
                               end
                               local.get $this
                               local.set $2
                               global.get $~lib/memory/__stack_pointer
                               local.get $2
                               i32.store
                               local.get $2
                               i32.const 1024
                               call $async-throw-values/__Cps_nestedThrow#set:state
                               br $break|1
                              end
                              local.get $this
                              local.set $2
                              global.get $~lib/memory/__stack_pointer
                              local.get $2
                              i32.store
                              local.get $2
                              i32.const 0
                              call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_ret_0_0
                              local.get $this
                              local.set $2
                              global.get $~lib/memory/__stack_pointer
                              local.get $2
                              i32.store
                              local.get $2
                              i32.const 0
                              call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_brk_1_1
                              local.get $this
                              local.set $2
                              global.get $~lib/memory/__stack_pointer
                              local.get $2
                              i32.store
                              local.get $2
                              i32.const 0
                              call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_cnt_2_2
                              local.get $this
                              local.set $2
                              global.get $~lib/memory/__stack_pointer
                              local.get $2
                              i32.store
                              local.get $2
                              i32.const 432
                              call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_pendErr_3_3
                              local.get $this
                              local.set $2
                              global.get $~lib/memory/__stack_pointer
                              local.get $2
                              i32.store
                              local.get $2
                              i32.const 0
                              call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_pendFail_5_5
                              local.get $this
                              local.set $2
                              global.get $~lib/memory/__stack_pointer
                              local.get $2
                              i32.store
                              local.get $2
                              i32.const 0
                              call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_9_7
                              local.get $this
                              local.set $2
                              global.get $~lib/memory/__stack_pointer
                              local.get $2
                              i32.store
                              local.get $2
                              i32.const 432
                              call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_err_7_8
                              local.get $this
                              local.set $2
                              global.get $~lib/memory/__stack_pointer
                              local.get $2
                              i32.store
                              local.get $2
                              i32.const 1026
                              call $async-throw-values/__Cps_nestedThrow#set:state
                              br $break|1
                             end
                             local.get $this
                             local.set $2
                             global.get $~lib/memory/__stack_pointer
                             local.get $2
                             i32.store
                             local.get $2
                             call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_flag_9_7
                             if
                              local.get $this
                              local.set $2
                              global.get $~lib/memory/__stack_pointer
                              local.get $2
                              i32.store
                              local.get $2
                              i32.const 1042
                              call $async-throw-values/__Cps_nestedThrow#set:state
                             else
                              local.get $this
                              local.set $2
                              global.get $~lib/memory/__stack_pointer
                              local.get $2
                              i32.store
                              local.get $2
                              i32.const 1041
                              call $async-throw-values/__Cps_nestedThrow#set:state
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
                            call $async-throw-values/__Cps_nestedThrow#set:state
                            br $break|1
                           end
                           local.get $this
                           local.set $2
                           global.get $~lib/memory/__stack_pointer
                           local.get $2
                           i32.store
                           local.get $2
                           i32.const 0
                           call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_12_10
                           local.get $this
                           local.set $2
                           global.get $~lib/memory/__stack_pointer
                           local.get $2
                           i32.store
                           local.get $2
                           i32.const 432
                           call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_err_10_11
                           local.get $this
                           local.set $2
                           global.get $~lib/memory/__stack_pointer
                           local.get $2
                           i32.store
                           local.get $2
                           i32.const 1029
                           call $async-throw-values/__Cps_nestedThrow#set:state
                           br $break|1
                          end
                          local.get $this
                          local.set $2
                          global.get $~lib/memory/__stack_pointer
                          local.get $2
                          i32.store
                          local.get $2
                          call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_flag_12_10
                          if
                           local.get $this
                           local.set $2
                           global.get $~lib/memory/__stack_pointer
                           local.get $2
                           i32.store
                           local.get $2
                           i32.const 1034
                           call $async-throw-values/__Cps_nestedThrow#set:state
                          else
                           local.get $this
                           local.set $2
                           global.get $~lib/memory/__stack_pointer
                           local.get $2
                           i32.store
                           local.get $2
                           i32.const 1033
                           call $async-throw-values/__Cps_nestedThrow#set:state
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
                         i32.const 1030
                         call $async-throw-values/__Cps_nestedThrow#set:state
                         br $break|1
                        end
                        local.get $this
                        local.set $2
                        global.get $~lib/memory/__stack_pointer
                        local.get $2
                        i32.store
                        local.get $2
                        i32.const 0
                        i32.const 2608
                        call $~lib/error/Error#constructor
                        local.set $2
                        global.get $~lib/memory/__stack_pointer
                        local.get $2
                        i32.store offset=4
                        local.get $2
                        call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_throwVal_13_13
                        local.get $this
                        local.set $2
                        global.get $~lib/memory/__stack_pointer
                        local.get $2
                        i32.store
                        local.get $2
                        i32.const 0
                        call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_ret_0_0
                        local.get $this
                        local.set $2
                        global.get $~lib/memory/__stack_pointer
                        local.get $2
                        i32.store
                        local.get $2
                        i32.const 0
                        call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_brk_1_1
                        local.get $this
                        local.set $2
                        global.get $~lib/memory/__stack_pointer
                        local.get $2
                        i32.store
                        local.get $2
                        i32.const 0
                        call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_cnt_2_2
                        local.get $this
                        local.set $2
                        global.get $~lib/memory/__stack_pointer
                        local.get $2
                        i32.store
                        local.get $2
                        call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_flag_12_10
                        i32.eqz
                        if
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
                         i32.store offset=12
                         local.get $2
                         call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_throwVal_13_13
                         local.set $2
                         global.get $~lib/memory/__stack_pointer
                         local.get $2
                         i32.store offset=8
                         local.get $2
                         call $~lib/error/Error#get:message
                         local.set $2
                         global.get $~lib/memory/__stack_pointer
                         local.get $2
                         i32.store offset=4
                         local.get $2
                         call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_err_10_11
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
                         call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_throwVal_13_13
                         local.set $2
                         global.get $~lib/memory/__stack_pointer
                         local.get $2
                         i32.store offset=4
                         local.get $2
                         call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_errVal_11_12
                         local.get $this
                         local.set $2
                         global.get $~lib/memory/__stack_pointer
                         local.get $2
                         i32.store
                         local.get $2
                         i32.const 1
                         call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_12_10
                        end
                        local.get $this
                        local.set $2
                        global.get $~lib/memory/__stack_pointer
                        local.get $2
                        i32.store
                        local.get $2
                        call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_flag_12_10
                        if (result i32)
                         i32.const 1
                        else
                         local.get $this
                         local.set $2
                         global.get $~lib/memory/__stack_pointer
                         local.get $2
                         i32.store
                         local.get $2
                         call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_ret_0_0
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
                         call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_brk_1_1
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
                         call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_cnt_2_2
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
                         call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendFail_5_5
                        end
                        if
                         local.get $this
                         local.set $2
                         global.get $~lib/memory/__stack_pointer
                         local.get $2
                         i32.store
                         local.get $2
                         i32.const 1032
                         call $async-throw-values/__Cps_nestedThrow#set:state
                        else
                         local.get $this
                         local.set $2
                         global.get $~lib/memory/__stack_pointer
                         local.get $2
                         i32.store
                         local.get $2
                         i32.const 1031
                         call $async-throw-values/__Cps_nestedThrow#set:state
                        end
                        br $break|1
                       end
                       local.get $this
                       local.set $2
                       global.get $~lib/memory/__stack_pointer
                       local.get $2
                       i32.store
                       local.get $2
                       i32.const 1028
                       call $async-throw-values/__Cps_nestedThrow#set:state
                       br $break|1
                      end
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 1028
                      call $async-throw-values/__Cps_nestedThrow#set:state
                      br $break|1
                     end
                     local.get $this
                     local.set $2
                     global.get $~lib/memory/__stack_pointer
                     local.get $2
                     i32.store
                     local.get $2
                     call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_flag_12_10
                     if
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 1036
                      call $async-throw-values/__Cps_nestedThrow#set:state
                     else
                      local.get $this
                      local.set $2
                      global.get $~lib/memory/__stack_pointer
                      local.get $2
                      i32.store
                      local.get $2
                      i32.const 1037
                      call $async-throw-values/__Cps_nestedThrow#set:state
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
                    call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_12_10
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
                    call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_err_10_11
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store offset=4
                    local.get $2
                    call $async-throw-values/__Cps_nestedThrow#set:__cps_e_14
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 0
                    i32.const 2656
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store offset=16
                    local.get $2
                    call $async-throw-values/__Cps_nestedThrow#get:__cps_e_14
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store offset=12
                    local.get $2
                    call $~lib/string/String.__concat
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store offset=8
                    local.get $2
                    call $~lib/error/Error#constructor
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store offset=4
                    local.get $2
                    call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_throwVal_14_15
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 0
                    call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_ret_0_0
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 0
                    call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_brk_1_1
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 0
                    call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_cnt_2_2
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_flag_9_7
                    i32.eqz
                    if
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
                     i32.store offset=12
                     local.get $2
                     call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_throwVal_14_15
                     local.set $2
                     global.get $~lib/memory/__stack_pointer
                     local.get $2
                     i32.store offset=8
                     local.get $2
                     call $~lib/error/Error#get:message
                     local.set $2
                     global.get $~lib/memory/__stack_pointer
                     local.get $2
                     i32.store offset=4
                     local.get $2
                     call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_err_7_8
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
                     call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_throwVal_14_15
                     local.set $2
                     global.get $~lib/memory/__stack_pointer
                     local.get $2
                     i32.store offset=4
                     local.get $2
                     call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_errVal_8_9
                     local.get $this
                     local.set $2
                     global.get $~lib/memory/__stack_pointer
                     local.get $2
                     i32.store
                     local.get $2
                     i32.const 1
                     call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_9_7
                    end
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 1033
                    call $async-throw-values/__Cps_nestedThrow#set:state
                    br $break|1
                   end
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_flag_9_7
                   if (result i32)
                    i32.const 1
                   else
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_ret_0_0
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
                    call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_brk_1_1
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
                    call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_cnt_2_2
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
                    call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendFail_5_5
                   end
                   if
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 1040
                    call $async-throw-values/__Cps_nestedThrow#set:state
                   else
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 1039
                    call $async-throw-values/__Cps_nestedThrow#set:state
                   end
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
                  call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_err_10_11
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store offset=4
                  local.get $2
                  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_err_7_8
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
                  call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_errVal_11_12
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store offset=4
                  local.get $2
                  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_errVal_8_9
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  i32.const 1
                  call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_9_7
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  i32.const 1035
                  call $async-throw-values/__Cps_nestedThrow#set:state
                  br $break|1
                 end
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendFail_5_5
                 if
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  i32.const 1038
                  call $async-throw-values/__Cps_nestedThrow#set:state
                 else
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  i32.const 1035
                  call $async-throw-values/__Cps_nestedThrow#set:state
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
                call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_pendFail_5_5
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
                call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendErr_3_3
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store offset=4
                local.get $2
                call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_err_7_8
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
                call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendVal_4_4
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store offset=4
                local.get $2
                call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_errVal_8_9
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 1
                call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_9_7
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 1035
                call $async-throw-values/__Cps_nestedThrow#set:state
                br $break|1
               end
               local.get $this
               local.set $2
               global.get $~lib/memory/__stack_pointer
               local.get $2
               i32.store
               local.get $2
               i32.const 1025
               call $async-throw-values/__Cps_nestedThrow#set:state
               br $break|1
              end
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1025
              call $async-throw-values/__Cps_nestedThrow#set:state
              br $break|1
             end
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_flag_9_7
             if
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1044
              call $async-throw-values/__Cps_nestedThrow#set:state
             else
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1045
              call $async-throw-values/__Cps_nestedThrow#set:state
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
            call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_flag_9_7
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
            call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_err_7_8
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=4
            local.get $2
            call $async-throw-values/__Cps_nestedThrow#set:__cps_e_16
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_ret_0_0
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_brk_1_1
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_cnt_2_2
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 2688
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=12
            local.get $2
            call $async-throw-values/__Cps_nestedThrow#get:__cps_e_16
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
            call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_retVal_6_6
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 1
            call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_ret_0_0
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 1041
            call $async-throw-values/__Cps_nestedThrow#set:state
            br $break|1
           end
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 640
           call $async-throw-values/__Cps_nestedThrow#set:__result
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const -1
           call $async-throw-values/__Cps_nestedThrow#set:state
           global.get $async-throw-values/__async_roots_nestedThrow
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           global.get $async-throw-values/__async_roots_nestedThrow
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
           call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#indexOf
           i32.const 1
           call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#splice
           drop
           i32.const 1
           local.set $2
           global.get $~lib/memory/__stack_pointer
           i32.const 20
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
          call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_errVal_8_9
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-throw-values/__Cps_nestedThrow#set:__errorValue
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
          call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_err_7_8
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-throw-values/__Cps_nestedThrow#set:__error
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const -2
          call $async-throw-values/__Cps_nestedThrow#set:state
          global.get $async-throw-values/__async_roots_nestedThrow
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          global.get $async-throw-values/__async_roots_nestedThrow
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
          call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#indexOf
          i32.const 1
          call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#splice
          drop
          i32.const 2
          local.set $2
          global.get $~lib/memory/__stack_pointer
          i32.const 20
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
         call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendFail_5_5
         if
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1046
          call $async-throw-values/__Cps_nestedThrow#set:state
         else
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1047
          call $async-throw-values/__Cps_nestedThrow#set:state
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
        call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_pendFail_5_5
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
        call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendVal_4_4
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-throw-values/__Cps_nestedThrow#set:__errorValue
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
        call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_pendErr_3_3
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-throw-values/__Cps_nestedThrow#set:__error
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const -2
        call $async-throw-values/__Cps_nestedThrow#set:state
        global.get $async-throw-values/__async_roots_nestedThrow
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        global.get $async-throw-values/__async_roots_nestedThrow
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
        call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#indexOf
        i32.const 1
        call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#splice
        drop
        i32.const 2
        local.set $2
        global.get $~lib/memory/__stack_pointer
        i32.const 20
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
       call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_ret_0_0
       if
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1048
        call $async-throw-values/__Cps_nestedThrow#set:state
       else
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1043
        call $async-throw-values/__Cps_nestedThrow#set:state
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
      call $async-throw-values/__Cps_nestedThrow#set:__cps___async_try_ret_0_0
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
      call $async-throw-values/__Cps_nestedThrow#get:__cps___async_try_retVal_6_6
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=4
      local.get $2
      call $async-throw-values/__Cps_nestedThrow#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_nestedThrow#set:state
      global.get $async-throw-values/__async_roots_nestedThrow
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_nestedThrow
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
      call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#splice
      drop
      i32.const 1
      local.set $2
      global.get $~lib/memory/__stack_pointer
      i32.const 20
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
     call $async-throw-values/__Cps_nestedThrow#get:state
     i32.const -1
     i32.eq
     if (result i32)
      i32.const 1
     else
      i32.const 2
     end
     local.set $2
     global.get $~lib/memory/__stack_pointer
     i32.const 20
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
 (func $async-throw-values/nestedThrow (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_nestedThrow#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_nestedThrow
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_nestedThrow#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__Cps_throwInCatch#constructor (param $this i32) (result i32)
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
   i32.const 52
   i32.const 28
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
  call $async-throw-values/__Cps_throwInCatch#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwInCatch#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwInCatch#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwInCatch#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_ret_0_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_brk_1_1
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_cnt_2_2
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendErr_3_3
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendVal_4_4
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendFail_5_5
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_flag_8_6
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_err_6_7
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_errVal_7_8
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_throwVal_9_9
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwInCatch#set:__cps_e_10
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_throwVal_10_11
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#constructor (param $this i32) (param $length i32) (result i32)
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
   i32.const 29
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:length_
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
  i32.const 29
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_throwInCatch#step (param $this i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  loop $while-continue|0
   i32.const 1
   if
    block $break|1
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
                     call $async-throw-values/__Cps_throwInCatch#get:state
                     local.set $1
                     local.get $1
                     i32.const 0
                     i32.eq
                     br_if $case0|1
                     local.get $1
                     i32.const 1024
                     i32.eq
                     br_if $case1|1
                     local.get $1
                     i32.const 1025
                     i32.eq
                     br_if $case2|1
                     local.get $1
                     i32.const 1026
                     i32.eq
                     br_if $case3|1
                     local.get $1
                     i32.const 1027
                     i32.eq
                     br_if $case4|1
                     local.get $1
                     i32.const 1028
                     i32.eq
                     br_if $case5|1
                     local.get $1
                     i32.const 1029
                     i32.eq
                     br_if $case6|1
                     local.get $1
                     i32.const 1030
                     i32.eq
                     br_if $case7|1
                     local.get $1
                     i32.const 1031
                     i32.eq
                     br_if $case8|1
                     local.get $1
                     i32.const 1032
                     i32.eq
                     br_if $case9|1
                     local.get $1
                     i32.const 1033
                     i32.eq
                     br_if $case10|1
                     local.get $1
                     i32.const 1034
                     i32.eq
                     br_if $case11|1
                     local.get $1
                     i32.const 1035
                     i32.eq
                     br_if $case12|1
                     local.get $1
                     i32.const 1036
                     i32.eq
                     br_if $case13|1
                     local.get $1
                     i32.const 1037
                     i32.eq
                     br_if $case14|1
                     br $case15|1
                    end
                    local.get $this
                    local.set $2
                    global.get $~lib/memory/__stack_pointer
                    local.get $2
                    i32.store
                    local.get $2
                    i32.const 1024
                    call $async-throw-values/__Cps_throwInCatch#set:state
                    br $break|1
                   end
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_ret_0_0
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_brk_1_1
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_cnt_2_2
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 432
                   call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendErr_3_3
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendFail_5_5
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 0
                   call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_flag_8_6
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 432
                   call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_err_6_7
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1026
                   call $async-throw-values/__Cps_throwInCatch#set:state
                   br $break|1
                  end
                  local.get $this
                  local.set $2
                  global.get $~lib/memory/__stack_pointer
                  local.get $2
                  i32.store
                  local.get $2
                  call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_flag_8_6
                  if
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1031
                   call $async-throw-values/__Cps_throwInCatch#set:state
                  else
                   local.get $this
                   local.set $2
                   global.get $~lib/memory/__stack_pointer
                   local.get $2
                   i32.store
                   local.get $2
                   i32.const 1030
                   call $async-throw-values/__Cps_throwInCatch#set:state
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
                 call $async-throw-values/__Cps_throwInCatch#set:state
                 br $break|1
                end
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 2720
                call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_throwVal_9_9
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 0
                call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_ret_0_0
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 0
                call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_brk_1_1
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                i32.const 0
                call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_cnt_2_2
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_flag_8_6
                i32.eqz
                if
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
                 call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_throwVal_9_9
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store offset=4
                 local.get $2
                 call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_err_6_7
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
                 call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_throwVal_9_9
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store offset=4
                 local.get $2
                 call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_errVal_7_8
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1
                 call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_flag_8_6
                end
                local.get $this
                local.set $2
                global.get $~lib/memory/__stack_pointer
                local.get $2
                i32.store
                local.get $2
                call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_flag_8_6
                if (result i32)
                 i32.const 1
                else
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_ret_0_0
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
                 call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_brk_1_1
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
                 call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_cnt_2_2
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
                 call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_pendFail_5_5
                end
                if
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1029
                 call $async-throw-values/__Cps_throwInCatch#set:state
                else
                 local.get $this
                 local.set $2
                 global.get $~lib/memory/__stack_pointer
                 local.get $2
                 i32.store
                 local.get $2
                 i32.const 1028
                 call $async-throw-values/__Cps_throwInCatch#set:state
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
               call $async-throw-values/__Cps_throwInCatch#set:state
               br $break|1
              end
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1025
              call $async-throw-values/__Cps_throwInCatch#set:state
              br $break|1
             end
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_flag_8_6
             if
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1033
              call $async-throw-values/__Cps_throwInCatch#set:state
             else
              local.get $this
              local.set $2
              global.get $~lib/memory/__stack_pointer
              local.get $2
              i32.store
              local.get $2
              i32.const 1034
              call $async-throw-values/__Cps_throwInCatch#set:state
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
            call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_flag_8_6
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
            call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_err_6_7
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=4
            local.get $2
            call $async-throw-values/__Cps_throwInCatch#set:__cps_e_10
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            i32.const 2752
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=16
            local.get $2
            call $async-throw-values/__Cps_throwInCatch#get:__cps_e_10
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=12
            local.get $2
            call $~lib/string/String.__concat
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=8
            local.get $2
            call $~lib/error/Error#constructor
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store offset=4
            local.get $2
            call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_throwVal_10_11
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_ret_0_0
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_brk_1_1
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 0
            call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_cnt_2_2
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_pendFail_5_5
            i32.eqz
            if
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
             i32.store offset=12
             local.get $2
             call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_throwVal_10_11
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store offset=8
             local.get $2
             call $~lib/error/Error#get:message
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store offset=4
             local.get $2
             call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendErr_3_3
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
             call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_throwVal_10_11
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store offset=4
             local.get $2
             call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendVal_4_4
             local.get $this
             local.set $2
             global.get $~lib/memory/__stack_pointer
             local.get $2
             i32.store
             local.get $2
             i32.const 1
             call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendFail_5_5
            end
            local.get $this
            local.set $2
            global.get $~lib/memory/__stack_pointer
            local.get $2
            i32.store
            local.get $2
            i32.const 1030
            call $async-throw-values/__Cps_throwInCatch#set:state
            br $break|1
           end
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const 640
           call $async-throw-values/__Cps_throwInCatch#set:__result
           local.get $this
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           i32.const -1
           call $async-throw-values/__Cps_throwInCatch#set:state
           global.get $async-throw-values/__async_roots_throwInCatch
           local.set $2
           global.get $~lib/memory/__stack_pointer
           local.get $2
           i32.store
           local.get $2
           global.get $async-throw-values/__async_roots_throwInCatch
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
           call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#indexOf
           i32.const 1
           call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#splice
           drop
           i32.const 1
           local.set $2
           global.get $~lib/memory/__stack_pointer
           i32.const 20
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
          call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_errVal_7_8
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-throw-values/__Cps_throwInCatch#set:__errorValue
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
          call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_err_6_7
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store offset=4
          local.get $2
          call $async-throw-values/__Cps_throwInCatch#set:__error
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const -2
          call $async-throw-values/__Cps_throwInCatch#set:state
          global.get $async-throw-values/__async_roots_throwInCatch
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          global.get $async-throw-values/__async_roots_throwInCatch
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
          call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#indexOf
          i32.const 1
          call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#splice
          drop
          i32.const 2
          local.set $2
          global.get $~lib/memory/__stack_pointer
          i32.const 20
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
         call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_pendFail_5_5
         if
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1035
          call $async-throw-values/__Cps_throwInCatch#set:state
         else
          local.get $this
          local.set $2
          global.get $~lib/memory/__stack_pointer
          local.get $2
          i32.store
          local.get $2
          i32.const 1036
          call $async-throw-values/__Cps_throwInCatch#set:state
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
        call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_pendFail_5_5
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
        call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_pendVal_4_4
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-throw-values/__Cps_throwInCatch#set:__errorValue
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
        call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_pendErr_3_3
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        local.get $2
        call $async-throw-values/__Cps_throwInCatch#set:__error
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const -2
        call $async-throw-values/__Cps_throwInCatch#set:state
        global.get $async-throw-values/__async_roots_throwInCatch
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        global.get $async-throw-values/__async_roots_throwInCatch
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
        call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#indexOf
        i32.const 1
        call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#splice
        drop
        i32.const 2
        local.set $2
        global.get $~lib/memory/__stack_pointer
        i32.const 20
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
       call $async-throw-values/__Cps_throwInCatch#get:__cps___async_try_ret_0_0
       if
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1037
        call $async-throw-values/__Cps_throwInCatch#set:state
       else
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1032
        call $async-throw-values/__Cps_throwInCatch#set:state
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
      call $async-throw-values/__Cps_throwInCatch#set:__cps___async_try_ret_0_0
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_throwInCatch#set:state
      global.get $async-throw-values/__async_roots_throwInCatch
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_throwInCatch
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
      call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#splice
      drop
      i32.const 1
      local.set $2
      global.get $~lib/memory/__stack_pointer
      i32.const 20
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
     call $async-throw-values/__Cps_throwInCatch#get:state
     i32.const -1
     i32.eq
     if (result i32)
      i32.const 1
     else
      i32.const 2
     end
     local.set $2
     global.get $~lib/memory/__stack_pointer
     i32.const 20
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
 (func $async-throw-values/throwInCatch (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_throwInCatch#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_throwInCatch
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_throwInCatch#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__Cps_throwBox#constructor (param $this i32) (result i32)
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
   i32.const 24
   i32.const 30
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
  call $async-throw-values/__Cps_throwBox#set:state
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwBox#set:__result
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 432
  call $async-throw-values/__Cps_throwBox#set:__error
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwBox#set:__errorValue
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwBox#set:__cps_b_0
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $async-throw-values/__Cps_throwBox#set:__cps___async_try_throwVal_0_1
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#constructor (param $this i32) (param $length i32) (result i32)
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
   i32.const 31
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:buffer
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $buffer
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:dataStart
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $bufferSize
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:byteLength
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  local.get $6
  local.get $length
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:length_
  local.get $this
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#push (param $this i32) (param $value i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:length_
  local.get $len
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
  return
 )
 (func $async-throw-values/Box#constructor (param $this i32) (result i32)
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
   i32.const 4
   i32.const 8
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
  i32.const 7
  call $async-throw-values/Box#set:v
  local.get $this
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#indexOf (param $this i32) (param $value i32) (param $fromIndex i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:dataStart
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#splice (param $this i32) (param $start i32) (param $deleteCount i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:length_
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
  i32.const 31
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:dataStart
  local.set $resultStart
  local.get $this
  local.set $17
  global.get $~lib/memory/__stack_pointer
  local.get $17
  i32.store
  local.get $17
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:dataStart
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#set:length_
  local.get $result
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $17
  return
 )
 (func $async-throw-values/__Cps_throwBox#step (param $this i32) (result i32)
  (local $1 i32)
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
  loop $while-continue|0
   i32.const 1
   if
    block $break|1
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
         call $async-throw-values/__Cps_throwBox#get:state
         local.set $1
         local.get $1
         i32.const 0
         i32.eq
         br_if $case0|1
         local.get $1
         i32.const 1024
         i32.eq
         br_if $case1|1
         local.get $1
         i32.const 1025
         i32.eq
         br_if $case2|1
         br $case3|1
        end
        local.get $this
        local.set $2
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store
        local.get $2
        i32.const 1024
        call $async-throw-values/__Cps_throwBox#set:state
        br $break|1
       end
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const 0
       call $async-throw-values/Box#constructor
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwBox#set:__cps_b_0
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwBox#get:__cps_b_0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const 21
       call $async-throw-values/Box#set:v
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
       call $async-throw-values/__Cps_throwBox#get:__cps_b_0
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwBox#set:__cps___async_try_throwVal_0_1
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
       call $async-throw-values/__Cps_throwBox#get:__cps___async_try_throwVal_0_1
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=4
       local.get $2
       call $async-throw-values/__Cps_throwBox#set:__errorValue
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const 432
       call $async-throw-values/__Cps_throwBox#set:__error
       local.get $this
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       i32.const -2
       call $async-throw-values/__Cps_throwBox#set:state
       global.get $async-throw-values/__async_roots_throwBox
       local.set $2
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       local.get $2
       global.get $async-throw-values/__async_roots_throwBox
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
       call $~lib/array/Array<async-throw-values/__Cps_throwBox>#indexOf
       i32.const 1
       call $~lib/array/Array<async-throw-values/__Cps_throwBox>#splice
       drop
       i32.const 2
       local.set $2
       global.get $~lib/memory/__stack_pointer
       i32.const 12
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
      i32.const 640
      call $async-throw-values/__Cps_throwBox#set:__result
      local.get $this
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const -1
      call $async-throw-values/__Cps_throwBox#set:state
      global.get $async-throw-values/__async_roots_throwBox
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      global.get $async-throw-values/__async_roots_throwBox
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
      call $~lib/array/Array<async-throw-values/__Cps_throwBox>#indexOf
      i32.const 1
      call $~lib/array/Array<async-throw-values/__Cps_throwBox>#splice
      drop
      i32.const 1
      local.set $2
      global.get $~lib/memory/__stack_pointer
      i32.const 12
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
     call $async-throw-values/__Cps_throwBox#get:state
     i32.const -1
     i32.eq
     if (result i32)
      i32.const 1
     else
      i32.const 2
     end
     local.set $2
     global.get $~lib/memory/__stack_pointer
     i32.const 12
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
 (func $async-throw-values/throwBox (result i32)
  (local $__st i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $async-throw-values/__Cps_throwBox#constructor
  local.tee $__st
  i32.store
  global.get $async-throw-values/__async_roots_throwBox
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#push
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $async-throw-values/__Cps_throwBox#step
  drop
  local.get $__st
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/errMessage (param $e i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $e
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/error/Error#get:message
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/boxValue (param $b i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $b
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $async-throw-values/Box#get:v
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
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
   i32.const 2976
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_throwError_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_throwError
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:length
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
  global.get $async-throw-values/__async_roots_throwError
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_throwError
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwError_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwError#get:state
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
  call $async-throw-values/__Cps_throwError#set:state
  global.get $async-throw-values/__async_roots_throwError
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_throwError
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#splice
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
 (func $async-throw-values/__async_async_throw_values_throwError_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwError#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwError_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwError#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwError_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwError#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwError_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwError#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_throwString_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_throwString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:length
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
  global.get $async-throw-values/__async_roots_throwString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_throwString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwString_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwString#get:state
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
  call $async-throw-values/__Cps_throwString#set:state
  global.get $async-throw-values/__async_roots_throwString
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_throwString
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#splice
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
 (func $async-throw-values/__async_async_throw_values_throwString_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwString#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwString_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwString#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwString_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwString#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwString_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwString#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_throwNumber_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_throwNumber
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:length
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
  global.get $async-throw-values/__async_roots_throwNumber
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_throwNumber
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwNumber_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwNumber#get:state
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
  call $async-throw-values/__Cps_throwNumber#set:state
  global.get $async-throw-values/__async_roots_throwNumber
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_throwNumber
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#splice
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
 (func $async-throw-values/__async_async_throw_values_throwNumber_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwNumber#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwNumber_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwNumber#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwNumber_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwNumber#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwNumber_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwNumber#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_catchError_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_catchError
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:length
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
  global.get $async-throw-values/__async_roots_catchError
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_catchError
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_catchError_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_catchError#get:state
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
  call $async-throw-values/__Cps_catchError#set:state
  global.get $async-throw-values/__async_roots_catchError
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_catchError
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#splice
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
 (func $async-throw-values/__async_async_throw_values_catchError_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_catchError#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_catchError_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_catchError#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_catchError_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_catchError#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_catchError_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_catchError#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_throwAwaitString_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_throwAwaitString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:length
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
  global.get $async-throw-values/__async_roots_throwAwaitString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_throwAwaitString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitString_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitString#get:state
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
  call $async-throw-values/__Cps_throwAwaitString#set:state
  global.get $async-throw-values/__async_roots_throwAwaitString
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_throwAwaitString
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#splice
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
 (func $async-throw-values/__async_async_throw_values_throwAwaitString_resume_0 (param $state i32) (param $value i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitString#set:__pend0
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $async-throw-values/__Cps_throwAwaitString#step
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitString_reject_0 (param $state i32) (param $message i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitString#set:__error
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const -2
  call $async-throw-values/__Cps_throwAwaitString#set:state
  global.get $async-throw-values/__async_roots_throwAwaitString
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  global.get $async-throw-values/__async_roots_throwAwaitString
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#splice
  drop
  i32.const 2
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitString_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitString#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitString_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitString#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitString_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitString#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitString_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitString#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_throwAwaitError_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_throwAwaitError
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:length
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
  global.get $async-throw-values/__async_roots_throwAwaitError
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_throwAwaitError
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitError_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitError#get:state
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
  call $async-throw-values/__Cps_throwAwaitError#set:state
  global.get $async-throw-values/__async_roots_throwAwaitError
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_throwAwaitError
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#splice
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
 (func $async-throw-values/__async_async_throw_values_throwAwaitError_resume_0 (param $state i32) (param $value i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitError#set:__pend0
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $async-throw-values/__Cps_throwAwaitError#step
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitError_reject_0 (param $state i32) (param $message i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitError#set:__error
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const -2
  call $async-throw-values/__Cps_throwAwaitError#set:state
  global.get $async-throw-values/__async_roots_throwAwaitError
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  global.get $async-throw-values/__async_roots_throwAwaitError
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#splice
  drop
  i32.const 2
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitError_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitError#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitError_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitError#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitError_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitError#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitError_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitError#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_throwAwaitNumber_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_throwAwaitNumber
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:length
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
  global.get $async-throw-values/__async_roots_throwAwaitNumber
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_throwAwaitNumber
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitNumber_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitNumber#get:state
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
  call $async-throw-values/__Cps_throwAwaitNumber#set:state
  global.get $async-throw-values/__async_roots_throwAwaitNumber
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_throwAwaitNumber
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#splice
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
 (func $async-throw-values/__async_async_throw_values_throwAwaitNumber_resume_0 (param $state i32) (param $value i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $value
  call $async-throw-values/__Cps_throwAwaitNumber#set:__pend0
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $async-throw-values/__Cps_throwAwaitNumber#step
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitNumber_reject_0 (param $state i32) (param $message i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitNumber#set:__error
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.const -2
  call $async-throw-values/__Cps_throwAwaitNumber#set:state
  global.get $async-throw-values/__async_roots_throwAwaitNumber
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  global.get $async-throw-values/__async_roots_throwAwaitNumber
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  i32.const 0
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#splice
  drop
  i32.const 2
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitNumber_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitNumber#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitNumber_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitNumber#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitNumber_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitNumber#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwAwaitNumber_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwAwaitNumber#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_catchAwaitString_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_catchAwaitString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:length
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
  global.get $async-throw-values/__async_roots_catchAwaitString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_catchAwaitString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_catchAwaitString_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_catchAwaitString#get:state
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
  call $async-throw-values/__Cps_catchAwaitString#set:state
  global.get $async-throw-values/__async_roots_catchAwaitString
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_catchAwaitString
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#splice
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
 (func $async-throw-values/__async_async_throw_values_catchAwaitString_resume_0 (param $state i32) (param $value i32) (result i32)
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
  call $async-throw-values/__Cps_catchAwaitString#set:__pend0
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $async-throw-values/__Cps_catchAwaitString#step
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-throw-values/__async_async_throw_values_catchAwaitString_reject_0 (param $state i32) (param $message i32) (result i32)
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
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_flag_9_7
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
  call $async-throw-values/__Cps_catchAwaitString#set:__cps___async_try_err_7_8
  local.get $state
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $async-throw-values/__Cps_catchAwaitString#step
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  return
 )
 (func $async-throw-values/__async_async_throw_values_catchAwaitString_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_catchAwaitString#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_catchAwaitString_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_catchAwaitString#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_catchAwaitString_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_catchAwaitString#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_catchAwaitString_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_catchAwaitString#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_nestedThrow_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_nestedThrow
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:length
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
  global.get $async-throw-values/__async_roots_nestedThrow
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_nestedThrow
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_nestedThrow_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_nestedThrow#get:state
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
  call $async-throw-values/__Cps_nestedThrow#set:state
  global.get $async-throw-values/__async_roots_nestedThrow
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_nestedThrow
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#splice
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
 (func $async-throw-values/__async_async_throw_values_nestedThrow_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_nestedThrow#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_nestedThrow_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_nestedThrow#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_nestedThrow_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_nestedThrow#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_nestedThrow_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_nestedThrow#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_throwInCatch_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_throwInCatch
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:length
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
  global.get $async-throw-values/__async_roots_throwInCatch
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_throwInCatch
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwInCatch_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwInCatch#get:state
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
  call $async-throw-values/__Cps_throwInCatch#set:state
  global.get $async-throw-values/__async_roots_throwInCatch
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_throwInCatch
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#splice
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
 (func $async-throw-values/__async_async_throw_values_throwInCatch_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwInCatch#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwInCatch_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwInCatch#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwInCatch_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwInCatch#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwInCatch_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwInCatch#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:length (param $this i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:length_
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#__get (param $this i32) (param $index i32) (result i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:dataStart
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
   i32.const 3024
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
 (func $async-throw-values/__async_async_throw_values_throwBox_last_handle (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $async-throw-values/__async_roots_throwBox
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:length
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
  global.get $async-throw-values/__async_roots_throwBox
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  global.get $async-throw-values/__async_roots_throwBox
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwBox_reclaim (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwBox#get:state
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
  call $async-throw-values/__Cps_throwBox#set:state
  global.get $async-throw-values/__async_roots_throwBox
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  global.get $async-throw-values/__async_roots_throwBox
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#indexOf
  i32.const 1
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#splice
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
 (func $async-throw-values/__async_async_throw_values_throwBox_result (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwBox#get:__result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwBox_error (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwBox#get:__error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwBox_errorValue (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwBox#get:__errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $async-throw-values/__async_async_throw_values_throwBox_status (param $state i32) (result i32)
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
  call $async-throw-values/__Cps_throwBox#get:state
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  return
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwError>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwError>#get:buffer
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
 (func $~lib/array/Array<async-throw-values/__Cps_throwString>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwString>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwNumber>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwNumber>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchError>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_catchError>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitString>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitError>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwAwaitNumber>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_catchAwaitString>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_nestedThrow>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwInCatch>#get:buffer
  local.get $cookie
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-throw-values/__Cps_throwBox>#__visit (param $this i32) (param $cookie i32)
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:dataStart
  local.set $cur
  local.get $cur
  local.get $this
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:length_
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
  call $~lib/array/Array<async-throw-values/__Cps_throwBox>#get:buffer
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
 (func $~lib/util/number/itoa32 (param $value i32) (param $radix i32) (result i32)
  (local $sign i32)
  (local $out i32)
  (local $decimals i32)
  (local $buffer i32)
  (local $num i32)
  (local $offset i32)
  (local $decimals|8 i32)
  (local $buffer|9 i32)
  (local $num|10 i32)
  (local $offset|11 i32)
  (local $val32 i32)
  (local $decimals|13 i32)
  (local $14 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $radix
  i32.const 2
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $radix
   i32.const 36
   i32.gt_s
  end
  if
   i32.const 736
   i32.const 864
   i32.const 373
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  i32.eqz
  if
   i32.const 928
   local.set $14
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $14
   return
  end
  local.get $value
  i32.const 31
  i32.shr_u
  i32.const 1
  i32.shl
  local.set $sign
  local.get $sign
  if
   i32.const 0
   local.get $value
   i32.sub
   local.set $value
  end
  local.get $radix
  i32.const 10
  i32.eq
  if
   local.get $value
   call $~lib/util/number/decimalCount32
   local.set $decimals
   global.get $~lib/memory/__stack_pointer
   local.get $decimals
   i32.const 1
   i32.shl
   local.get $sign
   i32.add
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $out
   i32.store
   local.get $out
   local.get $sign
   i32.add
   local.set $buffer
   local.get $value
   local.set $num
   local.get $decimals
   local.set $offset
   i32.const 0
   i32.const 1
   i32.ge_s
   drop
   local.get $buffer
   local.get $num
   local.get $offset
   call $~lib/util/number/utoa32_dec_lut
  else
   local.get $radix
   i32.const 16
   i32.eq
   if
    i32.const 31
    local.get $value
    i32.clz
    i32.sub
    i32.const 2
    i32.shr_s
    i32.const 1
    i32.add
    local.set $decimals|8
    global.get $~lib/memory/__stack_pointer
    local.get $decimals|8
    i32.const 1
    i32.shl
    local.get $sign
    i32.add
    i32.const 2
    call $~lib/rt/itcms/__new
    local.tee $out
    i32.store
    local.get $out
    local.get $sign
    i32.add
    local.set $buffer|9
    local.get $value
    local.set $num|10
    local.get $decimals|8
    local.set $offset|11
    i32.const 0
    i32.const 1
    i32.ge_s
    drop
    local.get $buffer|9
    local.get $num|10
    i64.extend_i32_u
    local.get $offset|11
    call $~lib/util/number/utoa_hex_lut
   else
    local.get $value
    local.set $val32
    local.get $val32
    i64.extend_i32_u
    local.get $radix
    call $~lib/util/number/ulog_base
    local.set $decimals|13
    global.get $~lib/memory/__stack_pointer
    local.get $decimals|13
    i32.const 1
    i32.shl
    local.get $sign
    i32.add
    i32.const 2
    call $~lib/rt/itcms/__new
    local.tee $out
    i32.store
    local.get $out
    local.get $sign
    i32.add
    local.get $val32
    i64.extend_i32_u
    local.get $decimals|13
    local.get $radix
    call $~lib/util/number/utoa64_any_core
   end
  end
  local.get $sign
  if
   local.get $out
   i32.const 45
   i32.store16
  end
  local.get $out
  local.set $14
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $14
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
   i32.const 2880
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
 (func $export:async-throw-values/errMessage (param $0 i32) (result i32)
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
  call $async-throw-values/errMessage
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/boxValue (param $0 i32) (result i32)
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
  call $async-throw-values/boxValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwError_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwError_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwError_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwError_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwError_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwError_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwError_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwError_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwError_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwError_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwString_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwString_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwString_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwString_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwString_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwString_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwString_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwString_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwString_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwString_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwNumber_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwNumber_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwNumber_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwNumber_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwNumber_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwNumber_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwNumber_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwNumber_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwNumber_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwNumber_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_catchError_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchError_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_catchError_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchError_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_catchError_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchError_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_catchError_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchError_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_catchError_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchError_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitString_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_resume_0 (param $0 i32) (param $1 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitString_resume_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_reject_0 (param $0 i32) (param $1 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitString_reject_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitString_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitString_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitString_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitString_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitString_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitError_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_resume_0 (param $0 i32) (param $1 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitError_resume_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_reject_0 (param $0 i32) (param $1 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitError_reject_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitError_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitError_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitError_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitError_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitError_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitNumber_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_resume_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $async-throw-values/__async_async_throw_values_throwAwaitNumber_resume_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_reject_0 (param $0 i32) (param $1 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitNumber_reject_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitNumber_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitNumber_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitNumber_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwAwaitNumber_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwAwaitNumber_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchAwaitString_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_resume_0 (param $0 i32) (param $1 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchAwaitString_resume_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_reject_0 (param $0 i32) (param $1 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchAwaitString_reject_0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchAwaitString_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchAwaitString_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchAwaitString_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_catchAwaitString_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_catchAwaitString_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_nestedThrow_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_nestedThrow_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_nestedThrow_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_nestedThrow_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_nestedThrow_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_nestedThrow_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_nestedThrow_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_nestedThrow_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_nestedThrow_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_nestedThrow_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwInCatch_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwInCatch_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwInCatch_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwInCatch_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwInCatch_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwInCatch_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwInCatch_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwInCatch_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwInCatch_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwInCatch_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwBox_reclaim (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwBox_reclaim
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwBox_result (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwBox_result
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwBox_error (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwBox_error
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwBox_errorValue (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwBox_errorValue
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $export:async-throw-values/__async_async_throw_values_throwBox_status (param $0 i32) (result i32)
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
  call $async-throw-values/__async_async_throw_values_throwBox_status
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
)
