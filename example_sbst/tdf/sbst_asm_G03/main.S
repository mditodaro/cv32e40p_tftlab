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
//
	la a0, __libc_fini_array
//	call atexit
//	call __libc_init_array

/* call main */
//	lw a0, 0(sp)                    /* a0 = argc */
//	addi a1, sp, __SIZEOF_POINTER__ /* a1 = argv */
//	li a2, 0                        /* a2 = envp = NULL */
//	call main


/************* YOUR ASSEMBLY CODE (BEGIN) ****************************/

li t0, 0x856532d2
li t1, 0xc2df3fc0
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xf61a67ea
li t1, 0x7b09ef8
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x6ec7e5cc
li t1, 0x550a738e
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x811dc9ba
li t1, 0xd1ca3fa
or t2, t0, t1
sw t2, 4(sp)
li t0, 0xd2069c19
li t1, 0xdd382e9c
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x587e6b14
li t1, 0x56046f06
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0xccb423d0
li t1, 0xf5b95676
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x6c5c6867
li t1, 0xbc1b8b6a
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x246fba3d
li t1, 0xf1993d15
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x86d9bc28
li t1, 0x31cb9706
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x7798c530
li t1, 0x61c7516b
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4e75b991
li t1, 0x4fb53551
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x756a079e
li t1, 0x5da3d78f
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0xf1639665
li t1, 0xfa8a19c3
rem t2, t0, t1
sw t2, 4(sp)
li t0, 2419786450
p.extract t2, t0, 0x19, 0x1b
sw t2, 4(sp)
li t0, 4214777961
p.extractu t2, t0, 0x14, 0x15
sw t2, 4(sp)
li t0, 2302677649
p.insert t2, t0, 0x2, 0x15
sw t2, 4(sp)
li t0, 2033779972
p.bclr t2, t0, 0x8, 0xc
sw t2, 4(sp)
li t0, 65958967
p.bset t2, t0, 0xb, 0x19
sw t2, 4(sp)
li t0, 0x43ab3d76
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x5b6e9d1f
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0x70fa5e87
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xcd6c0b99
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0x44c0915f
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x489b34f8
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x39951cf7
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x109ab4c
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xd4c10103
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0x113d5f96
p.clip t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0x7a7bf932
p.clipu t2, t0, 0x16
sw t2, 4(sp)
li t0, 0xc8f294ea
li t1, 0xc62f9a91
p.addn t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x25aa701b
li t1, 0x268afdc3
p.addun t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x8bd3adee
li t1, 0x77ebdc7
p.addrn t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xb9609cfd
li t1, 0x4fad61b6
p.addurn t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xf2b26603
li t1, 0x1f1b9892
p.subn t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xd0a15a29
li t1, 0x109930f7
p.subun t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0xa5ec1988
li t1, 0xaa31134d
p.subrn t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xacc1bc3b
li t1, 0x1f3beb7f
p.suburn t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x9722c678
li t1, 0xa781759
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x1aca17b3
li t1, 0x9a76e5b
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa4ad30db
li t1, 0x4491556c
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c870227
li t1, 0x34e02efb
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0xeef98411
li t1, 0x60ad41e5
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x81f95aea
li t1, 0x95bbe485
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0x576d97ac
li t1, 0x36aa7275
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x72b93d10
li t1, 0x42826b0b
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbd53d9ed
li t1, 0x372cec9c
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x3190e07c
li t1, 0x19dc0d9c
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b1ed343
li t1, 0xaf141772
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x8baab030
li t1, 0x7beca7f9
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcaa003ac
li t1, 0x6832e78a
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x15b772b5
li t1, 0x797da130
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xbd5fc732
li t1, 0xe5c41632
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x66fe2e
li t1, 0x99962ef
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x2da11afe
li t1, 0x4d8e57d9
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf74e43e
li t1, 0xf6a1607c
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d2ee9da
li t1, 0xdebc5713
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ea78476
li t1, 0xdd2caac4
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x953478f3
li t1, 0xfdfeb654
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x9140948e
li t1, 0x268f2039
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0xdcd6b0c3
li t1, 0x40a8fb35
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xf08ac345
li t1, 0x497231b8
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x6406f7e7
li t1, 0x4eec6343
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x1827af32
li t1, 0x582af7d7
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x552540dc
li t1, 0x799f1be0
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x7a9f162d
li t1, 0xe25852b9
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x184bd603
li t1, 0xe09d4182
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x1a814d3c
li t1, 0xca22ac3e
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0xfed696d6
li t1, 0x27ca46bc
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5879a78a
li t1, 0xdced6303
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xf74c8a16
li t1, 0x6f83ac9d
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x846f7809
li t1, 0xb4fe8ecb
rem t2, t0, t1
sw t2, 4(sp)
li t0, 4091836725
p.extract t2, t0, 0x6, 0xf
sw t2, 4(sp)
li t0, 3621541457
p.extractu t2, t0, 0x7, 0x9
sw t2, 4(sp)
li t0, 3477377912
p.insert t2, t0, 0x12, 0x1
sw t2, 4(sp)
li t0, 4061705666
p.bclr t2, t0, 0x15, 0x11
sw t2, 4(sp)
li t0, 2031106777
p.bset t2, t0, 0x11, 0x1f
sw t2, 4(sp)
li t0, 0x63dfd594
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x2ca65b82
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0x3a327258
p.clb t2, t0
sw t2, 4(sp)
li t0, 0x2114570b
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0x9a921ae9
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x7fa2efb
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x3de8fa6a
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x9bca521e
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xd332861e
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xaed9fd89
p.clip t2, t0, 0x12
sw t2, 4(sp)
li t0, 0xba049917
p.clipu t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x669ac6db
li t1, 0xbb340f42
p.addn t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xa9baaea5
li t1, 0xf2a002e7
p.addun t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x2c106cfb
li t1, 0x85378787
p.addrn t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x13280812
li t1, 0x22865fe8
p.addurn t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x6e06dd67
li t1, 0xbd783066
p.subn t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x96f55ebe
li t1, 0x6a950d23
p.subun t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0xe8ed5819
li t1, 0x13ccde7e
p.subrn t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xe0132589
li t1, 0x930cb18
p.suburn t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x9632c3ed
li t1, 0xe54edb6c
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x7eca8d40
li t1, 0xbbf4d0c3
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa92e6eb8
li t1, 0x96750ae3
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x317d7dc
li t1, 0x6f656b6c
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0xe9039159
li t1, 0x782f1885
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x6130a7dc
li t1, 0x5ec1070e
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0x67c665f2
li t1, 0xdb84c069
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x65364d5e
li t1, 0xda861467
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6ba6de21
li t1, 0x34ca04eb
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe087c66f
li t1, 0xb6f76cbf
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0xade80b0d
li t1, 0x4e02c601
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x184efe7f
li t1, 0xa845de04
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x227fc936
li t1, 0xccdc2da4
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4544ada4
li t1, 0x212f962f
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c795b17
li t1, 0xde90299a
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x1a64ec0f
li t1, 0x6fb735a2
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x1dcaef3f
li t1, 0xc2ee2ed3
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4fbbaef2
li t1, 0x19abef56
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d651d63
li t1, 0x3c74617a
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd2da1caf
li t1, 0x3b22627b
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x771b7fcd
li t1, 0x4b9b165
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x642f1484
li t1, 0x3ebbf1ac
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x139a0dc7
li t1, 0x69377d90
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xf4f55fc6
li t1, 0xa9b1a029
or t2, t0, t1
sw t2, 4(sp)
li t0, 0xcbc59dff
li t1, 0xf884e309
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xd9a63cb4
li t1, 0xdaf03537
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0xbd7835f5
li t1, 0x31be6071
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0xad785f77
li t1, 0x1df4e189
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x300b92f0
li t1, 0x9ef113c7
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0xb1a10dac
li t1, 0x57b90b8e
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa26e3d2c
li t1, 0x4f0da359
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc4572bd
li t1, 0xf01dbdb
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x62e1b2e5
li t1, 0x872d7f45
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x77139ad1
li t1, 0x76f58f6f
rem t2, t0, t1
sw t2, 4(sp)
li t0, 1463383
p.extract t2, t0, 0x12, 0x9
sw t2, 4(sp)
li t0, 3614065632
p.extractu t2, t0, 0x1d, 0x8
sw t2, 4(sp)
li t0, 2565637855
p.insert t2, t0, 0xd, 0x1c
sw t2, 4(sp)
li t0, 3570046176
p.bclr t2, t0, 0x1d, 0x3
sw t2, 4(sp)
li t0, 2144565198
p.bset t2, t0, 0xd, 0x16
sw t2, 4(sp)
li t0, 0xa246aecf
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x96c359ce
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0x191e44a
p.clb t2, t0
sw t2, 4(sp)
li t0, 0x2a075c43
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0x34086af3
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x6c02a9e8
p.exths t2, t0
sw t2, 4(sp)
li t0, 0xabab64ca
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x85d6e25f
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0x4183ebf3
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xbd10ad83
p.clip t2, t0, 0x6
sw t2, 4(sp)
li t0, 0xbfd549e5
p.clipu t2, t0, 0x17
sw t2, 4(sp)
li t0, 0xb1e0f8ef
li t1, 0xdfc3f178
p.addn t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x615a75f5
li t1, 0xaab55864
p.addun t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0xe6358da4
li t1, 0xb8775953
p.addrn t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0xfb53232e
li t1, 0x725295e5
p.addurn t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x1c0c313e
li t1, 0x52670685
p.subn t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x5b8fa1f4
li t1, 0x1be193f2
p.subun t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xd42752b7
li t1, 0xba514ee4
p.subrn t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x7a2bda39
li t1, 0x6409333a
p.suburn t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x7ea277cf
li t1, 0x8241423
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xed1fb7d8
li t1, 0x2c8e1402
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b3e9ce3
li t1, 0xe773e77b
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc3e4b72
li t1, 0xe304519c
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x29c5a138
li t1, 0xc95d498
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x7a91531c
li t1, 0x2612eb1b
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ff70f42
li t1, 0xdb7440a9
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x6ac31d8d
li t1, 0xe2a5fd91
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5f1af394
li t1, 0x9350161e
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x18ade81
li t1, 0x5993a50b
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0xa0369319
li t1, 0xd171ebd9
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x5fc6df32
li t1, 0x29b4118e
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe2a06e4
li t1, 0xb1468452
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe56046e6
li t1, 0x5445e48e
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xff18b996
li t1, 0x9abe5795
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x6cd6b743
li t1, 0x8bb96bed
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x63c811b5
li t1, 0x7bb624a9
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x51cac141
li t1, 0x20454167
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x437217cd
li t1, 0x5d32533a
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc4be2480
li t1, 0x9f3dad9b
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x80d94843
li t1, 0x9e5d63dc
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xefc6a12e
li t1, 0xd8b23b02
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x8d2b8b8
li t1, 0xca351492
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xaf0693c7
li t1, 0x3da0349
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x57ae1bf0
li t1, 0xee9504a7
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x4530d3a3
li t1, 0xcd2c9599
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x5551903f
li t1, 0xf4fd8900
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0xaabfeb72
li t1, 0x8e625f21
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x2b91010f
li t1, 0x48c3addf
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x27f2b996
li t1, 0x826a3d68
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd8332af
li t1, 0x324ea652
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xab4e893
li t1, 0xe158b2cd
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x134aaa37
li t1, 0xdbe45336
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x43bd5577
li t1, 0x68525f65
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3659978634
p.extract t2, t0, 0x6, 0x1e
sw t2, 4(sp)
li t0, 665417716
p.extractu t2, t0, 0x8, 0x19
sw t2, 4(sp)
li t0, 2672685752
p.insert t2, t0, 0x19, 0x1c
sw t2, 4(sp)
li t0, 2478692676
p.bclr t2, t0, 0x1c, 0xd
sw t2, 4(sp)
li t0, 818556998
p.bset t2, t0, 0x13, 0x18
sw t2, 4(sp)
li t0, 0x2b7a5458
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x473f82f7
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xe16da3bc
p.clb t2, t0
sw t2, 4(sp)
li t0, 0x707a8c9f
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xaa78974b
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x1af0308d
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x8305de78
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x1d2cc1f0
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xba2ee3e2
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xa219c793
p.clip t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xe2740656
p.clipu t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x2dcbd322
li t1, 0x9104a7d2
p.addn t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x9e7065bb
li t1, 0xde147cbc
p.addun t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x95c145b3
li t1, 0x4e0f1c34
p.addrn t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0x3a22a522
li t1, 0x9dd5f624
p.addurn t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x1bceb8ea
li t1, 0x7bac9b08
p.subn t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0xb07beed2
li t1, 0xe2086023
p.subun t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x74a41f24
li t1, 0x2f9d1598
p.subrn t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x800091fd
li t1, 0xb3a11946
p.suburn t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xe6f8cdd0
li t1, 0xa750661b
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa0b0325
li t1, 0xcbd65770
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xacebba5f
li t1, 0x37eaa164
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4272ff35
li t1, 0x567bb346
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ef41ae7
li t1, 0xc455af4d
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x23c903c2
li t1, 0xfd12d8bb
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3a670c18
li t1, 0xc32065f6
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0xd8f3d0ed
li t1, 0x7d259d0b
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x91cde7e7
li t1, 0x22af2700
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa6d9fc18
li t1, 0x3a6e8d3a
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x4c36c27d
li t1, 0xdb10b127
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ab9df8a
li t1, 0x5b71951a
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe6e5d908
li t1, 0xa7a8bcba
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x148c849a
li t1, 0x7cec5d31
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf88975a7
li t1, 0xacbf82
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x162293cd
li t1, 0x1e04059
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe284bc3
li t1, 0xfd5514a8
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x93427c4d
li t1, 0x2b7fdd42
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa09cf854
li t1, 0x1b90fa3f
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x8b7e53b1
li t1, 0x73639b77
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x5945d6d1
li t1, 0xac4f2b9d
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x70296f2c
li t1, 0x7eda77d1
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x2b9468ee
li t1, 0x8d42af83
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x952647a4
li t1, 0x3ca7e56d
or t2, t0, t1
sw t2, 4(sp)
li t0, 0xd35bc7fe
li t1, 0x635083b6
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xb833767d
li t1, 0x65ff952d
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x283936a8
li t1, 0xe54d0ec9
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x32471915
li t1, 0x78134d
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x9ed148ba
li t1, 0x5222514c
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0xa0b0170
li t1, 0xb04aedff
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x27245094
li t1, 0x91153785
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa4e3a0f2
li t1, 0x398d8643
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x43d2c516
li t1, 0x553f3fe8
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3e1292eb
li t1, 0x15dbadc9
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3124209237
p.extract t2, t0, 0xc, 0x11
sw t2, 4(sp)
li t0, 4255781302
p.extractu t2, t0, 0x11, 0x13
sw t2, 4(sp)
li t0, 3045897772
p.insert t2, t0, 0x13, 0x10
sw t2, 4(sp)
li t0, 4047924628
p.bclr t2, t0, 0x1c, 0x2
sw t2, 4(sp)
li t0, 2921863933
p.bset t2, t0, 0x1c, 0xf
sw t2, 4(sp)
li t0, 0x4fbdb7f6
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x3d2d8f2f
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0x8ba2202
p.clb t2, t0
sw t2, 4(sp)
li t0, 0x5d17f62a
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0x14f8ab6a
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x6cb73129
p.exths t2, t0
sw t2, 4(sp)
li t0, 0xe5ebeea2
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x440af178
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0x322e3d0a
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0x2d7bff1c
p.clip t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0x4b884d9d
p.clipu t2, t0, 0xb
sw t2, 4(sp)
li t0, 0xd9c8c07d
li t1, 0xd4a38c9b
p.addn t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x94c83b06
li t1, 0x29c0036e
p.addun t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x846fc5a8
li t1, 0xcbdc2ea3
p.addrn t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x81c429e0
li t1, 0xbf6a7516
p.addurn t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x4a4281e
li t1, 0x128fb07d
p.subn t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x9849aa5d
li t1, 0x2fe5ced0
p.subun t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xbf5723e6
li t1, 0xdd6aa848
p.subrn t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xf542ee4b
li t1, 0xa8e60b66
p.suburn t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x94bfbb3b
li t1, 0x4fb6f170
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x6adb9a3a
li t1, 0x1f167b4d
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x49f18ae5
li t1, 0xc22bbfb7
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c467762
li t1, 0x4033584c
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x48debd75
li t1, 0xb988aacb
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xf66e7fb1
li t1, 0xdc0aa10d
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0x10a23cf2
li t1, 0x5d91194f
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x48da0bde
li t1, 0xc178bf89
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x2a04ebec
li t1, 0xfbdf714
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x73b5278c
li t1, 0x701b515
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x35dc0ee0
li t1, 0x6fef2548
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf42c71f8
li t1, 0xff636a54
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe3ea1c07
li t1, 0x461679ae
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe0b2065d
li t1, 0x3e4f1d75
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x8a25a85
li t1, 0xca36f14d
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xebed24e1
li t1, 0xb7be165c
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x7e113f20
li t1, 0xf2e91451
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x8d841d1e
li t1, 0xb9a9acf6
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc321ee5a
li t1, 0x1c115f3d
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xb4c3c69
li t1, 0x53cea2d5
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xb65e0f09
li t1, 0xf2062cbb
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xec5858e4
li t1, 0xfc3822a5
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0xc7d89d04
li t1, 0x40bad3b
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xc370224e
li t1, 0xf7c219bb
or t2, t0, t1
sw t2, 4(sp)
li t0, 0xa3f59c53
li t1, 0x5d07da11
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x78af789c
li t1, 0x38d917dc
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0xf2aa2b53
li t1, 0x1ba7bde5
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0xe9899115
li t1, 0x4a64ad47
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d282e2c
li t1, 0x9bdf2ac4
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x4fa47426
li t1, 0x58ff63a2
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4ec67fdd
li t1, 0x734d0218
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xacb2f79a
li t1, 0x72edee93
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x7c76d9a2
li t1, 0x95999f86
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x84aeb086
li t1, 0xa4903881
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3693432136
p.extract t2, t0, 0xa, 0x3
sw t2, 4(sp)
li t0, 3313012787
p.extractu t2, t0, 0x9, 0x8
sw t2, 4(sp)
li t0, 3984043886
p.insert t2, t0, 0x10, 0x13
sw t2, 4(sp)
li t0, 46047671
p.bclr t2, t0, 0x15, 0x6
sw t2, 4(sp)
li t0, 2590078420
p.bset t2, t0, 0x1c, 0xc
sw t2, 4(sp)
li t0, 0x2c490819
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x9d45203f
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0x1448982b
p.clb t2, t0
sw t2, 4(sp)
li t0, 0x1e1fef05
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xfee07b35
p.abs t2, t0
sw t2, 4(sp)
li t0, 0xb7a88009
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x79a77108
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x63a850d9
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xcbfea049
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xdb512ae5
p.clip t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0xb79cbe86
p.clipu t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x263a8397
li t1, 0x6dcf1371
p.addn t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x64f1ae85
li t1, 0x3cdac65
p.addun t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x7b1f6ab9
li t1, 0xf323215a
p.addrn t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0xc0beb2f7
li t1, 0xabc94ae9
p.addurn t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x87bfae2c
li t1, 0xe1ebffc1
p.subn t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xa28409fc
li t1, 0x152f3255
p.subun t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xf224b490
li t1, 0x894a9016
p.subrn t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x457c5edf
li t1, 0x2415aeb4
p.suburn t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x84aa0c41
li t1, 0x73d745f6
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x2cb589d6
li t1, 0x9f4ae8b8
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x36f0028a
li t1, 0x83f30b4a
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x8af5e085
li t1, 0x10a2ebbe
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0xbdf0c27e
li t1, 0xc70e8713
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x1fc09f6b
li t1, 0x7c3f736b
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c1d1fb4
li t1, 0xb976b72f
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x471f0174
li t1, 0xc9da94
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb95f6126
li t1, 0x4efb1c6a
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x2cc985b9
li t1, 0x90e3e5b1
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0xe8f8ba23
li t1, 0xdcefa4e5
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe5d5cd1e
li t1, 0xc5655eb3
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe327d37d
li t1, 0xc0f6c706
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa7bbcd20
li t1, 0xde11daa3
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x1590ee89
li t1, 0x1d5044b4
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x46a81d43
li t1, 0x28e32ff2
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x238d88d9
li t1, 0x1be8f0c1
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x2766f444
li t1, 0xfcfa6fb8
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe242c5ff
li t1, 0xb8abcded
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4113f0fb
li t1, 0x2d3f8b70
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x7b7ce9ce
li t1, 0xed2924b4
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6b4dc65
li t1, 0x2f86fda4
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x58a1bcc9
li t1, 0x375de01e
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xff07bb7b
li t1, 0xb652c35a
or t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa9b6e0f
li t1, 0x578b26bb
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x20095f22
li t1, 0x738e5549
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x6aae81cd
li t1, 0xb022a1c9
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0xa625e914
li t1, 0xe89fd284
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fb58670
li t1, 0x59f666a7
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x6f985332
li t1, 0xf99903dc
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x306f9d09
li t1, 0xc27a19b8
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c60124
li t1, 0x5d23e410
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xef0d1496
li t1, 0xa06c9f1e
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa4a95000
li t1, 0x7611d189
rem t2, t0, t1
sw t2, 4(sp)
li t0, 2985715119
p.extract t2, t0, 0x1b, 0x5
sw t2, 4(sp)
li t0, 3147278019
p.extractu t2, t0, 0x5, 0x4
sw t2, 4(sp)
li t0, 1167672616
p.insert t2, t0, 0x8, 0x10
sw t2, 4(sp)
li t0, 1044091805
p.bclr t2, t0, 0x1a, 0x5
sw t2, 4(sp)
li t0, 2155629473
p.bset t2, t0, 0x11, 0x3
sw t2, 4(sp)
li t0, 0x2c27ec4e
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x4642b770
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0x528c55b9
p.clb t2, t0
sw t2, 4(sp)
li t0, 0x53d12152
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0x8ccd5b1e
p.abs t2, t0
sw t2, 4(sp)
li t0, 0xfaabe175
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x34419919
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0xfa21b398
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xb5efdd88
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0x91039503
p.clip t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x80083f91
p.clipu t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x69b5c60
li t1, 0x2832e6c4
p.addn t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xe247d35f
li t1, 0x8875c04c
p.addun t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x47646ba8
li t1, 0x99f9defb
p.addrn t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xa9158d23
li t1, 0xb0850043
p.addurn t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0xfaa45d6
li t1, 0x9213e515
p.subn t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x8ba6d2c7
li t1, 0x4c008ecf
p.subun t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x2616e2f
li t1, 0xd462a8e3
p.subrn t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x40b5e445
li t1, 0x28cb7495
p.suburn t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xcbd9466a
li t1, 0xb7564a4f
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x5962feca
li t1, 0x1c36e1a4
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x794e5d3c
li t1, 0x8220f16d
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa875dff2
li t1, 0xd42505ed
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x230c2a1c
li t1, 0x14c49c53
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x4c791d13
li t1, 0xf3366e48
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xf81e3697
li t1, 0xc17acc91
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x13fd8bd9
li t1, 0x276accc6
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x7e62a15e
li t1, 0x7171c37b
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xda55575a
li t1, 0x2832e52
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x9c00efed
li t1, 0xb19e9370
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x498d918d
li t1, 0x9dad0e02
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x13c7a867
li t1, 0x4289332b
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x102fc4d1
li t1, 0x66fb4aff
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x58f5606b
li t1, 0x62cb2b61
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf973432b
li t1, 0x25fe987e
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x8ff787ab
li t1, 0xf2db27a3
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x759bb60
li t1, 0x6e1844d7
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x56c48aec
li t1, 0xe4f1d05f
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf387096f
li t1, 0x57be61d2
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9acaaf5
li t1, 0xf2ce3e9d
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xb15c3c41
li t1, 0x1752025e
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x4603975a
li t1, 0x51a8f6a7
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xa8b4a633
li t1, 0xc2bbb8f6
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x8d7d564f
li t1, 0x56e5b33a
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x7996215c
li t1, 0xafa9f715
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x26f9aaef
li t1, 0xb907547d
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x6866bad0
li t1, 0x108dd706
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e0624c9
li t1, 0xc33a91eb
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0xc4b41c52
li t1, 0x5599ea2d
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8af947d5
li t1, 0x2af31b1f
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb7f9e919
li t1, 0xa8825a1
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x52f9faf0
li t1, 0x31e1d9fc
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0xdde68654
li t1, 0x8d1f3abc
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3992367315
p.extract t2, t0, 0x18, 0x16
sw t2, 4(sp)
li t0, 1312248576
p.extractu t2, t0, 0x1a, 0xd
sw t2, 4(sp)
li t0, 4028894193
p.insert t2, t0, 0x10, 0x5
sw t2, 4(sp)
li t0, 1946069785
p.bclr t2, t0, 0x17, 0x1d
sw t2, 4(sp)
li t0, 1021872187
p.bset t2, t0, 0x13, 0x8
sw t2, 4(sp)
li t0, 0x5e15a5be
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x45f2135b
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xd034272e
p.clb t2, t0
sw t2, 4(sp)
li t0, 0x66977705
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xdc6ca53f
p.abs t2, t0
sw t2, 4(sp)
li t0, 0xe5f63141
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x508d467b
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0xf0b636c2
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xa15b0a89
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xd3d93aa6
p.clip t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0xf253fb9e
p.clipu t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xf70d8b73
li t1, 0x6e8489be
p.addn t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x421388c8
li t1, 0x7db14e8f
p.addun t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x5873ec25
li t1, 0x7f9cdcee
p.addrn t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0xdf08f31d
li t1, 0xd6b64ffa
p.addurn t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x7ba641ad
li t1, 0xf403f072
p.subn t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x654d31bb
li t1, 0xec016494
p.subun t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x109b654f
li t1, 0xa9cf41a
p.subrn t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x66392db2
li t1, 0x6cb1e099
p.suburn t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0xba0615ef
li t1, 0x43af81a7
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xd1c3f085
li t1, 0xd8ad777d
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xabecbd8e
li t1, 0x437d115d
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x70e968a4
li t1, 0xba27a8af
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x91e1bace
li t1, 0x9c260052
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xdef325b8
li t1, 0x1ad8f063
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xebca5f9d
li t1, 0xaf0e7fb3
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x4d04e282
li t1, 0x47a18b0b
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa51dbf17
li t1, 0xd1458cf1
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x843b0088
li t1, 0x5e8ed29c
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b9adeef
li t1, 0x49526409
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x3e4cd968
li t1, 0x77a4cce4
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4caebe31
li t1, 0xdc07ca43
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf59dcbeb
li t1, 0x56be6e84
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3dd7eca
li t1, 0x5d98050b
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xba6b43f9
li t1, 0xbcc997cb
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x34e80d24
li t1, 0x5d3bd137
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x58d2de2
li t1, 0x3662bdd5
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x24e63f21
li t1, 0xda146f93
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x818a09f8
li t1, 0x2a112062
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x63bbbda8
li t1, 0xd789d9ea
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4321e2ba
li t1, 0x8ea94cd1
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x17b94fcc
pv.add.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x9344a0f6
li t1, 0x81281e40
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7b0a0180
li t1, 0x5543fee0
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe63c89a4
pv.add.sci.b t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0x75ba21b6
li t1, 0xbe153e6e
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x74552f04
li t1, 0x592f61d8
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6277b3c
pv.sub.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x68276684
li t1, 0x790c3f2
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x22cc7ba6
li t1, 0x6b053d60
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcb38ae49
pv.sub.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xefa47ce3
li t1, 0xdc28a6e2
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb1d4f286
li t1, 0xe621c5ee
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcbe9a9ae
pv.avg.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x9cca9d21
li t1, 0x132955ef
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x64458195
li t1, 0x6d3c7200
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8256f8b8
pv.avg.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xa3ecd15e
li t1, 0x5050dd50
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9f184aaf
li t1, 0xcbd49531
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2b0b8c6
pv.avgu.sci.h t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0xed17be13
li t1, 0x578f407f
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf7f10340
li t1, 0x3c2024be
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfc82407d
pv.avgu.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0xf19238ac
li t1, 0x18d88f92
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9fde32a1
li t1, 0x41874f83
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8d120fd8
pv.min.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x38946ff6
li t1, 0xb1ec6099
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x20593134
li t1, 0x51f7440f
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x843e1343
pv.min.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x7d3de44
li t1, 0xaf55fb8a
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7e939a1f
li t1, 0x9c3db96b
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x623970db
pv.minu.sci.h t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0x1c7ec1b2
li t1, 0xea09fd44
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xce064d5e
li t1, 0x92432b43
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf161ff9b
pv.minu.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x94ad0e68
li t1, 0xe4790ed7
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc1cf363f
li t1, 0xd4caf35f
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e2aa2b1
pv.max.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x2a74c99e
li t1, 0xff88a810
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a69c187
li t1, 0xd38911f6
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc5c1e146
pv.max.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0xc83199d8
li t1, 0x16b88819
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6d9d899c
li t1, 0x9274c0a5
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x29a8aa74
pv.maxu.sci.h t2, t0, 0x0
sw t2, 4(sp)
li t0, 0xe2831b4c
li t1, 0x653040ab
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33e0e4dc
li t1, 0xd9bd9470
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xab7a6583
pv.maxu.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x3fe8425a
li t1, 0xac36d71e
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3c258026
li t1, 0xdcec9fef
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4941dd39
pv.srl.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x64058f1f
li t1, 0x71d9b0ec
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb61047c0
li t1, 0x6214748
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c25e999
pv.srl.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x690df338
li t1, 0x6a92e3b0
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5a0b2a53
li t1, 0xd6470eb9
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x44c5a2e4
pv.sra.sci.h t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x2d87ff42
li t1, 0x89016814
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeb1c51ea
li t1, 0x104d13e4
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb082ea46
pv.sra.sci.b t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0xb2cbf6ea
li t1, 0xc06418c1
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xce4607ee
li t1, 0x14fec073
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1313bbee
pv.sll.sci.h t2, t0, 0x13
sw t2, 4(sp)
li t0, 0xb525e8b6
li t1, 0xc4a3ba85
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8d4993a9
li t1, 0xb960eb92
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc6afb0c
pv.sll.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x47099dde
li t1, 0x44f83ba3
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d65863f
li t1, 0xbb4bf0c5
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fd93462
pv.or.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xcf248b5b
li t1, 0x6f5f6f67
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeaefd358
li t1, 0xe968a7a7
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x746d69a6
pv.or.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0xf96991c2
li t1, 0x46cf94cc
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4d4a9631
li t1, 0xc67115a6
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x73c0e1a
pv.xor.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0xb8c11e33
li t1, 0x73a26f3b
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4ed29cf1
li t1, 0x1f832a00
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe1fcdc57
pv.xor.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x4b47da0b
li t1, 0x6217241f
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbd449384
li t1, 0xf6913993
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3616cb84
pv.and.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x6ac2d53e
li t1, 0x2ae55fc2
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6d01898
li t1, 0xfe1b23e1
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6602be9
pv.and.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x5c3f3725
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0xde2795c3
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0x855b3791
li t1, 0xf8e135b6
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbf774406
pv.shuffle.sci.h t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xf0ed1aab
li t1, 0x38ccaa64
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d302c74
pv.shuffleI0.sci.b t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0x8e7e1367
pv.shuffleI1.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xce64938
pv.shuffleI2.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x6dbf497
pv.shuffleI3.sci.b t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0xa6c26ec7
li t1, 0x75ccea3a
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ec34543
li t1, 0xe3e889a9
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa4dee166
li t1, 0x1881ae99
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4342d81f
li t1, 0xfbc13804
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf8b0bb0d
li t1, 0x85740d88
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x95ea1cfd
li t1, 0x92c86841
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x14c13bbb
li t1, 0xd6d39f65
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd3207dc
pv.cmpeq.sci.h t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x3e829510
li t1, 0x5a5fd61f
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x322263d4
li t1, 0xb96bdecd
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4cccc35e
pv.cmpeq.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x82426f4e
li t1, 0x8a8c4786
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c31a17
li t1, 0xce5ef1ef
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ceda667
pv.cmpne.sci.h t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x558cddee
li t1, 0x353d6971
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3a98c159
li t1, 0x8cfa4514
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x36ce3f40
pv.cmpne.sci.b t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x970c6bc
li t1, 0x679d58c7
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6738ced3
li t1, 0xd6f5840d
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf383704
pv.cmpgt.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x373dfe98
li t1, 0x42032796
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d562595
li t1, 0x5faa0c29
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd3d45ef4
pv.cmpgt.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x65435ae4
li t1, 0x71fe4e89
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb42d846c
li t1, 0x1096b169
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa80e33c1
pv.cmpge.sci.h t2, t0, 0x6
sw t2, 4(sp)
li t0, 0xa77af46c
li t1, 0xfc186060
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xba9d5056
li t1, 0x7ba2b7bf
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x626704a9
pv.cmpge.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x52f359eb
li t1, 0xd3237e73
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb732e427
li t1, 0xa942e1bf
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x57ea7e2f
pv.cmplt.sci.h t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x5c6bc402
li t1, 0xbd3c798a
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcb92e741
li t1, 0xada3acbb
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd5feb9af
pv.cmplt.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x3eb920bc
li t1, 0x428c9183
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x114d74ad
li t1, 0x5dc701a4
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa03ba96c
pv.cmple.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xa6ecf160
li t1, 0x4626d3cb
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xef904fd7
li t1, 0xabd3ef00
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xaf1a3da7
pv.cmple.sci.b t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x3a40b8e3
li t1, 0x3ecb483b
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa577c0f2
li t1, 0x149b0c7a
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd312476d
pv.cmpgtu.sci.h t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x2e939d78
li t1, 0x189211c6
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8e821b7c
li t1, 0x43b102f4
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6b37eb8d
pv.cmpgtu.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0xc346d9d0
li t1, 0xc2330486
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6783897d
li t1, 0xe91f8f63
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfdb179ce
pv.cmpgeu.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0xa6e7b70f
li t1, 0x86d1fc04
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdfab5720
li t1, 0x4dcfbe57
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x85a79fe0
pv.cmpgeu.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x8cd6f81
li t1, 0x10b6ab9f
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe2846f45
li t1, 0x8ec59640
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa2e6528
pv.cmpltu.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xb23976b9
li t1, 0x2aa06555
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa31f3175
li t1, 0x8d3b4068
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x27775789
pv.cmpltu.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x4851f048
li t1, 0xc93c7bda
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3f6f93e
li t1, 0x778c50f6
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd60f58d4
pv.cmpleu.sci.h t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x5282b8d2
li t1, 0xbcba8bed
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x556f779f
li t1, 0x441dafcd
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x86ce69f5
pv.cmpleu.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x7e2c028f
li t1, 0x36f8c093
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6f16689b
li t1, 0xcc34c1b
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7ca0e7c6
pv.add.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0xf5904c7d
li t1, 0xf09ea918
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe9e19c61
li t1, 0xcfdbf251
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc9748aaa
pv.add.sci.b t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x26003be3
li t1, 0xa381b30a
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c362514
li t1, 0x385ee7f4
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6e4e271d
pv.sub.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0xf96c8882
li t1, 0xa76e340b
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x751bd5d
li t1, 0xf9c9aa89
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x60d043cf
pv.sub.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xd832adb2
li t1, 0x40ced55b
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x442bbfd5
li t1, 0x30e8d9d
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb4c4436e
pv.avg.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x36687228
li t1, 0xa8baae89
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x624befc6
li t1, 0x6fbbe73
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x788f0744
pv.avg.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x476bd78b
li t1, 0xe7eb8195
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8ed92577
li t1, 0xc49e9008
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x304fe0c
pv.avgu.sci.h t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xcaae73a3
li t1, 0x85cf6d7c
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xadfe1e9b
li t1, 0x42906e48
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2e75d46f
pv.avgu.sci.b t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x986a31d9
li t1, 0x86f035f4
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbd59fdec
li t1, 0x49d55295
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x65b4600c
pv.min.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0xc7238d8f
li t1, 0x43b26cb5
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf1237b66
li t1, 0xeb1d7f7f
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf848c719
pv.min.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0xdc10cb96
li t1, 0xce3b70a4
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4347f370
li t1, 0xfb4f363d
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x369e51df
pv.minu.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x13014602
li t1, 0xdfc9bb77
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x71c9f26e
li t1, 0x2255ad56
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe44e5747
pv.minu.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xf6965bb5
li t1, 0x81f3dfbb
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x194054b3
li t1, 0x180967c3
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6af7667f
pv.max.sci.h t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xf982d6ff
li t1, 0x4d850fbe
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe8390684
li t1, 0x456f5a4e
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x297008c3
pv.max.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0xa9bd22fc
li t1, 0xca68176b
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd10213b0
li t1, 0xf8b99f6a
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x33d9aa35
pv.maxu.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x75f8c66f
li t1, 0xc495a7c
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b90211f
li t1, 0xa7a65d0d
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8f722b41
pv.maxu.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x621d6bf7
li t1, 0xaa96d7a3
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf06c5a4
li t1, 0x2830da
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x46cd2141
pv.srl.sci.h t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0x3c7c506c
li t1, 0x452c24a1
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf2f440c0
li t1, 0xb0100971
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd8624f87
pv.srl.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xdd352f65
li t1, 0x56100f95
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xafd73cd7
li t1, 0xd04442a5
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa369c54d
pv.sra.sci.h t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x428ebc8f
li t1, 0xfff9086d
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x674094c
li t1, 0x1647c43f
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9e763a88
pv.sra.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0xf52a7252
li t1, 0xa1a2ce89
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xec44413a
li t1, 0xe62c306f
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b458915
pv.sll.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x15171ba7
li t1, 0x87dc80a8
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x301a9003
li t1, 0x4847f100
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbfeb042b
pv.sll.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0xdf23a6e2
li t1, 0x89554c29
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbfcae760
li t1, 0xd7919266
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c948c10
pv.or.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xcaff185e
li t1, 0x25caf83c
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf351b17
li t1, 0xe928cf78
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a791fa9
pv.or.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xc611fb36
li t1, 0x527d5da9
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x743a6e04
li t1, 0xb13edcc1
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa3ed3dd4
pv.xor.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x3f7174cf
li t1, 0x5cacbeaf
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb5612bbd
li t1, 0xff09f3c8
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x343a49a6
pv.xor.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x6a52c39e
li t1, 0x58250237
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x27e76781
li t1, 0x377667c8
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa3a678e0
pv.and.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x92c846ac
li t1, 0xa662dd9
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe45b2ce
li t1, 0x97376573
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6c5624b9
pv.and.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x8d26c23d
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0xe3c5c6e
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0x63eb047b
li t1, 0xfbd51b5c
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6fef059c
pv.shuffle.sci.h t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0xc82d3d41
li t1, 0x6c66b44c
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe576fc8a
pv.shuffleI0.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x6255d203
pv.shuffleI1.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x5fb18bb5
pv.shuffleI2.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x642495b2
pv.shuffleI3.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x736290b
li t1, 0x6e9bd30f
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f28074d
li t1, 0x2f175eac
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x28dc0394
li t1, 0x74b61177
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x816ab4c1
li t1, 0x8c226a9b
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbe12db08
li t1, 0xa1c46531
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x23fc44ef
li t1, 0x5ed17877
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa79296af
li t1, 0xae43af57
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x950bebd
pv.cmpeq.sci.h t2, t0, 0x3
sw t2, 4(sp)
li t0, 0x6cab4071
li t1, 0x2281b0bd
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x686e79e3
li t1, 0x53683504
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x37f90c0
pv.cmpeq.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x10660260
li t1, 0xf4e33748
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc3744aa4
li t1, 0x7fae4704
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6a00d5f
pv.cmpne.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0xfbe7fb8c
li t1, 0xb6d75234
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8c37e453
li t1, 0x995d9197
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x199f90f6
pv.cmpne.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xfad60be6
li t1, 0x50bacd09
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8870d6a8
li t1, 0x7921712e
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e5802d9
pv.cmpgt.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x478c5fc3
li t1, 0xaf0ae15a
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xad2bf1a4
li t1, 0xf37587d8
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x526a4df7
pv.cmpgt.sci.b t2, t0, 0x13
sw t2, 4(sp)
li t0, 0xe8586d08
li t1, 0xda6decde
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2a1a4236
li t1, 0x52fd9df4
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd346a34a
pv.cmpge.sci.h t2, t0, 0xe
sw t2, 4(sp)
li t0, 0xb7a6194e
li t1, 0x8bb7aeed
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x848406a4
li t1, 0x9073383c
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7b3559f2
pv.cmpge.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x21270634
li t1, 0x51364829
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbb63ae2f
li t1, 0xccd6e125
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa59fe7f8
pv.cmplt.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0xe50c11ac
li t1, 0xe0edbf1d
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb2bc4f94
li t1, 0xcbe5767c
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdbd8efe0
pv.cmplt.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0xab859db2
li t1, 0xfd8301ae
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x74b56ce8
li t1, 0xcc3be2c0
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4e9dcff2
pv.cmple.sci.h t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x4f582540
li t1, 0xdc7e0993
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x772cb3a5
li t1, 0xa0554637
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x29cbd6a5
pv.cmple.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x5a774792
li t1, 0x206d013e
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2b439988
li t1, 0x6b64404d
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb54d6240
pv.cmpgtu.sci.h t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x6d5c62f6
li t1, 0xd7154e1e
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x91289adc
li t1, 0x629cac28
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeb7aa954
pv.cmpgtu.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x40b7644b
li t1, 0x34e107d8
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1fc0bd6f
li t1, 0xfc761523
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x32cf8526
pv.cmpgeu.sci.h t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0x8a7b8134
li t1, 0x5683819e
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa7233e96
li t1, 0xb40bb324
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x53b919d5
pv.cmpgeu.sci.b t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x36365dae
li t1, 0x2787816
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x577decba
li t1, 0xc352e92d
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf66ab786
pv.cmpltu.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0xf7ce2180
li t1, 0xf179944a
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc38e37ff
li t1, 0xa8152240
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2dab3d0f
pv.cmpltu.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x74778812
li t1, 0x2388831a
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x26fff278
li t1, 0x4e9b2b8f
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x50b9c5c2
pv.cmpleu.sci.h t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x3344059
li t1, 0x688de39
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x74ebcc6e
li t1, 0xf14ba1e
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa3643fa
pv.cmpleu.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x5bf33c48
li t1, 0x64790259
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x414f7af4
li t1, 0x6dab9636
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5f7d94d1
pv.add.sci.h t2, t0, 0xe
sw t2, 4(sp)
li t0, 0xfd11597b
li t1, 0x834bfba6
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfdc29cdd
li t1, 0x6d0e93ff
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd35db3d9
pv.add.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xd29fef67
li t1, 0x7a5dbc85
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfc224bca
li t1, 0x6eb03a49
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x889903c
pv.sub.sci.h t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xcd4beaad
li t1, 0x37e78386
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7c41eca6
li t1, 0xf5e5064b
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc54801bc
pv.sub.sci.b t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0x1c2ccfa9
li t1, 0xa9616e6a
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xac971cb5
li t1, 0x506be178
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3661950b
pv.avg.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x7c4006eb
li t1, 0xe8e8b86b
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x55c231fd
li t1, 0x720fb08d
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbed4dc43
pv.avg.sci.b t2, t0, 0x13
sw t2, 4(sp)
li t0, 0xacf069e7
li t1, 0xd6290ac
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xac7f76ef
li t1, 0x7b7e6f63
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x82b86c30
pv.avgu.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x421ac4f2
li t1, 0x80822e80
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfde945fb
li t1, 0x309c7473
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3bce923e
pv.avgu.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x2d53806e
li t1, 0x3af21515
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x62af9c32
li t1, 0x45af484e
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x181d9b87
pv.min.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x9224bcdc
li t1, 0x2d69a3cd
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb402e1d4
li t1, 0xacdc624e
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8542383a
pv.min.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x781b5b15
li t1, 0xfdc45187
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xff16c41
li t1, 0x95fcc0e8
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3b9e3a5
pv.minu.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0xf383a458
li t1, 0x526e0781
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x873b2739
li t1, 0x1004fad5
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb4d55ab3
pv.minu.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0xb4917d5f
li t1, 0x14544d4
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d2d839d
li t1, 0x85b03963
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xae63f484
pv.max.sci.h t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x6d8717a2
li t1, 0x1ddf449
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf318c8eb
li t1, 0x468ecdfe
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6f304cfc
pv.max.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x1c182427
li t1, 0x1c097e40
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc5a9dfd
li t1, 0x854fb61d
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa06eede3
pv.maxu.sci.h t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x75137938
li t1, 0xcde182c8
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x846cd500
li t1, 0xe67d62ec
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6793f168
pv.maxu.sci.b t2, t0, 0xa
sw t2, 4(sp)
li t0, 0xf6b4e313
li t1, 0x5a32c1ef
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe71313b7
li t1, 0x2e5f99eb
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6249ad7e
pv.srl.sci.h t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x33c80c53
li t1, 0x98aef098
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xab2dbbdd
li t1, 0xc8ff50f3
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x82a01586
pv.srl.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x600efaac
li t1, 0xaee77bf4
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf4351e2c
li t1, 0x63c24179
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x124e72d8
pv.sra.sci.h t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xf5c655f2
li t1, 0x69b48c7e
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x511b31d3
li t1, 0xcd3d0dc1
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd7f58c17
pv.sra.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x1161a951
li t1, 0xa84166a2
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x19b33a04
li t1, 0x94564bde
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd7e07659
pv.sll.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x5f7b27a1
li t1, 0x66d5f5b0
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x82b98379
li t1, 0xbd95ebe5
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf551ed87
pv.sll.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x33e3f8ad
li t1, 0x212f0c9a
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x964239ec
li t1, 0xa2022a3
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xed27481
pv.or.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x936e5d5f
li t1, 0xf6528f37
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33a12446
li t1, 0x9e9f4e98
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x52ca827e
pv.or.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x3bd0278f
li t1, 0xfc6fc9c7
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd55d33c4
li t1, 0xbd5e59b2
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f5171e
pv.xor.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xd7dbeaef
li t1, 0xc4127ff4
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x84a999f1
li t1, 0xc98eb7
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x54338277
pv.xor.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0xdd336d2f
li t1, 0x4ce73aaf
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x66285069
li t1, 0x8028542f
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd7e6e475
pv.and.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0xcd2629f4
li t1, 0xf4a63c50
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xec31893
li t1, 0x91a326e0
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xadc5641d
pv.and.sci.b t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x3e13af40
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0x6d6abb4a
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0x8334a035
li t1, 0xf6a80bdd
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2bd89d29
pv.shuffle.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x647bf923
li t1, 0xb342f739
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcb584b76
pv.shuffleI0.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x6a460e0e
pv.shuffleI1.sci.b t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x5b4f7f97
pv.shuffleI2.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x634c505
pv.shuffleI3.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x4728b1d1
li t1, 0x40a06189
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7bf0d267
li t1, 0xde08bd17
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe06f89bc
li t1, 0xd9cddb26
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6114db8c
li t1, 0xd0003ea
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x66be224a
li t1, 0x21d67176
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x445dd20c
li t1, 0xb68d9829
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb5983bf
li t1, 0x1777b228
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4ec9f8bd
pv.cmpeq.sci.h t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0xea4e294e
li t1, 0x6a2b5029
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2746e2be
li t1, 0xaf29af09
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x588a8019
pv.cmpeq.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0xcb166777
li t1, 0x13fd134e
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1323a1b8
li t1, 0x9b22059c
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xecf516d3
pv.cmpne.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x8c41497f
li t1, 0x578443aa
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5fc3f9fd
li t1, 0x5e6acd0
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x584302e0
pv.cmpne.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0xa4237a26
li t1, 0x430baeb8
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3df43434
li t1, 0xe689a1fe
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5b09bf6c
pv.cmpgt.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x6473b28c
li t1, 0xe384ff09
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x341193d3
li t1, 0x91ff0504
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb19fa48f
pv.cmpgt.sci.b t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x749330e2
li t1, 0x5c5ce0c1
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x92d0319a
li t1, 0x592745a7
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x63c9aa0
pv.cmpge.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0xb47ce2a8
li t1, 0xa104f24b
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x64d14175
li t1, 0x89d52dc4
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x13a2be9a
pv.cmpge.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x9678dc13
li t1, 0xcb000cf1
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x66a903d4
li t1, 0x164fa415
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x32d0e396
pv.cmplt.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x8fc97777
li t1, 0x9f5b3865
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x684eb6f0
li t1, 0x93511e71
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x19964d3b
pv.cmplt.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x14033770
li t1, 0x8809d5a8
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x97bd245e
li t1, 0xaefbce25
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa4ee5c16
pv.cmple.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0xf130b4f7
li t1, 0x8d299e33
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9e933835
li t1, 0xd74fce97
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x19afcb83
pv.cmple.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x751da246
li t1, 0x6a7101ac
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3db722e
li t1, 0x162299e6
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x42981823
pv.cmpgtu.sci.h t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0x4ad4e998
li t1, 0x3a79471e
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb927be1a
li t1, 0x23759c16
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcd566c5f
pv.cmpgtu.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x6561ec72
li t1, 0x52a0d294
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x61953efa
li t1, 0xddf85500
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcae67c27
pv.cmpgeu.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0xc2bb13dd
li t1, 0x124976fa
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x72aec522
li t1, 0xa8bd5747
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x557065c5
pv.cmpgeu.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x80ae3197
li t1, 0x523f62e1
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x92fd4c05
li t1, 0xba1bde82
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6d22a141
pv.cmpltu.sci.h t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x4ec87c23
li t1, 0x12bb3fb6
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x46a48c11
li t1, 0x9129fcf4
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7b4d17a7
pv.cmpltu.sci.b t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x25c3cbbc
li t1, 0x6a96b4d5
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x81074da6
li t1, 0xa751b524
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x876b8ddb
pv.cmpleu.sci.h t2, t0, 0x0
sw t2, 4(sp)
li t0, 0xee5bede3
li t1, 0xe7420bc6
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7690013e
li t1, 0x76a1da4b
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x503d6c23
pv.cmpleu.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xc1c5a553
li t1, 0xc820ec19
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d7ddca
li t1, 0x5441aae1
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x15170483
li t1, 0xd0a9f8a2
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x622e3b7a
li t1, 0xc7fcaaec
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x42902691
li t1, 0x141d6dc8
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6127fd5
li t1, 0x369ee5d2
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x55d8515f
li t1, 0x2db8da4c
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c10eba
li t1, 0xb7719896
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xd76655ef
li t1, 0x60633cd1
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a17d9a3
li t1, 0x71cca452
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x51a780da
li t1, 0x9972bbd2
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6dff260f
li t1, 0x385bebf
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa63d68d
li t1, 0x208381a7
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x85b5d179
li t1, 0xaa2579d
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3759013726
p.extract t2, t0, 0x6, 0x2
sw t2, 4(sp)
li t0, 2378666965
p.extractu t2, t0, 0x0, 0x10
sw t2, 4(sp)
li t0, 3958671025
p.insert t2, t0, 0xc, 0x1c
sw t2, 4(sp)
li t0, 914900220
p.bclr t2, t0, 0x14, 0x19
sw t2, 4(sp)
li t0, 1310020158
p.bset t2, t0, 0xf, 0x0
sw t2, 4(sp)
li t0, 0x70efb7a5
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0xae27d1cc
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xf0c6037b
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe5dd614b
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xa0bb8c32
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x55a3dccd
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x7ca9431d
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x81c9a384
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0x4bfa4165
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xed685b16
p.clip t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x711486ff
p.clipu t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xac86564
li t1, 0xce47b2c2
p.addn t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xc6f4b1e3
li t1, 0x1a0ca02e
p.addun t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xd7df58d2
li t1, 0x48ed35d0
p.addrn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xf44555b7
li t1, 0x239c8779
p.addurn t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x5c4aca39
li t1, 0x5f2999a0
p.subn t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x29c40927
li t1, 0x1791076f
p.subun t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x3816529b
li t1, 0x227da80b
p.subrn t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xb1f0c005
li t1, 0x489d388b
p.suburn t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x57b149c
li t1, 0xa341a465
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xbc8b990f
li t1, 0x85757be8
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x53d9020f
li t1, 0xda880ff7
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x71d977c1
li t1, 0x777d05fe
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf973acf
li t1, 0xa541b816
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x37d4ec42
li t1, 0xb777c64b
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc944e145
li t1, 0x9e0e4130
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf156444
li t1, 0x244dd4cc
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8256fc83
li t1, 0xf898ba5
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf6f5aad9
li t1, 0x237fe907
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x6d001b0b
li t1, 0xaee44742
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x13e42232
li t1, 0xa7b601e6
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf756194d
li t1, 0x78f76181
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x92fcb8e7
li t1, 0x45042486
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4960b0d7
li t1, 0xc8d4beda
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x17a44daa
li t1, 0x1fa7c428
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x81143708
li t1, 0x1400ef42
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xed28a418
li t1, 0xe58e07e7
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f42a928
li t1, 0x2300f5e9
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe374c95c
li t1, 0x7dc38726
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xb718ed4
li t1, 0xa12cc448
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xa2eba8ff
li t1, 0x17553c6b
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f94033e
li t1, 0xa3e08b68
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc63e50e
li t1, 0xf2ad0f5b
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x2cd1b418
li t1, 0x42135381
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x4488ecab
li t1, 0xaf48655c
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x393a5395
li t1, 0x8a9f85f5
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x5a46f03b
li t1, 0x1abfe0ef
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xff0c53aa
li t1, 0x29a5adcd
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x80595aa3
li t1, 0x95f7b3ce
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x164d1b5e
li t1, 0xcf4b35f9
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x45deb241
li t1, 0x67861f9e
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xe030982
li t1, 0xc3049007
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fbf37f3
li t1, 0xa3743356
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3927219410
p.extract t2, t0, 0x4, 0x19
sw t2, 4(sp)
li t0, 897523089
p.extractu t2, t0, 0x1b, 0x15
sw t2, 4(sp)
li t0, 4281116705
p.insert t2, t0, 0x3, 0x2
sw t2, 4(sp)
li t0, 761607165
p.bclr t2, t0, 0x18, 0x2
sw t2, 4(sp)
li t0, 3755541148
p.bset t2, t0, 0x1d, 0x5
sw t2, 4(sp)
li t0, 0xeccf2903
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x1adc0ff0
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xa741bbb9
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe134a895
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xe741c2b6
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x160cc7e4
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x4cb578c5
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x99d47ea5
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xc348a714
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0x8f49f1d8
p.clip t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x24ba8bcf
p.clipu t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x5962738f
li t1, 0x5cfeb38d
p.addn t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x1188cfb7
li t1, 0xaeedf2b8
p.addun t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x66580ce8
li t1, 0x16d461e3
p.addrn t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x7e1e59d6
li t1, 0x60448735
p.addurn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x809c3a5c
li t1, 0x422c0b50
p.subn t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xf538677b
li t1, 0x2def80de
p.subun t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x62b748b2
li t1, 0x4c295c6d
p.subrn t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xf681ab2
li t1, 0x6f41fd73
p.suburn t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x587b92f1
li t1, 0xedacb7bf
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x3578381f
li t1, 0x23aef938
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbcebc382
li t1, 0x12f74958
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe52e7391
li t1, 0x9b85c429
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d2e0ce4
li t1, 0x73925ff
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xddf8587d
li t1, 0xa5d0d81e
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb34efe6
li t1, 0x9d6ac0d4
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x55ad1303
li t1, 0xffb5ea71
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a699e42
li t1, 0x9af304d2
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x903bb3c5
li t1, 0x3fff7f9c
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x44533538
li t1, 0x8ed62d7d
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x55a5b0aa
li t1, 0xbb086e88
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x198c2c71
li t1, 0xf8e842e6
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc544bdaf
li t1, 0xba41ba8f
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf44ab087
li t1, 0xcb179310
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf3ad89
li t1, 0xa16aa7d3
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa1d504ee
li t1, 0xe263c677
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe02eca35
li t1, 0x2b5fec6
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6b31b5d
li t1, 0x309df744
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xb8dc4ca5
li t1, 0x6f3a6f70
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xc1c5a553
li t1, 0xc820ec19
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d7ddca
li t1, 0x5441aae1
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x15170483
li t1, 0xd0a9f8a2
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x622e3b7a
li t1, 0xc7fcaaec
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x42902691
li t1, 0x141d6dc8
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6127fd5
li t1, 0x369ee5d2
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x55d8515f
li t1, 0x2db8da4c
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c10eba
li t1, 0xb7719896
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xd76655ef
li t1, 0x60633cd1
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a17d9a3
li t1, 0x71cca452
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x51a780da
li t1, 0x9972bbd2
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6dff260f
li t1, 0x385bebf
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa63d68d
li t1, 0x208381a7
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x85b5d179
li t1, 0xaa2579d
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3759013726
p.extract t2, t0, 0x6, 0x2
sw t2, 4(sp)
li t0, 2378666965
p.extractu t2, t0, 0x0, 0x10
sw t2, 4(sp)
li t0, 3958671025
p.insert t2, t0, 0xc, 0x1c
sw t2, 4(sp)
li t0, 914900220
p.bclr t2, t0, 0x14, 0x19
sw t2, 4(sp)
li t0, 1310020158
p.bset t2, t0, 0xf, 0x0
sw t2, 4(sp)
li t0, 0x70efb7a5
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0xae27d1cc
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xf0c6037b
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe5dd614b
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xa0bb8c32
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x55a3dccd
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x7ca9431d
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x81c9a384
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0x4bfa4165
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xed685b16
p.clip t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x711486ff
p.clipu t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xac86564
li t1, 0xce47b2c2
p.addn t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xc6f4b1e3
li t1, 0x1a0ca02e
p.addun t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xd7df58d2
li t1, 0x48ed35d0
p.addrn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xf44555b7
li t1, 0x239c8779
p.addurn t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x5c4aca39
li t1, 0x5f2999a0
p.subn t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x29c40927
li t1, 0x1791076f
p.subun t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x3816529b
li t1, 0x227da80b
p.subrn t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xb1f0c005
li t1, 0x489d388b
p.suburn t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x57b149c
li t1, 0xa341a465
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xbc8b990f
li t1, 0x85757be8
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x53d9020f
li t1, 0xda880ff7
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x71d977c1
li t1, 0x777d05fe
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf973acf
li t1, 0xa541b816
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x37d4ec42
li t1, 0xb777c64b
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc944e145
li t1, 0x9e0e4130
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf156444
li t1, 0x244dd4cc
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8256fc83
li t1, 0xf898ba5
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf6f5aad9
li t1, 0x237fe907
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x6d001b0b
li t1, 0xaee44742
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x13e42232
li t1, 0xa7b601e6
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf756194d
li t1, 0x78f76181
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x92fcb8e7
li t1, 0x45042486
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4960b0d7
li t1, 0xc8d4beda
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x17a44daa
li t1, 0x1fa7c428
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x81143708
li t1, 0x1400ef42
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xed28a418
li t1, 0xe58e07e7
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f42a928
li t1, 0x2300f5e9
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe374c95c
li t1, 0x7dc38726
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xb718ed4
li t1, 0xa12cc448
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xa2eba8ff
li t1, 0x17553c6b
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f94033e
li t1, 0xa3e08b68
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc63e50e
li t1, 0xf2ad0f5b
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x2cd1b418
li t1, 0x42135381
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x4488ecab
li t1, 0xaf48655c
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x393a5395
li t1, 0x8a9f85f5
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x5a46f03b
li t1, 0x1abfe0ef
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xff0c53aa
li t1, 0x29a5adcd
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x80595aa3
li t1, 0x95f7b3ce
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x164d1b5e
li t1, 0xcf4b35f9
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x45deb241
li t1, 0x67861f9e
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xe030982
li t1, 0xc3049007
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fbf37f3
li t1, 0xa3743356
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3927219410
p.extract t2, t0, 0x4, 0x19
sw t2, 4(sp)
li t0, 897523089
p.extractu t2, t0, 0x1b, 0x15
sw t2, 4(sp)
li t0, 4281116705
p.insert t2, t0, 0x3, 0x2
sw t2, 4(sp)
li t0, 761607165
p.bclr t2, t0, 0x18, 0x2
sw t2, 4(sp)
li t0, 3755541148
p.bset t2, t0, 0x1d, 0x5
sw t2, 4(sp)
li t0, 0xeccf2903
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x1adc0ff0
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xa741bbb9
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe134a895
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xe741c2b6
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x160cc7e4
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x4cb578c5
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x99d47ea5
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xc348a714
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0x8f49f1d8
p.clip t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x24ba8bcf
p.clipu t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x5962738f
li t1, 0x5cfeb38d
p.addn t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x1188cfb7
li t1, 0xaeedf2b8
p.addun t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x66580ce8
li t1, 0x16d461e3
p.addrn t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x7e1e59d6
li t1, 0x60448735
p.addurn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x809c3a5c
li t1, 0x422c0b50
p.subn t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xf538677b
li t1, 0x2def80de
p.subun t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x62b748b2
li t1, 0x4c295c6d
p.subrn t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xf681ab2
li t1, 0x6f41fd73
p.suburn t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x587b92f1
li t1, 0xedacb7bf
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x3578381f
li t1, 0x23aef938
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbcebc382
li t1, 0x12f74958
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe52e7391
li t1, 0x9b85c429
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d2e0ce4
li t1, 0x73925ff
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xddf8587d
li t1, 0xa5d0d81e
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb34efe6
li t1, 0x9d6ac0d4
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x55ad1303
li t1, 0xffb5ea71
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a699e42
li t1, 0x9af304d2
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x903bb3c5
li t1, 0x3fff7f9c
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x44533538
li t1, 0x8ed62d7d
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x55a5b0aa
li t1, 0xbb086e88
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x198c2c71
li t1, 0xf8e842e6
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc544bdaf
li t1, 0xba41ba8f
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf44ab087
li t1, 0xcb179310
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf3ad89
li t1, 0xa16aa7d3
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa1d504ee
li t1, 0xe263c677
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe02eca35
li t1, 0x2b5fec6
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6b31b5d
li t1, 0x309df744
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xb8dc4ca5
li t1, 0x6f3a6f70
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xc1c5a553
li t1, 0xc820ec19
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d7ddca
li t1, 0x5441aae1
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x15170483
li t1, 0xd0a9f8a2
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x622e3b7a
li t1, 0xc7fcaaec
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x42902691
li t1, 0x141d6dc8
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6127fd5
li t1, 0x369ee5d2
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x55d8515f
li t1, 0x2db8da4c
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c10eba
li t1, 0xb7719896
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xd76655ef
li t1, 0x60633cd1
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a17d9a3
li t1, 0x71cca452
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x51a780da
li t1, 0x9972bbd2
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6dff260f
li t1, 0x385bebf
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa63d68d
li t1, 0x208381a7
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x85b5d179
li t1, 0xaa2579d
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3759013726
p.extract t2, t0, 0x6, 0x2
sw t2, 4(sp)
li t0, 2378666965
p.extractu t2, t0, 0x0, 0x10
sw t2, 4(sp)
li t0, 3958671025
p.insert t2, t0, 0xc, 0x1c
sw t2, 4(sp)
li t0, 914900220
p.bclr t2, t0, 0x14, 0x19
sw t2, 4(sp)
li t0, 1310020158
p.bset t2, t0, 0xf, 0x0
sw t2, 4(sp)
li t0, 0x70efb7a5
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0xae27d1cc
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xf0c6037b
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe5dd614b
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xa0bb8c32
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x55a3dccd
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x7ca9431d
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x81c9a384
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0x4bfa4165
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xed685b16
p.clip t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x711486ff
p.clipu t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xac86564
li t1, 0xce47b2c2
p.addn t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xc6f4b1e3
li t1, 0x1a0ca02e
p.addun t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xd7df58d2
li t1, 0x48ed35d0
p.addrn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xf44555b7
li t1, 0x239c8779
p.addurn t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x5c4aca39
li t1, 0x5f2999a0
p.subn t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x29c40927
li t1, 0x1791076f
p.subun t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x3816529b
li t1, 0x227da80b
p.subrn t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xb1f0c005
li t1, 0x489d388b
p.suburn t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x57b149c
li t1, 0xa341a465
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xbc8b990f
li t1, 0x85757be8
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x53d9020f
li t1, 0xda880ff7
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x71d977c1
li t1, 0x777d05fe
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf973acf
li t1, 0xa541b816
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x37d4ec42
li t1, 0xb777c64b
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc944e145
li t1, 0x9e0e4130
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf156444
li t1, 0x244dd4cc
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8256fc83
li t1, 0xf898ba5
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf6f5aad9
li t1, 0x237fe907
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x6d001b0b
li t1, 0xaee44742
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x13e42232
li t1, 0xa7b601e6
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf756194d
li t1, 0x78f76181
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x92fcb8e7
li t1, 0x45042486
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4960b0d7
li t1, 0xc8d4beda
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x17a44daa
li t1, 0x1fa7c428
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x81143708
li t1, 0x1400ef42
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xed28a418
li t1, 0xe58e07e7
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f42a928
li t1, 0x2300f5e9
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe374c95c
li t1, 0x7dc38726
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xb718ed4
li t1, 0xa12cc448
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xa2eba8ff
li t1, 0x17553c6b
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f94033e
li t1, 0xa3e08b68
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc63e50e
li t1, 0xf2ad0f5b
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x2cd1b418
li t1, 0x42135381
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x4488ecab
li t1, 0xaf48655c
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x393a5395
li t1, 0x8a9f85f5
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x5a46f03b
li t1, 0x1abfe0ef
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xff0c53aa
li t1, 0x29a5adcd
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x80595aa3
li t1, 0x95f7b3ce
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x164d1b5e
li t1, 0xcf4b35f9
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x45deb241
li t1, 0x67861f9e
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xe030982
li t1, 0xc3049007
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fbf37f3
li t1, 0xa3743356
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3927219410
p.extract t2, t0, 0x4, 0x19
sw t2, 4(sp)
li t0, 897523089
p.extractu t2, t0, 0x1b, 0x15
sw t2, 4(sp)
li t0, 4281116705
p.insert t2, t0, 0x3, 0x2
sw t2, 4(sp)
li t0, 761607165
p.bclr t2, t0, 0x18, 0x2
sw t2, 4(sp)
li t0, 3755541148
p.bset t2, t0, 0x1d, 0x5
sw t2, 4(sp)
li t0, 0xeccf2903
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x1adc0ff0
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xa741bbb9
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe134a895
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xe741c2b6
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x160cc7e4
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x4cb578c5
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x99d47ea5
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xc348a714
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0x8f49f1d8
p.clip t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x24ba8bcf
p.clipu t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x5962738f
li t1, 0x5cfeb38d
p.addn t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x1188cfb7
li t1, 0xaeedf2b8
p.addun t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x66580ce8
li t1, 0x16d461e3
p.addrn t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x7e1e59d6
li t1, 0x60448735
p.addurn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x809c3a5c
li t1, 0x422c0b50
p.subn t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xf538677b
li t1, 0x2def80de
p.subun t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x62b748b2
li t1, 0x4c295c6d
p.subrn t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xf681ab2
li t1, 0x6f41fd73
p.suburn t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x587b92f1
li t1, 0xedacb7bf
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x3578381f
li t1, 0x23aef938
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbcebc382
li t1, 0x12f74958
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe52e7391
li t1, 0x9b85c429
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d2e0ce4
li t1, 0x73925ff
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xddf8587d
li t1, 0xa5d0d81e
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb34efe6
li t1, 0x9d6ac0d4
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x55ad1303
li t1, 0xffb5ea71
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a699e42
li t1, 0x9af304d2
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x903bb3c5
li t1, 0x3fff7f9c
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x44533538
li t1, 0x8ed62d7d
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x55a5b0aa
li t1, 0xbb086e88
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x198c2c71
li t1, 0xf8e842e6
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc544bdaf
li t1, 0xba41ba8f
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf44ab087
li t1, 0xcb179310
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf3ad89
li t1, 0xa16aa7d3
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa1d504ee
li t1, 0xe263c677
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe02eca35
li t1, 0x2b5fec6
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6b31b5d
li t1, 0x309df744
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xb8dc4ca5
li t1, 0x6f3a6f70
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xc1c5a553
li t1, 0xc820ec19
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d7ddca
li t1, 0x5441aae1
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x15170483
li t1, 0xd0a9f8a2
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x622e3b7a
li t1, 0xc7fcaaec
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x42902691
li t1, 0x141d6dc8
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6127fd5
li t1, 0x369ee5d2
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x55d8515f
li t1, 0x2db8da4c
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c10eba
li t1, 0xb7719896
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xd76655ef
li t1, 0x60633cd1
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a17d9a3
li t1, 0x71cca452
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x51a780da
li t1, 0x9972bbd2
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6dff260f
li t1, 0x385bebf
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa63d68d
li t1, 0x208381a7
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x85b5d179
li t1, 0xaa2579d
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3759013726
p.extract t2, t0, 0x6, 0x2
sw t2, 4(sp)
li t0, 2378666965
p.extractu t2, t0, 0x0, 0x10
sw t2, 4(sp)
li t0, 3958671025
p.insert t2, t0, 0xc, 0x1c
sw t2, 4(sp)
li t0, 914900220
p.bclr t2, t0, 0x14, 0x19
sw t2, 4(sp)
li t0, 1310020158
p.bset t2, t0, 0xf, 0x0
sw t2, 4(sp)
li t0, 0x70efb7a5
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0xae27d1cc
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xf0c6037b
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe5dd614b
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xa0bb8c32
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x55a3dccd
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x7ca9431d
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x81c9a384
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0x4bfa4165
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xed685b16
p.clip t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x711486ff
p.clipu t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xac86564
li t1, 0xce47b2c2
p.addn t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xc6f4b1e3
li t1, 0x1a0ca02e
p.addun t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xd7df58d2
li t1, 0x48ed35d0
p.addrn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xf44555b7
li t1, 0x239c8779
p.addurn t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x5c4aca39
li t1, 0x5f2999a0
p.subn t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x29c40927
li t1, 0x1791076f
p.subun t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x3816529b
li t1, 0x227da80b
p.subrn t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xb1f0c005
li t1, 0x489d388b
p.suburn t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x57b149c
li t1, 0xa341a465
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xbc8b990f
li t1, 0x85757be8
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x53d9020f
li t1, 0xda880ff7
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x71d977c1
li t1, 0x777d05fe
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf973acf
li t1, 0xa541b816
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x37d4ec42
li t1, 0xb777c64b
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc944e145
li t1, 0x9e0e4130
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf156444
li t1, 0x244dd4cc
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8256fc83
li t1, 0xf898ba5
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf6f5aad9
li t1, 0x237fe907
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x6d001b0b
li t1, 0xaee44742
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x13e42232
li t1, 0xa7b601e6
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf756194d
li t1, 0x78f76181
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x92fcb8e7
li t1, 0x45042486
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4960b0d7
li t1, 0xc8d4beda
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x17a44daa
li t1, 0x1fa7c428
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x81143708
li t1, 0x1400ef42
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xed28a418
li t1, 0xe58e07e7
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f42a928
li t1, 0x2300f5e9
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe374c95c
li t1, 0x7dc38726
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xb718ed4
li t1, 0xa12cc448
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xa2eba8ff
li t1, 0x17553c6b
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f94033e
li t1, 0xa3e08b68
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc63e50e
li t1, 0xf2ad0f5b
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x2cd1b418
li t1, 0x42135381
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x4488ecab
li t1, 0xaf48655c
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x393a5395
li t1, 0x8a9f85f5
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x5a46f03b
li t1, 0x1abfe0ef
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xff0c53aa
li t1, 0x29a5adcd
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x80595aa3
li t1, 0x95f7b3ce
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x164d1b5e
li t1, 0xcf4b35f9
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x45deb241
li t1, 0x67861f9e
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xe030982
li t1, 0xc3049007
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fbf37f3
li t1, 0xa3743356
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3927219410
p.extract t2, t0, 0x4, 0x19
sw t2, 4(sp)
li t0, 897523089
p.extractu t2, t0, 0x1b, 0x15
sw t2, 4(sp)
li t0, 4281116705
p.insert t2, t0, 0x3, 0x2
sw t2, 4(sp)
li t0, 761607165
p.bclr t2, t0, 0x18, 0x2
sw t2, 4(sp)
li t0, 3755541148
p.bset t2, t0, 0x1d, 0x5
sw t2, 4(sp)
li t0, 0xeccf2903
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x1adc0ff0
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xa741bbb9
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe134a895
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xe741c2b6
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x160cc7e4
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x4cb578c5
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x99d47ea5
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xc348a714
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0x8f49f1d8
p.clip t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x24ba8bcf
p.clipu t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x5962738f
li t1, 0x5cfeb38d
p.addn t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x1188cfb7
li t1, 0xaeedf2b8
p.addun t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x66580ce8
li t1, 0x16d461e3
p.addrn t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x7e1e59d6
li t1, 0x60448735
p.addurn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x809c3a5c
li t1, 0x422c0b50
p.subn t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xf538677b
li t1, 0x2def80de
p.subun t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x62b748b2
li t1, 0x4c295c6d
p.subrn t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xf681ab2
li t1, 0x6f41fd73
p.suburn t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x587b92f1
li t1, 0xedacb7bf
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x3578381f
li t1, 0x23aef938
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbcebc382
li t1, 0x12f74958
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe52e7391
li t1, 0x9b85c429
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d2e0ce4
li t1, 0x73925ff
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xddf8587d
li t1, 0xa5d0d81e
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb34efe6
li t1, 0x9d6ac0d4
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x55ad1303
li t1, 0xffb5ea71
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a699e42
li t1, 0x9af304d2
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x903bb3c5
li t1, 0x3fff7f9c
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x44533538
li t1, 0x8ed62d7d
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x55a5b0aa
li t1, 0xbb086e88
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x198c2c71
li t1, 0xf8e842e6
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc544bdaf
li t1, 0xba41ba8f
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf44ab087
li t1, 0xcb179310
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf3ad89
li t1, 0xa16aa7d3
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa1d504ee
li t1, 0xe263c677
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe02eca35
li t1, 0x2b5fec6
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6b31b5d
li t1, 0x309df744
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xb8dc4ca5
li t1, 0x6f3a6f70
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xc1c5a553
li t1, 0xc820ec19
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d7ddca
li t1, 0x5441aae1
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x15170483
li t1, 0xd0a9f8a2
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x622e3b7a
li t1, 0xc7fcaaec
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x42902691
li t1, 0x141d6dc8
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6127fd5
li t1, 0x369ee5d2
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x55d8515f
li t1, 0x2db8da4c
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c10eba
li t1, 0xb7719896
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xd76655ef
li t1, 0x60633cd1
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a17d9a3
li t1, 0x71cca452
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x51a780da
li t1, 0x9972bbd2
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6dff260f
li t1, 0x385bebf
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa63d68d
li t1, 0x208381a7
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x85b5d179
li t1, 0xaa2579d
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3759013726
p.extract t2, t0, 0x6, 0x2
sw t2, 4(sp)
li t0, 2378666965
p.extractu t2, t0, 0x0, 0x10
sw t2, 4(sp)
li t0, 3958671025
p.insert t2, t0, 0xc, 0x1c
sw t2, 4(sp)
li t0, 914900220
p.bclr t2, t0, 0x14, 0x19
sw t2, 4(sp)
li t0, 1310020158
p.bset t2, t0, 0xf, 0x0
sw t2, 4(sp)
li t0, 0x70efb7a5
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0xae27d1cc
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xf0c6037b
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe5dd614b
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xa0bb8c32
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x55a3dccd
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x7ca9431d
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x81c9a384
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0x4bfa4165
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xed685b16
p.clip t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x711486ff
p.clipu t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xac86564
li t1, 0xce47b2c2
p.addn t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xc6f4b1e3
li t1, 0x1a0ca02e
p.addun t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xd7df58d2
li t1, 0x48ed35d0
p.addrn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xf44555b7
li t1, 0x239c8779
p.addurn t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x5c4aca39
li t1, 0x5f2999a0
p.subn t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x29c40927
li t1, 0x1791076f
p.subun t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x3816529b
li t1, 0x227da80b
p.subrn t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xb1f0c005
li t1, 0x489d388b
p.suburn t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x57b149c
li t1, 0xa341a465
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xbc8b990f
li t1, 0x85757be8
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x53d9020f
li t1, 0xda880ff7
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x71d977c1
li t1, 0x777d05fe
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf973acf
li t1, 0xa541b816
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x37d4ec42
li t1, 0xb777c64b
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc944e145
li t1, 0x9e0e4130
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf156444
li t1, 0x244dd4cc
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8256fc83
li t1, 0xf898ba5
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf6f5aad9
li t1, 0x237fe907
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x6d001b0b
li t1, 0xaee44742
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x13e42232
li t1, 0xa7b601e6
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf756194d
li t1, 0x78f76181
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x92fcb8e7
li t1, 0x45042486
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4960b0d7
li t1, 0xc8d4beda
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x17a44daa
li t1, 0x1fa7c428
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x81143708
li t1, 0x1400ef42
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xed28a418
li t1, 0xe58e07e7
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f42a928
li t1, 0x2300f5e9
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe374c95c
li t1, 0x7dc38726
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xb718ed4
li t1, 0xa12cc448
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xa2eba8ff
li t1, 0x17553c6b
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f94033e
li t1, 0xa3e08b68
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc63e50e
li t1, 0xf2ad0f5b
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x2cd1b418
li t1, 0x42135381
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x4488ecab
li t1, 0xaf48655c
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x393a5395
li t1, 0x8a9f85f5
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x5a46f03b
li t1, 0x1abfe0ef
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xff0c53aa
li t1, 0x29a5adcd
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x80595aa3
li t1, 0x95f7b3ce
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x164d1b5e
li t1, 0xcf4b35f9
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x45deb241
li t1, 0x67861f9e
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xe030982
li t1, 0xc3049007
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fbf37f3
li t1, 0xa3743356
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3927219410
p.extract t2, t0, 0x4, 0x19
sw t2, 4(sp)
li t0, 897523089
p.extractu t2, t0, 0x1b, 0x15
sw t2, 4(sp)
li t0, 4281116705
p.insert t2, t0, 0x3, 0x2
sw t2, 4(sp)
li t0, 761607165
p.bclr t2, t0, 0x18, 0x2
sw t2, 4(sp)
li t0, 3755541148
p.bset t2, t0, 0x1d, 0x5
sw t2, 4(sp)
li t0, 0xeccf2903
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x1adc0ff0
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xa741bbb9
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe134a895
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xe741c2b6
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x160cc7e4
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x4cb578c5
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x99d47ea5
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xc348a714
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0x8f49f1d8
p.clip t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x24ba8bcf
p.clipu t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x5962738f
li t1, 0x5cfeb38d
p.addn t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x1188cfb7
li t1, 0xaeedf2b8
p.addun t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x66580ce8
li t1, 0x16d461e3
p.addrn t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x7e1e59d6
li t1, 0x60448735
p.addurn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x809c3a5c
li t1, 0x422c0b50
p.subn t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xf538677b
li t1, 0x2def80de
p.subun t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x62b748b2
li t1, 0x4c295c6d
p.subrn t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xf681ab2
li t1, 0x6f41fd73
p.suburn t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x587b92f1
li t1, 0xedacb7bf
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x3578381f
li t1, 0x23aef938
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbcebc382
li t1, 0x12f74958
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe52e7391
li t1, 0x9b85c429
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d2e0ce4
li t1, 0x73925ff
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xddf8587d
li t1, 0xa5d0d81e
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb34efe6
li t1, 0x9d6ac0d4
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x55ad1303
li t1, 0xffb5ea71
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a699e42
li t1, 0x9af304d2
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x903bb3c5
li t1, 0x3fff7f9c
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x44533538
li t1, 0x8ed62d7d
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x55a5b0aa
li t1, 0xbb086e88
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x198c2c71
li t1, 0xf8e842e6
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc544bdaf
li t1, 0xba41ba8f
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf44ab087
li t1, 0xcb179310
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf3ad89
li t1, 0xa16aa7d3
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa1d504ee
li t1, 0xe263c677
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe02eca35
li t1, 0x2b5fec6
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6b31b5d
li t1, 0x309df744
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xb8dc4ca5
li t1, 0x6f3a6f70
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xc1c5a553
li t1, 0xc820ec19
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d7ddca
li t1, 0x5441aae1
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x15170483
li t1, 0xd0a9f8a2
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x622e3b7a
li t1, 0xc7fcaaec
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x42902691
li t1, 0x141d6dc8
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6127fd5
li t1, 0x369ee5d2
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x55d8515f
li t1, 0x2db8da4c
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c10eba
li t1, 0xb7719896
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xd76655ef
li t1, 0x60633cd1
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a17d9a3
li t1, 0x71cca452
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x51a780da
li t1, 0x9972bbd2
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6dff260f
li t1, 0x385bebf
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa63d68d
li t1, 0x208381a7
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x85b5d179
li t1, 0xaa2579d
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3759013726
p.extract t2, t0, 0x6, 0x2
sw t2, 4(sp)
li t0, 2378666965
p.extractu t2, t0, 0x0, 0x10
sw t2, 4(sp)
li t0, 3958671025
p.insert t2, t0, 0xc, 0x1c
sw t2, 4(sp)
li t0, 914900220
p.bclr t2, t0, 0x14, 0x19
sw t2, 4(sp)
li t0, 1310020158
p.bset t2, t0, 0xf, 0x0
sw t2, 4(sp)
li t0, 0x70efb7a5
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0xae27d1cc
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xf0c6037b
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe5dd614b
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xa0bb8c32
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x55a3dccd
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x7ca9431d
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x81c9a384
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0x4bfa4165
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0xed685b16
p.clip t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x711486ff
p.clipu t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xac86564
li t1, 0xce47b2c2
p.addn t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xc6f4b1e3
li t1, 0x1a0ca02e
p.addun t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xd7df58d2
li t1, 0x48ed35d0
p.addrn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xf44555b7
li t1, 0x239c8779
p.addurn t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x5c4aca39
li t1, 0x5f2999a0
p.subn t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x29c40927
li t1, 0x1791076f
p.subun t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x3816529b
li t1, 0x227da80b
p.subrn t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xb1f0c005
li t1, 0x489d388b
p.suburn t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x57b149c
li t1, 0xa341a465
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xbc8b990f
li t1, 0x85757be8
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x53d9020f
li t1, 0xda880ff7
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0x71d977c1
li t1, 0x777d05fe
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf973acf
li t1, 0xa541b816
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x37d4ec42
li t1, 0xb777c64b
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc944e145
li t1, 0x9e0e4130
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf156444
li t1, 0x244dd4cc
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8256fc83
li t1, 0xf898ba5
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf6f5aad9
li t1, 0x237fe907
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x6d001b0b
li t1, 0xaee44742
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x13e42232
li t1, 0xa7b601e6
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf756194d
li t1, 0x78f76181
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x92fcb8e7
li t1, 0x45042486
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4960b0d7
li t1, 0xc8d4beda
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x17a44daa
li t1, 0x1fa7c428
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x81143708
li t1, 0x1400ef42
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xed28a418
li t1, 0xe58e07e7
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f42a928
li t1, 0x2300f5e9
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe374c95c
li t1, 0x7dc38726
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xb718ed4
li t1, 0xa12cc448
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xa2eba8ff
li t1, 0x17553c6b
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f94033e
li t1, 0xa3e08b68
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc63e50e
li t1, 0xf2ad0f5b
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x2cd1b418
li t1, 0x42135381
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x4488ecab
li t1, 0xaf48655c
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x393a5395
li t1, 0x8a9f85f5
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x5a46f03b
li t1, 0x1abfe0ef
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xff0c53aa
li t1, 0x29a5adcd
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x80595aa3
li t1, 0x95f7b3ce
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x164d1b5e
li t1, 0xcf4b35f9
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x45deb241
li t1, 0x67861f9e
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xe030982
li t1, 0xc3049007
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fbf37f3
li t1, 0xa3743356
rem t2, t0, t1
sw t2, 4(sp)
li t0, 3927219410
p.extract t2, t0, 0x4, 0x19
sw t2, 4(sp)
li t0, 897523089
p.extractu t2, t0, 0x1b, 0x15
sw t2, 4(sp)
li t0, 4281116705
p.insert t2, t0, 0x3, 0x2
sw t2, 4(sp)
li t0, 761607165
p.bclr t2, t0, 0x18, 0x2
sw t2, 4(sp)
li t0, 3755541148
p.bset t2, t0, 0x1d, 0x5
sw t2, 4(sp)
li t0, 0xeccf2903
p.ff1 t2, t0
sw t2, 4(sp)
li t0, 0x1adc0ff0
p.fl1 t2, t0
sw t2, 4(sp)
li t0, 0xa741bbb9
p.clb t2, t0
sw t2, 4(sp)
li t0, 0xe134a895
p.cnt t2, t0
sw t2, 4(sp)
li t0, 0xe741c2b6
p.abs t2, t0
sw t2, 4(sp)
li t0, 0x160cc7e4
p.exths t2, t0
sw t2, 4(sp)
li t0, 0x4cb578c5
p.exthz t2, t0
sw t2, 4(sp)
li t0, 0x99d47ea5
p.extbs t2, t0
sw t2, 4(sp)
li t0, 0xc348a714
p.extbz t2, t0
sw t2, 4(sp)
li t0, 0x8f49f1d8
p.clip t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x24ba8bcf
p.clipu t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x5962738f
li t1, 0x5cfeb38d
p.addn t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x1188cfb7
li t1, 0xaeedf2b8
p.addun t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x66580ce8
li t1, 0x16d461e3
p.addrn t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x7e1e59d6
li t1, 0x60448735
p.addurn t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x809c3a5c
li t1, 0x422c0b50
p.subn t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xf538677b
li t1, 0x2def80de
p.subun t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x62b748b2
li t1, 0x4c295c6d
p.subrn t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xf681ab2
li t1, 0x6f41fd73
p.suburn t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x587b92f1
li t1, 0xedacb7bf
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x3578381f
li t1, 0x23aef938
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbcebc382
li t1, 0x12f74958
p.clipr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe52e7391
li t1, 0x9b85c429
p.clipur t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d2e0ce4
li t1, 0x73925ff
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xddf8587d
li t1, 0xa5d0d81e
p.minu t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb34efe6
li t1, 0x9d6ac0d4
p.max t2, t0, t1
sw t2, 4(sp)
li t0, 0x55ad1303
li t1, 0xffb5ea71
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a699e42
li t1, 0x9af304d2
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x903bb3c5
li t1, 0x3fff7f9c
p.extractur t2, t0, t1
sw t2, 4(sp)
li t0, 0x44533538
li t1, 0x8ed62d7d
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x55a5b0aa
li t1, 0xbb086e88
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x198c2c71
li t1, 0xf8e842e6
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc544bdaf
li t1, 0xba41ba8f
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf44ab087
li t1, 0xcb179310
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf3ad89
li t1, 0xa16aa7d3
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa1d504ee
li t1, 0xe263c677
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe02eca35
li t1, 0x2b5fec6
p.adduRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6b31b5d
li t1, 0x309df744
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xb8dc4ca5
li t1, 0x6f3a6f70
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x100
li t2, 0x214855
li t3, 0x0
Lstart:
	addi t0, t0,-1
	beq t0,t3, Lsa
	nop
bne t0,t3, Lstart
li t0, 0x10

nop 
li t3, -1000
Lsa:
	addi t3,t3,1
	p.beqimm t3, 0x3, 0x4c
	nop
blt t3, t0, Lsa
li t0, -1000

Lsb:
	addi t3, t3, -1
	nop
	nop
bge t3,t0, Lsb
nop
li t3, 10
li t0, 1000
Lsc:
	addi t3, t3, 1
	nop
	nop
bltu t3, t0, Lsc
nop
li t3, 10
li t0, 1000
Lsd:
	addi t3, t3, 1
	nop
	nop
bgeu t0, t3, Lsd
nop

li t0, 0x3380a945
li t1, 0x6cd00506
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8ba76597
li t1, 0xfd130cd
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3f5ebe2e
pv.add.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x2716e873
li t1, 0x4a679949
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x810c9809
li t1, 0x7fe7f152
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe0cbe6f5
pv.add.sci.b t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x4f381f0b
li t1, 0x628c3c8e
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x20c3d8ad
li t1, 0x8bd076d0
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e82906d
pv.sub.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x3d34ece3
li t1, 0x6da0a006
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x11b74be
li t1, 0xa8706b96
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d9b4f10
pv.sub.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x84a960ca
li t1, 0xb716b9cd
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x944a26d7
li t1, 0x8b0ae46d
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9a537069
pv.avg.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0xdc761772
li t1, 0x203b151d
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8100cc57
li t1, 0xa3e19ec7
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8b91af51
pv.avg.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x41380cac
li t1, 0x7eea03a3
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7053865e
li t1, 0xeb3cbeb0
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x593dcd0f
pv.avgu.sci.h t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0xce57c69c
li t1, 0xb5b43c50
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf04d823
li t1, 0x15c523f
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9f6e26bb
pv.avgu.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x9193ebfc
li t1, 0x99cdd8fd
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x155143e5
li t1, 0x9bfe83a6
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x15c680a9
pv.min.sci.h t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0x9c06158
li t1, 0x631f6e47
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xda6d8459
li t1, 0x7dbc9672
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x75cf224d
pv.min.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0xeb644bf0
li t1, 0xc2127ce6
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x41d73b45
li t1, 0x53e2cd6c
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b206b66
pv.minu.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x1ec57b22
li t1, 0x37ef10b0
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7e974795
li t1, 0x12062bb8
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x88b92170
pv.minu.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x22039b03
li t1, 0x15cf25eb
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdc7b1235
li t1, 0x2b68d708
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x96eeb33c
pv.max.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0xe1ae3d98
li t1, 0x738864b8
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x40297b10
li t1, 0xa1fb7bfd
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd27e9e21
pv.max.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0xeacfaeef
li t1, 0x204abfe6
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe8fa42c
li t1, 0x3eabbdec
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x82fa969
pv.maxu.sci.h t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0x9e6afb5e
li t1, 0x252ecbe3
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd4ce766b
li t1, 0xe1f472dd
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe2f3876b
pv.maxu.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0xf0c4e550
li t1, 0x948e93c8
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x29450a69
li t1, 0xff8734da
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4351a8e
pv.srl.sci.h t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x2ef62af3
li t1, 0x12783e32
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x690de669
li t1, 0xc823569a
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf27c4665
pv.srl.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xeb8a6370
li t1, 0xec69ad6c
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2bb0f79c
li t1, 0x3f113626
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2e625e4f
pv.sra.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0xe78b04e5
li t1, 0xb3a438e7
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c39093d
li t1, 0xdba58982
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb46e26ce
pv.sra.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x8e830f11
li t1, 0xcb4f3970
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc7dc2016
li t1, 0x7b3e3389
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8e1c1a9
pv.sll.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0xd9dda6e4
li t1, 0x681e362
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x885ccae3
li t1, 0x9f9c7858
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x26e02a5f
pv.sll.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x40ec35b8
li t1, 0x667499b7
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8a99cc7b
li t1, 0x27502b2a
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa8b8ec7f
pv.or.sci.h t2, t0, 0x2
sw t2, 4(sp)
li t0, 0xe544ba17
li t1, 0x923417e9
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe07a7277
li t1, 0x5b3804bf
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x94dde549
pv.or.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x711a6e2e
li t1, 0xef33225d
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x15f26546
li t1, 0x434002e2
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x77936cf
pv.xor.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0xc8d64df4
li t1, 0x7459c175
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9bb99315
li t1, 0xdae74330
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc1b7232
pv.xor.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x4eabfd98
li t1, 0x7475919d
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x69a55f87
li t1, 0x48b4c39b
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x90caea78
pv.and.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x276351a4
li t1, 0xdf03700c
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1b8e75ae
li t1, 0x3b002a23
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd9a8acd4
pv.and.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0xea7bc133
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0x8be6cb5e
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0xb25a41c8
li t1, 0xcec4530f
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x73eb3131
pv.shuffle.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xb395a5e4
li t1, 0x310b6b52
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfbbdc3ee
pv.shuffleI0.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x8c61e2f0
pv.shuffleI1.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x18cdb3fe
pv.shuffleI2.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x5a671625
pv.shuffleI3.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0xcb89560e
li t1, 0xf9150526
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7d09e578
li t1, 0xc7c693e9
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdfd525b3
li t1, 0xb76de61f
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7b673ba4
li t1, 0xe766d284
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5de1c8ef
li t1, 0x4314d15
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x13a8d66d
li t1, 0x226fd133
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3c654b09
li t1, 0xb71728e3
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x240a6acf
pv.cmpeq.sci.h t2, t0, 0x2
sw t2, 4(sp)
li t0, 0xaf6758df
li t1, 0x134a689
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33a3aab5
li t1, 0x4eb70dae
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x485852b8
pv.cmpeq.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x3a46537f
li t1, 0x93382293
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc55b7b49
li t1, 0x2e33edd8
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x853cbc5b
pv.cmpne.sci.h t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0xb8dc0f94
li t1, 0xead05a67
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2df605af
li t1, 0xad27cddb
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xffdf9368
pv.cmpne.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xa8df367c
li t1, 0x7988e3e4
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4ec46960
li t1, 0x49eca0da
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x72865b23
pv.cmpgt.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x7337f591
li t1, 0xe2b0e186
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf5b5bb79
li t1, 0xc21b1323
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb352d50c
pv.cmpgt.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x461e6870
li t1, 0x7493c840
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x485c4585
li t1, 0x668cbee2
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b5f91ed
pv.cmpge.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0xdd77e7ce
li t1, 0x5fe410f9
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4173995d
li t1, 0xb6d616c5
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2542de67
pv.cmpge.sci.b t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xf31daf4d
li t1, 0x65f426fc
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d7a4254
li t1, 0x3e2ac425
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x193c2afd
pv.cmplt.sci.h t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x66beb6de
li t1, 0xf4c6dd42
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5254568d
li t1, 0x329d9135
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd99c7a3e
pv.cmplt.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x7c2fbdb
li t1, 0x2eaf46e1
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x40c2cf19
li t1, 0x95cd7d9c
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f7c6caa
pv.cmple.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0xaa23f31c
li t1, 0x15c3cbd6
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcb855a2f
li t1, 0xf57b609d
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x11c18ddd
pv.cmple.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x9da1f9dc
li t1, 0xf3a1e224
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a118899
li t1, 0xc809ec86
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa7c1cc2d
pv.cmpgtu.sci.h t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0x1b48495a
li t1, 0x1c9ee60c
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6ba1b486
li t1, 0xec876ef
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6c0a64d4
pv.cmpgtu.sci.b t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0x86780590
li t1, 0xd8f88868
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8fd3ac44
li t1, 0x6cb9a763
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x37740d83
pv.cmpgeu.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x2ca05b2
li t1, 0xd27084af
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb5ca1db9
li t1, 0xe8f53bb0
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3f4259ba
pv.cmpgeu.sci.b t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0xef80a8cc
li t1, 0xfd85baf1
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x110af9ff
li t1, 0xfe199bbb
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x80ac369f
pv.cmpltu.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x4da75105
li t1, 0x2376136b
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa2bdbd64
li t1, 0x52185562
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4541d9f5
pv.cmpltu.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x896b47d1
li t1, 0x5b5a7914
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x653bea07
li t1, 0x70e53899
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8e5ac6f5
pv.cmpleu.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x903e6d42
li t1, 0x88adf216
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x50ecbedf
li t1, 0xd13fded4
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x347aa4bd
pv.cmpleu.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xad0c8e89
li t1, 0xa09d8a58
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x247a54ef
li t1, 0x6b7621c5
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x69be6ef5
pv.add.sci.h t2, t0, 0x2
sw t2, 4(sp)
li t0, 0xefd80639
li t1, 0x6a7a82d0
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf244fb6
li t1, 0x9d16caf8
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33d211a2
pv.add.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0xc89339ab
li t1, 0xdd4a8e55
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb5d14f7
li t1, 0xa23df784
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f9672b5
pv.sub.sci.h t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x1647bb84
li t1, 0xce7a1901
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x83d625c1
li t1, 0x183faa7f
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x45eefce
pv.sub.sci.b t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0x94879022
li t1, 0xcf5dff1
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa9d4b4ca
li t1, 0x1c5f69c7
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe2a4c91
pv.avg.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xabb04418
li t1, 0xbc128425
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x99ba806a
li t1, 0x7198bb6d
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe5ad27ce
pv.avg.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x83b0bedd
li t1, 0xe8379f45
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x668507b0
li t1, 0xaea6baf8
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe57d2b48
pv.avgu.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x14b0217c
li t1, 0x133f0e5
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc91ff76
li t1, 0x9578df95
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf98f35d
pv.avgu.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0xb13589f9
li t1, 0xddf4703b
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7ec05763
li t1, 0xc3c55dff
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8542e669
pv.min.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x3f2a6552
li t1, 0x9d0f5928
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x17a09255
li t1, 0x848f6a92
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x117a4892
pv.min.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x5e9f7686
li t1, 0x66e5a91
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2b392853
li t1, 0x7855c40a
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x62059e60
pv.minu.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x303e3bb8
li t1, 0x826c9318
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x15fdaa96
li t1, 0xd5208a81
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc94dc61e
pv.minu.sci.b t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0xe3f9e666
li t1, 0xf5822fb3
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe26b20f9
li t1, 0xbd4d8073
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe256f21a
pv.max.sci.h t2, t0, 0x0
sw t2, 4(sp)
li t0, 0xf005de17
li t1, 0x322a295e
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x848f8b05
li t1, 0xd38b666e
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xaf3b38ab
pv.max.sci.b t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0xb6e328a
li t1, 0xc887e4da
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbf563821
li t1, 0x44d28440
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2db44886
pv.maxu.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0xb178d3ee
li t1, 0xa1c4ea5e
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe65dbfe
li t1, 0xfb27a0fb
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa626d047
pv.maxu.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x5b21d642
li t1, 0x132b21ba
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe9e5725c
li t1, 0xcacbcb42
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x64ef118a
pv.srl.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xb5e324f
li t1, 0x32fb7fb0
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4fb4a75d
li t1, 0xbed434a3
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6727db60
pv.srl.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0xe4713db3
li t1, 0x97018c27
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf7c40de5
li t1, 0x5c1efbe1
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6e0dc5a5
pv.sra.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x3d4c03ee
li t1, 0xa438fa51
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ae6572d
li t1, 0x8a28fc99
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4acef730
pv.sra.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x4fd5bfe5
li t1, 0x31b66117
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa50a341c
li t1, 0x111dff33
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ade3350
pv.sll.sci.h t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0x3d426a0c
li t1, 0x2f800b5b
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe1462c79
li t1, 0x177f1622
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2717cc46
pv.sll.sci.b t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x7a71eccd
li t1, 0x3a5c94ad
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x418ffe57
li t1, 0xf9c154a
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9bcfb45
pv.or.sci.h t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0xb12da61d
li t1, 0xfce46a0f
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xde8cde6c
li t1, 0xb4464dbf
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5eb1c4cd
pv.or.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xa895ae41
li t1, 0x2de4765d
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x10242b42
li t1, 0x56e4e809
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8da5a81f
pv.xor.sci.h t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x9d21d825
li t1, 0x8e251bf5
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x43882818
li t1, 0x1c320e42
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd9b5fb4
pv.xor.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x5877ac44
li t1, 0x6411fb84
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x203164a7
li t1, 0x87d78fc1
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2be64c82
pv.and.sci.h t2, t0, 0x14
sw t2, 4(sp)
li t0, 0xd33388a6
li t1, 0x21bd62b5
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x431e56d6
li t1, 0x8cde05d9
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x758e2465
pv.and.sci.b t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0x3a611f66
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0x2a87e05c
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0x21376936
li t1, 0xbf74ddca
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfb939e63
pv.shuffle.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x46418c0e
li t1, 0xd8985fd
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6b1550b6
pv.shuffleI0.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x62d6b225
pv.shuffleI1.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x376330e7
pv.shuffleI2.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x6392ba42
pv.shuffleI3.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x36f9934f
li t1, 0x84b69015
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe4fd73c
li t1, 0xd1776421
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x843632d8
li t1, 0x36d48997
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xff8345d0
li t1, 0xa3a1b834
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb445c030
li t1, 0xaf0ad350
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf246db99
li t1, 0x92c9dc1f
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2fead417
li t1, 0x4a3aeeeb
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x95a68220
pv.cmpeq.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x3699c19d
li t1, 0xf0f4ed99
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdda5fed9
li t1, 0xe4cf7fd3
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdbc4a47b
pv.cmpeq.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0xccfb3479
li t1, 0x501c640b
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe2e7e0f4
li t1, 0x36fd2684
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe028e827
pv.cmpne.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x79d04ec6
li t1, 0x647114ff
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x64e88ea4
li t1, 0x45d39a18
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc90925b
pv.cmpne.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x954eb706
li t1, 0x8fe97e34
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xebcc1197
li t1, 0xfc59c51b
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb8b25874
pv.cmpgt.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x9af9249f
li t1, 0x9b43ccf9
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3db22d0a
li t1, 0x2c3450f0
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xac3cbbcb
pv.cmpgt.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x9c420139
li t1, 0x91eec7fc
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4989a56d
li t1, 0x53ad3104
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3665130
pv.cmpge.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x293c4ee8
li t1, 0xc0af9ea0
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfd0afc97
li t1, 0x480c3a2a
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x17dfe94e
pv.cmpge.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x9680ec5d
li t1, 0xb1ae7556
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd430f9d0
li t1, 0xe6f9d7b5
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x10ca4a5
pv.cmplt.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x7a697d65
li t1, 0xbd8ff0e2
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc5d3e95
li t1, 0x861b8b3b
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x685a8eaf
pv.cmplt.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x6075f4f9
li t1, 0x76f76797
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x53c205df
li t1, 0x2c50f663
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x763338e6
pv.cmple.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x9ddbbbbf
li t1, 0x13b139dc
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa7b43da7
li t1, 0x8f0b8540
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1ed46128
pv.cmple.sci.b t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0xea54cada
li t1, 0x50c0ac38
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x46ad5025
li t1, 0x7d6ede43
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc7da96a
pv.cmpgtu.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x19f63aa1
li t1, 0xd89a6c31
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7de51e12
li t1, 0xc97b890c
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c76a890
pv.cmpgtu.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x1e10ab75
li t1, 0x8e1df635
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3992cf5
li t1, 0x40b07598
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe6a9028f
pv.cmpgeu.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0xfc585a89
li t1, 0x5e0bc91c
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf36b6dcb
li t1, 0x4bd1ce21
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7ca77136
pv.cmpgeu.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x672057f1
li t1, 0x34e0e8b0
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x587d6010
li t1, 0x3e78f2d6
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6e968b89
pv.cmpltu.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x8b3e75
li t1, 0x810a9d57
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcb0ac62f
li t1, 0xa805f8cb
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5cf6142c
pv.cmpltu.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xf0e33270
li t1, 0xc5060cbf
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x954ecc01
li t1, 0x8dbdee44
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x10aa4820
pv.cmpleu.sci.h t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0xdaac8a6c
li t1, 0xf6f4d164
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5870a200
li t1, 0xf3922cbe
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3adf0210
pv.cmpleu.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x30f02ce9
li t1, 0xc2cfe660
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1efff241
li t1, 0x8aec939
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x62fa808f
pv.add.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0xc59bf409
li t1, 0xa854cd7f
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc70e2393
li t1, 0xc10ff791
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd588e98e
pv.add.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x8a4fbde1
li t1, 0x89103462
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x73b082
li t1, 0xbb200205
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x914ebc95
pv.sub.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x36d74233
li t1, 0xf425fdf8
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6db42b4
li t1, 0x1113c51e
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x28a1299c
pv.sub.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x8ca08291
li t1, 0xdb4e0d9d
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf71b7fd5
li t1, 0xaf4f91fc
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa4490f59
pv.avg.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0xbe0eddd0
li t1, 0x1c2be315
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6e97bf71
li t1, 0x8030559c
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc0e9a9f
pv.avg.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x1306d8b7
li t1, 0x380bb8da
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6335b21
li t1, 0xdef90d2f
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfd15d80b
pv.avgu.sci.h t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x41d19a68
li t1, 0xfe26a67e
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc4453ad3
li t1, 0x37e61ca0
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf25ba7e7
pv.avgu.sci.b t2, t0, 0x11
sw t2, 4(sp)
li t0, 0xef8c464
li t1, 0x8e0907fd
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7347f272
li t1, 0x8727fae2
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1229bfde
pv.min.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0xe18b21ad
li t1, 0x351e8fed
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa48b2045
li t1, 0xbf2783c3
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x57d72382
pv.min.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0xcc632204
li t1, 0x3f11767
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd3ee72f3
li t1, 0x1d582453
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x71d34c3c
pv.minu.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xfa187233
li t1, 0xb82acf02
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2a3fe145
li t1, 0x425ef874
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6439117d
pv.minu.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x9675a1d
li t1, 0x69038144
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcd505eaa
li t1, 0x5f6360ff
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x73182919
pv.max.sci.h t2, t0, 0x3
sw t2, 4(sp)
li t0, 0x1cfb5f3b
li t1, 0xb1025870
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c806a01
li t1, 0x897aff29
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5618b844
pv.max.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x5d95e218
li t1, 0x94dafd26
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x934c06a3
li t1, 0x3a62b9d7
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8d03ad13
pv.maxu.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x76553d22
li t1, 0xb6c55ead
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc5c3523
li t1, 0x6b584235
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4875804c
pv.maxu.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x1db6f59d
li t1, 0xc90fdb9f
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x637ee204
li t1, 0x52d1b490
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4999388c
pv.srl.sci.h t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xfd4817cf
li t1, 0x9068e2e2
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xee2e72c0
li t1, 0x425540b9
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2d4f4121
pv.srl.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xb38dab3e
li t1, 0xab061f64
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xaaea38e8
li t1, 0xc61e2ded
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7c516d5b
pv.sra.sci.h t2, t0, 0x14
sw t2, 4(sp)
li t0, 0xfc38a1ff
li t1, 0xf0f47360
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x692cca4e
li t1, 0xe976f486
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf8f6904e
pv.sra.sci.b t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0x83d8f4e6
li t1, 0x87e4e4af
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfdffff82
li t1, 0x82cab599
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x20c1087c
pv.sll.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x9c9e9f91
li t1, 0x9998b01e
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8207bde8
li t1, 0x791c9b5f
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b1decc9
pv.sll.sci.b t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0xbf6436e9
li t1, 0x25d8df8b
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1fae7e9f
li t1, 0x79d53b6e
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x985ed6a4
pv.or.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x4e8b0acc
li t1, 0x2850c1a
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d14c91a
li t1, 0xefbdc82c
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x827ad695
pv.or.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x7bafeb43
li t1, 0xd2f41665
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb893477
li t1, 0xdc03dae4
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd0c1b4fb
pv.xor.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x27475509
li t1, 0x20dc8ec9
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbfc3868f
li t1, 0xaed3ac08
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d8af9dd
pv.xor.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x74a44995
li t1, 0xe0c832a4
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcb6d92c9
li t1, 0x36e3a669
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5b7906cb
pv.and.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x4740e11e
li t1, 0x34677ded
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa25f0bb
li t1, 0x37f847e2
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd3115821
pv.and.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0xa8e8c7eb
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0x5afa4bbc
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0x1a971d76
li t1, 0x6bfd9513
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe5bf05ea
pv.shuffle.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x938524be
li t1, 0xd7dab053
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x12b3e2c4
pv.shuffleI0.sci.b t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0x1792d4c2
pv.shuffleI1.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x9c6941e6
pv.shuffleI2.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x9ef8b59b
pv.shuffleI3.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0xd1226775
li t1, 0x360cbf5b
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa0ddf6fc
li t1, 0x8fd6768d
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x913e5438
li t1, 0x20f48dfe
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6b3668e0
li t1, 0x61740295
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x71bc4dea
li t1, 0x473507d0
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x185efb4d
li t1, 0x1222fede
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf8ececd8
li t1, 0xcedb085f
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x501e7990
pv.cmpeq.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0xf6d38ed2
li t1, 0x97daf3c3
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3073c0c5
li t1, 0x731bf701
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c8561ae
pv.cmpeq.sci.b t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0xb5095748
li t1, 0xbbd916cc
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x13b9506e
li t1, 0xd3523c9d
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3dee4fbe
pv.cmpne.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x47f20fc8
li t1, 0x705997c
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x58f84245
li t1, 0x9906d9c2
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x110bee3f
pv.cmpne.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x4529d3d3
li t1, 0xaf450560
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5a23dddb
li t1, 0x9a821a6f
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x965fb532
pv.cmpgt.sci.h t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x20c1031
li t1, 0x6d7ded84
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x17467396
li t1, 0x382fbf86
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x439306cb
pv.cmpgt.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x67a1cc59
li t1, 0xe18b2b44
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3598798c
li t1, 0xc2dea79c
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7fbc392e
pv.cmpge.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x157d9fa9
li t1, 0x8f088911
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe17ad7ec
li t1, 0x69717ea8
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e3e6a22
pv.cmpge.sci.b t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x2159d74b
li t1, 0x3d89a4f2
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c78e83a
li t1, 0x316e90d4
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xab5ae7d1
pv.cmplt.sci.h t2, t0, 0x9
sw t2, 4(sp)
li t0, 0xa7f812b9
li t1, 0x1f234fa2
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x321a2aa3
li t1, 0x1acdb002
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb528d7d6
pv.cmplt.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xcd2c64af
li t1, 0xa1ae4903
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe0ca46b
li t1, 0xc1fc2919
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x21664197
pv.cmple.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x68bfdbe0
li t1, 0xbc723edf
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc66f81b5
li t1, 0xb0c37ec1
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xca341a3f
pv.cmple.sci.b t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x5a71cf83
li t1, 0x454e6ef1
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe4c8e87a
li t1, 0x253cad89
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4c38e474
pv.cmpgtu.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x71ca1dd7
li t1, 0xcf67a616
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x95d83e55
li t1, 0x21b4139b
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb954cfc4
pv.cmpgtu.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x1c674db5
li t1, 0xb730bd85
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c0ab64
li t1, 0x63a2b540
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9e996b85
pv.cmpgeu.sci.h t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x90fc15f7
li t1, 0x758d3375
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9c47650f
li t1, 0x3ab5c2ed
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4d4b1955
pv.cmpgeu.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x7f877dfa
li t1, 0xdd53504
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x71820107
li t1, 0xeb75872d
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb5bb466f
pv.cmpltu.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x11b9a615
li t1, 0x241baab0
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd2df0661
li t1, 0x1a7c3771
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x194acdb0
pv.cmpltu.sci.b t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x68cfe723
li t1, 0x8c247d84
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x938d117e
li t1, 0x5249a23
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x605ab84a
pv.cmpleu.sci.h t2, t0, 0xe
sw t2, 4(sp)
li t0, 0xba036c02
li t1, 0xf339f029
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf0785f92
li t1, 0xab7b34c4
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xab785cd4
pv.cmpleu.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0xf6bdb864
li t1, 0x6ba27f50
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8ec0db53
li t1, 0xfee50280
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ddffcb1
pv.add.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xb59f7352
li t1, 0xd68a35b5
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xadf1232f
li t1, 0xa4e55756
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x398fb5d
pv.add.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0xd93fe71b
li t1, 0xd4f6fb6c
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xef26eb63
li t1, 0xe58358e7
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x683a147c
pv.sub.sci.h t2, t0, 0x15
sw t2, 4(sp)
li t0, 0xd1bf88b
li t1, 0xabc44026
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdad2b36d
li t1, 0x3479a273
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x93504337
pv.sub.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0xf81a5a5b
li t1, 0x6885d6a3
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd4068d27
li t1, 0xc20e6ae
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb4143dd7
pv.avg.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x28295ce5
li t1, 0x1a174e7d
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x37f65e45
li t1, 0xfdd48133
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c79e17f
pv.avg.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x839db685
li t1, 0x1160c135
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x70351d03
li t1, 0x94ca9d9
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2317976c
pv.avgu.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x9204bb4f
li t1, 0x8fda91bf
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc5acf3d1
li t1, 0x2b0245f0
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xffe3a3d
pv.avgu.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0xccadc0ce
li t1, 0xc626a814
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4e748b5b
li t1, 0xbf300a1a
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb44025a9
pv.min.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0xcfb9348e
li t1, 0xfd5c83a5
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1560af0d
li t1, 0x656ea680
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc78c994
pv.min.sci.b t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x65f4f095
li t1, 0x1b2fa7e6
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1115b1dd
li t1, 0xf6523896
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x82816ddf
pv.minu.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x9d2250b5
li t1, 0xf8bcbc1f
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4eea0410
li t1, 0x10485a67
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33b0dc8d
pv.minu.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x8205eef6
li t1, 0x69124916
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x16337837
li t1, 0xed7cae8c
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x86c1fb8f
pv.max.sci.h t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x95847dd7
li t1, 0xd932b1b3
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x36833360
li t1, 0xe57fd201
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe17e4929
pv.max.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0xf222fb47
li t1, 0xf23375e8
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a9b604f
li t1, 0xfc84669a
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8a3efef3
pv.maxu.sci.h t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x51bc3e43
li t1, 0xaef14eef
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc060dd0c
li t1, 0xecbcfa0f
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x416c3a63
pv.maxu.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0xcce606dc
li t1, 0x8ca94399
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9e06280f
li t1, 0x5d7ed7ac
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xef6ad00e
pv.srl.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x63270984
li t1, 0xf779d0c3
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc1c43b5
li t1, 0x9da32458
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x906e902
pv.srl.sci.b t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0xff2c286d
li t1, 0x79fcfd27
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe12a79d0
li t1, 0x36a04fa6
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcacbc383
pv.sra.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0xcfb9b2e3
li t1, 0x71441ac3
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5187ab3
li t1, 0x54899b34
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd2b6b9f4
pv.sra.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0xcce8fd78
li t1, 0x47a87610
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f4edc8
li t1, 0x642d5b66
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x59e2b1b6
pv.sll.sci.h t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x153da76b
li t1, 0x606465ff
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x629bfe7c
li t1, 0xfd46134d
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcca495bf
pv.sll.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x2663806e
li t1, 0x25a0f849
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x89aa3cce
li t1, 0x1c7d4d6c
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe2968def
pv.or.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x19c1c4ad
li t1, 0x9bd0303e
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb4293e0e
li t1, 0xf0e12c11
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4940c334
pv.or.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0xad90b811
li t1, 0xb1b75d1a
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xea05f860
li t1, 0x5118e4cd
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbe33499f
pv.xor.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0xcbcc9dda
li t1, 0x931f639c
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x21d7cdc2
li t1, 0x4c41a601
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x322cb332
pv.xor.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x92afd4ca
li t1, 0x1acef34e
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb007ac62
li t1, 0x6de3b90
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf945cdc3
pv.and.sci.h t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xa71d2bfb
li t1, 0xb273e09a
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfd1e6323
li t1, 0x57988fce
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcea48b68
pv.and.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x7f464509
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0xc7b4de2b
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0x512cf892
li t1, 0x16c73bbb
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1b2ccf30
pv.shuffle.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x8cf58c4
li t1, 0x55f5c965
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x67a084d6
pv.shuffleI0.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x191175e7
pv.shuffleI1.sci.b t2, t0, 0x13
sw t2, 4(sp)
li t0, 0xd21de0dd
pv.shuffleI2.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0xb01bc59f
pv.shuffleI3.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0xe877da3d
li t1, 0xecb81282
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc3e972d
li t1, 0xd5f34406
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd0e05564
li t1, 0xdb508294
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1a0e5c6f
li t1, 0xcc9e564d
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf12949be
li t1, 0x9fbf239a
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x52403588
li t1, 0xc7e1160a
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf44e9cfe
li t1, 0x5fe87d22
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xce328444
pv.cmpeq.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x2c4b921f
li t1, 0x1f3824d2
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x22e6e2e4
li t1, 0x1650e217
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x46cd340d
pv.cmpeq.sci.b t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x937494e9
li t1, 0x2ea26c3a
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x246ba088
li t1, 0xa93b3b14
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6620bd8a
pv.cmpne.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x1fe7011f
li t1, 0x6115409d
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x46c56420
li t1, 0x64822688
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x34b4fd23
pv.cmpne.sci.b t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0x956f73da
li t1, 0x491f57d2
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f139b97
li t1, 0x8ed852a3
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fde9d4e
pv.cmpgt.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0xea68739d
li t1, 0xa92fe830
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfd1b76d9
li t1, 0xe927ebf2
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb01096fb
pv.cmpgt.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x4069a8c4
li t1, 0xbab3f44
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe35baf50
li t1, 0x52e2371e
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7ad278c7
pv.cmpge.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0xe9e5484c
li t1, 0x9cb8b2ad
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4d59186c
li t1, 0x58793d21
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x55c82354
pv.cmpge.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x6569c68f
li t1, 0xeb08855
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd9090f44
li t1, 0xdb813ceb
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb97cce8f
pv.cmplt.sci.h t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x54c7e00b
li t1, 0xb597a754
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2435943d
li t1, 0x406680c4
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x34af150a
pv.cmplt.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x41ff64d0
li t1, 0xdc14f953
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xeb6f1c41
li t1, 0x1e681174
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7ad408b8
pv.cmple.sci.h t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x4f4d195a
li t1, 0xd8ba0706
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xca3c5a61
li t1, 0x18a9a5a9
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc56d3b84
pv.cmple.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0xd43e5a06
li t1, 0x83e99c3d
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa6648c89
li t1, 0x9412bda0
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc7b1b49d
pv.cmpgtu.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xace55c90
li t1, 0xad8b1479
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x782bc8a5
li t1, 0x1727875f
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xca10e156
pv.cmpgtu.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0xf59a0816
li t1, 0x22d1e63a
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7c2d58cd
li t1, 0x3ae42e83
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x44e15eb
pv.cmpgeu.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x318aa02e
li t1, 0x570c8c50
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfb65804b
li t1, 0xe0e1757
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x99747b2d
pv.cmpgeu.sci.b t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0xa61bb044
li t1, 0xacf5a3bc
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe3456306
li t1, 0xa0bacd6d
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xba0e86d8
pv.cmpltu.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x5422a73f
li t1, 0xb1d806a1
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4bda436a
li t1, 0xef94be0b
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf011da2
pv.cmpltu.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x87b863df
li t1, 0xc6906191
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc18a3e5e
li t1, 0xbb5ef094
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7a04051e
pv.cmpleu.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x988aa280
li t1, 0x1aa429dd
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc7dd6649
li t1, 0x74194664
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f1609f0
pv.cmpleu.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xceab77e6
li t1, 0x89fbe230
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xec6cc527
li t1, 0xfaee0840
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c83e587
pv.add.sci.h t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x2bd761e8
li t1, 0x3e526d0a
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf72e2694
li t1, 0xfb1fb9d
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8d945ab5
pv.add.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x9b3567e9
li t1, 0xd92793a
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d8a8efd
li t1, 0x8356c4b6
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x709538bf
pv.sub.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x5265b411
li t1, 0x37ebd46d
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa17a06cf
li t1, 0x27c49db3
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6dae90d2
pv.sub.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x7cf7ddb3
li t1, 0x663cfe6
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x12e57572
li t1, 0x5ae5f3eb
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd15a45a9
pv.avg.sci.h t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x9ca51581
li t1, 0xa1cfe43f
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x17e9fb6
li t1, 0x5e15dfa6
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x94a08b2f
pv.avg.sci.b t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0x409fcc5b
li t1, 0x8d866130
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xce037fcf
li t1, 0xa90dcf07
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x90abf391
pv.avgu.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0xdcd39b45
li t1, 0x1447b43c
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d4441fc
li t1, 0xc319b822
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x488de338
pv.avgu.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0xf95d1354
li t1, 0xd08a264
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2d6d1a3e
li t1, 0x7c61b8ec
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fde3796
pv.min.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x8e016c9b
li t1, 0x7e574145
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2b845193
li t1, 0x288bc3ff
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x341e127
pv.min.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0xf0c4d972
li t1, 0xefdad568
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x869d78b
li t1, 0x178c358b
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xebf999bf
pv.minu.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x263e0564
li t1, 0x8ad4e940
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x558f454f
li t1, 0xa59e9bcb
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb2f4e264
pv.minu.sci.b t2, t0, 0x11
sw t2, 4(sp)
li t0, 0xdb080729
li t1, 0x24648a6e
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8cb9bf8d
li t1, 0x9a060e18
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c4b50be
pv.max.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0xbbe58ac1
li t1, 0x1a93b118
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ceac349
li t1, 0xd70e90da
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3911c39
pv.max.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0xd3f2280b
li t1, 0x379a6815
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc7dc3257
li t1, 0xea9c210d
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x97f9f2e1
pv.maxu.sci.h t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0xbf9d4505
li t1, 0x6a4cf3dc
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x891b077b
li t1, 0x1929b748
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x90464b17
pv.maxu.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x7fc9f617
li t1, 0xecf4de09
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8dd757f3
li t1, 0xf14390b5
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e9907c7
pv.srl.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x68ac710e
li t1, 0x270d6f59
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe88876f8
li t1, 0x2c357fee
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf5c517f
pv.srl.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x6672c747
li t1, 0xfc1f6a5e
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x22fdc7a2
li t1, 0x4b32df0b
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2419cec5
pv.sra.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xc7ac4cc9
li t1, 0xa273a3fc
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7a17e554
li t1, 0xb10fe644
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf59e9698
pv.sra.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xa9a8441b
li t1, 0xae746971
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4c43dcc1
li t1, 0x4c7971a1
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4bd1de09
pv.sll.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x811f146b
li t1, 0x92fb717d
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2cc59b3b
li t1, 0x620b5801
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x492601a3
pv.sll.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0xb001b182
li t1, 0xc4c0953
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd1487934
li t1, 0xe6537f
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd74d8cb6
pv.or.sci.h t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xed3b67bc
li t1, 0xe01b8755
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x58dda52b
li t1, 0x57b37f38
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1880d5d6
pv.or.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xc8ff478b
li t1, 0xf338c80e
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x979e3e77
li t1, 0xc3e87b22
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa5207277
pv.xor.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x99cfdefd
li t1, 0xdb7c4bc2
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6f63cb2
li t1, 0x1cfbb637
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb08ceb90
pv.xor.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0xa68034f5
li t1, 0x6845c323
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8796655f
li t1, 0xdf2fd44b
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb6cb937a
pv.and.sci.h t2, t0, 0x6
sw t2, 4(sp)
li t0, 0xd9ed5523
li t1, 0x19cb59ae
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7be37b7b
li t1, 0x71c14fe3
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6d6a659a
pv.and.sci.b t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0x414cfd9f
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0xf2bd075a
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0x7bda185b
li t1, 0xcfd452af
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7c0583b
pv.shuffle.sci.h t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x40273ca2
li t1, 0x1639a61a
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbdc77e35
pv.shuffleI0.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x557abefe
pv.shuffleI1.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0xc0625a47
pv.shuffleI2.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x225f0688
pv.shuffleI3.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x7b1f7c62
li t1, 0x589a79d8
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xeb08bea6
li t1, 0xd7f08484
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4ed8a7ba
li t1, 0x1c7949f6
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd439c60e
li t1, 0x376ae877
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x834bd1cf
li t1, 0xa0304b50
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x48c0d622
li t1, 0x6f13249c
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f497b59
li t1, 0xb9cd2529
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x927c8fe1
pv.cmpeq.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x89eda3c
li t1, 0x857aa3f7
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa6150b58
li t1, 0xa839096a
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x746baabd
pv.cmpeq.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0xcca3492e
li t1, 0x8a94b61
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x433d6afa
li t1, 0x747fbb32
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa52f69a
pv.cmpne.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0xc0b8f259
li t1, 0xda43c2cd
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc701df41
li t1, 0x972622ab
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xda72599a
pv.cmpne.sci.b t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xa13cd787
li t1, 0x9ba95382
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5fbe700d
li t1, 0x20763f79
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4c73c576
pv.cmpgt.sci.h t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x30800613
li t1, 0x68abf832
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8d0d6f15
li t1, 0x7d6060e6
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xed75a784
pv.cmpgt.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x6f9786d5
li t1, 0x4fec4394
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x71ec3a47
li t1, 0xcb0b5a32
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9ddb91b
pv.cmpge.sci.h t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x652931f2
li t1, 0xa52ea498
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd0804cda
li t1, 0xceecea6f
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x42235c7
pv.cmpge.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x532fa3f
li t1, 0x870831e1
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f395d87
li t1, 0x9d981f69
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x706a007c
pv.cmplt.sci.h t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x6cb2012
li t1, 0x409e7b08
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd05e2e00
li t1, 0x1255b130
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x90d5f140
pv.cmplt.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xb6074236
li t1, 0x7235dbc3
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x22491b2a
li t1, 0xb7409085
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd3ec91db
pv.cmple.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x2a6a3557
li t1, 0xb9ff7c6f
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9839eef5
li t1, 0x9cf35b26
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b5a4147
pv.cmple.sci.b t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xe9597767
li t1, 0x782ea01f
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xff0a448a
li t1, 0x93042d6b
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa4cdb715
pv.cmpgtu.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0xe0f6e681
li t1, 0xcf50cc05
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xae193425
li t1, 0x56b82216
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x66ab32e2
pv.cmpgtu.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x88773b2b
li t1, 0x64c62282
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x339b27d8
li t1, 0x87faf341
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x77887991
pv.cmpgeu.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x2a4c6001
li t1, 0xd7d39cab
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1fad299
li t1, 0xb55677f0
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8da2b6f4
pv.cmpgeu.sci.b t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x12faa988
li t1, 0xfd5150
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xde9e7217
li t1, 0xd85064f9
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8afc426b
pv.cmpltu.sci.h t2, t0, 0x13
sw t2, 4(sp)
li t0, 0xfb64c45
li t1, 0x4749d48
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x86757ad6
li t1, 0x102e32af
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe2d0424c
pv.cmpltu.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x74cc7685
li t1, 0x37c34eda
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd0eccb0a
li t1, 0xcfb8f9d7
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x81cba7a0
pv.cmpleu.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0x542bd92e
li t1, 0x432b346b
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe7ef927f
li t1, 0x55880875
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x85f14faa
pv.cmpleu.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x3ceca07e
li t1, 0x7b712131
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7d3fb5de
li t1, 0x1e9b83f4
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x69fc7969
pv.add.sci.h t2, t0, 0x13
sw t2, 4(sp)
li t0, 0xa15850be
li t1, 0x7dd7cf34
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7678027b
li t1, 0x91cc1c55
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xae62b2a3
pv.add.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x6c9fc472
li t1, 0xf701bda9
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d48bb
li t1, 0x1b2cb8eb
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d2208d8
pv.sub.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xaf2d641d
li t1, 0xbe3bd244
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf564826e
li t1, 0x523c6d09
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb631d17
pv.sub.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x124adae7
li t1, 0xd7f2d5fd
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x77f20bb
li t1, 0x7697fff3
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe57f4c56
pv.avg.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xc77689e0
li t1, 0xd52b67a7
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x65cf5e40
li t1, 0xc716e9a7
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x603c3b09
pv.avg.sci.b t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x9b3bcf4c
li t1, 0x280a5a5e
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd1794620
li t1, 0xce88691d
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x376c8866
pv.avgu.sci.h t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x280e4ee
li t1, 0xaed99f32
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xafaf220a
li t1, 0xca9b5a00
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ac73227
pv.avgu.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x2dac17ea
li t1, 0x5f7d3615
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6315797a
li t1, 0x8ed08ecb
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x18aef333
pv.min.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x2dd067ee
li t1, 0x5fba9300
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f5a63fb
li t1, 0xf3269443
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5fa08089
pv.min.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x8777975
li t1, 0x2bf7dbc8
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xad44d2c
li t1, 0x6c3d0891
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6b1c0bba
pv.minu.sci.h t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x6014d99b
li t1, 0xfe56902f
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x75fd8c1a
li t1, 0x85fdae61
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8bf6f63f
pv.minu.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x50c420c7
li t1, 0xf7c5140a
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x34a835f8
li t1, 0x962fcf51
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc042cf55
pv.max.sci.h t2, t0, 0xf
sw t2, 4(sp)
li t0, 0xa64df53d
li t1, 0xe660b510
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e60b163
li t1, 0x412f08e0
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x22e12bdc
pv.max.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xe3afb693
li t1, 0xde398f4d
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6ad3f258
li t1, 0x8a2486cb
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfaf0322d
pv.maxu.sci.h t2, t0, 0x0
sw t2, 4(sp)
li t0, 0xa17f7ebf
li t1, 0xcb73d864
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3e9d72d2
li t1, 0x325b4db8
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeedd9ade
pv.maxu.sci.b t2, t0, 0x3
sw t2, 4(sp)
li t0, 0x16bd219e
li t1, 0x6116fefa
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8e4c5167
li t1, 0x5dfeb0f7
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1efe8647
pv.srl.sci.h t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x5a0d1c06
li t1, 0x48e56c91
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x63ea694e
li t1, 0x86788eab
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8b0b7dc7
pv.srl.sci.b t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0x1bd94b56
li t1, 0x6585fbaa
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x445ae753
li t1, 0x8e044d50
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x677c9571
pv.sra.sci.h t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x2d2c4331
li t1, 0x7c20433f
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d7da04
li t1, 0x25faf105
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x247b904e
pv.sra.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x7258710d
li t1, 0x93876138
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x56513835
li t1, 0x53050ad7
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6473c6c4
pv.sll.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0xf8b86ba
li t1, 0xe425b352
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf634ac4
li t1, 0x9db58c1e
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9cb4cde2
pv.sll.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x1bb689fc
li t1, 0xa33e427c
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2516210
li t1, 0xbbd242bb
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfd7f9164
pv.or.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x692c67a
li t1, 0x2a22ae28
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa75254bf
li t1, 0x1659fd22
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xafebd300
pv.or.sci.b t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x3b8fbc5c
li t1, 0x2f7fbfd6
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x72cfa739
li t1, 0x71ffdc7c
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x77019c6a
pv.xor.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x51ac68da
li t1, 0x702cfd44
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf8208cfb
li t1, 0xb0207367
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x546a73ad
pv.xor.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x8101eac2
li t1, 0x61507af2
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdc2a8f68
li t1, 0xd47b3cdd
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x97cbb855
pv.and.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0xce45b38a
li t1, 0xccaea8eb
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7d947b3
li t1, 0x50f607dd
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x79154af3
pv.and.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x2fa24992
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0x90ce5820
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0xe3b0e20f
li t1, 0xd77e4f29
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9cb0d4b6
pv.shuffle.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x6f702d98
li t1, 0x83573472
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3f1a80cf
pv.shuffleI0.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x5106009
pv.shuffleI1.sci.b t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x9b926f60
pv.shuffleI2.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0xf080522b
pv.shuffleI3.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0xc90976c
li t1, 0x97b31234
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x15399555
li t1, 0x94c32514
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa99bcb7f
li t1, 0xc422f763
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7adda265
li t1, 0xf816fd07
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x39a396be
li t1, 0xf0ce2a9e
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb03b49
li t1, 0x9feda307
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a5ce872
li t1, 0xf1afdbe9
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d766ef6
pv.cmpeq.sci.h t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0x99c21da5
li t1, 0x22447189
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe4f2ba3e
li t1, 0xa380050f
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5dfc8104
pv.cmpeq.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0xd9bf3a9e
li t1, 0x98378b04
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x20579ed4
li t1, 0x668ba1f9
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xefa33928
pv.cmpne.sci.h t2, t0, 0x18
sw t2, 4(sp)
li t0, 0xa74cfd6e
li t1, 0xfd6b104b
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeb0a614f
li t1, 0xee46fbce
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6c1ccf3d
pv.cmpne.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x6dc162d8
li t1, 0x24dc066d
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa5125abc
li t1, 0x86206f7a
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x491cb03c
pv.cmpgt.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x29aa760d
li t1, 0x2d11dcca
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x15e67ee6
li t1, 0x8bbe4d32
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x86c4001b
pv.cmpgt.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x7ab3845b
li t1, 0x750daaa4
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1639cf13
li t1, 0x3fd84e4
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcedee397
pv.cmpge.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x4a154bca
li t1, 0x79e518d3
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c2d6f72
li t1, 0x5ea350be
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e4f61bf
pv.cmpge.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x3f720f32
li t1, 0xd7de0ad7
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c067d0c
li t1, 0x6caf6b35
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xea119c9c
pv.cmplt.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x8034a3cf
li t1, 0xc8ef95c0
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe7c09cfc
li t1, 0x3dee7ffa
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xda08a71e
pv.cmplt.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0xf9afe8bd
li t1, 0x6a246db5
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x76d4697c
li t1, 0x60a4045f
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xff9a0788
pv.cmple.sci.h t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x747d5594
li t1, 0x14576ae9
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc4e0d9b6
li t1, 0x15a97fc4
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x28a57d6c
pv.cmple.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0xa7d3ad19
li t1, 0x62eb34a2
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x742fd85
li t1, 0xee694e27
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f7f3529
pv.cmpgtu.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0xe179bac7
li t1, 0xa6f0fc01
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa3828f4e
li t1, 0x5127fd72
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdc8cd281
pv.cmpgtu.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x82cf3853
li t1, 0xe1f5270a
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x221b8333
li t1, 0x6cff85b8
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x54506d19
pv.cmpgeu.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0xa32cff7f
li t1, 0x583dc56a
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xce6f68ed
li t1, 0x76218ba
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9867fcba
pv.cmpgeu.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x9cccbc57
li t1, 0xbbaadc09
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd9f01c4c
li t1, 0x1f7c212a
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd9c5ca
pv.cmpltu.sci.h t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x4e0500f0
li t1, 0x881c25cf
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x20976e3e
li t1, 0x94627b37
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbf4be745
pv.cmpltu.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0xb7acc0f1
li t1, 0x4a43c32b
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xeaffa81b
li t1, 0xf36def25
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb26998d7
pv.cmpleu.sci.h t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x5e14c981
li t1, 0x696ddd1a
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x32538521
li t1, 0x855d44f
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x73c63bb2
pv.cmpleu.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x5e8c9deb
li t1, 0x324951b
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x716ba656
li t1, 0x6c889cf3
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4c79295e
pv.add.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x1d64fad5
li t1, 0x2ae8a107
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc9864c8
li t1, 0xf71d862c
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x61e226c8
pv.add.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x48530da0
li t1, 0xbecf252
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa23d68b6
li t1, 0x6cab88b2
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1044cc49
pv.sub.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x6ef7f3c6
li t1, 0x75368ed2
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ca5f0d0
li t1, 0x15d2453
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x20d14198
pv.sub.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x7304c11a
li t1, 0x94cb47cc
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xad8fb170
li t1, 0xe9111cff
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x862c8533
pv.avg.sci.h t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x2ac36315
li t1, 0x8dc607f9
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x17474a
li t1, 0x794b731c
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x56ebcfe3
pv.avg.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x634d1b2f
li t1, 0xbbb7a9f7
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x89ead70c
li t1, 0x1efe10d3
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd547af36
pv.avgu.sci.h t2, t0, 0x14
sw t2, 4(sp)
li t0, 0xfa23dc74
li t1, 0x5917b9b7
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x25265c89
li t1, 0x2697b807
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ed4fa3
pv.avgu.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x50411835
li t1, 0x68ff41a6
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x98a672a0
li t1, 0xcd9f37b5
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x21f936a8
pv.min.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x4217ba26
li t1, 0x8dbe98fc
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x712d2673
li t1, 0x1c68f9a7
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4b8bdab2
pv.min.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x1802d5f8
li t1, 0xc082d8ca
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x284ebc36
li t1, 0xcd2a3c47
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6778feba
pv.minu.sci.h t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0x10665d02
li t1, 0xa334653b
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8c8d54fa
li t1, 0x7f8a3dc1
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd5c8a7a4
pv.minu.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x8069111e
li t1, 0x8155ac87
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb514517e
li t1, 0xc2e87db1
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ed64979
pv.max.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x8a03598a
li t1, 0x1564edcd
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd1b2fe99
li t1, 0xa21c8758
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xba429dd1
pv.max.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0xe0145ba2
li t1, 0x340895f1
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x711ebf6a
li t1, 0xb1100f0d
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8feb0571
pv.maxu.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xc04bd1fc
li t1, 0xce4e4084
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4352c20b
li t1, 0x86931eb7
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe6e4cb9f
pv.maxu.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x7a559515
li t1, 0xa8524fe3
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd79546db
li t1, 0x5c0a7c53
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x105fe85b
pv.srl.sci.h t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x65f6c646
li t1, 0x849e33b4
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x60363939
li t1, 0x6514e33a
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5bba59d4
pv.srl.sci.b t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x2a5e9f2b
li t1, 0xba78dae7
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xaf3d0ae6
li t1, 0xc86447c0
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbcce34a5
pv.sra.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x13cf18ea
li t1, 0x65153b0b
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5b32d793
li t1, 0x4de35df4
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x827a4f6a
pv.sra.sci.b t2, t0, 0x2
sw t2, 4(sp)
li t0, 0xe78ca545
li t1, 0x8fac792f
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcab18af6
li t1, 0x651db34a
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x433ae171
pv.sll.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x8968050f
li t1, 0x2ce947fc
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8c0def83
li t1, 0x6886f21d
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x97b6bc90
pv.sll.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x3650b31d
li t1, 0x57b5019a
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdac3a62d
li t1, 0x6ff577bc
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x99e6eade
pv.or.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0xb126c2a9
li t1, 0x6009f742
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5f010483
li t1, 0xef65f668
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7341a86e
pv.or.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x40c51af0
li t1, 0xf1d1eeb6
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9f82b967
li t1, 0x15d74089
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe9af3469
pv.xor.sci.h t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x704d4b3f
li t1, 0xfa834cd0
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7169d2ce
li t1, 0xb48ba6ed
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x52982ea2
pv.xor.sci.b t2, t0, 0x11
sw t2, 4(sp)
li t0, 0xe7d23124
li t1, 0x6869bc8d
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ad1ab0
li t1, 0x948c0df4
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa0e9405e
pv.and.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0xed250621
li t1, 0xabb58edb
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1bce6ea6
li t1, 0x94eea065
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa5c9510
pv.and.sci.b t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0x304f515e
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0x3210e691
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0x35e2a5e
li t1, 0x45096ac4
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x38bb8538
pv.shuffle.sci.h t2, t0, 0x3
sw t2, 4(sp)
li t0, 0x88b856e
li t1, 0x6fc5bf3f
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x843c1fc4
pv.shuffleI0.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x68a71334
pv.shuffleI1.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x324116f0
pv.shuffleI2.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x9d62b35c
pv.shuffleI3.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0xddfc06b2
li t1, 0x4aa0cd88
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1068e544
li t1, 0xa0728d4f
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbed3b35
li t1, 0x276ca520
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb509d208
li t1, 0xc2a33ddd
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x71432329
li t1, 0x17fe8f40
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xce00bafd
li t1, 0x3d6948f9
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc768fc6b
li t1, 0x6e752556
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b463eeb
pv.cmpeq.sci.h t2, t0, 0x13
sw t2, 4(sp)
li t0, 0x9126d4c2
li t1, 0xba8542ae
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x36d51875
li t1, 0x9b6d0d35
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5b75966b
pv.cmpeq.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x1baca99
li t1, 0x8fd8340f
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1055d470
li t1, 0xbfedb938
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc1412675
pv.cmpne.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x559cfb13
li t1, 0x92ec1280
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe7873580
li t1, 0x68ec0e2
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9bb822a6
pv.cmpne.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x47ca1903
li t1, 0x2ebfe294
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ee16c8c
li t1, 0xb02a8a1d
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x73a3db79
pv.cmpgt.sci.h t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xd1f9b042
li t1, 0xd198d028
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x61237b5c
li t1, 0xb0566ebd
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x90cb570a
pv.cmpgt.sci.b t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x669a8774
li t1, 0xbb87fa64
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe4fa127f
li t1, 0x981c3a30
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x840866d8
pv.cmpge.sci.h t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x1b0511f1
li t1, 0xe7d4699c
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbd9243cc
li t1, 0xf69c10e0
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe8cceb74
pv.cmpge.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x6ee38564
li t1, 0xedb4b7a
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2e562a2e
li t1, 0x28b6e56e
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe75a166d
pv.cmplt.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x90d3aeda
li t1, 0x61299b5c
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa06af053
li t1, 0x42a5574a
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x196b10d9
pv.cmplt.sci.b t2, t0, 0x11
sw t2, 4(sp)
li t0, 0xd0d106e3
li t1, 0x88cdb54e
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f418463
li t1, 0x24335763
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8917db1a
pv.cmple.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x71a84e5e
li t1, 0x72cd31c7
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x563b7a30
li t1, 0xea097503
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa3c12114
pv.cmple.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0xf8a99a80
li t1, 0x6ecda59e
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c675a89
li t1, 0x5e56112e
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x745bf14f
pv.cmpgtu.sci.h t2, t0, 0x3
sw t2, 4(sp)
li t0, 0x95f3f521
li t1, 0xcc828ff9
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x711612c5
li t1, 0xeb9c5f1c
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d640ac9
pv.cmpgtu.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x8910ff0f
li t1, 0xda7f439
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x41b579da
li t1, 0x780f3646
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9284f358
pv.cmpgeu.sci.h t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x23c1e007
li t1, 0x745299fc
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f491a91
li t1, 0x9f2440cd
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb8c5272d
pv.cmpgeu.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xe07fe233
li t1, 0xe72f4968
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x307ae156
li t1, 0x253aae3c
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6870698
pv.cmpltu.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x4f652347
li t1, 0x1e39a58a
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x169f6798
li t1, 0xb77fcfc0
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf8d9e51
pv.cmpltu.sci.b t2, t0, 0x2
sw t2, 4(sp)
li t0, 0xe58df68
li t1, 0x62cc4178
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6851c9cb
li t1, 0xf1489daa
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1bc847e0
pv.cmpleu.sci.h t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x81efec8a
li t1, 0x142be1e5
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbd2ae686
li t1, 0x70bf8c20
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd436f5f
pv.cmpleu.sci.b t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0x49af0464
li t1, 0x73c17ea9
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe7d66286
li t1, 0x9f28c065
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x919eef94
pv.add.sci.h t2, t0, 0x3
sw t2, 4(sp)
li t0, 0x3eb0a8ed
li t1, 0x1a72f3d9
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a1a6a4b
li t1, 0x50f10c19
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d7d3f65
pv.add.sci.b t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0x1e885e34
li t1, 0xcf46cd67
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x263df77e
li t1, 0xb8fb8031
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8da30792
pv.sub.sci.h t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x1d43e160
li t1, 0xa5b02539
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xaf948e87
li t1, 0x41569456
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x662b8ce9
pv.sub.sci.b t2, t0, 0x2
sw t2, 4(sp)
li t0, 0xe10b54b2
li t1, 0x315076a5
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe7ab3dd0
li t1, 0x4e1b2bc2
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x411ca46c
pv.avg.sci.h t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xbb4a4653
li t1, 0xaff7ed5b
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe66ce971
li t1, 0x43eeefeb
pv.avg.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2292e30e
pv.avg.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x3e38ca81
li t1, 0xa2eba4fe
pv.avgu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x96341d91
li t1, 0xd840a8fe
pv.avgu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a683a85
pv.avgu.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x80fe460e
li t1, 0x9ebb76f8
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7e013d5b
li t1, 0xe745168d
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f2ac822
pv.avgu.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x734992bd
li t1, 0x26f8680e
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x18b19cf7
li t1, 0x46dca106
pv.min.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xffb092b2
pv.min.sci.h t2, t0, 0x4
sw t2, 4(sp)
li t0, 0xf1f72f16
li t1, 0x5d123a69
pv.min.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd99364f1
li t1, 0xbc432f53
pv.min.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x28aa0f03
pv.min.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x40f4381d
li t1, 0x5200a17
pv.minu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd3460131
li t1, 0x626b16b1
pv.minu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1a799b8f
pv.minu.sci.h t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0xd0a619b4
li t1, 0xbbbc03a6
pv.minu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfebcaaaa
li t1, 0xb596c86f
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x190f92fa
pv.minu.sci.b t2, t0, 0x2
sw t2, 4(sp)
li t0, 0xa57b85fc
li t1, 0x9ca43fab
pv.max.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb4909e7f
li t1, 0x3f5330c6
pv.max.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x133c553
pv.max.sci.h t2, t0, 0x0
sw t2, 4(sp)
li t0, 0xbf4d8af9
li t1, 0x8ea3502f
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xec3ec758
li t1, 0xb2ef29d9
pv.max.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa61ad3fa
pv.max.sci.b t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xf688ec3d
li t1, 0x45b28a0c
pv.maxu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7c499f85
li t1, 0x35112849
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d3fc335
pv.maxu.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x87cea23f
li t1, 0x442cc765
pv.maxu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfb679543
li t1, 0x93c4b859
pv.maxu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x57b2f26f
pv.maxu.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x7ba6b137
li t1, 0xb81ec3ea
pv.srl.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4dff72e5
li t1, 0x59936a3
pv.srl.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe1289ea2
pv.srl.sci.h t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x35724088
li t1, 0xfc53872a
pv.srl.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe7f6633
li t1, 0xb1a515f7
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xea1c51f1
pv.srl.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x8c568e2d
li t1, 0x557efccc
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x13023030
li t1, 0xaefcfc4c
pv.sra.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6b0aa274
pv.sra.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0xd49b80cf
li t1, 0x92f83085
pv.sra.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeece1b8
li t1, 0xd087d7
pv.sra.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x37c56dba
pv.sra.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0xf5ee39bf
li t1, 0xa455cca3
pv.sll.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9384f67
li t1, 0x91702af9
pv.sll.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf482fb85
pv.sll.sci.h t2, t0, 0x13
sw t2, 4(sp)
li t0, 0xd2b1ee5f
li t1, 0x4e11aa7a
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d7e3259
li t1, 0x52a4a516
pv.sll.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x958ca6d0
pv.sll.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x41f3208d
li t1, 0xc072708b
pv.or.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfb9fb79f
li t1, 0x6abcf42
pv.or.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xed5b096a
pv.or.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x7c2170ac
li t1, 0x936de8e5
pv.or.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x18ed4637
li t1, 0x377766db
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x52e60934
pv.or.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x4ddb0ecd
li t1, 0x2b337e76
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9cd80ff4
li t1, 0xb054fd2
pv.xor.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4fe3f05e
pv.xor.sci.h t2, t0, 0xb
sw t2, 4(sp)
li t0, 0xd21c0d02
li t1, 0x649ec5ec
pv.xor.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x14c24f6b
li t1, 0x27f1f24c
pv.xor.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b5cc8b3
pv.xor.sci.b t2, t0, 0x3
sw t2, 4(sp)
li t0, 0x9a96406f
li t1, 0xb67a26d5
pv.and.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x94d7feb9
li t1, 0x9cb71e5b
pv.and.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5694573
pv.and.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x7aa927fb
li t1, 0xa2b1b5a
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe00076dc
li t1, 0x4cbe6493
pv.and.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb88d8ee2
pv.and.sci.b t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0xa022802
pv.abs.h t2, t0
sw t2, 4(sp)
li t0, 0xd2c547b3
pv.abs.b t2, t0
sw t2, 4(sp)
li t0, 0x88d87bc4
li t1, 0xffd77b81
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc815ece8
pv.shuffle.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0xe1e05876
li t1, 0x66e0cb3e
pv.shuffle.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc4390e66
pv.shuffleI0.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0xc313a272
pv.shuffleI1.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x1a6a004e
pv.shuffleI2.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x90827d82
pv.shuffleI3.sci.b t2, t0, 0xa
sw t2, 4(sp)
li t0, 0xcc0061af
li t1, 0x367473c3
pv.shuffle2.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x58f04b61
li t1, 0x8a8d68d5
pv.shuffle2.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x164fdfd4
li t1, 0xa2c6cf75
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xed81091e
li t1, 0x573065b4
pv.packhi.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1edfe7e
li t1, 0xe7f8879f
pv.packlo.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1394f919
li t1, 0x8c8716e0
pv.cmpeq.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa39e103d
li t1, 0xf0263c71
pv.cmpeq.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8eb45fba
pv.cmpeq.sci.h t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0xe7dbe75b
li t1, 0x3877871a
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a578e32
li t1, 0x24231b69
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcef3470a
pv.cmpeq.sci.b t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x6cbf20fe
li t1, 0xbc627c0e
pv.cmpne.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d902616
li t1, 0xbb7f919d
pv.cmpne.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc2991bd
pv.cmpne.sci.h t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x59d805d2
li t1, 0xb1a2549d
pv.cmpne.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x235f08af
li t1, 0xe45eb289
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb1c22d58
pv.cmpne.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x462c426c
li t1, 0x8a991b6d
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xba74ce32
li t1, 0xa054d881
pv.cmpgt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f02a0fc
pv.cmpgt.sci.h t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x7a59b801
li t1, 0x99d3be2f
pv.cmpgt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x92f9e952
li t1, 0x8a703860
pv.cmpgt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeb243569
pv.cmpgt.sci.b t2, t0, 0x11
sw t2, 4(sp)
li t0, 0xedc23dae
li t1, 0x8798abd6
pv.cmpge.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x15c9f080
li t1, 0x55700b83
pv.cmpge.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x245ae187
pv.cmpge.sci.h t2, t0, 0xa
sw t2, 4(sp)
li t0, 0x3d006a10
li t1, 0x5fe2dbc9
pv.cmpge.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfef5f5d
li t1, 0x293d5e48
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x68d4cb04
pv.cmpge.sci.b t2, t0, 0xf
sw t2, 4(sp)
li t0, 0xeb2ba1ce
li t1, 0x42fd5a3c
pv.cmplt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa50bd10
li t1, 0xc5b8a69e
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd3916cd7
pv.cmplt.sci.h t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x8ed2e1de
li t1, 0x55a90298
pv.cmplt.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f3a17fc
li t1, 0x56fc6a8d
pv.cmplt.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb301f9e7
pv.cmplt.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x391d6206
li t1, 0xc6c8b02d
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdc0ea60b
li t1, 0xfd7d400e
pv.cmple.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x75ef4697
pv.cmple.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x4c3382d1
li t1, 0x3cb8267b
pv.cmple.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf7b97c91
li t1, 0x2d2c1111
pv.cmple.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x71271b73
pv.cmple.sci.b t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xa639a837
li t1, 0xbf430fd
pv.cmpgtu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf07594a3
li t1, 0x5b258f66
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9baba8ff
pv.cmpgtu.sci.h t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x209d5440
li t1, 0xbcab85cb
pv.cmpgtu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb04b386d
li t1, 0xfc9d2b75
pv.cmpgtu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x46cd3621
pv.cmpgtu.sci.b t2, t0, 0x3
sw t2, 4(sp)
li t0, 0xc06306b9
li t1, 0x4c544b96
pv.cmpgeu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8db1733f
li t1, 0x23d7093
pv.cmpgeu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6ecf12b0
pv.cmpgeu.sci.h t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x4f3ac003
li t1, 0x4239d871
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd1f09c33
li t1, 0xf710e3f6
pv.cmpgeu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6686a32d
pv.cmpgeu.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x3d1537a7
li t1, 0xd396c7ae
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x201c022c
li t1, 0xfd295408
pv.cmpltu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd43cbf2f
pv.cmpltu.sci.h t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x734277d8
li t1, 0x8aecc0db
pv.cmpltu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x30a5a02f
li t1, 0x7ca893f5
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x53ddc713
pv.cmpltu.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0xd1247bbe
li t1, 0xc18fe048
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xebbe92d5
li t1, 0x75fb6bda
pv.cmpleu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd0422888
pv.cmpleu.sci.h t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x8852c6a3
li t1, 0x60e7e547
pv.cmpleu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x59339e14
li t1, 0xc84cff64
pv.cmpleu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x18483c6a
pv.cmpleu.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x5aa4581f
li t1, 0xf5a60175
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x2d3d7024
li t1, 0xc0371c88
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8bcf98a9
li t1, 0xa5e3dbd4
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xc70ca840
li t1, 0x12827ba5
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x267fd06c
li t1, 0x995ebb54
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x1b6b6782
li t1, 0xde10c493
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd7c170bb
li t1, 0x2339cc11
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x7b334438
li t1, 0x2096011f
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xe8a68420
li t1, 0x9a60b6c1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xda087e29
li t1, 0xd2798303
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xdfb7ecdf
li t1, 0x6a339d8d
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xa30f16d9
li t1, 0x1498b12a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8f24524e
li t1, 0xce4f8696
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xe22e287f
li t1, 0x99a7e382
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd7ca374
li t1, 0x3e01fc41
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xba011e21
li t1, 0x65334604
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xecd3599a
li t1, 0x747674f7
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xce26ed5f
li t1, 0xd1892838
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x803e1072
li t1, 0x4c4bf1a9
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ac80376
li t1, 0xca0c0f3a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xe1102576
li t1, 0x758bf1f0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb5bf4a3c
li t1, 0xddcfc89a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xc28c32de
li t1, 0x408ab878
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8b190c33
li t1, 0xa3735f7f
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xbdfcf4c3
li t1, 0xb921bbcb
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xbc6ea17a
li t1, 0x33eed3cd
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x968a353c
li t1, 0xc78b6f80
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xcbf959b5
li t1, 0xf63c66e8
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xff269a44
li t1, 0xe415594d
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x953606bc
li t1, 0x5c564a81
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd80dd627
li t1, 0xde12aa68
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x760613d9
li t1, 0xceeb9d96
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xabc77af5
li t1, 0x4c51272f
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d792678
li t1, 0xf0936009
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x50867422
li t1, 0xb8f80291
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd8122ac5
li t1, 0x8fd34b12
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x9787f4f6
li t1, 0x664ea5d6
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5f3b520c
li t1, 0x7c1cc1d9
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x76adb502
li t1, 0x6db604eb
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb38ddc0a
li t1, 0xf4046c1a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xfc9f785
li t1, 0xa133292e
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb2dc6158
li t1, 0xb9fb5d2a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x59cee9b0
li t1, 0x9242acfc
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x2dad5e25
li t1, 0xffe3eb1c
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x80db1b1a
li t1, 0x8b055ab0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x2190c71c
li t1, 0x1e8b2739
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c207d60
li t1, 0x685784e1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x76957840
li t1, 0x9684500b
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xeb26ba32
li t1, 0xd6563aca
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa3b8da6
li t1, 0x375a0c30
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x43e25333
li t1, 0x1a89e971
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xffa04580
li t1, 0xc16a2517
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xed4048dc
li t1, 0x8c6e1cae
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x694446f9
li t1, 0x48e690e6
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x711720fe
li t1, 0x5a81189b
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x78afd937
li t1, 0xe62aeb4
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x96177b51
li t1, 0xecdbad18
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5b9e4805
li t1, 0xa81653f0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa3ae520
li t1, 0xbe530b1d
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9a7bdfb
li t1, 0xa8d6bc78
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xc32fe05e
li t1, 0x7a50d146
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x25bfeea0
li t1, 0x27fd4438
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5b5a1efb
li t1, 0xc07be7e0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x31f7f67c
li t1, 0x22e5bf14
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb31e47db
li t1, 0x21c51b8e
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x24d488c2
li t1, 0x5b7c0b42
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe56d2c9
li t1, 0xbae7e105
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b5dabaa
li t1, 0x854901d1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8ae39643
li t1, 0xcf2524fd
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a03a750
li t1, 0xc317c139
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xde8f43bf
li t1, 0x9dcd3840
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x10d8991c
li t1, 0x7c5676d1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x257f1336
li t1, 0x716365b6
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3c2c406
li t1, 0x7e4062e5
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd03d5c1e
li t1, 0x267e00a1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5aa4581f
li t1, 0xf5a60175
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x2d3d7024
li t1, 0xc0371c88
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8bcf98a9
li t1, 0xa5e3dbd4
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xc70ca840
li t1, 0x12827ba5
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x267fd06c
li t1, 0x995ebb54
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x1b6b6782
li t1, 0xde10c493
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd7c170bb
li t1, 0x2339cc11
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x7b334438
li t1, 0x2096011f
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xe8a68420
li t1, 0x9a60b6c1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xda087e29
li t1, 0xd2798303
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xdfb7ecdf
li t1, 0x6a339d8d
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xa30f16d9
li t1, 0x1498b12a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8f24524e
li t1, 0xce4f8696
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xe22e287f
li t1, 0x99a7e382
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd7ca374
li t1, 0x3e01fc41
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xba011e21
li t1, 0x65334604
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xecd3599a
li t1, 0x747674f7
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xce26ed5f
li t1, 0xd1892838
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x803e1072
li t1, 0x4c4bf1a9
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ac80376
li t1, 0xca0c0f3a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xe1102576
li t1, 0x758bf1f0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb5bf4a3c
li t1, 0xddcfc89a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xc28c32de
li t1, 0x408ab878
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8b190c33
li t1, 0xa3735f7f
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xbdfcf4c3
li t1, 0xb921bbcb
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xbc6ea17a
li t1, 0x33eed3cd
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x968a353c
li t1, 0xc78b6f80
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xcbf959b5
li t1, 0xf63c66e8
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xff269a44
li t1, 0xe415594d
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x953606bc
li t1, 0x5c564a81
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd80dd627
li t1, 0xde12aa68
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x760613d9
li t1, 0xceeb9d96
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xabc77af5
li t1, 0x4c51272f
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d792678
li t1, 0xf0936009
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x50867422
li t1, 0xb8f80291
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd8122ac5
li t1, 0x8fd34b12
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x9787f4f6
li t1, 0x664ea5d6
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5f3b520c
li t1, 0x7c1cc1d9
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x76adb502
li t1, 0x6db604eb
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb38ddc0a
li t1, 0xf4046c1a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xfc9f785
li t1, 0xa133292e
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb2dc6158
li t1, 0xb9fb5d2a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x59cee9b0
li t1, 0x9242acfc
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x2dad5e25
li t1, 0xffe3eb1c
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x80db1b1a
li t1, 0x8b055ab0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x2190c71c
li t1, 0x1e8b2739
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c207d60
li t1, 0x685784e1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x76957840
li t1, 0x9684500b
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xeb26ba32
li t1, 0xd6563aca
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa3b8da6
li t1, 0x375a0c30
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x43e25333
li t1, 0x1a89e971
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xffa04580
li t1, 0xc16a2517
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xed4048dc
li t1, 0x8c6e1cae
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x694446f9
li t1, 0x48e690e6
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x711720fe
li t1, 0x5a81189b
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x78afd937
li t1, 0xe62aeb4
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x96177b51
li t1, 0xecdbad18
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5b9e4805
li t1, 0xa81653f0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa3ae520
li t1, 0xbe530b1d
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9a7bdfb
li t1, 0xa8d6bc78
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xc32fe05e
li t1, 0x7a50d146
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x25bfeea0
li t1, 0x27fd4438
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5b5a1efb
li t1, 0xc07be7e0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x31f7f67c
li t1, 0x22e5bf14
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb31e47db
li t1, 0x21c51b8e
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x24d488c2
li t1, 0x5b7c0b42
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe56d2c9
li t1, 0xbae7e105
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b5dabaa
li t1, 0x854901d1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8ae39643
li t1, 0xcf2524fd
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a03a750
li t1, 0xc317c139
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xde8f43bf
li t1, 0x9dcd3840
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x10d8991c
li t1, 0x7c5676d1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x257f1336
li t1, 0x716365b6
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3c2c406
li t1, 0x7e4062e5
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd03d5c1e
li t1, 0x267e00a1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5aa4581f
li t1, 0xf5a60175
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x2d3d7024
li t1, 0xc0371c88
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8bcf98a9
li t1, 0xa5e3dbd4
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xc70ca840
li t1, 0x12827ba5
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x267fd06c
li t1, 0x995ebb54
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x1b6b6782
li t1, 0xde10c493
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd7c170bb
li t1, 0x2339cc11
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x7b334438
li t1, 0x2096011f
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xe8a68420
li t1, 0x9a60b6c1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xda087e29
li t1, 0xd2798303
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xdfb7ecdf
li t1, 0x6a339d8d
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xa30f16d9
li t1, 0x1498b12a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8f24524e
li t1, 0xce4f8696
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xe22e287f
li t1, 0x99a7e382
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd7ca374
li t1, 0x3e01fc41
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xba011e21
li t1, 0x65334604
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xecd3599a
li t1, 0x747674f7
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xce26ed5f
li t1, 0xd1892838
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x803e1072
li t1, 0x4c4bf1a9
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ac80376
li t1, 0xca0c0f3a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xe1102576
li t1, 0x758bf1f0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb5bf4a3c
li t1, 0xddcfc89a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xc28c32de
li t1, 0x408ab878
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8b190c33
li t1, 0xa3735f7f
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xbdfcf4c3
li t1, 0xb921bbcb
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xbc6ea17a
li t1, 0x33eed3cd
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x968a353c
li t1, 0xc78b6f80
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xcbf959b5
li t1, 0xf63c66e8
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xff269a44
li t1, 0xe415594d
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x953606bc
li t1, 0x5c564a81
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd80dd627
li t1, 0xde12aa68
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x760613d9
li t1, 0xceeb9d96
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xabc77af5
li t1, 0x4c51272f
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d792678
li t1, 0xf0936009
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x50867422
li t1, 0xb8f80291
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd8122ac5
li t1, 0x8fd34b12
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x9787f4f6
li t1, 0x664ea5d6
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5f3b520c
li t1, 0x7c1cc1d9
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x76adb502
li t1, 0x6db604eb
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb38ddc0a
li t1, 0xf4046c1a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xfc9f785
li t1, 0xa133292e
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb2dc6158
li t1, 0xb9fb5d2a
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x59cee9b0
li t1, 0x9242acfc
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x2dad5e25
li t1, 0xffe3eb1c
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x80db1b1a
li t1, 0x8b055ab0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x2190c71c
li t1, 0x1e8b2739
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c207d60
li t1, 0x685784e1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x76957840
li t1, 0x9684500b
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xeb26ba32
li t1, 0xd6563aca
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa3b8da6
li t1, 0x375a0c30
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x43e25333
li t1, 0x1a89e971
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xffa04580
li t1, 0xc16a2517
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xed4048dc
li t1, 0x8c6e1cae
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x694446f9
li t1, 0x48e690e6
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x711720fe
li t1, 0x5a81189b
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x78afd937
li t1, 0xe62aeb4
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x96177b51
li t1, 0xecdbad18
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5b9e4805
li t1, 0xa81653f0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa3ae520
li t1, 0xbe530b1d
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9a7bdfb
li t1, 0xa8d6bc78
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xc32fe05e
li t1, 0x7a50d146
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x25bfeea0
li t1, 0x27fd4438
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5b5a1efb
li t1, 0xc07be7e0
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x31f7f67c
li t1, 0x22e5bf14
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb31e47db
li t1, 0x21c51b8e
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x24d488c2
li t1, 0x5b7c0b42
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe56d2c9
li t1, 0xbae7e105
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b5dabaa
li t1, 0x854901d1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x8ae39643
li t1, 0xcf2524fd
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a03a750
li t1, 0xc317c139
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xde8f43bf
li t1, 0x9dcd3840
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x10d8991c
li t1, 0x7c5676d1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x257f1336
li t1, 0x716365b6
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3c2c406
li t1, 0x7e4062e5
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd03d5c1e
li t1, 0x267e00a1
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x9302240d
li t1, 0x1064833b
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x502519c6
li t1, 0xec14f08a
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x49358917
li t1, 0x16089ec5
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x8ea55d5f
li t1, 0xbd0c5f20
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x124109fb
li t1, 0xa88b9e0f
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x65aed2ca
li t1, 0xd75a6de
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x76a44ca6
li t1, 0x49787ed1
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xc8e6c911
li t1, 0x2cdd2369
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x288101a1
li t1, 0xf4b5827d
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xe1255bfa
li t1, 0x3019c2e7
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xd51e7b4c
li t1, 0x7b81a55b
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x5bddd6f7
li t1, 0x3b642e1a
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xdcf74c2a
li t1, 0xc27695fe
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xbe06869d
li t1, 0x46d28192
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xecce6949
li t1, 0xf7c8ce93
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x520d495a
li t1, 0xc8223fa3
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x1bb894b6
li t1, 0x42826e34
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x65168705
li t1, 0x702d96bf
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x352b5b91
li t1, 0x552d4be
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x37a98bdc
li t1, 0x978bf446
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d12a7f2
li t1, 0xa6131759
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x659e9869
li t1, 0xe5f0fb06
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x69856ea9
li t1, 0x899c403f
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x3a044c46
li t1, 0xf43cb2b
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c93fdef
li t1, 0x3241278a
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x89efafed
li t1, 0x53c78b4d
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xc2436fa3
li t1, 0xee3c1329
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x2197ced5
li t1, 0x443c317c
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x10ac9fc6
li t1, 0x760b492c
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xc033582
li t1, 0x3385cd6c
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xccf62bf6
li t1, 0xd7bcd7fa
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x1f426571
li t1, 0xbb28de38
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x66f96227
li t1, 0xa9696a04
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x4b9405e5
li t1, 0xa4f5cfe3
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x92e7722b
li t1, 0x5e315a80
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x603a3754
li t1, 0x1eb5e910
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xd8e68212
li t1, 0x31a37ba5
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x9e497d34
li t1, 0x1eca2a35
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x12a67578
li t1, 0x7a631a33
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6290574
li t1, 0xc065c7c0
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x44f60d34
li t1, 0xf8ca4050
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xc52f136
li t1, 0x319b07c7
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x3498c3dc
li t1, 0xac4f66e0
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xc0ced0cb
li t1, 0xfb10fb24
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xc813fc98
li t1, 0x9555ce42
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xf3595e11
li t1, 0xaccd9f78
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xe76ff9d2
li t1, 0xadc1520
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x239642d1
li t1, 0x45b66777
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd13ab43
li t1, 0xbc3a017a
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x7348716b
li t1, 0xbbb00b32
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x74e3e6ab
li t1, 0x604004c2
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xa745e259
li t1, 0xa9142a38
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x7cfe2272
li t1, 0xb741d193
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xf8465227
li t1, 0x6900d8f8
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x86cdc758
li t1, 0x85455786
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x4289f7c0
li t1, 0x5713a77c
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x963e8158
li t1, 0x7a64c155
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x40bcba71
li t1, 0x87fb3fc0
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xf93a57f5
li t1, 0x805ae5ec
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x73b5e01
li t1, 0xb3ebd2a0
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xa66d54ce
li t1, 0x9b9b1812
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xfcca9af6
li t1, 0x47be33a
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x95d153f4
li t1, 0x158b3052
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xbf318c84
li t1, 0x1b63972c
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x15ddc89c
li t1, 0x3584b066
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x6bc49b0d
li t1, 0xe5e1a390
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xa5487687
li t1, 0xd3803384
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x32e6acf8
li t1, 0xdb2d8572
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xefbab2ed
li t1, 0x691c8f8d
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e951bcd
li t1, 0x76541089
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x3054acc5
li t1, 0x80e448fc
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xa7658ecf
li t1, 0x1a793cbd
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x6e1c2f15
li t1, 0x816e300
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d56a23e
li t1, 0x8f951154
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x2700a63c
li t1, 0xe2b25f90
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xb4e35789
li t1, 0x30c152a9
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x41d4ac57
li t1, 0x90bc650
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd5b90f1
li t1, 0xad731aef
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x9f61ddcc
li t1, 0xf2241105
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x40540ac4
li t1, 0x489cfcfa
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xe68c003
li t1, 0x3143a49e
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x273a2d78
li t1, 0xd193a1b6
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ddcfdd
li t1, 0xf7608b46
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d93a00
li t1, 0xabaa784a
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd7f2f8b
li t1, 0x7557c4ff
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xebdedaf8
li t1, 0x9c0d72f7
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc57e4ea
li t1, 0xdeb114ca
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x1888638e
li t1, 0x9ce22ec4
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xc9e14dc0
li t1, 0x6b312455
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xee13a06
li t1, 0x735daec0
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x84ad69ce
li t1, 0x87569a47
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xe6f19a2c
li t1, 0x3a7e3300
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xebb75c7e
li t1, 0x3a44c6ca
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xe071312b
li t1, 0x76602cb1
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x1b015937
li t1, 0xc6ef5e95
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x20e24b10
li t1, 0x420c838c
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xd80d261d
li t1, 0x7a79f6ca
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x6346fab8
li t1, 0xbfe5f3cc
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xf64b8b91
li t1, 0xb02a5268
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xcd755dbc
li t1, 0x5479a3fe
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x31240db2
li t1, 0xbccd4196
p.mulsN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x401cb6e2
li t1, 0xad666128
p.mulsN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0xac5695df
li t1, 0x295585cd
p.mulsN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x86c45996
li t1, 0xe2fcd25f
p.mulsN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x6c5cf0a8
li t1, 0x83403869
p.mulsN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x42929b7d
li t1, 0x3e46bee2
p.mulsN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0xbe08b620
li t1, 0x7655fa09
p.mulsN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xbdc89142
li t1, 0x7131bb9a
p.mulsN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xc21cca2
li t1, 0xc8e597b6
p.mulsN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xeb2224fc
li t1, 0x414512b
p.mulsN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x55aef86d
li t1, 0x72896f81
p.mulsN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x9efce9af
li t1, 0xb465c68e
p.mulsN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0xcb69ac7c
li t1, 0x2358fdc
p.mulsN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xbf52bb49
li t1, 0x924aee37
p.mulsN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x83d12b15
li t1, 0x1903747f
p.mulsN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0xbdfd43c1
li t1, 0x318354b
p.mulsN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x1e789de3
li t1, 0x13b37a5
p.mulsN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x61c31891
li t1, 0xf309c9f3
p.mulsN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x74a9fde5
li t1, 0xe918abe
p.mulsN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x88a091c
li t1, 0x1fe86a7c
p.mulsN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x32b8b1d2
li t1, 0xc3f3e7a0
p.mulsN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xd8d22da
li t1, 0x461d65bf
p.mulsN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x1233ad11
li t1, 0xc9a33e28
p.mulsN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0xdd60dc49
li t1, 0x9dcec399
p.mulsN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xddbe8358
li t1, 0xe717be6b
p.mulsN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x3b21c9b7
li t1, 0xd0b8c9e7
p.mulsN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x41c6738e
li t1, 0xb856404f
p.mulsN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x99f0b81b
li t1, 0x6c204737
p.mulsN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x4865dbb4
li t1, 0x6607ec77
p.mulsN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x36303966
li t1, 0x3120f1a8
p.mulsN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x5a08513c
li t1, 0x6e25427a
p.mulsN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x829a0698
li t1, 0x3c2ba08d
p.mulsN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x556405c7
li t1, 0xfc137037
p.mulsN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0xc4792ba1
li t1, 0x386de85c
p.mulsN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x7a82a49c
li t1, 0xea2b19c0
p.mulsN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x7dd5576c
li t1, 0x804c0396
p.mulsN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x337a6fa8
li t1, 0x10f0cdcb
p.mulsN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x7d01afc0
li t1, 0x34601525
p.mulsN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x31cf8d26
li t1, 0xc376d7e3
p.mulsN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0xc451ef56
li t1, 0xec3ff7c6
p.mulsN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x597b4e15
li t1, 0x9a55ad56
p.mulsN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x6dfddbf2
li t1, 0x80e1565
p.mulsN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x24a8d682
li t1, 0x9bfd810d
p.mulsN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xf7b43319
li t1, 0x33610c7b
p.mulsN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x34898ee1
li t1, 0xd98e971e
p.mulsN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x408e1bb1
li t1, 0x7ee9dcc2
p.mulsN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0xaa8c3031
li t1, 0x582e805d
p.mulsN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xc9448e08
li t1, 0xa627e590
p.mulsN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xff9f6cb6
li t1, 0x1fdce6a5
p.mulsN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xe18af1d9
li t1, 0x7237105f
p.mulsN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x4045d1a3
li t1, 0x39f51131
p.mulsN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0xc6d86f47
li t1, 0xa20596b
p.mulsN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x957d7f77
li t1, 0xc84c1f50
p.mulsN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0xe124d19e
li t1, 0x1ff35cf3
p.mulsN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x1bebb47c
li t1, 0xda83dc5d
p.mulsN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x6b1dd554
li t1, 0x9aaae4c7
p.mulsN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0xf4992d17
li t1, 0x25a9df7f
p.mulsN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xa8130c98
li t1, 0xd2afef9c
p.mulsN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0xf0360365
li t1, 0xc3c6cc6e
p.mulsN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0xadf3885c
li t1, 0x358d628b
p.mulsN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x84088ded
li t1, 0xf5078929
p.mulsN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xbd733c29
li t1, 0x14b2d188
p.mulsN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x8d640cab
li t1, 0x619806ee
p.mulsN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0x18335530
li t1, 0xaf115fba
p.mulsN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0xba2bbb6c
li t1, 0x4c571b8e
p.mulsN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x51f01933
li t1, 0x37080a20
p.mulsN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xb170e618
li t1, 0xb9e59f67
p.mulsN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0xf56a074e
li t1, 0x63f10e85
p.mulsN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xf07d6c82
li t1, 0xc9ae67d0
p.mulsN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xe6e1d9f4
li t1, 0x927f61c1
p.mulsN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x93105bd4
li t1, 0x9288768
p.mulsN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xedf5f642
li t1, 0x91b1b8df
p.mulsN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x274d9e70
li t1, 0xd3a164cd
p.mulsN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x9a351fad
li t1, 0xe2093d91
p.mulsN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0xb44e7160
li t1, 0xec710e3f
p.mulsN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x73d260e0
li t1, 0x3b10b941
p.mulsRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x33372729
li t1, 0xea5f872b
p.mulsRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xd97577e4
li t1, 0xd0a3fc61
p.mulsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xe95811b7
li t1, 0x71c655aa
p.mulsRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x2a239a53
li t1, 0xbd0aed48
p.mulsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xe7acb0d4
li t1, 0x666a682f
p.mulsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xcf0c47a6
li t1, 0x88c484d3
p.mulsRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x79c716b6
li t1, 0x15d39cab
p.mulsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x717bf8fa
li t1, 0x14dff2b1
p.mulsRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x52d41cd8
li t1, 0x9d09259b
p.mulsRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0xc6463f1
li t1, 0x621d7d9c
p.mulsRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x7d75afdc
li t1, 0x50981ae6
p.mulsRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x170e4e63
li t1, 0x53597d48
p.mulsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x2079a88d
li t1, 0xa9018cff
p.mulsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x57dfbc66
li t1, 0xdb7b9cd0
p.mulsRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xa9bb6000
li t1, 0xe3f84f15
p.mulsRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x2e93cf2b
li t1, 0xf592e082
p.mulsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xb66b1e6b
li t1, 0xf2956b35
p.mulsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xc983b23c
li t1, 0xf0eecb79
p.mulsRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xf66cb408
li t1, 0x4732be08
p.mulsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xf18ed017
li t1, 0x672608d1
p.mulsRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xa6c2b040
li t1, 0x5a392952
p.mulsRN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0x4f7ad7c9
li t1, 0x839bdd47
p.mulsRN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x4ab88b79
li t1, 0x1f9ec3e9
p.mulsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x3499caea
li t1, 0x4c5c6878
p.mulsRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xccbaf414
li t1, 0x5c96a8a1
p.mulsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x8f1bc514
li t1, 0x2f4b10bb
p.mulsRN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0xffb17642
li t1, 0x42eb721
p.mulsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0xf6d8beaa
li t1, 0x5c8bf946
p.mulsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x602597ca
li t1, 0xfe0d293c
p.mulsRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xa0c66189
li t1, 0xb2cd9f0c
p.mulsRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x4ae0e80c
li t1, 0x29d025cb
p.mulsRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x18a20cea
li t1, 0x136d952d
p.mulsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xc165775
li t1, 0x12d9eebb
p.mulsRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x3e1b8388
li t1, 0x1bc882e0
p.mulsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x3fb12da4
li t1, 0x415ded34
p.mulsRN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x97bbc732
li t1, 0xf4eed2ad
p.mulsRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x92ea74d
li t1, 0x55d62ac9
p.mulsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x15225687
li t1, 0x5a9845c8
p.mulsRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x460ac36c
li t1, 0x8cdd83ee
p.mulsRN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0xb3fd649a
li t1, 0x74ea0051
p.mulsRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x4e22ca97
li t1, 0xbaa6531a
p.mulsRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xce9980bb
li t1, 0x72eec53a
p.mulsRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x4facda70
li t1, 0xd0d05f9a
p.mulsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x2f041e9f
li t1, 0xe790ffa8
p.mulsRN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0xf11177f1
li t1, 0xcdced133
p.mulsRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x7a9d9d82
li t1, 0x4df2734a
p.mulsRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xec279122
li t1, 0x99d850ec
p.mulsRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xf06bc907
li t1, 0x5e42eb0a
p.mulsRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0xddec738b
li t1, 0xdcae6857
p.mulsRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xd6821d83
li t1, 0x24af0ea5
p.mulsRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x5496e2df
li t1, 0x5933c7b6
p.mulsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x47569220
li t1, 0xeae278c4
p.mulsRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xf3031000
li t1, 0x5d9675c7
p.mulsRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x3248bad0
li t1, 0x61bd3667
p.mulsRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x244e9153
li t1, 0xaec3d2fc
p.mulsRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xc0ea6bdc
li t1, 0xfb3a9ba0
p.mulsRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xda08a2d4
li t1, 0xa87da6aa
p.mulsRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x79082e43
li t1, 0xc7fbad
p.mulsRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x2836801a
li t1, 0x14a0537e
p.mulsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x8aebf695
li t1, 0xb0a72ddc
p.mulsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x6d05b99
li t1, 0xbad1c1e3
p.mulsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x5923734a
li t1, 0x1e331918
p.mulsRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x41056bcb
li t1, 0x546d9c27
p.mulsRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xd202cb34
li t1, 0xd98d9f02
p.mulsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xaecce393
li t1, 0x9e913e22
p.mulsRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x858290d3
li t1, 0x128eddd1
p.mulsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x8df3b02f
li t1, 0x83ff7eb0
p.mulsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xd4a589d3
li t1, 0x7e46f93c
p.mulsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x1a6498c9
li t1, 0x3b9bfa24
p.mulsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x107dd6eb
li t1, 0x1a858643
p.mulsRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xa7b86c46
li t1, 0x9c121e6e
p.mulsRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0xdd3b944f
li t1, 0x7ecd8439
p.mulsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xf49ac6dd
li t1, 0x2076acbb
p.mulsRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0xff6528c1
li t1, 0xe9d882af
p.mulsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0xaadc6ec8
li t1, 0x9947097d
p.mulhhsRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x97da58d3
li t1, 0x9f6f1315
p.mulhhsRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x382a13db
li t1, 0x46812da7
p.mulhhsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xc903dfbc
li t1, 0xbbbd29fd
p.mulhhsRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x549dfd4b
li t1, 0x58eaaf27
p.mulhhsRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x16ac99f9
li t1, 0xffaf23ec
p.mulhhsRN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0xc5fc5f1
li t1, 0x71d4e862
p.mulhhsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0xb191a0bd
li t1, 0x83133efb
p.mulhhsRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xa6532a18
li t1, 0x5f87b7da
p.mulhhsRN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x6f17ac2a
li t1, 0xbde16c81
p.mulhhsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x9573ba47
li t1, 0xf5b1800f
p.mulhhsRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0xcf6533a5
li t1, 0x9c572bdf
p.mulhhsRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x2aabfb4d
li t1, 0x189cd92f
p.mulhhsRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0xd107f9f8
li t1, 0xc55927f
p.mulhhsRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x705f56a
li t1, 0x8558d140
p.mulhhsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x1c6b87b1
li t1, 0x14e84d34
p.mulhhsRN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0x8debfd38
li t1, 0x2aba3589
p.mulhhsRN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0xce45f5bb
li t1, 0x43e1d287
p.mulhhsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0xb3b6e6a9
li t1, 0x6a410a12
p.mulhhsRN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x7917fc20
li t1, 0xd1905be6
p.mulhhsRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xa002aa8e
li t1, 0x5dd51f2c
p.mulhhsRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0xc743cec0
li t1, 0xb97685a6
p.mulhhsRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xd1b06e6e
li t1, 0x1f3f3d3a
p.mulhhsRN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0xb2d95d35
li t1, 0x6d826f13
p.mulhhsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x33112268
li t1, 0xd22cb23d
p.mulhhsRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x49b63147
li t1, 0x56d87d8a
p.mulhhsRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x3514b66a
li t1, 0x9af28d00
p.mulhhsRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0xb9adbf7d
li t1, 0xd61e6a55
p.mulhhsRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x2d1a0de4
li t1, 0xaf13cdca
p.mulhhsRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0xe1376430
li t1, 0x8461b75a
p.mulhhsRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xe1cc0d8c
li t1, 0x4756fae0
p.mulhhsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xe51b4d55
li t1, 0xfe1ea8e9
p.mulhhsRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xce3f0dc5
li t1, 0x53d3536b
p.mulhhsRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xa3751ce0
li t1, 0xa011d054
p.mulhhsRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xa6638585
li t1, 0xc398605f
p.mulhhsRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x7a6b48d
li t1, 0xb24af7c
p.mulhhsRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x2cb5a036
li t1, 0x34e3cc77
p.mulhhsRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xddd110d5
li t1, 0xd74a304c
p.mulhhsRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x2c35bf34
li t1, 0x1d12da27
p.mulhhsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0xa7b1b314
li t1, 0xaf790d8
p.mulhhsRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x83184657
li t1, 0x8c51ef77
p.mulhhsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xd5419d3a
li t1, 0x5898d4e8
p.mulhhsRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x3a849017
li t1, 0x64571db5
p.mulhhsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x320d389c
li t1, 0x5f44cb7d
p.mulhhsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xdf84b9da
li t1, 0x97d6f066
p.mulhhsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xe3dab171
li t1, 0xe275044d
p.mulhhsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0xdf306212
li t1, 0xb926e75d
p.mulhhsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xab89eb02
li t1, 0x6a741362
p.mulhhsRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x4f247a4c
li t1, 0xdedd7a1e
p.mulhhsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xaa71c870
li t1, 0x6aab94f8
p.mulhhsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x41d21edf
li t1, 0x6ee30ed4
p.mulhhsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x2df9c257
li t1, 0xd60a5d9c
p.mulhhsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x31e2f6e6
li t1, 0xd1e51ec5
p.mulhhsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xc079ff3b
li t1, 0x84f48222
p.mulhhsRN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0xbf538be4
li t1, 0xd9fe01a
p.mulhhsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x3ab64fb9
li t1, 0x74a25991
p.mulhhsRN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0x9cae4b60
li t1, 0xef5c91c9
p.mulhhsRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x9c15fb57
li t1, 0x46b3b2c0
p.mulhhsRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x8c0b114b
li t1, 0xd125192e
p.mulhhsRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x3802872f
li t1, 0x4ce72166
p.mulhhsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xd5013d0e
li t1, 0xef35ce8c
p.mulhhsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xc13d7413
li t1, 0xbc7de11a
p.mulhhsRN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x1c3ff77e
li t1, 0xab51e06d
p.mulhhsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xe34daecb
li t1, 0x65645d48
p.mulhhsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x84cf7d83
li t1, 0x490e8e9d
p.mulhhsRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xde396a92
li t1, 0xb6417be
p.mulhhsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x681abd6f
li t1, 0x6425d59
p.mulhhsRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xbdf73e8
li t1, 0x60bc0905
p.mulhhsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xa57a9328
li t1, 0xc16495ca
p.mulhhsRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x3b89204f
li t1, 0x6348bb50
p.mulhhsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xeacb9827
li t1, 0x664e3296
p.mulhhsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x528cbe51
li t1, 0x8271c777
p.mulhhsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xd859ecc8
li t1, 0xcec2dd64
p.mulhhsRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x70431a7a
li t1, 0xcc3a2af1
p.mulhhsRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xc1c75063
li t1, 0xa47adcb4
p.mulhhsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x8bd97cf0
li t1, 0xfeb577d5
p.muluRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x8c950aa3
li t1, 0x14b3c6af
p.muluRN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0xab4544a1
li t1, 0x7d330138
p.muluRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x7eece81f
li t1, 0x318e0202
p.muluRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xc58daabb
li t1, 0xb9dab0a1
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x31b93187
li t1, 0xd0b072d1
p.muluRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x272b46d4
li t1, 0x414c9ced
p.muluRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xc146e48e
li t1, 0x874f599f
p.muluRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xc5de81e5
li t1, 0x730c303f
p.muluRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0xad0b1d6f
li t1, 0xfb3f4df0
p.muluRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x3c2f4974
li t1, 0x9f976f3e
p.muluRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x5c962876
li t1, 0xcb7b8164
p.muluRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x67f1c24e
li t1, 0xa3e7ec93
p.muluRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x17367b00
li t1, 0x6544e597
p.muluRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x60082fe
li t1, 0xcc024864
p.muluRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x8511b7ad
li t1, 0x1dab1560
p.muluRN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0xc54ffbc0
li t1, 0xa7603c3d
p.muluRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x6be0eb6a
li t1, 0x6c7f514f
p.muluRN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x7d56f5c0
li t1, 0x54127a5f
p.muluRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xe16ced0b
li t1, 0x98651d09
p.muluRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x9a3e8a34
li t1, 0x84970f4e
p.muluRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x9dd25d8b
li t1, 0x9f638f53
p.muluRN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x1b48a197
li t1, 0x39ef0bd8
p.muluRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x1fcfb4fc
li t1, 0xe51c0cea
p.muluRN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x65cb1462
li t1, 0x2ee8a1c8
p.muluRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x9d37f79b
li t1, 0xc6e16e2f
p.muluRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x4da1d291
li t1, 0x6dbf837f
p.muluRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xcef89c77
li t1, 0x78d4abb6
p.muluRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x81922a21
li t1, 0x6266e9be
p.muluRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xb2adc582
li t1, 0xf42def14
p.muluRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x8aaecef3
li t1, 0x6c0556f7
p.muluRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xa0dac698
li t1, 0x9462db9
p.muluRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x6201e92d
li t1, 0x6cedeb7a
p.muluRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xeb7341ef
li t1, 0x21bbb47f
p.muluRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x4a3ae714
li t1, 0xf5909ccb
p.muluRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x927cfd8d
li t1, 0x10698273
p.muluRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x2c2e18f9
li t1, 0x94883269
p.muluRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x5353c1e7
li t1, 0x730be937
p.muluRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x93d4d4d2
li t1, 0x62c4d735
p.muluRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x742dc07c
li t1, 0xa16026cb
p.muluRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xf796ba4b
li t1, 0xece22c9b
p.muluRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xc4897683
li t1, 0xf04ac7c6
p.muluRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x600ed7cb
li t1, 0xf28fc1a
p.muluRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x43f70d38
li t1, 0x5f0fdd96
p.muluRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x6bc4eef2
li t1, 0xc16809b5
p.muluRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xec5c0854
li t1, 0xe9c73b3d
p.muluRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x91fc8379
li t1, 0xbd014745
p.muluRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xbded1f3e
li t1, 0x32f668da
p.muluRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xae742979
li t1, 0x585618cf
p.muluRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xb75eb642
li t1, 0x8e861905
p.muluRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x6376cc0a
li t1, 0x8b0f26d9
p.muluRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xd0e67423
li t1, 0xb0026750
p.muluRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x52c7d2c9
li t1, 0xdb32626f
p.muluRN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x2f64769c
li t1, 0xf98a14e8
p.muluRN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0xb81125c0
li t1, 0x5bca88f9
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x9b9faffc
li t1, 0x42858016
p.muluRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x3dbaf2fb
li t1, 0xbf3b70b5
p.muluRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xb8e50ea2
li t1, 0x664f9bca
p.muluRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x940614c7
li t1, 0x4b0d11f3
p.muluRN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x6a0b2910
li t1, 0x60c8f5b5
p.muluRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x35ed0070
li t1, 0x1273a4bb
p.muluRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0xf9436838
li t1, 0x52097d2
p.muluRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x5de47c46
li t1, 0xd95c09ce
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xa479f404
li t1, 0x3a1a85d4
p.muluRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xc3f51cad
li t1, 0x4ae5ffbb
p.muluRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x700c6ed6
li t1, 0x219ce32f
p.muluRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x4c82a1a9
li t1, 0x77003f2f
p.muluRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xa07ffd5f
li t1, 0x30a1b3f2
p.muluRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x1483290b
li t1, 0x6f18a06
p.muluRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x6baec82b
li t1, 0x585ff18
p.muluRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x14c7b172
li t1, 0x6f42738b
p.muluRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x8830bf0a
li t1, 0xee7dab50
p.muluRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x61a2a48d
li t1, 0x139f61af
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x46b5a192
li t1, 0xa1352574
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xd1a3c5bc
li t1, 0x250d510b
p.muluRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x8bd97cf0
li t1, 0xfeb577d5
p.muluRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x8c950aa3
li t1, 0x14b3c6af
p.muluRN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0xab4544a1
li t1, 0x7d330138
p.muluRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x7eece81f
li t1, 0x318e0202
p.muluRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xc58daabb
li t1, 0xb9dab0a1
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x31b93187
li t1, 0xd0b072d1
p.muluRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x272b46d4
li t1, 0x414c9ced
p.muluRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xc146e48e
li t1, 0x874f599f
p.muluRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xc5de81e5
li t1, 0x730c303f
p.muluRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0xad0b1d6f
li t1, 0xfb3f4df0
p.muluRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x3c2f4974
li t1, 0x9f976f3e
p.muluRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x5c962876
li t1, 0xcb7b8164
p.muluRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x67f1c24e
li t1, 0xa3e7ec93
p.muluRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x17367b00
li t1, 0x6544e597
p.muluRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x60082fe
li t1, 0xcc024864
p.muluRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x8511b7ad
li t1, 0x1dab1560
p.muluRN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0xc54ffbc0
li t1, 0xa7603c3d
p.muluRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x6be0eb6a
li t1, 0x6c7f514f
p.muluRN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x7d56f5c0
li t1, 0x54127a5f
p.muluRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xe16ced0b
li t1, 0x98651d09
p.muluRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x9a3e8a34
li t1, 0x84970f4e
p.muluRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x9dd25d8b
li t1, 0x9f638f53
p.muluRN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x1b48a197
li t1, 0x39ef0bd8
p.muluRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x1fcfb4fc
li t1, 0xe51c0cea
p.muluRN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x65cb1462
li t1, 0x2ee8a1c8
p.muluRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x9d37f79b
li t1, 0xc6e16e2f
p.muluRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x4da1d291
li t1, 0x6dbf837f
p.muluRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xcef89c77
li t1, 0x78d4abb6
p.muluRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x81922a21
li t1, 0x6266e9be
p.muluRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xb2adc582
li t1, 0xf42def14
p.muluRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x8aaecef3
li t1, 0x6c0556f7
p.muluRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xa0dac698
li t1, 0x9462db9
p.muluRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x6201e92d
li t1, 0x6cedeb7a
p.muluRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xeb7341ef
li t1, 0x21bbb47f
p.muluRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x4a3ae714
li t1, 0xf5909ccb
p.muluRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x927cfd8d
li t1, 0x10698273
p.muluRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x2c2e18f9
li t1, 0x94883269
p.muluRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x5353c1e7
li t1, 0x730be937
p.muluRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x93d4d4d2
li t1, 0x62c4d735
p.muluRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x742dc07c
li t1, 0xa16026cb
p.muluRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xf796ba4b
li t1, 0xece22c9b
p.muluRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xc4897683
li t1, 0xf04ac7c6
p.muluRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x600ed7cb
li t1, 0xf28fc1a
p.muluRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x43f70d38
li t1, 0x5f0fdd96
p.muluRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x6bc4eef2
li t1, 0xc16809b5
p.muluRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xec5c0854
li t1, 0xe9c73b3d
p.muluRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x91fc8379
li t1, 0xbd014745
p.muluRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xbded1f3e
li t1, 0x32f668da
p.muluRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xae742979
li t1, 0x585618cf
p.muluRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xb75eb642
li t1, 0x8e861905
p.muluRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x6376cc0a
li t1, 0x8b0f26d9
p.muluRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xd0e67423
li t1, 0xb0026750
p.muluRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x52c7d2c9
li t1, 0xdb32626f
p.muluRN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x2f64769c
li t1, 0xf98a14e8
p.muluRN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0xb81125c0
li t1, 0x5bca88f9
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x9b9faffc
li t1, 0x42858016
p.muluRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x3dbaf2fb
li t1, 0xbf3b70b5
p.muluRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xb8e50ea2
li t1, 0x664f9bca
p.muluRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x940614c7
li t1, 0x4b0d11f3
p.muluRN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x6a0b2910
li t1, 0x60c8f5b5
p.muluRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x35ed0070
li t1, 0x1273a4bb
p.muluRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0xf9436838
li t1, 0x52097d2
p.muluRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x5de47c46
li t1, 0xd95c09ce
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xa479f404
li t1, 0x3a1a85d4
p.muluRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xc3f51cad
li t1, 0x4ae5ffbb
p.muluRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x700c6ed6
li t1, 0x219ce32f
p.muluRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x4c82a1a9
li t1, 0x77003f2f
p.muluRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xa07ffd5f
li t1, 0x30a1b3f2
p.muluRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x1483290b
li t1, 0x6f18a06
p.muluRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x6baec82b
li t1, 0x585ff18
p.muluRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x14c7b172
li t1, 0x6f42738b
p.muluRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x8830bf0a
li t1, 0xee7dab50
p.muluRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x61a2a48d
li t1, 0x139f61af
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x46b5a192
li t1, 0xa1352574
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xd1a3c5bc
li t1, 0x250d510b
p.muluRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xe92521d6
li t1, 0x24682a7f
li t2, 0x129149
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x417aa409
li t1, 0x546f8b7c
li t2, 0x4ccd1799
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xdbcf2b99
li t1, 0x53942d7a
li t2, 0x5cda114d
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xfebc70a3
li t1, 0x7c22582b
li t2, 0xf221f1da
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x543ad74a
li t1, 0x8fd6b0cb
li t2, 0x4f717a0f
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb0d42f5
li t1, 0xc4ccf7df
li t2, 0xffd26401
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b938d65
li t1, 0x75210932
li t2, 0xb109e23a
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x12e59fa4
li t1, 0xd5362e35
li t2, 0x137d4f58
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbac90d
li t1, 0xe1deb9e4
li t2, 0x51024b8
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb0ef1e59
li t1, 0xa3ad184
li t2, 0x781cf8e9
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5a3fabc3
li t1, 0xbc88eeb7
li t2, 0xa88d515b
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a37d26e
li t1, 0xfbe85505
li t2, 0xe84f617
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x73f4218
li t1, 0x9485381b
li t2, 0xce30eeec
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x46e74ccc
li t1, 0x6ddc644e
li t2, 0x4b5d1657
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xe24942be
li t1, 0x1c1552e0
li t2, 0x103e556f
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ec5bf92
li t1, 0xeccaf187
li t2, 0xc6b05b69
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e93edec
li t1, 0xf4b9017a
li t2, 0xffa36719
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa5b7e674
li t1, 0xaf2aac0e
li t2, 0x28dd384e
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x456c9f3a
li t1, 0x230c8a73
li t2, 0x2004d28e
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5bbf8b37
li t1, 0x5caeb82c
li t2, 0x33e5947d
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4413d03a
li t1, 0x59dcba97
li t2, 0xe45f827f
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x10671c9f
li t1, 0xe63fb58d
li t2, 0x8ccf90f
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ac981d
li t1, 0x526dbdc0
li t2, 0x877c5b2a
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8deb35cf
li t1, 0x634e17fa
li t2, 0x6e54e4bf
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4c23af52
li t1, 0x588603bb
li t2, 0xfca0616c
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa506dccb
li t1, 0xabe03677
li t2, 0x4609c79
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f65715a
li t1, 0x545d2647
li t2, 0xf4f46d39
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3c945cf6
li t1, 0xc21d68c8
li t2, 0xd8858ba9
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xaf56f629
li t1, 0x21792771
li t2, 0x53db78f9
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x83d4eba4
li t1, 0x7533a71b
li t2, 0xb0ec8144
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc8503bfb
li t1, 0x4a3c709e
li t2, 0x24bf090f
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d26c280
li t1, 0x69522a07
li t2, 0x70bc62cd
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4d31f94c
li t1, 0x860cd7dd
li t2, 0x405bdb0e
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x1f248983
li t1, 0x2630b51a
li t2, 0x2b6815d
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xee7e6fa7
li t1, 0x3b1ab7eb
li t2, 0xe63f6ea2
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x83f304e8
li t1, 0xbf763966
li t2, 0xacc187df
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x26cb8261
li t1, 0xa597f0f0
li t2, 0x4b84b0d7
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x676082bb
li t1, 0x977459e9
li t2, 0xc724f38e
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xf587d79c
li t1, 0xf30a20f5
li t2, 0xe7b7bf12
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb91c81a8
li t1, 0xb3bb8535
li t2, 0x625b5532
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3bdc9f65
li t1, 0x70eb280f
li t2, 0x7e0cd3c2
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xf4e373c2
li t1, 0x6119b2a3
li t2, 0x9924b9
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa34f9f27
li t1, 0x7eab5788
li t2, 0x776d0162
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4fefd8f
li t1, 0xb9d6355
li t2, 0x2855d683
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5a1f4b07
li t1, 0x66c2c476
li t2, 0x4c3e8507
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8c6fab45
li t1, 0xf1cb6fc6
li t2, 0x8483aff0
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x85669187
li t1, 0x9cb87ab8
li t2, 0xa488f32a
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x7ef88eef
li t1, 0x93caffb
li t2, 0x8d72ad1e
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5252bb71
li t1, 0xa57251c0
li t2, 0xd95613ca
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x68a93b8c
li t1, 0x2f3114c9
li t2, 0x7de30e50
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa4c7f39f
li t1, 0x44e6c09c
li t2, 0xda5febe3
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x1bda649d
li t1, 0xc154fd19
li t2, 0xa7e9768b
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9f4209e
li t1, 0xb9a0fafe
li t2, 0xe03c9044
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xf78e0963
li t1, 0xf1e1b9d8
li t2, 0x416b0041
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb01b335
li t1, 0xa40f5e18
li t2, 0x22785bc
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xda09e43a
li t1, 0x1309881c
li t2, 0xf8b8aa2e
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x9a554b47
li t1, 0xce763142
li t2, 0x5f8a5390
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x47f84ebe
li t1, 0x91589561
li t2, 0x46c1a21f
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xed9f7c18
li t1, 0xeb94fd6a
li t2, 0x6793ac16
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x43d08b5e
li t1, 0x41fd2e6f
li t2, 0xf187d160
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x44360384
li t1, 0x7c638c06
li t2, 0x45df025
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb694cc4d
li t1, 0x9583c7ae
li t2, 0xb019825e
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4c207dd9
li t1, 0x634944e
li t2, 0x6e162def
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6b03e9a
li t1, 0x7e5e309b
li t2, 0x724df281
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc523d491
li t1, 0xcfd428d2
li t2, 0x704b2049
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6ed0c462
li t1, 0xf313d535
li t2, 0x5b4a1401
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x672c0ff2
li t1, 0xe718fd9d
li t2, 0x519888db
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc950cd6f
li t1, 0x5e53a08c
li t2, 0x825d9435
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc40f88fd
li t1, 0xbb3d6699
li t2, 0x32d5e27a
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x2fb47121
li t1, 0x2c573dea
li t2, 0x418de07d
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x59e9edea
li t1, 0xdce398a
li t2, 0x70cee764
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xfea829b3
li t1, 0xb0be9a0e
li t2, 0xed0ffe3a
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x832173be
li t1, 0x7d00cd39
li t2, 0x89adefd9
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x37b44935
li t1, 0x99711490
li t2, 0x94605123
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x828f6ede
li t1, 0x5faa533a
li t2, 0x313eca72
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c32898
li t1, 0x57da1478
li t2, 0x96a754a
p.macsN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0xac46a6ed
li t1, 0x52dff51f
li t2, 0x90a8698c
p.machhsN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xbae62e66
li t1, 0xdebe95aa
li t2, 0x158b221b
p.macsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x80164a0e
li t1, 0xb1614ad5
li t2, 0xc4e484b5
p.machhsRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0xb0f84dd7
li t1, 0x6b93f8f4
li t2, 0xafb3ea7c
p.macuN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x1dbb3cd1
li t1, 0xe64d42f5
li t2, 0x9818d780
p.machhuN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x3008c4a7
li t1, 0x342dc23e
li t2, 0x2d68e8c8
p.macuRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xbdcc7010
li t1, 0x49ecc22c
li t2, 0xaed2b591
p.machhuRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xd265a6b3
li t1, 0xc247077d
li t2, 0x2d156abe
p.macsN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x2bc09901
li t1, 0x49f41ae
li t2, 0x3fd8caf7
p.machhsN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x54ec213b
li t1, 0xaa850c60
li t2, 0x60dffc1
p.macsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x21fc8c9f
li t1, 0xbfce97ed
li t2, 0x67c6fd5c
p.machhsRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x144a6b18
li t1, 0x24e8357a
li t2, 0xaeaf7979
p.macuN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x244b28da
li t1, 0x8d942e4c
li t2, 0x54f95336
p.machhuN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xf9eeedac
li t1, 0xbacc659e
li t2, 0x1146ad2a
p.macuRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x436bb7d1
li t1, 0xf16c71c6
li t2, 0x42a1a2fb
p.machhuRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xc800c9f
li t1, 0x59fb07c1
li t2, 0xf6558495
p.macsN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xec3a25ea
li t1, 0x8d9d3bb1
li t2, 0x86ed40cc
p.machhsN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x6b58bedf
li t1, 0x74d7ce1a
li t2, 0x2ebcc70d
p.macsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0xe7a408d5
li t1, 0xef8cb752
li t2, 0x79ffb680
p.machhsRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x6655e8c1
li t1, 0x90e8480f
li t2, 0x4a69e167
p.macuN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x3305ff45
li t1, 0x328a9f69
li t2, 0x4aa66598
p.machhuN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xd76a9a0b
li t1, 0xe4b33bea
li t2, 0xb858da12
p.macuRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x9f65cd11
li t1, 0x90d2409e
li t2, 0xe8f3cd19
p.machhuRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x8d0e212e
li t1, 0x573a5c14
li t2, 0x8ae9ae
p.macsN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x711ad4a7
li t1, 0xda2e6664
li t2, 0x1c37203e
p.machhsN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0xeac7cc43
li t1, 0x9dba6c8d
li t2, 0xc794965b
p.macsRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x1b3fc0a3
li t1, 0x74b1eb69
li t2, 0xa5899334
p.machhsRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x4292736
li t1, 0xef01ba0f
li t2, 0x4d074946
p.macuN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xc2494c44
li t1, 0xd12c6361
li t2, 0x3c136050
p.machhuN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xbfeb0f7
li t1, 0xf3ae1c9e
li t2, 0xbb77c8d4
p.macuRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x1182706a
li t1, 0xeef941e0
li t2, 0x144ba505
p.machhuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x739d05ac
li t1, 0x33feeb8c
li t2, 0xbb88c07
p.macsN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x8fc7098d
li t1, 0xad0af1ed
li t2, 0xb3b03ec7
p.machhsN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xd0352956
li t1, 0xed7a9b02
li t2, 0xdfb4980b
p.macsRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xf26ef3fd
li t1, 0x4ef685e5
li t2, 0xb3c05c24
p.machhsRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x4a27ab90
li t1, 0xaf4c445d
li t2, 0xc5504b81
p.macuN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x8472202a
li t1, 0x2678a6ec
li t2, 0xf8c2549d
p.machhuN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xc1c413bc
li t1, 0x24deaf14
li t2, 0xa3885047
p.macuRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0xd8e9d572
li t1, 0xd7448c8d
li t2, 0xf9d68555
p.machhuRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x97ddc55a
li t1, 0x4bda7ff4
li t2, 0x42bf0259
p.macsN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xd99aac3d
li t1, 0x5a0d9bc5
li t2, 0xc6e61f88
p.machhsN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xf77fa5bc
li t1, 0xe64dd25e
li t2, 0xbc9cfca8
p.macsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x89a2d610
li t1, 0xd6138785
li t2, 0x7fbc7773
p.machhsRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xd69ee753
li t1, 0x8bffcd21
li t2, 0xc08db29c
p.macuN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xeadb3851
li t1, 0xf444598f
li t2, 0xf2ae9c38
p.machhuN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xece16261
li t1, 0xc6a237b1
li t2, 0x415ada5e
p.macuRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xb49b679f
li t1, 0xb3592a43
li t2, 0x2a69b323
p.machhuRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x75770c2
li t1, 0x7bc0db14
li t2, 0x193e7568
p.macsN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0xabf15382
li t1, 0xe2499717
li t2, 0x5777123d
p.machhsN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0xbab6d031
li t1, 0x93468f3e
li t2, 0xee5daf80
p.macsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x42e4c94f
li t1, 0xb34bda6e
li t2, 0x5dbd78c8
p.machhsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x7e34b1d0
li t1, 0x7fcb3431
li t2, 0x1abfc98e
p.macuN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x2c5208ec
li t1, 0xfdaba512
li t2, 0x9ccd4c1c
p.machhuN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x17a2463e
li t1, 0xae36d036
li t2, 0xc9f9d339
p.macuRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x5c3cfd3c
li t1, 0xa9f64883
li t2, 0xd63f4c22
p.machhuRN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x8b232fd7
li t1, 0xbd58d5e
li t2, 0xb7909f76
p.macsN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x46c41605
li t1, 0xc0506188
li t2, 0x4084e833
p.machhsN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x26a1c3b7
li t1, 0x70760053
li t2, 0x912fcedc
p.macsRN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x72c0b4a6
li t1, 0xb49cbf40
li t2, 0xfc11f312
p.machhsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xab78a478
li t1, 0xf86bb8bc
li t2, 0x3d2722d0
p.macuN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0xc133e11c
li t1, 0x126414cd
li t2, 0x3cc944f7
p.machhuN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x84f73c0e
li t1, 0x9fdcfed1
li t2, 0xe6a27fec
p.macuRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xb66e891c
li t1, 0x72acbcd5
li t2, 0xdb261ab6
p.machhuRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x8efa60d0
li t1, 0xbe53ab46
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x9bc8d4f4
li t1, 0x5a481b33
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x63b5b36d
li t1, 0x39b4b0cd
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0x7a173f91
li t1, 0xe8559a76
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8664a1d0
li t1, 0x51fff5a5
li t2, 0x36d749ae
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0x16b4e796
li t1, 0xa8b345a4
li t2, 0xfe58da2b
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc16e1831
li t1, 0x5edf05d7
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0x8a4d26c3
li t1, 0xcbfea937
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x712046a5
li t1, 0x4f1d4662
p.mulsN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x30b8def5
li t1, 0xb8402ec
p.mulhhsN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x785c0711
li t1, 0x24a45483
p.mulsRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x32e59d0c
li t1, 0x5fed38c1
p.mulhhsRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xe08047ed
li t1, 0xbb3d4548
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0x52767caf
li t1, 0x3114f1ce
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x20c197ab
li t1, 0xdbb9616
p.muluN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0xd2f6ddb0
li t1, 0x73d35c86
p.mulhhuN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xdb67470c
li t1, 0x65ff8ec1
p.muluRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x5591929
li t1, 0xf2e5dd6b
p.mulhhuRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x4eae3815
li t1, 0x871f2ea
li t2, 0x1ed9d594
p.macsN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xbb64677a
li t1, 0xed906a63
li t2, 0x69495856
p.machhsN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x3ac1008b
li t1, 0xea122445
li t2, 0xa06d5b48
p.macsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x5c643631
li t1, 0xadb4ada6
li t2, 0x2b60e787
p.machhsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x71ed793e
li t1, 0x8021fe9d
li t2, 0xb12fb26c
p.macuN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x685e30d9
li t1, 0xe0cabfee
li t2, 0x17c8a596
p.machhuN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xafcfe46c
li t1, 0xb63569d3
li t2, 0x148b5d43
p.macuRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x68cfc273
li t1, 0x5a3a1fae
li t2, 0xc838b930
p.machhuRN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x62c1ec90
li t1, 0xa9579869
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd2b24e34
li t1, 0xdecafa6e
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x9447e765
li t1, 0x1487905a
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb1569c2
li t1, 0xbc2bfa10
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x25ead74c
li t1, 0x1d98c209
li t2, 0x63d9066
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0x2d91605f
li t1, 0x55b03904
li t2, 0x49427910
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x86893b7d
li t1, 0xe978db35
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb40f7fd
li t1, 0xab39419e
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x2c1267f6
li t1, 0xc7c18b50
p.mulsN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x715be73a
li t1, 0x6aad8c02
p.mulhhsN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x7f248d57
li t1, 0x688d582a
p.mulsRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xd91d8d7b
li t1, 0x2b3bfb3b
p.mulhhsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x5253ecc6
li t1, 0x45abee3c
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0x70034278
li t1, 0x676acde9
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x597cfb2d
li t1, 0x9615995d
p.muluN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x8b0ce4aa
li t1, 0x411e55fa
p.mulhhuN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xcde6fd6d
li t1, 0x398401a9
p.muluRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x254b9ad6
li t1, 0x6db19d13
p.mulhhuRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x8461fdcf
li t1, 0x1c76b1d7
li t2, 0x3363fcd4
p.macsN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x54c6d93b
li t1, 0xb0528a89
li t2, 0x4e70a0ab
p.machhsN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0xbfb54c2c
li t1, 0x217400a9
li t2, 0x2692e3ff
p.macsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x48b9c95d
li t1, 0x5f9f71cf
li t2, 0xc3f87a3c
p.machhsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x8ba55273
li t1, 0xce57051f
li t2, 0x7235e3f7
p.macuN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x64781ed8
li t1, 0x11a21d04
li t2, 0xc620f7da
p.machhuN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xbd21511b
li t1, 0x7af1284d
li t2, 0x73a1210b
p.macuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x5da738f5
li t1, 0xad2d68ee
li t2, 0x4f2c8ad0
p.machhuRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x7e618e3b
li t1, 0x55f8bd5c
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x75180b51
li t1, 0x11e0bf9e
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ad735ba
li t1, 0x33b316db
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa057861
li t1, 0x8a70e58d
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0xab991eb7
li t1, 0x45a6bc23
li t2, 0x1560ce59
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0x31d6e93d
li t1, 0x51cabdb8
li t2, 0xd5a4d960
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xaf079d9c
li t1, 0x55c43e0e
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0x6e9caf16
li t1, 0xe6aa2d22
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x13f0a4f6
li t1, 0x43478824
p.mulsN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xf77b9b1f
li t1, 0x87ceb5a2
p.mulhhsN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xd3bf73fe
li t1, 0x3a4a28f9
p.mulsRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x1a3eec64
li t1, 0xeb0e0440
p.mulhhsRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x314f4c8
li t1, 0xf31bacf3
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0xfda57749
li t1, 0x38145922
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x91d2bde5
li t1, 0x96bfb53a
p.muluN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x278f9ec6
li t1, 0x1c763fc
p.mulhhuN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0x831cf51
li t1, 0xa55bde89
p.muluRN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x696079e2
li t1, 0x22bf5040
p.mulhhuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xe861ba70
li t1, 0xa7cddf08
li t2, 0xdb17a802
p.macsN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xf56a95db
li t1, 0x2ca005d9
li t2, 0x91e0b59a
p.machhsN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x1cb6e2d7
li t1, 0xd535fa47
li t2, 0x24f7135c
p.macsRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xa13df707
li t1, 0xd1d8f501
li t2, 0x2697f1e5
p.machhsRN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0xc2ace31c
li t1, 0x4e56352d
li t2, 0x142efaf7
p.macuN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xd900d1b1
li t1, 0xf49e1a9a
li t2, 0x1c4f1988
p.machhuN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x45914615
li t1, 0xd5944dbe
li t2, 0xcbcc63b1
p.macuRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0xdfa97ef5
li t1, 0x4e03870f
li t2, 0x1505a91a
p.machhuRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x7f935e56
li t1, 0x604f0e68
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xae38ede3
li t1, 0xf99a2dc
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x28cb9679
li t1, 0xfccb991d
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0x40cfca7f
li t1, 0x108a2c99
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x61f5194
li t1, 0x59dc83db
li t2, 0x4e87aaed
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0x5bc27454
li t1, 0x3e477f1b
li t2, 0x46950483
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d9d62ba
li t1, 0x4b2f7b06
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0x45f4925f
li t1, 0x92fe5cad
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xb94351e4
li t1, 0x51dbf393
p.mulsN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x9b55663a
li t1, 0x7b344f6e
p.mulhhsN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xd13211b1
li t1, 0x289973d5
p.mulsRN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x8d36de07
li t1, 0x2f7b049b
p.mulhhsRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x111ba741
li t1, 0x685409a2
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0xe03005e0
li t1, 0xc3ac3085
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4fd308b6
li t1, 0xfc9dad58
p.muluN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x90e7cece
li t1, 0x6591b76
p.mulhhuN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xfc021edb
li t1, 0x3e8cb85c
p.muluRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xa640935c
li t1, 0x439fa6f0
p.mulhhuRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0xe07c4737
li t1, 0xe75172c2
li t2, 0x8d150cfb
p.macsN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x8a1edda
li t1, 0x4b35287a
li t2, 0x13275ec5
p.machhsN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0xfc926c0a
li t1, 0x40967e2e
li t2, 0x503b8189
p.macsRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x2cb1ddf3
li t1, 0xd60882d2
li t2, 0xa52cc821
p.machhsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0xce679d5a
li t1, 0x5cca2b8
li t2, 0x43e73221
p.macuN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0xd468928d
li t1, 0xa2b2b107
li t2, 0xa65cbc8f
p.machhuN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0xb6d3768e
li t1, 0x43fe1c5f
li t2, 0xdbbad1e9
p.macuRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xf990c9c2
li t1, 0x8fe42a40
li t2, 0x5ee307dc
p.machhuRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x294684ab
li t1, 0xf4ab0d71
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d7dd936
li t1, 0x789a7c13
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x41aa5ab1
li t1, 0x24ca1799
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0x2293ad6d
li t1, 0x9af227be
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x7375bfec
li t1, 0x54fc4c86
li t2, 0x1130e712
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0xb06b6db7
li t1, 0xef6896cb
li t2, 0x85c30140
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b33a7a
li t1, 0xdbe144f5
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0x911ebffa
li t1, 0x562ea997
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x7d9afe71
li t1, 0xafd20086
p.mulsN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xdded43f8
li t1, 0x185f4f79
p.mulhhsN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x791395aa
li t1, 0x705b4830
p.mulsRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x56c47402
li t1, 0x94193fb1
p.mulhhsRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xa3aa8594
li t1, 0x8852de3d
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ea700aa
li t1, 0xf71bf4b5
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x644b9991
li t1, 0x711134f5
p.muluN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x33959b8e
li t1, 0xf2aa0b40
p.mulhhuN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x4fd9a66
li t1, 0xcdcd8bd9
p.muluRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x6296f0c3
li t1, 0xf39e27d0
p.mulhhuRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x30f6040f
li t1, 0xcf4e7026
li t2, 0xbbd88147
p.macsN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x7b27f095
li t1, 0x1e0f1032
li t2, 0xa4f79066
p.machhsN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x64fe14d4
li t1, 0xc0dd8fab
li t2, 0x6535ea2e
p.macsRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0xe2ccc2bf
li t1, 0x4043076f
li t2, 0xe0f94d88
p.machhsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x3ffee186
li t1, 0xcd541ff3
li t2, 0x248c55e6
p.macuN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x8b43827a
li t1, 0xc15473cc
li t2, 0x19f7ad8b
p.machhuN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x6dbc5c56
li t1, 0x28e65cd1
li t2, 0x6fff1db0
p.macuRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xed6ee319
li t1, 0x656ff0a0
li t2, 0xf46858ac
p.machhuRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xb7f92fb5
li t1, 0xf909cf7c
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xb625ab09
li t1, 0x7f0eba0
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe99d60c
li t1, 0x65c880cc
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0x870a0420
li t1, 0x3110cc5d
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x46316998
li t1, 0xdab276a1
li t2, 0x70cf2b5f
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0x86d53ae7
li t1, 0xb516ee3b
li t2, 0xf40f3963
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x68fddc6e
li t1, 0x69b52a7b
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0xb01cad37
li t1, 0x5a743318
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x4593743a
li t1, 0x72785562
p.mulsN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xb83f3870
li t1, 0x78fe6bef
p.mulhhsN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x388465e
li t1, 0x9dc9e999
p.mulsRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0xf31df431
li t1, 0x8281cc22
p.mulhhsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x9dc476a1
li t1, 0x28828d60
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0xab339190
li t1, 0xc3931e40
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5846de6
li t1, 0x307dbc84
p.muluN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0x1af4c6a4
li t1, 0x4508ccdd
p.mulhhuN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0xea646c48
li t1, 0x86b26d23
p.muluRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x4a7b2a9a
li t1, 0xd23987be
p.mulhhuRN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xfabfeec
li t1, 0x4d9f0dc8
li t2, 0x57a1bfbb
p.macsN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0xbfa504b7
li t1, 0x4103fb4c
li t2, 0x62360faa
p.machhsN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x3d8c5e77
li t1, 0x36d1c1ab
li t2, 0x52cc3e6e
p.macsRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xa5c92565
li t1, 0x52e713a7
li t2, 0x72a093ea
p.machhsRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xcf0ff952
li t1, 0x16be400d
li t2, 0xe312cc62
p.macuN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x32633d3e
li t1, 0xa9cc6169
li t2, 0x9f0c9eed
p.machhuN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0xef63c68d
li t1, 0x85dec0a8
li t2, 0xaf8280
p.macuRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xb921f2e7
li t1, 0x9fa28a21
li t2, 0xf97d9843
p.machhuRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xa999b065
li t1, 0x710863a6
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd4de3ef2
li t1, 0x90e7cb9c
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0xf2fbc53d
li t1, 0xbaacfd0e
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0xd09a8405
li t1, 0xbd72912b
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc8cbff14
li t1, 0x2e7424d9
li t2, 0x703e3ea5
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0x20e8909
li t1, 0x798cbef8
li t2, 0x206bc51
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3594d261
li t1, 0x4b377bb7
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ddb692b
li t1, 0x1f5e298e
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xefe6d02b
li t1, 0xb1c4fca2
p.mulsN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xeafefe0f
li t1, 0x7197e2f2
p.mulhhsN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x2cd5562f
li t1, 0x1ed99438
p.mulsRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xd385712c
li t1, 0xa9b98032
p.mulhhsRN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0xbba8ee54
li t1, 0x826aa472
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbd33eb85
li t1, 0xc8219ee5
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x1f23d27b
li t1, 0x1e6546cd
p.muluN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x4d4e6a05
li t1, 0x860b178f
p.mulhhuN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0xd585fd2e
li t1, 0xab241a45
p.muluRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x4605a655
li t1, 0x95dfd5a2
p.mulhhuRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xb0e872c9
li t1, 0xbf265494
li t2, 0xefbae2b0
p.macsN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x43f977e7
li t1, 0x2de742bb
li t2, 0xd127e739
p.machhsN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x3a0d0139
li t1, 0xb485b2d2
li t2, 0x8be4da55
p.macsRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x219b94f
li t1, 0x1d9f05c0
li t2, 0x5771fdd3
p.machhsRN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x599f56a5
li t1, 0x89fdb0fe
li t2, 0x1480da5b
p.macuN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x7ec221c8
li t1, 0x6cffadca
li t2, 0xe1021cbc
p.machhuN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0xa06c8bed
li t1, 0x37e27b8a
li t2, 0xc42ef528
p.macuRN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x1436501e
li t1, 0x55a8e008
li t2, 0xa9946ed7
p.machhuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xb2ad74fc
li t1, 0xebe0a28b
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xa902d520
li t1, 0x4b9c36bc
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d75b497
li t1, 0x35feec5f
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0x87cb65e1
li t1, 0x4bd85bfb
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c051a79
li t1, 0x2a489dc9
li t2, 0x5604e8b3
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0xd5621649
li t1, 0x6d4e5e2a
li t2, 0x8c1a914b
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8e26a601
li t1, 0x514ad909
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0x59d2cd99
li t1, 0x7c1dacc5
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x9db12e5d
li t1, 0x26ee2e52
p.mulsN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0xd8ee5a63
li t1, 0x5580e661
p.mulhhsN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xd26f22f9
li t1, 0xd7187fb8
p.mulsRN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0xb7976e22
li t1, 0xbfe19504
p.mulhhsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xbe512757
li t1, 0x21a9fa08
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ce28ffa
li t1, 0x20e9d76f
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc6448373
li t1, 0xf23518ac
p.muluN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0xa66d0445
li t1, 0x77863eb7
p.mulhhuN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0xff729c1c
li t1, 0x51bd63cc
p.muluRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x70cb4a3c
li t1, 0x45d8827d
p.mulhhuRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x15e7f070
li t1, 0xb2d00e19
li t2, 0x689d4d98
p.macsN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x2e1ab79f
li t1, 0x18d01e3b
li t2, 0xf283c888
p.machhsN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x7d9bf9e9
li t1, 0x883ca20e
li t2, 0x204bf7fb
p.macsRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x15ec0a00
li t1, 0x84be90fb
li t2, 0x9e39c697
p.machhsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0xea31b53
li t1, 0xf7cb706
li t2, 0x120c9400
p.macuN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xceb35614
li t1, 0x70c60938
li t2, 0xc41d1146
p.machhuN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x590bbd07
li t1, 0xbfdfbf4f
li t2, 0xf2fa0929
p.macuRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x839c2e0f
li t1, 0x1a1d7fd9
li t2, 0x75e03a1e
p.machhuRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x50948e5c
li t1, 0x69b3695b
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f9c7ec6
li t1, 0x7b2da974
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x7e05b1ef
li t1, 0x5e9edd65
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc0509d84
li t1, 0xcadf7ae7
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x23a7a09d
li t1, 0x178513bc
li t2, 0xec14ad0
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0xf7480c4d
li t1, 0x701a192c
li t2, 0x6ce4a236
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ef436c2
li t1, 0x1347a47e
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa2ad264
li t1, 0x37507d88
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x212a3ae2
li t1, 0x5a52952c
p.mulsN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xa60cf8b9
li t1, 0x202d835c
p.mulhhsN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x6b59d77d
li t1, 0x45ecaa62
p.mulsRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x7857a1db
li t1, 0xfcdd88f
p.mulhhsRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0xc2443e4
li t1, 0x29fbeb5b
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0xfca4e7b1
li t1, 0xf0db915e
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f048b96
li t1, 0x529d2bab
p.muluN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x447f4e67
li t1, 0x8d42c9d1
p.mulhhuN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0xc50f4b85
li t1, 0x9bc992d1
p.muluRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xbc78662b
li t1, 0x2c817c70
p.mulhhuRN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x8cac3ff3
li t1, 0xfa12d755
li t2, 0xce63db8b
p.macsN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x81c6ef24
li t1, 0x5aeec51c
li t2, 0xd0d1cefd
p.machhsN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x95092af0
li t1, 0x1a3f4e9d
li t2, 0x97039bc2
p.macsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x7872dff4
li t1, 0xed625218
li t2, 0x9bcc901
p.machhsRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xffcc63c8
li t1, 0x35147f79
li t2, 0xacba82e0
p.macuN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x6c43dcfd
li t1, 0x7af391a
li t2, 0xc29b1d0a
p.machhuN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x3cefb6e6
li t1, 0x4fed37a4
li t2, 0xc9d0ccd0
p.macuRN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x957f44d4
li t1, 0x71c1110f
li t2, 0xbff4d5ab
p.machhuRN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x2d3d040e
li t1, 0x2b2a436f
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x21534d03
li t1, 0x7120b34a
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x1994b438
li t1, 0x3f87157c
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0xf932005c
li t1, 0x54000bcd
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x9c9fef74
li t1, 0x6ab20d4b
li t2, 0x23b3266
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0x9524b00e
li t1, 0xb243ff8e
li t2, 0x4a9056f0
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5f2fb1ca
li t1, 0x561a3e81
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0xc29f91cb
li t1, 0x58cb3ee5
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x9f743304
li t1, 0x897d283d
p.mulsN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x46cd07cf
li t1, 0x703d20b2
p.mulhhsN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x4d7fda3a
li t1, 0x647c8eca
p.mulsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0xd86b3cfe
li t1, 0x7dfdef7f
p.mulhhsRN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x96be309c
li t1, 0xf0360457
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc46e03dc
li t1, 0x10875836
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x850d3135
li t1, 0x27933356
p.muluN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x9adc2530
li t1, 0x7ca4fbf8
p.mulhhuN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x1b008285
li t1, 0xa485b5db
p.muluRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xfcd70c9
li t1, 0x2626db96
p.mulhhuRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x61918608
li t1, 0x2baedc55
li t2, 0xb6b8e303
p.macsN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xb9c367ae
li t1, 0x9d2475b3
li t2, 0x1f018f79
p.machhsN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x56308f36
li t1, 0x6dd3ebf7
li t2, 0x7521d177
p.macsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x1257e566
li t1, 0xa4740e22
li t2, 0x3a581928
p.machhsRN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0x48559769
li t1, 0x3bcbc776
li t2, 0x5aa7b071
p.macuN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xce6482e2
li t1, 0x25ee3d4
li t2, 0xcf649f4c
p.machhuN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0x77107fa9
li t1, 0xe0bed20e
li t2, 0x87ce1e07
p.macuRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0xbb68c9b3
li t1, 0x2d510b77
li t2, 0x73dfa857
p.machhuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xc641890a
li t1, 0xc37eea66
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xfcb93872
li t1, 0xede9e401
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x702618ba
li t1, 0xa44d2eb8
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5c352bdf
li t1, 0x7e202f88
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x9e690e8d
li t1, 0x3766499f
li t2, 0x652ad903
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0xa56c0ae0
li t1, 0xda31da97
li t2, 0x747f8387
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xcac2c169
li t1, 0x42885d73
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0x67b0ec78
li t1, 0x2f3fccf6
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a739024
li t1, 0x9bf1631f
p.mulsN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0xf572973b
li t1, 0x5d45458d
p.mulhhsN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x29101af
li t1, 0xe39bdc01
p.mulsRN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0xdfd923c4
li t1, 0x8c13d8f
p.mulhhsRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x3cfd290c
li t1, 0x62d13d09
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0x256339cc
li t1, 0xf635bc40
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa707b8f5
li t1, 0xb75c020
p.muluN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xd82854b2
li t1, 0x625ee212
p.mulhhuN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xaf796376
li t1, 0x61b1cd04
p.muluRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x56ba4527
li t1, 0x47ad2d79
p.mulhhuRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xe3d7d400
li t1, 0xfa65fa99
li t2, 0xf4c46b1b
p.macsN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x436e1c78
li t1, 0x24e087f1
li t2, 0xa8f85e67
p.machhsN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x88db5ff
li t1, 0xa8f43f85
li t2, 0xacf03a09
p.macsRN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0xcff89946
li t1, 0xd809051a
li t2, 0x1e558774
p.machhsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x9ae42aef
li t1, 0xe7c1f2c3
li t2, 0x5822b418
p.macuN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xf90e6095
li t1, 0x7ef8b792
li t2, 0xd030058a
p.machhuN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x5fdedd76
li t1, 0x9444cf45
li t2, 0x2a06430a
p.macuRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x52630701
li t1, 0xcee3d4e7
li t2, 0x9444ae14
p.machhuRN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x1bc9f9e1
li t1, 0x25d249aa
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xabeabc79
li t1, 0xd64e713d
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0xa11dcab3
li t1, 0x33db55e
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3498531b
li t1, 0xb85c0731
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8503bfd8
li t1, 0x428c1c03
li t2, 0x566e3b93
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a3e76ae
li t1, 0x4663b01
li t2, 0x78fb43aa
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xded84d7c
li t1, 0x612d815f
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0xa2c93229
li t1, 0x14aa9183
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x6269fa91
li t1, 0xffbace5a
p.mulsN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x96151d17
li t1, 0xfa01eb4e
p.mulhhsN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x3a3bccb6
li t1, 0x22d84d88
p.mulsRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x7851d0be
li t1, 0x73fc0b59
p.mulhhsRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x65c228b3
li t1, 0xf1da39a7
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0x70d464e6
li t1, 0xe88ce36b
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x77860272
li t1, 0xa98a7494
p.muluN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x5b823c50
li t1, 0x805b3f5a
p.mulhhuN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x92ea0b84
li t1, 0xd9ab86d4
p.muluRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0xda294294
li t1, 0x4c1289ba
p.mulhhuRN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x7197b7d3
li t1, 0x441f843c
li t2, 0xae2697f0
p.macsN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x6119765
li t1, 0xdd116739
li t2, 0xc71ffa81
p.machhsN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xfd62d155
li t1, 0x8069b45c
li t2, 0x1432e7ba
p.macsRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xa950886c
li t1, 0x2fd72955
li t2, 0x9ae59965
p.machhsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x6a1d06c
li t1, 0x794b1b21
li t2, 0x6ef97882
p.macuN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x785899ba
li t1, 0x1d2e7281
li t2, 0x69e0f0f
p.machhuN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x669217a4
li t1, 0x8d8cfc0e
li t2, 0x2bfc433e
p.macuRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x679b4fa8
li t1, 0xe8ce56c0
li t2, 0x6d7135ec
p.machhuRN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0x97b90dcb
li t1, 0x5994ba2
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0x709232a3
li t1, 0x1ebaa4e7
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x46ccf466
li t1, 0x31584a07
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0xf0f2f54e
li t1, 0x1e919650
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb8fd639c
li t1, 0xa47c785a
li t2, 0x1bb43a84
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0x569221bc
li t1, 0xcefecc18
li t2, 0xec65ba87
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x91849e30
li t1, 0x17b97fc
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0xe5611784
li t1, 0x7ae7c62f
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x2dd2569e
li t1, 0xa8be269b
p.mulsN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x160d93c3
li t1, 0xbe766a0f
p.mulhhsN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0xf48f9027
li t1, 0x4ad76fdb
p.mulsRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x337163ed
li t1, 0x5058d2a9
p.mulhhsRN t2, t0, t1, 0x17
sw t2, 4(sp)
li t0, 0x44984d4b
li t1, 0x4d0e28e0
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0x75c7c93a
li t1, 0xab24e182
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8a99f041
li t1, 0xfe57ee2f
p.muluN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x910eff99
li t1, 0x3806fd8
p.mulhhuN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x4b1d64bb
li t1, 0xa7607ba7
p.muluRN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0xd2dea4c
li t1, 0x9327f9b6
p.mulhhuRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xe1d72300
li t1, 0xb4e96085
li t2, 0x52a10ffc
p.macsN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x36f14a83
li t1, 0x78457057
li t2, 0x1066d9dc
p.machhsN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x7a86b749
li t1, 0x5d1c93
li t2, 0xe7b2c2e2
p.macsRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0xb56ef18
li t1, 0x1a51bb8a
li t2, 0x77371f1a
p.machhsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0x4738dcea
li t1, 0xdfa90a4d
li t2, 0xf9f09a33
p.macuN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x9d9823c
li t1, 0x761a48f0
li t2, 0x9f22b8cd
p.machhuN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x4ce0855b
li t1, 0x1fd7b16
li t2, 0x6f101459
p.macuRN t2, t0, t1, 0x16
sw t2, 4(sp)
li t0, 0x5dc1a59e
li t1, 0x3712d4cc
li t2, 0x871f01ec
p.machhuRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x23bd221
li t1, 0xa6876a35
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xccf6ed18
li t1, 0x23e5ba7a
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0x7c454801
li t1, 0xd53825e0
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0xaacc2b88
li t1, 0xa7164e43
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x7cdb6b9d
li t1, 0x77593432
li t2, 0x3439e86
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd2089ba
li t1, 0x3c0711c1
li t2, 0x5f732009
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e5a3213
li t1, 0x7d21b600
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0xd5146478
li t1, 0xcd879bf2
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xa896323a
li t1, 0xdbab67b
p.mulsN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x68331779
li t1, 0xf3b62d07
p.mulhhsN t2, t0, t1, 0xd
sw t2, 4(sp)
li t0, 0xbf9a459b
li t1, 0xd2fd8185
p.mulsRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x3d5d5af0
li t1, 0xa1f4a1b3
p.mulhhsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x20806a9f
li t1, 0x64fca97e
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0x37624996
li t1, 0xfdbbdb89
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa908117c
li t1, 0x95b9b233
p.muluN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0xbe09e2c3
li t1, 0x6ea2f655
p.mulhhuN t2, t0, t1, 0x19
sw t2, 4(sp)
li t0, 0xa3e2923e
li t1, 0x3489a7b
p.muluRN t2, t0, t1, 0xf
sw t2, 4(sp)
li t0, 0x481d14b8
li t1, 0xee3f966e
p.mulhhuRN t2, t0, t1, 0x11
sw t2, 4(sp)
li t0, 0x89994cdc
li t1, 0xd7fa9191
li t2, 0xf1640bdd
p.macsN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0xcd141890
li t1, 0x4b20dda
li t2, 0x61328c60
p.machhsN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0x4ded4fb7
li t1, 0xfb00e58c
li t2, 0xea17afac
p.macsRN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x9ad3dc6b
li t1, 0xabdeb29a
li t2, 0x6be7ebd8
p.machhsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xecb35814
li t1, 0x4bfb05d8
li t2, 0x5f072622
p.macuN t2, t0, t1, 0x1e
sw t2, 4(sp)
li t0, 0x80746721
li t1, 0xd4998e9
li t2, 0x96d90b1e
p.machhuN t2, t0, t1, 0x1a
sw t2, 4(sp)
li t0, 0x20d779c9
li t1, 0xc53d44da
li t2, 0x4055a902
p.macuRN t2, t0, t1, 0xa
sw t2, 4(sp)
li t0, 0x9126e56a
li t1, 0xeefa1a31
li t2, 0xeed67446
p.machhuRN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x4ea314ff
li t1, 0xb240aea7
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xa1b40039
li t1, 0x154483d5
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0xc3503d98
li t1, 0xe65b2bcd
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc2789104
li t1, 0xa2057dfd
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x7029f893
li t1, 0x9cef32
li t2, 0xa5a7cf55
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0xf79aa771
li t1, 0x4f637802
li t2, 0x6f15ead3
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0x86d2d064
li t1, 0xfccab27c
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa5decd3
li t1, 0x98567aca
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0xa44fc5e2
li t1, 0xa9491018
p.mulsN t2, t0, t1, 0x1d
sw t2, 4(sp)
li t0, 0x4eb16779
li t1, 0xc354483d
p.mulhhsN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x92e51b1b
li t1, 0xf179b8e7
p.mulsRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xd3d1c18
li t1, 0xfafb27af
p.mulhhsRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0xda0c3a33
li t1, 0x634ad844
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa011c0aa
li t1, 0x66f064e0
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x380e1064
li t1, 0x7d1138f7
p.muluN t2, t0, t1, 0xe
sw t2, 4(sp)
li t0, 0xe31f46f9
li t1, 0x8ffaa5dc
p.mulhhuN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x3c5d908f
li t1, 0xfdb3f9eb
p.muluRN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x8550aa79
li t1, 0xcb0d4555
p.mulhhuRN t2, t0, t1, 0x9
sw t2, 4(sp)
li t0, 0x274104fc
li t1, 0x6af95f95
li t2, 0x8dba49c1
p.macsN t2, t0, t1, 0x1f
sw t2, 4(sp)
li t0, 0x7e370156
li t1, 0x40c8a3ec
li t2, 0x75712f4e
p.machhsN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xee7ce0aa
li t1, 0xfcbe4d35
li t2, 0xc93c777d
p.macsRN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xa6daddfb
li t1, 0xe83216ab
li t2, 0x3184e237
p.machhsRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x66b6e6e6
li t1, 0xfa31589
li t2, 0xabe3af4b
p.macuN t2, t0, t1, 0x14
sw t2, 4(sp)
li t0, 0x62282c4c
li t1, 0x183b1ce7
li t2, 0x6f8fabd2
p.machhuN t2, t0, t1, 0x1b
sw t2, 4(sp)
li t0, 0x9b9a8211
li t1, 0xa651dfa9
li t2, 0x1a1d7d3c
p.macuRN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0xaa2e9317
li t1, 0x902997fe
li t2, 0xa7dd5455
p.machhuRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xef3d001a
li t1, 0x10a56ef7
mul t2, t0, t1
sw t2, 4(sp)
li t0, 0xd5875be5
li t1, 0xf029b23c
mulh t2, t0, t1
sw t2, 4(sp)
li t0, 0xc3a96381
li t1, 0x8856844f
mulhsu t2, t0, t1
sw t2, 4(sp)
li t0, 0xe3c92a1c
li t1, 0xc1376ad
mulhu t2, t0, t1
sw t2, 4(sp)
li t0, 0xadd39f18
li t1, 0xf1ff09cc
li t2, 0x61b273f8
p.mac t2, t0, t1
sw t2, 4(sp)
li t0, 0x4416a38
li t1, 0xa36c4426
li t2, 0xdf1d5a2f
p.msu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbe9d32d0
li t1, 0x876119c8
p.muls t2, t0, t1
sw t2, 4(sp)
li t0, 0x65b02c73
li t1, 0x605a9ca6
p.mulhhs t2, t0, t1
sw t2, 4(sp)
li t0, 0x2d055d71
li t1, 0x6da3717c
p.mulsN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0x54766a5f
li t1, 0x1f592405
p.mulhhsN t2, t0, t1, 0xc
sw t2, 4(sp)
li t0, 0x35ffafc9
li t1, 0xe4278567
p.mulsRN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x31d4c74d
li t1, 0xcbb4fb24
p.mulhhsRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x2fe77ad5
li t1, 0xc8cbf948
p.mulu t2, t0, t1
sw t2, 4(sp)
li t0, 0x418070ec
li t1, 0xe574b7eb
p.mulhhu t2, t0, t1
sw t2, 4(sp)
li t0, 0x77a0152f
li t1, 0xc05e0665
p.muluN t2, t0, t1, 0x12
sw t2, 4(sp)
li t0, 0xfd1b8b84
li t1, 0x15b97dd3
p.mulhhuN t2, t0, t1, 0x13
sw t2, 4(sp)
li t0, 0xc7f6aed4
li t1, 0x472d52d2
p.muluRN t2, t0, t1, 0x8
sw t2, 4(sp)
li t0, 0x42b2acd0
li t1, 0x82173c5b
p.mulhhuRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x3527018b
li t1, 0xe37b3620
li t2, 0x89d63819
p.macsN t2, t0, t1, 0x1c
sw t2, 4(sp)
li t0, 0x506ad3da
li t1, 0xc073ef06
li t2, 0x82e93ea5
p.machhsN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x300fcc99
li t1, 0x1a1a2eba
li t2, 0x37236934
p.macsRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x1576c809
li t1, 0xed2f1b48
li t2, 0xac18802a
p.machhsRN t2, t0, t1, 0x10
sw t2, 4(sp)
li t0, 0x4efc17fb
li t1, 0x90d9a27b
li t2, 0xee681f1c
p.macuN t2, t0, t1, 0x15
sw t2, 4(sp)
li t0, 0x45dfd257
li t1, 0x12f1eb34
li t2, 0x4e5099b
p.machhuN t2, t0, t1, 0xb
sw t2, 4(sp)
li t0, 0x625ea3a6
li t1, 0xd5a0cab4
li t2, 0x6bd4bab0
p.macuRN t2, t0, t1, 0x18
sw t2, 4(sp)
li t0, 0xdcb08bf2
li t1, 0x7e4d1f4c
li t2, 0xb0e73a06
p.machhuRN t2, t0, t1, 0xa
sw t2, 4(sp)
Loopend:
	li t0, 0x3b956d0
	li t1, 0xb177dea5
beq t0, t1, loop
	li t0, 0x514334c6
	li t1, 0x59f2f0ab
beq t0, t1, loop
	li t0, 0x7b1331e1
	li t1, 0xed72393f
beq t0, t1, loop
	li t0, 0x6e4206b0
	li t1, 0x4dd72f2
beq t0, t1, loop
	li t0, 0xb563a144
	li t1, 0x24f7d0c6
beq t0, t1, loop
	li t0, 0x7fe56462
	li t1, 0xaa039d43
beq t0, t1, loop
	li t0, 0x55d51879
	li t1, 0x98524e86
beq t0, t1, loop
	li t0, 0x351eac01
	li t1, 0x38a0601d
beq t0, t1, loop
	li t0, 0x972082d2
	li t1, 0xb235e540
beq t0, t1, loop
	li t0, 0x5554544c
	li t1, 0xfc371e4
beq t0, t1, loop
	li t0, 0x45adfb59
	li t1, 0xf13555f2
beq t0, t1, loop
	li t0, 0xadb3bbd8
	li t1, 0x8a222252
beq t0, t1, loop
	li t0, 0xb6826005
	li t1, 0x604be1e1
beq t0, t1, loop
	li t0, 0x17d4962b
	li t1, 0x9b262b6c
beq t0, t1, loop
	li t0, 0x501f1eef
	li t1, 0x11bb9e56
beq t0, t1, loop
	li t0, 0x137ec87b
	li t1, 0xf8c85fc5
beq t0, t1, loop
	li t0, 0xc165fb63
	li t1, 0xd96717e4
beq t0, t1, loop
	li t0, 0x8454b282
	li t1, 0x88235919
beq t0, t1, loop
	li t0, 0xf11e7153
	li t1, 0xdadc28ad
beq t0, t1, loop
	li t0, 0x82109f56
	li t1, 0x9ec0fa31
beq t0, t1, loop
	li t0, 0xe72677e0
	li t1, 0x27247be8
beq t0, t1, loop
	li t0, 0xe0836d5e
	li t1, 0xfc0855a6
beq t0, t1, loop
	li t0, 0x5c7bd68b
	li t1, 0x11e2c21f
beq t0, t1, loop
	li t0, 0x359e4cc3
	li t1, 0x4ea2f5b5
beq t0, t1, loop
	li t0, 0x55e26cec
	li t1, 0xa73b9abf
beq t0, t1, loop
	li t0, 0x85ebb67b
	li t1, 0x6d4a3130
beq t0, t1, loop
	li t0, 0x3780c128
	li t1, 0xdfdea455
beq t0, t1, loop
	li t0, 0xdee21a17
	li t1, 0xf8d33d17
beq t0, t1, loop
	li t0, 0x3bc0c146
	li t1, 0x8be3e9af
beq t0, t1, loop
	li t0, 0xe1a61d07
	li t1, 0x8bc290f5
beq t0, t1, loop
	li t0, 0x6e247028
	li t1, 0x93f3458b
beq t0, t1, loop
	li t0, 0xd3a7e5a2
	li t1, 0x6b488839
beq t0, t1, loop
	li t0, 0x5d1ce4b7
	li t1, 0x87a4a37
beq t0, t1, loop
	li t0, 0x17802921
	li t1, 0xe1535446
beq t0, t1, loop
	li t0, 0x7c9b0ba
	li t1, 0xb878f683
beq t0, t1, loop
	li t0, 0xfb52e72a
	li t1, 0x7b47972f
beq t0, t1, loop
	li t0, 0xd3a96e85
	li t1, 0x958dd064
beq t0, t1, loop
	li t0, 0x7d19d455
	li t1, 0xbb7a71ac
beq t0, t1, loop
	li t0, 0x7898dcd6
	li t1, 0x3ccfa727
beq t0, t1, loop
	li t0, 0x7403cb66
	li t1, 0x9b5aa11c
beq t0, t1, loop
	li t0, 0x5a7372de
	li t1, 0x5fdb9b0c
beq t0, t1, loop
	li t0, 0x5917ed8
	li t1, 0x681cc35c
beq t0, t1, loop
	li t0, 0xeb09c273
	li t1, 0xe9cd95b8
beq t0, t1, loop
	li t0, 0xd8c9488e
	li t1, 0x689ba543
beq t0, t1, loop
	li t0, 0xda445f1d
	li t1, 0x829813f0
beq t0, t1, loop
	li t0, 0x1f7a60bb
	li t1, 0x8e234868
beq t0, t1, loop
	li t0, 0x112bfc7b
	li t1, 0xee882898
beq t0, t1, loop
	li t0, 0x5506c803
	li t1, 0x45368c17
beq t0, t1, loop
	li t0, 0x234d479c
	li t1, 0x8356f5a5
beq t0, t1, loop
	li t0, 0xfbf67b5c
	li t1, 0x4cc94ad6
beq t0, t1, loop
	li t0, 0x5b0752ac
	li t1, 0x928a3030
beq t0, t1, loop
	li t0, 0x89ca35d5
	li t1, 0x679ccd2
beq t0, t1, loop
	li t0, 0x6bcf5ba8
	li t1, 0x5a27dfac
beq t0, t1, loop
	li t0, 0x539e8f35
	li t1, 0xb7b56a73
beq t0, t1, loop
	li t0, 0xcec726be
	li t1, 0x9d931216
beq t0, t1, loop
	li t0, 0x29c5bc7c
	li t1, 0x782b5c55
beq t0, t1, loop
	li t0, 0x1e931e55
	li t1, 0xbad96ac9
beq t0, t1, loop
	li t0, 0xce28e15f
	li t1, 0xf999a0d0
beq t0, t1, loop
	li t0, 0xe0c9dda
	li t1, 0xd39e6544
beq t0, t1, loop
	li t0, 0xddb7fa0a
	li t1, 0x6a897a6b
beq t0, t1, loop
	li t0, 0x1add7828
	li t1, 0x601df5f2
beq t0, t1, loop
	li t0, 0x97d8180
	li t1, 0x48746a81
beq t0, t1, loop
	li t0, 0x47d89e26
	li t1, 0x67e64527
beq t0, t1, loop
	li t0, 0x2ef00726
	li t1, 0x1eef70dc
beq t0, t1, loop
	li t0, 0x672f48ac
	li t1, 0xe05cae62
beq t0, t1, loop
	li t0, 0xfe8fb436
	li t1, 0xd84565e8
beq t0, t1, loop
	li t0, 0x8fe2389e
	li t1, 0xfac29aa2
beq t0, t1, loop
	li t0, 0x59fcf6ed
	li t1, 0xab147de7
beq t0, t1, loop
	li t0, 0xd00cf934
	li t1, 0x893b72d7
beq t0, t1, loop
	li t0, 0xa0c5a5c9
	li t1, 0x7fe68f1a
beq t0, t1, loop
	li t0, 0x58288237
	li t1, 0x1ae39f45
beq t0, t1, loop
	li t0, 0x96d91c1f
	li t1, 0x6e6b48fa
beq t0, t1, loop
	li t0, 0xa2a40a4b
	li t1, 0x1d36d4a9
beq t0, t1, loop
	li t0, 0x4dcb2038
	li t1, 0x1f9ba7e8
beq t0, t1, loop
	li t0, 0x891c5575
	li t1, 0x1252fcc3
beq t0, t1, loop
	li t0, 0x83abb77a
	li t1, 0xfde125c1
beq t0, t1, loop
	li t0, 0x90407bb
	li t1, 0xe58feedc
beq t0, t1, loop
	li t0, 0x45c49743
	li t1, 0xe59299cb
beq t0, t1, loop
	li t0, 0xbfc0b15a
	li t1, 0xcd792303
beq t0, t1, loop
	li t0, 0xaf220433
	li t1, 0xf3106b24
beq t0, t1, loop
	li t0, 0xca11e695
	li t1, 0x317dab7a
beq t0, t1, loop
	li t0, 0x47e74296
	li t1, 0x67cd14a5
beq t0, t1, loop
	li t0, 0xc43d6799
	li t1, 0x2b3a945f
beq t0, t1, loop
	li t0, 0x7f8d6c9c
	li t1, 0x434335f5
beq t0, t1, loop
	li t0, 0xf1bfda76
	li t1, 0xf17d0e22
beq t0, t1, loop
	li t0, 0x7ed7dd76
	li t1, 0xf1293a98
beq t0, t1, loop
	li t0, 0xaa01bc86
	li t1, 0x1a0dcb4
beq t0, t1, loop
	li t0, 0x6f0a1a26
	li t1, 0x3a7ed51d
beq t0, t1, loop
	li t0, 0x7a342db7
	li t1, 0x8f2f31e4
beq t0, t1, loop
	li t0, 0x7e46e79c
	li t1, 0x313af35d
beq t0, t1, loop
	li t0, 0xa1110694
	li t1, 0xd01405de
beq t0, t1, loop
	li t0, 0x532b82a0
	li t1, 0xe0061db3
beq t0, t1, loop
	li t0, 0x25fa0b3a
	li t1, 0xf6ca18da
beq t0, t1, loop
	li t0, 0x73abf0f6
	li t1, 0xec64c7a6
beq t0, t1, loop
	li t0, 0x23fad8b2
	li t1, 0x5666a091
beq t0, t1, loop
	li t0, 0xc20c31f9
	li t1, 0x2ec8beef
beq t0, t1, loop
	li t0, 0xb22764b
	li t1, 0x24de8be3
beq t0, t1, loop
	li t0, 0x49388b1d
	li t1, 0xa8d9cb2a
beq t0, t1, loop
	li t0, 0xad49a2d0
	li t1, 0x3f53ac21
beq t0, t1, loop
	li t0, 0x1fc3f649
	li t1, 0x56133445
beq t0, t1, loop
	li t0, 0xab7db549
	li t1, 0xab7db549
bne t0, t1, loop
	li t0, 0xac7c641e
	li t1, 0xac7c641e
bne t0, t1, loop
	li t0, 0xca26c041
	li t1, 0xca26c041
bne t0, t1, loop
	li t0, 0x3ab9cea3
	li t1, 0x3ab9cea3
bne t0, t1, loop
	li t0, 0xeb3c4aec
	li t1, 0xeb3c4aec
bne t0, t1, loop
	li t0, 0xd8094603
	li t1, 0xd8094603
bne t0, t1, loop
	li t0, 0x73fbca14
	li t1, 0x73fbca14
bne t0, t1, loop
	li t0, 0x31014e7b
	li t1, 0x31014e7b
bne t0, t1, loop
	li t0, 0xf4518462
	li t1, 0xf4518462
bne t0, t1, loop
	li t0, 0x7599f75e
	li t1, 0x7599f75e
bne t0, t1, loop
	li t0, 0xf5b51a24
	li t1, 0xf5b51a24
bne t0, t1, loop
	li t0, 0x93ba5e6f
	li t1, 0x93ba5e6f
bne t0, t1, loop
	li t0, 0xe9c2001a
	li t1, 0xe9c2001a
bne t0, t1, loop
	li t0, 0xaa7cdd9a
	li t1, 0xaa7cdd9a
bne t0, t1, loop
	li t0, 0x16169e54
	li t1, 0x16169e54
bne t0, t1, loop
	li t0, 0x10584bbd
	li t1, 0x10584bbd
bne t0, t1, loop
	li t0, 0xa0d4d564
	li t1, 0xa0d4d564
bne t0, t1, loop
	li t0, 0x54da9381
	li t1, 0x54da9381
bne t0, t1, loop
	li t0, 0x2caf00bd
	li t1, 0x2caf00bd
bne t0, t1, loop
	li t0, 0x4fb78f4b
	li t1, 0x4fb78f4b
bne t0, t1, loop
	li t0, 0xf5963904
	li t1, 0xf5963904
bne t0, t1, loop
	li t0, 0x5123cf7a
	li t1, 0x5123cf7a
bne t0, t1, loop
	li t0, 0xe45db503
	li t1, 0xe45db503
bne t0, t1, loop
	li t0, 0x6acda661
	li t1, 0x6acda661
bne t0, t1, loop
	li t0, 0x4ce1c2ef
	li t1, 0x4ce1c2ef
bne t0, t1, loop
	li t0, 0xbebc4531
	li t1, 0xbebc4531
bne t0, t1, loop
	li t0, 0x8eb0e125
	li t1, 0x8eb0e125
bne t0, t1, loop
	li t0, 0x59457279
	li t1, 0x59457279
bne t0, t1, loop
	li t0, 0x9d3ca65
	li t1, 0x9d3ca65
bne t0, t1, loop
	li t0, 0xb8b0d69f
	li t1, 0xb8b0d69f
bne t0, t1, loop
	li t0, 0x55010371
	li t1, 0x55010371
bne t0, t1, loop
	li t0, 0x6031eafd
	li t1, 0x6031eafd
bne t0, t1, loop
	li t0, 0x84b4f47d
	li t1, 0x84b4f47d
bne t0, t1, loop
	li t0, 0xf82b031f
	li t1, 0xf82b031f
bne t0, t1, loop
	li t0, 0x496be41e
	li t1, 0x496be41e
bne t0, t1, loop
	li t0, 0x4c71a53f
	li t1, 0x4c71a53f
bne t0, t1, loop
	li t0, 0x240974e8
	li t1, 0x240974e8
bne t0, t1, loop
	li t0, 0xc111692a
	li t1, 0xc111692a
bne t0, t1, loop
	li t0, 0x8d65173b
	li t1, 0x8d65173b
bne t0, t1, loop
	li t0, 0x9341c875
	li t1, 0x9341c875
bne t0, t1, loop
	li t0, 0x6257a708
	li t1, 0x6257a708
bne t0, t1, loop
	li t0, 0xeaa3b8b6
	li t1, 0xeaa3b8b6
bne t0, t1, loop
	li t0, 0x9c4a00df
	li t1, 0x9c4a00df
bne t0, t1, loop
	li t0, 0xe8d1d51b
	li t1, 0xe8d1d51b
bne t0, t1, loop
	li t0, 0x367a3c87
	li t1, 0x367a3c87
bne t0, t1, loop
	li t0, 0x6e23a257
	li t1, 0x6e23a257
bne t0, t1, loop
	li t0, 0x51c577e5
	li t1, 0x51c577e5
bne t0, t1, loop
	li t0, 0x43888b44
	li t1, 0x43888b44
bne t0, t1, loop
	li t0, 0x999d6406
	li t1, 0x999d6406
bne t0, t1, loop
	li t0, 0x348f6fe6
	li t1, 0x348f6fe6
bne t0, t1, loop
	li t0, 0x6582d2e8
	li t1, 0x6582d2e8
bne t0, t1, loop
	li t0, 0x5bc6adf7
	li t1, 0x5bc6adf7
bne t0, t1, loop
	li t0, 0x8d5c79cc
	li t1, 0x8d5c79cc
bne t0, t1, loop
	li t0, 0x9ed7bb4
	li t1, 0x9ed7bb4
bne t0, t1, loop
	li t0, 0xf0535f96
	li t1, 0xf0535f96
bne t0, t1, loop
	li t0, 0x6c92d24d
	li t1, 0x6c92d24d
bne t0, t1, loop
	li t0, 0x88d17561
	li t1, 0x88d17561
bne t0, t1, loop
	li t0, 0xdfa6022a
	li t1, 0xdfa6022a
bne t0, t1, loop
	li t0, 0x6a2f55c0
	li t1, 0x6a2f55c0
bne t0, t1, loop
	li t0, 0x776f5f7b
	li t1, 0x776f5f7b
bne t0, t1, loop
	li t0, 0x12d87ea4
	li t1, 0x12d87ea4
bne t0, t1, loop
	li t0, 0xe974ec96
	li t1, 0xe974ec96
bne t0, t1, loop
	li t0, 0xe079e5b0
	li t1, 0xe079e5b0
bne t0, t1, loop
	li t0, 0x7ca34176
	li t1, 0x7ca34176
bne t0, t1, loop
	li t0, 0xf709febd
	li t1, 0xf709febd
bne t0, t1, loop
	li t0, 0xf31f6936
	li t1, 0xf31f6936
bne t0, t1, loop
	li t0, 0xab8b8dbf
	li t1, 0xab8b8dbf
bne t0, t1, loop
	li t0, 0x339c94f2
	li t1, 0x339c94f2
bne t0, t1, loop
	li t0, 0xa97353c6
	li t1, 0xa97353c6
bne t0, t1, loop
	li t0, 0xe488397
	li t1, 0xe488397
bne t0, t1, loop
	li t0, 0xa0c52b79
	li t1, 0xa0c52b79
bne t0, t1, loop
	li t0, 0x5cfe6f86
	li t1, 0x5cfe6f86
bne t0, t1, loop
	li t0, 0xfdc85bf4
	li t1, 0xfdc85bf4
bne t0, t1, loop
	li t0, 0x1832e781
	li t1, 0x1832e781
bne t0, t1, loop
	li t0, 0xf333c819
	li t1, 0xf333c819
bne t0, t1, loop
	li t0, 0x3763b4f0
	li t1, 0x3763b4f0
bne t0, t1, loop
	li t0, 0x5ec6e29f
	li t1, 0x5ec6e29f
bne t0, t1, loop
	li t0, 0x4c57848f
	li t1, 0x4c57848f
bne t0, t1, loop
	li t0, 0x6735a4b6
	li t1, 0x6735a4b6
bne t0, t1, loop
	li t0, 0x7ae92e5a
	li t1, 0x7ae92e5a
bne t0, t1, loop
	li t0, 0x52c0b969
	li t1, 0x52c0b969
bne t0, t1, loop
	li t0, 0x9bc29485
	li t1, 0x9bc29485
bne t0, t1, loop
	li t0, 0x3af0daab
	li t1, 0x3af0daab
bne t0, t1, loop
	li t0, 0xbd102524
	li t1, 0xbd102524
bne t0, t1, loop
	li t0, 0x8c72a15d
	li t1, 0x8c72a15d
bne t0, t1, loop
	li t0, 0x18a2c306
	li t1, 0x18a2c306
bne t0, t1, loop
	li t0, 0xcb185bc7
	li t1, 0xcb185bc7
bne t0, t1, loop
	li t0, 0x5ff8fc2c
	li t1, 0x5ff8fc2c
bne t0, t1, loop
	li t0, 0x9b546ccb
	li t1, 0x9b546ccb
bne t0, t1, loop
	li t0, 0xeb358154
	li t1, 0xeb358154
bne t0, t1, loop
	li t0, 0x310c209
	li t1, 0x310c209
bne t0, t1, loop
	li t0, 0xf2412ffd
	li t1, 0xf2412ffd
bne t0, t1, loop
	li t0, 0x7d95818e
	li t1, 0x7d95818e
bne t0, t1, loop
	li t0, 0x1d6a0099
	li t1, 0x1d6a0099
bne t0, t1, loop
	li t0, 0x800d3824
	li t1, 0x800d3824
bne t0, t1, loop
	li t0, 0xb554b96f
	li t1, 0xb554b96f
bne t0, t1, loop
	li t0, 0x9be60eb5
	li t1, 0x9be60eb5
bne t0, t1, loop
	li t0, 0xe36779ec
	li t1, 0xe36779ec
bne t0, t1, loop
	li t0, 0xb4ffa143
	li t1, 0xb4ffa143
bne t0, t1, loop
	li t0, 0xea4808
	li t1, 0xea4808
bne t0, t1, loop
loop:
nop
nop
li t0, 0x91af2ac9
li t1, 0xfff3a018
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe15fa7ad
li t1, 0xd4d253ba
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc8810430
pv.dotup.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x362ed6fb
li t1, 0x3adaecbc
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b0458d3
li t1, 0x6a4c75e5
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x71221044
pv.dotup.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0xfb372a90
li t1, 0x2ab6ba39
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1f3ef64a
li t1, 0xf258e252
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8405cbd
pv.dotusp.sci.h t2, t0, 0x18
sw t2, 4(sp)
li t0, 0xd7ed5730
li t1, 0xdfa732a7
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe3f9ce1a
li t1, 0x30aa1789
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa380d401
pv.dotusp.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0x3f968411
li t1, 0xea6ce17c
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9db7deab
li t1, 0xc89fa45b
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x221c4e7f
pv.dotsp.sci.h t2, t0, 0x16
sw t2, 4(sp)
li t0, 0x8dc550e1
li t1, 0xb037b35b
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x34a1b98b
li t1, 0x6b1696cf
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf043b8f9
pv.dotsp.sci.b t2, t0, 0xa
sw t2, 4(sp)
li t0, 0xab4627fe
li t1, 0x7caa39a8
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd39018d0
li t1, 0xda092a67
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf77a326c
pv.sdotup.sci.h t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x74ca4d84
li t1, 0xa79364ec
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x153f8ca7
li t1, 0x2d52df65
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xade13451
pv.sdotup.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x33f3a154
li t1, 0xaa2d3a1a
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdbd5ae8a
li t1, 0x67dcc59c
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x90e3d0b5
pv.sdotusp.sci.h t2, t0, 0xd
sw t2, 4(sp)
li t0, 0xa1c9a23c
li t1, 0x5fba6bcd
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcd3a620a
li t1, 0xd791eeaf
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x18c619ce
pv.sdotusp.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0xa5d13b59
li t1, 0x35c4f902
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x283ee320
li t1, 0x7fdb28fd
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc3c99293
pv.sdotsp.sci.h t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x41943ee0
li t1, 0xb4256af
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6be96945
li t1, 0x82ed697a
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb311910d
pv.sdotsp.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x4094f98b
li t1, 0x1d8f59ed
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ca76b1f
li t1, 0xd135438f
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe4f0b077
pv.dotup.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0xe6a825e2
li t1, 0x5133244b
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6168c905
li t1, 0xb35b9917
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf3c1ef5e
pv.dotup.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x977865ab
li t1, 0x70ef9ee6
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb120cf9e
li t1, 0x9f83ad8d
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x70399010
pv.dotusp.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x1632ea2b
li t1, 0xb876915c
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc92f4dad
li t1, 0x8dda9350
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4dfcb3f2
pv.dotusp.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xf771a62
li t1, 0x741b553d
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc8a7233f
li t1, 0x8b876f9b
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x87f9a178
pv.dotsp.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x6df352f3
li t1, 0x19f635c0
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6907ee5e
li t1, 0xf19ebc1a
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdaebaed4
pv.dotsp.sci.b t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0x37e2ab17
li t1, 0xcb16b5fe
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe2581741
li t1, 0x9e50a5ca
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6348284a
pv.sdotup.sci.h t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0x44c8d5a0
li t1, 0x1279d182
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x46835755
li t1, 0x6672b0ce
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf0777ba
pv.sdotup.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x290a8264
li t1, 0x1a516380
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xafa151d7
li t1, 0x5379cf5
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x936169af
pv.sdotusp.sci.h t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x94d13a1e
li t1, 0x6dd58c86
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4ba6fee7
li t1, 0x38e4e57
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3e2b3d87
pv.sdotusp.sci.b t2, t0, 0xe
sw t2, 4(sp)
li t0, 0xb0cb7951
li t1, 0x6d11ebd0
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7a5d65a3
li t1, 0xbc9f39fd
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4ec9e85d
pv.sdotsp.sci.h t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x54c754d4
li t1, 0xe505db22
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b9c200b
li t1, 0x74fa5aee
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x560dffe1
pv.sdotsp.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0xbab5e2e3
li t1, 0xfb26f794
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x111a13f1
li t1, 0x576bcb70
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8da222ca
pv.dotup.sci.h t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0xc559ff57
li t1, 0xe13eda22
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb2be268f
li t1, 0xaa713dde
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7d16feaf
pv.dotup.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x75d5e4dd
li t1, 0xd291bcdf
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6b5116a5
li t1, 0xba709e70
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x94cd7aed
pv.dotusp.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0xccdc89d9
li t1, 0xabf033ce
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xec5d69ed
li t1, 0x1e599f10
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd449c047
pv.dotusp.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0xbc826c5f
li t1, 0xccd7a453
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcab0cbfe
li t1, 0x4ab18510
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x43d719c7
pv.dotsp.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x5be547f4
li t1, 0x64bb4175
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe7569d21
li t1, 0xbbf751b5
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd44d4599
pv.dotsp.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x732ebec4
li t1, 0x7260986e
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d2f7017
li t1, 0x67f2d24a
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ed619a7
pv.sdotup.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x94482984
li t1, 0xda2c8382
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x826ba0ec
li t1, 0xcc8ba2a9
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb4b96080
pv.sdotup.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x1bbb401f
li t1, 0x55d67a95
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8ab500bd
li t1, 0xd882c2bb
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8bc53d3b
pv.sdotusp.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x86bf68a0
li t1, 0xa2024962
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x82805455
li t1, 0xf7af3ad2
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x694e18b3
pv.sdotusp.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0xda8cd828
li t1, 0xcae6ecc8
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3448764d
li t1, 0x22f37cc5
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd272ebfc
pv.sdotsp.sci.h t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x96e69985
li t1, 0x855a4e2a
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x72d88383
li t1, 0x8e8e2dd8
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf431d1c5
pv.sdotsp.sci.b t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xcf97c96b
li t1, 0x267aaaa2
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x52dec8d5
li t1, 0x2e9930f2
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x56fa3768
pv.dotup.sci.h t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x8e4daf64
li t1, 0xf611bda9
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x20689685
li t1, 0xc2788994
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb7d8f1d3
pv.dotup.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x57e66da4
li t1, 0xfca6c11f
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8a4f0df1
li t1, 0xe88925f6
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x534fda10
pv.dotusp.sci.h t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0x402cc208
li t1, 0x31377237
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x75dcef12
li t1, 0x87e79997
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8928f61b
pv.dotusp.sci.b t2, t0, 0x1
sw t2, 4(sp)
li t0, 0xf3fec514
li t1, 0x4ccf5e75
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf945156c
li t1, 0xc12d200d
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc66dd7
pv.dotsp.sci.h t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x452c102d
li t1, 0x9625b60c
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb179b526
li t1, 0x3d9d6e93
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc5d4e2e
pv.dotsp.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x12ada1bd
li t1, 0x666682be
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf680be4c
li t1, 0xc35b4c0b
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x63f2a2f6
pv.sdotup.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x33deb9a5
li t1, 0x749f5241
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x892e5aea
li t1, 0xcd1afe33
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb454ac1b
pv.sdotup.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0xec9acab9
li t1, 0xf0fb959c
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb468de6
li t1, 0x554c8a43
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbf72e0b9
pv.sdotusp.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x550ad08e
li t1, 0xe23c05a1
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6c0b9ff2
li t1, 0x9f065fd3
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf5ead39e
pv.sdotusp.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x5b00069f
li t1, 0xf66edc19
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x69ae1aa1
li t1, 0x2beb1ff3
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe99ae62d
pv.sdotsp.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x27076d67
li t1, 0x4014f58a
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x78b963b3
li t1, 0x7c63e31c
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9c32a073
pv.sdotsp.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x2e6611de
li t1, 0x9f90eeed
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb19ab75f
li t1, 0x712fc1
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x24de787e
pv.dotup.sci.h t2, t0, 0x10
sw t2, 4(sp)
li t0, 0xcca3ba88
li t1, 0x3c27b413
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x60cbe970
li t1, 0x6fc8c232
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5cce84ab
pv.dotup.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0x5b512842
li t1, 0xb79dcd07
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf8ae2dee
li t1, 0x95600251
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4ee01686
pv.dotusp.sci.h t2, t0, 0x16
sw t2, 4(sp)
li t0, 0xd8a056cc
li t1, 0x4abe2c
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x954240e4
li t1, 0x5c21c269
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4c17021
pv.dotusp.sci.b t2, t0, 0xa
sw t2, 4(sp)
li t0, 0xbcd01a99
li t1, 0xa90dbcdf
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb7b1b9d9
li t1, 0x287b0ff8
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4707f92
pv.dotsp.sci.h t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x679c4b24
li t1, 0xcec499dd
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x99e36a48
li t1, 0x48f117b7
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x92ddcc10
pv.dotsp.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0xc6d055d6
li t1, 0x347087a3
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x15c803f7
li t1, 0xd34f000e
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9eb6e325
pv.sdotup.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0x26072528
li t1, 0x4aa16b05
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe75303a5
li t1, 0x5651e551
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfbb75d67
pv.sdotup.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x395beaee
li t1, 0xbe8d9788
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x39424f16
li t1, 0xeb28857e
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x60b062b1
pv.sdotusp.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0xea6d553f
li t1, 0x1a4dfefc
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x55ad98e8
li t1, 0x52bfcda7
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb562bd01
pv.sdotusp.sci.b t2, t0, 0x8
sw t2, 4(sp)
li t0, 0xbcc908f1
li t1, 0x1cbeaea9
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbd75a0d0
li t1, 0xa1ee28ab
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7470cca9
pv.sdotsp.sci.h t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x9795acc1
li t1, 0x58fabd7c
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3f7b8193
li t1, 0x8b37ddd7
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7156ad0a
pv.sdotsp.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x28053e66
li t1, 0x9572517e
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x66aea47e
li t1, 0xc5f645c
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xaf4ebe1a
pv.dotup.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x68e578e5
li t1, 0x3c3716fa
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2b191131
li t1, 0xa59fc284
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe6a80d8f
pv.dotup.sci.b t2, t0, 0x3
sw t2, 4(sp)
li t0, 0x87fbe434
li t1, 0xef50c34e
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x63e269fb
li t1, 0x308fa183
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe7edd497
pv.dotusp.sci.h t2, t0, 0x3
sw t2, 4(sp)
li t0, 0x8c61228d
li t1, 0x56fc76ef
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x817543fb
li t1, 0x7e43d2e7
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x88e96749
pv.dotusp.sci.b t2, t0, 0x0
sw t2, 4(sp)
li t0, 0x22c47e1a
li t1, 0x8885c4c9
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x253cf2ba
li t1, 0x6e5ea1f1
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x576f63a7
pv.dotsp.sci.h t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x1e26e8ef
li t1, 0xd36f9ece
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1810fe93
li t1, 0x8f7a87f5
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb2fa8f7
pv.dotsp.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x84138a7b
li t1, 0x3c37e7f0
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd868afa
li t1, 0x272db56a
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3191be78
pv.sdotup.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x3c8bef10
li t1, 0x4481e1f0
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xef97b57e
li t1, 0xa2a8207e
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc92c256e
pv.sdotup.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xb1bd1e15
li t1, 0xd206a249
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8f45662a
li t1, 0x16bb8013
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb5409693
pv.sdotusp.sci.h t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x1eac5209
li t1, 0x4e7c0245
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcbce5502
li t1, 0x35aedfe8
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa5cfca50
pv.sdotusp.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x48972fe
li t1, 0x1e77f9ce
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x550f742c
li t1, 0xbfd33842
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdc2cc953
pv.sdotsp.sci.h t2, t0, 0x18
sw t2, 4(sp)
li t0, 0xe4d4989f
li t1, 0xc7e106f
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf1354377
li t1, 0xb0245e2c
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa5f4fc0f
pv.sdotsp.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x5168a59f
li t1, 0x825305bb
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc23f33d5
li t1, 0xc87c7e7
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc258e9a
pv.dotup.sci.h t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x996821a3
li t1, 0xac4d034
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xabeda01d
li t1, 0x87d49a9b
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa3590753
pv.dotup.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x4ba74dd8
li t1, 0x5e659d1f
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd38bc259
li t1, 0xe2aba5e8
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe0d997ab
pv.dotusp.sci.h t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x770a5d13
li t1, 0x743fbb7d
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x221fc0e9
li t1, 0xb1502f98
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x30195d9c
pv.dotusp.sci.b t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0xf0df65b7
li t1, 0x9794a860
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf388aae3
li t1, 0x9d041834
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdfab6086
pv.dotsp.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xa4aa7ce2
li t1, 0x8a648a4f
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc7f7e37
li t1, 0x3a5c2cdc
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd2ac4a50
pv.dotsp.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0xe34312ec
li t1, 0x6ec6ea4e
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4e882922
li t1, 0x7ebf9415
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa5c46e9e
pv.sdotup.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0xcce28f3f
li t1, 0x42e5601e
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x76f0611b
li t1, 0xc8890280
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9adb40e
pv.sdotup.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x9f296ced
li t1, 0x584c1c90
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x580e5e69
li t1, 0x392af635
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe71add79
pv.sdotusp.sci.h t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x2a7ed496
li t1, 0x3898d25d
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9e19641
li t1, 0xb81d8533
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9185145a
pv.sdotusp.sci.b t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0xa0240dfa
li t1, 0x29673034
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x94bf6155
li t1, 0x388c85cc
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdaf810ee
pv.sdotsp.sci.h t2, t0, 0x16
sw t2, 4(sp)
li t0, 0xd87de4ae
li t1, 0x802a8a12
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe723046e
li t1, 0xe63119d3
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x69ddd997
pv.sdotsp.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x408ad5a0
li t1, 0x1f8efd6f
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x673f443d
li t1, 0x82d017d9
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc32bc1d5
pv.dotup.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x7c935a3f
li t1, 0x742d753e
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xadd24afc
li t1, 0x73dfeb2a
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x21ec9ce5
pv.dotup.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0xeaa19740
li t1, 0xad866578
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc249feee
li t1, 0x61cdb120
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa419e62e
pv.dotusp.sci.h t2, t0, 0x14
sw t2, 4(sp)
li t0, 0xf4d00d15
li t1, 0x8b826f1a
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9172cd51
li t1, 0xf6258098
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe499a675
pv.dotusp.sci.b t2, t0, 0x7
sw t2, 4(sp)
li t0, 0xd434a5c6
li t1, 0x4c654627
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x58229b0d
li t1, 0xdaf4dbb5
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f04f67d
pv.dotsp.sci.h t2, t0, 0x1
sw t2, 4(sp)
li t0, 0xb2c2617
li t1, 0x68f48370
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdf4d6061
li t1, 0xc6816ce9
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x951d5a8
pv.dotsp.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0xe681ddf0
li t1, 0x84462161
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9a9c7ec9
li t1, 0x7f36ab17
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9993e3ac
pv.sdotup.sci.h t2, t0, 0x16
sw t2, 4(sp)
li t0, 0xb5a2f7c5
li t1, 0x5701b539
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x20db25b
li t1, 0x6a3532bb
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf0eec102
pv.sdotup.sci.b t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x178f01df
li t1, 0x33129444
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb603762
li t1, 0x5760c6dc
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3d9595b
pv.sdotusp.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x81599854
li t1, 0x364e776e
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd8eeee0
li t1, 0x7cd21299
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1155bb07
pv.sdotusp.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x27c84a6e
li t1, 0x2926cd43
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdda8abfc
li t1, 0x7ee2bc2c
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xce9290dd
pv.sdotsp.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x31aa53a3
li t1, 0x84f3e24e
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x471b29dd
li t1, 0xc10d8e91
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x50f8497b
pv.sdotsp.sci.b t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x78c68a77
pv.dotup.sci.h t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd6f57b0a
pv.dotup.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x436c4f85
pv.dotusp.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x37ea1fdc
pv.dotusp.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xac88c725
pv.dotsp.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc86f3de
pv.dotsp.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd64431b1
pv.sdotup.sci.h t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa4e1c54a
pv.sdotup.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x81d1d02c
pv.sdotusp.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x31f5de1a
pv.sdotusp.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9374e889
pv.sdotsp.sci.h t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x0
li t1, 0x11111111
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8dc12ab8
pv.sdotsp.sci.b t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa8b520c
pv.dotup.sci.h t2, t0, 0x17
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x309b85c1
pv.dotup.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb91cc927
pv.dotusp.sci.h t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xed76ecd
pv.dotusp.sci.b t2, t0, 0x1a
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x66052335
pv.dotsp.sci.h t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x57d6933f
pv.dotsp.sci.b t2, t0, 0x1f
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa3d4ce5f
pv.sdotup.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbb65dc2a
pv.sdotup.sci.b t2, t0, 0xd
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7baa4c80
pv.sdotusp.sci.h t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f02332
pv.sdotusp.sci.b t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x32212c97
pv.sdotsp.sci.h t2, t0, 0x1e
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x11111111
li t1, 0x22222222
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb43e4cb4
pv.sdotsp.sci.b t2, t0, 0x9
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x32745422
pv.dotup.sci.h t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x81bac091
pv.dotup.sci.b t2, t0, 0x1c
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9e266816
pv.dotusp.sci.h t2, t0, 0x1b
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbefb2426
pv.dotusp.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd0166a85
pv.dotsp.sci.h t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfcb5d064
pv.dotsp.sci.b t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9a9413bb
pv.sdotup.sci.h t2, t0, 0xe
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x711ed704
pv.sdotup.sci.b t2, t0, 0x15
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf6e66973
pv.sdotusp.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4eb7715b
pv.sdotusp.sci.b t2, t0, 0x3
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x85507b08
pv.sdotsp.sci.h t2, t0, 0x5
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x22222222
li t1, 0x33333333
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe2d529b5
pv.sdotsp.sci.b t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xad0b60a3
pv.dotup.sci.h t2, t0, 0xc
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xddcda23f
pv.dotup.sci.b t2, t0, 0x1d
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd9ba3540
pv.dotusp.sci.h t2, t0, 0x11
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x66046156
pv.dotusp.sci.b t2, t0, 0x14
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xafe641e9
pv.dotsp.sci.h t2, t0, 0x7
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.dotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe4b688b3
pv.dotsp.sci.b t2, t0, 0x6
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotup.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotup.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbaadaef0
pv.sdotup.sci.h t2, t0, 0x19
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotup.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotup.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe6e03a84
pv.sdotup.sci.b t2, t0, 0x4
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotusp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotusp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x32d1111b
pv.sdotusp.sci.h t2, t0, 0x18
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotusp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotusp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa5aa53cc
pv.sdotusp.sci.b t2, t0, 0x2
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotsp.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotsp.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x27997207
pv.sdotsp.sci.h t2, t0, 0xb
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotsp.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x33333333
li t1, 0x44444444
pv.sdotsp.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3faacd25
pv.sdotsp.sci.b t2, t0, 0x12
sw t2, 4(sp)
li t0, 0x21ee5082
li t1, 0x38d573ad
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d4c4f9b
li t1, 0x70c264d0
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xe84032e7
li t1, 0xec62edac
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0xf085e190
li t1, 0xa6e60d4c
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0xf125a6a1
li t1, 0x5807f7a3
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x8ad0b049
li t1, 0x34a02ed4
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xe4cd1318
li t1, 0xde15bbc5
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0xeca65acf
li t1, 0x7b4d71e
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0xfea0f8ab
li t1, 0x94669baf
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x2b700065
li t1, 0x15fb6bcc
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa2f6b0e8
li t1, 0xdb3aa4c
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0x6edf55e4
li t1, 0x2c8f4a26
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x444e5789
li t1, 0x97614fcf
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x2341ce8f
li t1, 0x2a7e61be
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc61254d4
li t1, 0x8166d1fe
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0x72f98be5
li t1, 0x7f361041
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6422c2ab
li t1, 0x792215f8
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x46b9ae38
li t1, 0xe96f7658
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa99c073e
li t1, 0x912feb89
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0xfd42f11
li t1, 0xe38a15c1
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb83da6a2
li t1, 0xe9253040
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xa19e002b
li t1, 0x295ca951
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x7cacf367
li t1, 0x9f18e538
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0x66022805
li t1, 0xd178cc1b
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc25771dc
li t1, 0x6bf5851c
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x2522f53e
li t1, 0x26453349
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x502d4a69
li t1, 0xd77273e6
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0x97a35f75
li t1, 0x35ef1bf2
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x60f3628
li t1, 0xf023ca0d
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf62fc06
li t1, 0x4cb62279
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0xf7fca1e8
li t1, 0x23554235
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd28abf8
li t1, 0xf632cbd8
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x9943d604
li t1, 0x36763ad8
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xab52ec43
li t1, 0x672bcbe8
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x9e384e25
li t1, 0xb37bc480
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0xa66cb0b8
li t1, 0xe67fbafd
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0xbfb8c4eb
li t1, 0xfb5c8c51
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x18cda36
li t1, 0xcdbe7c7d
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x222b90c1
li t1, 0x88766e9c
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0x1b2ede74
li t1, 0xcfa32d54
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x79a3b060
li t1, 0xbb9b244b
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x9e90eaab
li t1, 0x7068d184
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x262087da
li t1, 0x9841814c
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0xb59ac631
li t1, 0x959b8795
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6c5b6718
li t1, 0xfa9be4cd
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x3bed4c5
li t1, 0xf751b980
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x317b9006
li t1, 0x475386c5
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ff6977a
li t1, 0x99ef1a83
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x4934f8d1
li t1, 0x1b4df288
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x3e79e66e
li t1, 0xe7497b84
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ddbaa49
li t1, 0x4d180b17
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0xfc53506e
li t1, 0x7573ccf0
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0xe7ff7fe8
li t1, 0x9b06b397
div t2, t0, t1
sw t2, 4(sp)
li t0, 0xb366893c
li t1, 0xa1bcd761
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x539f0f83
li t1, 0x92477626
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0x4880d2f7
li t1, 0x12cde2f2
remu t2, t0, t1
sw t2, 4(sp)
li t0, 0x2d42d8d1
li t1, 0xb0eed5f
div t2, t0, t1
sw t2, 4(sp)
li t0, 0x7a90f978
li t1, 0x2f995ffc
divu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8a90808c
li t1, 0xd39ef2a0
rem t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf75df
li t1, 0x4ff61eb1
remu t2, t0, t1
sw t2, 4(sp)

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
