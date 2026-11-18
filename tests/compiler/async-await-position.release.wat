(module
 (type $0 (func (param i32 i32) (result i32)))
 (type $1 (func (param i32) (result i32)))
 (type $2 (func (result i32)))
 (type $3 (func (param i32 i32)))
 (type $4 (func (param i32)))
 (type $5 (func))
 (type $6 (func (param i32 i32 i32)))
 (type $7 (func (param i32 i32 i32 i32)))
 (type $8 (func (param i32 i32 i64)))
 (type $9 (func (param i32) (result f64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "getNum" (func $async-await-position/getNum (param i32) (result i32)))
 (import "env" "getChunk" (func $async-await-position/getChunk (param i32) (result i32)))
 (import "env" "getFlag" (func $async-await-position/getFlag (param i32) (result i32)))
 (import "env" "__async_wait" (func $~lib/promise/__async_wait (param i32) (result i32)))
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
 (global $async-await-position/__async_roots_compoundStr (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_compoundNum (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_mixedCompound (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_fieldAssign (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_fieldCompound (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_recvCall (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_elemAssign (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_indexOrder (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_elemCompound (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_storedField (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_ifCond (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_whileCond (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_forCond (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_doCond (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_forIncr (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_callArgs (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_binaryOp (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_binaryStr (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_varInitCall (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_varInitBinary (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_returnAssign (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_compoundRhs (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_assignRhsField (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_ternaryCond (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_andLeft (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_storedArg (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_ifCondInTry (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_unaryOp (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_arrayLit (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_templateLit (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_W_setField (mut i32) (i32.const 0))
 (global $async-await-position/__async_roots_W_checkFlag (mut i32) (i32.const 0))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 36976))
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
 (data $11 (i32.const 1564) "|")
 (data $11.1 (i32.const 1576) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $12 (i32.const 1692) "<")
 (data $12.1 (i32.const 1704) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $13 (i32.const 1756) "\1c")
 (data $13.1 (i32.const 1768) "\02\00\00\00\02\00\00\000")
 (data $14 (i32.const 1788) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
 (data $15 (i32.const 2188) "\1c\04")
 (data $15.1 (i32.const 2200) "\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
 (data $16 (i32.const 3244) "\\")
 (data $16.1 (i32.const 3256) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $17 (i32.const 3340) "\1c")
 (data $17.1 (i32.const 3352) "\02\00\00\00\02\00\00\00x")
 (data $18 (i32.const 3372) "|")
 (data $18.1 (i32.const 3384) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $19 (i32.const 3500) "\1c")
 (data $19.1 (i32.const 3512) "\02\00\00\00\06\00\00\00A\00A\00A")
 (data $20 (i32.const 3532) "\1c")
 (data $20.1 (i32.const 3544) "\02\00\00\00\06\00\00\00B\00B\00B")
 (data $21 (i32.const 3564) "\1c")
 (data $21.1 (i32.const 3576) "\02\00\00\00\06\00\00\00C\00C\00C")
 (data $22 (i32.const 3596) "\1c")
 (data $22.1 (i32.const 3608) "\02\00\00\00\06\00\00\00D\00D\00D")
 (data $23 (i32.const 3628) "\1c")
 (data $23.1 (i32.const 3640) "\02\00\00\00\04\00\00\00N\00O")
 (data $24 (i32.const 3660) "\1c")
 (data $24.1 (i32.const 3672) "\02\00\00\00\06\00\00\00Y\00E\00S")
 (data $25 (i32.const 3692) "\1c")
 (data $25.1 (i32.const 3704) "\02\00\00\00\02\00\00\00!")
 (data $26 (i32.const 3724) "\1c")
 (data $26.1 (i32.const 3736) "\02\00\00\00\0c\00\00\00C\00A\00U\00G\00H\00T")
 (data $27 (i32.const 3756) "<")
 (data $27.1 (i32.const 3768) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data $28 (i32.const 3820) "\1c")
 (data $28.1 (i32.const 3832) "\02\00\00\00\02\00\00\00 ")
 (data $29 (i32.const 3852) ",")
 (data $29.1 (i32.const 3864) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $30 (i32.const 3904) "K\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00\02A\00\00\02\t\00\00 \00\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A")
 (export "compoundStr" (func $async-await-position/compoundStr))
 (export "compoundNum" (func $async-await-position/compoundNum))
 (export "mixedCompound" (func $async-await-position/mixedCompound))
 (export "fieldAssign" (func $async-await-position/fieldAssign))
 (export "fieldCompound" (func $async-await-position/fieldCompound))
 (export "recvCall" (func $async-await-position/recvCall))
 (export "elemAssign" (func $async-await-position/elemAssign))
 (export "indexOrder" (func $async-await-position/indexOrder))
 (export "elemCompound" (func $async-await-position/elemCompound))
 (export "storedField" (func $async-await-position/storedField))
 (export "chunkString" (func $async-await-position/chunkString))
 (export "startSetField" (func $async-await-position/startSetField))
 (export "startCheckFlag" (func $async-await-position/startCheckFlag))
 (export "ifCond" (func $async-await-position/ifCond))
 (export "whileCond" (func $async-await-position/whileCond))
 (export "forCond" (func $async-await-position/forCond))
 (export "doCond" (func $async-await-position/doCond))
 (export "forIncr" (func $async-await-position/forIncr))
 (export "callArgs" (func $async-await-position/callArgs))
 (export "binaryOp" (func $async-await-position/binaryOp))
 (export "binaryStr" (func $async-await-position/binaryStr))
 (export "varInitCall" (func $async-await-position/varInitCall))
 (export "varInitBinary" (func $async-await-position/varInitBinary))
 (export "returnAssign" (func $async-await-position/returnAssign))
 (export "compoundRhs" (func $async-await-position/compoundRhs))
 (export "assignRhsField" (func $async-await-position/assignRhsField))
 (export "ternaryCond" (func $async-await-position/ternaryCond))
 (export "andLeft" (func $async-await-position/andLeft))
 (export "storedArg" (func $async-await-position/storedArg))
 (export "ifCondInTry" (func $async-await-position/ifCondInTry))
 (export "unaryOp" (func $async-await-position/unaryOp))
 (export "arrayLit" (func $async-await-position/arrayLit))
 (export "templateLit" (func $async-await-position/templateLit))
 (export "__async_async_await_position_mint" (func $async-await-position/__async_async_await_position_mint))
 (export "__async_async_await_position_mint_string" (func $async-await-position/__async_async_await_position_mint_string))
 (export "__async_async_await_position_compoundStr_last_handle" (func $async-await-position/__async_async_await_position_compoundStr_last_handle))
 (export "__async_async_await_position_compoundNum_last_handle" (func $async-await-position/__async_async_await_position_compoundNum_last_handle))
 (export "__async_async_await_position_mixedCompound_last_handle" (func $async-await-position/__async_async_await_position_mixedCompound_last_handle))
 (export "__async_async_await_position_fieldAssign_last_handle" (func $async-await-position/__async_async_await_position_fieldAssign_last_handle))
 (export "__async_async_await_position_fieldCompound_last_handle" (func $async-await-position/__async_async_await_position_fieldCompound_last_handle))
 (export "__async_async_await_position_recvCall_last_handle" (func $async-await-position/__async_async_await_position_recvCall_last_handle))
 (export "__async_async_await_position_elemAssign_last_handle" (func $async-await-position/__async_async_await_position_elemAssign_last_handle))
 (export "__async_async_await_position_indexOrder_last_handle" (func $async-await-position/__async_async_await_position_indexOrder_last_handle))
 (export "__async_async_await_position_elemCompound_last_handle" (func $async-await-position/__async_async_await_position_elemCompound_last_handle))
 (export "__async_async_await_position_storedField_last_handle" (func $async-await-position/__async_async_await_position_storedField_last_handle))
 (export "__async_async_await_position_ifCond_last_handle" (func $async-await-position/__async_async_await_position_ifCond_last_handle))
 (export "__async_async_await_position_whileCond_last_handle" (func $async-await-position/__async_async_await_position_whileCond_last_handle))
 (export "__async_async_await_position_forCond_last_handle" (func $async-await-position/__async_async_await_position_forCond_last_handle))
 (export "__async_async_await_position_doCond_last_handle" (func $async-await-position/__async_async_await_position_doCond_last_handle))
 (export "__async_async_await_position_forIncr_last_handle" (func $async-await-position/__async_async_await_position_forIncr_last_handle))
 (export "__async_async_await_position_callArgs_last_handle" (func $async-await-position/__async_async_await_position_callArgs_last_handle))
 (export "__async_async_await_position_binaryOp_last_handle" (func $async-await-position/__async_async_await_position_binaryOp_last_handle))
 (export "__async_async_await_position_binaryStr_last_handle" (func $async-await-position/__async_async_await_position_binaryStr_last_handle))
 (export "__async_async_await_position_varInitCall_last_handle" (func $async-await-position/__async_async_await_position_varInitCall_last_handle))
 (export "__async_async_await_position_varInitBinary_last_handle" (func $async-await-position/__async_async_await_position_varInitBinary_last_handle))
 (export "__async_async_await_position_returnAssign_last_handle" (func $async-await-position/__async_async_await_position_returnAssign_last_handle))
 (export "__async_async_await_position_compoundRhs_last_handle" (func $async-await-position/__async_async_await_position_compoundRhs_last_handle))
 (export "__async_async_await_position_assignRhsField_last_handle" (func $async-await-position/__async_async_await_position_assignRhsField_last_handle))
 (export "__async_async_await_position_ternaryCond_last_handle" (func $async-await-position/__async_async_await_position_ternaryCond_last_handle))
 (export "__async_async_await_position_andLeft_last_handle" (func $async-await-position/__async_async_await_position_andLeft_last_handle))
 (export "__async_async_await_position_storedArg_last_handle" (func $async-await-position/__async_async_await_position_storedArg_last_handle))
 (export "__async_async_await_position_ifCondInTry_last_handle" (func $async-await-position/__async_async_await_position_ifCondInTry_last_handle))
 (export "__async_async_await_position_unaryOp_last_handle" (func $async-await-position/__async_async_await_position_unaryOp_last_handle))
 (export "__async_async_await_position_arrayLit_last_handle" (func $async-await-position/__async_async_await_position_arrayLit_last_handle))
 (export "__async_async_await_position_templateLit_last_handle" (func $async-await-position/__async_async_await_position_templateLit_last_handle))
 (export "__async_async_await_position_W_setField_last_handle" (func $async-await-position/__async_async_await_position_W_setField_last_handle))
 (export "__async_async_await_position_W_new" (func $async-await-position/__async_async_await_position_W_new))
 (export "__async_async_await_position_W_checkFlag_last_handle" (func $async-await-position/__async_async_await_position_W_checkFlag_last_handle))
 (export "memory" (memory $0))
 (export "combine" (func $export:async-await-position/combine))
 (export "getW" (func $export:async-await-position/getW))
 (export "__async_async_await_position_compoundStr_reclaim" (func $export:async-await-position/__async_async_await_position_compoundStr_reclaim))
 (export "__async_async_await_position_compoundStr_resume_0" (func $export:async-await-position/__async_async_await_position_compoundStr_resume_0))
 (export "__async_async_await_position_compoundStr_reject_0" (func $export:async-await-position/__async_async_await_position_compoundStr_reject_0))
 (export "__async_async_await_position_compoundStr_resume_1" (func $export:async-await-position/__async_async_await_position_compoundStr_resume_1))
 (export "__async_async_await_position_compoundStr_reject_1" (func $export:async-await-position/__async_async_await_position_compoundStr_reject_0))
 (export "__async_async_await_position_compoundStr_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_compoundStr_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_compoundStr_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_compoundNum_reclaim" (func $export:async-await-position/__async_async_await_position_compoundNum_reclaim))
 (export "__async_async_await_position_compoundNum_resume_0" (func $export:async-await-position/__async_async_await_position_compoundNum_resume_0))
 (export "__async_async_await_position_compoundNum_reject_0" (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0))
 (export "__async_async_await_position_compoundNum_resume_1" (func $export:async-await-position/__async_async_await_position_compoundNum_resume_1))
 (export "__async_async_await_position_compoundNum_reject_1" (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0))
 (export "__async_async_await_position_compoundNum_resume_2" (func $export:async-await-position/__async_async_await_position_compoundNum_resume_2))
 (export "__async_async_await_position_compoundNum_reject_2" (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0))
 (export "__async_async_await_position_compoundNum_resume_3" (func $export:async-await-position/__async_async_await_position_compoundNum_resume_3))
 (export "__async_async_await_position_compoundNum_reject_3" (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0))
 (export "__async_async_await_position_compoundNum_resume_4" (func $export:async-await-position/__async_async_await_position_compoundNum_resume_4))
 (export "__async_async_await_position_compoundNum_reject_4" (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0))
 (export "__async_async_await_position_compoundNum_resume_5" (func $export:async-await-position/__async_async_await_position_compoundNum_resume_5))
 (export "__async_async_await_position_compoundNum_reject_5" (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0))
 (export "__async_async_await_position_compoundNum_resume_6" (func $export:async-await-position/__async_async_await_position_compoundNum_resume_6))
 (export "__async_async_await_position_compoundNum_reject_6" (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0))
 (export "__async_async_await_position_compoundNum_resume_7" (func $export:async-await-position/__async_async_await_position_compoundNum_resume_7))
 (export "__async_async_await_position_compoundNum_reject_7" (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0))
 (export "__async_async_await_position_compoundNum_resume_8" (func $export:async-await-position/__async_async_await_position_compoundNum_resume_8))
 (export "__async_async_await_position_compoundNum_reject_8" (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0))
 (export "__async_async_await_position_compoundNum_resume_9" (func $export:async-await-position/__async_async_await_position_compoundNum_resume_9))
 (export "__async_async_await_position_compoundNum_reject_9" (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0))
 (export "__async_async_await_position_compoundNum_result" (func $export:async-await-position/__async_async_await_position_compoundNum_result))
 (export "__async_async_await_position_compoundNum_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_compoundNum_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_mixedCompound_reclaim" (func $export:async-await-position/__async_async_await_position_mixedCompound_reclaim))
 (export "__async_async_await_position_mixedCompound_resume_0" (func $export:async-await-position/__async_async_await_position_mixedCompound_resume_0))
 (export "__async_async_await_position_mixedCompound_reject_0" (func $export:async-await-position/__async_async_await_position_mixedCompound_reject_0))
 (export "__async_async_await_position_mixedCompound_resume_1" (func $export:async-await-position/__async_async_await_position_mixedCompound_resume_1))
 (export "__async_async_await_position_mixedCompound_reject_1" (func $export:async-await-position/__async_async_await_position_mixedCompound_reject_0))
 (export "__async_async_await_position_mixedCompound_result" (func $export:async-await-position/__async_async_await_position_mixedCompound_result))
 (export "__async_async_await_position_mixedCompound_error" (func $export:async-await-position/__async_async_await_position_mixedCompound_error))
 (export "__async_async_await_position_mixedCompound_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_fieldAssign_reclaim" (func $export:async-await-position/__async_async_await_position_fieldAssign_reclaim))
 (export "__async_async_await_position_fieldAssign_resume_0" (func $export:async-await-position/__async_async_await_position_fieldAssign_resume_0))
 (export "__async_async_await_position_fieldAssign_reject_0" (func $export:async-await-position/__async_async_await_position_fieldAssign_reject_0))
 (export "__async_async_await_position_fieldAssign_resume_1" (func $export:async-await-position/__async_async_await_position_fieldAssign_resume_1))
 (export "__async_async_await_position_fieldAssign_reject_1" (func $export:async-await-position/__async_async_await_position_fieldAssign_reject_0))
 (export "__async_async_await_position_fieldAssign_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_fieldAssign_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_fieldAssign_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_fieldCompound_reclaim" (func $export:async-await-position/__async_async_await_position_fieldCompound_reclaim))
 (export "__async_async_await_position_fieldCompound_resume_0" (func $export:async-await-position/__async_async_await_position_fieldCompound_resume_0))
 (export "__async_async_await_position_fieldCompound_reject_0" (func $export:async-await-position/__async_async_await_position_fieldCompound_reject_0))
 (export "__async_async_await_position_fieldCompound_resume_1" (func $export:async-await-position/__async_async_await_position_fieldCompound_resume_1))
 (export "__async_async_await_position_fieldCompound_reject_1" (func $export:async-await-position/__async_async_await_position_fieldCompound_reject_0))
 (export "__async_async_await_position_fieldCompound_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_fieldCompound_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_fieldCompound_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_recvCall_reclaim" (func $export:async-await-position/__async_async_await_position_recvCall_reclaim))
 (export "__async_async_await_position_recvCall_resume_0" (func $export:async-await-position/__async_async_await_position_recvCall_resume_0))
 (export "__async_async_await_position_recvCall_reject_0" (func $export:async-await-position/__async_async_await_position_recvCall_reject_0))
 (export "__async_async_await_position_recvCall_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_recvCall_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_recvCall_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_elemAssign_reclaim" (func $export:async-await-position/__async_async_await_position_elemAssign_reclaim))
 (export "__async_async_await_position_elemAssign_resume_0" (func $export:async-await-position/__async_async_await_position_elemAssign_resume_0))
 (export "__async_async_await_position_elemAssign_reject_0" (func $export:async-await-position/__async_async_await_position_elemAssign_reject_0))
 (export "__async_async_await_position_elemAssign_resume_1" (func $export:async-await-position/__async_async_await_position_elemAssign_resume_1))
 (export "__async_async_await_position_elemAssign_reject_1" (func $export:async-await-position/__async_async_await_position_elemAssign_reject_0))
 (export "__async_async_await_position_elemAssign_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_elemAssign_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_elemAssign_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_indexOrder_reclaim" (func $export:async-await-position/__async_async_await_position_indexOrder_reclaim))
 (export "__async_async_await_position_indexOrder_resume_0" (func $export:async-await-position/__async_async_await_position_indexOrder_resume_0))
 (export "__async_async_await_position_indexOrder_reject_0" (func $export:async-await-position/__async_async_await_position_indexOrder_reject_0))
 (export "__async_async_await_position_indexOrder_result" (func $export:async-await-position/__async_async_await_position_compoundNum_result))
 (export "__async_async_await_position_indexOrder_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_indexOrder_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_elemCompound_reclaim" (func $export:async-await-position/__async_async_await_position_elemCompound_reclaim))
 (export "__async_async_await_position_elemCompound_resume_0" (func $export:async-await-position/__async_async_await_position_elemCompound_resume_0))
 (export "__async_async_await_position_elemCompound_reject_0" (func $export:async-await-position/__async_async_await_position_elemCompound_reject_0))
 (export "__async_async_await_position_elemCompound_result" (func $export:async-await-position/__async_async_await_position_compoundNum_result))
 (export "__async_async_await_position_elemCompound_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_elemCompound_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_storedField_reclaim" (func $export:async-await-position/__async_async_await_position_storedField_reclaim))
 (export "__async_async_await_position_storedField_resume_0" (func $export:async-await-position/__async_async_await_position_storedField_resume_0))
 (export "__async_async_await_position_storedField_reject_0" (func $export:async-await-position/__async_async_await_position_storedField_reject_0))
 (export "__async_async_await_position_storedField_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_storedField_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_storedField_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_ifCond_reclaim" (func $export:async-await-position/__async_async_await_position_ifCond_reclaim))
 (export "__async_async_await_position_ifCond_resume_0" (func $export:async-await-position/__async_async_await_position_ifCond_resume_0))
 (export "__async_async_await_position_ifCond_reject_0" (func $export:async-await-position/__async_async_await_position_ifCond_reject_0))
 (export "__async_async_await_position_ifCond_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_ifCond_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_ifCond_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_whileCond_reclaim" (func $export:async-await-position/__async_async_await_position_whileCond_reclaim))
 (export "__async_async_await_position_whileCond_resume_0" (func $export:async-await-position/__async_async_await_position_whileCond_resume_0))
 (export "__async_async_await_position_whileCond_reject_0" (func $export:async-await-position/__async_async_await_position_whileCond_reject_0))
 (export "__async_async_await_position_whileCond_resume_1" (func $export:async-await-position/__async_async_await_position_whileCond_resume_1))
 (export "__async_async_await_position_whileCond_reject_1" (func $export:async-await-position/__async_async_await_position_whileCond_reject_0))
 (export "__async_async_await_position_whileCond_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_whileCond_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_whileCond_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_forCond_reclaim" (func $export:async-await-position/__async_async_await_position_forCond_reclaim))
 (export "__async_async_await_position_forCond_resume_0" (func $export:async-await-position/__async_async_await_position_forCond_resume_0))
 (export "__async_async_await_position_forCond_reject_0" (func $export:async-await-position/__async_async_await_position_forCond_reject_0))
 (export "__async_async_await_position_forCond_resume_1" (func $export:async-await-position/__async_async_await_position_forCond_resume_1))
 (export "__async_async_await_position_forCond_reject_1" (func $export:async-await-position/__async_async_await_position_forCond_reject_0))
 (export "__async_async_await_position_forCond_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_forCond_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_forCond_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_doCond_reclaim" (func $export:async-await-position/__async_async_await_position_doCond_reclaim))
 (export "__async_async_await_position_doCond_resume_0" (func $export:async-await-position/__async_async_await_position_doCond_resume_0))
 (export "__async_async_await_position_doCond_reject_0" (func $export:async-await-position/__async_async_await_position_doCond_reject_0))
 (export "__async_async_await_position_doCond_resume_1" (func $export:async-await-position/__async_async_await_position_doCond_resume_1))
 (export "__async_async_await_position_doCond_reject_1" (func $export:async-await-position/__async_async_await_position_doCond_reject_0))
 (export "__async_async_await_position_doCond_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_doCond_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_doCond_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_forIncr_reclaim" (func $export:async-await-position/__async_async_await_position_forIncr_reclaim))
 (export "__async_async_await_position_forIncr_resume_0" (func $export:async-await-position/__async_async_await_position_forIncr_resume_0))
 (export "__async_async_await_position_forIncr_reject_0" (func $export:async-await-position/__async_async_await_position_forIncr_reject_0))
 (export "__async_async_await_position_forIncr_resume_1" (func $export:async-await-position/__async_async_await_position_forIncr_resume_1))
 (export "__async_async_await_position_forIncr_reject_1" (func $export:async-await-position/__async_async_await_position_forIncr_reject_0))
 (export "__async_async_await_position_forIncr_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_forIncr_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_forIncr_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_callArgs_reclaim" (func $export:async-await-position/__async_async_await_position_callArgs_reclaim))
 (export "__async_async_await_position_callArgs_resume_0" (func $export:async-await-position/__async_async_await_position_callArgs_resume_0))
 (export "__async_async_await_position_callArgs_reject_0" (func $export:async-await-position/__async_async_await_position_callArgs_reject_0))
 (export "__async_async_await_position_callArgs_resume_1" (func $export:async-await-position/__async_async_await_position_callArgs_resume_1))
 (export "__async_async_await_position_callArgs_reject_1" (func $export:async-await-position/__async_async_await_position_callArgs_reject_0))
 (export "__async_async_await_position_callArgs_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_callArgs_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_callArgs_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_binaryOp_reclaim" (func $export:async-await-position/__async_async_await_position_binaryOp_reclaim))
 (export "__async_async_await_position_binaryOp_resume_0" (func $export:async-await-position/__async_async_await_position_binaryOp_resume_0))
 (export "__async_async_await_position_binaryOp_reject_0" (func $export:async-await-position/__async_async_await_position_binaryOp_reject_0))
 (export "__async_async_await_position_binaryOp_resume_1" (func $export:async-await-position/__async_async_await_position_binaryOp_resume_1))
 (export "__async_async_await_position_binaryOp_reject_1" (func $export:async-await-position/__async_async_await_position_binaryOp_reject_0))
 (export "__async_async_await_position_binaryOp_result" (func $export:async-await-position/__async_async_await_position_compoundNum_result))
 (export "__async_async_await_position_binaryOp_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_binaryOp_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_binaryStr_reclaim" (func $export:async-await-position/__async_async_await_position_binaryStr_reclaim))
 (export "__async_async_await_position_binaryStr_resume_0" (func $export:async-await-position/__async_async_await_position_binaryStr_resume_0))
 (export "__async_async_await_position_binaryStr_reject_0" (func $export:async-await-position/__async_async_await_position_binaryStr_reject_0))
 (export "__async_async_await_position_binaryStr_resume_1" (func $export:async-await-position/__async_async_await_position_binaryStr_resume_1))
 (export "__async_async_await_position_binaryStr_reject_1" (func $export:async-await-position/__async_async_await_position_binaryStr_reject_0))
 (export "__async_async_await_position_binaryStr_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_binaryStr_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_binaryStr_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_varInitCall_reclaim" (func $export:async-await-position/__async_async_await_position_varInitCall_reclaim))
 (export "__async_async_await_position_varInitCall_resume_0" (func $export:async-await-position/__async_async_await_position_varInitCall_resume_0))
 (export "__async_async_await_position_varInitCall_reject_0" (func $export:async-await-position/__async_async_await_position_varInitCall_reject_0))
 (export "__async_async_await_position_varInitCall_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_varInitCall_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_varInitCall_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_varInitBinary_reclaim" (func $export:async-await-position/__async_async_await_position_varInitBinary_reclaim))
 (export "__async_async_await_position_varInitBinary_resume_0" (func $export:async-await-position/__async_async_await_position_varInitBinary_resume_0))
 (export "__async_async_await_position_varInitBinary_reject_0" (func $export:async-await-position/__async_async_await_position_varInitBinary_reject_0))
 (export "__async_async_await_position_varInitBinary_result" (func $export:async-await-position/__async_async_await_position_compoundNum_result))
 (export "__async_async_await_position_varInitBinary_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_varInitBinary_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_returnAssign_reclaim" (func $export:async-await-position/__async_async_await_position_returnAssign_reclaim))
 (export "__async_async_await_position_returnAssign_resume_0" (func $export:async-await-position/__async_async_await_position_returnAssign_resume_0))
 (export "__async_async_await_position_returnAssign_reject_0" (func $export:async-await-position/__async_async_await_position_returnAssign_reject_0))
 (export "__async_async_await_position_returnAssign_resume_1" (func $export:async-await-position/__async_async_await_position_returnAssign_resume_1))
 (export "__async_async_await_position_returnAssign_reject_1" (func $export:async-await-position/__async_async_await_position_returnAssign_reject_0))
 (export "__async_async_await_position_returnAssign_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_returnAssign_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_returnAssign_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_compoundRhs_reclaim" (func $export:async-await-position/__async_async_await_position_compoundRhs_reclaim))
 (export "__async_async_await_position_compoundRhs_resume_0" (func $export:async-await-position/__async_async_await_position_compoundRhs_resume_0))
 (export "__async_async_await_position_compoundRhs_reject_0" (func $export:async-await-position/__async_async_await_position_compoundRhs_reject_0))
 (export "__async_async_await_position_compoundRhs_result" (func $export:async-await-position/__async_async_await_position_compoundNum_result))
 (export "__async_async_await_position_compoundRhs_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_compoundRhs_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_assignRhsField_reclaim" (func $export:async-await-position/__async_async_await_position_assignRhsField_reclaim))
 (export "__async_async_await_position_assignRhsField_resume_0" (func $export:async-await-position/__async_async_await_position_assignRhsField_resume_0))
 (export "__async_async_await_position_assignRhsField_reject_0" (func $export:async-await-position/__async_async_await_position_assignRhsField_reject_0))
 (export "__async_async_await_position_assignRhsField_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_assignRhsField_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_assignRhsField_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_ternaryCond_reclaim" (func $export:async-await-position/__async_async_await_position_ternaryCond_reclaim))
 (export "__async_async_await_position_ternaryCond_resume_0" (func $export:async-await-position/__async_async_await_position_ternaryCond_resume_0))
 (export "__async_async_await_position_ternaryCond_reject_0" (func $export:async-await-position/__async_async_await_position_ternaryCond_reject_0))
 (export "__async_async_await_position_ternaryCond_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_ternaryCond_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_ternaryCond_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_andLeft_reclaim" (func $export:async-await-position/__async_async_await_position_andLeft_reclaim))
 (export "__async_async_await_position_andLeft_resume_0" (func $export:async-await-position/__async_async_await_position_andLeft_resume_0))
 (export "__async_async_await_position_andLeft_reject_0" (func $export:async-await-position/__async_async_await_position_andLeft_reject_0))
 (export "__async_async_await_position_andLeft_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_andLeft_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_andLeft_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_storedArg_reclaim" (func $export:async-await-position/__async_async_await_position_storedArg_reclaim))
 (export "__async_async_await_position_storedArg_resume_0" (func $export:async-await-position/__async_async_await_position_storedArg_resume_0))
 (export "__async_async_await_position_storedArg_reject_0" (func $export:async-await-position/__async_async_await_position_storedArg_reject_0))
 (export "__async_async_await_position_storedArg_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_storedArg_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_storedArg_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_ifCondInTry_reclaim" (func $export:async-await-position/__async_async_await_position_ifCondInTry_reclaim))
 (export "__async_async_await_position_ifCondInTry_resume_0" (func $export:async-await-position/__async_async_await_position_ifCondInTry_resume_0))
 (export "__async_async_await_position_ifCondInTry_reject_0" (func $export:async-await-position/__async_async_await_position_ifCondInTry_reject_0))
 (export "__async_async_await_position_ifCondInTry_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_ifCondInTry_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_ifCondInTry_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_unaryOp_reclaim" (func $export:async-await-position/__async_async_await_position_unaryOp_reclaim))
 (export "__async_async_await_position_unaryOp_resume_0" (func $export:async-await-position/__async_async_await_position_unaryOp_resume_0))
 (export "__async_async_await_position_unaryOp_reject_0" (func $export:async-await-position/__async_async_await_position_unaryOp_reject_0))
 (export "__async_async_await_position_unaryOp_result" (func $export:async-await-position/__async_async_await_position_compoundNum_result))
 (export "__async_async_await_position_unaryOp_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_unaryOp_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_arrayLit_reclaim" (func $export:async-await-position/__async_async_await_position_arrayLit_reclaim))
 (export "__async_async_await_position_arrayLit_resume_0" (func $export:async-await-position/__async_async_await_position_arrayLit_resume_0))
 (export "__async_async_await_position_arrayLit_reject_0" (func $export:async-await-position/__async_async_await_position_arrayLit_reject_0))
 (export "__async_async_await_position_arrayLit_resume_1" (func $export:async-await-position/__async_async_await_position_arrayLit_resume_1))
 (export "__async_async_await_position_arrayLit_reject_1" (func $export:async-await-position/__async_async_await_position_arrayLit_reject_0))
 (export "__async_async_await_position_arrayLit_result" (func $export:async-await-position/__async_async_await_position_compoundNum_result))
 (export "__async_async_await_position_arrayLit_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_arrayLit_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_templateLit_reclaim" (func $export:async-await-position/__async_async_await_position_templateLit_reclaim))
 (export "__async_async_await_position_templateLit_resume_0" (func $export:async-await-position/__async_async_await_position_templateLit_resume_0))
 (export "__async_async_await_position_templateLit_reject_0" (func $export:async-await-position/__async_async_await_position_templateLit_reject_0))
 (export "__async_async_await_position_templateLit_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_templateLit_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_templateLit_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_W_setField_reclaim" (func $export:async-await-position/__async_async_await_position_W_setField_reclaim))
 (export "__async_async_await_position_W_setField_resume_0" (func $export:async-await-position/__async_async_await_position_W_setField_resume_0))
 (export "__async_async_await_position_W_setField_reject_0" (func $export:async-await-position/__async_async_await_position_W_setField_reject_0))
 (export "__async_async_await_position_W_setField_resume_1" (func $export:async-await-position/__async_async_await_position_W_setField_resume_1))
 (export "__async_async_await_position_W_setField_reject_1" (func $export:async-await-position/__async_async_await_position_W_setField_reject_0))
 (export "__async_async_await_position_W_setField_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_W_setField_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_W_setField_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_W_setField_entry" (func $export:async-await-position/__async_async_await_position_W_setField_entry))
 (export "__async_async_await_position_W_checkFlag_reclaim" (func $export:async-await-position/__async_async_await_position_W_checkFlag_reclaim))
 (export "__async_async_await_position_W_checkFlag_resume_0" (func $export:async-await-position/__async_async_await_position_W_checkFlag_resume_0))
 (export "__async_async_await_position_W_checkFlag_reject_0" (func $export:async-await-position/__async_async_await_position_W_checkFlag_reject_0))
 (export "__async_async_await_position_W_checkFlag_result" (func $export:async-await-position/__async_async_await_position_compoundStr_result))
 (export "__async_async_await_position_W_checkFlag_error" (func $export:async-await-position/__async_async_await_position_compoundStr_error))
 (export "__async_async_await_position_W_checkFlag_status" (func $export:async-await-position/__async_async_await_position_compoundStr_status))
 (export "__async_async_await_position_W_checkFlag_entry" (func $export:async-await-position/__async_async_await_position_W_checkFlag_entry))
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
   block $__inlined_func$~lib/rt/itcms/interrupt$68
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
      br $__inlined_func$~lib/rt/itcms/interrupt$68
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
 (func $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
 (func $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
 (func $~lib/array/Array<~lib/string/String>#__get (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
   i32.const 3392
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
 (func $~lib/rt/__newArray (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
 (func $~lib/array/Array<async-await-position/__Cps_compoundStr>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
 (func $export:async-await-position/__async_async_await_position_compoundStr_status (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundStr_error (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundStr_result (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/string/String.__concat (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/string/String#concat
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__Cps_compoundNum#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
                           i32.const 2
                           i32.eq
                           br_if $case2|1
                           local.get $1
                           i32.const 3
                           i32.eq
                           br_if $case3|1
                           local.get $1
                           i32.const 4
                           i32.eq
                           br_if $case4|1
                           local.get $1
                           i32.const 5
                           i32.eq
                           br_if $case5|1
                           local.get $1
                           i32.const 6
                           i32.eq
                           br_if $case6|1
                           local.get $1
                           i32.const 7
                           i32.eq
                           br_if $case7|1
                           local.get $1
                           i32.const 8
                           i32.eq
                           br_if $case8|1
                           local.get $1
                           i32.const 9
                           i32.eq
                           br_if $case9|1
                           local.get $1
                           i32.const 10
                           i32.eq
                           br_if $case10|1
                           local.get $1
                           i32.const 1024
                           i32.eq
                           br_if $case11|1
                           local.get $1
                           i32.const 1025
                           i32.eq
                           br_if $case12|1
                           local.get $1
                           i32.const 1026
                           i32.eq
                           br_if $case13|1
                           local.get $1
                           i32.const 1027
                           i32.eq
                           br_if $case14|1
                           local.get $1
                           i32.const 1028
                           i32.eq
                           br_if $case15|1
                           local.get $1
                           i32.const 1029
                           i32.eq
                           br_if $case16|1
                           local.get $1
                           i32.const 1030
                           i32.eq
                           br_if $case17|1
                           local.get $1
                           i32.const 1031
                           i32.eq
                           br_if $case18|1
                           local.get $1
                           i32.const 1032
                           i32.eq
                           br_if $case19|1
                           local.get $1
                           i32.const 1033
                           i32.eq
                           br_if $case20|1
                           local.get $1
                           i32.const 1034
                           i32.eq
                           br_if $case21|1
                           br $case22|1
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
                      i32.const 1028
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
                    i32.const 1030
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
                  i32.const 1032
                  i32.store
                  br $while-continue|0
                 end
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1033
                 i32.store
                 br $while-continue|0
                end
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.const 1034
                i32.store
                br $while-continue|0
               end
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 10
               i32.store offset=52
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store offset=4
               local.get $0
               local.get $0
               i32.load offset=52
               i32.store offset=56
               i32.const 1
               call $async-await-position/getNum
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
              i32.load offset=56
              local.set $1
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store offset=4
              local.get $0
              local.get $1
              local.get $0
              i32.load offset=12
              i32.add
              i32.store offset=52
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store
              global.get $~lib/memory/__stack_pointer
              local.get $0
              i32.store offset=4
              local.get $0
              local.get $0
              i32.load offset=52
              i32.store offset=60
              i32.const 2
              call $async-await-position/getNum
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
             i32.load offset=60
             local.set $1
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store offset=4
             local.get $0
             local.get $1
             local.get $0
             i32.load offset=16
             i32.sub
             i32.store offset=52
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store offset=4
             local.get $0
             local.get $0
             i32.load offset=52
             i32.store offset=64
             i32.const 3
             call $async-await-position/getNum
             drop
             global.get $~lib/memory/__stack_pointer
             local.get $0
             i32.store
             local.get $0
             i32.const 3
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
            i32.load offset=64
            local.set $1
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store offset=4
            local.get $0
            local.get $1
            local.get $0
            i32.load offset=20
            i32.mul
            i32.store offset=52
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store offset=4
            local.get $0
            local.get $0
            i32.load offset=52
            i32.store offset=68
            i32.const 2
            call $async-await-position/getNum
            drop
            global.get $~lib/memory/__stack_pointer
            local.get $0
            i32.store
            local.get $0
            i32.const 4
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
           i32.load offset=68
           local.set $1
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store offset=4
           local.get $0
           local.get $1
           local.get $0
           i32.load offset=24
           i32.div_s
           i32.store offset=52
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store offset=4
           local.get $0
           local.get $0
           i32.load offset=52
           i32.store offset=72
           i32.const 3
           call $async-await-position/getNum
           drop
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.const 5
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
          i32.load offset=72
          local.set $1
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store offset=4
          local.get $0
          local.get $1
          local.get $0
          i32.load offset=28
          i32.rem_s
          i32.store offset=52
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store offset=4
          local.get $0
          local.get $0
          i32.load offset=52
          i32.store offset=76
          i32.const 1
          call $async-await-position/getNum
          drop
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 6
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
         i32.load offset=76
         local.set $1
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store offset=4
         local.get $0
         local.get $1
         local.get $0
         i32.load offset=32
         i32.shl
         i32.store offset=52
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store offset=4
         local.get $0
         local.get $0
         i32.load offset=52
         i32.store offset=80
         i32.const 7
         call $async-await-position/getNum
         drop
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.const 7
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
        i32.load offset=80
        local.set $1
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store offset=4
        local.get $0
        local.get $1
        local.get $0
        i32.load offset=36
        i32.and
        i32.store offset=52
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store offset=4
        local.get $0
        local.get $0
        i32.load offset=52
        i32.store offset=84
        i32.const 8
        call $async-await-position/getNum
        drop
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.const 8
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
       i32.load offset=84
       local.set $1
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       local.get $0
       local.get $1
       local.get $0
       i32.load offset=40
       i32.or
       i32.store offset=52
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       local.get $0
       local.get $0
       i32.load offset=52
       i32.store offset=88
       i32.const 3
       call $async-await-position/getNum
       drop
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 9
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
      i32.load offset=88
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      local.get $1
      local.get $0
      i32.load offset=44
      i32.xor
      i32.store offset=52
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      local.get $0
      i32.load offset=52
      i32.store offset=92
      i32.const 1
      call $async-await-position/getNum
      drop
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.const 10
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
     i32.load offset=92
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $1
     local.get $0
     i32.load offset=48
     i32.shr_s
     i32.store offset=52
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     i32.load offset=52
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_compoundNum
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_compoundNum
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_compoundNum>#splice
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
 (func $export:async-await-position/__async_async_await_position_compoundNum_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_compoundNum
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_compoundNum
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_compoundNum>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_result (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/W#constructor (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 8
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
  i32.const 1552
  i32.store
  local.get $0
  i32.const 1552
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<~lib/string/String>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.const 8
  call $~lib/rt/itcms/__new
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.const 0
  call $~lib/rt/itcms/__link
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
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1056
   i32.const 1104
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  local.get $1
  local.get $2
  i32.store
  local.get $1
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
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
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  block $__inlined_func$~lib/util/number/itoa32$109
   local.get $0
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 1776
    local.set $2
    br $__inlined_func$~lib/util/number/itoa32$109
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
     i32.const 1788
     i32.add
     i64.load32_u
     local.get $4
     i32.const 100
     i32.rem_u
     i32.const 2
     i32.shl
     i32.const 1788
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
    i32.const 1788
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
    i32.const 1788
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
 (func $~lib/array/Array<i32>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.const 9
  call $~lib/rt/itcms/__new
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.const 0
  call $~lib/rt/itcms/__link
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
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1056
   i32.const 1104
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  local.get $1
  local.get $2
  i32.store
  local.get $1
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<i32>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 1344
    i32.const 1104
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   call $~lib/array/ensureCapacity
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $3
   i32.store offset=12
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<i32>#__get (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/combine (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/string/String.__concat
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
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
  block $__inlined_func$~lib/rt/itcms/Object#unlink$2433
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
    i32.const 36976
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
    br $__inlined_func$~lib/rt/itcms/Object#unlink$2433
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
   i32.const 3904
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
   i32.const 3908
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
  block $folding-inner10
   block $folding-inner9
    block $folding-inner8
     block $folding-inner7
      block $folding-inner6
       block $folding-inner5
        block $folding-inner4
         block $folding-inner3
          block $folding-inner2
           block $folding-inner1
            block $folding-inner0
             block $invalid
              block $async-await-position/__Cps_W_checkFlag
               block $async-await-position/__Cps_W_setField
                block $async-await-position/__Cps_templateLit
                 block $async-await-position/__Cps_ifCondInTry
                  block $async-await-position/__Cps_returnAssign
                   block $async-await-position/__Cps_elemCompound
                    block $async-await-position/__Cps_indexOrder
                     block $async-await-position/__Cps_elemAssign
                      block $async-await-position/__Cps_fieldCompound
                       block $async-await-position/__Cps_fieldAssign
                        block $async-await-position/__Cps_mixedCompound
                         block $async-await-position/__Cps_compoundStr
                          block $~lib/promise/Promise<bool>
                           block $~lib/array/Array<i32>
                            block $async-await-position/W
                             block $~lib/promise/Promise<f64>
                              block $~lib/promise/Promise<i32>
                               block $~lib/promise/Promise<~lib/string/String>
                                block $~lib/arraybuffer/ArrayBufferView
                                 block $~lib/string/String
                                  block $~lib/arraybuffer/ArrayBuffer
                                   block $~lib/object/Object
                                    local.get $0
                                    i32.const 8
                                    i32.sub
                                    i32.load
                                    br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $~lib/promise/Promise<~lib/string/String> $~lib/promise/Promise<i32> $~lib/promise/Promise<f64> $async-await-position/W $folding-inner0 $~lib/array/Array<i32> $~lib/promise/Promise<bool> $async-await-position/__Cps_compoundStr $folding-inner0 $folding-inner1 $folding-inner0 $async-await-position/__Cps_mixedCompound $folding-inner0 $async-await-position/__Cps_fieldAssign $folding-inner0 $async-await-position/__Cps_fieldCompound $folding-inner0 $folding-inner3 $folding-inner0 $async-await-position/__Cps_elemAssign $folding-inner0 $async-await-position/__Cps_indexOrder $folding-inner0 $async-await-position/__Cps_elemCompound $folding-inner0 $folding-inner5 $folding-inner0 $folding-inner6 $folding-inner0 $folding-inner7 $folding-inner0 $folding-inner7 $folding-inner0 $folding-inner7 $folding-inner0 $folding-inner7 $folding-inner0 $folding-inner5 $folding-inner0 $folding-inner1 $folding-inner0 $folding-inner5 $folding-inner0 $folding-inner3 $folding-inner0 $folding-inner1 $folding-inner0 $async-await-position/__Cps_returnAssign $folding-inner0 $folding-inner1 $folding-inner0 $folding-inner5 $folding-inner0 $folding-inner6 $folding-inner0 $folding-inner6 $folding-inner0 $folding-inner3 $folding-inner0 $async-await-position/__Cps_ifCondInTry $folding-inner0 $folding-inner1 $folding-inner0 $folding-inner4 $folding-inner0 $async-await-position/__Cps_templateLit $folding-inner0 $async-await-position/__Cps_W_setField $folding-inner0 $async-await-position/__Cps_W_checkFlag $folding-inner0 $invalid
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
                             return
                            end
                            local.get $0
                            i32.load
                            call $~lib/rt/itcms/__visit
                            return
                           end
                           global.get $~lib/memory/__stack_pointer
                           i32.const 4
                           i32.sub
                           global.set $~lib/memory/__stack_pointer
                           global.get $~lib/memory/__stack_pointer
                           i32.const 4208
                           i32.lt_s
                           br_if $folding-inner8
                           global.get $~lib/memory/__stack_pointer
                           i32.const 0
                           i32.store
                           br $folding-inner9
                          end
                          return
                         end
                         local.get $0
                         call $async-await-position/__Cps_compoundStr~visit
                         return
                        end
                        local.get $0
                        i32.load offset=16
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
                       i32.load offset=20
                       call $~lib/rt/itcms/__visit
                       local.get $0
                       i32.load offset=24
                       call $~lib/rt/itcms/__visit
                       local.get $0
                       i32.load offset=28
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
                      i32.load offset=20
                      call $~lib/rt/itcms/__visit
                      br $folding-inner2
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
                     i32.load offset=16
                     call $~lib/rt/itcms/__visit
                     local.get $0
                     i32.load offset=20
                     call $~lib/rt/itcms/__visit
                     local.get $0
                     i32.load offset=28
                     call $~lib/rt/itcms/__visit
                     local.get $0
                     i32.load offset=36
                     call $~lib/rt/itcms/__visit
                     return
                    end
                    local.get $0
                    i32.load offset=8
                    call $~lib/rt/itcms/__visit
                    local.get $0
                    i32.load offset=12
                    call $~lib/rt/itcms/__visit
                    local.get $0
                    i32.load offset=16
                    call $~lib/rt/itcms/__visit
                    local.get $0
                    i32.load offset=24
                    call $~lib/rt/itcms/__visit
                    return
                   end
                   local.get $0
                   i32.load offset=8
                   call $~lib/rt/itcms/__visit
                   br $folding-inner10
                  end
                  local.get $0
                  call $async-await-position/__Cps_compoundStr~visit
                  return
                 end
                 local.get $0
                 i32.load offset=4
                 call $~lib/rt/itcms/__visit
                 local.get $0
                 i32.load offset=8
                 call $~lib/rt/itcms/__visit
                 local.get $0
                 i32.load offset=16
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
                i32.load offset=16
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
               br $folding-inner2
              end
              local.get $0
              i32.load offset=4
              call $~lib/rt/itcms/__visit
              br $folding-inner4
             end
             unreachable
            end
            global.get $~lib/memory/__stack_pointer
            i32.const 4
            i32.sub
            global.set $~lib/memory/__stack_pointer
            global.get $~lib/memory/__stack_pointer
            i32.const 4208
            i32.lt_s
            br_if $folding-inner8
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
            br $folding-inner9
           end
           local.get $0
           i32.load offset=8
           call $~lib/rt/itcms/__visit
           return
          end
          local.get $0
          i32.load offset=24
          call $~lib/rt/itcms/__visit
          local.get $0
          i32.load offset=28
          call $~lib/rt/itcms/__visit
          local.get $0
          i32.load offset=32
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
         br $folding-inner10
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
       i32.load offset=4
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=8
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=12
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.load offset=16
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
      i32.load offset=4
      call $~lib/rt/itcms/__visit
      local.get $0
      i32.load offset=8
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
     i32.load offset=16
     call $~lib/rt/itcms/__visit
     local.get $0
     i32.load offset=20
     call $~lib/rt/itcms/__visit
     local.get $0
     i32.load offset=32
     call $~lib/rt/itcms/__visit
     return
    end
    i32.const 37008
    i32.const 37056
    i32.const 1
    i32.const 1
    call $~lib/builtins/abort
    unreachable
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
  local.get $0
  i32.load offset=16
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=20
  call $~lib/rt/itcms/__visit
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
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
   block $__inlined_func$~lib/rt/itcms/__renew$2277
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
     br $__inlined_func$~lib/rt/itcms/__renew$2277
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
 (func $~lib/array/Array<~lib/string/String>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 1344
    i32.const 1104
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   call $~lib/array/ensureCapacity
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $3
   i32.store offset=12
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
  local.get $0
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<async-await-position/__Cps_whileCond>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 34
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
 (func $~lib/array/Array<async-await-position/__Cps_varInitCall>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 48
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
 (func $~lib/array/Array<async-await-position/__Cps_varInitBinary>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 50
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
 (func $~lib/array/Array<async-await-position/__Cps_unaryOp>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 66
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
 (func $~lib/array/Array<async-await-position/__Cps_ternaryCond>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 58
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
 (func $~lib/array/Array<async-await-position/__Cps_templateLit>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 70
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
 (func $~lib/array/Array<async-await-position/__Cps_storedField>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 30
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
 (func $~lib/array/Array<async-await-position/__Cps_storedArg>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 62
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
 (func $~lib/array/Array<async-await-position/__Cps_returnAssign>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 52
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
 (func $~lib/array/Array<async-await-position/__Cps_recvCall>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 22
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
 (func $~lib/array/Array<async-await-position/__Cps_mixedCompound>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
 (func $~lib/array/Array<async-await-position/__Cps_indexOrder>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 26
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
 (func $~lib/array/Array<async-await-position/__Cps_ifCondInTry>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 64
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
 (func $~lib/array/Array<async-await-position/__Cps_ifCond>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 32
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
 (func $~lib/array/Array<async-await-position/__Cps_forIncr>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 40
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
 (func $~lib/array/Array<async-await-position/__Cps_forCond>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 36
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
 (func $~lib/array/Array<async-await-position/__Cps_fieldCompound>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
 (func $~lib/array/Array<async-await-position/__Cps_fieldAssign>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
 (func $~lib/array/Array<async-await-position/__Cps_elemCompound>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 28
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
 (func $~lib/array/Array<async-await-position/__Cps_elemAssign>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 24
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
 (func $~lib/array/Array<async-await-position/__Cps_doCond>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 38
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
 (func $~lib/array/Array<async-await-position/__Cps_compoundStr>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
 (func $~lib/array/Array<async-await-position/__Cps_compoundRhs>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 54
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
 (func $~lib/array/Array<async-await-position/__Cps_compoundNum>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 14
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
 (func $~lib/array/Array<async-await-position/__Cps_callArgs>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 42
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
 (func $~lib/array/Array<async-await-position/__Cps_binaryStr>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 46
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
 (func $~lib/array/Array<async-await-position/__Cps_binaryOp>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 44
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
 (func $~lib/array/Array<async-await-position/__Cps_assignRhsField>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 56
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
 (func $~lib/array/Array<async-await-position/__Cps_arrayLit>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 68
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
 (func $~lib/array/Array<async-await-position/__Cps_andLeft>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 60
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
 (func $~lib/array/Array<async-await-position/__Cps_W_setField>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 72
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
 (func $~lib/array/Array<async-await-position/__Cps_W_checkFlag>#splice (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  i32.const 74
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
 (func $async-await-position/__Cps_whileCond#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  block $folding-inner0
   loop $while-continue|0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
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
              local.get $1
              i32.const 1027
              i32.eq
              br_if $case6|1
              local.get $1
              i32.const 1028
              i32.eq
              br_if $case7|1
              local.get $1
              i32.const 1029
              i32.eq
              br_if $case8|1
              br $case9|1
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
           i32.const 1029
           i32.store
           br $while-continue|0
          end
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1552
          i32.store offset=20
          local.get $0
          i32.const 1552
          i32.const 0
          call $~lib/rt/itcms/__link
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store offset=24
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
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.load offset=20
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
         global.get $async-await-position/__async_roots_whileCond
         local.tee $1
         i32.store
         global.get $~lib/memory/__stack_pointer
         global.get $async-await-position/__async_roots_whileCond
         local.tee $2
         i32.store offset=4
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store offset=8
         local.get $1
         local.get $2
         local.get $0
         call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
         call $~lib/array/Array<async-await-position/__Cps_whileCond>#splice
         global.get $~lib/memory/__stack_pointer
         i32.const 20
         i32.add
         global.set $~lib/memory/__stack_pointer
         i32.const 1
         return
        end
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.load offset=24
        call $async-await-position/getFlag
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
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=20
       local.tee $1
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
       i32.load offset=24
       call $async-await-position/getChunk
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
      i32.load8_u offset=12
      i32.store8 offset=28
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
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=32
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
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
     i32.store offset=20
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     i32.load offset=24
     i32.const 1
     i32.add
     i32.store offset=24
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const 1026
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
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_returnAssign#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
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
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1552
       i32.store offset=20
       local.get $0
       i32.const 1552
       i32.const 0
       call $~lib/rt/itcms/__link
       i32.const 0
       call $async-await-position/getChunk
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
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=12
      local.tee $1
      i32.store offset=4
      local.get $0
      local.get $1
      i32.store offset=24
      local.get $0
      local.get $1
      i32.const 0
      call $~lib/rt/itcms/__link
      i32.const 1
      call $async-await-position/getChunk
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
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=28
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=24
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=28
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
     i32.store offset=20
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
     i32.load offset=20
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
     global.get $async-await-position/__async_roots_returnAssign
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_returnAssign
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_returnAssign>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 20
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
   i32.const 20
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_mixedCompound#step (param $0 i32) (result i32)
  (local $1 f64)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       f64.const 1.5
       f64.store offset=32
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       local.get $0
       local.get $0
       f64.load offset=32
       f64.store offset=40
       i32.const 2
       call $async-await-position/getNum
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
      f64.load offset=40
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      local.get $1
      local.get $0
      i32.load offset=20
      f64.convert_i32_s
      f64.add
      f64.store offset=32
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      local.get $0
      f64.load offset=32
      f64.store offset=48
      i32.const 3
      call $async-await-position/getNum
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
     f64.load offset=48
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $1
     local.get $0
     i32.load offset=24
     f64.convert_i32_s
     f64.mul
     f64.store offset=32
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     f64.load offset=32
     f64.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_mixedCompound
     local.tee $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_mixedCompound
     local.tee $3
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $2
     local.get $3
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_mixedCompound>#splice
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
 (func $async-await-position/__Cps_ifCondInTry#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
                       i32.store8 offset=13
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=14
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 0
                       i32.store8 offset=15
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1552
                       i32.store offset=16
                       local.get $0
                       i32.const 1552
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
                       i32.store8 offset=28
                       global.get $~lib/memory/__stack_pointer
                       local.get $0
                       i32.store
                       local.get $0
                       i32.const 1552
                       i32.store offset=32
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
                      i32.load8_u offset=28
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
                     i32.const 1027
                     i32.store
                     br $while-continue|0
                    end
                    i32.const 0
                    call $async-await-position/getFlag
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
                   i32.load8_u offset=12
                   i32.store8 offset=36
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
                  i32.load8_u offset=28
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=13
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=14
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=15
                  end
                  if (result i32)
                   i32.const 1
                  else
                   global.get $~lib/memory/__stack_pointer
                   local.get $0
                   i32.store
                   local.get $0
                   i32.load8_u offset=20
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
                 i32.const 0
                 i32.store8 offset=13
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 0
                 i32.store8 offset=14
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 0
                 i32.store8 offset=15
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 3680
                 i32.store offset=24
                 local.get $0
                 i32.const 3680
                 i32.const 0
                 call $~lib/rt/itcms/__link
                 global.get $~lib/memory/__stack_pointer
                 local.get $0
                 i32.store
                 local.get $0
                 i32.const 1
                 i32.store8 offset=13
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
                  i32.load8_u offset=13
                 end
                 if (result i32)
                  i32.const 1
                 else
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.load8_u offset=14
                 end
                 if (result i32)
                  i32.const 1
                 else
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.load8_u offset=15
                 end
                 if (result i32)
                  i32.const 1
                 else
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.load8_u offset=20
                 end
                 if
                  global.get $~lib/memory/__stack_pointer
                  local.get $0
                  i32.store
                  local.get $0
                  i32.const 1031
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
                i32.const 1025
                i32.store
                br $while-continue|0
               end
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 0
               i32.store8 offset=13
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 0
               i32.store8 offset=14
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 0
               i32.store8 offset=15
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 3648
               i32.store offset=24
               local.get $0
               i32.const 3648
               i32.const 0
               call $~lib/rt/itcms/__link
               global.get $~lib/memory/__stack_pointer
               local.get $0
               i32.store
               local.get $0
               i32.const 1
               i32.store8 offset=13
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
                i32.load8_u offset=13
               end
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=14
               end
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=15
               end
               if (result i32)
                i32.const 1
               else
                global.get $~lib/memory/__stack_pointer
                local.get $0
                i32.store
                local.get $0
                i32.load8_u offset=20
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
           i32.load8_u offset=28
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
          i32.store8 offset=28
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
          i32.store offset=40
          local.get $0
          local.get $1
          i32.const 0
          call $~lib/rt/itcms/__link
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=13
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=14
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store8 offset=15
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 3744
          i32.store offset=24
          local.get $0
          i32.const 3744
          i32.const 0
          call $~lib/rt/itcms/__link
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1
          i32.store8 offset=13
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1036
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
         i32.load offset=32
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
       i32.store8 offset=20
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
       br $folding-inner0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load8_u offset=13
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
     i32.store8 offset=13
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
     global.get $async-await-position/__async_roots_ifCondInTry
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_ifCondInTry
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_ifCondInTry>#splice
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
  global.get $async-await-position/__async_roots_ifCondInTry
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_ifCondInTry
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
  call $~lib/array/Array<async-await-position/__Cps_ifCondInTry>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 2
 )
 (func $async-await-position/__Cps_forIncr#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  block $folding-inner0
   loop $while-continue|0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
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
               local.get $1
               i32.const 1027
               i32.eq
               br_if $case6|1
               local.get $1
               i32.const 1028
               i32.eq
               br_if $case7|1
               local.get $1
               i32.const 1029
               i32.eq
               br_if $case8|1
               local.get $1
               i32.const 1030
               i32.eq
               br_if $case9|1
               br $case10|1
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
             i32.const 1029
             i32.store
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
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.const 1552
           i32.store offset=20
           local.get $0
           i32.const 1552
           i32.const 0
           call $~lib/rt/itcms/__link
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.const 0
           i32.store offset=24
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
          i32.store offset=8
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.load offset=20
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
          global.get $async-await-position/__async_roots_forIncr
          local.tee $1
          i32.store
          global.get $~lib/memory/__stack_pointer
          global.get $async-await-position/__async_roots_forIncr
          local.tee $2
          i32.store offset=4
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store offset=8
          local.get $1
          local.get $2
          local.get $0
          call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
          call $~lib/array/Array<async-await-position/__Cps_forIncr>#splice
          global.get $~lib/memory/__stack_pointer
          i32.const 20
          i32.add
          global.set $~lib/memory/__stack_pointer
          i32.const 1
          return
         end
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.load offset=24
         i32.const 2
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
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store offset=8
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.load offset=20
        local.tee $1
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
        i32.load offset=24
        call $async-await-position/getChunk
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
       i32.load offset=24
       i32.store offset=28
       i32.const 1
       call $async-await-position/getNum
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
      i32.load offset=28
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      local.get $1
      local.get $0
      i32.load offset=12
      i32.add
      i32.store offset=24
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
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=32
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
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
     i32.store offset=20
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
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
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_forCond#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  block $folding-inner0
   loop $while-continue|0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
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
               local.get $1
               i32.const 1027
               i32.eq
               br_if $case6|1
               local.get $1
               i32.const 1028
               i32.eq
               br_if $case7|1
               local.get $1
               i32.const 1029
               i32.eq
               br_if $case8|1
               local.get $1
               i32.const 1030
               i32.eq
               br_if $case9|1
               br $case10|1
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
             i32.const 1029
             i32.store
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
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.const 1552
           i32.store offset=20
           local.get $0
           i32.const 1552
           i32.const 0
           call $~lib/rt/itcms/__link
           global.get $~lib/memory/__stack_pointer
           local.get $0
           i32.store
           local.get $0
           i32.const 0
           i32.store offset=24
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
          i32.store offset=8
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.load offset=20
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
          global.get $async-await-position/__async_roots_forCond
          local.tee $1
          i32.store
          global.get $~lib/memory/__stack_pointer
          global.get $async-await-position/__async_roots_forCond
          local.tee $2
          i32.store offset=4
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store offset=8
          local.get $1
          local.get $2
          local.get $0
          call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
          call $~lib/array/Array<async-await-position/__Cps_forCond>#splice
          global.get $~lib/memory/__stack_pointer
          i32.const 20
          i32.add
          global.set $~lib/memory/__stack_pointer
          i32.const 1
          return
         end
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store
         local.get $0
         i32.load offset=24
         call $async-await-position/getFlag
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
        i32.store offset=8
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.load offset=20
        local.tee $1
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
        i32.load offset=24
        call $async-await-position/getChunk
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
       i32.load offset=24
       i32.const 1
       i32.add
       i32.store offset=24
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
      i32.store offset=4
      local.get $0
      local.get $0
      i32.load8_u offset=12
      i32.store8 offset=28
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
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=32
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
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
     i32.store offset=20
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
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
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_fieldCompound#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
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
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       call $async-await-position/W#constructor
       local.set $1
       global.get $~lib/memory/__stack_pointer
       local.get $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=20
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=20
       local.tee $1
       i32.store
       local.get $1
       i32.const 3360
       i32.store
       local.get $1
       i32.const 3360
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
       i32.load offset=20
       local.tee $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=24
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=12
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=24
       local.tee $1
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $1
       i32.load
       local.tee $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=28
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       i32.const 0
       call $async-await-position/getChunk
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
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=24
      local.tee $2
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=28
      local.tee $1
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=12
      local.tee $3
      i32.store offset=12
      local.get $1
      local.get $3
      call $~lib/string/String.__concat
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      local.get $2
      local.get $1
      i32.store
      local.get $2
      local.get $1
      i32.const 0
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=20
      local.tee $1
      i32.store
      local.get $1
      i32.const 1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=20
      local.tee $1
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
      i32.load offset=4
      i32.store offset=36
      i32.const 4
      call $async-await-position/getNum
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
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=32
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     i32.load offset=36
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $1
     local.get $2
     local.get $0
     i32.load offset=16
     i32.add
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $1
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.load
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $2
     i32.store offset=16
     local.get $2
     i32.load offset=4
     call $~lib/number/I32#toString
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
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
     global.get $async-await-position/__async_roots_fieldCompound
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_fieldCompound
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_fieldCompound>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 24
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
   i32.const 24
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_fieldAssign#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
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
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       call $async-await-position/W#constructor
       local.set $1
       global.get $~lib/memory/__stack_pointer
       local.get $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=20
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
       i32.load offset=20
       local.tee $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=24
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       i32.const 2
       call $async-await-position/getChunk
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
      i32.store offset=8
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
      i32.load offset=12
      local.tee $2
      i32.store offset=4
      local.get $1
      local.get $2
      i32.store
      local.get $1
      local.get $2
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
      i32.load offset=20
      local.tee $1
      i32.store offset=4
      local.get $0
      local.get $1
      i32.store offset=28
      local.get $0
      local.get $1
      i32.const 0
      call $~lib/rt/itcms/__link
      i32.const 5
      call $async-await-position/getNum
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
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=28
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $1
     local.get $0
     i32.load offset=16
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $1
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.load
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $2
     i32.store offset=16
     local.get $2
     i32.load offset=4
     call $~lib/number/I32#toString
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
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
     global.get $async-await-position/__async_roots_fieldAssign
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_fieldAssign
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_fieldAssign>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 24
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
   i32.const 24
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_elemAssign#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 32
  memory.fill
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
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       i32.const 2
       call $~lib/array/Array<~lib/string/String>#constructor
       local.set $1
       global.get $~lib/memory/__stack_pointer
       local.get $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=20
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 0
       i32.store offset=24
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.load offset=20
       local.tee $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=28
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       local.get $0
       local.get $0
       i32.load offset=24
       local.tee $1
       i32.const 1
       i32.add
       i32.store offset=24
       local.get $0
       local.get $1
       i32.store offset=32
       i32.const 0
       call $async-await-position/getChunk
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
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=28
      local.tee $1
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=8
      local.get $0
      i32.load offset=32
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=12
      local.tee $3
      i32.store offset=4
      local.get $1
      local.get $2
      local.get $3
      call $~lib/array/Array<~lib/string/String>#__set
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=20
      local.tee $1
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
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      local.get $0
      i32.load offset=24
      i32.store offset=40
      i32.const 1
      call $async-await-position/getChunk
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
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=36
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $0
     i32.load offset=40
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $3
     i32.store offset=4
     local.get $1
     local.get $2
     local.get $3
     call $~lib/array/Array<~lib/string/String>#__set
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $1
     i32.store offset=24
     local.get $1
     i32.const 0
     call $~lib/array/Array<~lib/string/String>#__get
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $2
     i32.store offset=24
     local.get $2
     i32.const 1
     call $~lib/array/Array<~lib/string/String>#__get
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=20
     local.get $1
     local.get $2
     call $~lib/string/String.__concat
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     local.get $0
     i32.load offset=24
     call $~lib/number/I32#toString
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
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
     global.get $async-await-position/__async_roots_elemAssign
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_elemAssign
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_elemAssign>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 32
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
   i32.const 32
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_doCond#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  block $folding-inner0
   loop $while-continue|0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
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
              local.get $1
              i32.const 1027
              i32.eq
              br_if $case6|1
              local.get $1
              i32.const 1028
              i32.eq
              br_if $case7|1
              local.get $1
              i32.const 1029
              i32.eq
              br_if $case8|1
              br $case9|1
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
           i32.const 1029
           i32.store
           br $while-continue|0
          end
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 1552
          i32.store offset=20
          local.get $0
          i32.const 1552
          i32.const 0
          call $~lib/rt/itcms/__link
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.const 0
          i32.store offset=24
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
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.load offset=20
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
         global.get $async-await-position/__async_roots_doCond
         local.tee $1
         i32.store
         global.get $~lib/memory/__stack_pointer
         global.get $async-await-position/__async_roots_doCond
         local.tee $2
         i32.store offset=4
         global.get $~lib/memory/__stack_pointer
         local.get $0
         i32.store offset=8
         local.get $1
         local.get $2
         local.get $0
         call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
         call $~lib/array/Array<async-await-position/__Cps_doCond>#splice
         global.get $~lib/memory/__stack_pointer
         i32.const 20
         i32.add
         global.set $~lib/memory/__stack_pointer
         i32.const 1
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
        i32.load offset=20
        local.tee $1
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
        i32.load offset=24
        call $async-await-position/getChunk
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
       local.get $0
       i32.load offset=24
       call $async-await-position/getFlag
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
      i32.load8_u offset=12
      i32.store8 offset=28
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
       i32.const 1026
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
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=32
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
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
     i32.store offset=20
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     i32.load offset=24
     i32.const 1
     i32.add
     i32.store offset=24
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const 1027
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
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_compoundStr#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
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
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.const 1552
       i32.store offset=20
       local.get $0
       i32.const 1552
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
       i32.load offset=20
       local.tee $1
       i32.store offset=4
       local.get $0
       local.get $1
       i32.store offset=24
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       i32.const 0
       call $async-await-position/getChunk
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
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=24
      local.tee $1
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=12
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
      i32.store offset=20
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
      i32.load offset=20
      local.tee $1
      i32.store offset=4
      local.get $0
      local.get $1
      i32.store offset=28
      local.get $0
      local.get $1
      i32.const 0
      call $~lib/rt/itcms/__link
      i32.const 1
      call $async-await-position/getChunk
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
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=28
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
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
     i32.store offset=20
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
     i32.load offset=20
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
     global.get $async-await-position/__async_roots_compoundStr
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_compoundStr
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 20
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
   i32.const 20
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_callArgs#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
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
       i32.const 0
       call $async-await-position/getChunk
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
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=12
      local.tee $1
      i32.store offset=4
      local.get $0
      local.get $1
      i32.store offset=20
      local.get $0
      local.get $1
      i32.const 0
      call $~lib/rt/itcms/__link
      i32.const 1
      call $async-await-position/getChunk
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
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=24
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=24
     local.tee $2
     i32.store offset=12
     local.get $1
     local.get $2
     call $async-await-position/combine
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
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
     global.get $async-await-position/__async_roots_callArgs
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_callArgs
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_callArgs>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 20
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
   i32.const 20
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_binaryStr#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
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
       i32.const 0
       call $async-await-position/getChunk
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
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=12
      local.tee $1
      i32.store offset=4
      local.get $0
      local.get $1
      i32.store offset=20
      local.get $0
      local.get $1
      i32.const 0
      call $~lib/rt/itcms/__link
      i32.const 1
      call $async-await-position/getChunk
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
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=24
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=24
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
     global.get $async-await-position/__async_roots_binaryStr
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_binaryStr
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_binaryStr>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 20
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
   i32.const 20
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_binaryOp#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
       i32.const 2
       call $async-await-position/getNum
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
      i32.store offset=20
      i32.const 3
      call $async-await-position/getNum
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
     i32.store offset=24
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     i32.load offset=20
     i32.const 1
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
     global.get $async-await-position/__async_roots_binaryOp
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_binaryOp
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_binaryOp>#splice
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
 (func $async-await-position/__Cps_arrayLit#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
       i32.const 1
       call $async-await-position/getNum
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
      i32.const 2
      call $async-await-position/getNum
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
     i32.const 2
     i32.const 9
     call $~lib/rt/__newArray
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=12
     local.get $1
     i32.const 0
     local.get $0
     i32.load offset=24
     call $~lib/array/Array<i32>#__set
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=12
     local.get $1
     i32.const 1
     local.get $0
     i32.load offset=28
     call $~lib/array/Array<i32>#__set
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=20
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $1
     i32.store offset=4
     local.get $1
     i32.const 0
     call $~lib/array/Array<i32>#__get
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $2
     i32.store offset=4
     local.get $0
     local.get $2
     i32.const 1
     call $~lib/array/Array<i32>#__get
     local.get $1
     i32.add
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const -1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_arrayLit
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_arrayLit
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=12
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_arrayLit>#splice
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
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $async-await-position/__Cps_W_setField#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
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
       i32.store offset=28
       local.get $0
       local.get $1
       i32.const 0
       call $~lib/rt/itcms/__link
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.load offset=20
       call $async-await-position/getChunk
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
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=28
      local.tee $1
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=12
      local.tee $2
      i32.store offset=4
      local.get $1
      local.get $2
      i32.store
      local.get $1
      local.get $2
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
      i32.load offset=24
      local.tee $1
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
      i32.load offset=4
      i32.store offset=36
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load offset=20
      call $async-await-position/getNum
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
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=32
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     i32.load offset=36
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $1
     local.get $2
     local.get $0
     i32.load offset=16
     i32.add
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=24
     local.tee $1
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.load
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=24
     local.tee $2
     i32.store offset=16
     local.get $2
     i32.load offset=4
     call $~lib/number/I32#toString
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
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
     global.get $async-await-position/__async_roots_W_setField
     local.tee $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     global.get $async-await-position/__async_roots_W_setField
     local.tee $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $1
     local.get $2
     local.get $0
     call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
     call $~lib/array/Array<async-await-position/__Cps_W_setField>#splice
     global.get $~lib/memory/__stack_pointer
     i32.const 24
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
   i32.const 24
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $~lib/string/String#concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  local.tee $3
  local.get $2
  i32.add
  local.tee $4
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 1552
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $4
  i32.store offset=4
  local.get $4
  local.get $0
  local.get $2
  memory.copy
  local.get $2
  local.get $4
  i32.add
  local.get $1
  local.get $3
  memory.copy
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
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
  i32.const 36976
  i32.const 0
  i32.store
  i32.const 38544
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
    i32.const 36976
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
      i32.const 36976
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
  i32.const 36976
  i32.const 38548
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 36976
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
  i32.const 3392
  call $~lib/rt/itcms/__visit
  i32.const 1152
  call $~lib/rt/itcms/__visit
  i32.const 2208
  call $~lib/rt/itcms/__visit
  i32.const 3264
  call $~lib/rt/itcms/__visit
  global.get $async-await-position/__async_roots_compoundStr
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_compoundNum
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_mixedCompound
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_fieldAssign
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_fieldCompound
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_recvCall
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_elemAssign
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_indexOrder
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_elemCompound
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_storedField
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_ifCond
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_whileCond
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_forCond
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_doCond
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_forIncr
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_callArgs
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_binaryOp
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_binaryStr
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_varInitCall
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_varInitBinary
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_returnAssign
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_compoundRhs
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_assignRhsField
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_ternaryCond
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_andLeft
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_storedArg
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_ifCondInTry
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_unaryOp
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_arrayLit
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_templateLit
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_W_setField
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $async-await-position/__async_roots_W_checkFlag
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
 (func $export:async-await-position/__async_async_await_position_whileCond_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_whileCond
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_whileCond
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_whileCond>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_returnAssign_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_returnAssign
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_returnAssign
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_returnAssign>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_mixedCompound_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=16
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
   global.get $async-await-position/__async_roots_mixedCompound
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_mixedCompound
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_mixedCompound>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_forIncr_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_forIncr
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_forIncr
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_forIncr>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_forCond_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_forCond
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_forCond
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_forCond>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_fieldCompound_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_fieldCompound
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_fieldCompound
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_fieldCompound>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_fieldAssign_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_fieldAssign
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_fieldAssign
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_fieldAssign>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_elemAssign_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_elemAssign
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_elemAssign
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_elemAssign>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_doCond_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_doCond
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_doCond
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_doCond>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundStr_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_compoundStr
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_compoundStr
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_callArgs_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_callArgs
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_callArgs
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_callArgs>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_binaryStr_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_binaryStr
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_binaryStr
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_binaryStr>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_binaryOp_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_binaryOp
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_binaryOp
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_binaryOp>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_arrayLit_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_arrayLit
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_arrayLit
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_arrayLit>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_W_setField_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_W_setField
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_W_setField
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_W_setField>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/__Cps_varInitCall#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     i32.const 0
     call $async-await-position/getChunk
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
    i32.store offset=20
    local.get $0
    local.get $1
    i32.const 0
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=20
    local.tee $1
    i32.store offset=8
    local.get $1
    i32.const 3712
    call $async-await-position/combine
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=4
    local.get $0
    local.get $1
    i32.store offset=16
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
    i32.load offset=16
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
    global.get $async-await-position/__async_roots_varInitCall
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_varInitCall
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_varInitCall>#splice
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
 )
 (func $async-await-position/__Cps_varInitBinary#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     i32.const 2
     call $async-await-position/getNum
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
    i32.store offset=4
    local.get $0
    local.get $0
    i32.load offset=20
    i32.const 1
    i32.add
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $0
    i32.load offset=16
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_varInitBinary
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_varInitBinary
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_varInitBinary>#splice
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
 (func $async-await-position/__Cps_unaryOp#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     i32.const 1
     call $async-await-position/getNum
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
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    i32.const 0
    local.get $0
    i32.load offset=16
    i32.sub
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_unaryOp
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_unaryOp
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_unaryOp>#splice
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
 (func $async-await-position/__Cps_ternaryCond#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     i32.const 0
     call $async-await-position/getFlag
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
    i32.load8_u offset=12
    i32.store8 offset=13
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    i32.const 3680
    i32.const 3648
    local.get $0
    i32.load8_u offset=13
    select
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
    global.get $async-await-position/__async_roots_ternaryCond
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_ternaryCond
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_ternaryCond>#splice
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
 (func $async-await-position/__Cps_templateLit#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     i32.const 0
     call $async-await-position/getChunk
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
    i32.store offset=16
    local.get $0
    local.get $1
    i32.const 0
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $1
    i32.store offset=8
    local.get $1
    i32.const 3712
    call $~lib/string/String#concat
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $1
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
    global.get $async-await-position/__async_roots_templateLit
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_templateLit
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_templateLit>#splice
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
 )
 (func $async-await-position/__Cps_storedField#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     call $async-await-position/W#constructor
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=16
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 3
     call $async-await-position/getChunk
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=20
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
     i32.load offset=16
     local.tee $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=24
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.load offset=20
     call $~lib/promise/__async_wait
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
    i32.store offset=8
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
    i32.load offset=12
    local.tee $2
    i32.store offset=4
    local.get $1
    local.get $2
    i32.store
    local.get $1
    local.get $2
    i32.const 0
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $1
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.load
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
    global.get $async-await-position/__async_roots_storedField
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_storedField
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_storedField>#splice
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
 )
 (func $async-await-position/__Cps_storedArg#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     i32.const 0
     call $async-await-position/getChunk
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=16
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.load offset=16
     call $~lib/promise/__async_wait
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
    i32.store offset=20
    local.get $0
    local.get $1
    i32.const 0
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=20
    local.tee $1
    i32.store offset=8
    local.get $1
    i32.const 3712
    call $async-await-position/combine
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $1
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
    global.get $async-await-position/__async_roots_storedArg
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_storedArg
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_storedArg>#splice
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
 )
 (func $async-await-position/__Cps_recvCall#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     call $async-await-position/W#constructor
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=16
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=20
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     i32.const 0
     call $async-await-position/getChunk
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
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=20
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=12
    local.tee $2
    i32.store offset=4
    local.get $1
    local.get $2
    i32.store
    local.get $1
    local.get $2
    i32.const 0
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $1
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.load
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
    global.get $async-await-position/__async_roots_recvCall
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_recvCall
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_recvCall>#splice
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
 )
 (func $async-await-position/__Cps_indexOrder#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 2
     call $~lib/array/Array<~lib/string/String>#constructor
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=16
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const 0
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
     local.get $0
     local.get $1
     i32.store offset=24
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $0
     local.get $0
     i32.load offset=20
     local.tee $1
     i32.const 1
     i32.add
     i32.store offset=20
     local.get $0
     local.get $1
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.load offset=20
     call $async-await-position/getChunk
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
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=24
    local.tee $2
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $0
    i32.load offset=28
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=12
    local.tee $1
    i32.store offset=4
    local.get $2
    local.get $3
    local.get $1
    call $~lib/array/Array<~lib/string/String>#__set
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $0
    i32.load offset=20
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_indexOrder
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_indexOrder
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_indexOrder>#splice
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
 (func $async-await-position/__Cps_ifCond#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
        i32.const 0
        call $async-await-position/getFlag
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
       i32.load8_u offset=12
       i32.store8 offset=13
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.load8_u offset=13
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
        i32.const 1026
        i32.store
       end
       br $while-continue|0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 3648
      local.set $1
      local.get $0
      i32.const 3648
      i32.store offset=4
      br $folding-inner0
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 3680
     local.set $1
     local.get $0
     i32.const 3680
     i32.store offset=4
     br $folding-inner0
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
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const -1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_ifCond
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_ifCond
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
  call $~lib/array/Array<async-await-position/__Cps_ifCond>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 1
 )
 (func $async-await-position/__Cps_elemCompound#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 1
     call $~lib/array/Array<i32>#constructor
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=16
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $1
     i32.store
     local.get $1
     i32.const 0
     i32.const 100
     call $~lib/array/Array<i32>#__set
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
     local.get $1
     i32.store offset=20
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const 0
     i32.store offset=24
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=20
     local.tee $1
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $0
     local.get $1
     local.get $0
     i32.load offset=24
     call $~lib/array/Array<i32>#__get
     i32.store offset=28
     i32.const 5
     call $async-await-position/getNum
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
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=20
    local.tee $2
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
    i32.load offset=28
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $2
    local.get $1
    local.get $3
    local.get $0
    i32.load offset=12
    i32.add
    call $~lib/array/Array<i32>#__set
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
    local.get $1
    i32.const 0
    call $~lib/array/Array<i32>#__get
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_elemCompound
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_elemCompound
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_elemCompound>#splice
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
 (func $async-await-position/__Cps_compoundStr~visit (param $0 i32)
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
  i32.load offset=16
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=20
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=24
  call $~lib/rt/itcms/__visit
  local.get $0
  i32.load offset=28
  call $~lib/rt/itcms/__visit
 )
 (func $async-await-position/__Cps_compoundRhs#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $0
     i32.load offset=16
     i32.store offset=20
     i32.const 2
     call $async-await-position/getNum
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
    i32.load offset=24
    i32.const 1
    i32.add
    i32.add
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $0
    i32.load offset=16
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const -1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_compoundRhs
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_compoundRhs
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_compoundRhs>#splice
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
 (func $async-await-position/__Cps_assignRhsField#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
     call $async-await-position/W#constructor
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=16
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
     i32.load offset=16
     local.tee $1
     i32.store offset=4
     local.get $0
     local.get $1
     i32.store offset=20
     local.get $0
     local.get $1
     i32.const 0
     call $~lib/rt/itcms/__link
     i32.const 0
     call $async-await-position/getChunk
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
    i32.store offset=24
    local.get $0
    local.get $1
    i32.const 0
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=20
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=24
    local.tee $2
    i32.store offset=8
    local.get $2
    i32.const 3712
    call $~lib/string/String.__concat
    local.set $2
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store offset=4
    local.get $1
    local.get $2
    i32.store
    local.get $1
    local.get $2
    i32.const 0
    call $~lib/rt/itcms/__link
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=16
    local.tee $1
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.load
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
    global.get $async-await-position/__async_roots_assignRhsField
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_assignRhsField
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_assignRhsField>#splice
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
 )
 (func $async-await-position/__Cps_andLeft#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
        i32.const 0
        call $async-await-position/getFlag
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
       i32.load8_u offset=12
       i32.store8 offset=13
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.load8_u offset=13
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
        i32.const 1026
        i32.store
       end
       br $while-continue|0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 3648
      local.set $1
      local.get $0
      i32.const 3648
      i32.store offset=4
      br $folding-inner0
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 3680
     local.set $1
     local.get $0
     i32.const 3680
     i32.store offset=4
     br $folding-inner0
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
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const -1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_andLeft
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_andLeft
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
  call $~lib/array/Array<async-await-position/__Cps_andLeft>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 1
 )
 (func $async-await-position/__Cps_W_checkFlag#step (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
        i32.load offset=16
        call $async-await-position/getFlag
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
       i32.load8_u offset=12
       i32.store8 offset=24
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       i32.load8_u offset=24
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
        i32.const 1026
        i32.store
       end
       br $while-continue|0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      i32.const 3648
      local.set $1
      local.get $0
      i32.const 3648
      i32.store offset=4
      br $folding-inner0
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     i32.const 3680
     local.set $1
     local.get $0
     i32.const 3680
     i32.store offset=4
     br $folding-inner0
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
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const -1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_W_checkFlag
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_W_checkFlag
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
  call $~lib/array/Array<async-await-position/__Cps_W_checkFlag>#splice
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 1
 )
 (func $async-await-position/W#setField (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 40
   i32.const 71
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
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=32
   local.get $2
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=36
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
   global.get $async-await-position/__async_roots_W_setField
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $0
   local.get $2
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $async-await-position/__Cps_W_setField#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/W#checkFlag (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 25
   i32.const 73
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
   i32.const 1552
   i32.store offset=4
   local.get $3
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 1552
   i32.store offset=8
   local.get $3
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   i32.const 0
   i32.store8 offset=12
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
   i32.store8 offset=24
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
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $3
   local.get $0
   i32.store offset=20
   local.get $3
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_W_checkFlag
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=8
   local.get $0
   local.get $3
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   local.get $3
   call $async-await-position/__Cps_W_checkFlag#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $~start
  call $start:async-await-position
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
      i32.const 36976
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
    i32.const 36976
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
     i32.const 36976
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
 (func $start:async-await-position
  (local $0 i32)
  (local $1 i32)
  memory.size
  i32.const 16
  i32.shl
  i32.const 36976
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
   i32.const 4208
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
   global.set $async-await-position/__async_roots_compoundStr
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 14
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
   global.set $async-await-position/__async_roots_compoundNum
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   global.set $async-await-position/__async_roots_mixedCompound
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   global.set $async-await-position/__async_roots_fieldAssign
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   global.set $async-await-position/__async_roots_fieldCompound
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 22
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
   global.set $async-await-position/__async_roots_recvCall
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 24
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
   global.set $async-await-position/__async_roots_elemAssign
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 26
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
   global.set $async-await-position/__async_roots_indexOrder
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 28
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
   global.set $async-await-position/__async_roots_elemCompound
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 30
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
   global.set $async-await-position/__async_roots_storedField
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 32
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
   global.set $async-await-position/__async_roots_ifCond
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 34
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
   global.set $async-await-position/__async_roots_whileCond
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 36
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
   global.set $async-await-position/__async_roots_forCond
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 38
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
   global.set $async-await-position/__async_roots_doCond
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 40
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
   global.set $async-await-position/__async_roots_forIncr
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 42
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
   global.set $async-await-position/__async_roots_callArgs
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 44
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
   global.set $async-await-position/__async_roots_binaryOp
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 46
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
   global.set $async-await-position/__async_roots_binaryStr
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 48
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
   global.set $async-await-position/__async_roots_varInitCall
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 50
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
   global.set $async-await-position/__async_roots_varInitBinary
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 52
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
   global.set $async-await-position/__async_roots_returnAssign
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 54
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
   global.set $async-await-position/__async_roots_compoundRhs
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 56
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
   global.set $async-await-position/__async_roots_assignRhsField
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 58
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
   global.set $async-await-position/__async_roots_ternaryCond
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 60
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
   global.set $async-await-position/__async_roots_andLeft
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 62
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
   global.set $async-await-position/__async_roots_storedArg
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 64
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
   global.set $async-await-position/__async_roots_ifCondInTry
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 66
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
   global.set $async-await-position/__async_roots_unaryOp
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 68
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
   global.set $async-await-position/__async_roots_arrayLit
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 70
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
   global.set $async-await-position/__async_roots_templateLit
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 72
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
   global.set $async-await-position/__async_roots_W_setField
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 74
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
   global.set $async-await-position/__async_roots_W_checkFlag
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/getW (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:async-await-position/combine (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $async-await-position/combine
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:async-await-position/__async_async_await_position_whileCond_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=16
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_whileCond#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_whileCond_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_whileCond#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_whileCond_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_whileCond
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_whileCond
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_whileCond>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_varInitCall_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_varInitCall#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_varInitCall_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_varInitCall
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_varInitCall
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_varInitCall>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_varInitCall_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_varInitCall
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_varInitCall
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_varInitCall>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_varInitBinary_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_varInitBinary#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_varInitBinary_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_varInitBinary
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_varInitBinary
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_varInitBinary>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_varInitBinary_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_varInitBinary
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_varInitBinary
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_varInitBinary>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_unaryOp_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_unaryOp#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_unaryOp_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_unaryOp
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_unaryOp
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_unaryOp>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_unaryOp_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_unaryOp
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_unaryOp
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_unaryOp>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_ternaryCond_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_ternaryCond#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_ternaryCond_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_ternaryCond
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_ternaryCond
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_ternaryCond>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_ternaryCond_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_ternaryCond
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_ternaryCond
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_ternaryCond>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_templateLit_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_templateLit#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_templateLit_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_templateLit
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_templateLit
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_templateLit>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_templateLit_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_templateLit
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_templateLit
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_templateLit>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_storedField_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_storedField#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_storedField_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_storedField
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_storedField
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_storedField>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_storedField_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_storedField
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_storedField
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_storedField>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_storedArg_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_storedArg#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_storedArg_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_storedArg
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_storedArg
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_storedArg>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_storedArg_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_storedArg
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_storedArg
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_storedArg>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_returnAssign_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=16
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_returnAssign#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_returnAssign_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_returnAssign#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_returnAssign_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_returnAssign
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_returnAssign
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_returnAssign>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_recvCall_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_recvCall#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_recvCall_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_recvCall
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_recvCall
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_recvCall>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_recvCall_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_recvCall
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_recvCall
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_recvCall>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_mixedCompound_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_mixedCompound#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_mixedCompound_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_mixedCompound#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_mixedCompound_result (param $0 i32) (result f64)
  (local $1 f64)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   f64.load offset=8
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_mixedCompound_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_mixedCompound
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_mixedCompound
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_mixedCompound>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_mixedCompound_error (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=16
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_indexOrder_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_indexOrder#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_indexOrder_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_indexOrder
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_indexOrder
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_indexOrder>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_indexOrder_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_indexOrder
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_indexOrder
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_indexOrder>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_ifCond_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_ifCond#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_ifCond_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_ifCond
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_ifCond
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_ifCond>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_ifCond_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_ifCond
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_ifCond
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_ifCond>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_ifCondInTry_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_ifCondInTry#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_ifCondInTry_reject_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store8 offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
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
   call $async-await-position/__Cps_ifCondInTry#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_ifCondInTry_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_ifCondInTry
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_ifCondInTry
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_ifCondInTry>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_forIncr_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=16
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_forIncr#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_forIncr_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_forIncr#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_forIncr_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_forIncr
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_forIncr
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_forIncr>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_forCond_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=16
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_forCond#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_forCond_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_forCond#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_forCond_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_forCond
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_forCond
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_forCond>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_fieldCompound_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_fieldCompound#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_fieldCompound_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_fieldCompound#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_fieldCompound_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_fieldCompound
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_fieldCompound
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_fieldCompound>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_fieldAssign_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_fieldAssign#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_fieldAssign_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_fieldAssign#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_fieldAssign_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_fieldAssign
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_fieldAssign
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_fieldAssign>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_elemCompound_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_elemCompound#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_elemCompound_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_elemCompound
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_elemCompound
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_elemCompound>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_elemCompound_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_elemCompound
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_elemCompound
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_elemCompound>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_elemAssign_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=16
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_elemAssign#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_elemAssign_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_elemAssign#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_elemAssign_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_elemAssign
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_elemAssign
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_elemAssign>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_doCond_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=16
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_doCond#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_doCond_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_doCond#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_doCond_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_doCond
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_doCond
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_doCond>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundStr_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=16
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_compoundStr#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundStr_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_compoundStr#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundStr_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_compoundStr
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_compoundStr
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundRhs_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_compoundRhs#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundRhs_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_compoundRhs
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_compoundRhs
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_compoundRhs>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundRhs_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_compoundRhs
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_compoundRhs
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_compoundRhs>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_resume_9 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=48
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_compoundNum#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_resume_8 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=44
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_compoundNum#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_resume_7 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=40
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_compoundNum#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_resume_6 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_compoundNum#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_resume_5 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_compoundNum#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_resume_4 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_compoundNum#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_resume_3 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_compoundNum#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_resume_2 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_compoundNum#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_compoundNum#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_compoundNum#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_compoundNum_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_compoundNum
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_compoundNum
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_compoundNum>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_callArgs_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=16
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_callArgs#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_callArgs_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_callArgs#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_callArgs_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_callArgs
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_callArgs
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_callArgs>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_binaryStr_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store offset=16
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_binaryStr#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_binaryStr_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_binaryStr#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_binaryStr_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_binaryStr
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_binaryStr
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_binaryStr>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_binaryOp_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_binaryOp#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_binaryOp_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_binaryOp#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_binaryOp_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_binaryOp
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_binaryOp
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_binaryOp>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_assignRhsField_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_assignRhsField#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_assignRhsField_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_assignRhsField
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_assignRhsField
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_assignRhsField>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_assignRhsField_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_assignRhsField
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_assignRhsField
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_assignRhsField>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_arrayLit_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_arrayLit#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_arrayLit_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_arrayLit#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_arrayLit_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_arrayLit
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_arrayLit
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_arrayLit>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_andLeft_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_andLeft#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_andLeft_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_andLeft
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_andLeft
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_andLeft>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_andLeft_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_andLeft
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_andLeft
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_andLeft>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_W_setField_resume_1 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_W_setField#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_W_setField_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/__Cps_W_setField#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_W_setField_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_W_setField
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_W_setField
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_W_setField>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_W_setField_entry (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/W#setField
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_W_checkFlag_resume_0 (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $async-await-position/__Cps_W_checkFlag#step
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_W_checkFlag_reject_0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   global.get $async-await-position/__async_roots_W_checkFlag
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_W_checkFlag
   local.tee $2
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $2
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
   call $~lib/array/Array<async-await-position/__Cps_W_checkFlag>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_W_checkFlag_reclaim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
    global.get $async-await-position/__async_roots_W_checkFlag
    local.tee $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    global.get $async-await-position/__async_roots_W_checkFlag
    local.tee $2
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $2
    local.get $0
    call $~lib/array/Array<async-await-position/__Cps_compoundStr>#indexOf
    call $~lib/array/Array<async-await-position/__Cps_W_checkFlag>#splice
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $export:async-await-position/__async_async_await_position_W_checkFlag_entry (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   call $async-await-position/W#checkFlag
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
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/whileCond (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 36
   i32.const 33
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
   i32.const 0
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=20
   local.get $1
   i32.const 1552
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
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_whileCond
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_whileCond#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/varInitCall (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.const 47
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
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=20
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_varInitCall
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_varInitCall#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/varInitBinary (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.const 49
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
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_varInitBinary
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_varInitBinary#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/unaryOp (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 20
   i32.const 65
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
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_unaryOp
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_unaryOp#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/ternaryCond (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 14
   i32.const 57
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
   i32.const 0
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=13
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_ternaryCond
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_ternaryCond#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/templateLit (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 20
   i32.const 69
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
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_templateLit
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_templateLit#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/storedField (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.const 29
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
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
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
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_storedField
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_storedField#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/storedArg (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.const 61
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
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=20
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_storedArg
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_storedArg#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/startSetField (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  call $async-await-position/W#constructor
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 1
  call $async-await-position/W#setField
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/startCheckFlag (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  call $async-await-position/W#constructor
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $async-await-position/W#checkFlag
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/returnAssign (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 51
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
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=20
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
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
   i32.const 1552
   i32.store offset=28
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_returnAssign
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_returnAssign#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/recvCall (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 24
   i32.const 21
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
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
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
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_recvCall
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_recvCall#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/mixedCompound (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 56
   i32.const 15
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
   f64.const 0
   f64.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=20
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
   f64.const 0
   f64.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   f64.const 0
   f64.store offset=40
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   f64.const 0
   f64.store offset=48
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_mixedCompound
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_mixedCompound#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/indexOrder (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 25
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
   i32.const 0
   call $~lib/array/Array<~lib/string/String>#constructor
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $1
   local.get $2
   i32.store offset=16
   local.get $1
   local.get $2
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   i32.const 0
   call $~lib/array/Array<~lib/string/String>#constructor
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $1
   local.get $2
   i32.store offset=24
   local.get $1
   local.get $2
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_indexOrder
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_indexOrder#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/ifCondInTry (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 44
   i32.const 63
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
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=8
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store8 offset=13
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store8 offset=14
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store8 offset=15
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=16
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store8 offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=24
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store8 offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=32
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store8 offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=40
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_ifCondInTry
   local.tee $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   call $async-await-position/__Cps_ifCondInTry#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/ifCond (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 14
   i32.const 31
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
   i32.const 0
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=13
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_ifCond
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_ifCond#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/forIncr (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 36
   i32.const 39
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
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=20
   local.get $1
   i32.const 1552
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
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_forIncr
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_forIncr#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/forCond (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 36
   i32.const 35
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
   i32.const 0
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=20
   local.get $1
   i32.const 1552
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
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_forCond
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_forCond#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/fieldCompound (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 40
   i32.const 19
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
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=8
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=12
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=24
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=28
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=32
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_fieldCompound
   local.tee $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   call $async-await-position/__Cps_fieldCompound#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/fieldAssign (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 17
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
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_fieldAssign
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_fieldAssign#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/elemCompound (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 27
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
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   i32.const 0
   call $~lib/array/Array<i32>#constructor
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $1
   local.get $2
   i32.store offset=16
   local.get $1
   local.get $2
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   i32.const 0
   call $~lib/array/Array<i32>#constructor
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $1
   local.get $2
   i32.store offset=20
   local.get $1
   local.get $2
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
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_elemCompound
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_elemCompound#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/elemAssign (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 44
   i32.const 23
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
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=8
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=12
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=16
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 0
   call $~lib/array/Array<~lib/string/String>#constructor
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store offset=20
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 0
   call $~lib/array/Array<~lib/string/String>#constructor
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store offset=28
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 0
   call $~lib/array/Array<~lib/string/String>#constructor
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store offset=36
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=40
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_elemAssign
   local.tee $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   call $async-await-position/__Cps_elemAssign#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/doCond (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 36
   i32.const 37
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
   i32.const 0
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=20
   local.get $1
   i32.const 1552
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
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_doCond
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_doCond#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/compoundStr (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
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
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=20
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
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
   i32.const 1552
   i32.store offset=28
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_compoundStr
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_compoundStr#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/compoundRhs (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.const 53
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
   global.get $async-await-position/__async_roots_compoundRhs
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_compoundRhs#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/compoundNum (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 96
   i32.const 13
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
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 1552
   i32.store offset=8
   local.get $0
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=40
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=44
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=48
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=52
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=56
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=60
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=64
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=68
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=72
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=76
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=80
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=84
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=88
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=92
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_compoundNum
   local.tee $1
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $1
   local.get $0
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   call $async-await-position/__Cps_compoundNum#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/chunkString (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 3520
   return
  end
  local.get $0
  i32.const 1
  i32.eq
  if
   i32.const 3552
   return
  end
  local.get $0
  i32.const 2
  i32.eq
  if
   i32.const 3584
   return
  end
  i32.const 3616
 )
 (func $async-await-position/callArgs (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.const 41
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
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=20
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
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
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_callArgs
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_callArgs#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/binaryStr (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.const 45
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
   i32.const 1552
   i32.store offset=16
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 1552
   i32.store offset=20
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
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
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_binaryStr
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_binaryStr#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/binaryOp (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.const 43
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
   global.get $async-await-position/__async_roots_binaryOp
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_binaryOp#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/assignRhsField (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.const 55
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
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/rt/itcms/__link
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
   i32.const 1552
   i32.store offset=24
   local.get $1
   i32.const 1552
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_assignRhsField
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_assignRhsField#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/arrayLit (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.const 67
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
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
   i32.const 0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   i32.const 0
   call $~lib/array/Array<i32>#constructor
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $2
   local.get $0
   i32.store offset=20
   local.get $2
   local.get $0
   i32.const 0
   call $~lib/rt/itcms/__link
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 0
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_arrayLit
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   local.get $0
   local.get $2
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $async-await-position/__Cps_arrayLit#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/andLeft (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  block $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i32.const 4208
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
   i32.const 4208
   i32.lt_s
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 14
   i32.const 59
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
   i32.const 0
   i32.store8 offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store8 offset=13
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   global.get $async-await-position/__async_roots_andLeft
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   local.get $0
   local.get $1
   call $~lib/array/Array<async-await-position/__Cps_compoundStr>#push
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $async-await-position/__Cps_andLeft#step
   drop
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $1
   return
  end
  i32.const 37008
  i32.const 37056
  i32.const 1
  i32.const 1
  call $~lib/builtins/abort
  unreachable
 )
 (func $async-await-position/__async_async_await_position_whileCond_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_whileCond
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_whileCond
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_whileCond
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_varInitCall_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_varInitCall
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_varInitCall
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_varInitCall
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_varInitBinary_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_varInitBinary
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_varInitBinary
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_varInitBinary
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_unaryOp_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_unaryOp
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_unaryOp
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_unaryOp
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_ternaryCond_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_ternaryCond
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_ternaryCond
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_ternaryCond
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_templateLit_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_templateLit
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_templateLit
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_templateLit
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_storedField_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_storedField
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_storedField
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_storedField
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_storedArg_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_storedArg
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_storedArg
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_storedArg
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_returnAssign_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_returnAssign
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_returnAssign
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_returnAssign
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_recvCall_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_recvCall
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_recvCall
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_recvCall
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_mixedCompound_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_mixedCompound
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_mixedCompound
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_mixedCompound
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_mint_string (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 3840
  i32.store
  i32.const 3836
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
   i32.const 3872
   i32.const 334
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  block $__inlined_func$~lib/string/String#repeat$111
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
    br $__inlined_func$~lib/string/String#repeat$111
   end
   local.get $0
   i32.const 1
   i32.eq
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 3840
    local.set $1
    br $__inlined_func$~lib/string/String#repeat$111
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
     i32.const 3840
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
 (func $async-await-position/__async_async_await_position_mint (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
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
 (func $async-await-position/__async_async_await_position_indexOrder_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_indexOrder
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_indexOrder
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_indexOrder
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_ifCond_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_ifCond
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_ifCond
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_ifCond
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_ifCondInTry_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_ifCondInTry
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_ifCondInTry
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_ifCondInTry
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_forIncr_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_forIncr
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_forIncr
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_forIncr
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_forCond_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_forCond
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_forCond
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_forCond
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_fieldCompound_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_fieldCompound
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_fieldCompound
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_fieldCompound
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_fieldAssign_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_fieldAssign
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_fieldAssign
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_fieldAssign
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_elemCompound_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_elemCompound
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_elemCompound
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_elemCompound
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_elemAssign_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_elemAssign
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_elemAssign
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_elemAssign
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_doCond_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_doCond
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_doCond
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_doCond
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_compoundStr_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_compoundStr
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_compoundStr
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_compoundStr
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_compoundRhs_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_compoundRhs
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_compoundRhs
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_compoundRhs
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_compoundNum_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_compoundNum
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_compoundNum
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_compoundNum
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_callArgs_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_callArgs
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_callArgs
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_callArgs
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_binaryStr_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_binaryStr
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_binaryStr
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_binaryStr
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_binaryOp_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_binaryOp
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_binaryOp
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_binaryOp
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_assignRhsField_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_assignRhsField
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_assignRhsField
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_assignRhsField
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_arrayLit_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_arrayLit
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_arrayLit
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_arrayLit
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_andLeft_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_andLeft
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_andLeft
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_andLeft
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_W_setField_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_W_setField
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_W_setField
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_W_setField
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $async-await-position/__async_async_await_position_W_new (result i32)
  call $async-await-position/W#constructor
 )
 (func $async-await-position/__async_async_await_position_W_checkFlag_last_handle (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4208
  i32.lt_s
  if
   i32.const 37008
   i32.const 37056
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_W_checkFlag
  local.tee $0
  i32.store
  local.get $0
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
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
  global.get $async-await-position/__async_roots_W_checkFlag
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  global.get $async-await-position/__async_roots_W_checkFlag
  local.tee $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/array/Array<async-await-position/__Cps_compoundStr>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/string/String>#__get
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
)
