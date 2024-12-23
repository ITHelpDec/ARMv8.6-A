# ARMv8.6-A Assembly Examples for Apple Silicon
I was disappointed by the documentation provided as part of [Arm A-profile A64 Instruction Set Architecture](https://developer.arm.com/documentation/ddi0602/2024-12) (especially SIMD and FP instructions), so wanted to create some working examples for people to learn from (and potentially contribute to).

These examples were tested on an M2 machine, but should also work on M3, as they both share the same ARMv8.6-A ISA.

M1 is ARMv8.4-A, so there may be certain instructions that don't work.

M4 is ARMv9.2-A, so may work, but will also support SVE and SME, which I won't cover here (unless, of course, a kind reader wants to supply an M4 machine, or I upgrade from my current machine).

* [Base Instructions](Base%20Instructions)
* [SIMD&FP Instructions](SIMD&FP%20Instructions)
    * [ADDP (scalar)](SIMD&FP%20Instructions/ADDP%20(scalar):%20Add%20pair%20of%20elements%20(scalar))
    * [ADDV](SIMD&FP%20Instructions/ADDV:%20Add%20across%20vector)
    * [BFCVT](SIMD&FP%20Instructions/BFCVT:%20Floating-point%20convert%20from%20single-precision%20to%20BFloat16%20format%20(scalar))
* [SVE Instructions](SVE%20Instructions)
* [SME Instructions](SME%20Instructions)
