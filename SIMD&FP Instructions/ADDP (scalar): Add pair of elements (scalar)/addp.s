.p2align 4, 0x0
numbers: .quad 1, 2

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

    ;;; Pair-wise addition of vector containing two 64-bit integers
    addp d0, v0.2d

    ;;; Transfer result to stack pointer for printing
    str d0, [sp]

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

output: .asciz "Answer: %llu\n";
