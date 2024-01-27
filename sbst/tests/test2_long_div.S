.section .text
.global test2_long_div
.type test2_long_div, @function

test2_long_div:
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
	li s5, 63

loop_ext:
	li s6, 11
	la a1, test_vector_B
	lw s1, 0(a0)

loop_int:
	lw s2, 0(a1)
	div s3, s1, s2
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


# words for long test
test_vector_A:

	.word 0x000000FF
	.word 0x00000052
	.word 0x000000a1
	.word 0x00000028
	.word 0x000000cd
	.word 0x0000008c
	.word 0x000000ae
	.word 0x00000029
	.word 0x00000070
	.word 0x000000d8
	.word 0x000000c3
	.word 0xFFFFFF96
	.word 0xFFFFFFde
	.word 0xFFFFFFd9
	.word 0xFFFFFF46
	.word 0xFFFFFF29
	.word 0xFFFFFFe7
	.word 0xFFFFFF0f
	.word 0xFFFFFFbe
	.word 0xFFFFFF90
	.word 0xFFFFFF55
	.word 0x0000FFFF
	.word 0x0000dad9
	.word 0x00007313
	.word 0x00001ce8
	.word 0x0000d186
	.word 0x00002609
	.word 0x00002ecf
	.word 0x00009e7e
	.word 0x0000df29
	.word 0x0000c15f
	.word 0x00001454
	.word 0xFFFF260d
	.word 0xFFFFc5da
	.word 0xFFFF686b
	.word 0xFFFF84c6
	.word 0xFFFF2ddf
	.word 0xFFFF1036
	.word 0xFFFF565d
	.word 0xFFFF2e86
	.word 0xFFFFd6e5
	.word 0xFFFF859b
	.word 0x00FFFFFF
	.word 0x0034c653
	.word 0x00afe654
	.word 0x0049e4a0
	.word 0x00c4e5ed
	.word 0x000c88ae
	.word 0x00f3a3f6
	.word 0x00954b90
	.word 0x0017bc2f
	.word 0x0071db2a
	.word 0x00d52135
	.word 0xFF95e4e1
	.word 0xFFab246d
	.word 0xFF7ec77e
	.word 0xFF78417d
	.word 0xFF92a6c9
	.word 0xFFa94520
	.word 0xFF0128e2
	.word 0xFFdbae63
	.word 0xFF236dfe
	.word 0xFFdf0cad
	.word 0xFFFFFFFF

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



