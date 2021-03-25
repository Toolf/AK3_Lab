.syntax unified
.cpu cortex-m4
// .fpu softvfp
.thumb

// Global memory location
.global vtable
.global reset_handler
/*
 * vector table
 */

.type vtable, %object
vtable:
    .word __stack_start
    .word __hard_reset__+1
    .size vtable, .-vtable
__hard_reset__:
    bl lab1
    _loop: b _loop
    .size __hard_reset__, .-__hard_reset__
