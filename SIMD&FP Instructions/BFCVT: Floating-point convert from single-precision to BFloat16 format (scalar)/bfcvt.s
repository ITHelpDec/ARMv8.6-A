.global _start
.p2align 2

_start:
    ;;; Shift stack pointer
    sub sp, sp, #32

    ;;; 16-byte folded spill
    stp x29, x30, [sp, #16]
    add x29, sp, #16

    ;;; Take input from stdin
    sub x8, x29, #4
    str x8, [sp]
    adrp    x0, input@page
    add x0, x0, input@pageoff
    bl _scanf

    ;;; Convert float32 to bfloat16
    bfcvt h0, s0

    ;;; 16-byte folded reload
    ldp x29, x30, [sp, #16]

    ;;; Restore stack pointer
    add sp, sp, #32

    ;;; Return 0 with supervisor call
    mov x0,  #0
    mov x16, #1
    svc 0

input: .asciz "%f"
