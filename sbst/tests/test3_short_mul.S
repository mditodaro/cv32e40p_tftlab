.section .text
.global test3_short_mul
.type test3_short_mul, @function

test3_short_mul:
	# ABI prologue
	addi sp, sp, -112     # allocate 112 bytes on the stack
	sw ra, 104(sp)        # save return address
	sw s0, 96(sp)         # save callee-saved registers
	sw s1, 88(sp)
	sw s2, 80(sp)
	sw s3, 72(sp)
	sw s4, 64(sp)
	sw s5, 56(sp)
	sw s6, 48(sp)
	sw s7, 40(sp)
	sw s8, 32(sp)
	sw s9, 24(sp)
	sw s10, 16(sp)
	sw s11, 8(sp)
	addi s0, sp, 112     # set up s0 to point to start of stack frame


    # You can write your code here 

	la a0, test_vector_A
	la a2, test_results
	li s5, 11

loop_ext:
	li s6, 11
	la a1, test_vector_B
	lw s1, 0(a0)

loop_int:
	lw s2, 0(a1)
	mul s3, s1, s2
	sw s3, 0(a2)
	addi a1, a1, 4
	addi s6, s6, -1
	bnez s6, loop_int

	addi a0, a0, 4
    addi s5, s5, -1
	bnez s5, loop_ext
	
	li a0, 42


    # ABI epilogue
	lw s11, 8(sp)        # restore callee-saved registers
	lw s10, 16(sp)
	lw s9, 24(sp)
	lw s8, 32(sp)
	lw s7, 40(sp)
	lw s6, 48(sp)
	lw s5, 56(sp)
	lw s4, 64(sp)
	lw s3, 72(sp)
	lw s2, 80(sp)
	lw s1, 88(sp)
	lw s0, 96(sp)
	lw ra, 104(sp)       # restore return address
	addi sp, sp, 112     # deallocate stack space
	jr ra                # return to caller





# READ/WRITE VARIABLES

.section .data

test_results:
	.space 4

# READ-ONLY VARIABLES

.section .rodata

# words for short test
test_vector_A:
	.word 0x000000FF
	.word 0xFFFFFF00
	.word 0x0000FFFF
	.word 0xFFFF0000
	.word 0x00FFFFFF
	.word 0xFF000000
	.word 0xFFFFFFFF
	.word 0x00FF00FF
	.word 0xFF00FF00
	.word 0xF0F0F0F0
	.word 0x0F0F0F0F

test_vector_B:
	.word 0x000000FF
	.word 0xFFFFFF00
	.word 0x0000FFFF
	.word 0xFFFF0000
	.word 0x00FFFFFF
	.word 0xFF000000
	.word 0xFFFFFFFF
	.word 0x00FF00FF
	.word 0xFF00FF00
	.word 0xF0F0F0F0
	.word 0x0F0F0F0F


