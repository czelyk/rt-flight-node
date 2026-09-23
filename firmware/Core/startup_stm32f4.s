.syntax unified
.cpu cortex-m4
.thumb

.section .isr_vector, "a", %progbits
.align 2

.word _estack
.word Reset_Handler

.section .text.Reset_Handler
.global Reset_Handler
.type Reset_Handler, %function
.thumb_func

Reset_Handler:
    ldr r0, =_sidata
    ldr r1, =_sdata
    ldr r2, =_edata

Data_Copy_Loop:
    cmp r1, r2
    beq Data_Copy_Done

    ldr r3, [r0]
    str r3, [r1]

    adds r0, r0, #4
    adds r1, r1, #4

    b Data_Copy_Loop

Data_Copy_Done:
    ldr r0, =_sbss
    ldr r1, =_ebss
    movs r2, #0

Bss_Zero_Loop:
    cmp r0, r1
    beq Bss_Zero_Done

    str r2, [r0]
    adds r0, r0, #4

    b Bss_Zero_Loop

Bss_Zero_Done:
    bl main

Hang:
    b Hang
