.syntax unified
.cpu cortex-m4
.thumb
#define a #15
#define b #-9
#define c #3

// Global memory locations.
.global vtable_kernel
.global __kernel_reset__

.type vtable_kernel, %object
.type __kernel_reset__, %function

.section .interrupt_vector
vtable_kernel:
    .word __stack_start 
    .word __kernel_reset__+1
    .size vtable_kernel, .-vtable_kernel

.section .rodata
    start: .asciz "kernel started!\n"
    finish: .asciz "kernel finish!\n"
    final: .asciz "Value in register #3: "
.section .text
__kernel_reset__:
    ldr r0, =start
    bl dbgput_line
// calculate 
    ldr r0, =final
    bl dbgput

lab1:    
    mov r0, a
    mov r1, b
    mov r2, c

    mov r3, 1       // r3 = 1 - register of result

    add r1, r1, r0  // r1 = r1 + r0 : a+b
    asr r1, r1, #1  // r1 = r1>>1 : (a+b)/2

    cmp r2, #1
    ble factorial_end
    factorial: // r3 = c * (c-1) * ... * 2 * 1
        mul r3, r3, r2  // r3 = r3 * r1
        sub r2, r2, #1  // r2--
        cmp r2, #1
        bgt factorial   // if (r2 > 1) goto factorial
    factorial_end:
    
    add r3, r3, r1  // r3 = r3 + r1 : c! + (a+b)/2
// ------------

    mov r0, r3
    bl dbgput_num   

end:
    b end