.p2align 4, 0x0
numbers: .word 1, 2, 3, 4

.global _start
.p2align 2

_start:
    ;;; Shift stack pointer
    sub sp, sp, #32

    ;;; 16-byte folded spill
    stp x29, x30, [sp, #16]
    add x29, sp, #16

    ;;; Load numbers into GP then dedicated SIMD register
    adrp     x8, numbers@page
    ldr q0, [x8, numbers@pageoff]

    ;;; Accumulate vector into s0
    addv s0, v0.4s

    ;;; Transfer result to stack pointer for printing
    fmov w8, s0
    str x8, [sp]

    ;;; Prepare string for printing
    adrp    x0, output@page
    add x0, x0, output@pageoff

    ;;; Output result
    bl _printf

    ;;; 16-byte folded reload
    ldp x29, x30, [sp, #16]

    ;;; Restore stack pointer
    add sp, sp, #32

    ;;; Return 0 with supervisor call
    mov x0,  #0
    mov x16, #1
    svc 0

output: .asciz "Answer: %u\n";
