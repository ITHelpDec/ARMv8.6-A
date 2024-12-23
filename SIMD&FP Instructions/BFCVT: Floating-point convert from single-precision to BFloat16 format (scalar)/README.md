# BFCVT

Instruction is described [here](https://developer.arm.com/documentation/ddi0602/2024-12/SIMD-FP-Instructions/BFCVT--Floating-point-convert-from-single-precision-to-BFloat16-format--scalar--?lang=en).

Printing half-precision floats doesn't look to be fully-supported, but you can see the changes in `lldb`:

```bash
~/ARMv8.6-A/SIMD&FP Instructions/BFCVT: Floating-point convert from single-precision to BFloat16 format (scalar):~$ make all

~/ARMv8.6-A/SIMD&FP Instructions/BFCVT: Floating-point convert from single-precision to BFloat16 format (scalar):~$ lldb bfcvt

(lldb) b bfcvt.s:20
...
(lldb) r

...
# enter in a number like 3.1415927 and hit enter
...

* thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
    frame #0: 0x0000000100003f90 bfcvt`start at bfcvt.s:20
   17  	    bl _scanf
   18
   19  	    ;;; Convert float32 to bfloat16
-> 20  	    bfcvt h0, s0
   21
   22  	    ;;; 16-byte folded reload
   23  	    ldp x29, x30, [sp, #16]
Target 0: (bfcvt) stopped.

(lldb) re r s0 --f b
      s0 = 0b01000000010010010000111111011011
```
If we take a look at [Float Toy](https://evanw.github.io/float-toy/), we can see our IEEE 754 single-precision 32-bit float version of 3.1415927 is correct...
```
(lldb) n
Process 66943 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = step over
    frame #0: 0x0000000100003f94 bfcvt`start at bfcvt.s:23
   20  	    bfcvt h0, s0
   21
   22  	    ;;; 16-byte folded reload
-> 23  	    ldp x29, x30, [sp, #16]
   24
   25  	    ;;; Restore stack pointer
   26  	    add sp, sp, #32
Target 0: (bfcvt) stopped.

(lldb) re r s0 --f b
      s0 = 0b00000000000000000100000001001001
```
..., and if we consult [this](https://iq.opengenus.org/bfloat16/) page, then we can see that `0x0100000001001001` (i.e. `h0`, the first 16 bits of `s0`) is, indeed, an approximation of 3.1415927 (3.140625).
