.syntax unified
.cpu cortex-m4
.thumb
#define A #4


// Global memory locations.
.global vtable_kernel
.global __kernel_reset__

.type vtable_kernel, %object
.type __kernel_reset__, %function

.section .interrupt_vector
vtable_kernel:
	.word __stack_start
	.word __kenel_reset__+1
	.size vtable_kernel, .-vtable_kernel

.section .rodata
	data: .asciz "kernel started!\n"
	final: .asciz "Value in register #3: "
.section .text
__kernel_reset__:
	ldr r0, = data
	bl dbgput_line

	// calculate
	mov r0, A
	mov r1, #0
	cmp r0, r1
	ITE GE
	movGE r3, r0
	movLT r2, r0

	ldr r0, =final
	bl dbgput
	mov r0, r3
	bl dbgput_num

	end:
	b end

