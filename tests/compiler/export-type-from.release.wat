(module
 (type $0 (func (result i32)))
 (memory $0 0)
 (export "g" (func $export-type-from/g))
 (export "memory" (memory $0))
 (func $export-type-from/g (result i32)
  i32.const 1
 )
)
