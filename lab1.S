.global lab1
.syntax unified

#define a #4
#define b #-6
#define c #0

lab1:

	push {lr}
	mov r0, a 	// r0 = a
	mov r1, b 	// r1 = b
	mov r2, c 	// r2 = c
	mov r3, 1 	// r3 = 1 - register of result
	
	add r1, r1, r0	// r1 = r1 + r0 : a+b
	asr r1, r1, #1	// r1 = r1>>1 : (a+b)/2
	
	cmp r2, #1
	ble factorial_end
factorial: // r3 = c * (c-1) * ... * 2 * 1

	mul r3, r3, r2 	// r3 = r3 * r1
	sub r2, r2, #1	// r2--
	cmp r2, #1
	bgt factorial	// if (r2 > 1) goto factorial

factorial_end:

	add r3, r3, r1	// r3 = r3 + r1 : c! + (a+b)/2

	pop {pc}
