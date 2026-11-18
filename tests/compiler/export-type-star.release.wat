(module
 (type $0 (func (result i32)))
 (memory $0 0)
 (export "g" (func $export-type-star/g))
 (export "memory" (memory $0))
 (func $export-type-star/g (result i32)
  i32.const 1
 )
)
