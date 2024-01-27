.section .text
.global test6_tmax
.type test6_tmax, @function

test6_tmax:
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
	div s3, s1, s2
	sw s3, 0(a2)
	addi a1, a1, 4
	addi s6, s6, -1
	bnez s6, loop_int

	addi a0, a0, 4
    addi s5, s5, -1
	bnez s5, loop_ext
	
	

#tmax div procedure

	la a0, test_vector_A_tmax
	la a1, test_vector_B_tmax
	la a2, test_results
	li s5, 18
	li s6, 0

loop_max:
	lw s1, 0(a0)
	lw s2, 0(a1)
	div s3, s1, s2
	sw s3, 0(a2)
	addi s5, s5, -1
	bnez s5, loop_max

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


test_vector_A:
# words for short test
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


# words from tmax
test_vector_A_tmax:
#patt.0
	.word 00010101000011100100101011110110
	.word 11111111111111111111111111011111
	.word 00010111011100111011110000001001
	.word 10100111011001000011010010010010
	.word 00100011110111010010111100101000
	.word 00000110111100000110110000110111
	.word 10001111111110101010011111100110
	.word 00001010001101010011111000111100
	.word 10000001001001001000100110010011
#patt.1
	.word 01010001000000011110100100100010
	.word 01001011111010111101001100100111
	.word 00110010001000111110011000101111
	.word 00000010000000000000011000010001
	.word 01011111001000110110000110100001
	.word 01111101000100111011100011010001
	.word 01001110110000000100101100000100
	.word 01101011100101100100101011111010
	.word 00100101001101011000101110000001


test_vector_B_tmax:
#patt.0
	.word 10101111001110110110010000100011
	.word 00000000000000000000000001000001
	.word 00011110001111000100001100111001
	.word 01101000001101011000011001010101
	.word 11111110011011111000101010010010
	.word 10100110010101000111110100100101
	.word 00011111111001011011001110010000
	.word 00000010100100110100011110010000
	.word 01100010110110001011010001111000
#patt.1
	.word 11101010010100000000011100101111
	.word 11110101001100000000101100000010
	.word 01111011010111000100101110010100
	.word 01010111111111111111010110000101
	.word 00011000100111110011011101100011
	.word 10110110000110011011101011101011
	.word 01000100100101110010011101000011
	.word 10110000000011000010010000001010
	.word 00001100010001010101100111110001

