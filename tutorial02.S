.section .init0

entry:
    ldi r16, 0xFF
    mov r1, r16
    ldi r22, 0x10
    ldi r16, 0xCC
    mov r4, r16

// DO NOT EDIT ABOVE THIS LINE //

    /** WARNING:

    Do not modify the data in the following registers unless specified
    by the exercise:

        R1  (Ex 2.1)
        R4  (Ex 2.9)
        R20 (Ex 2.2)
        R22 (Ex 2.6)
    */

    /** EX: 2.0

    TASK: Write assembly code to add the numbers 53 and 34 together and
    store the resulting sum in register R0.
    */


    /** CODE: Write your code for Ex 2.0 above this line. */
    mov r16, r0
    call avremu_r16out

    /** EX: 2.1

    TASK: Using the "and" instruction, clear only bits 2, 3, and 7 of
    register R1.
    */


    /** CODE: Write your code for Ex 2.1 above this line. */
    mov r16, r1
    call avremu_r16out

    /** EX: 2.2

    TASK: Using the "ori" instruction, set only bits 1, 3, and 5 of
    register R20.
    */


    /** CODE: Write your code for Ex 2.2 above this line. */
    mov r16, r20
    call avremu_r16out

    /** EX: 2.3

    TASK: Using exactly one instruction, add 1 to the value of R0.

    See AVR Instruction Set Manual Table 5-2 Arithmetic and Logic
    Instructions on p. 18.
    */


    /** CODE: Write your code for Ex 2.3 above this line. */
    mov r16, r0
    call avremu_r16out

    /** EX: 2.4

    TASK: Write assembly code to add 44 to 14685, storing the resulting
    sum in register pair R31:R30 (low byte in R30).
    */


    /** CODE: Write your code for Ex 2.4 above this line. */
    mov r16, r30
    call avremu_r16out
    mov r16, r31
    call avremu_r16out

    /** EX: 2.5

    TASK: Follow the steps below to complete this exercise.

    1. Encode the decimal value -4 as a two's complement 8-bit number.
    2. Express the result from step 1 as a hexadecimal literal.
    3. Swap the two nibbles of the result from step 2.
    4. Load the result of step 3 into register R21.
    */


    /** CODE: Write your code for Ex 2.5 above this line. */
    mov r16, r21
    call avremu_r16out

    /** EX: 2.6

    TASK: Write assembly code to subtract the value in R22 from 91 using
    the "add" instruction, storing the resulting value in R23.
    */


    /** CODE: Write your code for Ex 2.6 above this line. */
    mov r16, r23
    call avremu_r16out

    /** EX: 2.7

    TASK: Write assembly code to multiply the number 20 by 2 using the
    "lsl" instruction, storing the resulting value in R2.
    */


    /** CODE: Write your code for Ex 2.7 above this line. */
    mov r16, r2
    call avremu_r16out

    /** EX: 2.8

    TASK: Write assembly code to divide the number -37 by 4 using the
    "asr" instruction, storing the resulting value in R3.
    */


    /** CODE: Write your code for Ex 2.8 above this line. */
    mov r16, r3
    call avremu_r16out

    /** EX: 2.9

    TASK: Write assembly code to toggle the most significant bit, and
    least significant 4 bits of R4.
    */


    /** CODE: Write your code for Ex 2.9 above this line. */
    mov r16, r4
    call avremu_r16out

// END OF TUTORIAL02 EXERCISES //
// DO NOT EDIT BELOW THIS LINE //

    ldi r16, 0x22      // DISP_EN (PB1) | DISP_DP (PB5)
    sts 0x0420, r16    // Set as outputs
    sts 0x0424, r16    // Drive high

    break

    ldi r16, 0x20 // DISP_DP (PB5)
    ldi r17, 0x00

loop:
    // Delay
    com r17
    brne loop
    inc r18
    brne loop
    inc r19
    brne loop

    // Toggle DP LED
    sts 0x0427, r16

    rjmp loop // Loop indefinitely

// This procedure outputs the contents of R16 when using the emulator.
// Address 0x1500 is reserved in the memory map so this procedure has
// no effect when running on the ATtiny1626 hardware.
avremu_r16out:
    sts 0x1500, r16
    ret
