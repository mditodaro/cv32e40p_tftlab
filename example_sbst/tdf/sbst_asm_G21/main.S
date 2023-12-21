/* Copyright (c) 2017  SiFive Inc. All rights reserved.
 * Copyright (c) 2019  ETH Zürich and University of Bologna
 * This copyrighted material is made available to anyone wishing to use,
 * modify, copy, or redistribute it subject to the terms and conditions
 * of the FreeBSD License.   This program is distributed in the hope that
 * it will be useful, but WITHOUT ANY WARRANTY expressed or implied,
 * including the implied warranties of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  A copy of this license is available at
 * http://www.opensource.org/licenses.
 */

/* Entry point for bare metal programs */
.section .text.start
.global _start
.type _start, @function

_start:
/* initialize global pointer */
.option push
.option norelax
1:	auipc gp, %pcrel_hi(__global_pointer$)
	addi  gp, gp, %pcrel_lo(1b)
.option pop

/* initialize stack pointer */
	la sp, _sp

/* set vector table address */
	la a0, __vector_start
	csrw mtvec, a0

/* clear the bss segment */
//	la a0, __bss_start
//	la a2, __bss_end
//	sub a2, a2, a0
//	li a1, 0
//	call memset

/* new-style constructors and destructors */
//	la a0, __libc_fini_array
//	call atexit
//	call __libc_init_array

/* call main */
//	lw a0, 0(sp)                    /* a0 = argc */
//	addi a1, sp, __SIZEOF_POINTER__ /* a1 = argv */
//	li a2, 0                        /* a2 = envp = NULL */
//	call main


/************* YOUR ASSEMBLY CODE (BEGIN) ****************************/
/*!!!!!!!!!!!!!!!!!!!!!!ALU!!!!!!!!!!!!!!!!!*/

li t0,0x03030303
li t1,0x78787878
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)

add x13, t0, t1
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)


p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)

p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)

//-------------------------------------------------
li t0,0xffffffff
li t1,0xa6a6a6a6
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)

add x13, t0, t1
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)


p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)
p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)
//-----------------------------------

li t1,0x88888888
li t0,0x4a4a4a4a
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)

add x13, t0, t1
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1
p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp) 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)
//----------------------------------------

li t0,0x00ff00ff
li t1,0xff00ff00
p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)

add x13, t0, t1
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)



p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

//-------------------------------------
li t0,0xaabbccdd
li t1,0xddccbbaa
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)

p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)

add x13, t0, t1
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)



xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)

p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

//-------------------------------------------------
li t0,0xbb22bb22
li t1,0x22dd22dd
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

add x13, t0, t1
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)


p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)
p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)
//-----------------------------------

li t1,0xafafafaf
li t0,0xfafafafa
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
add x13, t0, t1
p.addNr x14, t0, t1  
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)



//----------------------------------------

li t0,0x3c3c3c3c
li t1,0x01010101
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.min x12, t0, t1 
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

add x13, t0, t1
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)


p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)


// -----------------------------------------------

li t1,0xffff0000
li t0,0x44cc44cc
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
add x13, t0, t1
p.addNr x14, t0, t1  
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)


// ---------------------------------------

li t1,0x2626aaaa
li t0,0xcccc4444
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
add x13, t0, t1
p.addNr x14, t0, t1  
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)

// -------------------------------------

li t1,0x88884444
li t0,0x44448888

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
add x13, t0, t1
p.addNr x14, t0, t1  
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//----------------------------------------------------------------

li t1,0xfafafafa
li t0,0x04848484

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
sw x8, 4(sp)
sw x9, 8(sp)
p.bclrr x13, t0, t1 
sw x13, 8(sp)
p.bsetr x15, t0, t1 
sw x15, 8(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x16, 4(sp)
sw x17, 8(sp)
p.extbs x18, t0 
p.extbz x19, t1
add x13, t0, t1
p.addNr x14, t0, t1  
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x9, t0, t1 
sw x7, 8(sp)
sw x9, 16(sp)
p.minu x13, t1,t0
sw x12, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.extbz x19, t1
p.extbs x18, t0 
sw x18, 4(sp)
sw x19, 8(sp)
p.exthz x17, t1
p.exths x16, t0
sw x16, 4(sp)
sw x17, 8(sp)
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)
p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
sw x13, 8(sp)
sw x15, 8(sp)
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x8, 4(sp)
sw x9, 8(sp)
p.fl1 x7, t0
p.ff1 x16, t1
sw x16, 4(sp)
sw x7, 8(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)


//-----------------------------------------


li t0,0xaa11aa11
li t1,0x11aa11aa

srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)





//-----------------------------------------
li t0,0xaaa111aa
li t1,0x111aaa11
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xcc33cc33
li t1,0x33cc33cc
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xccc333cc
li t1,0x333ccc33
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x88778877
li t1,0x77887788
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x88877788
li t1,0x77788877
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xee11ee11
li t1,0x11ee11ee
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xeee111ee
li t1,0x111eee11
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xff00ff00
li t1,0x00ff00ff
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xfff000ff
li t1,0x000fff00
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x24242424
li t0,0x42424242
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x22442244
li t0,0x44224422
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x22244422
li t0,0x44422244
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x44664466
li t0,0x66446644
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x46464646
li t0,0x64646464
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x44466644
li t0,0x66644466
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x68686868
li t0,0x86868686
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x66886688
li t0,0x88668866
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x66688866
li t0,0x88866688
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x8a8a8a8a
li t0,0xa8a8a8a8
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x88aa88aa
li t0,0xaa88aa88
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0x888aaa88
li t0,0xaaa888aa
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0xcececece
li t0,0xecececec
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0xcceeccee
li t0,0xeecceecc
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t1,0xccceeecc
li t0,0xeeecccee
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x31313131
li t1,0x31313131
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x31313131
li t1,0x13131313
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x33311133
li t1,0x11133311
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x53535353
li t1,0x35353535
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x55533355
li t1,0x33355533
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x55335533
li t1,0x33553355
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x75757575
li t1,0x57575757
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x77755577
li t1,0x55577755
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x77557755
li t1,0x55775577
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x97979797
li t1,0x79797979
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x99779977
li t1,0x77997799
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x77799977
li t1,0x77799977
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0x9b9b9b9b
li t1,0x9b9b9b9b
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xbb99bb99
li t1,0x99bb99bb
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xbbb999bb
li t1,0x999bbb99
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xdbdbdbdb
li t1,0xbdbdbdbd
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xddbbddbb
li t1,0xbbddbbdd
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0,0xdddbbbdd
li t1,0xbbbdddbb
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-------------------------------------------oooooooooookkkkkkkkkkkkkkkkkkkkkkkkk--------------------

li t0, 0x53815e2
li t1, 0x53815e2
p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)


p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)


sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

li t0, 0x383808f7
li t1, 0x383808f7
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)


li t0, 0x92c88a1f
li t1, 0x92c88a1f
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)


li t0, 0x44fb7583
li t1, 0x44fb7583
p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)


p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)


sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

li t0, 0x9da4d989
li t1, 0x9da4d989
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

li t0, 0x1d4453ce
li t1, 0x1d4453ce
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)


li t0, 0x29d756ae
li t1, 0x29d756ae
p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)


p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)


sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

li t0, 0x200000e2
li t1, 0x200000e2
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

li t0, 0xa022595f
li t1, 0xa022595f
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

li t0, 0x414de738
li t1, 0x414de738
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)


li t0, 0xda187de3
li t1, 0xda187de3
p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)


p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)


sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

li t0, 0x55ae8a85
li t1, 0x55ae8a85
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)


li t0, 0xee723fe0
li t1, 0xee723fe0
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

li t0, 0xb69ffce9
li t1, 0xb69ffce9
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)


li t0, 0xffffffff
li t1, 0xffffffff
p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)


p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)


sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

li t0, 0x4fe41310
li t1, 0x4fe41310
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

li t0, 0xe0403481
li t1, 0xe0403481
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)


li t0, 0xe010b443
li t1, 0xe010b443
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

li t0, 0xb7aef25f
li t1, 0xb7aef25f
p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)


p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)


sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

li t0, 0xce94cf7a
li t1, 0xce94cf7a
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)


li t0, 0x6624855d
li t1, 0x6624855d
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)


li t0, 0xe3bfa7ba
li t1, 0xe3bfa7ba
p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)


li t0, 0x2b6a7ebd
li t1, 0x2b6a7ebd
p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)


p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)


p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)


sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

li t0, 0xc4a7c90e
li t1, 0xc4a7c90e
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)


sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

li t0, 0x4990dc96
li t1, 0x4990dc96
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)


sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

li t0, 0x7d0bb6cc
li t1, 0x7d0bb6cc
p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

p.ff1 x16, t1
p.fl1 x7, t0
sw x16, 4(sp)
sw x7, 8(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)

p.extractr x8, t0, t1
p.extractur x9, t0, t1 
p.bclrr x13, t0, t1 
p.bsetr x15, t0, t1 
sw x15, 8(sp)
sw x13, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)

p.min x12, t0, t1 
p.minu x13, t1,t0
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x12, 4(sp)
sw x13, 8(sp)
sw x14, 4(sp)
sw x15, 8(sp)
p.clb x16, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)

p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sub x18, t0, t1
add x13, t0, t1
sw x16, 8(sp)
sw x17, 12(sp)
sw x18,4(sp)
sw x13,4(sp)
p.addNr x14, t0, t1  
p.adduNr x15, t0, t1 
p.exths x16, t0
p.exthz x17, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)

p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
p.extbs x18, t0 
p.extbz x19, t1
sw x12, 4(sp)
sw x13, 8(sp)
sw x18, 4(sp)
sw x19, 8(sp)
p.clipr x7, t0, t1
p.clipur x12, t0, t1 
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x7, 8(sp)
sw x9, 16(sp)
sw x12, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)


sll x7, t0, t1
sra x8, t0, t1
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.extbz x19, t1
p.extbs x18, t0 
p.exthz x17, t1
p.exths x16, t0
sw x18, 4(sp)
sw x19, 8(sp)
sw x16, 4(sp)
sw x17, 8(sp)
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)

p.bsetr x15, t0, t1 
p.bclrr x13, t0, t1 
p.extractur x9, t0, t1 
p.extractr x8, t0, t1
sw x13, 8(sp)
sw x15, 8(sp)
sw x8, 4(sp)
sw x9, 8(sp)
slli x17,t0,4
srli x16,t1,4
p.fl1 x7, t0
p.ff1 x18, t1
sw x16, 4(sp)
sw x7, 8(sp)
sw x17, 4(sp)
sw x18, 8(sp)

andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)

p.adduNr x15, t0, t1 
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13,4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1
sub x18, t0, t1
sw x24, 8(sp)
sw x25, 12(sp)
sw x18,4(sp)
sw x22, 8(sp)
sw x23, 12(sp)

p.clipur x9, t0, t1 
p.clipr x7, t0, t1
sw x7, 8(sp)
sw x9, 16(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
p.ror x8, t0, t1
p.cnt x7, t0
p.clb x16, t0 
sw x16, 4(sp)
sw x7, 8(sp)
sw x8, 12(sp)


//-----------------------------------------------SAMEEEEEEEEEEEEEEEE111111111111111111---------------


li t0, 0x53815e2
li t1, 0x53815e2
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0, 0x383808f7
li t1, 0x383808f7
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0, 0x92c88a1f
li t1, 0x92c88a1f
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------
li t0, 0x44fb7583
li t1, 0x44fb7583
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0x9da4d989
li t1, 0x9da4d989
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0x1d4453ce
li t1, 0x1d4453ce
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0x29d756ae
li t1, 0x29d756ae
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0x200000e2
li t1, 0x200000e2
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0xa022595f
li t1, 0xa022595f
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0x414de738
li t1, 0x414de738
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0xda187de3
li t1, 0xda187de3
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0x55ae8a85
li t1, 0x55ae8a85
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0xee723fe0
li t1, 0xee723fe0
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0xb69ffce9
li t1, 0xb69ffce9
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0xffffffff
li t1, 0xffffffff
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0x4fe41310
li t1, 0x4fe41310
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0xe0403481
li t1, 0xe0403481
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0xe010b443
li t1, 0xe010b443
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0xb7aef25f
li t1, 0xb7aef25f
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0xce94cf7a
li t1, 0xce94cf7a
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0x6624855d
li t1, 0x6624855d
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0, 0xe3bfa7ba
li t1, 0xe3bfa7ba
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------

li t0, 0x2b6a7ebd
li t1, 0x2b6a7ebd
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)
//-----------------------------------------
li t0,0xc3c3c3c3
li t1,0xc3c3c3c3
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)



//-----------------------------------------
li t0,0x87878787
li t1,0x87878787
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xe1e1e1e1
li t1,0xe1e1e1e1
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xf0f0f0f0
li t1,0xf0f0f0f0
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x99669966
li t1,0x99669966
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x66996699
li t1,0x66996699
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xcc33cc33
li t1,0xcc33cc33
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xccc333cc
li t1,0xccc333cc
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x333ccc33
li t1,0x333ccc33
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x78787878
li t1,0x78787878
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x77887788
li t1,0x77887788
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x77788877
li t1,0x77788877
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xee11ee11
li t1,0xee11ee11
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xeee111ee
li t1,0xeee111ee
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xff00ff00
li t1,0xff00ff00
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xfff000ff
li t1,0xfff000ff
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x13131313
li t1,0x13131313
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x35353535
li t1,0x35353535
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x57575757
li t1,0x57575757
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x79797979
li t1,0x79797979
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x9b9b9b9b
li t1,0x9b9b9b9b
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xdfdfdfdf
li t1,0xdfdfdfdf
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x24242424
li t1,0x24242424
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x46464646
li t1,0x46464646
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x68686868
li t1,0x68686868
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x8a8a8a8a
li t1,0x8a8a8a8a
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xacacacac
li t1,0xacacacac
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xcececece
li t1,0xcececece
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x11331133
li t1,0x11331133
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x33553355
li t1,0x33553355
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x55775577
li t1,0x55775577
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x77997799
li t1,0x77997799
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x99bb99bb
li t1,0x99bb99bb
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xbbddbbdd
li t1,0xbbddbbdd
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xddffddff
li t1,0xddffddff
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x22442244
li t1,0x22442244
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x44664466
li t1,0x44664466
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x66886688
li t1,0x66886688
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0x88aa88aa
li t1,0x88aa88aa
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xaaccaacc
li t1,0xaaccaacc
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)


//-----------------------------------------
li t0,0xcceeccee
li t1,0xcceeccee
srli x11,t0,15
p.extractr x8, t0, t1
andi x15,t0,4
p.bclrr x13, t0, t1 
xori x16,t1,43
sw x8, 4(sp)
sw x11, 8(sp)
sw x13, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)


ori x7,t1,0
andi x8,t0,23
p.minu x13, t1,t0
addi x9, t1, 35
slli x10,t1,26
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x13, 4(sp)

p.extractur x9, t0, t1 
srai x12,t1,19
slti x13,t0,8
p.extbs x18, t0 
ori x14,t1,4
p.bsetr x15, t0, t1
slli x17,t0,4
sw x9, 4(sp)
sw x12, 4(sp)
sw x13, 4(sp)
sw x18, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x17, 8(sp)

p.ff1 x16, t1
srli x15,t1,4
p.clb x14, t0 
p.cnt x7, t0
p.ror x8, t0, t1
sw x16, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x7, 16(sp)
sw x8, 20(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.fl1 x7, t0
p.min x12, t0, t1 
p.max x14, t0, t1
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x7, 12(sp)
sw x12, 16(sp)
sw x14, 20(sp)
sw x11, 24(sp)

add x13, t0, t1
p.maxu x15, t1, t0 
p.addNr x14, t0, t1  
p.exthz x17, t1
p.clipr x7, t0, t1
sw x13, 4(sp)
sw x15, 8(sp)
sw x14, 12(sp)
sw x17, 16(sp)
sw x7, 20(sp)

p.adduNr x15, t0, t1
p.subuNr x23, t0, t1
p.clipur x9, t0, t1 
p.addRNr x16, t0, t1
p.exths x10, t0
sw x15, 8(sp)
sw x23, 16(sp)
sw x9, 8(sp)
sw x10, 12(sp)
sw x16, 8(sp)


sub x18, t0, t1
p.subNr x22, t0, t1 
sll x7, t0, t1
p.adduRNr x17, t0, t1
sra x8, t0, t1
sw x18, 8(sp)
sw x22, 12(sp)
sw x7, 16(sp)
sw x17, 20(sp)
sw x8, 24(sp)

or x9, t0, t1
p.subuRNr x25, t0, t1
and x10, t0, t1
p.extbz x19, t1
xor x11, t0, t1
p.subRNr x24, t0, t1 
sw x9, 8(sp)
sw x25, 12(sp)
sw x10, 8(sp)
sw x19, 8(sp)
sw x11, 12(sp)
sw x24, 8(sp)

//-----------------------------------------LESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS---------------
li t0,0x99229922
li t1,0x22992299
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

//----------------------------------------
li t0,0x99922699
li t1,0x22699922
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

//-----------------------------------------
li t0,0xcc26cc26
li t1,0x26cc26cc
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0xccc263cc
li t1,0x263ccc26
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x88778877
li t1,0x77887788
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x88877788
li t1,0x77788877
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------


li t0,0xee11ee11
li t1,0x11ee11ee
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0xeee111ee
li t1,0x111eee11
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x24242424
li t1,0x42424242
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x2244244
li t1,0x442442
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x2224442
li t1,0x4442244
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x44224422
li t1,0x22442244
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x46464646
li t1,0x64646464
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x44422644
li t1,0x22644422
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x68686868
li t1,0x86868686
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)

//-----------------------------------------
li t0,0x22882288
li t1,0x88228822
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x22688822
li t1,0x88822688
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x8a8a8a8a
li t1,0xa8a8a8a8
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x88aa88aa
li t1,0xaa88aa88
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x888aaa88
li t1,0xaaa888aa
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0xcececece
li t1,0xecececec
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0xcceeccee
li t1,0xeecceecc
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0xccceeecc
li t1,0xeeecccee
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x13131313
li t1,0x31313131
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x11261126
li t1,0x26112611
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x11126311
li t1,0x26311126
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x35353535
li t1,0x53535353
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x26222622
li t1,0x22262226
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x26322526
li t1,0x22526322
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x57575757
li t1,0x75757575
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x22577722
li t1,0x77722577
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------

li t0,0x79797979
li t1,0x97979797
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x77997799
li t1,0x99779977
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x77799977
li t1,0x99977799
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x9b9b9b9b
li t1,0xb9b9b9b9
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x99bb99bb
li t1,0xbb99bb99
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0x999bbb99
li t1,0xbbb999bb
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0xbdbdbdbd
li t1,0xdbdbdbdb
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0xbbddbbdd
li t1,0xddbbddbb
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
//-----------------------------------------
li t0,0xbbbdddbb
li t1,0xdddbbbdd
xori x16,t1,43
ori x7,t1,0
andi x8,t0,23
addi x9, t1, 35
slli x10,t1,26
srli x11,t0,15
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)
srai x12,t1,19
slti x13,t0,8
ori x14,t1,4
andi x15,t0,4
srli x16,t1,4
slli x17,t0,4
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
p.ror x8, t0, t1
sw x8, 12(sp)

p.abs x9, t0
p.slet x10, t0, t1 
p.sletu x11, t1,t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
p.min x12, t0, t1 
add x13, t0, t1
sw x12, 8(sp)
sw x13, 8(sp)
p.addNr x14, t0, t1  
p.minu x13, t1,t0
sw x14, 4(sp)
sw x13, 8(sp)
p.max x14, t0, t1
p.maxu x15, t1, t0 
sw x14, 4(sp)
sw x15, 8(sp)


p.adduNr x15, t0, t1 
p.addRNr x16, t0, t1
p.adduRNr x17, t0, t1
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)
sub x18, t0, t1
sw x18,4(sp)
p.subNr x22, t0, t1 
p.subuNr x23, t0, t1
sra x8, t0, t1
sll x7, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
p.subRNr x24, t0, t1 
p.subuRNr x25, t0, t1
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)

sll x7, t0, t1
sra x8, t0, t1
sw x7, 12(sp)
sw x8, 8(sp)
or x9, t0, t1
and x10, t0, t1
xor x11, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)

p.subuRNr x25, t0, t1
p.subRNr x24, t0, t1 
p.subuNr x23, t0, t1
p.subNr x22, t0, t1 
sub x18, t0, t1
sw x18, 4(sp)
sw x22, 8(sp)
sw x23, 12(sp)
sw x24, 8(sp)
sw x25, 12(sp)
p.adduRNr x17, t0, t1
p.addRNr x16, t0, t1
p.adduNr x15, t0, t1 
xor x11, t0, t1
and x10, t0, t1
or x9, t0, t1
sw x9, 8(sp)
sw x10, 12(sp)
sw x11, 8(sp)
p.addNr x14, t0, t1 
add x13, t0, t1
sw x13, 8(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 8(sp)
sw x17, 12(sp)

p.maxu x15, t1, t0 
p.max x14, t0, t1
sw x14, 4(sp)
sw x15, 8(sp)
p.minu x13, t1,t0
p.min x12, t0, t1 
sw x12, 4(sp)
sw x13, 8(sp)
p.sletu x11, t1,t0
p.slet x10, t0, t1 
p.abs x9, t0
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)

p.ror x8, t0, t1
p.cnt x7, t0
sw x7, 8(sp)
sw x8, 12(sp)

slli x17,t0,4
srli x16,t1,4
andi x15,t0,4
ori x14,t1,4
slti x13,t0,8
srai x12,t1,19
sw x12, 4(sp)
sw x13, 4(sp)
sw x14, 4(sp)
sw x15, 4(sp)
sw x16, 4(sp)
sw x17, 4(sp)
srli x11,t0,15
slli x10,t1,26
addi x9, t1, 35
andi x8,t0,23
ori x7,t1,0
xori x16,t1,43
sw x16, 4(sp)
sw x7, 4(sp)
sw x8, 4(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x11, 4(sp)


/*!!!!!!!!!!!!!!!!!!!!!!MUL!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/


li t0,0xffffffff
li t1,0x00000001
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)


p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-------------------------------------------


li t0,0xb0b0b0b0
li t1,0x0b0b0b0b
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//---------------------------------------

li t0,0xf0f0f0f0
li t1,0x0f0f0f0f
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//---------------------------------------


li t0,0xc0c0c0c0
li t1,0x0c0c0c0c
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//---------------------------------------

li t0,0xffffffff
li t1,0xffffffff
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//---------------------------------------


li t0,0xffffffff
li t1,0x88888888
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)


p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------

li t0,0xf000000f
li t1,0x0ffffff0
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------

li t0,0xaaaaaaaa
li t1,0xbbbbbbbb
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------

li t0,0x80000000
li t1,0xeeeeeeee
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------

li t0,0x80808080
li t1,0x08080808
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------
//-----------------------------------------

li t0,0x11111111
li t1,0xffffffff
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------

li t0,0x88888888
li t1,0x0fffffff
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------

li t0,0x40404040
li t1,0x08080808
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------

li t0,0x44444444
li t1,0x88888888
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 16
p.mulu x12, t0, t1
p.macuN x22, t0, t1,16
p.macuRN x24, t0, t1,16
p.machhuN x23, t0, t1,16
p.machhuRN x25, t0, t1,16
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 16
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,16
p.muluRN x16, t0, t1,16
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,16
p.mulhhuRN x17, t0, t1,16
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,16
p.macsRN x20, t0, t1,16
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,16
p.machhsRN x21, t0, t1,16
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,16
p.machhsN x19, t0, t1,16
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,16
p.macsN x18, t0, t1,16
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,16
p.mulhhuN x15, t0, t1,16
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,16
p.muluN x14, t0, t1,16
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 16
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,16
p.machhuRN x25, t0, t1,16
p.macuRN x24, t0, t1,16
p.macuN x22, t0, t1,16
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 16
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------

li t0,0x40404040
li t1,0x04040404
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------

li t0,0x60606060
li t1,0x06060606
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------

li t0,0x22222222
li t1,0x44444444
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

li t0,0xffffffff
li t1,0x88888888

p.msu x8, t0, t1
p.machhuN x23, t0, t1,2
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,2
mul x16, t0, t1
p.mulsN x10, t0, t1, 2
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//-------------------------------------------


li t0,0xb0b0b0b0
li t1,0x0b0b0b0b
p.msu x8, t0, t1
p.machhuN x23, t0, t1,2
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,2
mul x16, t0, t1
p.mulsN x10, t0, t1, 2
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)
//---------------------------------------


li t0,0x88888888
li t1,0x44444444

p.msu x8, t0, t1
p.machhuN x23, t0, t1,2
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,2
mul x16, t0, t1
p.mulsN x10, t0, t1, 2
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)


//---------------------------------------

li t0,0x11111111
li t1,0x22222222

p.msu x8, t0, t1
p.machhuN x23, t0, t1,2
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,2
mul x16, t0, t1
p.mulsN x10, t0, t1, 2
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------

li t0,0x04040404
li t1,0x06060606

p.msu x8, t0, t1
p.machhuN x23, t0, t1,2
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,2
mul x16, t0, t1
p.mulsN x10, t0, t1, 2
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,4
sw x14, 4(sp)
p.machhsN x19, t0, t1,4
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 4
sw x11, 8(sp)
p.macsRN x20, t0, t1,4
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,4
sw x21, 4(sp)
p.macsN x18, t0, t1,4
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,4
p.mulhhuRN x17, t0, t1,4
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,4
sw x16, 4(sp)
p.macuRN x24, t0, t1,4
p.macuN x22, t0, t1,4
p.mulsN x10, t0, t1, 4
mul x16, t0, t1
p.machhuRN x25, t0, t1,4
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------

li t0,0x88844444
li t1,0x44488888

p.msu x8, t0, t1
p.machhuN x23, t0, t1,8
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,8
mul x16, t0, t1
p.mulsN x10, t0, t1, 8
p.macuN x22, t0, t1,8
p.macuRN x24, t0, t1,8
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,8
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,8
p.mulhhuN x15, t0, t1,8
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,8
sw x18, 4(sp)
p.machhsRN x21, t0, t1,8
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,8
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 8
sw x11, 8(sp)
p.machhsN x19, t0, t1,8
sw x19, 8(sp)
p.muluN x14, t0, t1,8
sw x14, 4(sp)


p.muluN x14, t0, t1,8
sw x14, 4(sp)
p.machhsN x19, t0, t1,8
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 8
sw x11, 8(sp)
p.macsRN x20, t0, t1,8
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,8
sw x21, 4(sp)
p.macsN x18, t0, t1,8
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,8
p.mulhhuRN x17, t0, t1,8
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,8
sw x16, 4(sp)
p.macuRN x24, t0, t1,8
p.macuN x22, t0, t1,8
p.mulsN x10, t0, t1, 8
mul x16, t0, t1
p.machhuRN x25, t0, t1,8
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,8
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------
li t0,0x06060606
li t1,0x60606060

p.msu x8, t0, t1
p.machhuN x23, t0, t1,2
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,2
mul x16, t0, t1
p.mulsN x10, t0, t1, 2
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------


//---------------------------------------

li t0,0x44444444
li t1,0x88888888

p.msu x8, t0, t1
p.machhuN x23, t0, t1,2
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,2
mul x16, t0, t1
p.mulsN x10, t0, t1, 2
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------
li t0,0xaaaaaaaa
li t1,0xb0b0b0b0

p.msu x8, t0, t1
p.machhuN x23, t0, t1,2
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,2
mul x16, t0, t1
p.mulsN x10, t0, t1, 2
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------
li t0,0xbbbbbbbb
li t1,0x88888888

p.msu x8, t0, t1
p.machhuN x23, t0, t1,2
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,2
mul x16, t0, t1
p.mulsN x10, t0, t1, 2
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------

li t0,0xcccccccc
li t1,0xdddddddd

p.msu x8, t0, t1
p.machhuN x23, t0, t1,2
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,2
mul x16, t0, t1
p.mulsN x10, t0, t1, 2
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
sw x8, 8(sp)
sw x23, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x10, 4(sp)
sw x22, 4(sp)
sw x24, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------
li t0,0xabababab
li t1,0xbabababa

p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)

//---------------------------------------

//---------------------------------------
li t0,0xefefefef
li t1,0xfefefefe

p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)

p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------
li t0,0x87878787
li t1,0x78787878

p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)

p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------

li t0,0xcdcdcdcd
li t1,0xdcdcdcdc

p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)

p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------
li t0,0x35353535
li t1,0x53535353

p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)

p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------

li t0,0x11111111
li t1,0x26262626

p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x17, 4(sp)
sw x15, 8(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.muluN x14, t0, t1,2
sw x14, 4(sp)


p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)

p.muluN x14, t0, t1,2
sw x14, 4(sp)
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
p.macsRN x20, t0, t1,2
sw x20, 4(sp)
p.mulhhu x13, t0, t1
sw x13, 4(sp)
p.machhsRN x21, t0, t1,2
sw x21, 4(sp)
p.macsN x18, t0, t1,2
sw x18, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
sw x16, 4(sp)
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulsN x10, t0, t1, 2
mul x16, t0, t1
p.machhuRN x25, t0, t1,2
p.mulu x12, t0, t1
p.muls x9, t0, t1
p.mac x7, t0, t1
p.machhuN x23, t0, t1,2
p.msu x8, t0, t1
sw x24, 4(sp)
sw x22, 4(sp)
sw x10, 4(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x9, 4(sp)
sw x7, 8(sp)
sw x23, 8(sp)
sw x8, 8(sp)

//---------------------------------------
//!!!!!!"""""""""""""""""""""""""""""""""""

li t0,0x22228888
li t1,0x00002222

p.muluRN x16, t0, t1,4
p.macsN x18, t0, t1,4
p.macsRN x20, t0, t1,4
p.machhsRN x21, t0, t1,4
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,4
mul x16, t0, t1
p.machhuN x23, t0, t1,4
p.mulsRN x11, t0, t1, 4
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,4
p.muls x9, t0, t1
p.macuRN x24, t0, t1,4
p.mulsN x10, t0, t1, 4
p.machhsN x19, t0, t1,4
p.muluN x14, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.mulhhuN x15, t0, t1,4
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.muluN x14, t0, t1,4
p.machhsN x19, t0, t1,4
p.mulsN x10, t0, t1, 4
p.macuRN x24, t0, t1,4
p.muls x9, t0, t1
p.macuN x22, t0, t1,4
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 4
p.machhuN x23, t0, t1,4
mul x16, t0, t1
p.machhuRN x25, t0, t1,4
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,4
p.macsRN x20, t0, t1,4
p.macsN x18, t0, t1,4
p.muluRN x16, t0, t1,4
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x88888888
li t1,0x22222222

p.muluRN x16, t0, t1,4
p.macsN x18, t0, t1,4
p.macsRN x20, t0, t1,4
p.machhsRN x21, t0, t1,4
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,4
mul x16, t0, t1
p.machhuN x23, t0, t1,4
p.mulsRN x11, t0, t1, 4
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,4
p.muls x9, t0, t1
p.macuRN x24, t0, t1,4
p.mulsN x10, t0, t1, 4
p.machhsN x19, t0, t1,4
p.muluN x14, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.mulhhuN x15, t0, t1,4
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.muluN x14, t0, t1,4
p.machhsN x19, t0, t1,4
p.mulsN x10, t0, t1, 4
p.macuRN x24, t0, t1,4
p.muls x9, t0, t1
p.macuN x22, t0, t1,4
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 4
p.machhuN x23, t0, t1,4
mul x16, t0, t1
p.machhuRN x25, t0, t1,4
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,4
p.macsRN x20, t0, t1,4
p.macsN x18, t0, t1,4
p.muluRN x16, t0, t1,4
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x04040404
li t1,0x22222222

p.muluRN x16, t0, t1,4
p.macsN x18, t0, t1,4
p.macsRN x20, t0, t1,4
p.machhsRN x21, t0, t1,4
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,4
mul x16, t0, t1
p.machhuN x23, t0, t1,4
p.mulsRN x11, t0, t1, 4
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,4
p.muls x9, t0, t1
p.macuRN x24, t0, t1,4
p.mulsN x10, t0, t1, 4
p.machhsN x19, t0, t1,4
p.muluN x14, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.mulhhuN x15, t0, t1,4
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.muluN x14, t0, t1,4
p.machhsN x19, t0, t1,4
p.mulsN x10, t0, t1, 4
p.macuRN x24, t0, t1,4
p.muls x9, t0, t1
p.macuN x22, t0, t1,4
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 4
p.machhuN x23, t0, t1,4
mul x16, t0, t1
p.machhuRN x25, t0, t1,4
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,4
p.macsRN x20, t0, t1,4
p.macsN x18, t0, t1,4
p.muluRN x16, t0, t1,4
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x44444444
li t1,0x22222222

p.muluRN x16, t0, t1,4
p.macsN x18, t0, t1,4
p.macsRN x20, t0, t1,4
p.machhsRN x21, t0, t1,4
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,4
mul x16, t0, t1
p.machhuN x23, t0, t1,4
p.mulsRN x11, t0, t1, 4
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,4
p.muls x9, t0, t1
p.macuRN x24, t0, t1,4
p.mulsN x10, t0, t1, 4
p.machhsN x19, t0, t1,4
p.muluN x14, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.mulhhuN x15, t0, t1,4
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.muluN x14, t0, t1,4
p.machhsN x19, t0, t1,4
p.mulsN x10, t0, t1, 4
p.macuRN x24, t0, t1,4
p.muls x9, t0, t1
p.macuN x22, t0, t1,4
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 4
p.machhuN x23, t0, t1,4
mul x16, t0, t1
p.machhuRN x25, t0, t1,4
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,4
p.macsRN x20, t0, t1,4
p.macsN x18, t0, t1,4
p.muluRN x16, t0, t1,4
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xffffffff
li t1,0x22222222

p.muluRN x16, t0, t1,4
p.macsN x18, t0, t1,4
p.macsRN x20, t0, t1,4
p.machhsRN x21, t0, t1,4
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,4
mul x16, t0, t1
p.machhuN x23, t0, t1,4
p.mulsRN x11, t0, t1, 4
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,4
p.muls x9, t0, t1
p.macuRN x24, t0, t1,4
p.mulsN x10, t0, t1, 4
p.machhsN x19, t0, t1,4
p.muluN x14, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.mulhhuN x15, t0, t1,4
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.muluN x14, t0, t1,4
p.machhsN x19, t0, t1,4
p.mulsN x10, t0, t1, 4
p.macuRN x24, t0, t1,4
p.muls x9, t0, t1
p.macuN x22, t0, t1,4
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 4
p.machhuN x23, t0, t1,4
mul x16, t0, t1
p.machhuRN x25, t0, t1,4
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,4
p.macsRN x20, t0, t1,4
p.macsN x18, t0, t1,4
p.muluRN x16, t0, t1,4
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x70707070
li t1,0x07070707

p.muluRN x16, t0, t1,4
p.macsN x18, t0, t1,4
p.macsRN x20, t0, t1,4
p.machhsRN x21, t0, t1,4
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,4
mul x16, t0, t1
p.machhuN x23, t0, t1,4
p.mulsRN x11, t0, t1, 4
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,4
p.muls x9, t0, t1
p.macuRN x24, t0, t1,4
p.mulsN x10, t0, t1, 4
p.machhsN x19, t0, t1,4
p.muluN x14, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.mulhhuN x15, t0, t1,4
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.muluN x14, t0, t1,4
p.machhsN x19, t0, t1,4
p.mulsN x10, t0, t1, 4
p.macuRN x24, t0, t1,4
p.muls x9, t0, t1
p.macuN x22, t0, t1,4
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 4
p.machhuN x23, t0, t1,4
mul x16, t0, t1
p.machhuRN x25, t0, t1,4
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,4
p.macsRN x20, t0, t1,4
p.macsN x18, t0, t1,4
p.muluRN x16, t0, t1,4
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xaaaaaaaa
li t1,0x00000888

p.muluRN x16, t0, t1,4
p.macsN x18, t0, t1,4
p.macsRN x20, t0, t1,4
p.machhsRN x21, t0, t1,4
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,4
mul x16, t0, t1
p.machhuN x23, t0, t1,4
p.mulsRN x11, t0, t1, 4
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,4
p.muls x9, t0, t1
p.macuRN x24, t0, t1,4
p.mulsN x10, t0, t1, 4
p.machhsN x19, t0, t1,4
p.muluN x14, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.mulhhuN x15, t0, t1,4
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,4
p.mulhhuRN x17, t0, t1,4
p.muluN x14, t0, t1,4
p.machhsN x19, t0, t1,4
p.mulsN x10, t0, t1, 4
p.macuRN x24, t0, t1,4
p.muls x9, t0, t1
p.macuN x22, t0, t1,4
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 4
p.machhuN x23, t0, t1,4
mul x16, t0, t1
p.machhuRN x25, t0, t1,4
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,4
p.macsRN x20, t0, t1,4
p.macsN x18, t0, t1,4
p.muluRN x16, t0, t1,4
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xbbccbbcc
li t1,0x22222222

p.muluRN x16, t0, t1,6
p.macsN x18, t0, t1,6
p.macsRN x20, t0, t1,6
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,6
mul x16, t0, t1
p.machhuN x23, t0, t1,6
p.mulsRN x11, t0, t1, 6
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,6
p.muls x9, t0, t1
p.macuRN x24, t0, t1,6
p.mulsN x10, t0, t1, 6
p.machhsN x19, t0, t1,6
p.muluN x14, t0, t1,6
p.mulhhuRN x17, t0, t1,6
p.mulhhuN x15, t0, t1,6
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,6
p.mulhhuRN x17, t0, t1,6
p.muluN x14, t0, t1,6
p.machhsN x19, t0, t1,6
p.mulsN x10, t0, t1, 6
p.macuRN x24, t0, t1,6
p.muls x9, t0, t1
p.macuN x22, t0, t1,6
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 6
p.machhuN x23, t0, t1,6
mul x16, t0, t1
p.machhuRN x25, t0, t1,6
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,6
p.macsRN x20, t0, t1,6
p.macsN x18, t0, t1,6
p.muluRN x16, t0, t1,6
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xcccccccc
li t1,0x63434343

p.muluRN x16, t0, t1,6
p.macsN x18, t0, t1,6
p.macsRN x20, t0, t1,6
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,6
mul x16, t0, t1
p.machhuN x23, t0, t1,6
p.mulsRN x11, t0, t1, 6
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,6
p.muls x9, t0, t1
p.macuRN x24, t0, t1,6
p.mulsN x10, t0, t1, 6
p.machhsN x19, t0, t1,6
p.muluN x14, t0, t1,6
p.mulhhuRN x17, t0, t1,6
p.mulhhuN x15, t0, t1,6
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,6
p.mulhhuRN x17, t0, t1,6
p.muluN x14, t0, t1,6
p.machhsN x19, t0, t1,6
p.mulsN x10, t0, t1, 6
p.macuRN x24, t0, t1,6
p.muls x9, t0, t1
p.macuN x22, t0, t1,6
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 6
p.machhuN x23, t0, t1,6
mul x16, t0, t1
p.machhuRN x25, t0, t1,6
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,6
p.macsRN x20, t0, t1,6
p.macsN x18, t0, t1,6
p.muluRN x16, t0, t1,6
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x88888888
li t1,0xabcdefab

p.muluRN x16, t0, t1,6
p.macsN x18, t0, t1,6
p.macsRN x20, t0, t1,6
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,6
mul x16, t0, t1
p.machhuN x23, t0, t1,6
p.mulsRN x11, t0, t1, 6
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,6
p.muls x9, t0, t1
p.macuRN x24, t0, t1,6
p.mulsN x10, t0, t1, 6
p.machhsN x19, t0, t1,6
p.muluN x14, t0, t1,6
p.mulhhuRN x17, t0, t1,6
p.mulhhuN x15, t0, t1,6
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,6
p.mulhhuRN x17, t0, t1,6
p.muluN x14, t0, t1,6
p.machhsN x19, t0, t1,6
p.mulsN x10, t0, t1, 6
p.macuRN x24, t0, t1,6
p.muls x9, t0, t1
p.macuN x22, t0, t1,6
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 6
p.machhuN x23, t0, t1,6
mul x16, t0, t1
p.machhuRN x25, t0, t1,6
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,6
p.macsRN x20, t0, t1,6
p.macsN x18, t0, t1,6
p.muluRN x16, t0, t1,6
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xbbbbbbbb
li t1,0x88888888

p.muluRN x16, t0, t1,6
p.macsN x18, t0, t1,6
p.macsRN x20, t0, t1,6
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,6
mul x16, t0, t1
p.machhuN x23, t0, t1,6
p.mulsRN x11, t0, t1, 6
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,6
p.muls x9, t0, t1
p.macuRN x24, t0, t1,6
p.mulsN x10, t0, t1, 6
p.machhsN x19, t0, t1,6
p.muluN x14, t0, t1,6
p.mulhhuRN x17, t0, t1,6
p.mulhhuN x15, t0, t1,6
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,6
p.mulhhuRN x17, t0, t1,6
p.muluN x14, t0, t1,6
p.machhsN x19, t0, t1,6
p.mulsN x10, t0, t1, 6
p.macuRN x24, t0, t1,6
p.muls x9, t0, t1
p.macuN x22, t0, t1,6
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 6
p.machhuN x23, t0, t1,6
mul x16, t0, t1
p.machhuRN x25, t0, t1,6
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,6
p.macsRN x20, t0, t1,6
p.macsN x18, t0, t1,6
p.muluRN x16, t0, t1,6
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xbbbbbbbb
li t1,0x11bb11bb

p.muluRN x16, t0, t1,8
p.macsN x18, t0, t1,8
p.macsRN x20, t0, t1,8
p.machhsRN x21, t0, t1,8
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,8
mul x16, t0, t1
p.machhuN x23, t0, t1,8
p.mulsRN x11, t0, t1, 8
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,8
p.muls x9, t0, t1
p.macuRN x24, t0, t1,8
p.mulsN x10, t0, t1, 8
p.machhsN x19, t0, t1,8
p.muluN x14, t0, t1,8
p.mulhhuRN x17, t0, t1,8
p.mulhhuN x15, t0, t1,8
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,8
p.mulhhuRN x17, t0, t1,8
p.muluN x14, t0, t1,8
p.machhsN x19, t0, t1,8
p.mulsN x10, t0, t1, 8
p.macuRN x24, t0, t1,8
p.muls x9, t0, t1
p.macuN x22, t0, t1,8
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 8
p.machhuN x23, t0, t1,8
mul x16, t0, t1
p.machhuRN x25, t0, t1,8
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,8
p.macsRN x20, t0, t1,8
p.macsN x18, t0, t1,8
p.muluRN x16, t0, t1,8
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x44444444
li t1,0x6f6f6f6f

p.muluRN x16, t0, t1,8
p.macsN x18, t0, t1,8
p.macsRN x20, t0, t1,8
p.machhsRN x21, t0, t1,8
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,8
mul x16, t0, t1
p.machhuN x23, t0, t1,8
p.mulsRN x11, t0, t1, 8
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,8
p.muls x9, t0, t1
p.macuRN x24, t0, t1,8
p.mulsN x10, t0, t1, 8
p.machhsN x19, t0, t1,8
p.muluN x14, t0, t1,8
p.mulhhuRN x17, t0, t1,8
p.mulhhuN x15, t0, t1,8
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,8
p.mulhhuRN x17, t0, t1,8
p.muluN x14, t0, t1,8
p.machhsN x19, t0, t1,8
p.mulsN x10, t0, t1, 8
p.macuRN x24, t0, t1,8
p.muls x9, t0, t1
p.macuN x22, t0, t1,8
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 8
p.machhuN x23, t0, t1,8
mul x16, t0, t1
p.machhuRN x25, t0, t1,8
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,8
p.macsRN x20, t0, t1,8
p.macsN x18, t0, t1,8
p.muluRN x16, t0, t1,8
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x95959595
li t1,0x59595959

p.muluRN x16, t0, t1,8
p.macsN x18, t0, t1,8
p.macsRN x20, t0, t1,8
p.machhsRN x21, t0, t1,8
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,8
mul x16, t0, t1
p.machhuN x23, t0, t1,8
p.mulsRN x11, t0, t1, 8
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,8
p.muls x9, t0, t1
p.macuRN x24, t0, t1,8
p.mulsN x10, t0, t1, 8
p.machhsN x19, t0, t1,8
p.muluN x14, t0, t1,8
p.mulhhuRN x17, t0, t1,8
p.mulhhuN x15, t0, t1,8
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,8
p.mulhhuRN x17, t0, t1,8
p.muluN x14, t0, t1,8
p.machhsN x19, t0, t1,8
p.mulsN x10, t0, t1, 8
p.macuRN x24, t0, t1,8
p.muls x9, t0, t1
p.macuN x22, t0, t1,8
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 8
p.machhuN x23, t0, t1,8
mul x16, t0, t1
p.machhuRN x25, t0, t1,8
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,8
p.macsRN x20, t0, t1,8
p.macsN x18, t0, t1,8
p.muluRN x16, t0, t1,8
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xdddddddd
li t1,0x0a0a0a0a

p.muluRN x16, t0, t1,8
p.macsN x18, t0, t1,8
p.macsRN x20, t0, t1,8
p.machhsRN x21, t0, t1,8
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,8
mul x16, t0, t1
p.machhuN x23, t0, t1,8
p.mulsRN x11, t0, t1, 8
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,8
p.muls x9, t0, t1
p.macuRN x24, t0, t1,8
p.mulsN x10, t0, t1, 8
p.machhsN x19, t0, t1,8
p.muluN x14, t0, t1,8
p.mulhhuRN x17, t0, t1,8
p.mulhhuN x15, t0, t1,8
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,8
p.mulhhuRN x17, t0, t1,8
p.muluN x14, t0, t1,8
p.machhsN x19, t0, t1,8
p.mulsN x10, t0, t1, 8
p.macuRN x24, t0, t1,8
p.muls x9, t0, t1
p.macuN x22, t0, t1,8
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 8
p.machhuN x23, t0, t1,8
mul x16, t0, t1
p.machhuRN x25, t0, t1,8
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,8
p.macsRN x20, t0, t1,8
p.macsN x18, t0, t1,8
p.muluRN x16, t0, t1,8
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xdddddddd
li t1,0x88888888

p.muluRN x16, t0, t1,10
p.macsN x18, t0, t1,10
p.macsRN x20, t0, t1,10
p.machhsRN x21, t0, t1,10
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,10
mul x16, t0, t1
p.machhuN x23, t0, t1,10
p.mulsRN x11, t0, t1, 10
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,10
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 10
p.machhsN x19, t0, t1,10
p.muluN x14, t0, t1,10
p.mulhhuRN x17, t0, t1,10
p.mulhhuN x15, t0, t1,10
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,10
p.mulhhuRN x17, t0, t1,10
p.muluN x14, t0, t1,10
p.machhsN x19, t0, t1,10
p.mulsN x10, t0, t1, 10
p.macuRN x24, t0, t1,10
p.muls x9, t0, t1
p.macuN x22, t0, t1,10
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 10
p.machhuN x23, t0, t1,10
mul x16, t0, t1
p.machhuRN x25, t0, t1,10
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,10
p.macsRN x20, t0, t1,10
p.macsN x18, t0, t1,10
p.muluRN x16, t0, t1,10
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xdd22dd22
li t1,0x22dd22dd

p.muluRN x16, t0, t1,12
p.macsN x18, t0, t1,12
p.macsRN x20, t0, t1,12
p.machhsRN x21, t0, t1,12
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,12
mul x16, t0, t1
p.machhuN x23, t0, t1,12
p.mulsRN x11, t0, t1, 12
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,12
p.muls x9, t0, t1
p.macuRN x24, t0, t1,12
p.mulsN x10, t0, t1, 12
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,12
p.mulhhuRN x17, t0, t1,12
p.mulhhuN x15, t0, t1,12
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,12
p.mulhhuRN x17, t0, t1,12
p.muluN x14, t0, t1,12
p.machhsN x19, t0, t1,12
p.mulsN x10, t0, t1, 12
p.macuRN x24, t0, t1,12
p.muls x9, t0, t1
p.macuN x22, t0, t1,12
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 12
p.machhuN x23, t0, t1,12
mul x16, t0, t1
p.machhuRN x25, t0, t1,12
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,12
p.macsRN x20, t0, t1,12
p.macsN x18, t0, t1,12
p.muluRN x16, t0, t1,12
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xdd44dd44
li t1,0x44dd44dd

p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x88228822
li t1,0x22882288

p.muluRN x16, t0, t1,16
p.macsN x18, t0, t1,16
p.macsRN x20, t0, t1,16
p.machhsRN x21, t0, t1,16
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,16
mul x16, t0, t1
p.machhuN x23, t0, t1,16
p.mulsRN x11, t0, t1, 16
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,16
p.muls x9, t0, t1
p.macuRN x24, t0, t1,16
p.mulsN x10, t0, t1, 16
p.machhsN x19, t0, t1,16
p.muluN x14, t0, t1,16
p.mulhhuRN x17, t0, t1,16
p.mulhhuN x15, t0, t1,16
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,16
p.mulhhuRN x17, t0, t1,16
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,16
p.mulsN x10, t0, t1, 16
p.macuRN x24, t0, t1,16
p.muls x9, t0, t1
p.macuN x22, t0, t1,16
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 16
p.machhuN x23, t0, t1,16
mul x16, t0, t1
p.machhuRN x25, t0, t1,16
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,16
p.macsRN x20, t0, t1,16
p.macsN x18, t0, t1,16
p.muluRN x16, t0, t1,16
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xd6d6d6d6
li t1,0x6d6d6d6d

p.muluRN x16, t0, t1,18
p.macsN x18, t0, t1,18
p.macsRN x20, t0, t1,18
p.machhsRN x21, t0, t1,18
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,18
mul x16, t0, t1
p.machhuN x23, t0, t1,18
p.mulsRN x11, t0, t1, 18
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,18
p.muls x9, t0, t1
p.macuRN x24, t0, t1,18
p.mulsN x10, t0, t1, 18
p.machhsN x19, t0, t1,18
p.muluN x14, t0, t1,18
p.mulhhuRN x17, t0, t1,18
p.mulhhuN x15, t0, t1,18
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,20
p.mulhhuRN x17, t0, t1,20
p.muluN x14, t0, t1,20
p.machhsN x19, t0, t1,20
p.mulsN x10, t0, t1, 20
p.macuRN x24, t0, t1,20
p.muls x9, t0, t1
p.macuN x22, t0, t1,20
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 20
p.machhuN x23, t0, t1,20
mul x16, t0, t1
p.machhuRN x25, t0, t1,20
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,20
p.macsRN x20, t0, t1,20
p.macsN x18, t0, t1,20
p.muluRN x16, t0, t1,20
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x2222aaaa
li t1,0xaaaa4444

p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x46464646
li t1,0x64646464

p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------------------------------------------

li t0,0x09090909
li t1,0x06060606

p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x99999999
li t1,0x22222222

p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x69999999
li t1,0x92222226
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x22999999
li t1,0x99222222
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x22699999
li t1,0x99922226
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x22229999
li t1,0x99992222
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x22226999
li t1,0x99999226
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x22222299
li t1,0x99999922
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x22222269
li t1,0x99999996
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------

li t0,0x22222222
li t1,0x99999999
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x96969696
li t1,0x69696969
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x81818181
li t1,0x18181818
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x88118811
li t1,0x11881188
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88811188
li t1,0x11188811
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88881111
li t1,0x11118888
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88888111
li t1,0x11111888
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88888811
li t1,0x11111188
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88888881
li t1,0x11111118
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88888888
li t1,0x11111111
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xc3c3c3c3
li t1,0x3c3c3c3c
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xcc26cc26
li t1,0x26cc26cc
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xccc263cc
li t1,0x263ccc26
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xcccc2626
li t1,0x2626cccc
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xccccc263
li t1,0x26263ccc
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xcccccc26
li t1,0x262626cc
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xccccccc3
li t1,0x2626263c
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xcccccccc
li t1,0x26262626
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xe7e7e7e7
li t1,0x7e7e7e7e
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xee77ee77
li t1,0x77ee77ee
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xeee777ee
li t1,0x777eee77
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xeeee7777
li t1,0x7777eeee
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xeeeee777
li t1,0x77777eee
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xeeeeee77
li t1,0x777777ee
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xeeeeeee7
li t1,0x7777777e
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xeeeeeeee
li t1,0x77777777
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)



li t0,0xf0f0f0f0
li t1,0x0f0f0f0f
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x00ff00ff
li t1,0xff00ff00
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xfff000ff
li t1,0x000fff00
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xffff0000
li t1,0x0000ffff
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xfffff000
li t1,0x00000fff
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xffffff00
li t1,0x000000ff
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xfffffff0
li t1,0x0000000f
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xffffffff
li t1,0x00000000
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0xeeeeeeee
li t1,0x11111111
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xeeeeeeee
li t1,0x11111111
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xe1e1e1e1
li t1,0x1e1e1e1e
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xee11ee11
li t1,0x11ee11ee
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xeee111ee
li t1,0x111eee11
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xeeee1111
li t1,0x1111eeee
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xeeeee111
li t1,0x11111eee
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xeeeeee11
li t1,0x111111ee
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xeeeeeee1
li t1,0x1111111e
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x88888888
li t1,0x77777777
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x87878787
li t1,0x78787878
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x88778877
li t1,0x77887788
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x88877788
li t1,0x77788877
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x88887777
li t1,0x77778888
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88888777
li t1,0x77777888
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x88888877
li t1,0x77777788
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

li t0,0xeeeeeeee
li t1,0x11111111
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88888887
li t1,0x77777778
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)

li t0,0xeeeeeeee
li t1,0x11111111
p.muluRN x16, t0, t1,30
p.macsN x18, t0, t1,30
p.macsRN x20, t0, t1,30
p.machhsRN x21, t0, t1,30
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,30
mul x16, t0, t1
p.machhuN x23, t0, t1,30
p.mulsRN x11, t0, t1, 30
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,30
p.muls x9, t0, t1
p.macuRN x24, t0, t1,30
p.mulsN x10, t0, t1, 30
p.machhsN x19, t0, t1,30
p.muluN x14, t0, t1,30
p.mulhhuRN x17, t0, t1,30
p.mulhhuN x15, t0, t1,30
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,31
p.mulhhuRN x17, t0, t1,31
p.muluN x14, t0, t1,31
p.machhsN x19, t0, t1,31
p.mulsN x10, t0, t1, 31
p.macuRN x24, t0, t1,31
p.muls x9, t0, t1
p.macuN x22, t0, t1,31
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 31
p.machhuN x23, t0, t1,31
mul x16, t0, t1
p.machhuRN x25, t0, t1,31
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,31
p.macsRN x20, t0, t1,31
p.macsN x18, t0, t1,31
p.muluRN x16, t0, t1,31
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x99229922
li t1,0x22992299
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)

//-----------------------------------------
li t0,0x99922699
li t1,0x22699922
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xcc26cc26
li t1,0x26cc26cc
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xccc263cc
li t1,0x263ccc26
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------
li t0,0x88778877
li t1,0x77887788
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88877788
li t1,0x77788877
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)

//-----------------------------------------
li t0,0xee11ee11
li t1,0x11ee11ee
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xeee111ee
li t1,0x111eee11
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xff00ff00
li t1,0x00ff00ff
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)

//-----------------------------------------
li t0,0xfff000ff
li t1,0x000fff00
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x24242424
li t1,0x42424242
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x2244244
li t1,0x442442
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)

//-----------------------------------------
li t0,0x2224442
li t1,0x4442244
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x44224422
li t1,0x22442244
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x46464646
li t1,0x64646464
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)

//-----------------------------------------
li t0,0x44422644
li t1,0x22644422
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x68686868
li t1,0x86868686
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x22882288
li t1,0x88228822
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)

//-----------------------------------------
li t0,0x22688822
li t1,0x88822688
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x8a8a8a8a
li t1,0xa8a8a8a8
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88aa88aa
li t1,0xaa88aa88
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)

//-----------------------------------------
li t0,0x888aaa88
li t1,0xaaa888aa
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xcececece
li t1,0xecececec
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xcceeccee
li t1,0xeecceecc
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)

//-----------------------------------------
li t0,0xccceeecc
li t1,0xeeecccee
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x13131313
li t1,0x31313131
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x11261126
li t1,0x26112611
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------
li t0,0x11126311
li t1,0x26311126
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x35353535
li t1,0x53535353
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x26222622
li t1,0x22262226
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------
li t0,0x26322526
li t1,0x22526322
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x57575757
li t1,0x75757575
p.muluRN x16, t0, t1,22
p.macsN x18, t0, t1,22
p.macsRN x20, t0, t1,22
p.machhsRN x21, t0, t1,22
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,22
mul x16, t0, t1
p.machhuN x23, t0, t1,22
p.mulsRN x11, t0, t1, 22
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,22
p.muls x9, t0, t1
p.macuRN x24, t0, t1,22
p.mulsN x10, t0, t1, 22
p.machhsN x19, t0, t1,22
p.muluN x14, t0, t1,22
p.mulhhuRN x17, t0, t1,22
p.mulhhuN x15, t0, t1,22
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,24
p.mulhhuRN x17, t0, t1,24
p.muluN x14, t0, t1,24
p.machhsN x19, t0, t1,24
p.mulsN x10, t0, t1, 24
p.macuRN x24, t0, t1,24
p.muls x9, t0, t1
p.macuN x22, t0, t1,24
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 24
p.machhuN x23, t0, t1,24
mul x16, t0, t1
p.machhuRN x25, t0, t1,24
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,24
p.macsRN x20, t0, t1,24
p.macsN x18, t0, t1,24
p.muluRN x16, t0, t1,24
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x22772277
li t1,0x77227722
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)

//-----------------------------------------
li t0,0x22577722
li t1,0x77722577
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x79797979
li t1,0x97979797
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x77997799
li t1,0x99779977
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x77799977
li t1,0x99977799
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------
li t0,0x9b9b9b9b
li t1,0xb9b9b9b9
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x99bb99bb
li t1,0xbb99bb99
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x999bbb99
li t1,0xbbb999bb
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
//-----------------------------------------
li t0,0xbdbdbdbd
li t1,0xdbdbdbdb
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xbbddbbdd
li t1,0xddbbddbb
p.muluRN x16, t0, t1,14
p.macsN x18, t0, t1,14
p.macsRN x20, t0, t1,14
p.machhsRN x21, t0, t1,14
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,14
mul x16, t0, t1
p.machhuN x23, t0, t1,14
p.mulsRN x11, t0, t1, 14
p.msu x8, t0, t1
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.macuN x22, t0, t1,14
p.muls x9, t0, t1
p.macuRN x24, t0, t1,14
p.mulsN x10, t0, t1, 14
p.machhsN x19, t0, t1,14
p.muluN x14, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.mulhhuN x15, t0, t1,14
sw x16, 4(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x23, 8(sp)
sw x11, 8(sp)
sw x8, 8(sp)
sw x13, 4(sp)
sw x7, 8(sp)
sw x22, 4(sp)
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)
sw x15, 8(sp)


p.mulhhuN x15, t0, t1,14
p.mulhhuRN x17, t0, t1,14
p.muluN x14, t0, t1,14
p.machhsN x19, t0, t1,14
p.mulsN x10, t0, t1, 14
p.macuRN x24, t0, t1,14
p.muls x9, t0, t1
p.macuN x22, t0, t1,14
p.mac x7, t0, t1
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
p.mulsRN x11, t0, t1, 14
p.machhuN x23, t0, t1,14
mul x16, t0, t1
p.machhuRN x25, t0, t1,14
p.mulu x12, t0, t1
p.machhsRN x21, t0, t1,14
p.macsRN x20, t0, t1,14
p.macsN x18, t0, t1,14
p.muluRN x16, t0, t1,14
sw x15, 8(sp)
sw x17, 4(sp)
sw x14, 4(sp)
sw x19, 8(sp)
sw x10, 4(sp)
sw x24, 4(sp)
sw x9, 4(sp)
sw x22, 4(sp)
sw x7, 8(sp)
sw x13, 4(sp)
sw x8, 8(sp)
sw x11, 8(sp)
sw x23, 8(sp)
sw x16, 4(sp)
sw x25, 4(sp)
sw x12, 4(sp)
sw x21, 4(sp)
sw x20, 4(sp)
sw x18, 4(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xbbbdddbb
li t1,0xdddbbbdd
mul x16, t0, t1
p.msu x8, t0, t1
p.mac x7, t0, t1
p.muls x9, t0, t1
p.mulsN x10, t0, t1, 2
p.mulu x12, t0, t1
p.macuN x22, t0, t1,2
p.macuRN x24, t0, t1,2
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)
p.mulsRN x11, t0, t1, 2
p.mulhhu x13, t0, t1
sw x11, 8(sp)
sw x13, 4(sp)
p.muluN x14, t0, t1,2
p.muluRN x16, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhuN x15, t0, t1,2
p.mulhhuRN x17, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.machhsN x19, t0, t1,2
p.machhsRN x21, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)

p.machhsRN x21, t0, t1,2
p.machhsN x19, t0, t1,2
sw x19, 8(sp)
sw x21, 4(sp)
p.macsRN x20, t0, t1,2
p.macsN x18, t0, t1,2
sw x18, 4(sp)
sw x20, 4(sp)
p.mulhhuRN x17, t0, t1,2
p.mulhhuN x15, t0, t1,2
sw x15, 8(sp)
sw x17, 4(sp)
p.muluRN x16, t0, t1,2
p.muluN x14, t0, t1,2
sw x14, 4(sp)
sw x16, 4(sp)
p.mulhhu x13, t0, t1
p.mulsRN x11, t0, t1, 2
sw x11, 8(sp)
sw x13, 4(sp)
p.machhuN x23, t0, t1,2
p.machhuRN x25, t0, t1,2
p.macuRN x24, t0, t1,2
p.macuN x22, t0, t1,2
p.mulu x12, t0, t1
p.mulsN x10, t0, t1, 2
p.muls x9, t0, t1
p.mac x7, t0, t1
p.msu x8, t0, t1
mul x16, t0, t1
sw x22, 4(sp)
sw x24, 4(sp)
sw x23, 8(sp)
sw x25, 4(sp)
sw x16, 4(sp)
sw x8, 8(sp)
sw x7, 8(sp)
sw x9, 4(sp)
sw x10, 4(sp)
sw x12, 4(sp)






//-----------------------------------------
li t0,0x99669966
li t1,0x66996699

p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
//-----------------------------------------
li t0,0x99966699
li t1,0x66699966

p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0xcc33cc33
li t1,0x33cc33cc
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0xccc333cc
li t1,0x333ccc33
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x88778877
li t1,0x77887788
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x88877788
li t1,0x77788877
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xee11ee11
li t1,0x11ee11ee
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0xeee111ee
li t1,0x111eee11
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0xff00ff00
li t1,0x00ff00ff

p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xfff000ff
li t1,0x000fff00
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x24242424
li t1,0x42424242
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x22442244
li t1,0x44224422
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x22244422
li t1,0x44422244
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x44664466
li t1,0x66446644
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x46464646
li t1,0x64646464
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x44466644
li t1,0x66644466
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x68686868
li t1,0x86868686
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x66886688
li t1,0x88668866
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x66688866
li t1,0x88866688
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x8a8a8a8a
li t1,0xa8a8a8a8
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x88aa88aa
li t1,0xaa88aa88
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x888aaa88
li t1,0xaaa888aa
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0xcececece
li t1,0xecececec
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0xcceeccee
li t1,0xeecceecc
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0xccceeecc
li t1,0xeeecccee
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x13131313
li t1,0x31313131
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x11331133
li t1,0x33113311
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x11133311
li t1,0x33311133
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x35353535
li t1,0x53535353
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x33553355
li t1,0x55335533
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x33355533
li t1,0x55533355
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x57575757
li t1,0x75757575
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x55775577
li t1,0x77557755
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x55577755
li t1,0x77755577
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x79797979
li t1,0x97979797
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x77997799
li t1,0x99779977
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x77799977
li t1,0x99977799
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x9b9b9b9b
li t1,0xb9b9b9b9
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x99bb99bb
li t1,0xbb99bb99
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x999bbb99
li t1,0xbbb999bb
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xbdbdbdbd
li t1,0xdbdbdbdb
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xbbddbbdd
li t1,0xddbbddbb
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xbbbdddbb
li t1,0xdddbbbdd
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0x96969696
li t1,0x69696969
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0xc3c3c3c3
li t1,0x3c3c3c3c
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x87878787
li t1,0x78787878
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xe1e1e1e1
li t1,0x1e1e1e1e
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0xf0f0f0f0
li t1,0x0f0f0f0f
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-------------new order-------------------------
//-----------------------------------------
li t0,0x96969696
li t1,0x96969696

p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0,0xc3c3c3c3
li t1,0xc3c3c3c3
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0,0x87878787
li t1,0x87878787
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xe1e1e1e1
li t1,0xe1e1e1e1
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xf0f0f0f0
li t1,0xf0f0f0f0
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x99669966
li t1,0x99669966
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x66996699
li t1,0x66996699
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xcc33cc33
li t1,0xcc33cc33
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xccc333cc
li t1,0xccc333cc
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x333ccc33
li t1,0x333ccc33
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x78787878
li t1,0x78787878
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x77887788
li t1,0x77887788
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x77788877
li t1,0x77788877
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xee11ee11
li t1,0xee11ee11
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xeee111ee
li t1,0xeee111ee
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xff00ff00
li t1,0xff00ff00
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xfff000ff
li t1,0xfff000ff
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x13131313
li t1,0x13131313
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x35353535
li t1,0x35353535
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x57575757
li t1,0x57575757
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x79797979
li t1,0x79797979
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x9b9b9b9b
li t1,0x9b9b9b9b
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xdfdfdfdf
li t1,0xdfdfdfdf
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x24242424
li t1,0x24242424
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x46464646
li t1,0x46464646
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x68686868
li t1,0x68686868
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x8a8a8a8a
li t1,0x8a8a8a8a
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xacacacac
li t1,0xacacacac
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xcececece
li t1,0xcececece
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x11331133
li t1,0x11331133
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x33553355
li t1,0x33553355
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x55775577
li t1,0x55775577
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x77997799
li t1,0x77997799
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x99bb99bb
li t1,0x99bb99bb
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xbbddbbdd
li t1,0xbbddbbdd
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xddffddff
li t1,0xddffddff
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x22442244
li t1,0x22442244
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x44664466
li t1,0x44664466
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x66886688
li t1,0x66886688
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0x88aa88aa
li t1,0x88aa88aa
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xaaccaacc
li t1,0xaaccaacc
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0,0xcceeccee
li t1,0xcceeccee
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//------------------------------------------SAMEEEEEEEEEEEEEEEE-------------------------------------

//-----------------------------------------
li t0, 0x53815e2
li t1, 0x53815e2
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x383808f7
li t1, 0x383808f7
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)

//-----------------------------------------
li t0, 0x92c88a1f
li t1, 0x92c88a1f

p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x44fb7583
li t1, 0x44fb7583
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x9da4d989
li t1, 0x9da4d989
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x1d4453ce
li t1, 0x1d4453ce
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x29d756ae
li t1, 0x29d756ae
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x200000e2
li t1, 0x200000e2
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0xa022595f
li t1, 0xa022595f
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x414de738
li t1, 0x414de738
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)


//-----------------------------------------
li t0, 0xda187de3
li t1, 0xda187de3
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x55ae8a85
li t1, 0x55ae8a85
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0xee723fe0
li t1, 0xee723fe0
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0xb69ffce9
li t1, 0xb69ffce9
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0xffffffff
li t1, 0xffffffff
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x4fe41310
li t1, 0x4fe41310
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0xe0403481
li t1, 0xe0403481
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0xe010b443
li t1, 0xe010b443
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0xb7aef25f
li t1, 0xb7aef25f
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0xce94cf7a
li t1, 0xce94cf7a
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x6624855d
li t1, 0x6624855d
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0xe3bfa7ba
li t1, 0xe3bfa7ba
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------
li t0, 0x2b6a7ebd
li t1, 0x2b6a7ebd
p.muluRN x16, t0, t1,6
p.msu x8, t0, t1
p.mulhhuN x15, t0, t1,1
p.macsN x18, t0, t1,2
p.macsRN x20, t0, t1,3
sw x16, 4(sp)
sw x8, 8(sp)
sw x18, 4(sp)
sw x20, 4(sp)
sw x15, 8(sp)
p.machhuN x23, t0, t1,4
p.macuN x22, t0, t1,5
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.machhuRN x25, t0, t1,7
sw x23, 8(sp)
sw x22, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x25, 4(sp)
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
mul x16, t0, t1
sw x11, 8(sp)
sw x7, 8(sp)
sw x16, 4(sp)
sw x13, 4(sp)
p.mulhhuRN x17, t0, t1,9
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
p.mulsN x10, t0, t1, 11
p.machhsN x19, t0, t1,12
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x10, 4(sp)
sw x19, 8(sp)
sw x14, 4(sp)
sw x17, 4(sp)


p.mac x7, t0, t1
p.mulhhuN x15, t0, t1,14
mul x16, t0, t1
p.muluN x14, t0, t1,16
p.machhsN x19, t0, t1,17
sw x7, 8(sp)
sw x15, 8(sp)
sw x16, 8(sp)
sw x14, 8(sp)
sw x19, 8(sp)
p.macuRN x24, t0, t1,19
p.mulsN x10, t0, t1, 18
p.machhsRN x21, t0, t1,24
p.mulhhu x13, t0, t1
p.msu x8, t0, t1
sw x24, 8(sp)
sw x10, 8(sp)
sw x21, 8(sp)
sw x13, 8(sp)
sw x8, 8(sp)
p.mulsRN x11, t0, t1, 21
p.machhuN x23, t0, t1,22
p.mulu x12, t0, t1
p.mulhhuRN x17, t0, t1,15
p.macuN x22, t0, t1,20
sw x11, 8(sp)
sw x23, 8(sp)
sw x12, 8(sp)
sw x17, 8(sp)
sw x22, 8(sp)
p.macsRN x20, t0, t1,25
p.muls x9, t0, t1
p.machhuRN x25, t0, t1,23
p.macsN x18, t0, t1,26
p.muluRN x16, t0, t1,27
sw x20, 8(sp)
sw x9, 4(sp)
sw x25, 4(sp)
sw x18, 8(sp)
sw x16, 4(sp)
//-----------------------------------------

//-----------------------------------------
li t0, 0x98798798
li t1, 0x98798798

p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x1a1a1a1a
li t1, 0x1a1a1a1a
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x11aa11aa
li t1, 0x11aa11aa
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x111aaa11
li t1, 0x111aaa11
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x2b2b2b2b
li t1, 0x2b2b2b2b
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x22bb22bb
li t1, 0x22bb22bb
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x222bbb22
li t1, 0x222bbb22
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x4c4c4c4c
li t1, 0x4c4c4c4c
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x44cc44cc
li t1, 0x44cc44cc
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x444ccc44
li t1, 0x444ccc44
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x5d5d5d5d
li t1, 0x5d5d5d5d
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x55dd55dd
li t1, 0x55dd55dd
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x555ddd55
li t1, 0x555ddd55
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x6e6e6e6e
li t1, 0x6e6e6e6e
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x66ee66ee
li t1, 0x66ee66ee
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x666eee66
li t1, 0x666eee66
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x7f7f7f7f
li t1, 0x7f7f7f7f
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x77ff77ff
li t1, 0x77ff77ff
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x777fff77
li t1, 0x777fff77
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)


//-----------------------------------------
li t0, 0x90909909
li t1, 0x90909090
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)


//-----------------------------------------
li t0, 0x99009900
li t1, 0x99009900
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x88008800
li t1, 0x88008800
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x80808080
li t1, 0x80808080
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x70707070
li t1, 0x70707070
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x77007700
li t1, 0x77007700
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x60606060
li t1, 0x60606060
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x66006600
li t1, 0x66006600
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x50505050
li t1, 0x50505050
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x55005500
li t1, 0x55005500
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x40404040
li t1, 0x40404040
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)
//-----------------------------------------
li t0, 0x44004400
li t1, 0x44004400
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x30303030
li t1, 0x30303030
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x33003300
li t1, 0x33003300
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x20202020
li t1, 0x20202020
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x22002200
li t1, 0x22002200
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x10101010
li t1, 0x10101010
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x11001100
li t1, 0x11001100
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x12121212
li t1, 0x12121212
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x11221122
li t1, 0x11221122
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x23232323
li t1, 0x23232323
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x22332233
li t1, 0x22332233
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x34343434
li t1, 0x34343434
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x33443344
li t1, 0x33443344
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x45454545
li t1, 0x45454545
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x44554455
li t1, 0x44554455
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x56565656
li t1, 0x56565656
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x55665566
li t1, 0x55665566
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x67676767
li t1, 0x67676767
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x66776677
li t1, 0x66776677
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x78787878
li t1, 0x78787878
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x77887788
li t1, 0x77887788
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x9a9a9a9a
li t1, 0x9a9a9a9a
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0x99aa99aa
li t1, 0x99aa99aa
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0xabababab
li t1, 0xabababab
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0xaabbaabb
li t1, 0xaabbaabb
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0xbcbcbcbc
li t1, 0xbcbcbcbc
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0xbbccbbcc
li t1, 0xbbccbbcc
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0xcdcdcdcd
li t1, 0xcdcdcdcd
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0xccddccdd
li t1, 0xccddccdd
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0xdededede
li t1, 0xdededede
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0xddeeddee
li t1, 0xddeeddee
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0xefefefef
li t1, 0xefefefef
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)

//-----------------------------------------
li t0, 0xeeffeeff
li t1, 0xeeffeeff
p.macuN x22, t0, t1,5
p.muluRN x16, t0, t1,6
p.mulhhuN x15, t0, t1,1
p.machhsN x19, t0, t1,12
p.mulhhuRN x17, t0, t1,9
sw x22, 4(sp)
sw x16, 8(sp)
sw x15, 4(sp)
sw x19, 4(sp)
sw x17, 8(sp)
p.machhuN x23, t0, t1,4
p.msu x8, t0, t1
p.machhsRN x21, t0, t1,6
p.mulu x12, t0, t1
p.macsRN x20, t0, t1,3
sw x23, 8(sp)
sw x8, 4(sp)
sw x21, 4(sp)
sw x12, 4(sp)
sw x20, 4(sp)
p.machhuRN x25, t0, t1,7
p.mulsRN x11, t0, t1, 8
p.mulhhu x13, t0, t1
p.mac x7, t0, t1
p.mulsN x10, t0, t1, 11
sw x25, 8(sp)
sw x11, 8(sp)
sw x13, 4(sp)
sw x7, 4(sp)
sw x10, 4(sp)
p.muls x9, t0, t1
p.macuRN x24, t0, t1,10
mul x16, t0, t1
p.macsN x18, t0, t1,2
p.muluN x14, t0, t1,13
sw x9, 4(sp)
sw x24, 4(sp)
sw x16, 8(sp)
sw x18, 4(sp)
sw x14, 4(sp)




/*!!!!!!!!!!!!!!!!!!!!!!DIV!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/


li t0,0xffffffff
li t1,0x00000001
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xffffffff
li t1,0x00009999
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xf0f0f0f0
li t1,0x00001111
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xf0f0f0f0
li t1,0x0f0f0f0f
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xffffffff
li t1,0x00000000
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xffffffff
li t1,0xffffffff
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xcccccccc
li t1,0x0000000c
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xeeeeeeee
li t1,0x0000000e
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
li t1,0x0000000d
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xcccccccc
li t1,0x26262626
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x0fffffff
li t1,0xffffffff
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xff0000ff
li t1,0x00ffff00
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xee0000ee
li t1,0x00eeee00
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xdd0000dd
li t1,0x00dddd00
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xcc0000cc
li t1,0x00cccc00
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xbb0000bb
li t1,0x00bbbb00
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xaa0000aa
li t1,0x00aaaa00
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xf0000000
li t1,0x0000000f
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xe0000000
li t1,0x0000000e
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xd0000000
li t1,0x0000000d
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xc0000000
li t1,0x0000000c
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xb0000000
li t1,0x0000000b
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xa0000000
li t1,0x0000000a
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0x87878787
li t1,0x78787878
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x88778877
li t1,0x77887788
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x88877788
li t1,0x77788877
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x88887777
li t1,0x77778888
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x88888777
li t1,0x77777888
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x88888877
li t1,0x77777788
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x88888887
li t1,0x77777778
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x88888888
li t1,0x77777777
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------

li t0,0xe1e1e1e1
li t1,0x1e1e1e1e
div x9, t0, t1
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xee11ee11
li t1,0x11ee11ee
div x9, t0, t1
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xeee111ee
li t1,0x111eee11
div x9, t0, t1
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xeeee1111
li t1,0x1111eeee
div x9, t0, t1
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xeeeee111
li t1,0x11111eee
div x9, t0, t1
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xeeeeee11
li t1,0x111111ee
div x9, t0, t1
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xeeeeeee1
li t1,0x1111111e
div x9, t0, t1
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xeeeeeeee
li t1,0x11111111
div x9, t0, t1
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------

li t0,0xc3c3c3c3
li t1,0x3c3c3c3c
rem x10, t0, t1
divu x11, t0,  t1
div x9, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
rem x14, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xcc26cc26
li t1,0x26cc26cc
rem x10, t0, t1
divu x11, t0,  t1
div x9, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
rem x14, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xccc263cc
li t1,0x263ccc26
rem x10, t0, t1
divu x11, t0,  t1
div x9, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
rem x14, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xcccc2626
li t1,0x2626cccc
rem x10, t0, t1
divu x11, t0,  t1
div x9, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
rem x14, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xccccc263
li t1,0x26263ccc
rem x10, t0, t1
divu x11, t0,  t1
div x9, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
rem x14, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xcccccc26
li t1,0x262626cc
rem x10, t0, t1
divu x11, t0,  t1
div x9, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
rem x14, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xccccccc3
li t1,0x2626263c
rem x10, t0, t1
divu x11, t0,  t1
div x9, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
rem x14, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xcccccccc
li t1,0x26262626
rem x10, t0, t1
divu x11, t0,  t1
div x9, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
rem x14, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//----------------------------

li t0,0x96969696
li t1,0x69696969
rem x10, t0, t1
divu x11, t0,  t1
div x9, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
rem x14, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x99229922
li t1,0x22992299
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0x99922699
li t1,0x22699922
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0x99992222
li t1,0x22229999
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0x99999226
li t1,0x22226999
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0x99999922
li t1,0x22222299
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0x99999996
li t1,0x22222269
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)



li t0,0x99999999
li t1,0x22222222
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)


li t0,0xffffffff
li t1,0x00000001
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xb0b0b0b0
li t1,0x0b0b0b0b
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xf0f0f0f0
li t1,0x0f0f0f0f
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xc0c0c0c0
li t1,0x0c0c0c0c
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xffffffff
li t1,0xffffffff
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xffffffff
li t1,0x88888888
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xaaaaaaaa
li t1,0xbbbbbbbb
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xf000000f
li t1,0x0ffffff0
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x80000000
li t1,0xeeeeeeee
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x09090909
li t1,0x06060606
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x80808080
li t1,0x08080808
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x70707070
li t1,0x07070707
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x88888888
li t1,0x0fffffff
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xbbbbbbbb
li t1,0x88888888
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xbbccbbcc
li t1,0x22222222
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xaaaaaaaa
li t1,0x00000888
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xd6d6d6d6
li t1,0x6d6d6d6d
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x40404040
li t1,0x08080808
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x40404040
li t1,0x04040404
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xdddddddd
li t1,0x0a0a0a0a
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
li t0,0xffffffff
li t1,0x22222222

li t0,0x22222222
li t1,0x44444444
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xffffffff
li t1,0x88888888
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x60606060
li t1,0x06060606
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xb0b0b0b0
li t1,0x0b0b0b0b
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0xbbbbbbbb
li t1,0x88888888
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x88888888
li t1,0x44444444
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

li t0,0x88844444
li t1,0x44488888
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x99229922
li t1,0x22992299
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x99922699
li t1,0x22699922
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0xcc26cc26
li t1,0x26cc26cc
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0xccc263cc
li t1,0x263ccc26
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x88778877
li t1,0x77887788
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x88877788
li t1,0x77788877
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0xee11ee11
li t1,0x11ee11ee
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0xeee111ee
li t1,0x111eee11
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0xff00ff00
li t1,0x00ff00ff
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0xfff000ff
li t1,0x000fff00
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x24242424
li t1,0x42424242
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x2244244
li t1,0x442442
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x2224442
li t1,0x4442244
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x44224422
li t1,0x22442244
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x46464646
li t1,0x64646464
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x44422644
li t1,0x22644422
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x68686868
li t1,0x86868686
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x22882288
li t1,0x88228822
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x22688822
li t1,0x88822688
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x8a8a8a8a
li t1,0xa8a8a8a8
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x88aa88aa
li t1,0xaa88aa88
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x888aaa88
li t1,0xaaa888aa
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0xcececece
li t1,0xecececec
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0xcceeccee
li t1,0xeecceecc
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0xccceeecc
li t1,0xeeecccee
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x13131313
li t1,0x31313131
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x11261126
li t1,0x26112611
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x11126311
li t1,0x26311126
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x35353535
li t1,0x53535353
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x26222622
li t1,0x22262226
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x26322526
li t1,0x22526322
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x57575757
li t1,0x75757575
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x22772277
li t1,0x77227722
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x22577722
li t1,0x77722577
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x79797979
li t1,0x97979797
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x77997799
li t1,0x99779977
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x77799977
li t1,0x99977799
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0x9b9b9b9b
li t1,0xb9b9b9b9
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x99bb99bb
li t1,0xbb99bb99
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0x999bbb99
li t1,0xbbb999bb
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0xbdbdbdbd
li t1,0xdbdbdbdb
remu x12, t0, t1
rem x10, t0, t1
divu x11, t0,  t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
rem x14, t0, t1
divu x15, t0,  t1
remu x13, t0, t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)

//-----------------------------------------
li t0,0xbbddbbdd
li t1,0xddbbddbb
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)
//-----------------------------------------
li t0,0xbbbdddbb
li t1,0xdddbbbdd
div x9, t0, t1
divu x11, t0,  t1
rem x10, t0, t1
remu x12, t0, t1
sw x9, 4(sp)
sw x10, 8(sp)
sw x11, 12(sp)
sw x12, 16(sp)
remu x13, t0, t1
rem x14, t0, t1
divu x15, t0,  t1
div x16, t0, t1
sw x13, 4(sp)
sw x14, 8(sp)
sw x15, 12(sp)
sw x16, 16(sp)




/************* YOUR ASSEMBLY CODE (END) *****************************/

	tail exit

.size  _start, .-_start

.global _init
.type   _init, @function
.global _fini
.type   _fini, @function
_init:
_fini:
 /* These don't have to do anything since we use init_array/fini_array. Prevent
    missing symbol error */
	ret
.size  _init, .-_init
.size _fini, .-_fini
