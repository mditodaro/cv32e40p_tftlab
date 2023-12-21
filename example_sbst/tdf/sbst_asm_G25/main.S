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

li t0, 0xa8fd4777
p.clip t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xf7b145f6
p.clip t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x4b8b56f8
p.clip t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x2f5e36ed
p.clip t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x49fb2847
p.clipu t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x2bd6b1d8
p.clipu t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xbd5bc760
p.clipu t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x410e3739
p.clipu t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xd8086dbf
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x66124e33
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x361db40a
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x27c6553f
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x7bf39174
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0x18dd1084
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0x969ebecb
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xec5b7fc4
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0x762d96e
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x1da9cbcb
p.clb t1, t0
sw t1, 4(sp)
li t0, 0xcfa67bb0
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x9acc4dfc
p.clb t1, t0
sw t1, 4(sp)
li t0, 0xf4bfcc89
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x9ed1d1d3
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0xec925cc7
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0xe0d187f6
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0xbc91d895
p.abs t1, t0
sw t1, 4(sp)
li t0, 0xa75016d7
p.abs t1, t0
sw t1, 4(sp)
li t0, 0xd6591961
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x36d5a7d6
p.abs t1, t0
sw t1, 4(sp)
li t0, 0xb051e776
p.exths t1, t0
sw t1, 4(sp)
li t0, 0xe6b024e0
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x731955ee
p.exths t1, t0
sw t1, 4(sp)
li t0, 0xc553927f
p.exths t1, t0
sw t1, 4(sp)
li t0, 0xee47a092
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x6ea2282
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0xc7683253
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0xc49bf5b4
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0xdfb711aa
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0xfd0e7f82
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x71e152c
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0xd1d0dc06
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x5b90dc24
pv.add.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xe5c4f483
pv.add.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0xbd5c6879
pv.add.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x138aa5cb
pv.add.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xc65f38ea
pv.add.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x2dee1901
pv.add.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xcecf29e5
pv.add.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xca8dc170
pv.add.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xcfbf6537
pv.sub.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x67fc23
pv.sub.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xec58288e
pv.sub.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xec4ef88d
pv.sub.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x141180fb
pv.sub.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xc7e6b76d
pv.sub.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x536e1106
pv.sub.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x32f99352
pv.sub.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x75941467
pv.maxu.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xde118d1
pv.maxu.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xa3156389
pv.maxu.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x23c5d19d
pv.maxu.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x14cf40f2
pv.srl.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xf094e060
pv.srl.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x8baec1b4
pv.srl.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xaa9f3ab2
pv.srl.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x19a827c7
pv.shuffleI3.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x1727ea8a
pv.shuffleI3.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x8a30fcc4
pv.shuffleI3.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xfd7d39a6
pv.shuffleI3.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x7373fb70
pv.cmpeq.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x194faae5
pv.cmpeq.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xe4adf8cd
pv.cmpeq.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x27900ff9
pv.cmpeq.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x1cd0c707
li t1, 0x8e05104e
add t2, t0, t1
sw t2, 4(sp)
li t0, -0x1cd0c708
li t1, -0x8e05104f
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x174ba4cd
li t1, 0x6c7f6287
add t2, t0, t1
sw t2, 4(sp)
li t0, -0x174ba4ce
li t1, -0x6c7f6288
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xd5c2ba73
li t1, 0xd0bd8f9c
add t2, t0, t1
sw t2, 4(sp)
li t0, -0xd5c2ba74
li t1, -0xd0bd8f9d
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x69880011
li t1, 0x8627db64
add t2, t0, t1
sw t2, 4(sp)
li t0, -0x69880012
li t1, -0x8627db65
add t2, t0, t1
sw t2, 4(sp)
li t0, 0x6c593b59
li t1, 0x288a88f0
sub t2, t0, t1
sw t2, 4(sp)
li t0, -0x6c593b5a
li t1, -0x288a88f1
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x9805e709
li t1, 0xef0ff89a
sub t2, t0, t1
sw t2, 4(sp)
li t0, -0x9805e70a
li t1, -0xef0ff89b
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0xc17ad622
li t1, 0xcc6cda28
sub t2, t0, t1
sw t2, 4(sp)
li t0, -0xc17ad623
li t1, -0xcc6cda29
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x13915c48
li t1, 0x443b7784
sub t2, t0, t1
sw t2, 4(sp)
li t0, -0x13915c49
li t1, -0x443b7785
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0xa9d1277c
li t1, 0xbc40e943
sll t2, t0, t1
sw t2, 4(sp)
li t0, -0xa9d1277d
li t1, -0xbc40e944
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xd7d47247
li t1, 0x4a095b03
sll t2, t0, t1
sw t2, 4(sp)
li t0, -0xd7d47248
li t1, -0x4a095b04
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x47d62887
li t1, 0x97ebc174
sll t2, t0, t1
sw t2, 4(sp)
li t0, -0x47d62888
li t1, -0x97ebc175
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa650afd
li t1, 0xbfc0d677
sll t2, t0, t1
sw t2, 4(sp)
li t0, -0xaa650afe
li t1, -0xbfc0d678
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x8dd9553b
li t1, 0xa8a1aae6
slt t2, t0, t1
sw t2, 4(sp)
li t0, -0x8dd9553c
li t1, -0xa8a1aae7
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0xce28d0e8
li t1, 0xffaf6d6d
slt t2, t0, t1
sw t2, 4(sp)
li t0, -0xce28d0e9
li t1, -0xffaf6d6e
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x7b95374d
li t1, 0x9c302595
slt t2, t0, t1
sw t2, 4(sp)
li t0, -0x7b95374e
li t1, -0x9c302596
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x39d253f5
li t1, 0xd28ad792
slt t2, t0, t1
sw t2, 4(sp)
li t0, -0x39d253f6
li t1, -0xd28ad793
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0xfbd84a89
li t1, 0x48f80cb0
sltu t2, t0, t1
sw t2, 4(sp)
li t0, -0xfbd84a8a
li t1, -0x48f80cb1
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0xfa238df2
li t1, 0x24f98b83
sltu t2, t0, t1
sw t2, 4(sp)
li t0, -0xfa238df3
li t1, -0x24f98b84
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6af0d941
li t1, 0x6e1542f
sltu t2, t0, t1
sw t2, 4(sp)
li t0, -0x6af0d942
li t1, -0x6e15430
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x379f9b2d
li t1, 0x50b6fb09
sltu t2, t0, t1
sw t2, 4(sp)
li t0, -0x379f9b2e
li t1, -0x50b6fb0a
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0xe2608da
li t1, 0x8c6b1d64
xor t2, t0, t1
sw t2, 4(sp)
li t0, -0xe2608db
li t1, -0x8c6b1d65
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xf0ba126e
li t1, 0x5167b677
xor t2, t0, t1
sw t2, 4(sp)
li t0, -0xf0ba126f
li t1, -0x5167b678
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x3dca3ba
li t1, 0xdf836d97
xor t2, t0, t1
sw t2, 4(sp)
li t0, -0x3dca3bb
li t1, -0xdf836d98
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x2d733686
li t1, 0xdeee0e11
xor t2, t0, t1
sw t2, 4(sp)
li t0, -0x2d733687
li t1, -0xdeee0e12
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xdefebcce
li t1, 0x533fc2c4
srl t2, t0, t1
sw t2, 4(sp)
li t0, -0xdefebccf
li t1, -0x533fc2c5
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0xd4e09381
li t1, 0x93a7cadf
srl t2, t0, t1
sw t2, 4(sp)
li t0, -0xd4e09382
li t1, -0x93a7cae0
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0xe1315e2e
li t1, 0xd303cf19
srl t2, t0, t1
sw t2, 4(sp)
li t0, -0xe1315e2f
li t1, -0xd303cf1a
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0xd898147
li t1, 0x81c15505
srl t2, t0, t1
sw t2, 4(sp)
li t0, -0xd898148
li t1, -0x81c15506
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x1499e825
li t1, 0x9aaea500
sra t2, t0, t1
sw t2, 4(sp)
li t0, -0x1499e826
li t1, -0x9aaea501
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x678f9120
li t1, 0x259e932f
sra t2, t0, t1
sw t2, 4(sp)
li t0, -0x678f9121
li t1, -0x259e9330
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x16aacb4b
li t1, 0x44805b1e
sra t2, t0, t1
sw t2, 4(sp)
li t0, -0x16aacb4c
li t1, -0x44805b1f
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x3216ec67
li t1, 0x1247426b
sra t2, t0, t1
sw t2, 4(sp)
li t0, -0x3216ec68
li t1, -0x1247426c
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x847652ce
li t1, 0x185e5968
or t2, t0, t1
sw t2, 4(sp)
li t0, -0x847652cf
li t1, -0x185e5969
or t2, t0, t1
sw t2, 4(sp)
li t0, 0xffb2e401
li t1, 0x7605c862
or t2, t0, t1
sw t2, 4(sp)
li t0, -0xffb2e402
li t1, -0x7605c863
or t2, t0, t1
sw t2, 4(sp)
li t0, 0xefc21fd4
li t1, 0xadd4dbf2
or t2, t0, t1
sw t2, 4(sp)
li t0, -0xefc21fd5
li t1, -0xadd4dbf3
or t2, t0, t1
sw t2, 4(sp)
li t0, 0xc01fa366
li t1, 0x5a16c6a6
or t2, t0, t1
sw t2, 4(sp)
li t0, -0xc01fa367
li t1, -0x5a16c6a7
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x5da35300
li t1, 0x4574980e
and t2, t0, t1
sw t2, 4(sp)
li t0, -0x5da35301
li t1, -0x4574980f
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x23317de0
li t1, 0x6320cf71
and t2, t0, t1
sw t2, 4(sp)
li t0, -0x23317de1
li t1, -0x6320cf72
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xbb7febd
li t1, 0x49a1201d
and t2, t0, t1
sw t2, 4(sp)
li t0, -0xbb7febe
li t1, -0x49a1201e
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x509814ea
li t1, 0xa6174a9e
and t2, t0, t1
sw t2, 4(sp)
li t0, -0x509814eb
li t1, -0xa6174a9f
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xc3fa1b7f
li t1, 0xf5124fe2
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, -0xc3fa1b80
li t1, -0xf5124fe3
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x7ca85620
li t1, 0x9f1d242f
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, -0x7ca85621
li t1, -0x9f1d2430
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b7389a4
li t1, 0xee09e7ab
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, -0x9b7389a5
li t1, -0xee09e7ac
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x265d423c
li t1, 0xde0ebee2
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, -0x265d423d
li t1, -0xde0ebee3
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f48da57
li t1, 0xd26ab3eb
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, -0x7f48da58
li t1, -0xd26ab3ec
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcdafcd4f
li t1, 0xa7602051
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, -0xcdafcd50
li t1, -0xa7602052
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0xddec9d82
li t1, 0xd44bf08a
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, -0xddec9d83
li t1, -0xd44bf08b
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x45387532
li t1, 0x9c26db86
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, -0x45387533
li t1, -0x9c26db87
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x7dd91b2a
li t1, 0x3710e8a0
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, -0x7dd91b2b
li t1, -0x3710e8a1
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x7d117b19
li t1, 0x584953a
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, -0x7d117b1a
li t1, -0x584953b
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf04c94af
li t1, 0x94f4f924
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, -0xf04c94b0
li t1, -0x94f4f925
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xdecc6638
li t1, 0x35a4ef90
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, -0xdecc6639
li t1, -0x35a4ef91
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x44e3de79
li t1, 0x3138fb62
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, -0x44e3de7a
li t1, -0x3138fb63
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x3723574a
li t1, 0xc17ac4fc
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, -0x3723574b
li t1, -0xc17ac4fd
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fbfc762
li t1, 0x253cc59d
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, -0x3fbfc763
li t1, -0x253cc59e
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d33f815
li t1, 0x534ba09d
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, -0x9d33f816
li t1, -0x534ba09e
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4ed6f0c3
li t1, 0x3dcc408e
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, -0x4ed6f0c4
li t1, -0x3dcc408f
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f023793
li t1, 0xaff886a8
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, -0x4f023794
li t1, -0xaff886a9
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xcff593a5
li t1, 0x9da31c10
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, -0xcff593a6
li t1, -0x9da31c11
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x5805ef3c
li t1, 0xcf82b514
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, -0x5805ef3d
li t1, -0xcf82b515
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x67765abb
li t1, 0xefd786a7
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, -0x67765abc
li t1, -0xefd786a8
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x717812fa
li t1, 0x7ab508df
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, -0x717812fb
li t1, -0x7ab508e0
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x375d470a
li t1, 0xc3c4b46a
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, -0x375d470b
li t1, -0xc3c4b46b
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x4a01d1d9
li t1, 0xa1492e54
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, -0x4a01d1da
li t1, -0xa1492e55
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xdca2dd4e
li t1, 0xefc18fbe
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, -0xdca2dd4f
li t1, -0xefc18fbf
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3f2059db
li t1, 0x1baaf097
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, -0x3f2059dc
li t1, -0x1baaf098
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xd798105d
li t1, 0xb2a2f079
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, -0xd798105e
li t1, -0xb2a2f07a
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8b3998d
li t1, 0x29c7122a
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, -0x8b3998e
li t1, -0x29c7122b
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x6eb80372
li t1, 0x6d2084fa
p.min t2, t0, t1
sw t2, 4(sp)
li t0, -0x6eb80373
li t1, -0x6d2084fb
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x973bbcc
li t1, 0xdc69e832
p.min t2, t0, t1
sw t2, 4(sp)
li t0, -0x973bbcd
li t1, -0xdc69e833
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xcdaf05f2
li t1, 0xefda8dc
p.min t2, t0, t1
sw t2, 4(sp)
li t0, -0xcdaf05f3
li t1, -0xefda8dd
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xf794a5ee
li t1, 0x759a0222
p.min t2, t0, t1
sw t2, 4(sp)
li t0, -0xf794a5ef
li t1, -0x759a0223
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xd8104253
li t1, 0x8a756ddf
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, -0xd8104254
li t1, -0x8a756de0
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x1e8993dd
li t1, 0xafd785e2
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, -0x1e8993de
li t1, -0xafd785e3
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0xadd78809
li t1, 0x915b887c
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, -0xadd7880a
li t1, -0x915b887d
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0xe37b5683
li t1, 0x9681d648
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, -0xe37b5684
li t1, -0x9681d649
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe810f53
li t1, 0x1c3875d8
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xfe810f54
li t1, -0x1c3875d9
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x11fd5a88
li t1, 0xb29c9766
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x11fd5a89
li t1, -0xb29c9767
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa7e7f3e2
li t1, 0xad5165cd
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xa7e7f3e3
li t1, -0xad5165ce
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x723409b5
li t1, 0xba2ab7a9
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x723409b6
li t1, -0xba2ab7aa
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd3ebac45
li t1, 0xe6ba3478
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xd3ebac46
li t1, -0xe6ba3479
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x126d5c27
li t1, 0x31b71c68
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x126d5c28
li t1, -0x31b71c69
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe387ccbd
li t1, 0xedbf74b8
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xe387ccbe
li t1, -0xedbf74b9
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x18c9b72c
li t1, 0x3f265c52
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x18c9b72d
li t1, -0x3f265c53
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x821f586
li t1, 0xc2bc1e36
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x821f587
li t1, -0xc2bc1e37
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd197fa18
li t1, 0x55a5772b
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xd197fa19
li t1, -0x55a5772c
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x5461b087
li t1, 0x97b9f631
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x5461b088
li t1, -0x97b9f632
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd69a46f7
li t1, 0x6c65acdd
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xd69a46f8
li t1, -0x6c65acde
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc43f8927
li t1, 0xb3d62d4b
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xc43f8928
li t1, -0xb3d62d4c
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x8b6360c6
li t1, 0x8ea04fd3
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x8b6360c7
li t1, -0x8ea04fd4
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x6b30b335
li t1, 0x98e80326
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x6b30b336
li t1, -0x98e80327
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x74d30fdc
li t1, 0x999abad2
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x74d30fdd
li t1, -0x999abad3
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x43ca2f83
li t1, 0xfd42d0e1
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x43ca2f84
li t1, -0xfd42d0e2
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4c6de256
li t1, 0x78bbe3cf
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x4c6de257
li t1, -0x78bbe3d0
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xca9bf4a3
li t1, 0xdd7f9cd2
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xca9bf4a4
li t1, -0xdd7f9cd3
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x6de7524c
li t1, 0x866d57d5
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x6de7524d
li t1, -0x866d57d6
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x4f00c88c
li t1, 0xa9ea01bb
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x4f00c88d
li t1, -0xa9ea01bc
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x298449ef
li t1, 0xac6c7ee5
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x298449f0
li t1, -0xac6c7ee6
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc67f03a
li t1, 0xc9669653
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xcc67f03b
li t1, -0xc9669654
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x653c6fbf
li t1, 0x2c66700f
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x653c6fc0
li t1, -0x2c667010
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xedb55dc1
li t1, 0xc85d3cf2
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xedb55dc2
li t1, -0xc85d3cf3
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x3566a41c
li t1, 0x92f7ddd9
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x3566a41d
li t1, -0x92f7ddda
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xdb508f03
li t1, 0x57e5639f
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xdb508f04
li t1, -0x57e563a0
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x56af72a3
li t1, 0x411a81ef
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x56af72a4
li t1, -0x411a81f0
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x69d1487c
li t1, 0xd2ffaaf2
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x69d1487d
li t1, -0xd2ffaaf3
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd427c2d9
li t1, 0x4f0f3d1b
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xd427c2da
li t1, -0x4f0f3d1c
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d475563
li t1, 0xcab0fcd
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9d475564
li t1, -0xcab0fce
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x40db6e2f
li t1, 0x206148ea
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x40db6e30
li t1, -0x206148eb
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9ee0f1f5
li t1, 0xaf37ab32
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9ee0f1f6
li t1, -0xaf37ab33
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x30524fd1
li t1, 0x6539367c
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x30524fd2
li t1, -0x6539367d
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9c7214ec
li t1, 0x7fc12427
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9c7214ed
li t1, -0x7fc12428
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb46eccd
li t1, 0x93dd39e2
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xb46ecce
li t1, -0x93dd39e3
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x738fa1c4
li t1, 0xf2d0fa3f
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x738fa1c5
li t1, -0xf2d0fa40
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf1be60df
li t1, 0xad0bbe7f
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xf1be60e0
li t1, -0xad0bbe80
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x89f8763c
li t1, 0x1331bded
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x89f8763d
li t1, -0x1331bdee
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d1aa933
li t1, 0x2ac07a92
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x1d1aa934
li t1, -0x2ac07a93
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x46a30285
li t1, 0xc41b2de
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x46a30286
li t1, -0xc41b2df
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2490e272
li t1, 0x138b269
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x2490e273
li t1, -0x138b26a
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8006a533
li t1, 0xd6dbecf0
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x8006a534
li t1, -0xd6dbecf1
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x30d51f9
li t1, 0x14cfe6d1
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x30d51fa
li t1, -0x14cfe6d2
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xca89bee2
li t1, 0x3314165c
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xca89bee3
li t1, -0x3314165d
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x12ca60bd
li t1, 0xf24d4e6
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x12ca60be
li t1, -0xf24d4e7
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc1d4aaab
li t1, 0xc26077bc
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xc1d4aaac
li t1, -0xc26077bd
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdc38d1aa
li t1, 0x6afcb257
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xdc38d1ab
li t1, -0x6afcb258
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x64ceba10
li t1, 0x3309a8d0
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x64ceba11
li t1, -0x3309a8d1
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd46ef802
li t1, 0x78fbba2
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xd46ef803
li t1, -0x78fbba3
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x463d7e48
li t1, 0x3918b8f9
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x463d7e49
li t1, -0x3918b8fa
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6e87b72b
li t1, 0x7f4ddcd5
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x6e87b72c
li t1, -0x7f4ddcd6
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe0197182
li t1, 0x1813e6e3
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xe0197183
li t1, -0x1813e6e4
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x34631f2b
li t1, 0xb5dbcc18
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x34631f2c
li t1, -0xb5dbcc19
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x555763ff
li t1, 0xdeb1de2c
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x55576400
li t1, -0xdeb1de2d
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x24e9e5a5
li t1, 0xe6dc55b6
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x24e9e5a6
li t1, -0xe6dc55b7
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa86975c
li t1, 0x351a842
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xa86975d
li t1, -0x351a843
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa04f4
li t1, 0x9f684010
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xa04f5
li t1, -0x9f684011
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfb126c60
li t1, 0xefc4585d
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xfb126c61
li t1, -0xefc4585e
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9a0e947
li t1, 0x40359816
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x9a0e948
li t1, -0x40359817
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x23c4da10
li t1, 0x4a3c845c
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x23c4da11
li t1, -0x4a3c845d
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4d865a7d
li t1, 0x8f951e2d
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x4d865a7e
li t1, -0x8f951e2e
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbde63992
li t1, 0xbfba90ef
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xbde63993
li t1, -0xbfba90f0
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x752edfc4
li t1, 0x44af437f
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x752edfc5
li t1, -0x44af4380
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4d06f73f
li t1, 0x78d9a9e4
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x4d06f740
li t1, -0x78d9a9e5
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x32ef814a
li t1, 0xb4ad6949
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x32ef814b
li t1, -0xb4ad694a
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1e1abe08
li t1, 0x67448b5e
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x1e1abe09
li t1, -0x67448b5f
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d51b742
li t1, 0x2fb51bad
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9d51b743
li t1, -0x2fb51bae
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3761a4
li t1, 0x9cad233d
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xb3761a5
li t1, -0x9cad233e
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3079f59b
li t1, 0x1dcb7c4a
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x3079f59c
li t1, -0x1dcb7c4b
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf247f31
li t1, 0x25010c53
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xcf247f32
li t1, -0x25010c54
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x869a6083
li t1, 0x1c7f9b60
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x869a6084
li t1, -0x1c7f9b61
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb04eee74
li t1, 0x399443cb
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xb04eee75
li t1, -0x399443cc
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4ca15ed2
li t1, 0x7aea0cbd
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x4ca15ed3
li t1, -0x7aea0cbe
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x85487e47
li t1, 0x7f781314
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x85487e48
li t1, -0x7f781315
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf85078f3
li t1, 0xc8d89c79
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xf85078f4
li t1, -0xc8d89c7a
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xaee5296c
li t1, 0xc4aa133f
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xaee5296d
li t1, -0xc4aa1340
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5e44485d
li t1, 0x8e888f38
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x5e44485e
li t1, -0x8e888f39
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc18d41e7
li t1, 0xff47ce9d
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xc18d41e8
li t1, -0xff47ce9e
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x882a53a2
li t1, 0xd6c3a26d
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x882a53a3
li t1, -0xd6c3a26e
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcb0ed396
li t1, 0xa608491d
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xcb0ed397
li t1, -0xa608491e
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe3b65c15
li t1, 0x590da655
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xe3b65c16
li t1, -0x590da656
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x12d9505
li t1, 0x360c0408
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x12d9506
li t1, -0x360c0409
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xed2efe23
li t1, 0x875cd1f5
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xed2efe24
li t1, -0x875cd1f6
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc2f1d5da
li t1, 0x53a5c9e7
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xc2f1d5db
li t1, -0x53a5c9e8
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8a8e0b5
li t1, 0x17922f07
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x8a8e0b6
li t1, -0x17922f08
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6782e93d
li t1, 0x2856977e
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x6782e93e
li t1, -0x2856977f
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcd3a7764
li t1, 0xa7c84f2e
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xcd3a7765
li t1, -0xa7c84f2f
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8982bb13
li t1, 0x2dd311b1
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x8982bb14
li t1, -0x2dd311b2
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe9662e24
li t1, 0x1e036af
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xe9662e25
li t1, -0x1e036b0
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b6c551d
li t1, 0xd2b07950
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x3b6c551e
li t1, -0xd2b07951
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb302629a
li t1, 0x3936d73e
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xb302629b
li t1, -0x3936d73f
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4e5d60df
li t1, 0xc7c9a73c
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x4e5d60e0
li t1, -0xc7c9a73d
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xaec73eaf
li t1, 0xc05755b1
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xaec73eb0
li t1, -0xc05755b2
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf75662a2
li t1, 0x99fbd06
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xf75662a3
li t1, -0x99fbd07
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2336f852
li t1, 0xd563dbb8
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x2336f853
li t1, -0xd563dbb9
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x354213a2
li t1, 0x642e3832
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x354213a3
li t1, -0x642e3833
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x72f1a6c4
li t1, 0x5c3d2173
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x72f1a6c5
li t1, -0x5c3d2174
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x88215480
li t1, 0xa214ba6c
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x88215481
li t1, -0xa214ba6d
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x566a734b
li t1, 0x6cd9edae
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x566a734c
li t1, -0x6cd9edaf
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc4123f9e
li t1, 0x8d0aaaaf
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xc4123f9f
li t1, -0x8d0aaab0
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf423625
li t1, 0x14e20a90
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xcf423626
li t1, -0x14e20a91
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9be8d076
li t1, 0xcba2711a
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9be8d077
li t1, -0xcba2711b
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5df0590f
li t1, 0x48bf502a
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x5df05910
li t1, -0x48bf502b
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3f055019
li t1, 0xcdf7be61
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x3f05501a
li t1, -0xcdf7be62
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7fdbf300
li t1, 0xd69ad66f
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x7fdbf301
li t1, -0xd69ad670
pv.sll.b t2, t0, t1
li t0, 0xaad174f5
li t1, 0x794144c4
add t2, t1, t0
sw t2, 4(sp)
li t0, 0xdeb8f1ea
li t1, 0x9a4c24b4
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a896f52
li t1, 0x9722422b
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0x7280600c
li t1, 0x72e9fd68
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x34db8d2a
li t1, 0x7dd3f3d3
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x7207aa1c
li t1, 0x76469b96
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0x678e9a0c
li t1, 0xd14448b
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0xfac6ddaf
li t1, 0x82177c3d
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0xa6a1e047
li t1, 0xba486c01
or t2, t1, t0
sw t2, 4(sp)
li t0, 0x9466a386
li t1, 0x50cd07cc
and t2, t1, t0
sw t2, 4(sp)
li t0, 0xae80e251
li t1, 0x47ebf709
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xcf4d6357
li t1, 0xaa75ecf7
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x1c8f7a05
li t1, 0x80c2a3f0
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0xaad65503
li t1, 0x50db7cba
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x6048e90c
li t1, 0x2f0aac47
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb63c265
li t1, 0x345687cc
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0xb15d2f82
li t1, 0x78a62c36
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0xbff4ce88
li t1, 0x7b921b0a
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0xe9d2a467
li t1, 0x7da15ec
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0x72a5872d
li t1, 0xd57dc76d
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0x1e31742f
li t1, 0xa3623c8f
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x3fcdd7e4
li t1, 0xae4a24fa
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0xf5637251
li t1, 0x4eb0c4b4
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0x710e323f
li t1, 0x3f644638
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0xde66a25a
li t1, 0x4c1cf735
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0xb9e9af03
li t1, 0xb36dbbb3
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x1f23ceca
li t1, 0x30a2388b
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xc4093dba
li t1, 0x30155b13
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x85aa1f57
li t1, 0x4450c006
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb52efa3e
li t1, 0xa768ada
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x8517373e
li t1, 0x6f252eca
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xea958ce4
li t1, 0x8b46271c
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xdee77e7d
li t1, 0xd4b8e8fe
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xfb8da0d3
li t1, 0x26a10896
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5c9ecde
li t1, 0x10bd1c43
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd96cf0e9
li t1, 0x2bdf74c7
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x93025de1
li t1, 0x5721f265
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa293b13e
li t1, 0x919355ec
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf851b769
li t1, 0x838ba8d0
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbc0d248b
li t1, 0x6b3ee700
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3caad256
li t1, 0x42690cd6
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcabaf6bd
li t1, 0x80305ac6
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x620d2aac
li t1, 0x52f28c3f
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x34412deb
li t1, 0x782fdfee
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbdff18ff
li t1, 0x4a3fcd98
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xac21242b
li t1, 0x6f188b58
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x514dcbd6
li t1, 0x471b18d4
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb84ce8ee
li t1, 0xc2544c2
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x61f8f390
li t1, 0x34afac28
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb99810bc
li t1, 0x9ab8454b
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb849657d
li t1, 0xefa9af4d
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9003d818
li t1, 0xd9f2c5a9
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5df287b2
li t1, 0x3f3cd7ee
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf837bb64
li t1, 0x1dc83140
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x19266d6f
li t1, 0x701c725
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b4aa01a
li t1, 0x8a865885
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9a092a25
li t1, 0x1153f001
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x74149f9d
li t1, 0x32b6531b
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e7af200
li t1, 0xe44f3ab2
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf8f5b745
li t1, 0xba34ad0c
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x693a3a21
li t1, 0xbe9ae867
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x53c08449
li t1, 0xebb4a088
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x27722bd8
li t1, 0x797b8b8b
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5a173
li t1, 0xa79a323
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8590ed99
li t1, 0x8539c509
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f8e7eb6
li t1, 0xb9831573
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7b788b6a
li t1, 0x74bf45df
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6ecbf0cc
li t1, 0x30c0b814
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7baa29b3
li t1, 0x9c921d11
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1e1ae775
li t1, 0x447a75a5
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3c5ce7d9
li t1, 0xaf533863
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9047cf0f
li t1, 0xe6084075
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x87613278
li t1, 0x8f686b72
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x54f60af7
li t1, 0x14570e32
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9481d794
li t1, 0xc37eeee4
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x14be0bd0
li t1, 0xf12b0390
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x28618ca2
li t1, 0x30cd7e08
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb5282750
li t1, 0x589ddc83
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4bf67608
li t1, 0x1decab1d
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3c7feb00
li t1, 0xb62f02de
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9fe2ad5c
li t1, 0xcf076245
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd8cc3d90
li t1, 0x404b058b
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xaca12acd
li t1, 0xffa0e33b
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x439fd6c1
li t1, 0xdae2a27e
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x90b4644d
li t1, 0xbb23c635
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc79c7473
li t1, 0x7bcb2b9b
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf8bd22cc
li t1, 0x5c68b7a8
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4fd423e3
li t1, 0x5cd6a174
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x42f3969d
li t1, 0x687f1009
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xab055653
li t1, 0xd10bfe62
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x276d0f60
li t1, 0x79b24b82
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x900077eb
li t1, 0xacffcd0b
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf43b26f2
li t1, 0x480aa6e2
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xedc98555
li t1, 0x40ec8ede
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4df25c04
li t1, 0x665d5a6d
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x350fe979
li t1, 0x20f7f56f
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd1de1211
li t1, 0xed651590
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x810d2236
li t1, 0x8fb564be
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8bbc5979
li t1, 0xab4bc81e
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x37880c90
li t1, 0x52bb6bf
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8645d4ac
li t1, 0x4318a73a
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xfb7c3b23
li t1, 0x8355306
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x50181066
li t1, 0xc7419dfa
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x88d82801
li t1, 0x302027ec
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6470217
li t1, 0xab7884e5
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x96cfebbd
li t1, 0x8ec04ad3
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x50a18d07
li t1, 0xd31bd376
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4ffb6841
li t1, 0x8bc163a4
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa1892b41
li t1, 0xeb408df4
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4380afce
li t1, 0x26add568
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf4a883c5
li t1, 0xd90ee40d
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x463278c4
li t1, 0x5eddd5e7
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa8f4b7e8
li t1, 0xd6255704
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x24870734
li t1, 0x31b44d85
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x79d8e963
li t1, 0xcd5671dc
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4f2c903
li t1, 0x2f52202e
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfce2724
li t1, 0xe617bbf5
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x16d147c6
li t1, 0xe1c20abd
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x28a67cf
li t1, 0xadb117d2
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x28800a95
li t1, 0xb9e79e87
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xeb7a1d2e
li t1, 0xce2faf38
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xfa80496d
li t1, 0xe1f7b924
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8522c40b
li t1, 0x6099efa0
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xca0b7e0f
li t1, 0x3ec0bb9c
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x93930cbf
li t1, 0x33218042
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdb590c64
li t1, 0xde206e6f
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7e0a8ffd
li t1, 0x354a51e8
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1c2c05aa
li t1, 0xc70dd9df
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8fbecd31
li t1, 0xb114258f
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4589de0c
li t1, 0xb9bfc710
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1ca2279
li t1, 0x23fc8cfe
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8656091c
li t1, 0x87b20d6d
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc80bd017
li t1, 0x2652bba7
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x20419e01
li t1, 0x97ff4874
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xeb3a76ba
li t1, 0xfc220332
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xba20f7e
li t1, 0x3d664d6e
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x89e534c6
addi t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x9b7b575
slti t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x569826f4
sltiu t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xd2b2c29a
xori t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xd0655fb3
ori t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x51498268
andi t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x19b2422f
slli t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xb2870d4c
srli t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xd002ada1
srai t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x3c41b4d0
li t1, 0x178dcb30
p.addN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xa5807dc8
li t1, 0xcfd12921
p.adduN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x84f587e3
li t1, 0xb0f4999
p.addRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x1fcb4497
li t1, 0xcd9a5c85
p.adduRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x7b9ea870
li t1, 0x5bb9fc58
p.subN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xa5a2c6e1
li t1, 0x47364682
p.subuN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x9cb4194a
li t1, 0xfb5d3f4d
p.subRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xb7ab4d62
li t1, 0x8f1a0e56
p.subuRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xa52e508d
p.extract t1, t0, 0x7, 0x2
sw t1, 4(sp)
li t0, 0x5974d5c3
p.extractu t1, t0, 0x3, 0x0
sw t1, 4(sp)
li t0, 0xcc9f5327
p.insert t1, t0, 0x6, 0x2
sw t1, 4(sp)
li t0, 0x70ea1d3a
p.bclr t1, t0, 0x1, 0x1
sw t1, 4(sp)
li t0, 0xadce8fa0
p.bset t1, t0, 0x0, 0x1
sw t1, 4(sp)
li t0, 0xffb9360c
p.clip t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xaa2a0c04
p.clipu t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x4476e009
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x3de42937
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xd661eb51
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x29d66307
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x3e1ee1ac
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x6c859854
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x5b5ffb6b
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x22defe76
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x90449d0f
pv.add.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x9a168e65
pv.add.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xab0d5ab0
pv.sub.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xb4e5af04
pv.sub.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xdcfaa4b8
pv.avg.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x31ace181
pv.avg.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xaabed4e9
pv.avgu.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xcbe09058
pv.avgu.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xd51afb29
pv.min.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x5d100a8d
pv.min.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x483d35a9
pv.minu.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xd815a599
pv.minu.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x44a78e95
pv.max.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x6de66ef2
pv.max.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x1c382859
pv.maxu.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x2dd70f6d
pv.maxu.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x9d01a81
pv.srl.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x48e3e9ed
pv.srl.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x524fe117
pv.sra.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x7b82f7b9
pv.sra.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x97cbca42
pv.sll.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x77520c18
pv.sll.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x4cb45bfa
pv.or.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xef8bf76d
pv.or.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x77081605
pv.xor.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xc5f48b28
pv.xor.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x2f669e6f
pv.and.sci.h t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xee087ca4
pv.and.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x5a14ece5
pv.shuffle.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xb476a4f9
pv.shuffleI0.sci.b t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x437d7875
pv.shuffleI1.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xa50cb999
pv.shuffleI2.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x9b6c2dc4
pv.shuffleI3.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xa15535c2
pv.cmpeq.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xf0495fad
pv.cmpeq.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x2f299ed1
pv.cmpne.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xb215be39
pv.cmpne.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xb2551cf3
pv.cmpgt.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x1408b20
pv.cmpgt.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xf99b736b
pv.cmpge.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xfa17d165
pv.cmpge.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xb58852f9
pv.cmplt.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x6b9fad46
pv.cmplt.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x4d8d7f34
pv.cmple.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xdcf5bcb1
pv.cmple.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xc516d56c
pv.cmpgtu.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xf8a18432
pv.cmpgtu.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xbc1137e7
pv.cmpgeu.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x4c75877d
pv.cmpgeu.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x1dc77beb
pv.cmpltu.sci.h t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xb5e3f4da
pv.cmpltu.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xf875e55c
pv.cmpleu.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x8772aca6
pv.cmpleu.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xd50fc955
pv.sdotup.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x459ed943
pv.sdotup.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x8be978a
pv.sdotusp.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xdfce215f
pv.sdotusp.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xf683f728
pv.sdotsp.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xf551124b
pv.sdotsp.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x22c74886
pv.dotup.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x3db0fc00
pv.dotup.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x744f140e
pv.dotusp.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xde0822aa
pv.dotusp.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x47524458
pv.dotsp.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x4f75958e
pv.dotsp.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, -0x31efc56f
li t1, 0xefcd9eb1
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1c1111a4
li t1, 0xee610195
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5be7853a
li t1, 0x8e67ca35
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3acbb48e
li t1, 0xac41c0e8
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x291f268b
li t1, 0x760fdf74
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x32ef41a1
li t1, 0x38718560
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2480f9d0
li t1, 0x29959dac
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x74ce44f1
li t1, 0xc3cfda15
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5d5ddddb
li t1, 0xbbae7fc3
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x43f1067f
li t1, 0x6b447a5d
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x34135963
li t1, 0x707f1fa3
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x40131beb
li t1, 0x28114ee8
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x38bc9deb
li t1, 0x79ef67a9
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x47cd15f0
li t1, 0x220f3fc6
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5d85cbba
li t1, 0x9ddd7d9e
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5acc8d03
li t1, 0xe0616ba7
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0xbf7c053
li t1, 0x7c1393
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x241676d5
li t1, 0x30f32546
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x7ba82af7
li t1, 0xf767fbc8
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x7303b062
li t1, 0xa2cb9c1d
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x12651941
li t1, 0xd3157ee9
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1fb7b46c
li t1, 0xd9c905af
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6f7c7183
li t1, 0x3f25b19e
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1a377de0
li t1, 0xd3342e85
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x19234aae
li t1, 0xaa191534
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x66f17131
li t1, 0x1f64293f
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5bc9c122
li t1, 0x941b410
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x44c80c6a
li t1, 0xd15b8fb8
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x44c40222
li t1, 0x1e00bb4a
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5c6df659
li t1, 0xbf0a6242
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x7a777fa
li t1, 0xb0e319fb
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x5d1e2e9f
li t1, 0x71f68232
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x63e3457f
li t1, 0x69419c59
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x32c92d2b
li t1, 0xa7d48b4a
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x27e206bd
li t1, 0x5ebe739f
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x1ced568b
li t1, 0x32aa8843
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x6a81bba1
li t1, 0x7f5f17e2
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x5df5f97f
li t1, 0x12b75051
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x2f16d006
li t1, 0xe7efa024
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4222907e
li t1, 0xccc748be
div t2, t1, t0
sw t2, 4(sp)
sw t2, 4(sp)
li t0, 0xa86ca003
li t1, 0x2959b23
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xa86ca004
li t1, -0x2959b24
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x71b2eb6a
li t1, 0xac8d53d4
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x71b2eb6b
li t1, -0xac8d53d5
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6c5a6938
li t1, 0xeb95fc24
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x6c5a6939
li t1, -0xeb95fc25
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb1c93f3b
li t1, 0x2eb2f73a
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xb1c93f3c
li t1, -0x2eb2f73b
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb642d3dd
li t1, 0xe7d2b5e6
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xb642d3de
li t1, -0xe7d2b5e7
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5388877a
li t1, 0xc80e860b
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x5388877b
li t1, -0xc80e860c
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xefbd2b63
li t1, 0x5af40ed
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xefbd2b64
li t1, -0x5af40ee
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfea3a7bd
li t1, 0x1ad59421
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xfea3a7be
li t1, -0x1ad59422
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x718ed614
li t1, 0x164625ee
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x718ed615
li t1, -0x164625ef
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4caff36f
li t1, 0xc58a382f
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x4caff370
li t1, -0xc58a3830
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8b4b309c
li t1, 0xf1b579d3
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x8b4b309d
li t1, -0xf1b579d4
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf4cd1e37
li t1, 0xcc20aa9a
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xf4cd1e38
li t1, -0xcc20aa9b
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x99cff297
li t1, 0x681c4f26
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x99cff298
li t1, -0x681c4f27
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x686b2eab
li t1, 0x2b57a109
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x686b2eac
li t1, -0x2b57a10a
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcadaba1a
li t1, 0xb9a8dd31
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xcadaba1b
li t1, -0xb9a8dd32
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7843e0c0
li t1, 0x5d033936
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x7843e0c1
li t1, -0x5d033937
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8b19ffa1
li t1, 0x7c98cecb
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x8b19ffa2
li t1, -0x7c98cecc
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5352e736
li t1, 0x11b57c6b
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x5352e737
li t1, -0x11b57c6c
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d60bd39
li t1, 0x285c6d6e
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x3d60bd3a
li t1, -0x285c6d6f
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xecc32245
li t1, 0xd4a9031d
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xecc32246
li t1, -0xd4a9031e
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x15102aae
li t1, 0xdea50535
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x15102aaf
li t1, -0xdea50536
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x24a64790
li t1, 0xda22bc1a
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x24a64791
li t1, -0xda22bc1b
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x72668a3d
li t1, 0x72018859
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x72668a3e
li t1, -0x7201885a
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3591f86e
li t1, 0x7439d366
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x3591f86f
li t1, -0x7439d367
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x489924ea
li t1, 0xfd22615c
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x489924eb
li t1, -0xfd22615d
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x2845528d
li t1, 0xcf27506b
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x2845528e
li t1, -0xcf27506c
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf1295ca7
li t1, 0x7dcd2109
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xf1295ca8
li t1, -0x7dcd210a
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd935c292
li t1, 0x6929d730
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xd935c293
li t1, -0x6929d731
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7966a293
li t1, 0xbf8265bf
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x7966a294
li t1, -0xbf8265c0
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb599aa78
li t1, 0x95602197
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xb599aa79
li t1, -0x95602198
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9f562213
li t1, 0xe4c9a5d6
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x9f562214
li t1, -0xe4c9a5d7
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x76cc3216
li t1, 0xe65bc79
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x76cc3217
li t1, -0xe65bc7a
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x691efb8c
li t1, 0xd20278a9
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x691efb8d
li t1, -0xd20278aa
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ca437c
li t1, 0x62415411
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x3ca437d
li t1, -0x62415412
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeecadad
li t1, 0xded1465c
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xeecadae
li t1, -0xded1465d
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbb90db11
li t1, 0x34f20f95
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xbb90db12
li t1, -0x34f20f96
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe65498e2
li t1, 0xfa71a9b2
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xe65498e3
li t1, -0xfa71a9b3
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe4ec29a
li t1, 0x49deeb5e
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xfe4ec29b
li t1, -0x49deeb5f
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4bd40f8d
li t1, 0x6c30d078
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x4bd40f8e
li t1, -0x6c30d079
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xec8f2bd8
li t1, 0x69d5c9e8
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xec8f2bd9
li t1, -0x69d5c9e9
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x880fdf28
li t1, 0x6bfe4183
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x880fdf29
li t1, -0x6bfe4184
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8487361e
li t1, 0x790f2b0a
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x8487361f
li t1, -0x790f2b0b
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9c95f410
li t1, 0xdbce792e
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9c95f411
li t1, -0xdbce792f
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x34e147de
li t1, 0x48fdec1
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x34e147df
li t1, -0x48fdec2
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7d5c0cdc
li t1, 0x6c83387c
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x7d5c0cdd
li t1, -0x6c83387d
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x327c895
li t1, 0x709b876c
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x327c896
li t1, -0x709b876d
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x150912fc
li t1, 0x7218bf60
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x150912fd
li t1, -0x7218bf61
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbaaabdde
li t1, 0x4331fc65
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xbaaabddf
li t1, -0x4331fc66
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a03e5c1
li t1, 0x8d51acd
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x6a03e5c2
li t1, -0x8d51ace
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x171161c9
li t1, 0x17390ab6
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x171161ca
li t1, -0x17390ab7
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8be6094a
li t1, 0x931809b1
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x8be6094b
li t1, -0x931809b2
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2b7848e
li t1, 0x59c3b67
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x2b7848f
li t1, -0x59c3b68
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1a2a986
li t1, 0xdf407d1c
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x1a2a987
li t1, -0xdf407d1d
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd7bb6b3
li t1, 0x5e1ef591
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xd7bb6b4
li t1, -0x5e1ef592
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd7c6fe29
li t1, 0xa3eae2f1
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xd7c6fe2a
li t1, -0xa3eae2f2
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x72fa034c
li t1, 0x22c50b83
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x72fa034d
li t1, -0x22c50b84
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x178636c5
li t1, 0xb133917c
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x178636c6
li t1, -0xb133917d
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5868d70f
li t1, 0x127d2dbe
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x5868d710
li t1, -0x127d2dbf
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc0596ae8
li t1, 0xdf12162b
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xc0596ae9
li t1, -0xdf12162c
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x59c340e0
li t1, 0x880d7b53
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x59c340e1
li t1, -0x880d7b54
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf66334ae
li t1, 0xb991515d
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xf66334af
li t1, -0xb991515e
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8d046048
li t1, 0x4c2eaf16
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x8d046049
li t1, -0x4c2eaf17
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x46dba8f4
li t1, 0xf51440ba
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x46dba8f5
li t1, -0xf51440bb
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x44ea7479
li t1, 0x8fad82eb
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x44ea747a
li t1, -0x8fad82ec
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xbac2a7a8
li t1, 0x79f55907
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xbac2a7a9
li t1, -0x79f55908
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x627f1f33
li t1, 0x3adea684
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x627f1f34
li t1, -0x3adea685
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x866524e0
li t1, 0x20571ffb
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x866524e1
li t1, -0x20571ffc
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x38f95598
li t1, 0x87d36019
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x38f95599
li t1, -0x87d3601a
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x28d6cc71
li t1, 0x1628a4df
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x28d6cc72
li t1, -0x1628a4e0
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d23ac1b
li t1, 0xd36cb09f
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x3d23ac1c
li t1, -0xd36cb0a0
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfdc83022
li t1, 0xdfb75404
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xfdc83023
li t1, -0xdfb75405
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8bb58f4c
li t1, 0xb36c1ae2
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x8bb58f4d
li t1, -0xb36c1ae3
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x271fb8f6
li t1, 0x674b3ccb
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x271fb8f7
li t1, -0x674b3ccc
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf68313b
li t1, 0x507109bb
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xcf68313c
li t1, -0x507109bc
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x42271ab4
li t1, 0xc5b127f0
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x42271ab5
li t1, -0xc5b127f1
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5eb73f3
li t1, 0xb9740944
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x5eb73f4
li t1, -0xb9740945
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc361b6ef
li t1, 0xe900e2df
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xc361b6f0
li t1, -0xe900e2e0
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x91ca004
li t1, 0x5528da41
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x91ca005
li t1, -0x5528da42
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc301f63
li t1, 0xc533174d
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xc301f64
li t1, -0xc533174e
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf223b72e
li t1, 0x2cf7a766
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xf223b72f
li t1, -0x2cf7a767
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x94ada2ac
li t1, 0xafa8332a
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x94ada2ad
li t1, -0xafa8332b
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x87e6a386
li t1, 0xf4b2179d
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x87e6a387
li t1, -0xf4b2179e
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd984a25
li t1, 0xbbdc55af
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xd984a26
li t1, -0xbbdc55b0
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x276cfb74
li t1, 0x282bdb2e
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x276cfb75
li t1, -0x282bdb2f
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xba6d2ae1
li t1, 0x1c7e02eb
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xba6d2ae2
li t1, -0x1c7e02ec
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x176249ca
li t1, 0x974ad00d
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x176249cb
li t1, -0x974ad00e
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa0a83996
li t1, 0xd5db60a8
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xa0a83997
li t1, -0xd5db60a9
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x43ec6dc5
li t1, 0xbf09c17f
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x43ec6dc6
li t1, -0xbf09c180
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x62f55d1e
li t1, 0x201d5ac
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x62f55d1f
li t1, -0x201d5ad
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3dee9c55
li t1, 0x601bfea2
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x3dee9c56
li t1, -0x601bfea3
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x45d3decc
li t1, 0xb633294d
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x45d3decd
li t1, -0xb633294e
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7ce1ccc
li t1, 0xdbc2297c
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x7ce1ccd
li t1, -0xdbc2297d
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe62df8b2
li t1, 0x53b0c2c0
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xe62df8b3
li t1, -0x53b0c2c1
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x24668ae9
li t1, 0x3ae48265
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x24668aea
li t1, -0x3ae48266
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x97353c42
li t1, 0xb3930fde
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x97353c43
li t1, -0xb3930fdf
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xec6b3839
li t1, 0x7cdb9693
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xec6b383a
li t1, -0x7cdb9694
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb03b4035
li t1, 0xf31810aa
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xb03b4036
li t1, -0xf31810ab
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a88ada8
li t1, 0xddac567c
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x6a88ada9
li t1, -0xddac567d
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7cd1c3d7
li t1, 0x29b17f67
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x7cd1c3d8
li t1, -0x29b17f68
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4bc52d4c
li t1, 0xbe8e5e14
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x4bc52d4d
li t1, -0xbe8e5e15
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9be717d9
li t1, 0x3efc57f9
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x9be717da
li t1, -0x3efc57fa
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xde662c27
li t1, 0xb9abd5d
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xde662c28
li t1, -0xb9abd5e
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x629c6aae
li t1, 0x3b94080
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x629c6aaf
li t1, -0x3b94081
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x60024daa
li t1, 0x220ab0a3
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x60024dab
li t1, -0x220ab0a4
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x13bbe678
li t1, 0xed329fbe
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x13bbe679
li t1, -0xed329fbf
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x408ec4b7
li t1, 0xf1001ba1
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x408ec4b8
li t1, -0xf1001ba2
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x73588aac
li t1, 0xdf658f73
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x73588aad
li t1, -0xdf658f74
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb3bf07c5
li t1, 0xfc47f291
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xb3bf07c6
li t1, -0xfc47f292
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x99fa7f5e
li t1, 0x5b706d61
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x99fa7f5f
li t1, -0x5b706d62
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b96bccb
li t1, 0x10f20c22
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x3b96bccc
li t1, -0x10f20c23
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc2f34212
li t1, 0x7654ea38
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xc2f34213
li t1, -0x7654ea39
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x969fd5ec
li t1, 0xae099095
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x969fd5ed
li t1, -0xae099096
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa55eb81d
li t1, 0xcd511a1b
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xa55eb81e
li t1, -0xcd511a1c
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x56d33a66
li t1, 0xf153234c
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x56d33a67
li t1, -0xf153234d
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x5647576a
li t1, 0xbf59daf1
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, -0x5647576b
li t1, -0xbf59daf2
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x1f98c61d
li t1, 0x6e3ed391
p.min t2, t0, t1
sw t2, 4(sp)
li t0, -0x1f98c61e
li t1, -0x6e3ed392
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xa69872a7
li t1, 0x5e11a307
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, -0xa69872a8
li t1, -0x5e11a308
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x36ee07d2
li t1, 0x7d4ef2be
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, -0x36ee07d3
li t1, -0x7d4ef2bf
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d0bd814
li t1, 0x76e467b7
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, -0x3d0bd815
li t1, -0x76e467b8
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x8553a637
li t1, 0x32b0be66
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, -0x8553a638
li t1, -0x32b0be67
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa1d6bb7e
li t1, 0x295ec7b5
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, -0xa1d6bb7f
li t1, -0x295ec7b6
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x865da119
li t1, 0xe2fe284f
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, -0x865da11a
li t1, -0xe2fe2850
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x647a2023
li t1, 0xd6b5b56a
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, -0x647a2024
li t1, -0xd6b5b56b
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc8c18bdb
li t1, 0x19c1d935
and t2, t0, t1
sw t2, 4(sp)
li t0, -0xc8c18bdc
li t1, -0x19c1d936
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xb728d37
li t1, 0x95704ba7
or t2, t0, t1
sw t2, 4(sp)
li t0, -0xb728d38
li t1, -0x95704ba8
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x50d431fe
li t1, 0x8a9857c8
sra t2, t0, t1
sw t2, 4(sp)
li t0, -0x50d431ff
li t1, -0x8a9857c9
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x5f18d865
li t1, 0xd96ea34a
srl t2, t0, t1
sw t2, 4(sp)
li t0, -0x5f18d866
li t1, -0xd96ea34b
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0xc0590d9a
li t1, 0x2b8950a7
xor t2, t0, t1
sw t2, 4(sp)
li t0, -0xc0590d9b
li t1, -0x2b8950a8
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x12a84fd4
li t1, 0x58925726
sltu t2, t0, t1
sw t2, 4(sp)
li t0, -0x12a84fd5
li t1, -0x58925727
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0xacce7bee
li t1, 0x74eecdae
slt t2, t0, t1
sw t2, 4(sp)
li t0, -0xacce7bef
li t1, -0x74eecdaf
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0xd9f96591
li t1, 0x93330dcf
sll t2, t0, t1
sw t2, 4(sp)
li t0, -0xd9f96592
li t1, -0x93330dd0
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xa60fd2a1
li t1, 0xa7a0935f
sub t2, t0, t1
sw t2, 4(sp)
li t0, -0xa60fd2a2
li t1, -0xa7a09360
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x97532992
li t1, 0x61de1be9
add t2, t0, t1
sw t2, 4(sp)
li t0, -0x97532993
li t1, -0x61de1bea
add t2, t0, t1
sw t2, 4(sp)

li t0, 0x4f961737
p.clip t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x8bc206a7
p.clip t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x84080a30
p.clip t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x5f2328d0
p.clipu t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xbc7ef9aa
p.clipu t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x15cca039
p.clipu t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x738feb48
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x5f05cbd4
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0xe35fb5a3
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x275028f9
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xa1a24226
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xcac752d8
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xf5424ac4
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x97934e90
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x1e5b1e7b
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x314bb025
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x845e31e1
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0xe4029080
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0xc1bb5111
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x800cb280
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x69e89db5
p.abs t1, t0
sw t1, 4(sp)
li t0, 0xa9d14c63
p.exths t1, t0
sw t1, 4(sp)
li t0, 0xc0d17b84
p.exths t1, t0
sw t1, 4(sp)
li t0, 0xb7565af1
p.exths t1, t0
sw t1, 4(sp)
li t0, 0xd651437d
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x27860b42
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x194d692c
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0xc98c8b7b
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x81feac3d
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0xd6b489b6
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0xd3899d62
pv.add.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x631ebc88
pv.add.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x4ce74b4b
pv.add.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x39d2cf07
pv.add.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x3078fbac
pv.add.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x60d496fc
pv.add.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xc4889df8
pv.sub.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x9c54a2af
pv.sub.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x32174fae
pv.sub.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x6c1fa91b
pv.sub.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x1b753e6c
pv.sub.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x8f46d634
pv.sub.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xe8911884
pv.maxu.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x1792b166
pv.maxu.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x39eb23d
pv.maxu.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xb6965b01
pv.srl.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xf8b2c23b
pv.srl.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x85266686
pv.srl.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x625dd0b1
pv.shuffleI3.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xff9f92d9
pv.shuffleI3.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xadda1487
pv.shuffleI3.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x3cf324e5
pv.cmpeq.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x576c7e9f
pv.cmpeq.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x53c8c2ba
pv.cmpeq.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xebbfffac
li t1, 0xc4c88db2
add t2, t0, t1
sw t2, 4(sp)
li t0, -0xebbfffad
li t1, -0xc4c88db3
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xcbb062c5
li t1, 0xa6924865
add t2, t0, t1
sw t2, 4(sp)
li t0, -0xcbb062c6
li t1, -0xa6924866
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xd31a1dad
li t1, 0x96e29ceb
add t2, t0, t1
sw t2, 4(sp)
li t0, -0xd31a1dae
li t1, -0x96e29cec
add t2, t0, t1
sw t2, 4(sp)
li t0, 0xe500dc29
li t1, 0x5c89d109
sub t2, t0, t1
sw t2, 4(sp)
li t0, -0xe500dc2a
li t1, -0x5c89d10a
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0xe99d6ea1
li t1, 0xabfc55a
sub t2, t0, t1
sw t2, 4(sp)
li t0, -0xe99d6ea2
li t1, -0xabfc55b
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x9ada146c
li t1, 0x68999feb
sub t2, t0, t1
sw t2, 4(sp)
li t0, -0x9ada146d
li t1, -0x68999fec
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x2da27b39
li t1, 0x48c8f076
sll t2, t0, t1
sw t2, 4(sp)
li t0, -0x2da27b3a
li t1, -0x48c8f077
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x42a23c66
li t1, 0x1be4ccd
sll t2, t0, t1
sw t2, 4(sp)
li t0, -0x42a23c67
li t1, -0x1be4cce
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xb85f67c9
li t1, 0x68f86d96
sll t2, t0, t1
sw t2, 4(sp)
li t0, -0xb85f67ca
li t1, -0x68f86d97
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0xeddfd4bd
li t1, 0xff8bda76
slt t2, t0, t1
sw t2, 4(sp)
li t0, -0xeddfd4be
li t1, -0xff8bda77
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0xfe9a777d
li t1, 0xa3698a55
slt t2, t0, t1
sw t2, 4(sp)
li t0, -0xfe9a777e
li t1, -0xa3698a56
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x38302580
li t1, 0x25716124
slt t2, t0, t1
sw t2, 4(sp)
li t0, -0x38302581
li t1, -0x25716125
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0xf21b7cb2
li t1, 0x125aff7b
sltu t2, t0, t1
sw t2, 4(sp)
li t0, -0xf21b7cb3
li t1, -0x125aff7c
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0xa1c9a4e2
li t1, 0xe61de4f8
sltu t2, t0, t1
sw t2, 4(sp)
li t0, -0xa1c9a4e3
li t1, -0xe61de4f9
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0x113849d5
li t1, 0x425948ef
sltu t2, t0, t1
sw t2, 4(sp)
li t0, -0x113849d6
li t1, -0x425948f0
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0xffdbf44c
li t1, 0xa1566a47
xor t2, t0, t1
sw t2, 4(sp)
li t0, -0xffdbf44d
li t1, -0xa1566a48
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x2ef01a3b
li t1, 0x94669b5a
xor t2, t0, t1
sw t2, 4(sp)
li t0, -0x2ef01a3c
li t1, -0x94669b5b
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0xdedd9893
li t1, 0x894fb06
xor t2, t0, t1
sw t2, 4(sp)
li t0, -0xdedd9894
li t1, -0x894fb07
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x8f14a227
li t1, 0x6e7f673d
srl t2, t0, t1
sw t2, 4(sp)
li t0, -0x8f14a228
li t1, -0x6e7f673e
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0xf9e98c73
li t1, 0x690c5972
srl t2, t0, t1
sw t2, 4(sp)
li t0, -0xf9e98c74
li t1, -0x690c5973
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x73313841
li t1, 0x1ace4950
srl t2, t0, t1
sw t2, 4(sp)
li t0, -0x73313842
li t1, -0x1ace4951
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x15c800db
li t1, 0xb73de6ac
sra t2, t0, t1
sw t2, 4(sp)
li t0, -0x15c800dc
li t1, -0xb73de6ad
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0xafc735e
li t1, 0x82450be
sra t2, t0, t1
sw t2, 4(sp)
li t0, -0xafc735f
li t1, -0x82450bf
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x673e6993
li t1, 0x2a701ee7
sra t2, t0, t1
sw t2, 4(sp)
li t0, -0x673e6994
li t1, -0x2a701ee8
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x6a6c96b0
li t1, 0x94b67a41
or t2, t0, t1
sw t2, 4(sp)
li t0, -0x6a6c96b1
li t1, -0x94b67a42
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x3b693d7b
li t1, 0x20a2f65d
or t2, t0, t1
sw t2, 4(sp)
li t0, -0x3b693d7c
li t1, -0x20a2f65e
or t2, t0, t1
sw t2, 4(sp)
li t0, 0xf197fcd5
li t1, 0xacc4836
or t2, t0, t1
sw t2, 4(sp)
li t0, -0xf197fcd6
li t1, -0xacc4837
or t2, t0, t1
sw t2, 4(sp)
li t0, 0x44912efa
li t1, 0xc6ebc8b5
and t2, t0, t1
sw t2, 4(sp)
li t0, -0x44912efb
li t1, -0xc6ebc8b6
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x6e5d9685
li t1, 0x2bf3f0d8
and t2, t0, t1
sw t2, 4(sp)
li t0, -0x6e5d9686
li t1, -0x2bf3f0d9
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x2a8f0fb3
li t1, 0x3348e706
and t2, t0, t1
sw t2, 4(sp)
li t0, -0x2a8f0fb4
li t1, -0x3348e707
and t2, t0, t1
sw t2, 4(sp)
li t0, 0x9cd43ebd
li t1, 0x180bab00
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, -0x9cd43ebe
li t1, -0x180bab01
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x18cc27ee
li t1, 0x4d0dab54
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, -0x18cc27ef
li t1, -0x4d0dab55
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0x816d2f5d
li t1, 0x18bbed80
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, -0x816d2f5e
li t1, -0x18bbed81
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xcf5719f4
li t1, 0x32d08019
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, -0xcf5719f5
li t1, -0x32d0801a
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa7a738f3
li t1, 0x3280855b
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, -0xa7a738f4
li t1, -0x3280855c
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d4e8439
li t1, 0xe25a4722
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, -0x9d4e843a
li t1, -0xe25a4723
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd8626067
li t1, 0x3da17c75
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, -0xd8626068
li t1, -0x3da17c76
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xbf42b8eb
li t1, 0xf454ad35
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, -0xbf42b8ec
li t1, -0xf454ad36
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf73497ce
li t1, 0xd1f13557
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, -0xf73497cf
li t1, -0xd1f13558
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe17d36b1
li t1, 0x6fa64c0c
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, -0xe17d36b2
li t1, -0x6fa64c0d
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf1dc79ce
li t1, 0x463d8cff
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, -0xf1dc79cf
li t1, -0x463d8d00
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x8d6201e4
li t1, 0x4be6f5d5
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, -0x8d6201e5
li t1, -0x4be6f5d6
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0x9e3669e0
li t1, 0x7260373f
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, -0x9e3669e1
li t1, -0x72603740
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xab0ef340
li t1, 0x18fc1472
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, -0xab0ef341
li t1, -0x18fc1473
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x84a27fa0
li t1, 0x4fb37d04
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, -0x84a27fa1
li t1, -0x4fb37d05
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0xaaced2b5
li t1, 0x2d278b04
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, -0xaaced2b6
li t1, -0x2d278b05
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ddbca9e
li t1, 0xada7ce23
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, -0x3ddbca9f
li t1, -0xada7ce24
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xadae2df3
li t1, 0x41676e35
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, -0xadae2df4
li t1, -0x41676e36
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0x4157d838
li t1, 0xe3f86ff8
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, -0x4157d839
li t1, -0xe3f86ff9
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xdd86e12a
li t1, 0xa4924e7a
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, -0xdd86e12b
li t1, -0xa4924e7b
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xf5b73b76
li t1, 0x1bbfa2e0
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, -0xf5b73b77
li t1, -0x1bbfa2e1
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0x8fdfd520
li t1, 0xb57c976b
p.min t2, t0, t1
sw t2, 4(sp)
li t0, -0x8fdfd521
li t1, -0xb57c976c
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x843862a
li t1, 0xa3a514ad
p.min t2, t0, t1
sw t2, 4(sp)
li t0, -0x843862b
li t1, -0xa3a514ae
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x5018cfdc
li t1, 0x1f45b678
p.min t2, t0, t1
sw t2, 4(sp)
li t0, -0x5018cfdd
li t1, -0x1f45b679
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0x66efee3
li t1, 0x3bc2893
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, -0x66efee4
li t1, -0x3bc2894
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0xb5d01ded
li t1, 0x4458323a
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, -0xb5d01dee
li t1, -0x4458323b
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0x3a46de05
li t1, 0xede2bd0b
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, -0x3a46de06
li t1, -0xede2bd0c
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0xedbae27f
li t1, 0xb08fc29
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xedbae280
li t1, -0xb08fc2a
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x8beab5bd
li t1, 0xfa31cd4f
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x8beab5be
li t1, -0xfa31cd50
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x98e8ecbe
li t1, 0x3ec9013e
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x98e8ecbf
li t1, -0x3ec9013f
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x95dfe3ad
li t1, 0x1154bb0b
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x95dfe3ae
li t1, -0x1154bb0c
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd22d6985
li t1, 0x3b4adbb3
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xd22d6986
li t1, -0x3b4adbb4
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x65182654
li t1, 0x59bec176
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x65182655
li t1, -0x59bec177
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xa7f32ce2
li t1, 0xa995a00a
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xa7f32ce3
li t1, -0xa995a00b
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x2f7f500
li t1, 0x3303fca9
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x2f7f501
li t1, -0x3303fcaa
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xfb7ee1f
li t1, 0x8a635a9c
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xfb7ee20
li t1, -0x8a635a9d
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd08f410d
li t1, 0x60dda162
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xd08f410e
li t1, -0x60dda163
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xaa41f202
li t1, 0xa1c5eee
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xaa41f203
li t1, -0xa1c5eef
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x7359c40f
li t1, 0xb33ee6a4
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x7359c410
li t1, -0xb33ee6a5
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x54bd992c
li t1, 0xb2171538
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x54bd992d
li t1, -0xb2171539
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x7a9862e5
li t1, 0x2bd0a816
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x7a9862e6
li t1, -0x2bd0a817
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xbbb3ac1a
li t1, 0x4849dea3
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xbbb3ac1b
li t1, -0x4849dea4
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe04fd291
li t1, 0xb0ef9d0b
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xe04fd292
li t1, -0xb0ef9d0c
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xca7c25c0
li t1, 0x9619518a
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xca7c25c1
li t1, -0x9619518b
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x751cd93f
li t1, 0xa258a325
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x751cd940
li t1, -0xa258a326
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x39b4e2ec
li t1, 0x99b7c88d
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x39b4e2ed
li t1, -0x99b7c88e
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x229e31d2
li t1, 0x9a40afbb
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x229e31d3
li t1, -0x9a40afbc
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf0033e9b
li t1, 0x90f40c3
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xf0033e9c
li t1, -0x90f40c4
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x1d729362
li t1, 0x5a9b49d9
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x1d729363
li t1, -0x5a9b49da
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x54ea82b1
li t1, 0x45880a6
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x54ea82b2
li t1, -0x45880a7
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6b903aeb
li t1, 0x4ea3dbe8
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x6b903aec
li t1, -0x4ea3dbe9
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x7eb8d554
li t1, 0x92b03a45
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x7eb8d555
li t1, -0x92b03a46
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xbefdf8dd
li t1, 0x143b67e0
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xbefdf8de
li t1, -0x143b67e1
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x81854842
li t1, 0x4f18c46f
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x81854843
li t1, -0x4f18c470
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x972b2dfd
li t1, 0x6108e549
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x972b2dfe
li t1, -0x6108e54a
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x54c73a15
li t1, 0x9accd9ca
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x54c73a16
li t1, -0x9accd9cb
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeabf73cd
li t1, 0xec374e8b
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xeabf73ce
li t1, -0xec374e8c
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x18cf7e1f
li t1, 0xd32db17b
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x18cf7e20
li t1, -0xd32db17c
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x92094fc
li t1, 0x807fa1db
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x92094fd
li t1, -0x807fa1dc
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa61a941a
li t1, 0x5901efb2
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xa61a941b
li t1, -0x5901efb3
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x73e099fa
li t1, 0x324a9f91
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x73e099fb
li t1, -0x324a9f92
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x96ebc046
li t1, 0x7352df15
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x96ebc047
li t1, -0x7352df16
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3c376995
li t1, 0xc9d4fbd5
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x3c376996
li t1, -0xc9d4fbd6
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1007fe2c
li t1, 0xe79c4c1e
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x1007fe2d
li t1, -0xe79c4c1f
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x67f38cc6
li t1, 0x73f8e47a
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x67f38cc7
li t1, -0x73f8e47b
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9d324f6e
li t1, 0xfd0e2f31
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9d324f6f
li t1, -0xfd0e2f32
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xdc0b04bc
li t1, 0xafdf443f
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xdc0b04bd
li t1, -0xafdf4440
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x82e297a3
li t1, 0x834a212b
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x82e297a4
li t1, -0x834a212c
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeacaa2a5
li t1, 0x146c921
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xeacaa2a6
li t1, -0x146c922
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x351c5077
li t1, 0xb2246fd1
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x351c5078
li t1, -0xb2246fd2
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xed86ab67
li t1, 0x7f39d97b
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xed86ab68
li t1, -0x7f39d97c
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3268c493
li t1, 0xf357afad
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x3268c494
li t1, -0xf357afae
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdeaca637
li t1, 0x1b70a702
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xdeaca638
li t1, -0x1b70a703
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x11f0b8eb
li t1, 0x7fd0fc0
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x11f0b8ec
li t1, -0x7fd0fc1
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x31a615d
li t1, 0xf8591b23
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x31a615e
li t1, -0xf8591b24
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x29faceeb
li t1, 0x9897ec21
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x29faceec
li t1, -0x9897ec22
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe523a7ba
li t1, 0x587f6313
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xe523a7bb
li t1, -0x587f6314
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xc85a49ec
li t1, 0x5a1ed2fb
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xc85a49ed
li t1, -0x5a1ed2fc
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8e5e783a
li t1, 0x3e244b04
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x8e5e783b
li t1, -0x3e244b05
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b20c2a6
li t1, 0xcd4f68dc
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x9b20c2a7
li t1, -0xcd4f68dd
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x382c614e
li t1, 0xaa2e4f5d
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x382c614f
li t1, -0xaa2e4f5e
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x355fdf0d
li t1, 0xbfcfd818
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x355fdf0e
li t1, -0xbfcfd819
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xfc284ae0
li t1, 0x2b42ca3a
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xfc284ae1
li t1, -0x2b42ca3b
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xde54a3cd
li t1, 0x8edc1610
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xde54a3ce
li t1, -0x8edc1611
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdbb57959
li t1, 0xa4628ede
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xdbb5795a
li t1, -0xa4628edf
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcc191701
li t1, 0x7a3038b1
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xcc191702
li t1, -0x7a3038b2
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa6029794
li t1, 0x93c9cb32
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xa6029795
li t1, -0x93c9cb33
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa8fb77b9
li t1, 0x3cc0a165
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xa8fb77ba
li t1, -0x3cc0a166
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xecd08009
li t1, 0xe71e888f
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xecd0800a
li t1, -0xe71e8890
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xfda65317
li t1, 0xfbccd1d9
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xfda65318
li t1, -0xfbccd1da
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x453b7596
li t1, 0xfd9ebf86
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x453b7597
li t1, -0xfd9ebf87
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x54a8e5e1
li t1, 0x6eca275f
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x54a8e5e2
li t1, -0x6eca2760
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xce468d00
li t1, 0xe8d2ba47
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xce468d01
li t1, -0xe8d2ba48
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x60756dbd
li t1, 0xd89b4c93
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x60756dbe
li t1, -0xd89b4c94
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x81080681
li t1, 0x60075f8a
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x81080682
li t1, -0x60075f8b
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xa637dbdf
li t1, 0x72896ec8
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xa637dbe0
li t1, -0x72896ec9
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3d6a0d32
li t1, 0x5c8d882b
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x3d6a0d33
li t1, -0x5c8d882c
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x8de151f0
li t1, 0x7819ac6c
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x8de151f1
li t1, -0x7819ac6d
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x81686025
li t1, 0x1d9dcdfc
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x81686026
li t1, -0x1d9dcdfd
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe15abf90
li t1, 0x2dae593d
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xe15abf91
li t1, -0x2dae593e
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd7438a47
li t1, 0x5b779d16
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xd7438a48
li t1, -0x5b779d17
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x626d4294
li t1, 0xc73b2a8b
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x626d4295
li t1, -0xc73b2a8c
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc205607
li t1, 0x858c4e80
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xc205608
li t1, -0x858c4e81
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xd1303f36
li t1, 0x8329419f
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xd1303f37
li t1, -0x832941a0
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x10dd9b9a
li t1, 0x702563d
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x10dd9b9b
li t1, -0x702563e
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x704eee2e
li t1, 0x408bf294
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x704eee2f
li t1, -0x408bf295
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x640fef65
li t1, 0x9ec4e0b2
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x640fef66
li t1, -0x9ec4e0b3
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd930a17f
li t1, 0x33e4d4f8
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xd930a180
li t1, -0x33e4d4f9
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xcad7155a
li t1, 0x434a60e3
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xcad7155b
li t1, -0x434a60e4
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x77e2dc71
li t1, 0xd5beac46
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x77e2dc72
li t1, -0xd5beac47
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x29e18c07
li t1, 0xd94c375f
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x29e18c08
li t1, -0xd94c3760
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x78ed07f4
li t1, 0xce60a255
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x78ed07f5
li t1, -0xce60a256
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x71b4bc06
li t1, 0x54b145ef
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x71b4bc07
li t1, -0x54b145f0
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x89d6a39c
li t1, 0xd45eb13b
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x89d6a39d
li t1, -0xd45eb13c
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe126343e
li t1, 0x541a5cd
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xe126343f
li t1, -0x541a5ce
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xce768008
li t1, 0x4d7b955
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xce768009
li t1, -0x4d7b956
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xc9bf7d24
li t1, 0x3fbd1644
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xc9bf7d25
li t1, -0x3fbd1645
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x39d90096
li t1, 0x1a8773c2
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x39d90097
li t1, -0x1a8773c3
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x5edf4c96
li t1, 0xc4df3acc
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x5edf4c97
li t1, -0xc4df3acd
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x11196fe8
li t1, 0x377e0eca
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x11196fe9
li t1, -0x377e0ecb
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe5819d11
li t1, 0x5a7c6e40
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xe5819d12
li t1, -0x5a7c6e41
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x27a563a3
li t1, 0x6abec9a8
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x27a563a4
li t1, -0x6abec9a9
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xf22757b0
li t1, 0xb52ae2d2
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xf22757b1
li t1, -0xb52ae2d3
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x28b9850c
li t1, 0xe2fcd60c
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x28b9850d
li t1, -0xe2fcd60d
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x819faef9
li t1, 0xb7aaa727
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x819faefa
li t1, -0xb7aaa728
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5f802fdc
li t1, 0x66d0dfb3
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x5f802fdd
li t1, -0x66d0dfb4
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3f839a71
li t1, 0x2fb920a5
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x3f839a72
li t1, -0x2fb920a6
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x357080dd
li t1, 0x475356f5
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x357080de
li t1, -0x475356f6
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdbd8409d
li t1, 0x8b269f29
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xdbd8409e
li t1, -0x8b269f2a
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xabfdc6ed
li t1, 0x31c83563
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xabfdc6ee
li t1, -0x31c83564
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8864401b
li t1, 0x81414f04
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x8864401c
li t1, -0x81414f05
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xd8fb7840
li t1, 0x151d4be6
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xd8fb7841
li t1, -0x151d4be7
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7f434d84
li t1, 0xfd418dca
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x7f434d85
li t1, -0xfd418dcb
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x90dde0a6
li t1, 0xe998abf5
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x90dde0a7
li t1, -0xe998abf6
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3551d30c
li t1, 0x9d94f78a
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x3551d30d
li t1, -0x9d94f78b
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe842d4d3
li t1, 0xbf094b8
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xe842d4d4
li t1, -0xbf094b9
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x57d3e746
li t1, 0xdb65580
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x57d3e747
li t1, -0xdb65581
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdbd73d37
li t1, 0xdd925d5d
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xdbd73d38
li t1, -0xdd925d5e
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xeb728e93
li t1, 0xeb95847c
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xeb728e94
li t1, -0xeb95847d
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x53c188f0
li t1, 0x2bc64b66
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x53c188f1
li t1, -0x2bc64b67
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9e2fd76
li t1, 0x137d006c
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xb9e2fd77
li t1, -0x137d006d
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x24f1288f
li t1, 0x6e293cd6
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x24f12890
li t1, -0x6e293cd7
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9dfb4591
li t1, 0x29864fc7
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9dfb4592
li t1, -0x29864fc8
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c4cf6ad
li t1, 0x8c9c8289
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x1c4cf6ae
li t1, -0x8c9c828a
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9b5a02c8
li t1, 0x5e06c7eb
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9b5a02c9
li t1, -0x5e06c7ec
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xff821a2f
li t1, 0xfa22b853
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xff821a30
li t1, -0xfa22b854
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xe3cff6b8
li t1, 0x62d29ec5
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xe3cff6b9
li t1, -0x62d29ec6
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x491c980d
li t1, 0xbd7fabbf
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x491c980e
li t1, -0xbd7fabc0
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3e59ac46
li t1, 0x1aeb0eca
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x3e59ac47
li t1, -0x1aeb0ecb
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x41eaeab
li t1, 0xa768009a
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x41eaeac
li t1, -0xa768009b
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xdacde3
li t1, 0xbdb70e48
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xdacde4
li t1, -0xbdb70e49
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4fe00c15
li t1, 0x25e1c726
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x4fe00c16
li t1, -0x25e1c727
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x92c4c015
li t1, 0x674cad8
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x92c4c016
li t1, -0x674cad9
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9c3e4c9b
li t1, 0xe7ceca9
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x9c3e4c9c
li t1, -0xe7cecaa
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x6d6f21ea
li t1, 0x927c247
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x6d6f21eb
li t1, -0x927c248
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x3fe22d60
li t1, 0x991d0aac
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x3fe22d61
li t1, -0x991d0aad
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x70255577
li t1, 0x4c878b6a
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x70255578
li t1, -0x4c878b6b
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1a1e6025
li t1, 0x7802bf88
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x1a1e6026
li t1, -0x7802bf89
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x9da56e24
li t1, 0xc2b77fa3
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9da56e25
li t1, -0xc2b77fa4
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x525b9fd5
li t1, 0x3843edcf
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x525b9fd6
li t1, -0x3843edd0
pv.cmpleu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x680fb594
li t1, 0x695c5478
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x680fb595
li t1, -0x695c5479
pv.cmpltu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x5ec4a5fd
li t1, 0x56ff2637
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x5ec4a5fe
li t1, -0x56ff2638
pv.cmpltu.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xa98dfc40
li t1, 0x8e9e3c2
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xa98dfc41
li t1, -0x8e9e3c3
pv.cmpgeu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe0a809c8
li t1, 0xe8e2e143
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xe0a809c9
li t1, -0xe8e2e144
pv.cmpgtu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x785ef83d
li t1, 0x4efc667b
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x785ef83e
li t1, -0x4efc667c
pv.cmple.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x3980b892
li t1, 0x4904e579
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x3980b893
li t1, -0x4904e57a
pv.cmplt.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4608655a
li t1, 0xb4b677f2
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x4608655b
li t1, -0xb4b677f3
pv.cmpge.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x40fe90e4
li t1, 0x86f7bee
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x40fe90e5
li t1, -0x86f7bef
pv.cmpgt.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xac766d9e
li t1, 0x68b93cd6
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xac766d9f
li t1, -0x68b93cd7
pv.cmpne.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x35d0329e
li t1, 0x46fe53ce
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x35d0329f
li t1, -0x46fe53cf
pv.cmpeq.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xb49b7bb2
li t1, 0xa2b14dd6
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xb49b7bb3
li t1, -0xa2b14dd7
pv.cmpeq.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x8929bd7b
li t1, 0x1cb5bf5e
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x8929bd7c
li t1, -0x1cb5bf5f
pv.pack.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x1493f21b
li t1, 0xd8072af5
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x1493f21c
li t1, -0xd8072af6
pv.shuffle.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xaae079b3
li t1, 0x28450603
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xaae079b4
li t1, -0x28450604
pv.and.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xe6da5b0b
li t1, 0xde88dda7
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xe6da5b0c
li t1, -0xde88dda8
pv.xor.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x499cb561
li t1, 0x8f908a24
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x499cb562
li t1, -0x8f908a25
pv.or.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x78cba4f
li t1, 0xa86d5406
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x78cba50
li t1, -0xa86d5407
pv.sll.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xee608cd9
li t1, 0x989b2be2
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xee608cda
li t1, -0x989b2be3
pv.sra.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xaf9a1d90
li t1, 0xaf138b19
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xaf9a1d91
li t1, -0xaf138b1a
pv.srl.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x51d2529f
li t1, 0x63ae26cd
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x51d252a0
li t1, -0x63ae26ce
pv.maxu.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb5097217
li t1, 0xeeac5c83
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xb5097218
li t1, -0xeeac5c84
pv.max.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x7133ae94
li t1, 0x8840ec08
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x7133ae95
li t1, -0x8840ec09
pv.minu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x1c3aa07e
li t1, 0xfa6984b2
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x1c3aa07f
li t1, -0xfa6984b3
pv.min.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x4812cd2
li t1, 0x4a85f03e
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x4812cd3
li t1, -0x4a85f03f
pv.avgu.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x79bd2ed4
li t1, 0x1c517b56
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x79bd2ed5
li t1, -0x1c517b57
pv.avgu.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x32a46903
li t1, 0xd9977e60
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x32a46904
li t1, -0xd9977e61
pv.avg.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x9672f6a
li t1, 0x765f6be6
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x9672f6b
li t1, -0x765f6be7
pv.avg.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x98241deb
li t1, 0xb56b7db7
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x98241dec
li t1, -0xb56b7db8
pv.avg.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x2eff137a
li t1, 0xbd9c977c
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x2eff137b
li t1, -0xbd9c977d
pv.sub.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x4e53fe22
li t1, 0x9564c5ba
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x4e53fe23
li t1, -0x9564c5bb
pv.sub.b t2, t0, t1
sw t2, 4(sp)
li t0, 0xf4fab434
li t1, 0xddda1d53
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0xf4fab435
li t1, -0xddda1d54
pv.sub.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x88235130
li t1, 0xabedc6ba
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x88235131
li t1, -0xabedc6bb
pv.sub.h t2, t0, t1
sw t2, 4(sp)
li t0, 0xb8b4472a
li t1, 0xeb51bebc
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, -0xb8b4472b
li t1, -0xeb51bebd
pv.add.sc.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x80967a4f
li t1, 0x77886be4
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, -0x80967a50
li t1, -0x77886be5
pv.add.b t2, t0, t1
sw t2, 4(sp)
li t0, 0x57614b23
li t1, 0x4579044e
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x57614b24
li t1, -0x4579044f
pv.add.sc.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x94a053
li t1, 0xdf0dd1bd
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, -0x94a054
li t1, -0xdf0dd1be
pv.add.h t2, t0, t1
sw t2, 4(sp)
li t0, 0x6c97ce6f
li t1, 0x5882b25a
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x6c97ce70
li t1, -0x5882b25b
p.subuRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x3e0d3998
li t1, 0xcedf7d33
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x3e0d3999
li t1, -0xcedf7d34
p.subRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xf5424b8d
li t1, 0xf3b1348a
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xf5424b8e
li t1, -0xf3b1348b
p.subuNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x6cdd73d5
li t1, 0x3ca8ebaa
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x6cdd73d6
li t1, -0x3ca8ebab
p.subNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x39862d85
li t1, 0x399a6dd8
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x39862d86
li t1, -0x399a6dd9
p.addRNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xb9e42d11
li t1, 0xcc7c2c9f
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, -0xb9e42d12
li t1, -0xcc7c2ca0
p.adduNr t2, t0, t1
sw t2, 4(sp)
li t0, 0x3ae2ddd1
li t1, 0xca7d0ada
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, -0x3ae2ddd2
li t1, -0xca7d0adb
p.addNr t2, t0, t1
sw t2, 4(sp)
li t0, 0xc24f5140
li t1, 0x1c1912a9
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, -0xc24f5141
li t1, -0x1c1912aa
p.maxu t2, t0, t1
sw t2, 4(sp)
li t0, 0xd077b65b
li t1, 0xadbf1f36
p.min t2, t0, t1
sw t2, 4(sp)
li t0, -0xd077b65c
li t1, -0xadbf1f37
p.min t2, t0, t1
sw t2, 4(sp)
li t0, 0xc8aa9d6e
li t1, 0x7aca53f2
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, -0xc8aa9d6f
li t1, -0x7aca53f3
p.sletu t2, t0, t1
sw t2, 4(sp)
li t0, 0xc5dcc38
li t1, 0x481df645
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, -0xc5dcc39
li t1, -0x481df646
p.slet t2, t0, t1
sw t2, 4(sp)
li t0, 0xda0895c8
li t1, 0xb617b08a
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, -0xda0895c9
li t1, -0xb617b08b
p.ror t2, t0, t1
sw t2, 4(sp)
li t0, 0x1e39a95a
li t1, 0x84b6673e
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, -0x1e39a95b
li t1, -0x84b6673f
p.bsetr t2, t0, t1
sw t2, 4(sp)
li t0, 0xe710d417
li t1, 0x1f95f160
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, -0xe710d418
li t1, -0x1f95f161
p.bclrr t2, t0, t1
sw t2, 4(sp)
li t0, 0x768a29fc
li t1, 0x4783c2be
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, -0x768a29fd
li t1, -0x4783c2bf
p.insertr t2, t0, t1
sw t2, 4(sp)
li t0, 0xd038a480
li t1, 0x20887348
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, -0xd038a481
li t1, -0x20887349
p.extractr t2, t0, t1
sw t2, 4(sp)
li t0, 0xeeb330f7
li t1, 0xeef175d3
and t2, t0, t1
sw t2, 4(sp)
li t0, -0xeeb330f8
li t1, -0xeef175d4
and t2, t0, t1
sw t2, 4(sp)
li t0, 0xaf009a77
li t1, 0xc77f71a1
or t2, t0, t1
sw t2, 4(sp)
li t0, -0xaf009a78
li t1, -0xc77f71a2
or t2, t0, t1
sw t2, 4(sp)
li t0, 0xfc40705
li t1, 0xedc7b6f9
sra t2, t0, t1
sw t2, 4(sp)
li t0, -0xfc40706
li t1, -0xedc7b6fa
sra t2, t0, t1
sw t2, 4(sp)
li t0, 0x5d954b3
li t1, 0x59c6b66
srl t2, t0, t1
sw t2, 4(sp)
li t0, -0x5d954b4
li t1, -0x59c6b67
srl t2, t0, t1
sw t2, 4(sp)
li t0, 0x3faaf98b
li t1, 0x9bd62485
xor t2, t0, t1
sw t2, 4(sp)
li t0, -0x3faaf98c
li t1, -0x9bd62486
xor t2, t0, t1
sw t2, 4(sp)
li t0, 0x6ce16b73
li t1, 0xe9e86ce6
sltu t2, t0, t1
sw t2, 4(sp)
li t0, -0x6ce16b74
li t1, -0xe9e86ce7
sltu t2, t0, t1
sw t2, 4(sp)
li t0, 0xefa9bc7
li t1, 0x23149766
slt t2, t0, t1
sw t2, 4(sp)
li t0, -0xefa9bc8
li t1, -0x23149767
slt t2, t0, t1
sw t2, 4(sp)
li t0, 0x368b6d1e
li t1, 0x9384c14f
sll t2, t0, t1
sw t2, 4(sp)
li t0, -0x368b6d1f
li t1, -0x9384c150
sll t2, t0, t1
sw t2, 4(sp)
li t0, 0x9847faaf
li t1, 0xddb7f08e
sub t2, t0, t1
sw t2, 4(sp)
li t0, -0x9847fab0
li t1, -0xddb7f08f
sub t2, t0, t1
sw t2, 4(sp)
li t0, 0x4876fd82
li t1, 0x585dcdc3
add t2, t0, t1
sw t2, 4(sp)
li t0, -0x4876fd83
li t1, -0x585dcdc4
add t2, t0, t1
sw t2, 4(sp)

li t0, 0xefcb37bd
li t1, 0xc0a1b0f9
add t2, t1, t0
sw t2, 4(sp)
li t0, 0x2286783c
li t1, 0x10570faf
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x7e52cc1a
li t1, 0xf507af1
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0xa38861ae
li t1, 0x375d5062
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x1d24e101
li t1, 0x6b1ce709
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x5dc31e73
li t1, 0x9732783e
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0x36dbcd7c
li t1, 0x29a74291
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0x2056cad9
li t1, 0x8df3faee
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f2e67dc
li t1, 0x22e03568
or t2, t1, t0
sw t2, 4(sp)
li t0, 0xd423e586
li t1, 0xbe82b8f7
and t2, t1, t0
sw t2, 4(sp)
li t0, 0xe596721c
li t1, 0xcb079b5c
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2d89bb7
li t1, 0xd20cbd9a
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0x8520f946
li t1, 0xecad117
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0xe1475323
li t1, 0xef2cd7bc
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0xc21f0786
li t1, 0xc0874a77
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0xc599d23d
li t1, 0x430386f
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0xa4169db1
li t1, 0xa69ce6ff
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x8807a50
li t1, 0xed422be4
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x2d586ec0
li t1, 0x7719227b
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0x52139e45
li t1, 0x163089ee
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0xeafbf73d
li t1, 0xac7a827d
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0x39678cd2
li t1, 0x7bfe03d6
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x8cba6d68
li t1, 0xc6b01dc0
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xff045f8c
li t1, 0xc055c8e4
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xe302caf7
li t1, 0x45236430
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xf8be27e
li t1, 0xa918653
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x9b458cf0
li t1, 0x29298cfc
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fa8bf86
li t1, 0xd6891102
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x13237e0b
li t1, 0x376579e
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xaec7286e
li t1, 0x30ec07f3
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x58bade3
li t1, 0xe4c5f42c
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e21944f
li t1, 0x3632766
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3bb9263d
li t1, 0xf7217f8d
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f8e9dcc
li t1, 0x5a384a4b
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x80bb5856
li t1, 0xe1790478
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf01052ec
li t1, 0xde6a68f2
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a974944
li t1, 0x31ad98be
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3881662f
li t1, 0x7a3c4726
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5d32344
li t1, 0xd3d1bf87
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe1af9ff0
li t1, 0x2865d41
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7d835a32
li t1, 0xb675ad7a
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x131960c7
li t1, 0x60b1d880
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa6efc5e2
li t1, 0x83ed7708
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b05ce9a
li t1, 0xc832b561
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbd0f88a4
li t1, 0x5147a3eb
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x30527e8e
li t1, 0xebb13ec6
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x67d3fcc0
li t1, 0x6dbc0b37
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xfa598f2
li t1, 0x252122d0
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf676b8e
li t1, 0x5c6d6898
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1cc9162d
li t1, 0xd3076203
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4a8e3658
li t1, 0x13dd5d06
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xae504e03
li t1, 0x335c2cd1
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x51c0133c
li t1, 0x1176c8d1
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x37b6cd28
li t1, 0x700d7870
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6fe1d4c6
li t1, 0xdf82be15
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x275b191e
li t1, 0x6cb9b7ab
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2db4013e
li t1, 0x6c935d79
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xddfd62b0
li t1, 0x5adfc2ab
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x524f190c
li t1, 0x6efc219
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f990892
li t1, 0xa5dd9916
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc66a4d0
li t1, 0xe4202b48
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x90d7abe3
li t1, 0x70897440
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xce2907f8
li t1, 0xf5e36e3e
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3a2a03bf
li t1, 0x9381a4a1
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb3899e8
li t1, 0x69cad57
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3838c684
li t1, 0xb5bde0cf
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6824b0e
li t1, 0xfd8ba736
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x24149356
li t1, 0x7f95ed97
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d723b3
li t1, 0x1cbca998
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xaea210dd
li t1, 0xfbb0af00
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc75941e5
li t1, 0xa52bffc6
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x10d2d7bb
li t1, 0x1ca74e1
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a92a2be
li t1, 0x49aa1e77
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbb9e9ca5
li t1, 0xd7643283
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9d5f0d6d
li t1, 0xf5abe053
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x499bfe07
li t1, 0x7257cd24
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x909add3f
li t1, 0x5dfb27d5
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2da81eba
li t1, 0xcdd1053a
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe4f5c46f
li t1, 0xfefba3b4
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x96f7bf25
li t1, 0x1339ef63
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x929119a0
li t1, 0xf43879b5
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc5cdb034
li t1, 0x3e7bef4a
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5866867
li t1, 0x297c2431
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2b6d35dd
li t1, 0x462c14b1
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd92247d0
li t1, 0xcae7bea6
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xdf0140bf
li t1, 0xce1a5922
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbbd37a0d
li t1, 0x29eba218
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x70389853
li t1, 0x646b8403
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7ab875ef
li t1, 0xde2c9185
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1cf9da00
li t1, 0x82e6acf5
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x28a999db
li t1, 0x9b56f338
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xdd5fa2a5
li t1, 0x4cccf084
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3b07d80e
li t1, 0x8330e1bc
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1d49c399
li t1, 0x53b80a0
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb0330c7f
li t1, 0x44d0c86
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x75a27d1
li t1, 0xe3b0acec
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5ef777f
li t1, 0x8e17bc4c
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6d54b369
li t1, 0x5643391b
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x486ffc72
li t1, 0x2ce75d90
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7e5703fb
li t1, 0x90e3f93e
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc2daeae2
li t1, 0x38088de0
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdc3532a1
li t1, 0x7a25452f
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe357aab1
li t1, 0x11c72902
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x738e1064
li t1, 0x7a3a8b11
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x59d1109e
li t1, 0xd37aef73
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1ca6bbf9
li t1, 0x766d19d7
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xef94ad82
li t1, 0xcf477372
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd6141f6a
li t1, 0xf4500005
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5bc8d326
li t1, 0xd49f0ae5
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2b180e90
li t1, 0x832fb1f6
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8fff4bb4
li t1, 0xde81e629
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x50e55a08
li t1, 0x76534c3d
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb95ca0a7
li t1, 0xe89ea9c0
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb7077aca
li t1, 0x470d3290
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe9777010
li t1, 0xef74ceb8
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x14babd81
li t1, 0xcb84b531
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd805c886
li t1, 0x9fc16727
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x719ec45c
li t1, 0x37c670f7
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x886d434e
li t1, 0xaa23fbee
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa316c9c0
li t1, 0x8c519011
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3f51a14a
li t1, 0x61b022d9
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x264e24f4
li t1, 0x25cc1070
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9618bca9
li t1, 0x1c0a7814
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2221dfb3
li t1, 0x9e193ac3
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe6bacbd2
li t1, 0x81509e49
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf551bf0
li t1, 0x24718a4d
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9c8a3699
li t1, 0x4c509a06
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe0b8ade8
li t1, 0x5a3fb437
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x588227eb
li t1, 0x53c087c9
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe3a1d849
li t1, 0xc81bcc55
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x19e129d7
li t1, 0x3775d07e
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x61d7cfc8
li t1, 0x2c33925d
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4bb2a959
addi t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x835da120
slti t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xcf930bd0
sltiu t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xbeee4580
xori t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xda33bf02
ori t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x94af3012
andi t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x4cca817d
slli t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x19ca13c3
srli t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x64dbe0c8
srai t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xc839e02f
li t1, 0xbd5c540c
p.addN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xe45c92b8
li t1, 0x1700031b
p.adduN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x7a07e9d1
li t1, 0x4db053d2
p.addRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xc3234ae2
li t1, 0xe1117e7d
p.adduRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x38a1a969
li t1, 0x5d37e19f
p.subN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x1d7d4966
li t1, 0xa5213577
p.subuN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x751f8650
li t1, 0x7f90b356
p.subRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x897a1dab
li t1, 0xdfa25478
p.subuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x7ff315aa
p.extract t1, t0, 0x3, 0x1
sw t1, 4(sp)
li t0, 0xd0fc0657
p.extractu t1, t0, 0x6, 0x2
sw t1, 4(sp)
li t0, 0x474b62
p.insert t1, t0, 0x7, 0x1
sw t1, 4(sp)
li t0, 0x623104c7
p.bclr t1, t0, 0x2, 0x2
sw t1, 4(sp)
li t0, 0x231576fd
p.bset t1, t0, 0x7, 0x3
sw t1, 4(sp)
li t0, 0x39a76a4d
p.clip t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xe113e7b4
p.clipu t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xf44d9ee4
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x47206905
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xfdd29447
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x950ea43a
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x1bc2414f
p.abs t1, t0
sw t1, 4(sp)
li t0, 0xd3a053a5
p.exths t1, t0
sw t1, 4(sp)
li t0, 0xd0d59e8
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x38960fd0
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0xfabce179
pv.add.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x6dd0ddb2
pv.add.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x6bec4f59
pv.sub.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xc6bc2d5
pv.sub.sci.b t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x617f44bc
pv.avg.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x135048b6
pv.avg.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x34cc720f
pv.avgu.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x908a766a
pv.avgu.sci.b t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xa8067148
pv.min.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xd27638c9
pv.min.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x4cce9158
pv.minu.sci.h t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xf306f702
pv.minu.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x8135c3b1
pv.max.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xab2fd68f
pv.max.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xcda6dba3
pv.maxu.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x14c981dd
pv.maxu.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xb3ecb2e1
pv.srl.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x8db883a8
pv.srl.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x53c3907c
pv.sra.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xcffbf1d9
pv.sra.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xa14c2403
pv.sll.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x2b30f71f
pv.sll.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x1e0c27ed
pv.or.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x9f3ee275
pv.or.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x3592c0e7
pv.xor.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x651fd4b4
pv.xor.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xc7207654
pv.and.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x1c0f854e
pv.and.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x423f24e8
pv.shuffle.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x54990b10
pv.shuffleI0.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x52d678aa
pv.shuffleI1.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xe23a8377
pv.shuffleI2.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x313ee97c
pv.shuffleI3.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xc9e30858
pv.cmpeq.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xfc31e320
pv.cmpeq.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x8cbcb3d
pv.cmpne.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xfa4b5ad6
pv.cmpne.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x1ce09385
pv.cmpgt.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x40a73c3d
pv.cmpgt.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x735648cf
pv.cmpge.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xf3dc8bdf
pv.cmpge.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xd8fff480
pv.cmplt.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xb71fee86
pv.cmplt.sci.b t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xfc398e36
pv.cmple.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x1b5c010a
pv.cmple.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xdaaa5832
pv.cmpgtu.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x4a4b3bd2
pv.cmpgtu.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x87d4a001
pv.cmpgeu.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xf0a3bc2d
pv.cmpgeu.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xf3b31732
pv.cmpltu.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xe64a51fd
pv.cmpltu.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x9ed26f98
pv.cmpleu.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x6394b670
pv.cmpleu.sci.b t1, t0, 0x5
sw t1, 4(sp)

li t0, 0x1da05
li t1, 0x11f1c6
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x8000eb1c
li t1, 0x545639d
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x1001e006
li t1, 0x7759b384
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x2000
li t1, 0xbf433578
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x407e283d
li t1, 0xc2c8ccfe
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xe1c97b61
li t1, 0x59500cfa
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xd930f
li t1, 0x5c58c497
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xde830009
li t1, 0x81470798
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x2401a400
li t1, 0xc334473
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xf903f366
li t1, 0x38340b92
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xc0279
li t1, 0xb15f2f9f
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xe180029d
li t1, 0x560f826d
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x2c162c16
li t1, 0xfff6fff6
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x7fe1ca0d
li t1, 0xc5b2f22c
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x56f8241c
li t1, 0xf6c82e5f
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x75df0349
li t1, 0x2838002a
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xc17a939f
li t1, 0xa20b18b8
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x1e594457
li t1, 0x3ad34c43
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xc0172ff7
li t1, 0x800e06d8
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x8fc00f9
li t1, 0xfc08f403
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xf1007c03
li t1, 0xe8f00e6e
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x87965115
li t1, 0xceb4db12
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x7b77242
li t1, 0x5cb4c68f
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x426a1e5e
li t1, 0xace59940
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xfc439910
li t1, 0x86afc6dd
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xa09439fb
li t1, 0x1dcd3c68
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x7408c6f5
li t1, 0x2f886163
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x4eb6975a
li t1, 0x1d84513a
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xa4704d98
li t1, 0x81465a5
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x14033033
li t1, 0xd7c48a03
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x144cc7a
li t1, 0xa07b8ee7
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xa348262f
li t1, 0xd1578519
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e00300c
li t1, 0xc0f1001c
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x10e04423
li t1, 0x309e1067
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x425165e2
li t1, 0x91e62cf
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xefc0d0b5
li t1, 0xab4ff92e
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x391c0f1f
li t1, 0x813419d2
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4293a0d
li t1, 0xea918e39
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xc003f09f
li t1, 0xca1aa07e
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x7debeecc
li t1, 0x5205cc5
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x708a51c
li t1, 0xf9b497ba
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xcb882555
li t1, 0x67ff33ea
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x3820082
li t1, 0x7cd8e8b5
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5c40026
li t1, 0xb3ff8a05
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x7e5a0976
li t1, 0x96988076
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xf3433f81
li t1, 0x12403c32
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x8113803c
li t1, 0x2209d585
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x38e767d0
li t1, 0xc7882043
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x7b8473c
li t1, 0x412606cd
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xe310f004
li t1, 0x6910324e
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xf96cc64
li t1, 0x31814352
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x415ef07
li t1, 0x3c30964c
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b103f06
li t1, 0x828473c8
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x4745866f
li t1, 0xc190b14c
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x5761930a
li t1, 0x1d41afc1
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0xc1c14114
li t1, 0x8084670
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x2800090c
li t1, 0x45840104
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x3de9b7e
li t1, 0x3b1805cc
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f2b001d
li t1, 0xc30703c3
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x7120708
li t1, 0x26b7d81e
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x9f2c00ee
li t1, 0xa34fb618
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0xc01d320d
li t1, 0x28c65d3a
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x8110e35
li t1, 0xb003c223
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x14441084
li t1, 0x5c2e6a9c
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x10001
li t1, 0x23be2824
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x10000
li t1, 0xe83d1cdc
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x80461719
li t1, 0x91df1410
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5dceb84
li t1, 0x741c8e6e
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x40af25bf
li t1, 0xeb51a228
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x3957a2ca
li t1, 0xd2375beb
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x20dbbcec
li t1, 0xd616f934
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x5712066d
li t1, 0x8122b129
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x10e1f045
li t1, 0x48b554ba
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x6030d43e
li t1, 0x28a84448
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x870f822
li t1, 0xa45aaa5d
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0xb0186a1f
li t1, 0x14542224
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x84b45222
li t1, 0x71937d0e
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x93b5e207
li t1, 0x62130dce
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x2ee75c37
li t1, 0xa0e47100
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x1185c62
li t1, 0x477c54c9
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x9673ae13
li t1, 0xd0723939
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x301f6195
li t1, 0x481dd7c4
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x5c8768f4
li t1, 0x5c0e018f
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x16c57c5f
li t1, 0xa72ce90e
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x358a15f
li t1, 0x299bd84b
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x26e84690
li t1, 0x9dcfa69b
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x871d1214
li t1, 0xc7fa5cb7
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x3efedbf7
li t1, 0xbe0151
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xc53fcbb0
li t1, 0x30ca9ec8
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x32f59544
li t1, 0xce06d2b4
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xe42ea762
li t1, 0x4b52fff7
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x197acaa2
li t1, 0x6703695a
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x721753b1
li t1, 0x25a97ffb
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x21379dee
li t1, 0x7dd866b1
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x3fbaeb62
li t1, 0xc1e30f6e
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x109bcef7
li t1, 0x3eec3358
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fdd75b1
li t1, 0x60f187b7
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xa5c71fc4
li t1, 0xd12fcbb0
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x95ff862
li t1, 0xe34f7348
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2e38fe2
li t1, 0x6897e5d8
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x4affc31
li t1, 0x71a7b9a4
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xe971c7f1
li t1, 0x344bf2ec
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x11b8cfd
li t1, 0x272f8359
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0xc6990c92
li t1, 0x3780f3c7
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0x11ad4087
li t1, 0x88568844
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0x6355b795
li t1, 0x1b8ae031
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0x4137f4b7
li t1, 0xc5d415b2
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0x31ab778d
li t1, 0x88e1a102
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0x8554c923
li t1, 0xe0a238dd
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0x18190a86
li t1, 0xe54c7ef9
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0xb33fc1a
li t1, 0x1904fc04
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0xca7ff02
li t1, 0x511ed846
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0xce1c2cf7
li t1, 0xe492cfc5
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0x86de2899
li t1, 0x3368be1
p.mac t2, t1, t0
sw t2, 4(sp)
li t0, 0x2cbdafcf
li t1, 0x136b6f4d
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0x436e3458
li t1, 0x85990085
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0x14700d3a
li t1, 0x8c0005d3
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0x213a340e
li t1, 0x6132a8bc
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0xc094c4e7
li t1, 0xaee18cc0
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0x109d9e02
li t1, 0x30bd5452
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0xe0578c80
li t1, 0xd754c310
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0x8c3a326
li t1, 0x3be28a1c
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0xbbbd316e
li t1, 0x83a4da47
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0x4652d03
li t1, 0x1df1373e
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0x5dcc8c4f
li t1, 0x4148439f
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0x330b8c2
li t1, 0x8ef8a2a6
p.msu t2, t1, t0
sw t2, 4(sp)
li t0, 0x2ee75c37
li t1, 0xa0e47100
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0x1185c62
li t1, 0x477c54c9
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0x9673ae13
li t1, 0xd0723939
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0x301f6195
li t1, 0x481dd7c4
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0x5c8768f4
li t1, 0x5c0e018f
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0x16c57c5f
li t1, 0xa72ce90e
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0x358a15f
li t1, 0x299bd84b
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0x26e84690
li t1, 0x9dcfa69b
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0x871d1214
li t1, 0xc7fa5cb7
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0x3efedbf7
li t1, 0xbe0151
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0xc53fcbb0
li t1, 0x30ca9ec8
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0x32f59544
li t1, 0xce06d2b4
p.mulhhs t2, t1, t0
sw t2, 4(sp)
li t0, 0xe42ea762
li t1, 0x4b52fff7
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0x197acaa2
li t1, 0x6703695a
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0x721753b1
li t1, 0x25a97ffb
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0x21379dee
li t1, 0x7dd866b1
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0x3fbaeb62
li t1, 0xc1e30f6e
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0x109bcef7
li t1, 0x3eec3358
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fdd75b1
li t1, 0x60f187b7
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0xa5c71fc4
li t1, 0xd12fcbb0
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0x95ff862
li t1, 0xe34f7348
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2e38fe2
li t1, 0x6897e5d8
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0x4affc31
li t1, 0x71a7b9a4
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0xe971c7f1
li t1, 0x344bf2ec
p.muls t2, t1, t0
sw t2, 4(sp)
li t0, 0x257fe18
li t1, 0xb8d3dcd2
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0xd94951c7
li t1, 0xd4579172
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0x92fd180a
li t1, 0xe1d428c
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0xc113f51c
li t1, 0xa467c7a9
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0xc57c1c61
li t1, 0x54989fee
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0x6089fa8e
li t1, 0x5233e3d4
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0xe2be0e30
li t1, 0xaa4c4ff7
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0x9dce05f8
li t1, 0x674023f6
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0x77ee45a2
li t1, 0x6119768
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0x4ee702fc
li t1, 0x33a011fb
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0xbbf722d1
li t1, 0x308cbb4
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0xaf979c1
li t1, 0x5789dae1
p.mulu t2, t1, t0
sw t2, 4(sp)
li t0, 0xdb4ad3d2
li t1, 0xd2b3d549
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x28f6445f
li t1, 0xe59d3f6c
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b142b53
li t1, 0x3a6e5a37
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x147b222f
li t1, 0xf2ce9fb6
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x358a15a9
li t1, 0x9d372d1b
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a3d9117
li t1, 0xf9674fdb
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x9ac50ad4
li t1, 0xce9b968d
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x451ec88b
li t1, 0xfcb3a7ed
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d62856a
li t1, 0x674dcb46
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0xa28f6445
li t1, 0xfe59d3f6
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x26b142b5
li t1, 0x33a6e5a3
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x7ccd4a9d
li t1, 0xb1753be7
p.mulhhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x15e9e3e0
li t1, 0xcae4c242
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0x93ec5df1
li t1, 0x96e34fef
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0x8c45b34a
li t1, 0x3645d1b2
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0xe47cd647
li t1, 0x852875eb
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0xc0939b1f
li t1, 0x4815584a
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0xf23e6b23
li t1, 0xc2943af5
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0x6049cd8f
li t1, 0xa40aac25
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0xd495cd2e
li t1, 0xaf13cf66
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0xb695a47d
li t1, 0x8132e681
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0xea4ae697
li t1, 0x5789e7b3
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0xdb4ad23e
li t1, 0xc0997340
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0xd8af8bf4
li t1, 0xe59d21c5
pv.dotup.h   t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b142ba5
li t1, 0x337b0933
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0x6c57c5fa
li t1, 0x72ce90e2
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0x358a15d2
li t1, 0x99bd8499
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0xb62be2fd
li t1, 0x39674871
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0x1ac50ae9
li t1, 0x4cdec24c
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0x5b15f17e
li t1, 0x9cb3a438
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0xd628574
li t1, 0xa66f6126
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0x4436376c
li t1, 0x7c4c2415
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0xb9f9c85f
li t1, 0x1b4e61ca
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0xa21b1bb6
li t1, 0x3e26120a
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0x5cfce42f
li t1, 0x8da730e5
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0x153bbab7
li t1, 0x635f2d10
pv.dotup.sc.h    t2, t1, t0
sw t2, 4(sp)
li t0, 0x1787ba48
li t1, 0xdd9df9b8
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x4eabea37
li t1, 0xcde3b29d
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0xb23a157b
li t1, 0x75809d16
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x6367d009
li t1, 0x9abdf901
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x69fcdad6
li t1, 0xa108c1c1
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x31b1e13b
li t1, 0xcd5efead
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0xb0726171
li t1, 0x50c717a0
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x5ceec7f1
li t1, 0x9ae35b43
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0xe1c0f8e7
li t1, 0xb32dea1a
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e7763f8
li t1, 0xcd71ada1
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x70e07c73
li t1, 0xd996f50d
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x53ff0fc0
li t1, 0x1ae41f55
pv.dotup.sc.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x8189f666
li t1, 0xf7851b4c
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0xa986c348
li t1, 0xd7a7962
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x40c4fb33
li t1, 0x7bc28da6
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4c361a4
li t1, 0x6bd3cb1
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0xa0627d99
li t1, 0xbde146d3
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0xae35c41e
li t1, 0x7f169e73
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0xe8df826f
li t1, 0xd5cdda09
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2d883c1
li t1, 0x47d43861
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0xac038872
li t1, 0xff931fc3
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x898efa59
li t1, 0xa1e2bc99
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x668ed98b
li t1, 0x7cc8804d
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x80f14a40
li t1, 0xacbd7a59
pv.dotup.b    t2, t1, t0
sw t2, 4(sp)
li t0, 0x668ed98b
li t1, 0x7cc8804d
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x80f14a40
li t1, 0xacbd7a59
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xabea49a
li t1, 0xa52a21ec
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc078a520
li t1, 0x565ebd2c
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x55f524d
li t1, 0x529510f6
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x240a65fc
li t1, 0x57637a83
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbb566179
li t1, 0xb204e9b1
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x56330592
li t1, 0x57fd9954
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6452f8e3
li t1, 0xc24c1512
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xab1982c9
li t1, 0x2bfeccaa
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb2297c71
li t1, 0xe1260a89
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x558cc164
li t1, 0x95ff6655
pv.dotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5914be38
li t1, 0xf0930544
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x286c06d8
li t1, 0x4b20c868
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xace533d0
li t1, 0x72160adc
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9563710b
li t1, 0x257fdb45
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x56453c5c
li t1, 0x3c24cd79
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe87af40
li t1, 0xeef3c8df
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x92db5f98
li t1, 0x55c0162
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4375e0cc
li t1, 0xb35c07a
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x70946793
li t1, 0x19e0617b
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x658cc70a
li t1, 0x79d6c428
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x81b3fb96
li t1, 0x97be5177
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb2c66385
li t1, 0x3ceb6214
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x40d9fdcb
li t1, 0x4bdf28bb
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1d5506ae
li t1, 0xe239951f
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x999536ba
li t1, 0xbea1f597
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xeaa8357
li t1, 0x711cca8f
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4cca9b5d
li t1, 0x5f50facb
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x436376c7
li t1, 0xc4c24152
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9f9c85f1
li t1, 0xb4e61caf
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x10d8ddb1
li t1, 0xf1309054
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe7e7217c
li t1, 0x6d39872b
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x886c6ed8
li t1, 0xf898482a
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x73f390be
li t1, 0x369cc395
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfc31a161
li t1, 0x13e001c8
pv.dotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x48654e20
li t1, 0x16c70b45
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfe18d0b0
li t1, 0x89f000e4
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2432a710
li t1, 0xb6385a2
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x33dc939
li t1, 0x571801ba
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xda7c1da8
li t1, 0x1376c994
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7daf45fd
li t1, 0xb86c0115
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa55b40f4
li t1, 0x1f7c6f8f
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x42e6039f
li t1, 0xcfd60142
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9ac8ee5a
li t1, 0x19793c82
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa17301cf
li t1, 0xe7eb00a1
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d64772d
li t1, 0xcbc9e41
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xac882186
li t1, 0xe0158198
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xeed775b6
li t1, 0x90994465
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd64410c3
li t1, 0x700ac0cc
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf76bbadb
li t1, 0x484ca232
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9713a900
li t1, 0xabe561ae
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x33d0934d
li t1, 0xb2e15a5c
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcb89d480
li t1, 0x55f2b0d7
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x99e849a6
li t1, 0xd970ad2e
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5c4ea40
li t1, 0x2af9586b
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4cf424d3
li t1, 0x6cb85697
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8ed3d441
li t1, 0x69cadfd
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xee1f5c49
li t1, 0xa09b200e
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3b584b41
li t1, 0x90ae5736
pv.dotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbf6ae004
li t1, 0xc68a9b42
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x72e7b3b1
li t1, 0x77cb9405
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x67bff621
li t1, 0x2765ad95
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb973d9d8
li t1, 0xbbe5ca02
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x33dffb10
li t1, 0x93b2d6ca
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa0884d8d
li t1, 0x4e12e4c9
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x518ab3a8
li t1, 0x5f1e6020
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xac7587a7
li t1, 0xb4e973ac
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x60a017f4
li t1, 0x39483b55
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd63ac3d3
li t1, 0xda74b9d6
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x30500bfa
li t1, 0x1ca41daa
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xeb1d61e9
li t1, 0xed3a5ceb
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x982805fd
li t1, 0xe520ed5
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf58eb0f4
li t1, 0xf69d2e75
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcc1402fe
li t1, 0x8729076a
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfac7587a
li t1, 0x7b4e973a
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe60a017f
li t1, 0x439483b5
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1520d5c
li t1, 0x2e474a55
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbb604e9f
li t1, 0xb70d4a9f
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfc98a7cf
li t1, 0x4c3a4e2
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x15d5696f
li t1, 0xcd41ae0a
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x27df286
li t1, 0x9181d3b9
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc030c03
li t1, 0xf7fbdffa
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x13ef943
li t1, 0x48c0e9dc
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe147fd4b
li t1, 0xf833ee20
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfcaeddc0
li t1, 0xb7807526
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x38c6b085
li t1, 0xeadefc55
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7e576ee0
li t1, 0x5bc03a93
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9c635842
li t1, 0xf56f7e2a
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc31a1611
li t1, 0x3e001c81
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x70007
li t1, 0xec7bb45a
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe38d8b08
li t1, 0x9f000e40
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x475c0c08
li t1, 0xb160000a
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf0d68390
li t1, 0x4fa00720
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x25f0f036
li t1, 0x52416976
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf86342c6
li t1, 0x27c00390
pv.dotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x909e4980
li t1, 0x2d9c19a8
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x972f6691
li t1, 0x597ad8e0
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x400c04c2
li t1, 0x2a60468d
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcb8fe35c
li t1, 0xac9d6c5c
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x20115331
li t1, 0x15246d1a
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x72d83713
li t1, 0xf746e9f
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x502ada22
li t1, 0xa0daeb4c
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e73dd32
li t1, 0xde80eff5
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe837253a
li t1, 0x7a25a9f8
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x262820
li t1, 0x367aaf46
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb439dab7
li t1, 0x175a08a1
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x131410
li t1, 0x1b3d57a3
pv.sdotup.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5a1ced5b
li t1, 0x8bad0450
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x97164cb1
li t1, 0x54a4736d
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6d2c3e87
li t1, 0xef9e5e75
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4b8b2658
li t1, 0xaa5239b6
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6961f43
li t1, 0xf7cf2f3a
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe69ce69d
li t1, 0x7ffa6ffb
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4d5b1d5
li t1, 0xbffbbcbf
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3591b591
li t1, 0x7569b7e3
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd3ac9bb0
li t1, 0x2814cdb7
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x26be22ca
li t1, 0xfffbfa48
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf5b5f5b7
li t1, 0x8dfa99f8
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5b78a99
li t1, 0x46be46
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5cf3dcd
li t1, 0x3ddbd3fb
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd29c929d
li t1, 0x7af33ff3
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5b52743
li t1, 0xb557e1c7
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x93343114
li t1, 0x8000acf8
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe79d239d
li t1, 0xbffebfff
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x141b1549
li t1, 0xeef3feec
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xadc7a2af
li t1, 0x7bd6f895
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5b2f5d1
li t1, 0xc00df229
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5a1549a
li t1, 0x68006fd9
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x929c929d
li t1, 0x3ffabffb
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x929c929d
li t1, 0x3ffa7ffa
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe69de69d
li t1, 0xfffbbffa
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4d38756
li t1, 0xcfeade46
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe791e791
li t1, 0xfff7fff6
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd25b9571
li t1, 0x601baf38
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2753a75
li t1, 0xc91b96da
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5b0ae31
li t1, 0x3afbbaf3
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8eb0e5f6
li t1, 0x2fa2fe1a
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5a9d9d1
li t1, 0x9aeda0e7
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x12c82a35
li t1, 0xfffdcf64
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2aaea8b
li t1, 0x3fabfe10
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9a57fe57
li t1, 0xaab2157a
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e99db8
li t1, 0x825152ce
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xecd1d82d
li t1, 0x19f82899
pv.sdotup.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xecb59ab7
li t1, 0xbf4f8ac
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xecb44d7e
li t1, 0x44746d
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1af0e94d
li t1, 0x141f77cb
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xec512613
li t1, 0xfbecc93d
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3ca5de82
li t1, 0x5135f94c
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x69e8faf8
li t1, 0x43ff18b7
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdabdcbad
li t1, 0xd2f9e63
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xedace0fd
li t1, 0x6c021df3
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb9e7b08d
li t1, 0xc0c1c0d8
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xedacb3cd
li t1, 0x5671b003
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x95ad497d
li t1, 0xca7765ef
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc421a51c
li t1, 0x4aa7a71f
pv.sdotusp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4d19429
li t1, 0xb800790e
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5800000
li t1, 0x6803ffdd
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x886edace
li t1, 0x92a7833c
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x204f1b5
li t1, 0x797fcc10
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4b5918fb
li t1, 0xda4c043e
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9063b4eb
li t1, 0x5f8fb1f8
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x16aa20ab
li t1, 0x80006073
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x25c39bb2
li t1, 0x8c70323
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe4420a3
li t1, 0xe5faec44
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x39e1bf0e
li t1, 0x3fd51452
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdd7df282
li t1, 0xaeadf979
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xebb1249
li t1, 0xfc28883
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb2490548
li t1, 0xe054b1f6
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6fb3635a
li t1, 0xf2bb72be
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x72f0911e
li t1, 0x3a8e7daf
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xedb235c3
li t1, 0xe7d21fb8
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4265cf3
li t1, 0x34dff5ae
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd65da463
li t1, 0x3ca334c
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd59dd4da
li t1, 0x615162a4
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e5c68f9
li t1, 0xfcf34971
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x924a17dc
li t1, 0x68e65d7b
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x77b5fe31
li t1, 0xbff53280
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xef71b937
li t1, 0xd15b69c
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4d42857
li t1, 0xbffbfac9
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe69de69d
li t1, 0xfffbfffb
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x15b315b3
li t1, 0xfffbfffa
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xed91b2d9
li t1, 0x56726
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe699850d
li t1, 0x1feb4f0b
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x21286072
li t1, 0x1fa93d48
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4d0d46c
li t1, 0xe000f618
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xedbfa309
li t1, 0x748f6c
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe4b1ebe0
li t1, 0xfe00e413
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x222dab69
li t1, 0x4bfd3ddf
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb58d66ac
li t1, 0xbe70837a
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcead29cf
li t1, 0x7010c8e1
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x71758cfa
li t1, 0x983aa571
pv.sdotusp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc5f43559
li t1, 0x63df8748
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa47516c1
li t1, 0x2f2ff30c
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8d391a99
li t1, 0x53273645
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f7b1a53
li t1, 0x59b8883b
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8b218dde
li t1, 0x4867b1cd
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb2ade2ad
li t1, 0xff4ad74
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe6addb6c
li t1, 0x3574dbfe
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e8848e8
li t1, 0x6a2880c7
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6ed3e5de
li t1, 0xb9be67b8
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x796a7ed4
li t1, 0xe869f77e
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x92ab92ee
li t1, 0xdaaba2ab
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd69c4b9c
li t1, 0x4fedfafb
pv.sdotsp.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf27c2c27
li t1, 0x1e797462
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdead718d
li t1, 0x80f534f9
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1811eff6
li t1, 0xb755a291
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x269966d8
li t1, 0xfffbf72f
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd6a79cf1
li t1, 0x37aac9f
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x15121a12
li t1, 0x7b71cf64
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa6cb47fb
li t1, 0x94db0da5
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdfddd5fe
li t1, 0x550aca97
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xadc86da9
li t1, 0xfbd7fbe2
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x141b032f
li t1, 0xebbf0a1f
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2a993f1b
li t1, 0xe5755d34
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe39b16c9
li t1, 0x54c554f5
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xad6c76bc
li t1, 0x4d87b4bb
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xdb1dd2ad
li t1, 0xed21357b
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf4f388a2
li t1, 0x2eb2c60b
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5b18db1
li t1, 0xbfd3bfcd
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4dd5d5a8
li t1, 0xb10eb1e
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x84897b77
li t1, 0x28d7c6f4
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf1cff1d5
li t1, 0x5635d739
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x11cdc8b9
li t1, 0xd42a7801
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3ba99157
li t1, 0x80453406
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x30a81fbf
li t1, 0x7bee7d58
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1c9c1b51
li t1, 0x7bbe427f
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7c4e6df1
li t1, 0xe2091221
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa4ede0cd
li t1, 0x9b6c1aed
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xed9ee4bf
li t1, 0xb6f6f9c3
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8ea33929
li t1, 0x499866eb
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5add788
li t1, 0xeb1fbe7e
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5afed8e
li t1, 0x2d036b1e
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa0f7a645
li t1, 0xe6b5d38e
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x249d2da9
li t1, 0x7d33a978
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe513e512
li t1, 0xf7f977fa
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x607375b7
li t1, 0xc08af27f
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xdcb1cd31
li t1, 0xac6f552d
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc93d05e9
li t1, 0x6f024f47
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x78547bf
li t1, 0xff77b22e
pv.sdotsp.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfdd04599


li t0, 0xaba70917
pv.sdotup.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xac75db16
pv.sdotup.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x4c3384d9
pv.sdotup.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x15253767
pv.sdotup.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x19b8f8cb
pv.sdotup.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xbd762458
pv.sdotup.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x1f0c88ba
pv.sdotup.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x66ac1074
pv.sdotup.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x11cb8191
pv.sdotusp.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x8d629601
pv.sdotusp.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xd830f54e
pv.sdotusp.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xa84e2045
pv.sdotusp.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x6fa8b3f3
pv.sdotusp.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x36324315
pv.sdotusp.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x41711b7c
pv.sdotusp.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x3674a705
pv.sdotusp.sci.b t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x682fdeb7
pv.sdotsp.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xcc2fd2a
pv.sdotsp.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x66d03adc
pv.sdotsp.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xcb1c70d6
pv.sdotsp.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x55bf9d58
pv.sdotsp.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x5f83f3c
pv.sdotsp.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x326ebb16
pv.sdotsp.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xf6d4b2d
pv.sdotsp.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xbd5b9afe
pv.dotup.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x24b479cd
pv.dotup.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x7a20e0d3
pv.dotup.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x98cc1568
pv.dotup.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x998d1086
pv.dotup.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xb835f611
pv.dotup.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x52d2f741
pv.dotup.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x2126989
pv.dotup.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xd169c16a
pv.dotusp.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x2ad231dd
pv.dotusp.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xe19c6272
pv.dotusp.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x7d8b03ad
pv.dotusp.sci.h t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x2b58ed01
pv.dotusp.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xb96d9e8b
pv.dotusp.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x5a289e3
pv.dotusp.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x1f2e5cf1
pv.dotusp.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xc67fc227
pv.dotsp.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x82c70ce3
pv.dotsp.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x82b9da3b
pv.dotsp.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x9c5e61e9
pv.dotsp.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x2bdf9ee
pv.dotsp.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xfdf10991
pv.dotsp.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xf6d2145
pv.dotsp.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xa65c5eb9
pv.dotsp.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xa5141b59
li t1, 0x11f9fa60
p.machhuRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xa6fe7ece
li t1, 0x9efb5be7
p.machhuRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xf5494776
li t1, 0x20318d7b
p.machhuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x468f3454
li t1, 0xd7c6c213
p.machhuRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xdf700437
li t1, 0x8f8bf90e
p.macuRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x4fecda8c
li t1, 0x4109153
p.macuRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xb33e6550
li t1, 0x182dd5ba
p.macuRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xd651cce6
li t1, 0xdff93b6f
p.macuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x79799efb
li t1, 0x5d556d7
p.macuN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x7aa003ff
li t1, 0xe86b9e80
p.macuN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x3928bef6
li t1, 0xd9aa6734
p.macuN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xcdeab7a0
li t1, 0xa418ad33
p.macuN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xe6ac2a4c
li t1, 0x3cd0dce9
p.machhuN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x8d244925
li t1, 0xfdcd6fd8
p.machhuN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xc5556c97
li t1, 0xd673adf3
p.machhuN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xe18609e5
li t1, 0xf6ddfc49
p.machhuN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xb0903090
li t1, 0x6307075b
p.machhsN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xad661c6a
li t1, 0x7de2afd4
p.machhsN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x8a456925
li t1, 0x623d56c
p.machhsN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xf4477133
li t1, 0x519c4d1d
p.machhsN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xd092e1e2
li t1, 0x8940c45e
p.macsN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xc6298b80
li t1, 0x4430c4d1
p.macsN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x40fc1e56
li t1, 0x2670badf
p.macsN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x54b72504
li t1, 0x77835e01
p.macsN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xef328a33
li t1, 0x53bfec6b
p.macsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xfee3a583
li t1, 0xe1ac26f9
p.macsRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x58d0c618
li t1, 0xc2a4e249
p.macsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x2121a8f2
li t1, 0xf835c65b
p.macsRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x71b5ea1c
li t1, 0xa523cb8e
p.machhsRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xb29d1941
li t1, 0x75c718d7
p.machhsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x7ccdf0ca
li t1, 0xfab46c67
p.machhsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x73d281f8
li t1, 0x1ad9bd3a
p.machhsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x4904dab7
li t1, 0x5ebbc019
p.mulsN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x9df08808
li t1, 0xeb6c6806
p.mulsN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x50757c52
li t1, 0xf98421f2
p.mulsN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x8ff4c9b4
li t1, 0x379a2116
p.mulsN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x29160c86
li t1, 0x6292e12a
p.mulhhsN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x56fbc1ef
li t1, 0x687e607e
p.mulhhsN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xa91dd2a2
li t1, 0xd0204db2
p.mulhhsN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x818232b9
li t1, 0x64236665
p.mulhhsN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xc3fcf6e
li t1, 0x38a036bd
p.mulsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xe3cbc265
li t1, 0x647c63af
p.mulsRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xdac1304c
li t1, 0x46afbdcb
p.mulsRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x36e820e8
li t1, 0x843d9198
p.mulsRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xc2260d76
li t1, 0x95c3acf7
p.mulhhsRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x46e4036d
li t1, 0x73770c63
p.mulhhsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x95f4e56d
li t1, 0x81f2506e
p.mulhhsRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x9c97e8f4
li t1, 0xcfb1fcdf
p.mulhhsRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x8cbee2a8
li t1, 0x9c60b690
p.muluN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x236d50d
li t1, 0x33c223bd
p.muluN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x180632af
li t1, 0xe444e341
p.muluN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x7758fa23
li t1, 0x154019f9
p.muluN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x458b8012
li t1, 0xf22de4d4
p.mulhhuN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x26a65f7d
li t1, 0xad983d92
p.mulhhuN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xc9fe7fa
li t1, 0x3bca7b5a
p.mulhhuN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x5bd9d386
li t1, 0x5c7501ca
p.mulhhuN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x91b852bc
li t1, 0xa44479f0
p.muluRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xb7fb5ffa
li t1, 0xc169516c
p.muluRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x586f9f58
li t1, 0x87eb805b
p.muluRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x2723abcf
li t1, 0x335ce4e2
p.muluRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x68f4c5af
li t1, 0x42496c29
p.mulhhuRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x1285afa4
li t1, 0x6e7699e9
p.mulhhuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xbc9cea0a
li t1, 0x3dc1a84e
p.mulhhuRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x4db312f8
li t1, 0xfee72cc7
p.mulhhuRN t2, t0, t1, 0x4
sw t2, 4(sp)

li t0, 0x7924617a
li t1, 0xac408603
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x80000005
li t1, 0x7fffffff
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x8b2cd80a
li t1, 0xd583d024
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe316fcb
li t1, 0xd1e5ac8f
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x56198c5e
li t1, 0x1cba6652
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f9b83c3
li t1, 0xbefeb837
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x845149c2
li t1, 0xd468917a
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x20000084
li t1, 0xfffffff0
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x97947e52
li t1, 0x89e210d2
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x0
li t1, 0xacaead2
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xdff86400
li t1, 0x5243b691
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xc033c822
li t1, 0x619fbc08
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xd674953c
li t1, 0x19e0a5ed
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x10278dab
li t1, 0xcbfe6080
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x6db37703
li t1, 0x26fd3226
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x42b3bdc
li t1, 0xbd8fd58f
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xfaec4453
li t1, 0x52681f38
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x41d5cc8a
li t1, 0x4139cf0d
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xaf6e7bcb
li t1, 0xe11614fd
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xdf979aff
li t1, 0x6ee11026
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x304441e7
li t1, 0x1646ff5a
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x4e36ce64
li t1, 0x7d99ad78
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xfe987e3
li t1, 0xc64911e2
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x0
li t1, 0x3f730ed
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x9bfeb5c9
li t1, 0x126975ed
rem t2, t1, t0
sw t2, 4(sp)

li t0, 0x0
li t1, 0x24cc3557
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x8000081
li t1, 0xfffffff0
div t2, t1, t0
sw t2, 4(sp)
li t0, 0xbf0777d5
li t1, 0x4fcd0a01
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x0
li t1, 0x2879875b
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x815be9de
li t1, 0xe4788858
div t2, t1, t0
sw t2, 4(sp)
li t0, 0xcc66e924
li t1, 0xde177633
div t2, t1, t0
sw t2, 4(sp)
li t0, 0xf06c37a6
li t1, 0x551f4978
div t2, t1, t0
sw t2, 4(sp)
li t0, 0xc56ce412
li t1, 0xe3000000
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x9a3c8263
li t1, 0xc09244c9
div t2, t1, t0
sw t2, 4(sp)
li t0, 0xd99b0728
li t1, 0xec7697ef
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x67efd291
li t1, 0x8ea4f76f
div t2, t1, t0
sw t2, 4(sp)
li t0, 0xb1dcd574
li t1, 0x2e30a34e
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x0
li t1, 0x38e4347a
div t2, t1, t0
sw t2, 4(sp)
li t0, 0xfa48cb3e
li t1, 0x6bea203d
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x51e7b069
li t1, 0xde9347ec
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x4081
li t1, 0xffffbffe
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0xd94264f6
li t1, 0xf57d9d08
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0xd632732
li t1, 0xb344a7d4
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6539a46
li t1, 0x1ffe47ff
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x0
li t1, 0x98aa60c9
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x2c668dc2
li t1, 0x51baa2f1
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0xb2d2acef
li t1, 0x98b2ae35
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x3e8480b6
li t1, 0x4db63fca
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x819c7569
li t1, 0x7a6bb31c
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0xabe6fae8
li t1, 0x149af672
divu t2, t1, t0
sw t2, 4(sp)

li t0, 0x10002102
li t1, 0xeffff7f0
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x88a9c2e9
li t1, 0x115b775c
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x771b9294
li t1, 0xef2e9683
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x40e6c7b2
li t1, 0x5d6a81a3
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x646b22cb
li t1, 0x2788a6f5
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e670a7c
li t1, 0xca8a9d49
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fc49d1d
li t1, 0xc54ee901
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x9094d909
li t1, 0x21a7a66a
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x8008995b
li t1, 0x3856c39a
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x7840975d
li t1, 0x953e9dc7
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xabc72d13
li t1, 0x8fd65465
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x65f5b28d
li t1, 0xc48f462d
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xd3d2e4d
li t1, 0xe28db4c4
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x7ba4df2d
li t1, 0x9d99f186
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x0
li t1, 0x1a7ea330
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x4001ffeb
li t1, 0xbffdfffc
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xaa41e187
li t1, 0x2496b372
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x7cf3f7b6
li t1, 0x14e1edd7
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x88d5971a
li t1, 0x33f37886
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x10ee1048
li t1, 0xf8cb74cc
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xcf3e115a
li t1, 0x42b70b0d
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xffd96d8d
li t1, 0x542ef17a
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xa1661cc0
li t1, 0x6287069d
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x1200100
li t1, 0xf5442c85
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x9526adc4
li t1, 0x5410c0be
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x22cf9fab
li t1, 0xade4efa6
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x2b43e5de
li t1, 0xddbf66b1
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x88aef815
li t1, 0xde684cae
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x3000059
li t1, 0xffffffc0
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x5d451a2e
li t1, 0xf54cd94f
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xe45fbf93
li t1, 0xb8c74ef1
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x0
li t1, 0x88133ff2
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x195eb98a
li t1, 0xf9c4a02a
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xf2194fa8
li t1, 0x798e17b3
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xdb8339bc
li t1, 0x232b7a83
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xbf2d8691
li t1, 0xd7eb99af
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xa91cc5ad
li t1, 0xa6b6a7f6
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x48008002
li t1, 0xb7fffffc
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x8cd01baf
li t1, 0x8e0208cf
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x8cfd8be5
li t1, 0x36b0b87f
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x8d33a5fe
li t1, 0xb3a812c8
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x1401122a
li t1, 0x755f9fe1
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x375a891e
li t1, 0xaa8de624
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xffffe000
li t1, 0x7fffffff
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x82b3a46e
li t1, 0x108d0dc8
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xd006e70c
li t1, 0x60483c32
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xa1e93c29
li t1, 0x70ef314b
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x4a81a23a
li t1, 0xca3f923a
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fb3479f
li t1, 0xbde1bfd3
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x141a42d5
li t1, 0x9dbe3348
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x465a9e5a
li t1, 0x9ef81e50
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x84211100
li t1, 0x0
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x3717b711
li t1, 0xbb2d014
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x130694d4
li t1, 0xe3ca6afa
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x0
li t1, 0xcd9a62b9
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xf423392
li t1, 0x12c899a3
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f734f31
li t1, 0x3f7cb41b
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x55cb4ddc
li t1, 0x6ca2f5ee
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xd69f1071
li t1, 0x14f20646
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d01e102
li t1, 0x23d8cd56
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xfa000002
li t1, 0x5fffffe0
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xc8fd0c10
li t1, 0xdcd18345
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x692486b2
li t1, 0x13b2bbdb
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x82ba9b48
li t1, 0x4fcc2c9c
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0xc9af4360
li t1, 0xe25c92ef
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x122dd263
li t1, 0x82879414
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x3be4200c
li t1, 0x5ed81f87
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x2dc798cc
li t1, 0xf1a73aa4
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x109696cc
li t1, 0x43553651
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x1000
li t1, 0x4000
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0xa9dc7db4
li t1, 0x5cb073b8
remu t2, t1, t0
sw t2, 4(sp)

li t0, 0xd0a850c5
li t1, 0xf3f018f0
add t2, t1, t0
sw t2, 4(sp)
li t0, 0x4c02f94c
li t1, 0xfe8b9a1f
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2698545
li t1, 0x2df7e11f
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0xf9795b0b
li t1, 0x8d166fa7
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x378aa323
li t1, 0xc1590e2
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x122bf924
li t1, 0xbd9755a9
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe8b3355
li t1, 0xda6ccc17
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0xcdc7cd9f
li t1, 0x10792a75
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x737b61b4
li t1, 0x1e3b31a1
or t2, t1, t0
sw t2, 4(sp)
li t0, 0x7c99fe8b
li t1, 0xdd40fb6d
and t2, t1, t0
sw t2, 4(sp)
li t0, 0x4442961a
li t1, 0x947b31fd
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0xaa91c509
li t1, 0x40e31dd2
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0x81fe6f87
li t1, 0x2092e48c
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0xd0b02428
li t1, 0xcc9c7404
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0xed39175a
li t1, 0xd5ce1410
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0xeec41220
li t1, 0xaabb9f3
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0x8c9b3d
li t1, 0x3f64ea1
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x370959c2
li t1, 0xe84a4dde
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x4ea5c42f
li t1, 0xdeceaa46
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0x59899778
li t1, 0xd28ea350
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0xaaf77e24
li t1, 0xd3c4ab5c
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0xa99b293a
li t1, 0x3cfbf356
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0xcdfc0eb0
li t1, 0x65931cae
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xa035ec4f
li t1, 0x6610eec1
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb4f6e6cf
li t1, 0xb76a8434
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x9b124e2
li t1, 0x40311c3
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xbf24e8b8
li t1, 0x7a226958
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xa5265ecf
li t1, 0x4f4ea79
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x4dd5e68c
li t1, 0x87d744ac
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fb5c80
li t1, 0x7d779652
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb0d4b426
li t1, 0x6f9bd80c
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd52b0056
li t1, 0x80d80d7f
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5ab0db08
li t1, 0x8578850a
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7a7d9bb5
li t1, 0xe92ec1fa
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x32ee1002
li t1, 0xe54a3e2f
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x57f41f1a
li t1, 0xe756bdb4
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1ec09273
li t1, 0x1db48dae
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3183ea4b
li t1, 0xf2febf8c
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4ffae4b0
li t1, 0x824bb811
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x42241307
li t1, 0x93c9c9d6
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8efb092a
li t1, 0x20de31e2
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7467f
li t1, 0x3b4f9929
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa257b46f
li t1, 0x17fd275
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc32a5f48
li t1, 0x9b2cc62a
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x87ece000
li t1, 0x470bc5db
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd731726c
li t1, 0x389078b6
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x34e9229b
li t1, 0xcdbf148f
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xfd54f9e3
li t1, 0xbf01518
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc4bc8976
li t1, 0x77fcfe24
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3b0f44bb
li t1, 0xe6a9920b
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d75450c
li t1, 0x8d532be1
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x41e053b0
li t1, 0x7239b59c
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x15be3645
li t1, 0xd14c7d05
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4aa7ebbd
li t1, 0xbd05e1d1
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa6bc3e83
li t1, 0xf5bc086a
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4dfecb3d
li t1, 0x4772b0ac
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe4bca2d
li t1, 0xf927bf69
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcd62666b
li t1, 0xd13ae9db
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xde18eb0e
li t1, 0xcb1dbb8b
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa6060067
li t1, 0x12dfb922
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7256221c
li t1, 0xeb055a1e
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x800019f3
li t1, 0xaf6ace23
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xfbc3ab4e
li t1, 0xb52afe10
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x358bf7fc
li t1, 0xcf5b8a18
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6317797b
li t1, 0x277c62d8
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2186986a
li t1, 0x98032ae6
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x33010ffc
li t1, 0x5f345d46
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa1515736
li t1, 0x23b1db07
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x82ed3eec
li t1, 0x2d84f93c
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7adad582
li t1, 0x96852d45
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x24fa6626
li t1, 0x13713b18
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x28e90101
li t1, 0x67113fda
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa47d8a7a
li t1, 0xbc9281d3
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x87442655
li t1, 0x21ceea3c
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x73aa9115
li t1, 0xec24d210
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xae539f2a
li t1, 0xef21c268
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb0b4dedc
li t1, 0x8b2204cf
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf990cd11
li t1, 0xa9d0ac7e
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8086f091
li t1, 0x3428474d
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1421bbfd
li t1, 0xe02d3ea5
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x40a08e91
li t1, 0x374db206
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5825c4a1
li t1, 0x4fde4f56
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x35da54fc
li t1, 0x9fce5f53
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5e551337
li t1, 0xb5a4e6ba
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4ab007fb
li t1, 0x82bc1238
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf4069faf
li t1, 0x13b3be03
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe41bf70
li t1, 0x5fcff79
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x86152aa8
li t1, 0x812dfac0
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa56d973
li t1, 0x865d2e7
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7a90e822
li t1, 0xa189120d
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2bbc1f69
li t1, 0x1e1cc443
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe87c7e
li t1, 0xbf068ba9
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9547444a
li t1, 0xa0606776
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x764342d7
li t1, 0xd6acfd29
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc4dcd637
li t1, 0x42dae030
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe99892f1
li t1, 0xe6a4d6ea
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x752d13c7
li t1, 0x92495659
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x437a20ea
li t1, 0xe1a80246
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xebe86c9a
li t1, 0x7ff7707d
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd74c83bc
li t1, 0x93fa15d8
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x945d3c5e
li t1, 0x886841c
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe8476408
li t1, 0xa2e4b8d8
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9cce8c11
li t1, 0xf1ad9c58
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6a72c61f
li t1, 0xb3752c31
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8f460953
li t1, 0x19297a2e
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2383a84
li t1, 0x6886a4fd
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5465e959
li t1, 0x803c65bc
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd15889c6
li t1, 0xf908eb22
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x650e7a93
li t1, 0x828c786b
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x83c9b420
li t1, 0x35af58fe
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xec0aa285
li t1, 0xa9b1d1cc
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf2261c1a
li t1, 0x5fc2c46a
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xce1a773c
li t1, 0x55336b68
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2ecff442
li t1, 0xea04320d
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbb48f781
li t1, 0x6fbd9a03
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x79ac3c93
li t1, 0x13c69b12
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf7694fd3
li t1, 0x491f650b
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3be38e3d
li t1, 0x685e62e3
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdf310b52
li t1, 0x16a6eb80
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x10b6296d
li t1, 0x47746ee1
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x908a5495
li t1, 0xf2c2bf12
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4bfd5ddd
li t1, 0xfba5777b
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xebc3bf95
li t1, 0x8a0b5e37
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xeeaa1f6e
li t1, 0x768e1d3b
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe09f4b34
li t1, 0x528f6ad4
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x98f56aa
li t1, 0xba1c229f
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe871dd6c
li t1, 0xad69c6da
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd590c9f1
li t1, 0xf74c9144
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5b9829f1
li t1, 0xa83e8604
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb237e4fa
li t1, 0x3929fe4f
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x466593b
li t1, 0x5a942c61
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7b2c583b
li t1, 0xfea670c
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f3a98c4
addi t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xc53dacbe
slti t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x9fc0adc7
sltiu t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x478f57e6
xori t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x2b8fed05
ori t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xbbeeaf25
andi t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x5b4735a8
slli t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x75ee41f6
srli t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xf1df256d
srai t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xdbfb2d9f
li t1, 0x471cbc46
p.addN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x152ebdf6
li t1, 0x53524df4
p.adduN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xc30e6256
li t1, 0xb4c98c40
p.addRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x755ea058
li t1, 0xc6c68a22
p.adduRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xff2c029b
li t1, 0xe91b633b
p.subN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x7e7217fa
li t1, 0xd3565c21
p.subuN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xf4ef3b37
li t1, 0xdeffc6fa
p.subRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xc8bcc1ff
li t1, 0xde45d414
p.subuRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xb7d9051f
p.extract t1, t0, 0x5, 0x3
sw t1, 4(sp)
li t0, 0xa98cccf9
p.extractu t1, t0, 0x2, 0x3
sw t1, 4(sp)
li t0, 0x5344bdb7
p.insert t1, t0, 0x0, 0x1
sw t1, 4(sp)
li t0, 0x9dfcec7
p.bclr t1, t0, 0x0, 0x1
sw t1, 4(sp)
li t0, 0x2d93c2e3
p.bset t1, t0, 0x3, 0x3
sw t1, 4(sp)
li t0, 0xf026e26a
p.clip t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x1aa985cc
p.clipu t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x71ae06f7
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x5e5c7375
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xabb1d5c9
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x730f1f7d
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x1ba4d5e2
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x184f6a8
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x7efddb74
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x95a9305
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0xd1d305eb
pv.add.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xe23c36f5
pv.add.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x5623308a
pv.sub.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xf8026e8c
pv.sub.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x3f14b03a
pv.avg.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xd4bf1132
pv.avg.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x4a39c1ba
pv.avgu.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x11dfc7c7
pv.avgu.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xcb665c08
pv.min.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x6340d1f4
pv.min.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xb8186914
pv.minu.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xd39f4133
pv.minu.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xd8923f79
pv.max.sci.h t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xb92e1ede
pv.max.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x9e92aee1
pv.maxu.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x53f87239
pv.maxu.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x3d2a1c29
pv.srl.sci.h t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x8355f818
pv.srl.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x41c9af55
pv.sra.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x2908b327
pv.sra.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x2919945
pv.sll.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x2be29d69
pv.sll.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x756fdcc9
pv.or.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x3cf456e9
pv.or.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x6b82dc26
pv.xor.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x6bc2bab6
pv.xor.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xa4c46b86
pv.and.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xb7f8d39f
pv.and.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x39dba3d5
pv.shuffle.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xf0ece008
pv.shuffleI0.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xc886d7ae
pv.shuffleI1.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x9c2044e0
pv.shuffleI2.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x1296267
pv.shuffleI3.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x910465ed
pv.cmpeq.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x6e1c082e
pv.cmpeq.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x7957aae2
pv.cmpne.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x8028bf3
pv.cmpne.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x96c8a8ba
pv.cmpgt.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x503f3b96
pv.cmpgt.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x8193e07a
pv.cmpge.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x55c48352
pv.cmpge.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x7b8e1496
pv.cmplt.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xcda2ed0c
pv.cmplt.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x2674a4de
pv.cmple.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xa4781604
pv.cmple.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x6303b251
pv.cmpgtu.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x3e5c8796
pv.cmpgtu.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0xf69b0f60
pv.cmpgeu.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x97ac293b
pv.cmpgeu.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x223b80c0
pv.cmpltu.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xa12c021
pv.cmpltu.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xa13a374c
pv.cmpleu.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x60fd5891
pv.cmpleu.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, -0x3cb315
li t1, 0xf238b91d
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x791bc82f
li t1, 0x3b264460
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x70996e77
li t1, 0x7d3e5d3d
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x516baec6
li t1, 0x19f9bfef
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x9451075
li t1, 0x71daabf6
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0xb54e45a
li t1, 0x1e986570
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6c8699f2
li t1, 0x9d0d38c5
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x23c49b07
li t1, 0x2f2a0367
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x61ec1e7e
li t1, 0xdb93e527
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x26cd8562
li t1, 0x642bd342
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x51e82bb7
li t1, 0x1feb1e05
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x23cc1df4
li t1, 0xa3d40c3a
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x271ebd
li t1, 0x8ce73e49
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5bba8ab
li t1, 0xa427dfd5
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x34ce07a9
li t1, 0x5a40f10a
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x52902fcb
li t1, 0x6b50bcd5
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x376c6054
li t1, 0x336c4035
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x3968e9
li t1, 0x72a6d193
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x1786aa88
li t1, 0xd4c6d843
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x4454507b
li t1, 0x716928a7
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x29120689
li t1, 0x71fb79b
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x64365ae3
li t1, 0x94c6e2c3
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6d8fbc90
li t1, 0xd1d9dd6e
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x500c176d
li t1, 0x3bf0a82f
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x28fb7350
li t1, 0x2b7e7c13
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0xdf87def
li t1, 0x5ac0539
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x582bfc36
li t1, 0x85e91ab2
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x1d64776
li t1, 0x7ba61fca
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7b82d91e
li t1, 0xc9afc351
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5ef3d6e5
li t1, 0x639a2f0d
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7365d0b6
li t1, 0x3a966fb4
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x75780cfb
li t1, 0xcad8433f
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x142b6d08
li t1, 0xd8c4ac9b
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x729ce5b7
li t1, 0x789a9c2d
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x3eb4b970
li t1, 0x43930de5
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x716eed24
li t1, 0x6edb77f9
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x7d08f2a3
li t1, 0x7e4095bd
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x609b0f1d
li t1, 0xd809de0d
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4c98ae4d
li t1, 0xa61bc738
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x6c7c9bbc
li t1, 0x6630ad18
div t2, t1, t0
sw t2, 4(sp)

li t0, 0xd9a2a795
li t1, 0xedfbbda5
add t2, t1, t0
sw t2, 4(sp)
li t0, 0x9c209b00
li t1, 0xca18e43
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x2b7702fd
li t1, 0x34eb2065
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0x1eb45b3
li t1, 0x2e6c078f
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x697cf22d
li t1, 0xc5231d4
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x2f96ae5d
li t1, 0xe2898bb4
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0xbffaf714
li t1, 0x8d3739cf
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0x6705df42
li t1, 0x8e078b5d
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x597681e8
li t1, 0x910d0ebc
or t2, t1, t0
sw t2, 4(sp)
li t0, 0x16ddd4c7
li t1, 0xc4ac5905
and t2, t1, t0
sw t2, 4(sp)
li t0, 0xcc4c7885
li t1, 0x176cdb45
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0x2ed40a
li t1, 0x500f1cf5
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0xab5c8e3f
li t1, 0x4d932cfa
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0x4108cdd3
li t1, 0xb19995f3
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0xae726f50
li t1, 0x3b944d60
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0x668a3faf
li t1, 0x7c0c579c
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0xf907c581
li t1, 0xbb0405a0
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0xb8995e15
li t1, 0x270fffc9
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x638fb176
li t1, 0xf84fc01
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0xfaa5147
li t1, 0xcc70d2b7
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0x7320bef9
li t1, 0xec92572f
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0xe1d1838c
li t1, 0x9afc35ed
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x27e57ddf
li t1, 0xe48f3a2d
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d65d11c
li t1, 0xe3ced437
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xfcc69d2b
li t1, 0x854500a4
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x79fd8f1f
li t1, 0x9f967335
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xaf900199
li t1, 0xedd7641c
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xdec5a165
li t1, 0x4d0d7176
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x8130fb22
li t1, 0x41bd02d9
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f7e56ff
li t1, 0x28048132
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x46438770
li t1, 0x53577de8
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd0d7f294
li t1, 0x2e20648d
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x82f821b1
li t1, 0x766072c8
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7ef03c34
li t1, 0x901aa721
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcb028eee
li t1, 0xa3d3fd99
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x42b75e7
li t1, 0x8c3dcfda
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd528262a
li t1, 0xd72865e3
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8075ece8
li t1, 0x457faf4c
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5ea8cc13
li t1, 0xda69e575
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x593130f9
li t1, 0xf1da1ef8
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6724b0ac
li t1, 0xf5231d93
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcaf67a70
li t1, 0xcbbfeef8
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x59a7b5e3
li t1, 0x6e92a69a
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8f55490
li t1, 0xbb0c4656
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6197a2ca
li t1, 0x535e560c
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9b2e393b
li t1, 0x7647ba62
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb0b06206
li t1, 0xbcedfd7d
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1d32646d
li t1, 0xdf4c7722
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5def5f9c
li t1, 0x81a95521
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9668a106
li t1, 0x30c69c5d
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb085748c
li t1, 0x869b529f
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1ae347b5
li t1, 0x5b323759
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5bdb4aa7
li t1, 0xcc1d4250
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xdc1c0feb
li t1, 0xdd56881d
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc2e177ba
li t1, 0x11b1f385
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xaa135d28
li t1, 0x944ad1d9
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5fad4438
li t1, 0xa8d4d4c3
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x54bdedc2
li t1, 0xef40a6fd
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa19e3149
li t1, 0x4d6b914b
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4c76f63
li t1, 0x8d8266a8
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4c3b8a34
li t1, 0x2cac255e
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x50f975ab
li t1, 0x41413d9a
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9be675e5
li t1, 0x62629cad
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x47de0297
li t1, 0x7c52aac1
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6a1cd2cb
li t1, 0x9a504abb
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x49bb3413
li t1, 0x9b59aea2
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x51b1d378
li t1, 0xfbbc1fbf
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x43ef641f
li t1, 0x496f4e58
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfc0d7674
li t1, 0xbf32e70f
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xde7b51ea
li t1, 0x583d857a
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5ea7f8d6
li t1, 0x9d476e87
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xaf3565c9
li t1, 0x2529fd34
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa396c18
li t1, 0xdfedc7bf
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8ce6a00
li t1, 0x1535b786
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf8156f8d
li t1, 0xac9f999b
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x89c03953
li t1, 0xc88587a8
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbaa7db47
li t1, 0x285ba295
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x763c0065
li t1, 0xb530ca62
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3fa6099d
li t1, 0x70820708
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x549b3e29
li t1, 0x1a9f1fae
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x13afb80d
li t1, 0x6c2bb869
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x28c24f6f
li t1, 0xfdecdf8b
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x196e97b7
li t1, 0xa7f3b050
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcb8d76db
li t1, 0x4176ad2f
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2ccd9ec9
li t1, 0x731da127
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e03a0cb
li t1, 0x12c327d5
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8e0cb5e
li t1, 0x7fea146
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x35e6928e
li t1, 0x6851d811
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe87ff583
li t1, 0x12e6d1b5
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x12576887
li t1, 0x3a5c417d
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x599017f1
li t1, 0xb6487675
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa26221af
li t1, 0xf88fe98d
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf7a98407
li t1, 0xae31ddbd
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf252c14f
li t1, 0x5a7ba015
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2a6ec124
li t1, 0x40ef23e1
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbb647fc2
li t1, 0x58f83930
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x384ec2c8
li t1, 0x744143e3
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcf64c8a6
li t1, 0x12c690b4
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa59ff216
li t1, 0x2d0ded07
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x39cd6fad
li t1, 0xd7f357d8
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xede520df
li t1, 0x939b9767
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3b5677ce
li t1, 0xe68e7c2c
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x76687382
li t1, 0x6088335a
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x51334f33
li t1, 0x8c33c823
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1c58b147
li t1, 0x3f09115
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb4600da8
li t1, 0xd96bc8ec
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd3388889
li t1, 0xb40b6a08
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4e696370
li t1, 0xc0ac450
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd9ce7056
li t1, 0x275125ae
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x56e6b03d
li t1, 0x36a81272
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb307323
li t1, 0x82109beb
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x43310e7f
li t1, 0x15486d0c
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x608cfd87
li t1, 0xa68b2852
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5d881234
li t1, 0x96e88582
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc916f26a
li t1, 0x9be66869
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1117cea1
li t1, 0x70aab88a
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd46dac10
li t1, 0xc9b78d0c
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x383ba4a3
li t1, 0xbf8ffbf4
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf15119cb
li t1, 0x1329726e
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xda128824
li t1, 0x779edeb6
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd02c711e
li t1, 0xea13db49
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf3432ba7
li t1, 0xccacb180
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe3f75ac6
li t1, 0x77f61661
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x12f01f5
li t1, 0xe043c7b7
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x21f0d42b
li t1, 0x6856cfe9
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5258ccb
li t1, 0xe5980a24
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa9d16bff
li t1, 0x736ed575
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x93d9754b
li t1, 0xc782322e
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f1da5a3
li t1, 0xaa1eefdf
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7a112772
li t1, 0xce3f140c
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xce06815e
li t1, 0x7b67a54a
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x38249ac3
li t1, 0xf7609403
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x68e86de
addi t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xe84ff321
slti t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x78ace7e2
sltiu t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xdcdc781a
xori t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x5be5f6b7
ori t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x22e08d5b
andi t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x6ca0064e
slli t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xd48bed1a
srli t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x7de0c4a4
srai t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x75949c75
li t1, 0x5f908e65
p.addN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x88eb1ea6
li t1, 0x1c04053
p.adduN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x38c77fef
li t1, 0x9dde507f
p.addRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x6c70a574
li t1, 0x4f27b8b6
p.adduRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x6b0e30ae
li t1, 0xe5a78546
p.subN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xed736149
li t1, 0xd8c55b52
p.subuN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xd7b48f76
li t1, 0x70849ba9
p.subRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x23e6f45f
li t1, 0x24fb36ca
p.subuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x575bda55
p.extract t1, t0, 0x1, 0x1
sw t1, 4(sp)
li t0, 0x6e4efac2
p.extractu t1, t0, 0x5, 0x0
sw t1, 4(sp)
li t0, 0xff0b0f69
p.insert t1, t0, 0x7, 0x2
sw t1, 4(sp)
li t0, 0x1b85c33b
p.bclr t1, t0, 0x6, 0x0
sw t1, 4(sp)
li t0, 0x10c051ea
p.bset t1, t0, 0x3, 0x3
sw t1, 4(sp)
li t0, 0x4180aa9
p.clip t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x8ff6bf6b
p.clipu t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x2fb04319
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x217e0e5f
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0x1ce271ad
p.clb t1, t0
sw t1, 4(sp)
li t0, 0xeecb28b0
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0xcdc0a375
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x1bbae127
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x1a461436
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x350051a3
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0xd95d3c63
pv.add.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x19affbcd
pv.add.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x3f6f59df
pv.sub.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xa3282e3
pv.sub.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x57ec7031
pv.avg.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x45524f14
pv.avg.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x37a464e9
pv.avgu.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x1e6af402
pv.avgu.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x312e38ce
pv.min.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xab22befa
pv.min.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x7ec6cdbf
pv.minu.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xf26819d9
pv.minu.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x6df9f29a
pv.max.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xc9bd1f72
pv.max.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xdfeae892
pv.maxu.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xf49744c2
pv.maxu.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xd61c7953
pv.srl.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x9a774c10
pv.srl.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x38840583
pv.sra.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x492469f
pv.sra.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xf8cd0721
pv.sll.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xc3a54caa
pv.sll.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x5a589377
pv.or.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x4870e683
pv.or.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x6d110e2a
pv.xor.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xda487a28
pv.xor.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x4c8a0b8d
pv.and.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x811dc723
pv.and.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x8ce00d56
pv.shuffle.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xacb81ad9
pv.shuffleI0.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x4fd09b49
pv.shuffleI1.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xb57fe6e5
pv.shuffleI2.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xa2ca302f
pv.shuffleI3.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x39e20436
pv.cmpeq.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xdfdb55b4
pv.cmpeq.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x6737e744
pv.cmpne.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x25286e8a
pv.cmpne.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xb4ba413d
pv.cmpgt.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x15ea8d98
pv.cmpgt.sci.b t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x6c97346c
pv.cmpge.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x253867f8
pv.cmpge.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x679283aa
pv.cmplt.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xb5a188b1
pv.cmplt.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x8f88ead2
pv.cmple.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x175b65c3
pv.cmple.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x989d3da6
pv.cmpgtu.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xbb4e6b92
pv.cmpgtu.sci.b t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x7bbd03e2
pv.cmpgeu.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0xe44608b4
pv.cmpgeu.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xa81c093a
pv.cmpltu.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x8c88058
pv.cmpltu.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x8dda5f94
pv.cmpleu.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x6ceb9e3c
pv.cmpleu.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, -0x53921e8d
li t1, 0x53b6c5f4
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x403b6ebb
li t1, 0xe562d1b8
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x177a2482
li t1, 0x5a90827e
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6765368d
li t1, 0x9186b8ea
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3cc98691
li t1, 0x82dde986
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2bf0fb04
li t1, 0x44686910
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x58ab8896
li t1, 0x6efa6b6a
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x64814b5a
li t1, 0x854c0ec
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5e21ea92
li t1, 0x4bd6c19
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x17a4940b
li t1, 0x2dc79bbc
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x511ae762
li t1, 0xbfdd7fd5
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x235ab13d
li t1, 0xc6b40364
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b8ffd8
li t1, 0x1f85c238
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x3f4e5e02
li t1, 0x3193316e
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x6b7745cf
li t1, 0x9604cdaa
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x7f633445
li t1, 0x8f813958
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x2cc76833
li t1, 0xca8bee8b
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5257678f
li t1, 0x145636d7
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x68e61a4c
li t1, 0xf8d36c02
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x51427f42
li t1, 0x3ebe03b3
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x49ce94b5
li t1, 0xe96a602b
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x69c110be
li t1, 0x2df36703
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x59e01889
li t1, 0x23a5b393
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7de63f2c
li t1, 0xeac815f1
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x495134bf
li t1, 0x89cf4b2a
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2d3e7124
li t1, 0x4a974365
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x217262d3
li t1, 0x750fdf05
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4802efe8
li t1, 0xe6f8b52d
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3f6596c6
li t1, 0x961f5158
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x666eba45
li t1, 0x3fd199ad
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2c825c67
li t1, 0xececffc3
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x65da3b92
li t1, 0x127c5cc6
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x24912f56
li t1, 0x54c301b2
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x15a94fef
li t1, 0x293153a
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x59c43b88
li t1, 0x1dd5997e
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x73c2955d
li t1, 0xd46d6e46
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x7c4ac4a7
li t1, 0xad15ddbc
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x305475a0
li t1, 0x6a238fc6
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x39de48a
li t1, 0xf2974b0
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x46b59122
li t1, 0xbd76bfb4
div t2, t1, t0
sw t2, 4(sp)

li t0, 0x2ade429a
li t1, 0xbd0b44eb
add t2, t1, t0
sw t2, 4(sp)
li t0, 0xfb00216e
li t1, 0x5d323218
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0xc1dda54d
li t1, 0x9ea0975e
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0x7bcb6bf8
li t1, 0x34917522
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x5cc68474
li t1, 0x3d86db51
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x1c3b00b8
li t1, 0xaae075d0
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0xdcca81f8
li t1, 0x173cb219
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0xb263134e
li t1, 0x95c4de10
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x452e4753
li t1, 0x53f9820c
or t2, t1, t0
sw t2, 4(sp)
li t0, 0xf9f766e2
li t1, 0x7cd13e26
and t2, t1, t0
sw t2, 4(sp)
li t0, 0x36e66874
li t1, 0xe3c93cae
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0x917a6b4a
li t1, 0xa8a1d59d
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0xeffefe3b
li t1, 0x1f9a1db4
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0x30268f97
li t1, 0x1a0a0592
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0x8593c49f
li t1, 0xb351bbeb
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0x87446a49
li t1, 0xa3a4d514
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0x8d8c4d42
li t1, 0x824703f2
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0xbfadca32
li t1, 0x3036d51e
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e054f14
li t1, 0x7004f7f1
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0x51f937d4
li t1, 0xfd82619
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0x299067a6
li t1, 0x8d5182e1
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5e2e324
li t1, 0xb444b2ab
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0xe90f8305
li t1, 0x6786ec5a
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x8cabc71c
li t1, 0x78a38864
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xfe29f435
li t1, 0xcd52f5e6
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x96470d36
li t1, 0x7d1b7f51
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xd5790705
li t1, 0x892057cc
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x50edf54d
li t1, 0x2fe70a76
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x2564a135
li t1, 0xf279a5be
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x8214d488
li t1, 0xe26d6277
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8b525daf
li t1, 0x319ddd7c
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x85e56aac
li t1, 0xce70bcf1
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3e5662c5
li t1, 0x8e8b1de9
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcf0d3688
li t1, 0x7d117ce0
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x58b3724c
li t1, 0x482a80e0
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3c313b91
li t1, 0x5c0029ad
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcd4e7645
li t1, 0x411a3a26
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb431b717
li t1, 0x2021d0ca
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x75fbb887
li t1, 0x7b62d44c
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa076f262
li t1, 0x3d8afab5
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x474cdc22
li t1, 0x9e6b6f10
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb129f619
li t1, 0xad3b382e
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7240e6ec
li t1, 0x548a4a8b
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b04390a
li t1, 0xb8082f25
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xebc9943
li t1, 0x2f7651f
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x655828f5
li t1, 0xeeb143a7
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd61373fd
li t1, 0x5447d77c
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xadc6269e
li t1, 0x90b51186
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x932d92b0
li t1, 0xab56d232
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2705fb40
li t1, 0xba5aa0e5
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x57b43d0d
li t1, 0x656b330d
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdb34bf99
li t1, 0xbf927490
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1404f200
li t1, 0xfc093ddb
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x327e6bb0
li t1, 0x144fe1fc
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc565edff
li t1, 0x7cadef78
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa6b0d612
li t1, 0xc052531e
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7bd0ce06
li t1, 0xa5706a5c
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf66a67ff
li t1, 0x11cc5931
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa79e24f1
li t1, 0xbe2bfc4a
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2867b443
li t1, 0xec2b6f50
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcecf34cc
li t1, 0x4e2488e3
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x47f7d3d2
li t1, 0x42310dfe
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xba20a653
li t1, 0xb90e5e0a
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f3e818f
li t1, 0x779b79f9
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x70a7529a
li t1, 0xedc97960
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5fe85354
li t1, 0xba06ec94
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x180ec0c
li t1, 0x519131f0
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe06115ac
li t1, 0x9483eb44
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x422d526b
li t1, 0x7a8e0458
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9dd5d67b
li t1, 0xa8f46df8
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd774addc
li t1, 0xec093346
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdc7991bf
li t1, 0xd1fd089
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x506fc8aa
li t1, 0x7c0eff74
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x17831930
li t1, 0xdabcee8f
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5102c68e
li t1, 0xc6aee99c
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8df3770c
li t1, 0xeacaba3f
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5716f6f8
li t1, 0x1dfd3c19
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe332ee76
li t1, 0x27d80848
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa0581288
li t1, 0x932abcd1
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x85f6d37a
li t1, 0x8726a209
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd7c0ffe8
li t1, 0xc5b5a30c
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x993379dd
li t1, 0xaabe2931
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x62153248
li t1, 0x6336dc65
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x527fb60
li t1, 0x3c020de0
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb020b984
li t1, 0x4c29f287
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x934dbcde
li t1, 0xa74b1f78
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3baf0793
li t1, 0x8f39aeb8
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9cee3e1a
li t1, 0x2ad13d5e
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x784f3c48
li t1, 0xb3ecdb98
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b7a598b
li t1, 0xe47eb363
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf09a9de9
li t1, 0x8c3e4c8e
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcf4d00f
li t1, 0xdbe9ae3d
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf6d6d172
li t1, 0x4c437521
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a48392d
li t1, 0x56539836
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9700cd0a
li t1, 0xf356c385
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a85c3ea
li t1, 0xf35163db
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xddd7c48
li t1, 0x8f9bcdf5
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4213b4c0
li t1, 0xc1aa6c99
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcee6bfd1
li t1, 0x5f84c3ba
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x32cd229f
li t1, 0x3a577a42
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1f4fc0cd
li t1, 0xad99e362
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x54bdcebf
li t1, 0xc51d264
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xedf8ce98
li t1, 0xbd6c8f61
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1c21e9a1
li t1, 0xdef7f96
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa543dcf2
li t1, 0xc02b8595
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa5faa7de
li t1, 0xd2c96314
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7b2e3ef5
li t1, 0x74d7a5ac
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3e871abe
li t1, 0xce8b800c
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd8e97e8d
li t1, 0x467136d2
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7c3dffde
li t1, 0x625fe017
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xfcaced22
li t1, 0xfd1dd1eb
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb38b1523
li t1, 0x6675d1bb
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfdbbea6d
li t1, 0x781afacd
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x592ad5a4
li t1, 0x96de39e6
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x97151c8b
li t1, 0x1e3bf128
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e5e6da9
li t1, 0x829c7d86
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8e823902
li t1, 0xef471d67
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe17f2c23
li t1, 0x722f5a45
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcd93711a
li t1, 0xe71fc636
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8220d8b1
li t1, 0xe579b105
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb89b2cf6
li t1, 0xb48cda72
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6ff60a97
li t1, 0xb66b40a9
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x976b8bd4
li t1, 0x9b9dd291
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc62227f
li t1, 0xd7f22ffc
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5466742e
li t1, 0xe21e8956
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x89f9c2f6
li t1, 0xe619d375
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa7219b
li t1, 0xfc9f8997
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3854ed8f
li t1, 0x30cb8fb5
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe9c6c8ec
li t1, 0x51b8868c
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x848e7061
li t1, 0x4c68eb89
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc8596e35
li t1, 0x270a19e5
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf44d1f2e
li t1, 0x4fdcf402
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x56f8fa62
addi t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x1505cd6a
slti t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x453a230c
sltiu t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xd714a9ce
xori t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x903876bb
ori t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xb35f1753
andi t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xc93fb536
slli t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x86b7c378
srli t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x73e491d
srai t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x953127f5
li t1, 0xe62a7852
p.addN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xc847f2bd
li t1, 0x839e3a21
p.adduN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x98e8e5cb
li t1, 0x94c258ad
p.addRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x834501ad
li t1, 0x1940627
p.adduRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x4c4e6d48
li t1, 0xabfb3074
p.subN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xb3aa383f
li t1, 0x948653cd
p.subuN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x7fe2d5f4
li t1, 0x122fd43a
p.subRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x3c7336ff
li t1, 0xeeed8bb6
p.subuRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x1d21d9ce
p.extract t1, t0, 0x0, 0x0
sw t1, 4(sp)
li t0, 0x92dfa41c
p.extractu t1, t0, 0x1, 0x0
sw t1, 4(sp)
li t0, 0xbca33892
p.insert t1, t0, 0x2, 0x1
sw t1, 4(sp)
li t0, 0x323641f5
p.bclr t1, t0, 0x2, 0x2
sw t1, 4(sp)
li t0, 0x60dbf7e3
p.bset t1, t0, 0x3, 0x3
sw t1, 4(sp)
li t0, 0x30020dc3
p.clip t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x86efece1
p.clipu t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x55be77a
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x7316e843
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0x260aa77e
p.clb t1, t0
sw t1, 4(sp)
li t0, 0xfe12f79f
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x5e10b80c
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x4224705f
p.exths t1, t0
sw t1, 4(sp)
li t0, 0xccdbbb9
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x4bc7b6df
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0xca2b5af2
pv.add.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x5b21b67c
pv.add.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xda28ca8b
pv.sub.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xe3148cf4
pv.sub.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xd8254a62
pv.avg.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x8b9eaef0
pv.avg.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x6d7f882
pv.avgu.sci.h t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x86ec7c69
pv.avgu.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x9238d01d
pv.min.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x930feb52
pv.min.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x17a0f206
pv.minu.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x4cef1330
pv.minu.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x4d2dea5b
pv.max.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x91840eb1
pv.max.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x1e66ad21
pv.maxu.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xe71dc5f4
pv.maxu.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xe07dd89e
pv.srl.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x329d396a
pv.srl.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x311c50dc
pv.sra.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x791cd363
pv.sra.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xeb6bdb3e
pv.sll.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x7574a5b2
pv.sll.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x922323ea
pv.or.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xd638c345
pv.or.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xb6a83939
pv.xor.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xffddff58
pv.xor.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xdbf2da34
pv.and.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x1f48e318
pv.and.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x67ba2ff0
pv.shuffle.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x87a6a164
pv.shuffleI0.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x628f335c
pv.shuffleI1.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xfcc6a931
pv.shuffleI2.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x53c2955
pv.shuffleI3.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xd8fe19f6
pv.cmpeq.sci.h t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x468ba2b1
pv.cmpeq.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xcf0592c
pv.cmpne.sci.h t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x701d267c
pv.cmpne.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xc422b56
pv.cmpgt.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xc3737bc7
pv.cmpgt.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xe6f815ff
pv.cmpge.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x82039c8e
pv.cmpge.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xb414d6a3
pv.cmplt.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xa310abcd
pv.cmplt.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x30b11019
pv.cmple.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xd866cf3b
pv.cmple.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x12a0aefb
pv.cmpgtu.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x3d08fe0b
pv.cmpgtu.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xfe0d9316
pv.cmpgeu.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xa7023a5f
pv.cmpgeu.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x839d2cf
pv.cmpltu.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xb34de353
pv.cmpltu.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xbaf4dc16
pv.cmpleu.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xa1f77c9a
pv.cmpleu.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, -0x46f40e6
li t1, 0x91936d0f
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1406ce91
li t1, 0x3f43bf0d
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3f5b11a4
li t1, 0x3a91b44a
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3bd5b74f
li t1, 0xe7a69107
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4aadce82
li t1, 0x44eca685
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x594ada42
li t1, 0x508e37e6
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x48fef776
li t1, 0x93c9baff
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x58445b43
li t1, 0x351b0305
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4ad0108d
li t1, 0xeb6ce013
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3bb0c8f5
li t1, 0xab694ad1
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x354b93e6
li t1, 0x787e3df8
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x1d6605e7
li t1, 0xe51c27d6
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x1d6e6856
li t1, 0x672a7e9e
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0xd4d563d
li t1, 0x98256836
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x1e181fab
li t1, 0x357c2cd
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x64df6e2f
li t1, 0xdc48822b
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b4b60d
li t1, 0x4a54de17
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x476b98e0
li t1, 0xbb2cc5af
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x12d313f1
li t1, 0x1047e5c3
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x29662b60
li t1, 0xf14843c5
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x39493371
li t1, 0x44343425
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6124df01
li t1, 0xecde31a3
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x11103ff
li t1, 0xd2405efb
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x18b1734e
li t1, 0x8545b0c8
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x783d7159
li t1, 0xdfe4d4d5
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1a364f46
li t1, 0x595ce34a
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3be41da6
li t1, 0x3317decf
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x68299a
li t1, 0x6885ab43
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2e5b642f
li t1, 0x8262ef52
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4c0451a9
li t1, 0x270251c8
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2b3d2fa8
li t1, 0xf3f9a772
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x688b406e
li t1, 0xf4aeedbb
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x3157e382
li t1, 0x8242ed9e
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x7f6a9336
li t1, 0x208ecf44
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x36a6d0c5
li t1, 0x8ccf9b97
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x145884e8
li t1, 0xb1697c0e
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x7fe6e1b7
li t1, 0xd41a505a
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x48178b28
li t1, 0x6d362fe1
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x37ad5f0e
li t1, 0x4b017394
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x3954d827
li t1, 0x8e8653a4
div t2, t1, t0
sw t2, 4(sp)
lp.starti x0, Lstrt
lp.endi x0, Lend0
lp.counti x0, 0x04
Lstrt:add t2, t0,t1
sw t2, 4(sp)
add t1,t0,0x01
Lend0:sw t1, 4(sp)
li t0, 0x00
li t1, 0x00
lp.setupi x1, 4, Lend1
sub t2, t0,t1
sw t2, 4(sp)
lp.setupi x0, 3, L0
sll t2, t2, t1
sw t2, 4(sp)
sra t2,t2,t1
L0: sw t2, 4(sp)
Lend1:addi t1,t1,0x01
lp.setupi x1, 4, Lend2
sub t2, t0,t1
sw t2, 4(sp)
lp.setupi x0, 10, L3
mul t2, t0, t1
sw t2, 4(sp)
add t2,t2,t1
L3: sw t2, 4(sp)
Lend2:addi t1,t1,0x01
li t0, 0x99b99896
li t1, 0x3e91bece
add t2, t1, t0
sw t2, 4(sp)
li t0, 0xcd3c6872
li t1, 0x1cab293a
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x213d82c2
li t1, 0x6252c12c
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0xd3fe7d82
li t1, 0x3b70573c
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x62357e19
li t1, 0x1e76df8c
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x30220e06
li t1, 0xc5fb7141
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0xd6a98d66
li t1, 0x9fb260b7
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0x292e50b
li t1, 0x5fbbff73
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x7429c0d4
li t1, 0xf9226981
or t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f642105
li t1, 0xa7512d6
and t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a666389
li t1, 0x3e7d6d53
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x75b161
li t1, 0x81b9b401
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xd8264049
li t1, 0xb6701cae
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x8c87f109
li t1, 0x5378d43b
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x300c851d
li t1, 0xde082070
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0x9ef72d98
li t1, 0x247b711a
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0x28227f8a
li t1, 0x63969bca
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0x460dba96
li t1, 0xbf0a1a7a
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f650d2f
li t1, 0xbdc8c95b
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0x2cdab5c1
li t1, 0xa5348c2c
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0x41eed369
li t1, 0x70326a40
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0xb7b6fd71
li t1, 0xbf01a398
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x5258c943
li t1, 0x8f60c1c8
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0x513ddd4c
li t1, 0x39a06868
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0x761f9fff
li t1, 0x862274e9
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0x109eac29
li t1, 0x337e5a8e
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f7acb51
li t1, 0xc0216dea
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x661f44ed
li t1, 0x21d29ccb
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xa717379a
li t1, 0xf350e317
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x6433b1db
li t1, 0xcf1a7e98
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1739ac6
li t1, 0xbd82824d
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x9342f397
li t1, 0x9718b18a
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x8d25aa42
li t1, 0xfb066fc3
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x4167c21a
li t1, 0xc4c0b646
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6664938a
li t1, 0x9c2d5c05
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcf1adcb4
li t1, 0x2f577671
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x618c6b8f
li t1, 0xc4b69247
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcc97cbbe
li t1, 0xc1e4fdf3
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7c7e2b87
li t1, 0xf8441f7b
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x87b47b85
li t1, 0xb3f87ba3
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9ec2e94e
li t1, 0x1465acaa
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc6a12170
li t1, 0x3537f67d
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa2eabec5
li t1, 0x717db260
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdac67d65
li t1, 0x5d1e4957
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x12a30452
li t1, 0x8731acd8
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3466e288
li t1, 0x8c07aad
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x89065de1
li t1, 0x8671cc2f
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf234908
li t1, 0x3b057742
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe8c403d
li t1, 0xe8e13a8f
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8306eafd
li t1, 0x36717597
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x397c265a
li t1, 0xc3e2b5ab
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x710e7021
li t1, 0xc3dcb4c
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1bf667c6
li t1, 0x5df3a455
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x51601a4d
li t1, 0xdcbd8875
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6f05a642
li t1, 0x4153269d
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8783f2
li t1, 0x472b5798
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9afaf68e
li t1, 0x615b7e7a
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x53c346a1
li t1, 0xf574e565
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2f830ac4
li t1, 0x113da979
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe8f413ad
li t1, 0xaa8bd2dc
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8d2a0c94
li t1, 0x3fbb2d9c
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x61b76ca8
li t1, 0x95d11c56
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x94f6458
li t1, 0x274580ba
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f777f3d
li t1, 0x9bc7b769
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe7c960
li t1, 0x8d89fc20
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xdc339027
li t1, 0x26505926
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8387b5e3
li t1, 0x83152bf4
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf1eb0efa
li t1, 0x7318d86b
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9f91bb3d
li t1, 0x83c3385c
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x550741fa
li t1, 0xc32e4e3e
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2a71b6d8
li t1, 0x4be76525
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5eae9525
li t1, 0xafb7fdd6
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x273fe859
li t1, 0x73a0e4a5
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x14136b1f
li t1, 0x466adf31
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4563e2d
li t1, 0x6cdb0a0a
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xccc34b23
li t1, 0x5e163054
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc1be0325
li t1, 0x6896a278
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x477f4d03
li t1, 0xff185bcb
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc56594f2
li t1, 0x7242cc5b
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6c32758
li t1, 0xc14cd0f
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf39111c
li t1, 0xad4dab68
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc41d5f44
li t1, 0x7a2b9247
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x26d1b502
li t1, 0x2486d172
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2fc35a37
li t1, 0x13b03851
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf26ba843
li t1, 0x224f4028
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x58c2079c
li t1, 0xf9664535
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2aaab2d8
li t1, 0xf836f778
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xec4bdc24
li t1, 0x5132cc6b
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3f30c73
li t1, 0xd749426b
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7b71445c
li t1, 0x92064da7
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5a718790
li t1, 0x76cb22d1
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x64c98f42
li t1, 0x6c372ac6
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc1b11246
li t1, 0xa90b7166
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1ab7c138
li t1, 0x80d5613c
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3e9d22d4
li t1, 0xb6c67733
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xce4039c5
li t1, 0xa7e31b6a
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbd5bd028
li t1, 0x395f611d
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x95a30a67
li t1, 0x220744e1
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4934b9d3
li t1, 0xdb7b6f76
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9ab48f9c
li t1, 0xf80101ea
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf3f3c70
li t1, 0xd3bb8a47
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xddba0850
li t1, 0xfb0e9271
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x65ca2647
li t1, 0xcbd383c5
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f418e70
li t1, 0x3a30b52c
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb0fe9033
li t1, 0x73a34e44
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdc4ee159
li t1, 0xbb7c7682
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3aa1028b
li t1, 0xfbb3aacb
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x875f74bb
li t1, 0xa7578c9c
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe46ad272
li t1, 0x157ed76e
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x556ae52b
li t1, 0xec188515
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbbb05363
li t1, 0x89bd5707
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa651ec84
li t1, 0xb3d0e777
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3b395616
li t1, 0xe3f2b4e1
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdacaf0fa
li t1, 0x1032136c
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x91b631ac
li t1, 0x29cbf887
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6e1c6ca
li t1, 0xae99ac22
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e5391e0
li t1, 0x5cc6dee9
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7ed92f2d
li t1, 0xb32eaa74
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8afdbb8b
li t1, 0xe0e924f3
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x866b79ec
li t1, 0xf8f37702
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x350feee6
li t1, 0xb52e15a2
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fb475ef
li t1, 0x32dca382
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe3680fb7
li t1, 0x900507ad
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xddb440ef
li t1, 0xf8a5ef20
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x73c140ca
li t1, 0x44ae17a9
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xca7653b4
li t1, 0x9ed2fafb
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf4c5b3aa
li t1, 0x811db419
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2b03348b
li t1, 0x48d28487
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfd4698ba
li t1, 0xfe6091ba
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x58c2fb38
li t1, 0x420cb9cf
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x86d3391d
li t1, 0x88c9d477
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1bce1cca
li t1, 0xa3be57a6
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc4b1aa6e
li t1, 0xb8e829a5
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x111fd7b4
li t1, 0x90c6eb24
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x304f5444
li t1, 0x48b2bb52
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xdca0abfd
li t1, 0x3d1cf033
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4a81b2ee
addi t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xcdff8e0d
slti t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xebcf2ca1
sltiu t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xa55e46e7
xori t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xc3256377
ori t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xf6eea9f1
andi t1, t0, 0x6
sw t1, 4(sp)
li t0, 0xffe49d05
slli t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x39b73491
srli t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xd4506d18
srai t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x1a558230
li t1, 0x7f848428
p.addN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x2b4b88bd
li t1, 0xe73b5b62
p.adduN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xb1c62f5f
li t1, 0xc9968260
p.addRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x91624c4e
li t1, 0x3d2a4c16
p.adduRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x38d27c1
li t1, 0xe6a46d8
p.subN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x803a46aa
li t1, 0x942afcd
p.subuN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x9a3adc54
li t1, 0xa313a84
p.subRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x3eb61186
li t1, 0x22979a71
p.subuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x7be912d
p.extract t1, t0, 0x1, 0x2
sw t1, 4(sp)
li t0, 0x191f4c87
p.extractu t1, t0, 0x4, 0x2
sw t1, 4(sp)
li t0, 0xa35c4933
p.insert t1, t0, 0x2, 0x0
sw t1, 4(sp)
li t0, 0x3630769c
p.bclr t1, t0, 0x4, 0x3
sw t1, 4(sp)
li t0, 0x9e8ce794
p.bset t1, t0, 0x0, 0x1
sw t1, 4(sp)
li t0, 0x76b00221
p.clip t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x84c936db
p.clipu t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xfc32d44e
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0xfaea3e04
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xafee5348
p.clb t1, t0
sw t1, 4(sp)
li t0, 0xdaccdf5b
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x7e75a150
p.abs t1, t0
sw t1, 4(sp)
li t0, 0xc7bf2210
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x4351d14c
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0xd0ff63b
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x2d2569d5
pv.add.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xa1600c91
pv.add.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x92653f95
pv.sub.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x26a0d7a8
pv.sub.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x3ce501b2
pv.avg.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0xe1a7a5e7
pv.avg.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x4f750bc8
pv.avgu.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x422cd321
pv.avgu.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x6503e48d
pv.min.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xcf5b08fa
pv.min.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x70844c87
pv.minu.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xf78bd3d1
pv.minu.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x960f0b8b
pv.max.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xe7253582
pv.max.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x5cdacb86
pv.maxu.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xc8d1e14b
pv.maxu.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xfb1ed013
pv.srl.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xf3992b94
pv.srl.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x5c4f9945
pv.sra.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x3e47d39c
pv.sra.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xade509a8
pv.sll.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x325b3bc7
pv.sll.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x11117b48
pv.or.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x5910bda6
pv.or.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x29e3f606
pv.xor.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x3d4de6c3
pv.xor.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xb4c8a9a7
pv.and.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x337033c8
pv.and.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xf16cc48
pv.shuffle.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xe2128a49
pv.shuffleI0.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x683bfa61
pv.shuffleI1.sci.b t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xc368f31f
pv.shuffleI2.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xce5ac88d
pv.shuffleI3.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x6bd8059a
pv.cmpeq.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x357a113b
pv.cmpeq.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xc7b5a0b
pv.cmpne.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x75548e4f
pv.cmpne.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xc27758b2
pv.cmpgt.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xd68333aa
pv.cmpgt.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xf77be9c3
pv.cmpge.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x235ede35
pv.cmpge.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x9b9217c
pv.cmplt.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x75705582
pv.cmplt.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xa33016
pv.cmple.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x95b58abf
pv.cmple.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x6f8bb643
pv.cmpgtu.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xa1f8f002
pv.cmpgtu.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xaa0e6fca
pv.cmpgeu.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xda92b2f0
pv.cmpgeu.sci.b t1, t0, 0x13
sw t1, 4(sp)
li t0, 0xc821cd5
pv.cmpltu.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x1e4d79c8
pv.cmpltu.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x153ea7d3
pv.cmpleu.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x9aa37f69
pv.cmpleu.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xb3bf60b0
pv.sdotup.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x3e6d91b2
pv.sdotup.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xaebacc17
pv.sdotusp.sci.h t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x83561bb6
pv.sdotusp.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xab7815e9
pv.sdotsp.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x2c46e440
pv.sdotsp.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xe8acd18d
pv.dotup.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xf72bbc
pv.dotup.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x2c14d924
pv.dotusp.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x7d89d7cd
pv.dotusp.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x83c1ea7d
pv.dotsp.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x4d171773
pv.dotsp.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x131548c
li t1, 0xae0e71b8
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x18ffeae
li t1, 0x726b667a
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x24aab0b8
li t1, 0x22f95ee0
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x43cb482e
li t1, 0x2901644a
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2a4de06
li t1, 0x640375ae
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x74613aaa
li t1, 0xcf0e43f0
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x21f25cd0
li t1, 0xb0b9e24
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x79099455
li t1, 0xa6601245
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6bea4273
li t1, 0xc629db2c
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x370637d
li t1, 0x38933deb
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x67451b55
li t1, 0xd40241f5
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x60c22719
li t1, 0xacd253ca
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x3cdc722c
li t1, 0x47129080
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x4f5ac055
li t1, 0x48c52eb4
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x213c6c35
li t1, 0x113d795e
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x3ca468ec
li t1, 0xa7e520aa
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x16fc94d2
li t1, 0x994ca26b
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x8a5488f
li t1, 0x4b1d02a4
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x165c4e79
li t1, 0x4f509333
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x64ea357c
li t1, 0xfdb5eb1e
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x19184d28
li t1, 0x8b59678b
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0xd43264f
li t1, 0x90e20aca
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1300b6ec
li t1, 0xdc732b15
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x15d8258e
li t1, 0xf0f4dbe4
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x532bcf2b
li t1, 0x103e9b5c
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x30f0ec7
li t1, 0xbb1480b5
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x3a16bed
li t1, 0x626089e5
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x46c2dc3f
li t1, 0x4b706635
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4a50a35f
li t1, 0xf4ba9d82
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1ce633e4
li t1, 0x1e936c44
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x54f33faf
li t1, 0xc0383322
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x14adf3a6
li t1, 0xc3e37b68
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4092a580
li t1, 0x6b881b73
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4e37c3b
li t1, 0x6ab70ed0
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x3a9f0a35
li t1, 0xd3034a64
div t2, t1, t0
sw t2, 4(sp)
li t0, -0xe5c08c9
li t1, 0xdf815d6
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x22327db9
li t1, 0x1037e78f
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x69f459c4
li t1, 0x8f501132
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x72e6e12c
li t1, 0x63acd4d9
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x1f27ee6
li t1, 0x885424c0
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x9410962c
li t1, 0xcf1b9f8f
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0xa0b8cb19
li t1, 0xd10a68aa
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf775cc74
li t1, 0x418365d0
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xde8a9350
li t1, 0x8fcfa9e5
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x468e9396
li t1, 0x24f6c6b0
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb0d3e01c
li t1, 0xe3bf19f5
add t2, t1, t0
sw t2, 4(sp)
li t0, 0x9e53cac7
li t1, 0xf732fca6
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0xa7efa324
li t1, 0xef9195ec
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0x5be6cc9b
li t1, 0x5295e946
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe7e450fe
li t1, 0xfe9cfa3e
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x24416089
li t1, 0xbc2bb67d
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x97d9e9c5
li t1, 0x10175b79
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xac213b86
li t1, 0xb9fb3cdb
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x532f6d21
li t1, 0x63ffb869
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf873ed81
li t1, 0x49d1eb59
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0x17239e83
li t1, 0x877f90ec
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x20138860
li t1, 0xfb2fcbbc
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf02e483c
li t1, 0xa84f65d4
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x578468e0
li t1, 0x524650e9
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb2cc0b63
li t1, 0x113866f
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb9119886
li t1, 0xc4372f37
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1043e6e4
li t1, 0x931dbb39
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1460cb75
li t1, 0xe6c96496
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x485a67eb
li t1, 0x9167ff76
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8b3ecb9a
li t1, 0x8eb0a233
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xca59866b
li t1, 0x3368ae6
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x8e6ed562
li t1, 0x25aa8708
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x49d3d031
li t1, 0x7affdfcd
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x753d7150
li t1, 0x1df91e2
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8eb328bd
li t1, 0x69c90658
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb37197b5
li t1, 0xa0f163c8
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbdbb4793
li t1, 0x17be6113
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa620a16b
li t1, 0xfaddc1b8
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xeb834dd4
li t1, 0x34cb8736
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x18333af9
li t1, 0x2a173476
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd38af1e4
li t1, 0xd3d9476e
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe3f1aaf
li t1, 0xb7d56f92
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb151f9e6
li t1, 0x8ed0a43a
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1f2d022
li t1, 0xa81af32e
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0xba3ad408
li t1, 0xd9402c1
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6c06bcd
li t1, 0xf45e9f60
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd536c757
li t1, 0x7733b4c9
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x10c4f42e
li t1, 0x65bafd12
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x420d81d4
li t1, 0x75666747
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0xa8ca85c1
li t1, 0xffcb9c78
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe67c6847
li t1, 0x22562a28
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd32243dd
li t1, 0xaff89501
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xaae01ca3
li t1, 0xad45b77
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x849a22fd
li t1, 0x8677a3ae
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a5b002d
li t1, 0xf2da5568
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0x65b0e70c
li t1, 0x51c35b5a
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xed8af253
li t1, 0xf2261b50
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcaffd320
li t1, 0x1dcb9e73
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xe03ed89c
li t1, 0x6f8b3d9
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe2386d5d
li t1, 0x2d33261e
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x40b42535
li t1, 0xe0bb07ae
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb7224a62
li t1, 0x72e2f3a
pv.dotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1456c209
li t1, 0x5bb57155
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x186a75fe
li t1, 0x3e0f9d5c
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd267a5bc
li t1, 0x2715770b
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0x56a438dc
li t1, 0xa814eb46
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe1e6fc0e
li t1, 0x9e1dba8
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc6427d7e
li t1, 0x8c4f2155
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3c5f7b66
li t1, 0xd89456f9
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd7e7efc2
li t1, 0x8b9901c7
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e6b45f3
li t1, 0x80eff444
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x75468425
li t1, 0xc47a3def
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x55ee7b5f
li t1, 0x8c1cc68a
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2217c512
li t1, 0xd2e1d610
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd96b82a6
li t1, 0x3a96dc70
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x56a45132
li t1, 0xb2d6a8b5
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0x6292af30
li t1, 0xe67d1974
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf00b878c
li t1, 0x103c82a7
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a62c9b7
li t1, 0xa7d09bab
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdc1b9143
li t1, 0xf7a9c84a
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x26d3e4d4
li t1, 0xecc60b68
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5aeaf7b8
li t1, 0x60f95252
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x683744c8
li t1, 0x8b3f40ea
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x11e3ffed
li t1, 0x45d4d984
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7d2a2f09
li t1, 0xda924fde
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xccfe3d6
li t1, 0x661ef691
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x41a18e49
li t1, 0xf958bded
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x306514a4
li t1, 0x7d4d2721
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6ebc88b
li t1, 0x6e667708
or t2, t1, t0
sw t2, 4(sp)
li t0, 0x4b7f9c80
li t1, 0xbef28fdf
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6339fe8f
li t1, 0xac617d3a
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb56c13b0
li t1, 0x59596aa5
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x65b2037
li t1, 0xe6fcef64
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4a17e3d2
li t1, 0x2711f44d
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5ef03c6d
li t1, 0x63241f1f
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5b129c41
li t1, 0xca200f9f
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc02451f7
li t1, 0x386fdda7
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1bc35960
li t1, 0x5a2edf20
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbd0a2050
li t1, 0x8290d183
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0xc33e554d
li t1, 0x865bb9b3
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x764637de
li t1, 0x9405b02b
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x52bd8943
li t1, 0xa79558ad
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc7ff09b2
li t1, 0x5928a8d9
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xffe02c8a
li t1, 0x46c42036
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7bb35346
li t1, 0xc1cb0cf3
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0x676efb49
li t1, 0xb70f2a08
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x6ca94235
li t1, 0xd8fe6d27
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a369656
li t1, 0xe163087a
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x84e6a6aa
li t1, 0x6500dfd9
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe48ba1ce
li t1, 0x2cfc9a1d
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x67f814aa
li t1, 0xa6e796e0
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6c0c321e
li t1, 0x26dbdddb
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa08fa3c3
li t1, 0xcf19f605
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc283099b
li t1, 0x86eb39f2
pv.dotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8c358a8b
li t1, 0x409ba50e
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x21a1d8cb
li t1, 0xfc87f8b3
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5b63d49a
li t1, 0xc1f92710
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x55e7d808
li t1, 0x48e7252c
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4da1a18b
li t1, 0xbefbf253
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb1424e2d
li t1, 0x27453e3
and t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a7a486a
li t1, 0xab86a8be
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3d06f18f
li t1, 0x8d476e43
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb3d53a6f
li t1, 0xf12f0ff4
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0xe9acdc2f
li t1, 0x2f3b7adb
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0x188590e6
li t1, 0x50d86e79
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xab43e4c7
li t1, 0x72f3fe95
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xe6e9c437
li t1, 0xefa2eebf
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xde7c5173
li t1, 0x5848a0e6
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdb7cce09
li t1, 0x25ec655f
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xaa362a4f
li t1, 0x1ce777e7
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x70ecd44d
li t1, 0x84e7c7a6
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd6885723
li t1, 0x462846bb
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8fc1ba93
li t1, 0xbde1748b
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e8cb424
li t1, 0x5e4207e3
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa13f2b1c
li t1, 0x4c32858b
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa35d66e4
li t1, 0xcb5e853
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6527fa6e
li t1, 0x4f7d6cf0
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x596d739d
li t1, 0x8b74da32
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd893f977
li t1, 0x3c92c2c4
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8edccffa
li t1, 0x95761dd3
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfd72348e
li t1, 0xc61c508c
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b71dae4
li t1, 0x252dd55f
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9ff17034
li t1, 0xa83dac6f
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x70e8321a
li t1, 0x9b4a6640
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xece14ed
li t1, 0x933d952a
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0xd16cba26
li t1, 0xc46fe7e0
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x669b790e
li t1, 0x3275091b
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x617b3c15
li t1, 0xef6f2880
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2b8313c9
li t1, 0x84b9ef34
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x807609c6
li t1, 0xa104332
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8220f66c
li t1, 0x19dd4d96
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9708e655
li t1, 0x3da90ea5
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x277c1594
li t1, 0x4d21c889
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f027a35
srai t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x5a95c83b
slli t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x104b5f50
xori t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x3c50ada1
ori t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x77d75c5f
addi t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x2e85cf10
srli t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x62b383d6
andi t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xad836b32
sltiu t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xb39acf83
slti t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xd429c88b
li t1, 0xb19984b3
p.subRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xe9bf5d74
li t1, 0x8d2272fd
p.subuN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x79dfd6df
li t1, 0x925e4d91
p.addN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xc0b9525d
li t1, 0x72a646ff
p.adduN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x22536531
li t1, 0xafc0166b
p.addRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x757c7cf1
li t1, 0xc0a1256b
p.adduRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x18ddc1eb
li t1, 0x583df871
p.subN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xe740effb
li t1, 0xf0d4d3d3
p.subuRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x2c7efd3b
p.extract t1, t0, 0x0, 0x3
sw t1, 4(sp)
li t0, 0x9d47323b
p.insert t1, t0, 0x5, 0x3
sw t1, 4(sp)
li t0, 0x33d66a38
p.bclr t1, t0, 0x4, 0x3
sw t1, 4(sp)
li t0, 0xba035791
p.extractu t1, t0, 0x7, 0x3
sw t1, 4(sp)
li t0, 0xd711e807
p.bset t1, t0, 0x0, 0x0
sw t1, 4(sp)
li t0, 0xfc496c40
p.clipu t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x869fdf08
p.clip t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xfac19ce
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x9521dd28
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x26110046
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x76ef8414
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xc1b0fb94
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0xbcd1aa4b
p.abs t1, t0
sw t1, 4(sp)
li t0, 0xb18d6dd4
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0xacb5a11a
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x94c872f3
pv.cmpgt.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xfa31fc2e
pv.and.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x37da5a22
pv.cmpgeu.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xc7840d7
pv.sdotup.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xa3e719b2
pv.dotusp.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x30bb29d1
pv.sll.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x6c89c09a
pv.or.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x1648d336
pv.cmple.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x629c57ef
pv.dotup.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xb75a08c7
pv.cmpleu.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xecd98492
pv.shuffleI1.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xbb4bb915
pv.shuffle.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xe89e7dda
pv.avgu.sci.b t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x392dbf51
pv.cmpleu.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x6cc7c704
pv.cmpge.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x4295ae92
pv.and.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xba6a9041
pv.shuffleI2.sci.b t1, t0, 0x13
sw t1, 4(sp)
li t0, 0xee27eb6d
pv.dotusp.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x2d6b1976
pv.cmpgtu.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x1bbdf114
pv.sra.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x16e5a5c8
pv.cmplt.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x6aa2e600
pv.dotsp.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x54396242
pv.minu.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xdd3b4d4c
pv.cmpne.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xcd8b6bdb
pv.avgu.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x86a96aab
pv.shuffleI3.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xe663125a
pv.cmpltu.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xac9141a7
pv.min.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x82073bac
pv.maxu.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xfd52e78f
pv.sdotusp.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0xf12fad05
pv.cmpltu.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x629faf74
pv.sdotsp.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x27f6d369
pv.cmpeq.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x6eaa307a
pv.min.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x9362f6db
pv.sub.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x31152139
pv.add.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x3953ea35
pv.shuffleI0.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xcb6214ae
pv.avg.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x558cf075
pv.cmpgt.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x92469505
pv.sra.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x3ca4b150
pv.cmpgeu.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x491ae984
pv.xor.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x5eb981e2
pv.cmplt.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x4c94cf23
pv.xor.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x81f2a521
pv.srl.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xf90834f6
pv.cmpge.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xbfc9300e
pv.dotup.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xc0e9d2d2
pv.maxu.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x5a4afab6
pv.sub.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x9142f6f
pv.cmpne.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x9bb83cda
pv.sll.sci.b t1, t0, 0x13
sw t1, 4(sp)
li t0, 0xf2b3a6ee
pv.minu.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x4c4244f8
pv.srl.sci.h t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x2b105227
pv.or.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x118960d2
pv.sdotup.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xd2ab4032
pv.dotsp.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xa5262f53
pv.sdotusp.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xabc1fc5d
pv.cmpeq.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x24c80399
pv.cmpgtu.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x9b076717
pv.max.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x870c4d2d
pv.cmple.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x1fa907be
pv.avg.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xcc260394
pv.max.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x4a22543b
pv.add.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xf6817add
pv.sdotsp.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x67d177c
li t1, 0x3acdf032
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0xbb7e203
li t1, 0x1b5a87eb
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3c34c96e
li t1, 0x48fc9ff5
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x103aee90
li t1, 0xc6b2189b
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x286b97a3
li t1, 0xe95d3235
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1c8966bc
li t1, 0xef8881f1
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2594ffdf
li t1, 0xaa45f676
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x13503f1b
li t1, 0xeaad62d2
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x38ec4601
li t1, 0xe20b4dd7
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2b3d3c87
li t1, 0x256767ff
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x46afdc4
li t1, 0x4ab94787
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x1382facd
li t1, 0x5760fee
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x51227e1d
li t1, 0x595f0246
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x51d6f968
li t1, 0xbbe0793a
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x3d0465c5
li t1, 0x9f71c1c6
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x135c49d1
li t1, 0x409c17f1
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x193fa1e9
li t1, 0xff548613
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x1f75c63f
li t1, 0x3c4f9f02
div t2, t1, t0
sw t2, 4(sp)
li t0, -0xd5ecdcb
li t1, 0x9e1d924c
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x40d4668c
li t1, 0xc3e2bf99
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x265025e3
li t1, 0xa1de398f
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x47667b02
li t1, 0xc1d67393
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x24f27f52
li t1, 0xc4c8b0da
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x78d2ab49
li t1, 0x9b7b6a7
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x68796918
li t1, 0x52319a92
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x3aac9398
li t1, 0x86f3d1ea
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x72abe58
li t1, 0x236fe8cc
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x6fb31430
li t1, 0xe55018bf
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x61489c0
li t1, 0x7305301f
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e39f27
li t1, 0x9b924971
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5f9a3f4a
li t1, 0xd8b70c21
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4712ea3a
li t1, 0x53db544f
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x2d43fc9
li t1, 0xed618df0
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7fcdbc85
li t1, 0xb91b18c8
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x43f98373
li t1, 0x8fa32db8
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x17f0709
li t1, 0x31daa131
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x53de99e8
li t1, 0x9cb5d97f
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5d1631d5
li t1, 0xa71ec5bc
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x153949c1
li t1, 0x6f69ad39
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4bbdae8d
li t1, 0xebe171f6
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x1e2bd90
li t1, 0x317c6aac
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc55ec239
li t1, 0xfed8b8bf
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x294f4d5e
li t1, 0x8d062d75
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0xb9c2acd7
li t1, 0x47671acb
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x719a296c
li t1, 0x3d515d3
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc341f4ce
li t1, 0x4591bf1
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa690b19b
li t1, 0x8c0464c
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x37a8fd73
li t1, 0x97ffb2a8
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x368e920a
li t1, 0x9dcc4add
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5479060
li t1, 0x16af9ef6
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x42ade503
li t1, 0x99eb1535
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5ef221fe
li t1, 0x784887e1
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x19893ff2
li t1, 0xdbf8adb5
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x14f07237
li t1, 0x9f112aee
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe02771d4
li t1, 0xdf2dfa9f
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc2765c64
li t1, 0x2ef0310
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f7ba272
li t1, 0x3f5246b9
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0xc98ace72
li t1, 0xec69c971
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8cad89b5
li t1, 0x206875b7
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0xfd3c8c12
li t1, 0x170995a2
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7a831e00
li t1, 0xab157feb
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe76598b3
li t1, 0xe09e1be
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3684dc33
li t1, 0x7dcf37a5
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x19abc2fa
li t1, 0x1d85572f
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6755bc79
li t1, 0xb32a736b
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x88d900ed
li t1, 0xb7ba23e7
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x784ec0e6
li t1, 0x395ef009
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0xb710efd6
li t1, 0xfae24a4e
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa3e43531
li t1, 0x829a38b8
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6a1bd166
li t1, 0x7fae7622
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x8dd7bd31
li t1, 0xce6f7f3f
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x924a930a
li t1, 0x47f0c232
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x87c9d08
li t1, 0x9c82b797
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x94336730
li t1, 0x545536ce
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf2ef44ed
li t1, 0x31898473
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcb61442a
li t1, 0x9fb7a5d5
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0xab0629f5
li t1, 0x8dd2054b
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf7de5a43
li t1, 0xade12d17
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x36e93c25
li t1, 0xc6ad8a1f
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x37d22d7a
li t1, 0xf928f6d1
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe06599b0
li t1, 0x74d1663d
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x885bcbed
li t1, 0x9094e7bb
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb930feb4
li t1, 0xc2234257
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4f78882
li t1, 0xd411fe2c
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd26ca970
li t1, 0x1121a8f2
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbcec1046
li t1, 0x875b7f2c
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd9e0241a
li t1, 0x5d5fa8e1
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xab2769a0
li t1, 0x3b5de237
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x24ae911b
li t1, 0x6af4e26c
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa46ff7a4
li t1, 0x69f7ce81
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xfdfcacb
li t1, 0x70339b61
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xfb6198bb
li t1, 0xab5264be
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1dfa7c98
li t1, 0xd01469fb
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0x68a38da4
li t1, 0x95517b30
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0x5e5f297
li t1, 0x4a4009e8
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5397ddf4
li t1, 0xad13db7
add t2, t1, t0
sw t2, 4(sp)
li t0, 0xe3746558
li t1, 0xbd8d1355
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd02560ea
li t1, 0x28c987c2
and t2, t1, t0
sw t2, 4(sp)
li t0, 0x2d91b922
li t1, 0x361db061
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8f51d937
li t1, 0xfbb9b61a
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x74cc01e7
li t1, 0xef372bd8
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4af29345
li t1, 0x1a128dab
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd333ef4c
li t1, 0x158e250a
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7752f7c7
li t1, 0x3540feb1
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x230f57d8
li t1, 0xbd4d565a
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x73150
li t1, 0x6573e9df
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5de34bc7
li t1, 0x9e18aed9
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0xbb6b6de1
li t1, 0x8c1a04fd
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6fbf4f0f
li t1, 0x5c38d5e8
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0xcfe3e309
li t1, 0x17bc8604
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc4402dcf
li t1, 0xd9534e90
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9e4dc805
li t1, 0x32b746e4
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf93a3ce8
li t1, 0x285b2e7
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x80bd3166
li t1, 0x4daa3fbf
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xece26ffb
li t1, 0x10d0223
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x34c8fd00
li t1, 0x8bacfc27
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdb1d76df
li t1, 0x4a73bd06
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf8edc82d
li t1, 0x7cd79b13
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3fb06537
li t1, 0x1f416e96
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x94aaf2af
li t1, 0x823aa93a
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xf2fa7023
li t1, 0x156cc2ae
pv.dotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7a7659ac
li t1, 0x798fe5af
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xaa600924
li t1, 0xc11937e0
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xca2bc235
li t1, 0x408ddd3c
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf054582b
li t1, 0xd72301f3
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x91d4a6b0
li t1, 0xcba878d0
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xbbdfa81b
li t1, 0xb1d308b9
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd3fdd5f4
li t1, 0x75e60e90
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f484abb
li t1, 0x6f70873e
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4fcf9b2
li t1, 0xf23dbf9c
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x5c2493e5
li t1, 0xe968ede4
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xec4d2bbe
li t1, 0x40dddf4
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb573b55c
li t1, 0xabcc7d67
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa2451ef1
li t1, 0x17bde727
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x56a05a17
li t1, 0x3e0ac1d5
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7b4881bc
li t1, 0xf2ea7961
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf5b75b48
li t1, 0x75cfaebd
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9601ab69
li t1, 0xb560c1b8
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8acdaba7
li t1, 0x4f3516e6
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf7bc525a
li t1, 0x98970b09
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1bf099c4
li t1, 0x23c517c8
or t2, t1, t0
sw t2, 4(sp)
li t0, 0xd8807802
li t1, 0xd170bb8a
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf5fc2bc
li t1, 0xc13a6948
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x96f42766
li t1, 0x36904c51
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8e2006a
li t1, 0x12fa0243
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x520d654d
li t1, 0x8a1a67e5
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4ffad48e
li t1, 0x7a51eea
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd61f4bfd
li t1, 0x5494cb5c
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x60121075
li t1, 0x6fe88653
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x26174fb4
li t1, 0xf2fc707c
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fd9ad1
li t1, 0x57f0af7d
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe0d7ee31
li t1, 0x96966c64
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9353671f
li t1, 0x9a7dfb1c
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe100a33f
li t1, 0xd6a68f39
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x86d6bff5
li t1, 0xbcfa459
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a190934
li t1, 0xb0a0b0df
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0x30d0d2c1
li t1, 0xee4d407a
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x74d01371
li t1, 0x1cc5aa8f
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xefd1c172
li t1, 0x265311e
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0x7e266131
li t1, 0xa420f747
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x5cf41596
li t1, 0x5a07151d
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x58b33a28
li t1, 0xe2e0e55c
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8bf6ff99
li t1, 0x2ccb9090
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x980643e2
li t1, 0xc3cfa521
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9e8dbc35
li t1, 0xdf1681c7
pv.dotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9d7b9c7f
li t1, 0xaee414c8
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbdc45f1c
li t1, 0x8a638392
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6334ff6
li t1, 0x988d202f
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x21ce8191
li t1, 0x43045dc2
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0xa073dee4
li t1, 0xc69dd0f
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xee7dc82c
li t1, 0x1f264798
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x86c07145
li t1, 0xd19f8c48
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xeddbfa88
li t1, 0xb625794
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f46f46f
li t1, 0xf6c234c4
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x464ed403
li t1, 0x1aaaeb13
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa770c363
li t1, 0xbd5d0700
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd25d9bfd
li t1, 0x6c740c5f
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x144767f8
li t1, 0x52ae5aac
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0x7c93e19
li t1, 0x6c756d94
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf0105bda
li t1, 0xebd83db1
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a11f5dc
li t1, 0x3f42d5bf
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc0b2039f
li t1, 0xaa444af7
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x34e26cf0
li t1, 0xb642883f
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc545253a
li t1, 0x68270284
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x87c95b7d
li t1, 0x787f2559
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0x5ea4fcd8
li t1, 0xd58e41fb
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xaf1c8d9a
li t1, 0xaa393c74
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbc1fe0f1
li t1, 0x12898267
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc7a940ae
srli t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x8b2f6acb
slti t1, t0, 0x13
sw t1, 4(sp)
li t0, 0xe1f49f82
andi t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x8c51292a
xori t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x5ef88355
ori t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x438dd59a
srai t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x408e8d7f
addi t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xea2961cc
slli t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x7816b613
sltiu t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xd01df6b8
li t1, 0x64da0d1c
p.subRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xe18f13c6
li t1, 0x5ca116c0
p.subuN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x628dfb18
li t1, 0xd259678d
p.subN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xd0e0d09f
li t1, 0x6150bf9
p.adduN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x58146b98
li t1, 0x84af9dfb
p.subuRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x5aedb06b
li t1, 0xa981f2c
p.addN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x6a7748c9
li t1, 0x54eba45f
p.addRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x5d9024cf
li t1, 0x638383a
p.adduRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x89eb7052
p.bset t1, t0, 0x6, 0x2
sw t1, 4(sp)
li t0, 0xf93e3754
p.insert t1, t0, 0x7, 0x1
sw t1, 4(sp)
li t0, 0xb6552c2b
p.extractu t1, t0, 0x5, 0x0
sw t1, 4(sp)
li t0, 0x4ed18b77
p.bclr t1, t0, 0x2, 0x1
sw t1, 4(sp)
li t0, 0xeca609a4
p.extract t1, t0, 0x5, 0x3
sw t1, 4(sp)
li t0, 0x2a1f54fc
p.clip t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xf59200e4
p.clipu t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x229d1430
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xbb549d40
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x75eac4ff
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x8d46a188
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0xd6d5477f
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0xdb235954
p.clb t1, t0
sw t1, 4(sp)
li t0, 0xbeb46842
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x9742f0db
p.abs t1, t0
sw t1, 4(sp)
li t0, 0xe8bab62d
pv.cmple.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xe769cb96
pv.or.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x3b9ad0d1
pv.avgu.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xa05f0645
pv.cmplt.sci.b t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x977415e4
pv.xor.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x4bec5be
pv.cmpltu.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x7e162a83
pv.xor.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x253e27ac
pv.minu.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xdfcf7948
pv.min.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x74bb664c
pv.sdotsp.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x86d4bf68
pv.avgu.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x1101dc8b
pv.shuffleI3.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x256176f
pv.add.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x607fa534
pv.cmple.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x360bce2
pv.maxu.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x289beec
pv.cmpleu.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x1c701c29
pv.sdotup.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xa3f6e12a
pv.sra.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xd37fc1f6
pv.sdotusp.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x6b0c9be
pv.cmpgeu.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x11cfb82a
pv.dotusp.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x3c2b9e6
pv.sll.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xdf1a69ee
pv.cmpge.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xb4871afc
pv.cmplt.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x9d2c8848
pv.minu.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x44bcbd5
pv.cmpleu.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xe27e3bc7
pv.cmpne.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x1b2f2ad2
pv.dotusp.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xb9a8d031
pv.dotup.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xd89aa4ff
pv.avg.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x45edc76b
pv.or.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x146a2def
pv.cmpeq.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xb63b4aa5
pv.add.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xf70f76b6
pv.sub.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xc1dfe6db
pv.max.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x9032f706
pv.srl.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xa12cf104
pv.srl.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x1e1ded95
pv.sdotsp.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x21c570c5
pv.cmpgtu.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x7995272c
pv.dotup.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xc3075e7
pv.cmpgtu.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x7a2433ef
pv.cmpge.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xc0f7c2d1
pv.shuffleI0.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xa2700659
pv.shuffleI1.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x20083dd6
pv.sdotusp.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x44619dbf
pv.dotsp.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x436c1346
pv.shuffleI2.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x7b6bf3cd
pv.sra.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xf5cd2440
pv.avg.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xca7141c7
pv.and.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xb32026ff
pv.cmpeq.sci.h t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xedebef91
pv.dotsp.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x70393259
pv.cmpltu.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xcb72c793
pv.shuffle.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x869e4b4d
pv.cmpne.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x8e60a379
pv.sub.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x41846558
pv.sdotup.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xad198a6a
pv.max.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xc83c1262
pv.sll.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x8214df2f
pv.and.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xe7bb46d8
pv.cmpgt.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xdc7aaf57
pv.cmpgt.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x24ac285a
pv.cmpgeu.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xd33edd81
pv.maxu.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x7c2c96ef
pv.min.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, -0x589f7bb6
li t1, 0x2db3c5b5
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6863b1ac
li t1, 0x73d00b47
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6b8d48cb
li t1, 0x743d9f0d
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x605d8be0
li t1, 0x18d8a49a
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7fd99d7c
li t1, 0xbe89d23
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4b66f5e6
li t1, 0x6d699ea8
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1116b88f
li t1, 0xbb5d1646
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x12bd66af
li t1, 0x8e449d48
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x23aedef5
li t1, 0x7d770b91
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x636b6fe6
li t1, 0xd65e3c0e
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x74ff59ba
li t1, 0x93149151
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x738bc141
li t1, 0x1511b591
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x222514e3
li t1, 0x55425d08
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x170ee5fa
li t1, 0x2e71000f
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x74f48e66
li t1, 0xde5df2b3
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1cf1bd60
li t1, 0x559eaa98
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x518347c4
li t1, 0x2e3df7d6
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7b803898
li t1, 0x251a72d9
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3d4d88c6
li t1, 0x22a94790
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2c904859
li t1, 0x29a0e476
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6c4a380d
li t1, 0xb7429920
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x260ca98c
li t1, 0x699505b
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x239bd720
li t1, 0x30628ff1
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x3f061c92
li t1, 0x496aac95
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x34993d1b
li t1, 0x1d5940ff
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x24fbdf78
li t1, 0xe5a59546
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x6ff73e6d
li t1, 0x43e50ac4
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x6c6b6f85
li t1, 0xe277d01a
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x324aa930
li t1, 0xd81401d
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x11e66891
li t1, 0x64629fd5
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x676997d1
li t1, 0x961d3c8d
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x3e5f5a77
li t1, 0xc547691a
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x6de3045f
li t1, 0xc242c214
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x142eeb72
li t1, 0x18da9c42
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x102b5162
li t1, 0xe0710d7a
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x520e15e8
li t1, 0xe4704da2
div t2, t1, t0
sw t2, 4(sp)
li t0, -0xae1f03
li t1, 0x93a20d9
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x660413c4
li t1, 0xae87ed5d
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x43dddd67
li t1, 0x597e8da7
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x5576bcf
li t1, 0x8c555a8
div t2, t1, t0
sw t2, 4(sp)
li t0, 0xbc9b8e35
li t1, 0x615375c3
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb00cee69
li t1, 0x764e11f4
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9c8dcbcc
li t1, 0xb7867a68
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf4d5cfbd
li t1, 0xf8a72f04
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6ef72516
li t1, 0x6a9aae7a
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf6d28635
li t1, 0x65bf24ec
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x817b17bd
li t1, 0x6764342b
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x38729382
li t1, 0x26bd8eda
and t2, t1, t0
sw t2, 4(sp)
li t0, 0xfad97396
li t1, 0x453201f5
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x98d89982
li t1, 0x8f4f08bd
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x61569f7c
li t1, 0xb7e2ec4a
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf9a7d376
li t1, 0x64a5f165
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8e1da6ec
li t1, 0xcee14d24
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xaca6314b
li t1, 0x31c314cc
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf88660eb
li t1, 0xba32e9e0
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x818c2cd7
li t1, 0xc04e4679
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9839ec9f
li t1, 0x6496a72b
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd8b6c6f1
li t1, 0x57f44ee7
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb44c4b11
li t1, 0xf13d9e3a
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf69958ef
li t1, 0x3be0a77c
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0x4a37fb52
li t1, 0xa76e7991
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f8fbcd6
li t1, 0x8d67cb6b
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3bf49b27
li t1, 0xaf663f19
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe127aaac
li t1, 0x6dd457b
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb1a5276
li t1, 0x1f4a91d1
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x70475316
li t1, 0x876feb98
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xeabfa1b9
li t1, 0xf9de5fcf
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc9d2e229
li t1, 0xa5104c65
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xadc1252b
li t1, 0xeec6fe6e
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0x87175788
li t1, 0x913c4bbb
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xde4d9f1f
li t1, 0x7a78aae4
pv.dotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2982e58e
li t1, 0xe7f87be1
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbc3c102a
li t1, 0xad869c3d
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd0bb1134
li t1, 0x6969e63b
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x75063593
li t1, 0xfa297529
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x374aadd2
li t1, 0x26083be8
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x76c0f5c9
li t1, 0x7d272b66
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b30fa7e
li t1, 0xe9af0d97
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x89dcd02d
li t1, 0x7d654f6c
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x9e7d5d33
li t1, 0x9784b444
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb7f0e6a
li t1, 0xf750d03e
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a46717c
li t1, 0xe2507362
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1904fb44
li t1, 0x87e382b4
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f2ee6ca
li t1, 0xe98c3ac9
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9749e052
li t1, 0x9a67a977
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x85d84b4a
li t1, 0x2725bfa8
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf8e09
li t1, 0x6332c786
add t2, t1, t0
sw t2, 4(sp)
li t0, 0xcdcf3217
li t1, 0xc1fbbb47
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x29f5ccd7
li t1, 0x6c66a5f6
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x808b330d
li t1, 0x9d4280a2
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1be3a829
li t1, 0xaeab5479
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0x12b39015
li t1, 0xcd0ec422
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb7244b1e
li t1, 0x88defbc7
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x86d30d6a
li t1, 0x92eb2c7e
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0x3937ba5a
li t1, 0xa0d78434
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f099207
li t1, 0xce97cb17
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x1c513fcb
li t1, 0xdc021406
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x97e5a0aa
li t1, 0x8fb8e466
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8cfcf6f8
li t1, 0x675b6313
or t2, t1, t0
sw t2, 4(sp)
li t0, 0xec4a56d9
li t1, 0xee26cc60
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0xbd0bc56c
li t1, 0x94a7b5c4
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0xf7cfc92c
li t1, 0x9579f6c6
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x22302e1b
li t1, 0xf6e6515b
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0xf1605c0b
li t1, 0x8b6b076f
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2b0e678b
li t1, 0x5af27215
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3a9c4fa8
li t1, 0x8aa1803
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2c615455
li t1, 0xd8ae0ac5
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1ee27330
li t1, 0xee6a7455
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1e3b4821
li t1, 0x11f5bb1f
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x11435e7
li t1, 0xafc50384
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x98edbf1d
li t1, 0xeb5381ee
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x57d4df18
li t1, 0x82c999c0
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fe393d5
li t1, 0xb441205e
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2715e3c7
li t1, 0xb867ae7a
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa9f681f6
li t1, 0x9d6304cb
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xefaea5ea
li t1, 0x7d697fd5
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa9462006
li t1, 0x19c9122c
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9fc54e6c
li t1, 0xed7a3d56
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0x20b40fa
li t1, 0xe52477c4
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb8198363
li t1, 0x752c0a80
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x11c33b9a
li t1, 0x94a85a9d
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x31543927
li t1, 0x8c478257
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3c3ad4c5
li t1, 0xbe3f33a2
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x9e972a71
li t1, 0x10e6bb49
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7973eca5
li t1, 0x5235757c
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x34e16fa1
li t1, 0xe428b313
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4fdb15cd
li t1, 0x95892a1b
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa75477dd
li t1, 0xc45514b3
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf2a37609
li t1, 0x39ff5dbb
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfcc7e266
li t1, 0x3c9196ff
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9ad0707d
li t1, 0x1cb42905
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe09fb9d4
li t1, 0xf1469c3
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe3f112cb
li t1, 0x9bab4f30
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0x68ea489f
li t1, 0x3b6af4a9
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb5101d43
li t1, 0x2f8eac83
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc2e85e40
li t1, 0x78dae7fe
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe7365c4
li t1, 0xe5b3fb58
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x34f2e1fc
li t1, 0xa2abaf84
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b190a20
li t1, 0x3b83de4a
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0xf1ac0bdc
li t1, 0x3646129f
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0x50cddcb6
li t1, 0x23985d58
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xacce9c21
li t1, 0x9f5efbe8
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x63e27a90
li t1, 0xe761ec2f
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x2d842d52
li t1, 0x27974668
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x70af8996
li t1, 0x2d595ba4
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc3654be9
li t1, 0xc329e065
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb7442a6b
li t1, 0xe3b4f655
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x58c63577
li t1, 0x426c9925
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4791cb2f
li t1, 0xa6c79c04
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x652babde
li t1, 0x381e00d2
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xac28612a
li t1, 0x68d53025
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0xa9c619ba
li t1, 0x1a2b1911
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x79538520
li t1, 0xe24cc51b
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xafb7573b
li t1, 0x3b837bc1
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3e74a445
li t1, 0x6684b61a
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x72681358
li t1, 0x4e0bbea6
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9d9ed76c
li t1, 0x5d81b95e
pv.dotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc1df087e
li t1, 0x3e078fc0
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe47349b9
li t1, 0x203936ac
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x379ff0a1
li t1, 0xd94914bc
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5b1c7f0
li t1, 0xf7be61f0
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xad29c32e
li t1, 0x32c26d86
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0xf6ec0301
li t1, 0x87f77619
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x41150d00
li t1, 0x28f70d5f
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0x5dbdf578
li t1, 0x294cc8f5
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x22e99f25
li t1, 0x498d59c3
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x252909c2
li t1, 0x81a536e9
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x842587e6
li t1, 0x461c2880
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1af11fd5
li t1, 0xba6815ee
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbeb07f5c
li t1, 0xe9f137d2
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd0a60ed2
li t1, 0xe0cb9ad0
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x35d5549f
li t1, 0x1cdbaa2f
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x94670f0
li t1, 0x2b849f21
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8383b8c3
li t1, 0x5b639224
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5229cdeb
li t1, 0xef178e7e
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x81baccc7
li t1, 0x3dbae67d
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x68e7211d
li t1, 0x512e0402
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa3771dce
li t1, 0x4be21347
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x89454adf
li t1, 0xe0f2159c
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x43a19937
li t1, 0x415f4d33
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f8072a2
li t1, 0xbb75753b
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd32830e0
li t1, 0x2b97c74c
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4733cf9
li t1, 0xb94593b3
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xd43d1cc4
li t1, 0x1ccab6a4
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a164163
li t1, 0x8608eb17
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x49cae033
li t1, 0x10680b80
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb5576587
li t1, 0x18f105a7
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0xebb33476
li t1, 0xcac6486d
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdaa4652d
ori t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x40984055
srai t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xc328a7f7
andi t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x1b69a24f
xori t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x96973f23
slti t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xbd3b1be1
slli t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xa9b5a705
addi t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xc380e84f
sltiu t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x8f73b0be
srli t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x5802f6fd
li t1, 0x504e3453
p.addRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xdf0d1cda
li t1, 0xd1ba8fa9
p.subN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x2ea6e962
li t1, 0x1b335e06
p.subuN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xbda52189
li t1, 0x52340cce
p.addN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x81cd7b42
li t1, 0xca686da6
p.adduRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x133b685e
li t1, 0x4ead6d9c
p.adduN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xf82183d4
li t1, 0x8382a14e
p.subuRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xb66348f6
li t1, 0xeb98330f
p.subRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x4fc1ecd2
p.extractu t1, t0, 0x6, 0x3
sw t1, 4(sp)
li t0, 0xd0a5d4a0
p.bset t1, t0, 0x5, 0x2
sw t1, 4(sp)
li t0, 0xf0ff498a
p.insert t1, t0, 0x0, 0x1
sw t1, 4(sp)
li t0, 0x42d31a08
p.extract t1, t0, 0x7, 0x3
sw t1, 4(sp)
li t0, 0x434a8545
p.bclr t1, t0, 0x3, 0x0
sw t1, 4(sp)
li t0, 0x98198e48
p.clipu t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x609a15e2
p.clip t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x4ffa1b16
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x6d948d76
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x71456f5b
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x18a95202
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x456ed907
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x6508953c
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0xae54b03f
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0x6d55c644
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x26beb715
pv.and.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x21341769
pv.min.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x575267e6
pv.cmpltu.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x7e80b716
pv.sdotusp.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x1f2221bd
pv.shuffleI0.sci.b t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x5e77f438
pv.avgu.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xa5676c2b
pv.cmpeq.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x25f74832
pv.sdotup.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xc7947ec4
pv.cmpge.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x839e06c
pv.add.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xace4d97a
pv.dotup.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x59adf04e
pv.dotup.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x20eb8a2f
pv.dotusp.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x95d84534
pv.xor.sci.h t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x3a356d74
pv.cmpltu.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xb435d3c7
pv.xor.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x7e960c34
pv.sll.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x359a47b6
pv.cmple.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xa0d0e228
pv.srl.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x37352daf
pv.sll.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x1dacff2d
pv.or.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x12798667
pv.sub.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x29b91aaf
pv.sdotsp.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x6653c10f
pv.max.sci.h t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x9139ca38
pv.cmpge.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x42a9a1e0
pv.sdotup.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xe5651efc
pv.cmpeq.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x201bceed
pv.shuffleI2.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xefd7d6a0
pv.maxu.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xe211aeb9
pv.cmpgt.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xfeea3893
pv.sub.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xb60243da
pv.dotsp.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x550a3360
pv.add.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x167c1b78
pv.cmplt.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x86dbab02
pv.cmple.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x5f82cfe4
pv.max.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x267270c5
pv.cmpleu.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x6ea3dca8
pv.and.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x7166f6b7
pv.dotusp.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x6689f66f
pv.sdotusp.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x89b939c0
pv.cmpgt.sci.h t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xc40d91f4
pv.sra.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x9e2b02d7
pv.minu.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x77996aff
pv.cmpgtu.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x4d9db539
pv.avgu.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x7e521c83
pv.shuffleI3.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xba316acb
pv.sra.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0xc56ba646
pv.min.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xfd04944f
pv.cmpleu.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x43f956a
pv.dotsp.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x3b928fb3
pv.maxu.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x6753c9e6
pv.avg.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xa5936665
pv.shuffle.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x550d30b9
pv.sdotsp.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x681f8d0d
pv.srl.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x39ef04ca
pv.cmplt.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x27528737
pv.or.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x577cc15
pv.cmpgeu.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x5a587b9b
pv.cmpgtu.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x74eab96
pv.minu.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xa0c73490
pv.shuffleI1.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x955592
pv.cmpne.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x74277da
pv.avg.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x37f3eacd
pv.cmpgeu.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x2a550fbe
pv.cmpne.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, -0x27b91be0
li t1, 0x2c4c6e00
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x303be2a3
li t1, 0x1eecd119
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x228a88d2
li t1, 0xc1dbba6f
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0xc1ea45d
li t1, 0xd25b7164
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7195a2fd
li t1, 0x8f2fd0c4
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7425341e
li t1, 0x8f957461
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2d301037
li t1, 0xc9506546
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1d17bd20
li t1, 0xed65f390
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4a32ba2e
li t1, 0x99882499
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x38d0a04d
li t1, 0xca90e9ab
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x185824c
li t1, 0xe14f2e0a
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x75cfb24c
li t1, 0xb4e221b6
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0xafbe6a
li t1, 0x49b9bb0b
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x21665d2f
li t1, 0x6b6391d
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x77f9dcc3
li t1, 0x36dd9a7b
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x66e0e14e
li t1, 0x3ef35138
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1c08a846
li t1, 0x2a137cf6
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x72cad18
li t1, 0xb58139dd
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x438d4e02
li t1, 0xefdf5bd5
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4b841ee5
li t1, 0x9707a4c9
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0xf71206f
li t1, 0xb1eb7768
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x32141b36
li t1, 0xbf526e42
div t2, t1, t0
sw t2, 4(sp)
li t0, -0xc26d6a0
li t1, 0xff0eeeb1
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x503f30f7
li t1, 0xa2182bb4
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x5ce86620
li t1, 0x53beb5f0
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x204c4c5d
li t1, 0x776e7630
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x3dd54b8d
li t1, 0xe878cd79
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x74bb9c1b
li t1, 0xc3455ebc
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x46701d80
li t1, 0xe7413c81
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x1595e775
li t1, 0xe15ab2ea
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x305002a8
li t1, 0x613b6c71
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x7053a1fa
li t1, 0x440c8d8a
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0xb699eea
li t1, 0x799e5a71
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xf80da8
li t1, 0x82202b8a
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0xa0c1b16
li t1, 0xa59715f0
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x3472c10b
li t1, 0x34c374d8
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x45052799
li t1, 0xefb486da
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x72a93f89
li t1, 0x3a397b0a
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x708fce2
li t1, 0xdbe32780
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x3f18df56
li t1, 0x27710a4d
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x7d5621ba
li t1, 0x31144fb9
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd93b397f
li t1, 0x573722e2
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3370f76e
li t1, 0x500849e1
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6c9029ff
li t1, 0x23cc39c2
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x55c5d0c3
li t1, 0xc8bc9fc6
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0xf0650b7c
li t1, 0xfc655465
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x897eed83
li t1, 0xceecf42a
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x56022483
li t1, 0xf25cc2de
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa0751b99
li t1, 0xfb968dac
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc4215c7
li t1, 0x9eaaa021
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcb6e01a0
li t1, 0x2edaa57d
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc0620ac1
li t1, 0xe7d30d2c
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x58731454
li t1, 0xe10e7674
add t2, t1, t0
sw t2, 4(sp)
li t0, 0xf03e95b5
li t1, 0xb3356dce
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x204c595f
li t1, 0x8b803ae6
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8eaef2a3
li t1, 0x6b58eb29
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2d4093c1
li t1, 0x692baaf7
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd23a005a
li t1, 0x428e4280
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbd16fde1
li t1, 0xda8b18c1
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3cc478fb
li t1, 0xbac6dcd
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa04bd029
li t1, 0x740d2544
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xab9f26d4
li t1, 0x8ca9fc76
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x47fb2ee3
li t1, 0xd8d50f7d
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x614cc9aa
li t1, 0xaf01a020
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcdada275
li t1, 0xc717b124
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x94fcbc13
li t1, 0x2637d85d
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x72ba8d53
li t1, 0x59033e4
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4acd7e88
li t1, 0x7331d31
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x21211470
li t1, 0xb30c1f5e
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x245dd5b6
li t1, 0xf4c692be
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5e0c324
li t1, 0x387b98d3
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd3500bfc
li t1, 0x33a33e24
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb25ddb0a
li t1, 0xed5c1fe6
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe735fb7
li t1, 0x9fd5c012
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb34f06db
li t1, 0xb6b245b5
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b2aeb05
li t1, 0x93a88388
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x3a5a6ad5
li t1, 0xc742b57c
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa48b511a
li t1, 0xf7feecae
or t2, t1, t0
sw t2, 4(sp)
li t0, 0x2eb4cb1b
li t1, 0xba48fe35
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe0b73579
li t1, 0xd60a25c0
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5eda5619
li t1, 0x23fb9b90
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f1ef8a8
li t1, 0x8e61b741
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd1d11353
li t1, 0xc0ffc195
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd3d07608
li t1, 0xd63b8368
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x348ba2fe
li t1, 0x22bc21c5
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5e8b952
li t1, 0x5db42ddb
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0x9f3b4fb5
li t1, 0xfd46913
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0x978ce76d
li t1, 0xa66a7843
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0xc7f66ce9
li t1, 0xb8de5bb1
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x51725ef5
li t1, 0x86b95794
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7d77c00c
li t1, 0x8ef3addf
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1835de8a
li t1, 0xe3d6479e
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfcba8e49
li t1, 0xa1ec1cc4
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a0b35b6
li t1, 0x7edcecc7
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7d2a5638
li t1, 0xbc73afb5
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xaf428f2a
li t1, 0xdc2f3217
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc223124a
li t1, 0x9ddf9df8
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x752ecc23
li t1, 0x86961c27
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0x9297a75d
li t1, 0x2963a777
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6c8c0fbe
li t1, 0x1a4f85d3
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x98cfb95f
li t1, 0x43095434
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6a1f9eb5
li t1, 0xa2a6dc01
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0xe4fec1d8
li t1, 0x529a8816
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9ad7e7bc
li t1, 0xc518d5e
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd3b5b362
li t1, 0xbd95bb66
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3129e220
li t1, 0xe6e2a508
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4460f935
li t1, 0xcb31e5bd
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7142d768
li t1, 0x8ffbe3c
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4a7e0199
li t1, 0x282ae36d
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8efbbf1a
li t1, 0x300c50dc
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x944a42a1
li t1, 0x58cc238
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x963b647e
li t1, 0x1c559645
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x60d79ea5
li t1, 0xdca2ba4a
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xed604d74
li t1, 0xfb6f155
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xedecf047
li t1, 0x8c009506
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcdfe1e66
li t1, 0xc21ff842
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc6e1e968
li t1, 0x7e395b95
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x73bbdd49
li t1, 0x29ff34f6
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x54a8a18b
li t1, 0x2f041fad
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1f67413d
li t1, 0x118e7dca
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd037a1dc
li t1, 0xea96b348
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb81c4fc
li t1, 0xdbe29e37
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4e913987
li t1, 0x3e429617
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8adbdfe9
li t1, 0x964b75fa
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5cd12db4
li t1, 0xa38b4481
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6f0c3f
li t1, 0x141962eb
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x74c3f444
li t1, 0xc70ad38c
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x242bc5bc
li t1, 0x62ae2a8a
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x36b19117
li t1, 0xff7fd742
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb4b344a
li t1, 0xfede4abb
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf4d7ad46
li t1, 0x9829dbc4
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x68fe3d19
li t1, 0x73824544
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6f2163f
li t1, 0x1386a002
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb4a060b1
li t1, 0xc0b70c92
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x31742e85
li t1, 0x5154606c
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xff834211
li t1, 0x87702028
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x53c4bda7
li t1, 0xff097b72
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0x9ecd8319
li t1, 0x43d795bb
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x98935495
li t1, 0xa51d440c
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5b828580
li t1, 0x900ec05e
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6a509b31
li t1, 0x74554514
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe5761a0
li t1, 0x72114b68
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1e61d05b
li t1, 0x8ae436fd
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x45bb7c89
li t1, 0x5f00e24c
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d659af2
li t1, 0xbc3521cf
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9f95194f
li t1, 0xcbb03346
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3f901530
li t1, 0x4a3d2dad
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9c6ca1df
li t1, 0xc645c618
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x85e018d6
li t1, 0x6ac033ea
and t2, t1, t0
sw t2, 4(sp)
li t0, 0xd7e74f6f
li t1, 0x99751fe2
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2065570
li t1, 0xac4cd341
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb25caae7
li t1, 0xdb2833ef
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe87a1382
li t1, 0x4f5152ea
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd7f4f2a0
li t1, 0x768b23c6
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x28fcd636
li t1, 0x57343f10
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x3381284f
li t1, 0x875aaf09
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e1a586a
li t1, 0x26a99a98
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x65864304
li t1, 0x1a5eba5c
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc3b3da1a
li t1, 0x1377ae2d
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f9301d4
li t1, 0xe1759382
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x16ba1cbb
li t1, 0x7e5c88fd
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd8ac2799
li t1, 0x291c2688
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3361c89e
li t1, 0xe1d5d728
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc25c9dab
li t1, 0xa4faffeb
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0x93774fe5
li t1, 0x390f0e5c
pv.dotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9389040e
li t1, 0xe118f942
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3876703
li t1, 0x11029296
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5e748c78
li t1, 0xfad1f793
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8515f34f
li t1, 0x1d975f49
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xafa44ec2
li t1, 0x61b6109
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x98c11015
li t1, 0x7911fb8a
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d479f8f
li t1, 0x921d78e7
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa80efd48
li t1, 0x5cd5020a
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc81793a1
li t1, 0xf23d30e9
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfa33d8d9
li t1, 0x2c5bd1a2
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x60f4b421
li t1, 0x5ce8f9f7
pv.dotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x46d9c0af
li t1, 0x4cc94f6d
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0xfad459d2
li t1, 0x9310c3bb
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x56b14ed6
li t1, 0x74f90ea1
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f3b48ff
li t1, 0xf8cb8519
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7b64e348
li t1, 0x89f7d448
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xde296297
li t1, 0xec482191
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x51bd5041
li t1, 0x169c5327
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0x261d888f
li t1, 0x5431e7bb
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x81fcb9ff
li t1, 0xbf80222f
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6edc1eb0
li t1, 0x30315943
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x36833468
li t1, 0xe3700330
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x165a8d30
li t1, 0x8adcd9ae
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x375eca4a
slti t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x7ffb6399
sltiu t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xd220b8f1
ori t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x668d769f
slli t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x36a0c190
srli t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x330f1bf7
xori t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x6e646596
andi t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xa5bd59be
addi t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x8d42c9b6
srai t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x78f9cdb9
li t1, 0x7003961c
p.subRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x92719b55
li t1, 0x8325a60d
p.adduRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x50f24d9b
li t1, 0x591316f5
p.subuN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x225f404e
li t1, 0xb16662fc
p.addRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xd91ba1c2
li t1, 0x502d2541
p.adduN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x952e6018
li t1, 0xd0ac0508
p.addN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x12b1611a
li t1, 0xaefa7290
p.subuRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x34291c4d
li t1, 0x420b9ff0
p.subN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x6415692f
p.insert t1, t0, 0x1, 0x2
sw t1, 4(sp)
li t0, 0xb2283996
p.extract t1, t0, 0x3, 0x2
sw t1, 4(sp)
li t0, 0xd4009392
p.extractu t1, t0, 0x5, 0x2
sw t1, 4(sp)
li t0, 0x72ccb3ef
p.bclr t1, t0, 0x4, 0x3
sw t1, 4(sp)
li t0, 0x9eac2c98
p.bset t1, t0, 0x5, 0x1
sw t1, 4(sp)
li t0, 0xd0783bfd
p.clip t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x405b995c
p.clipu t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xeb564a8
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xdfe78312
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x2aef11d
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x5e00e62b
p.exths t1, t0
sw t1, 4(sp)
li t0, 0xf0033477
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0xa1c687e9
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x56b88e99
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x797585c8
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0xf1856170
pv.minu.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x893ddc0d
pv.or.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x44c3b3c5
pv.sdotup.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xa00f4c8
pv.dotusp.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xe072dc53
pv.xor.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xbacd89c5
pv.srl.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xaf59f303
pv.shuffleI1.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xc807e0f2
pv.cmpleu.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x69ee6e60
pv.cmpne.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xb80a18e6
pv.dotup.sci.h t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x5e460f06
pv.cmpge.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x1c3a39c9
pv.sra.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x7e207584
pv.srl.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x63828e73
pv.maxu.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x2e53931f
pv.cmpgeu.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x6c5df578
pv.shuffleI2.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x4d0bd7a9
pv.cmpgt.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xc07482da
pv.sub.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x1a4f20e6
pv.dotsp.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x4fb551d7
pv.dotup.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x7ebfdd2e
pv.avg.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x140deb9b
pv.maxu.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x32ddd2c
pv.sdotusp.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x218e2b37
pv.avgu.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x9ec0312
pv.avg.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x380442ee
pv.sll.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x8363fab1
pv.cmple.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x8d2ad4b6
pv.cmpeq.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x57eaf73
pv.sll.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0xd7ce9540
pv.cmpgtu.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x2f1f4286
pv.shuffleI0.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x7a9dd9f6
pv.shuffleI3.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xfab93aaa
pv.or.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xec7fb5e8
pv.and.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x1cc0734c
pv.cmpltu.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x8757c155
pv.max.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xcb46b015
pv.min.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x42750ec6
pv.cmpleu.sci.h t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xa9a83873
pv.cmpeq.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x82767c1d
pv.sdotusp.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x8d08edd4
pv.cmpgt.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x971881a9
pv.cmpltu.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xf14cf51a
pv.dotusp.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x64fa119a
pv.sdotsp.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x781c3b79
pv.cmplt.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xb3e15cb7
pv.dotsp.sci.b t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x312c0cb0
pv.sra.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xa11cd6
pv.cmplt.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x5dfaaee2
pv.xor.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xa2b3020a
pv.minu.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x8a59779f
pv.max.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xed63cb19
pv.add.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x3b1fe3e7
pv.cmpgeu.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xb656c649
pv.add.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x8cadf87a
pv.shuffle.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xb61ebdc5
pv.cmpgtu.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x822f21b7
pv.and.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x9b4e7bc8
pv.sub.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xb1bf2a9e
pv.cmple.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x1242c481
pv.avgu.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xd8e05b8e
pv.sdotup.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xe37b0753
pv.cmpge.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xd372f4e0
pv.min.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xeeb3f627
pv.cmpne.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xbaa54c71
pv.sdotsp.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, -0x43b17d18
li t1, 0x2c784834
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x6f52847f
li t1, 0x6fb551c5
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4bd8cf2a
li t1, 0x4db7e5e2
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x26703aea
li t1, 0x816559c9
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x751e4a46
li t1, 0xa9096c86
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x6a9bda79
li t1, 0xe94c83ee
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x2fca8ec2
li t1, 0x1053bbdc
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4a762f95
li t1, 0xdea7326e
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x30c78f80
li t1, 0x86251feb
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x28a38b7e
li t1, 0xa5b0f45d
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x784b6cbc
li t1, 0xdd1e1e38
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4c2feea8
li t1, 0x4509021
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2de4198c
li t1, 0x42e25130
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x16fd2dbb
li t1, 0xf6c387c6
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5b3b28a5
li t1, 0x7ab7ee28
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7d1987ff
li t1, 0xc48d0a2e
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6ed79b32
li t1, 0x5a7038e2
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x16dccd0
li t1, 0xfca4641b
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0xd63a5f3
li t1, 0xc94d2406
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5362d6fb
li t1, 0xa8ae7645
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7499e82f
li t1, 0xc60c7fe0
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0xa011419
li t1, 0xf99f621a
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x6acb0c80
li t1, 0xfc8ffa31
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x21aef38
li t1, 0xa308c1b0
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x7e553590
li t1, 0xbdcd5eff
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x250343d8
li t1, 0x957eb655
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0xda9825d
li t1, 0x459528d1
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x484ece2
li t1, 0xe1e0c60d
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x6c7ced50
li t1, 0xc897cf5c
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x50cf1b28
li t1, 0xc7b5788f
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0xec31736
li t1, 0x32597e28
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3431a647
li t1, 0x2fe92e85
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0xc0e24a1
li t1, 0x320efea8
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x61fdc4f4
li t1, 0xd6e5f4e3
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x34964802
li t1, 0x21231a94
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7409d53b
li t1, 0xfa86f3b9
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5ae91389
li t1, 0xd1edcc04
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x138aef6b
li t1, 0x3d46ee4a
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x28180222
li t1, 0xebfb013d
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x7c18879
li t1, 0x84bdef2c
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x39e8d6a7
li t1, 0x7b47546f
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2ddb047
li t1, 0xdca72a87
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x895416d4
li t1, 0x7a15a40c
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xfd4f20b6
li t1, 0xb90a0a6a
add t2, t1, t0
sw t2, 4(sp)
li t0, 0x396a76
li t1, 0x8acb5f64
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x88ac2af8
li t1, 0x100ecbc9
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xd941d8f
li t1, 0xc2cc4a56
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x792c7c08
li t1, 0xbe397c7c
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2d68be19
li t1, 0xbb52c1ce
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd6068c5c
li t1, 0xc3bd6663
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x7cfca749
li t1, 0x4d39556e
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd04eba3c
li t1, 0x28e8c9b6
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x520fb4c7
li t1, 0x190ef86f
and t2, t1, t0
sw t2, 4(sp)
li t0, 0x7730ccdf
li t1, 0x81ddd9bb
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x46cccbc5
li t1, 0xc7f565ad
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xba0631f5
li t1, 0x3dc031a7
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x97c95124
li t1, 0x8e4a7b66
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf38365a2
li t1, 0x7d4984c9
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xed172a2a
li t1, 0x1157e5c9
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcd78d862
li t1, 0x92192fa8
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x12ef541f
li t1, 0xaf01a0b
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x613f19a1
li t1, 0xc8116171
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0x82c1476b
li t1, 0x842379f2
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe7936f0c
li t1, 0x4c359bc3
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2bce448
li t1, 0x8fe870cd
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1e3d462d
li t1, 0xc684e969
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa1b282fa
li t1, 0x98ef7028
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x5b885ae0
li t1, 0x670229a5
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbb374e4
li t1, 0xe9c63869
pv.dotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x87b65fee
li t1, 0x1bb82fda
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf880d294
li t1, 0x48811e2e
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa06cc40f
li t1, 0x4ea37abd
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2556a055
li t1, 0x263d927f
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x225d4191
li t1, 0x3541cf7b
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8576f1fa
li t1, 0x9c9d6027
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2a88e6be
li t1, 0x7e5e4c6d
or t2, t1, t0
sw t2, 4(sp)
li t0, 0xd1abf8b5
li t1, 0x784bdf52
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc7c5c221
li t1, 0x722aa4a7
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd35a2bc4
li t1, 0xcf33e7af
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x886ac1d6
li t1, 0x43b8dabe
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf0af71b3
li t1, 0x8b143e26
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x24ebe0c8
li t1, 0x134c348e
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x46a3968c
li t1, 0x951372a2
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x824ffd0c
li t1, 0x362ce47b
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9e9ada7a
li t1, 0x3ef9aeda
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x56b331e0
li t1, 0xf48955a
pv.dotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2358ae0
li t1, 0xadef7574
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x696067ce
li t1, 0x4f6cd318
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb3f8bb88
li t1, 0x8c8a5111
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4ede48ff
li t1, 0xb659d09
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xad35fc4f
li t1, 0xf1d2343c
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x547d0c7b
li t1, 0x92c8bd04
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb3dc4e41
li t1, 0xdf05389b
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2a62c277
li t1, 0xc0af5f77
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa741a55a
li t1, 0x1241ed1e
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x30161f4d
li t1, 0xecbb70a0
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x498c6103
li t1, 0x1ffafdba
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x301f1480
li t1, 0x5998c5a
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x60f629ad
li t1, 0x7edd503d
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x668e8d92
li t1, 0x42062bb9
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e4c1277
li t1, 0xde212a8
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x34bf1353
li t1, 0x11f5f864
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x516b0161
li t1, 0xc4f008c7
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x92e0b1b1
li t1, 0x4c316275
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf2526ab6
li t1, 0x60bf6538
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x43c0c5af
li t1, 0xe016fbda
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0x5d39d1f5
li t1, 0x3d988b84
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0x601b3be1
li t1, 0xc2517766
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8459953d
li t1, 0xc33f6fdf
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6ee8d9de
li t1, 0xd0a41a1e
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfacad2a9
li t1, 0x7bc85a97
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f999bcd
li t1, 0x75478f1a
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0xec465a41
li t1, 0x28ca6f30
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x72f2a8b7
li t1, 0xedb3c79a
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0x71d2f271
li t1, 0x4c720c0a
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x364e02a
li t1, 0xddd4effc
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x4dd634d0
li t1, 0xade24ce5
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b4b3cec
li t1, 0x5e117cb3
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9fbe84fa
li t1, 0xd67ab868
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbd230156
li t1, 0x43871b95
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x106b4a75
li t1, 0xa0f20e6a
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa371c8ba
li t1, 0xe05584fc
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0xea9e2a58
li t1, 0x283f82ec
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x13626792
li t1, 0xbaad5854
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4a115c9
li t1, 0xea5dfa4d
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbc8c975f
li t1, 0x9619569
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0xee3b678f
li t1, 0xcf06ecdc
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x513029c3
li t1, 0x7d9f46d6
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x52c2830a
li t1, 0x5b7492a6
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x9bffb268
li t1, 0x11425995
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfffa02a7
li t1, 0x2f6cde36
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9d937fb2
li t1, 0x52efcb4d
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x441974f0
li t1, 0x1bd15723
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x31255863
li t1, 0x6294681a
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc83153a5
li t1, 0xfb78110f
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x63248077
li t1, 0x6c79b410
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf71e3681
li t1, 0x3e0a7483
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf0a2a1e4
li t1, 0x9c99bf13
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a36f348
li t1, 0x7f065eb
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x8c836d2a
li t1, 0xcc0aeb68
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5241ff74
li t1, 0x55af74d1
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5842ed97
li t1, 0xa6d01dec
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1e23a9a6
li t1, 0x1b3b1082
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x16ca3d14
li t1, 0x6f0dc746
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfd175c56
li t1, 0x425055ab
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0x6fdd25
li t1, 0x5dc7ac4e
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x24d9d4d4
li t1, 0x979cf3e3
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x19aa5dfc
li t1, 0x8d5546bf
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xae87b500
li t1, 0x8cb9eef3
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x656322df
li t1, 0x1814aee2
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f1f031b
li t1, 0x4d12ca3f
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0xca1f20ca
li t1, 0x3e571fe5
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0xa7ef759c
li t1, 0x9f741253
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x28dd4ef1
li t1, 0x105ef734
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfe7918ee
li t1, 0xd00e8d39
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e45a08b
li t1, 0xa5e415c4
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x732437de
li t1, 0xb4e80dc0
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x24b6a1f
li t1, 0xdee84bbc
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a0b1bdd
li t1, 0x693c2fa0
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xebdd83d
li t1, 0x2b27f493
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x722710b2
li t1, 0xb988f472
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a95acaa
li t1, 0xc1b68ed7
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x18b28686
li t1, 0x3d8efad7
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x58527853
li t1, 0x49cbb107
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d421d38
li t1, 0x4283c190
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb9a080c3
li t1, 0xd80e04af
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2a6ef12c
li t1, 0xa37fe61a
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6487c1fe
li t1, 0x56273b64
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xac44ec30
li t1, 0xd155364e
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf99d694c
li t1, 0x291e7345
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5f9a656
li t1, 0x24adeee9
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6ea5df08
li t1, 0x5d917e5a
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x890d10dc
li t1, 0x1e3df959
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc7d21963
li t1, 0x10de651b
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x388a9cfe
li t1, 0x287cfac3
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9f93f535
li t1, 0x6678b738
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1777eba5
li t1, 0x8f70be8b
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9dc42946
li t1, 0xfab1aa60
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa4f4379d
li t1, 0x28b7f9f0
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3f9a8cb2
li t1, 0x1e16ee57
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f99c02
li t1, 0xd97818f
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4c484f9c
li t1, 0xf8997626
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x34a55f91
li t1, 0xfe5c87e6
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x660e11e5
li t1, 0x333cf405
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xebbb949c
li t1, 0x34e7ab15
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9c942732
li t1, 0x14ecdfb
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5e01d460
li t1, 0xd8e848cc
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5c5885f8
li t1, 0x37c840d4
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7927923f
slli t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x83bea658
sltiu t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xda956c20
ori t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xcbe2f8f1
xori t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xe0e10475
slti t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x9b13c838
andi t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x7f1ad47b
srli t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xbb69fc38
srai t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xb652b3d2
addi t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x8c1a435f
li t1, 0x1b664cc4
p.subuN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x927fc11f
li t1, 0xc2c7ca0
p.subN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x8ed10d7d
li t1, 0x8c249d6d
p.subuRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xe95d49fd
li t1, 0x6209571a
p.subRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x28d454eb
li t1, 0xa2abbee
p.addN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x572ff84
li t1, 0x5fa968ed
p.adduN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xa8a4e598
li t1, 0x6b94b799
p.addRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xa6f68e18
li t1, 0x9470f616
p.adduRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xf3e2708f
p.bset t1, t0, 0x1, 0x2
sw t1, 4(sp)
li t0, 0xe5ef1c5f
p.extractu t1, t0, 0x3, 0x0
sw t1, 4(sp)
li t0, 0x8e7609cc
p.insert t1, t0, 0x7, 0x3
sw t1, 4(sp)
li t0, 0x38bdeae9
p.bclr t1, t0, 0x2, 0x1
sw t1, 4(sp)
li t0, 0x5cbf97d9
p.extract t1, t0, 0x2, 0x0
sw t1, 4(sp)
li t0, 0x6d17b2b
p.clipu t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xff95cf65
p.clip t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x48c38b82
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xeb726a7c
p.exths t1, t0
sw t1, 4(sp)
li t0, 0xad940abe
p.clb t1, t0
sw t1, 4(sp)
li t0, 0xe0ee9f22
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x61973573
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x20239d3e
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0xabf15c3d
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0xa77f9323
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x9e8b301f
pv.or.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x59da5dea
pv.shuffle.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xf7bb8c5e
pv.xor.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xd301b777
pv.cmpgt.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x9c8dda61
pv.cmpne.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0xfe882cfa
pv.srl.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x2c160800
pv.cmpgeu.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x96a0827
pv.sdotsp.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x795ff887
pv.cmpleu.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x1324536a
pv.avg.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xa52eafe6
pv.cmplt.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x91a4c864
pv.min.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xd948f425
pv.add.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xdf3dcfdd
pv.sll.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x689950e4
pv.add.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x41807971
pv.sdotsp.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xc1ecdd81
pv.sll.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xacfdec87
pv.minu.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xc12f312d
pv.and.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x2e6c970b
pv.dotusp.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x189d616
pv.cmpeq.sci.h t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xc5c0f4c1
pv.cmple.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xde950698
pv.cmpgtu.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x672ef5b4
pv.max.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x119c6827
pv.dotup.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x4ac28996
pv.cmpgeu.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xd4d3cfc3
pv.cmpltu.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xd7518946
pv.shuffleI3.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x5e87447e
pv.max.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xe3b28c5c
pv.sra.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x92879a4b
pv.and.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xbbd5f819
pv.cmpleu.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x5350b018
pv.shuffleI2.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xaf51a14a
pv.avg.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xb931e769
pv.avgu.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xfb250973
pv.cmpne.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xacdf766c
pv.cmpltu.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x493eddbc
pv.min.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x14db50c0
pv.sra.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x1d5a7211
pv.avgu.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x359a527b
pv.cmpge.sci.h t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xc2918c89
pv.maxu.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xa51a77ef
pv.cmplt.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xc3aeb3ae
pv.sdotusp.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xd17a11af
pv.cmpgtu.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xb52d9acb
pv.dotusp.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xa0a3aae6
pv.sub.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x67e6a89b
pv.srl.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x6a3e33a
pv.cmpge.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xa7c91d25
pv.minu.sci.h t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x14c16743
pv.sdotup.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x1468bed4
pv.dotsp.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xe2846dd3
pv.shuffleI0.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x3aae8722
pv.sdotusp.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x508737ae
pv.cmpgt.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x9fd1d78f
pv.cmpeq.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0xf217191a
pv.dotsp.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x8cbb8361
pv.shuffleI1.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x94b097ee
pv.maxu.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x2c735b80
pv.sdotup.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x33bee3c8
pv.sub.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x6df02fc0
pv.dotup.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xf1bbf1d4
pv.or.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x9f63b586
pv.cmple.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xa95c44ae
pv.xor.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, -0x286c9b19
li t1, 0xa317c71e
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x44f91423
li t1, 0x58ed3811
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4a452450
li t1, 0xcc38440e
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x534c0c4c
li t1, 0x5c8b19f0
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x70a36eab
li t1, 0xd5866b32
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2889183d
li t1, 0x8f89c647
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x54f3f326
li t1, 0x1d51f512
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6e4c1865
li t1, 0xf1e8f118
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7e39e25d
li t1, 0x6b45ea22
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x642f9eba
li t1, 0xee4428f0
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x63e94567
li t1, 0x27f53408
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5794b924
li t1, 0xf58afea7
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x167a63bc
li t1, 0x2ece870a
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x595a4712
li t1, 0x36fa79c2
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x36e6545d
li t1, 0x4f604027
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x163fc70b
li t1, 0x8a0f7d8c
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x1442274d
li t1, 0xb421504a
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x3d48c253
li t1, 0xc6669651
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x39cbb006
li t1, 0xcfcc644
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x384400e9
li t1, 0x851d57a
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x20d25449
li t1, 0xb8a8357f
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x46084476
li t1, 0xa58a33b5
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x30b2e0d3
li t1, 0xacbbc09e
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x10ef936d
li t1, 0xdfbdc014
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x435e2f16
li t1, 0x982fe52d
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x165b6f4f
li t1, 0x15e59f1f
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x6768dd14
li t1, 0x6487f8d6
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x73aa00a2
li t1, 0x490668d4
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x3ebcfa3f
li t1, 0xbb6d0cb0
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x78aedf94
li t1, 0x28b17f45
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4ee20c2b
li t1, 0x3b227502
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2f7e7902
li t1, 0x96614165
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4788e4d0
li t1, 0xde155448
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0xc56ab29
li t1, 0x3f7e2dc7
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0xa97c02b
li t1, 0xc970fe2a
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x34a12e06
li t1, 0x419aed30
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3ec895db
li t1, 0xefba2253
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x166005dc
li t1, 0x57c8a8a2
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5b5ffa5b
li t1, 0x52ff42f3
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x16259ba7
li t1, 0x7d973da3
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b6f0737
li t1, 0x5878d2dd
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd7c3a7ca
li t1, 0xa9f04051
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x34df7c1f
li t1, 0xfc7f0caa
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4cc84286
li t1, 0x205d27f6
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x801414fb
li t1, 0xa52e3477
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xabd68c19
li t1, 0xe6a85e03
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1efe8a3f
li t1, 0x48ed5535
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x4e869409
li t1, 0xf4cec367
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x91e97ac4
li t1, 0x56e471d2
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x57106a7c
li t1, 0x5498bce1
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa239314
li t1, 0xa191b3e2
or t2, t1, t0
sw t2, 4(sp)
li t0, 0xf945bdc1
li t1, 0x5f8c2645
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf3458d4d
li t1, 0x629348fb
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0x38422bcd
li t1, 0x98f42f87
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbcd57718
li t1, 0xdc594097
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xdb5dd59d
li t1, 0xccecb663
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x215378d0
li t1, 0x82995cce
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0x517b0d45
li t1, 0xf42d7a86
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf2ac2c3d
li t1, 0x26622d6c
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x75036f3a
li t1, 0xe44f69a6
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x28953179
li t1, 0x3608c0b2
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b9e8f7e
li t1, 0x4e382988
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x81980e8c
li t1, 0x31d738f
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b71a860
li t1, 0x2b165bb4
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x99b2c193
li t1, 0x920b7e6c
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0xeefbdd4d
li t1, 0xddeddd4
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6f495a46
li t1, 0x9ad63932
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x20bc807b
li t1, 0x8c419364
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1c4e4808
li t1, 0xa7ce0804
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x10736a68
li t1, 0x5c135898
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1f3348ca
li t1, 0xd5d24975
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4178a6ac
li t1, 0x63589006
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x505c7a6b
li t1, 0x80a32988
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd142115f
li t1, 0xa8efae9f
add t2, t1, t0
sw t2, 4(sp)
li t0, 0x34d98266
li t1, 0x2ff2bbe4
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4769e698
li t1, 0x4c441e98
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x73cd9566
li t1, 0x5c1bb35c
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x486c6d8
li t1, 0x60f3bea
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x799ce7ff
li t1, 0x5b703e47
pv.dotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x73fc123
li t1, 0xa097ca3f
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7be59b16
li t1, 0x8d704429
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x771ac5ce
li t1, 0x11da2dda
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0x5134d46a
li t1, 0xf96050d4
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x651defe0
li t1, 0xc68c98fb
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe02fe1d
li t1, 0xe14c8ed3
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb608d37a
li t1, 0xf0773fc2
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x780a226d
li t1, 0x632aa00b
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x61fc27ac
li t1, 0xb1af90c5
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb54116d8
li t1, 0x6a9ea0a9
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x599ceed5
li t1, 0xd188ee7a
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x636eccc0
li t1, 0xb29bde93
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4e3df1d2
li t1, 0x524925ee
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x99a6047d
li t1, 0xef2d2b4f
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbccac0ce
li t1, 0xceb7dcf9
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb854e9c3
li t1, 0xe33b1fcd
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3483124d
li t1, 0x6ad7b9f0
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5952655e
li t1, 0x324ed8b1
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x23457576
li t1, 0x5ad3990b
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe79f5c9d
li t1, 0x23909ad
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe6c562fa
li t1, 0xcae0bd00
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2b79b24
li t1, 0xe568226c
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x163c5777
li t1, 0xddac2085
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb503f0e0
li t1, 0x6cedc97e
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa54278fc
li t1, 0xcdbb76f
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x944fb684
li t1, 0x62b66b7a
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa90dcc70
li t1, 0xffbe17c4
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x58602a20
li t1, 0x320bb95c
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0x79f83829
li t1, 0x84e9e58c
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xdaf1720a
li t1, 0x791d46e
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xff9be922
li t1, 0x575dc3f8
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9a433ba4
li t1, 0x34180216
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x288fc1a7
li t1, 0x89423d44
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb77aac54
li t1, 0xd88f5119
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x56f52e9c
li t1, 0xf1d36e5b
and t2, t1, t0
sw t2, 4(sp)
li t0, 0x2c16681f
li t1, 0xf68cc1bb
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x209837a2
li t1, 0xf9c2e1b0
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xaab5b0bb
li t1, 0xbb6a89e8
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd8ffc38a
li t1, 0x56a5d509
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xeb7b537b
li t1, 0x1c73fcfd
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3e41c746
li t1, 0x3c0f0f84
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x80968b96
li t1, 0x42e8ff25
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x77b4222c
li t1, 0xd0340eb5
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8fa4ddfe
li t1, 0x2a62dcad
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdcf457cc
li t1, 0xde6633da
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe63b3c25
li t1, 0x4f834b49
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc624fb55
li t1, 0xb02bd10
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc18d1207
li t1, 0x9b85ae2b
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa1dc5f9c
li t1, 0x17dd522a
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f9ec00
li t1, 0xbe549da9
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b4ea72b
li t1, 0xe9c1053
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe24d6d8e
li t1, 0xa71fba95
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe538ed5a
li t1, 0xa20cc07
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0xd170934a
li t1, 0x5f82dd18
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8506b8c4
li t1, 0x805d7093
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe833d60c
li t1, 0x2e4040c9
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x21552e2a
li t1, 0x565b280
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x10203416
li t1, 0x4e940c12
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbc2453c3
li t1, 0xf2986b37
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x2c2ed187
li t1, 0x12ef40e1
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x986a7c16
li t1, 0xb6271459
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xede44e1c
li t1, 0x771284ef
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfd82ad54
li t1, 0xd748f31
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc7872d98
li t1, 0x6e6642ab
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8b4625c0
li t1, 0x8e5ccee8
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7bbca16a
li t1, 0xd23d2bc7
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8cfaa4e5
li t1, 0x7d396a11
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x455d5dfe
li t1, 0x9f1647c3
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x159b435f
li t1, 0xd93b5cc4
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8bb768a8
li t1, 0x817c018
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x14ffc12c
li t1, 0x576f753b
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6fac1b9
li t1, 0xb86c9c05
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2cb6210e
li t1, 0xcfadf4f2
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xfb30ffb7
li t1, 0x356b0420
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0xabe1c5cb
li t1, 0xf1ebf390
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x35763021
li t1, 0xb08bd42f
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc8708662
li t1, 0xf5c12b68
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x7ba07312
li t1, 0xb682af99
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2d22317f
li t1, 0x64c43cbc
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0xb4dad200
li t1, 0x7ee2dacf
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc4faaa61
li t1, 0x97858495
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a04daff
li t1, 0x7447ed9f
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xad87cfab
li t1, 0x517742eb
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3932ed08
li t1, 0xa67e41c3
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4b4dab28
li t1, 0x85b0e678
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x2b9932e2
li t1, 0x38f1065b
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x133b332
li t1, 0x3d96d05c
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9b154060
li t1, 0xd7894d13
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5ef3a9d2
li t1, 0x9c25e7f9
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd6866b3f
li t1, 0x947ced71
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4dc54e75
li t1, 0xe5f2a983
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x13538baf
li t1, 0xbe851f68
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1f21286f
li t1, 0x9487f3a2
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x65dfaabf
li t1, 0x37ec2ef1
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x2eb4e664
li t1, 0xf5b31dc7
pv.dotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe947ed85
li t1, 0xbffa5882
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc780e092
li t1, 0x9709c781
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3d71661f
li t1, 0x92b2da52
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf7471714
li t1, 0x6277fa1c
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0x418789fa
li t1, 0x18399dec
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5c4beeec
li t1, 0x66d85919
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6524ba0
li t1, 0xde962490
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc9d70a90
li t1, 0x4206c011
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf40b5dec
li t1, 0x9b21d1d8
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2c14e88c
li t1, 0xfceff5f7
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4cbd83ac
li t1, 0xa2822d2f
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0xffc4bcea
li t1, 0xd8cff7a0
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x947dbaa
li t1, 0xbb99ab25
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1ed8fa8
li t1, 0x18bb0c88
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3f40cc66
addi t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x607185a4
srli t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xc959a9de
slti t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xc006914d
srai t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x47908bdf
andi t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x629323ca
slli t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x375f76ff
xori t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x9eeb076e
ori t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x4e00aab3
sltiu t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x4621f76e
li t1, 0xd780766b
p.subN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x7d9ccc36
li t1, 0xbfc9029a
p.subuN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x844d1a5f
li t1, 0x2a2d22ab
p.subRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x4d4a7c7
li t1, 0xeaa3cf28
p.adduRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x97633552
li t1, 0x4e772122
p.subuRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xef71735a
li t1, 0xc490bcf6
p.adduN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x1b12503c
li t1, 0x62cb81d9
p.addN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xf38a2efe
li t1, 0xfb10edd6
p.addRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x6ed2a6e2
p.insert t1, t0, 0x3, 0x0
sw t1, 4(sp)
li t0, 0x9ded6f07
p.extractu t1, t0, 0x2, 0x1
sw t1, 4(sp)
li t0, 0x305c748a
p.bset t1, t0, 0x4, 0x0
sw t1, 4(sp)
li t0, 0x955385e5
p.extract t1, t0, 0x7, 0x1
sw t1, 4(sp)
li t0, 0x77888c97
p.bclr t1, t0, 0x1, 0x0
sw t1, 4(sp)
li t0, 0xbab5cad8
p.clip t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x56bb3626
p.clipu t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xdc78c08c
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x2a4d9e4d
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0xe8ae9229
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0xcf0dc792
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x34888d5
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x31786fad
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0x9c2bd624
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x4eed9c2b
p.clb t1, t0
sw t1, 4(sp)
li t0, 0xc57d0353
pv.cmple.sci.b t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x6533261e
pv.cmpeq.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x89f78b6b
pv.sdotup.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x3bf66877
pv.cmpleu.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xe1d20c6e
pv.sll.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x3e70cb20
pv.min.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0xbf2e14b5
pv.cmpeq.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xc09a2c59
pv.sdotusp.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x9359093
pv.dotsp.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x9e7ec9d9
pv.dotup.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x23f90ae2
pv.max.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x6fd04575
pv.sra.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x49e8025d
pv.minu.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xd6a01072
pv.cmpgtu.sci.h t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xc6723394
pv.avg.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x8a501577
pv.sdotup.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x710d4da9
pv.or.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x3739247
pv.dotusp.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xf51af419
pv.dotsp.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x617fc60b
pv.cmpgtu.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xe21a2a86
pv.shuffleI3.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x4fb76426
pv.avgu.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xfa636de9
pv.maxu.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xcdb552b9
pv.avg.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x59724be9
pv.max.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x4f256a77
pv.cmpleu.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xfb01bb1
pv.cmpne.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xe9f204eb
pv.cmpgeu.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x198d5be9
pv.shuffle.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x8a36bb9a
pv.sub.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x64b768af
pv.cmple.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x23d0e462
pv.and.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x32709845
pv.dotusp.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x82245639
pv.xor.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x6dfdd9f8
pv.xor.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xcf651351
pv.cmpge.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x3282b126
pv.cmpltu.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xb57e1ed8
pv.shuffleI2.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xae8a7fe0
pv.dotup.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xe8a0603e
pv.cmpltu.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x132b674a
pv.cmpgt.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x746ae0a0
pv.maxu.sci.h t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x94134f07
pv.and.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x291ffd99
pv.add.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x9c6c485f
pv.add.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x17892a29
pv.cmplt.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x575ce765
pv.srl.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xc0069464
pv.cmpne.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xf480e0b8
pv.cmpgt.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x4093ab6a
pv.cmplt.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xf6b9239d
pv.minu.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x5dabe762
pv.sub.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x11354abe
pv.sdotsp.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xe9ac3d1a
pv.srl.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x7b1e328d
pv.sra.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xefa93dd
pv.shuffleI0.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x841980d8
pv.sll.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xbea8b5ff
pv.avgu.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x22291f6d
pv.min.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x69b7b868
pv.sdotusp.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x568fafdf
pv.or.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x9a8030b4
pv.sdotsp.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xd5ebb195
pv.shuffleI1.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x24df6d29
pv.cmpgeu.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x37b9c3ef
pv.cmpge.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, -0x345ca65e
li t1, 0xb397d622
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x79e9010
li t1, 0x4c0c34c9
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x11672111
li t1, 0x3ad2e329
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2f9847b3
li t1, 0x2fc0ded2
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x407aa620
li t1, 0x28bb5a3f
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x26926f45
li t1, 0x87d22ca8
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x24c5ade8
li t1, 0x378d707a
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x66e638ac
li t1, 0x84fa81e6
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x15c91669
li t1, 0xf437c926
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4e8679ec
li t1, 0xf98edfb3
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x38ac0de6
li t1, 0xcb30b68
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x24a76dc4
li t1, 0x4944c1b0
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x1168b3b0
li t1, 0x8de484
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x9dbbc20
li t1, 0x92537e86
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4353d569
li t1, 0xf0e7e764
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x58d399d5
li t1, 0xf287032c
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x6a531a98
li t1, 0xea3e1376
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x7cdc4907
li t1, 0xafa64c22
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4732a2b
li t1, 0x21ffc365
div t2, t1, t0
sw t2, 4(sp)
li t0, -0xdec0769
li t1, 0xf7cbf314
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x28e189f1
li t1, 0xfaba54e0
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4294795d
li t1, 0x6ccd3a17
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7d89fb6d
li t1, 0x10a9d059
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3fae58f9
li t1, 0x701e043
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5e92b43e
li t1, 0xeaad46f7
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3ff5b21e
li t1, 0xf4af8246
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7c805554
li t1, 0x8d09c3eb
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7c0abf5a
li t1, 0x60778bec
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x47b34f54
li t1, 0xc0ac2a3b
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x68071db
li t1, 0x9aac9fd5
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4bc50b5d
li t1, 0x5b06ec19
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5f763a98
li t1, 0x510361d
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x61e28168
li t1, 0x97080f90
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x7e00f686
li t1, 0xd4187b7d
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x7d3210af
li t1, 0xfc774342
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x2891f964
li t1, 0xe2423acd
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x1e57f78
li t1, 0x4ba4811b
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x4c85aa31
li t1, 0x11e9c0e6
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x4fdedf53
li t1, 0x7b51c9f4
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x50b4c0fd
li t1, 0xa1fec8b7
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x3d5dfb60
li t1, 0xd0bc295a
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x77d82c6a
li t1, 0x91f25d74
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x63dbdf02
li t1, 0x97b82e09
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x546399ff
li t1, 0xa073376d
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0x7fd9d0ed
li t1, 0xb8c08627
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa39a4a58
li t1, 0x930befb3
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2637906f
li t1, 0xb5ce7003
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x88568185
li t1, 0xfe20de51
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x4564cd16
li t1, 0xc0311fe6
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e466f99
li t1, 0x4948d5af
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b8aa15d
li t1, 0x8bfbae77
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xafed1e59
li t1, 0x3f467b8a
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2a5456b0
li t1, 0xa47a14b2
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x876a148a
li t1, 0x97d1d298
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5ae065c
li t1, 0x1e268745
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x36208576
li t1, 0xe34207e2
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xee9cd08e
li t1, 0x81aeb595
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x342fb391
li t1, 0x981671e2
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d950ea7
li t1, 0x85692393
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc7e06a22
li t1, 0xe471cd1
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xff231723
li t1, 0x61aa8c09
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8629b0c3
li t1, 0xf0a1392d
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xec75c0fc
li t1, 0x7b948e88
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f072c2a
li t1, 0x3d8070a
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe7732bd9
li t1, 0x9205fc28
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5ed878da
li t1, 0xb377bddd
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x449b82de
li t1, 0x247db72f
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2e7f8bec
li t1, 0x82c8cfc3
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd3420ab3
li t1, 0x49e84448
and t2, t1, t0
sw t2, 4(sp)
li t0, 0xa0c906a4
li t1, 0x6597948e
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0x97f7705b
li t1, 0xba0a562
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x80783419
li t1, 0xb251c90f
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb47030ee
li t1, 0x159367f3
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf44c0742
li t1, 0xe1678d51
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x84f3288c
li t1, 0x247e608
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x62e28850
li t1, 0xa362700
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x42b9ec21
li t1, 0xf85c0491
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4b4dd2f
li t1, 0x700637ab
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x35f68e37
li t1, 0xfc580fad
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xabe91bb0
li t1, 0x42b9b4ad
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x28b71a09
li t1, 0xd7e363b2
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8e139920
li t1, 0x687e7591
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3b3f6b38
li t1, 0x593907d5
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc1a3d68f
li t1, 0x9ebabe24
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x590567ce
li t1, 0x25ef101c
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x799e128e
li t1, 0x7c390d5c
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe2e3b003
li t1, 0xc28f320f
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x6fb5ed7e
li t1, 0xf58b2ea7
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x85d7c25
li t1, 0x83394080
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4e038aa4
li t1, 0x6adce0d0
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1242e82d
li t1, 0x83cdba64
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2ab5aebe
li t1, 0xa8aaabcf
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x99aaf385
li t1, 0xb5e56ad5
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0xc47ec62e
li t1, 0x9c4fa166
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x49930ed6
li t1, 0xfd66ec97
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf998159a
li t1, 0x3b51f891
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xaec18f93
li t1, 0x42cbc689
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4824f5cb
li t1, 0x51d120af
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3c90ca78
li t1, 0x4cfb6ca6
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x622fc601
li t1, 0xf894af9c
pv.dotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe481bc92
li t1, 0x7fe41705
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x85968baf
li t1, 0xf8063e93
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x857b5b7c
li t1, 0xc21dfe4d
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xbc44994f
li t1, 0xece747e6
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf8dd6fb6
li t1, 0x5d6da612
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x644c2e26
li t1, 0x4607135e
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf9a68a4a
li t1, 0x6800ff27
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3731df8f
li t1, 0xef9f2ed9
add t2, t1, t0
sw t2, 4(sp)
li t0, 0xa8764c3e
li t1, 0x56fa0eb3
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe25ec88a
li t1, 0x4595615b
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdd662656
li t1, 0x214cbed2
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x95545eeb
li t1, 0x8a2529b9
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf7cd34fa
li t1, 0xe154cd44
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb48c1a69
li t1, 0x8ef02a30
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9dab65c4
li t1, 0x6cff4c21
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1bf9e079
li t1, 0xde38b8a0
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0x4b693bdd
li t1, 0xd2d17a98
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9df10da1
li t1, 0xbcf7fe98
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9b49cbab
li t1, 0x30aa5908
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc3921d7f
li t1, 0x9377c34e
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa04551fa
li t1, 0x2ebbaef9
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcaea7f1d
li t1, 0x4fb1978c
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1acdb65f
li t1, 0x4328084
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x644d3491
li t1, 0xc47ed57b
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xab8b8e86
li t1, 0xd49e29ab
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa384d0f0
li t1, 0xd2654f66
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0x46107a12
li t1, 0x155b782
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x394b663f
li t1, 0x57fe5ca6
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf1e2204f
li t1, 0xcb9f6337
pv.dotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5338c5c1
li t1, 0x192a8e14
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa28e4183
li t1, 0x6c502cba
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd758940e
li t1, 0xe623d905
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd49d2c4b
li t1, 0x9fd35a09
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x93190344
li t1, 0x453198f6
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd27bc218
li t1, 0xd96b13e
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0x2255e3d2
li t1, 0xfa227fd2
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x70abf86
li t1, 0xd20a02be
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xd9551a6
li t1, 0x2204dca7
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd6cda607
li t1, 0x3f4f8752
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4d247005
li t1, 0x1f992290
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x483e097d
li t1, 0x5a3bf7cc
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x31808644
li t1, 0xd4e21e7a
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x78d05f9c
li t1, 0xeb2d4f6b
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xfee2fe3d
li t1, 0xec260915
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9d939f40
li t1, 0x2c6a6446
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2a2b88fa
li t1, 0x885236ed
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x787e1906
li t1, 0x36c49c66
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x77e02d59
li t1, 0x154e1172
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcd05fcf0
li t1, 0xdb417c14
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf6d76769
li t1, 0xca50194d
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7e21d8d8
li t1, 0x252ef219
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3f3d387
li t1, 0x35dbbd88
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x39980828
li t1, 0x4e904999
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x60ec14f0
li t1, 0x7eff60f0
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x157a20c
li t1, 0x45b4fe4a
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x28bb399
li t1, 0xb9e319d5
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x99749d83
li t1, 0xa4bd49c0
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x84e0ff42
li t1, 0x31532e0d
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x10901607
li t1, 0x76c5714a
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xffea1540
li t1, 0x9e9fc7e5
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x73584111
li t1, 0x9ff426fe
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0xeb613248
li t1, 0x9ddd57ad
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa6e8efa
li t1, 0x53d0c69a
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0x67af13f1
li t1, 0x980b236a
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xdf670f2b
li t1, 0x1ab22d59
or t2, t1, t0
sw t2, 4(sp)
li t0, 0x933dcf90
li t1, 0x70e1d06b
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x854e26fb
li t1, 0x5acbef4e
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7bece62f
li t1, 0xdea84f8f
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc803de43
li t1, 0xe52bf094
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x62553e44
li t1, 0x76cfe123
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x352b8668
li t1, 0xae80a1f8
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x53a03c73
li t1, 0xbf130419
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fb558be
li t1, 0x27d5f3ba
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd57d5ed1
li t1, 0x975650c
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3a877c9
li t1, 0x4d27532f
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6bac90e3
li t1, 0x539835
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8a617d31
li t1, 0xd2ee998a
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf2af0650
li t1, 0x5f7b6726
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbed62ae2
li t1, 0xb0659cc1
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe00e4fe3
li t1, 0x15cb6f19
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0x85406b78
li t1, 0x560cb003
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0xb19f5ddb
li t1, 0xfdc90ab9
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4916846b
li t1, 0xf2a7fe64
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e3a7c2f
li t1, 0x497f53d5
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2f608906
li t1, 0xeacd4185
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x96511741
li t1, 0x99f47f33
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0xa3d63646
li t1, 0xa2bc3f33
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf7171552
li t1, 0x82c4569c
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9b566fe0
srai t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xea047239
slli t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0x413c1938
slti t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xf58d2346
andi t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x3226544d
sltiu t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x16d5f671
xori t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xbccc3619
srli t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x1cadd0fd
ori t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xf2ef840c
addi t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x7015f2d2
li t1, 0x41d3f8a1
p.subuN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0x44c0e2cb
li t1, 0xe71cc10b
p.subuRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x394ca522
li t1, 0x246e9712
p.subN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xc70355f9
li t1, 0x6837710d
p.addRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xd11fd89c
li t1, 0x13a11e69
p.subRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x2c3e9370
li t1, 0x6fbf7790
p.adduRN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0xd04abdbe
li t1, 0xf8546670
p.adduN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x88d12997
li t1, 0x3e5cdc83
p.addN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0x8fcd63b2
p.extractu t1, t0, 0x4, 0x0
sw t1, 4(sp)
li t0, 0x333b586b
p.bclr t1, t0, 0x4, 0x0
sw t1, 4(sp)
li t0, 0x534335fb
p.bset t1, t0, 0x5, 0x3
sw t1, 4(sp)
li t0, 0x7f5ba51b
p.extract t1, t0, 0x5, 0x2
sw t1, 4(sp)
li t0, 0xc99ea26a
p.insert t1, t0, 0x5, 0x3
sw t1, 4(sp)
li t0, 0x5d7e0e2b
p.clipu t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xc7f5c13f
p.clip t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x668b2d1
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0xc958f91b
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0xef0cb5f0
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x9d8e4da6
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x425379c5
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x748b5d2b
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x5e08b7a
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x70d9eefb
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x7539a083
pv.cmpgt.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xe62ae0de
pv.cmpge.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xd190ae44
pv.add.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x767e046a
pv.dotsp.sci.h t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xb42080c2
pv.maxu.sci.b t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xcc968f5c
pv.add.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xca4d3ba8
pv.dotup.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x125fe2a1
pv.minu.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x2e82e1d0
pv.cmpgt.sci.h t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xad743827
pv.xor.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x991a44bf
pv.shuffleI3.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x2ce5585
pv.min.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x9e1dec8c
pv.avg.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x38c239ed
pv.sdotup.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x2f316456
pv.sdotusp.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0xee58dc3d
pv.shuffleI1.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xb5a1664a
pv.cmpleu.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x1f3af0de
pv.or.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xf5d8dcd7
pv.srl.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x7bb563a7
pv.cmpgtu.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xacc76a6b
pv.avgu.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xbf2c68fe
pv.sub.sci.h t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x738b5b18
pv.dotup.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xbdf4bdc9
pv.sra.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x54b97166
pv.cmpge.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x5af2d
pv.cmpleu.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xb4a21c77
pv.cmpeq.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xc16f9dd0
pv.shuffleI2.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xaf890263
pv.sdotsp.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xcce382f
pv.srl.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xf62a8bc3
pv.shuffleI0.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x83273986
pv.cmpne.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xcbc2ac0e
pv.dotusp.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x97d01377
pv.cmpgeu.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xf85b1c5f
pv.xor.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xbed643e9
pv.sdotusp.sci.b t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xe195f51f
pv.sll.sci.h t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x1dba93b7
pv.avgu.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x85809f06
pv.sub.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x16d8a35e
pv.sdotup.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x9ebd8b26
pv.sdotsp.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x6840df7f
pv.max.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xf76bf580
pv.maxu.sci.h t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x976a4c89
pv.cmple.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0xc40338d1
pv.min.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x177786e8
pv.cmpne.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xfbc76d3d
pv.cmpltu.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x8229e668
pv.sll.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xa9d46f6e
pv.shuffle.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x4bd8fbf0
pv.cmple.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x9b951fce
pv.and.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x2299d1ed
pv.and.sci.h t1, t0, 0x4
sw t1, 4(sp)
li t0, 0xc53e064e
pv.cmpeq.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x9e99e96a
pv.dotusp.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x5f1b27c9
pv.sra.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xdcd3d5ca
pv.cmplt.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x99f2076c
pv.cmpgtu.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x12cc46ba
pv.cmpltu.sci.b t1, t0, 0x13
sw t1, 4(sp)
li t0, 0xbf65ffce
pv.avg.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x93236efc
pv.max.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x180e2dbc
pv.dotsp.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x830dc578
pv.cmplt.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x369ad671
pv.minu.sci.b t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xc01ec93f
pv.or.sci.h t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xbe169d06
pv.cmpgeu.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, -0x2f7d1e1b
li t1, 0x8cf4b6ac
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5f119128
li t1, 0x3b79f3b6
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x2ddb5eb8
li t1, 0xea34d4c3
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x34b1d1d9
li t1, 0x10a8092f
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x7fd655ac
li t1, 0x933e2b0e
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x6f0273b7
li t1, 0xf6786aac
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x77b26880
li t1, 0x58a7f733
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x458e377
li t1, 0xe20390eb
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x56b27265
li t1, 0xb7a16b1b
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x6ce8b914
li t1, 0x4305c02
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x17d6ffeb
li t1, 0x550130e0
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x48992d13
li t1, 0x62c2e71d
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x10328efe
li t1, 0x23753a58
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x3ad5a585
li t1, 0x81c7bee2
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x6a99db91
li t1, 0xd670a1f2
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x45e45392
li t1, 0x968c1807
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x13c4696d
li t1, 0xd40f78ef
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x1c43700
li t1, 0x573649aa
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x2550cb91
li t1, 0x9ca779e8
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x2cd6950
li t1, 0x863f6492
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x2d4c3368
li t1, 0xd0799d88
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1a8a7f21
li t1, 0xf9ea76e7
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x201bd35a
li t1, 0x453ea1b9
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x23193244
li t1, 0x246e28a0
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5024f220
li t1, 0x5e643a9a
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1c24881a
li t1, 0xffe769f2
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x71116365
li t1, 0x39708ef5
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x280f98ee
li t1, 0x9d68d44b
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x44e5dc5f
li t1, 0xdf29d23
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x48361c59
li t1, 0x3c736e41
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x50d69311
li t1, 0x1ba30732
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x63490a76
li t1, 0x8f8c4d8b
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x4028016
li t1, 0xb9962255
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6ef05b82
li t1, 0x29373617
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6a1c62b0
li t1, 0xa70c5678
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7125dbba
li t1, 0x41fd9095
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x620427af
li t1, 0xf6974da9
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x47923934
li t1, 0xd8ac1fc1
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4ddeb52c
li t1, 0xcfe24f16
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x654d3b58
li t1, 0xb01d9162
divu t2, t1, t0
sw t2, 4(sp)
sw x31, 4(sp)
li x31, 0x0
sw x31, 4(sp)
li t1, 0xffffffff
li t2, 0x0
li t0, 0x1ede3e79
li t1, 0x24fea89e
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x627ab95
li t1, 0x2bc00a5b
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xef3da425
li t1, 0x130b6ef4
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb2f73567
li t1, 0xac5e1413
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x217d81eb
li t1, 0x2bf36a17
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2d85acd7
li t1, 0x36f7e385
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0x28b777ee
li t1, 0x1fcbbc5
pv.dotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x99beeaaf
li t1, 0xf3bf6dd3
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x84149328
li t1, 0xe6ed4cff
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1fa5c476
li t1, 0x69aeab61
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8d408b91
li t1, 0xf6d3df7e
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x899155f9
li t1, 0x22749822
and t2, t1, t0
sw t2, 4(sp)
li t0, 0x9636e6ed
li t1, 0x44609881
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xff6e4238
li t1, 0x55733a1e
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb403b6ef
li t1, 0x8551a3c7
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9a4100b2
li t1, 0xb98055a5
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x41c58b7
li t1, 0x5e05c617
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x70b392c5
li t1, 0x762f30e
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc7fe098a
li t1, 0x67f814fc
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x81015bdd
li t1, 0xed0749c3
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x22165d57
li t1, 0x43fc38d9
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3a110a16
li t1, 0x9f6d5d59
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x533218a4
li t1, 0xfa388db5
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xaacb12e0
li t1, 0x76a3128a
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3d7f1fa1
li t1, 0xd1991dd1
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x41289409
li t1, 0xc3f3200a
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfdef0392
li t1, 0xda904a38
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0x84b40a6c
li t1, 0xbe9eb57c
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x88d4e900
li t1, 0x7925230f
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2b663185
li t1, 0xc5e90b2a
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0xed1ef5ad
li t1, 0xd259868
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5e1692a7
li t1, 0xb2d5f817
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf290c3ef
li t1, 0xf6a6dbf8
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6723f73d
li t1, 0x5d90f332
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe20404e8
li t1, 0x36aa074a
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x4adba02f
li t1, 0x94dee17c
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x94da9a4
li t1, 0xcc4157f8
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0xc4ca54de
li t1, 0x96a728b
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x26602dc7
li t1, 0x1d9d576e
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5b9f92f8
li t1, 0x251e65cc
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa9361278
li t1, 0x1d552808
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xed675d4f
li t1, 0xae8ba770
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x67afdfbb
li t1, 0x5b7ad033
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5b06b565
li t1, 0x8e9816a5
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xeeffa676
li t1, 0x8182699f
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6ed622bb
li t1, 0xb250ec87
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x53ed71eb
li t1, 0x867dd738
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x10dd1d09
li t1, 0x8ed118b9
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0xd2a8eb34
li t1, 0x639fdf13
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x43716c3d
li t1, 0x6a4b6dd
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd38eefe5
li t1, 0xef710090
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc6236183
li t1, 0x415d544d
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1c397f3
li t1, 0x63d830b
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbd6342ab
li t1, 0x3e1e4acd
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x3031a57e
li t1, 0xa5b4e294
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0xf7028210
li t1, 0x29159b3e
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb3ca5416
li t1, 0x68d0c08a
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1de22096
li t1, 0x624d3ff2
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x266d14d8
li t1, 0x160eb6ad
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x25730f36
li t1, 0x6b4b55e
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfa3218a9
li t1, 0x21939576
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4a4a2673
li t1, 0xc6a81701
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9c67c868
li t1, 0xb534bdd
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x77369466
li t1, 0xa60c565f
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1f181e5d
li t1, 0x39bc2582
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a508574
li t1, 0x1f62982
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2532380a
li t1, 0x656750d6
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x150d07a7
li t1, 0x7f7d1ea1
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x71172f82
li t1, 0x994fd3aa
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcc32c82d
li t1, 0xd08d08bf
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0x5a067a7c
li t1, 0x52b12a74
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4ea9a052
li t1, 0x6ffc3654
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x751ed71f
li t1, 0x3ec4c51d
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd8b2cb1f
li t1, 0x188f9504
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe4aa5e26
li t1, 0x499ae003
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4803bb97
li t1, 0x36d3dacf
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x20a0512b
li t1, 0xe95c37d6
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xfffd8b97
li t1, 0xd7bd4845
add t2, t1, t0
sw t2, 4(sp)
li t0, 0x3e5cf2e1
li t1, 0x4e8dde4e
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e28f507
li t1, 0xcd9600ba
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x51cc60eb
li t1, 0x1acf01
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x42024ff6
li t1, 0x6b576c5d
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x79f6ff25
li t1, 0xce27a162
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x553b884b
li t1, 0x6e58bca9
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1e1128a7
li t1, 0x6781dddf
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa4861054
li t1, 0x47f709fc
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0xc1c8b795
li t1, 0xae51e221
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x100e6d35
li t1, 0x72486d27
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x5bed11d
li t1, 0x15871d01
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x803a07a0
li t1, 0x8d5e09d0
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3ff7e01a
li t1, 0xec30f197
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4272d67
li t1, 0x37a9f798
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2ba9263b
li t1, 0x1cfa278c
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1cb9de8f
li t1, 0x8efaa06e
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a220744
li t1, 0xb0541abb
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1657ab91
li t1, 0x383570be
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0xbb85ab5
li t1, 0x4896215f
or t2, t1, t0
sw t2, 4(sp)
li t0, 0x4065dc94
li t1, 0xdeef6d57
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd0d8cc1e
li t1, 0x116f40ab
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x293c6853
li t1, 0x42f83826
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc3c7964f
li t1, 0x7dcfdcd5
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8ccd2f76
li t1, 0xff78dfee
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x214955b
li t1, 0xe3f84cec
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x56ecc169
li t1, 0x2e5dfb8b
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x97461e77
li t1, 0x9ac6c24
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0x357933e
li t1, 0x1c2a9c92
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6865e265
li t1, 0xc84de50d
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0x5a216bf7
li t1, 0x27ed70dd
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb73356c0
li t1, 0xfa1e5e28
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd1444b78
li t1, 0x7d310141
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7a0d1169
li t1, 0xe71eca38
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xef9dcf43
li t1, 0x8dcbecb
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc16d2775
li t1, 0x1d8f2fc9
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1176b5cf
li t1, 0xc2c3419a
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x13faabf
li t1, 0x3a0cbb18
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4747d4d2
li t1, 0x304a23f3
pv.dotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7d53d8e
li t1, 0x1f7c3c7d
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb5b573da
li t1, 0x5ac71275
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xeb0f7212
li t1, 0x61ec9ed8
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbf9fc1a6
li t1, 0xecc257ea
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x36217cf1
li t1, 0x1b930b30
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9f04af1c
li t1, 0xff744512
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb32ab824
li t1, 0xca860617
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbd535fc8
li t1, 0xa9631aee
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcc0d4adf
li t1, 0x4e315ca9
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe1b582d
li t1, 0xc3d4bc0d
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1088ea89
li t1, 0x2c14c89
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd753265b
li t1, 0x93066b32
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x63af1979
li t1, 0x3b73fc8b
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfccd531f
li t1, 0x35f4fcfa
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b992178
li t1, 0xa2ddb2c7
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0x247c210a
li t1, 0xbef8f147
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0xa1ae5306
li t1, 0x56166ead
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4ff13ccd
li t1, 0x2bdc688e
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa15024ce
li t1, 0x7ee54093
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xadf3042f
li t1, 0x669057ab
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3dafd923
li t1, 0x3ed6f33c
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0xee760288
li t1, 0x55aeee18
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xabe759c
li t1, 0xe59e40cf
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x454f7b5e
li t1, 0xd3eef397
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbb03d147
li t1, 0xef6e788
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcf6c18b5
li t1, 0xe5b9cbcc
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xacc125da
li t1, 0x612f6e84
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0xfff07d6a
li t1, 0x55f868eb
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x8f1eeced
li t1, 0x31b58354
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8c686dca
li t1, 0x7a2656a5
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xaa94d487
li t1, 0xaede80f0
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0x45b46ad8
li t1, 0x5e51d0a6
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf002f190
ori t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x735ff89e
sltiu t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xcf7f7727
slli t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x80bf657d
srai t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x63caaedd
xori t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x68663277
addi t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xb368c648
andi t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xc412b57e
slti t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xf5e70594
srli t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xa7cdbd48
li t1, 0x54b657c7
p.subuN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0x53512e67
li t1, 0x9fb3464d
p.adduN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0xf6d10608
li t1, 0x19d008fe
p.adduRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0xdda25f7d
li t1, 0xe6cec3f2
p.subN t2, t0, t1, 0x4
sw t2, 4(sp)
li t0, 0x214c6238
li t1, 0x8bdfd600
p.subRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x462d2f00
li t1, 0xeaa2ff92
p.addRN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x940210ff
li t1, 0x763a2b7d
p.addN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x7e6ad055
li t1, 0xdf75c18f
p.subuRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0x2b65cd9a
p.insert t1, t0, 0x1, 0x0
sw t1, 4(sp)
li t0, 0x4664c972
p.extractu t1, t0, 0x6, 0x2
sw t1, 4(sp)
li t0, 0x65b526c1
p.extract t1, t0, 0x7, 0x1
sw t1, 4(sp)
li t0, 0xec6f714f
p.bset t1, t0, 0x7, 0x2
sw t1, 4(sp)
li t0, 0xb51200e5
p.bclr t1, t0, 0x4, 0x0
sw t1, 4(sp)
li t0, 0x88a8dce6
p.clipu t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xe83ee243
p.clip t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xb9394568
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0x905724f0
p.clb t1, t0
sw t1, 4(sp)
li t0, 0xb05109d6
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x4d402a47
p.abs t1, t0
sw t1, 4(sp)
li t0, 0x972d4d9d
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0xea4a6abd
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x58e863f2
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0xed2cb61
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x748a5f52
pv.cmpne.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x93e7381d
pv.avgu.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0xdf2eee27
pv.and.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x1af67fbc
pv.sra.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xa21f950e
pv.cmpltu.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x49745bee
pv.sub.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x5f71fa00
pv.min.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x1b3493bd
pv.dotup.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xf74a58f1
pv.max.sci.h t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x57063c3e
pv.maxu.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xfc27a6d5
pv.shuffleI3.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x15aecda8
pv.cmple.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x295044ea
pv.sdotsp.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x27148529
pv.or.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x8af07964
pv.dotup.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x98924b72
pv.add.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x831e8e02
pv.and.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x9e7e8ad5
pv.cmpgtu.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x59b84a66
pv.maxu.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xf983a263
pv.minu.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xbb8ad0f3
pv.or.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x7a82c136
pv.xor.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x8d88e382
pv.dotsp.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x8ffa8ba3
pv.avg.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xe410732e
pv.add.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x1fb8bd42
pv.cmpgt.sci.h t1, t0, 0x13
sw t1, 4(sp)
li t0, 0x7385a4e4
pv.sra.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x53c51b7c
pv.cmpgtu.sci.h t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x5c2600c4
pv.avg.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x446656b9
pv.srl.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x70eaedc6
pv.cmpge.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x6c384167
pv.max.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x9759a96a
pv.shuffleI1.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xf559d569
pv.cmpltu.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0x1a646508
pv.sdotusp.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x8b2ff023
pv.srl.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xfbd028c8
pv.sub.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0xa70b8f60
pv.cmpgeu.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x277c8a8
pv.cmpleu.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xb3ad7230
pv.sll.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xe3d80441
pv.shuffleI0.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x789e0437
pv.sdotusp.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x4df85819
pv.sdotup.sci.h t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x6edaab04
pv.avgu.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x6d9765a8
pv.cmplt.sci.b t1, t0, 0x13
sw t1, 4(sp)
li t0, 0xca25d4f2
pv.cmpne.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xfecbee2f
pv.xor.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0x73306a8b
pv.dotusp.sci.h t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x68a865f3
pv.cmple.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xac563069
pv.sdotsp.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x6b739f5f
pv.dotsp.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x7cb86173
pv.cmpleu.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x43145c2b
pv.cmplt.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x847e4a25
pv.minu.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x3cd689a5
pv.cmpgt.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x8f080aa0
pv.cmpeq.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x70352ea8
pv.min.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x670bb251
pv.dotusp.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xb07a9135
pv.sll.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x3cb1e03
pv.cmpgeu.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xdfbb4493
pv.shuffleI2.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x3c8ee7b8
pv.shuffle.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xbdc26c5f
pv.cmpeq.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xc09d4e8a
pv.cmpge.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x8dfcaaee
pv.sdotup.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, -0x5d86840
li t1, 0xa1b1efae
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x5ddf1e35
li t1, 0x4bf5c2b6
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x243dc02a
li t1, 0xbc43e7d6
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x6093a53
li t1, 0xb35476fa
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x56e85db8
li t1, 0x33539d83
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x7934e2fd
li t1, 0x7973a908
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x2a0bb05b
li t1, 0x42c6bd46
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x619dd1e9
li t1, 0xcdccdb78
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x5b9651fd
li t1, 0xca763476
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x40c83fc6
li t1, 0x3f02c439
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x546335f
li t1, 0x9ba5bbdd
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6590b7ca
li t1, 0xdc60abf9
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x15f2eeaa
li t1, 0x23ec000c
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3ad843fc
li t1, 0xf550fe83
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6d678496
li t1, 0xd96422e2
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x48a7dd83
li t1, 0x54acecc4
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5b5bb6b4
li t1, 0x6a4022f3
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5d993250
li t1, 0xcec9e022
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x40df8156
li t1, 0x3b58ec77
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x68d5a02b
li t1, 0x8df79f0
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x271b4c56
li t1, 0x420d49ad
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x9e8b3b4
li t1, 0xca1b8a0
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x662cfe27
li t1, 0xd8d9ecb9
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x691d0313
li t1, 0x80677405
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x25dff5a2
li t1, 0x4fe19885
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x2c56d353
li t1, 0x2f1cc44f
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x2198d3cb
li t1, 0x49337d55
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5bf0537b
li t1, 0xc609ab08
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x7ae276a2
li t1, 0xf4e94e05
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x6eb6f0c0
li t1, 0xf439c37b
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x4f6644a5
li t1, 0x5e96cab4
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2d15693d
li t1, 0x433bc49b
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x104a95d1
li t1, 0x2c2e90e8
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6d7ba9dc
li t1, 0xb72cceb4
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x35270e6c
li t1, 0xf12d76e4
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0x3966061
li t1, 0xe9fa1219
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x30228eb0
li t1, 0x6629999b
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x401e9183
li t1, 0xc23408d8
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x33bbde21
li t1, 0x5fc9d972
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x16cb7b48
li t1, 0x1c35f681
divu t2, t1, t0
sw t2, 4(sp)
li t0, 0xfd6f21c8
li t1, 0xd0bb0fee
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x1785c8d2
li t1, 0x1a9912f1
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3584f7cf
li t1, 0x247952eb
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x561cf047
li t1, 0x24f5b9d5
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x14ad3953
li t1, 0x462e64cf
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xefcc6cd4
li t1, 0xdf3481eb
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa5e03147
li t1, 0xc028f46c
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x66d22a99
li t1, 0xecaabb98
pv.dotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x44102f58
li t1, 0xb76ec6a7
pv.dotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb83ded6e
li t1, 0x1c33c7f
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x84b51c0d
li t1, 0xaf1df9a5
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe73df0c3
li t1, 0x134c4fcf
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8c5e1279
li t1, 0xa1fda8a9
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd793dfa6
li t1, 0x3897520f
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc2bd49de
li t1, 0x97f82687
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xafbe7ec
li t1, 0xb206a953
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xae8ceebf
li t1, 0xe0e41eac
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe7107eaa
li t1, 0x8ba1cb7b
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0xf5ccaec2
li t1, 0xb346f877
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb7532243
li t1, 0x3b742258
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8f7a873b
li t1, 0x48fcc15a
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa9170668
li t1, 0x505805ff
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x295213df
li t1, 0x7964c1ee
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xef99c156
li t1, 0x64b4dee8
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb45b6efd
li t1, 0xe19d67c9
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b3a9326
li t1, 0x9e1803da
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x26c39285
li t1, 0x877130f4
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x99a1f1b
li t1, 0xae606ecb
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe364c46a
li t1, 0x41bf928b
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9f74ee7f
li t1, 0xf6b717e8
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0x59a123ed
li t1, 0x95571fe7
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x608537e8
li t1, 0x9f466b7c
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0xdbdef9c
li t1, 0x99135c29
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2fd051f1
li t1, 0xbf8898e4
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe3e71d07
li t1, 0xbe6c88fc
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5425bdf7
li t1, 0xc4b02463
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x572d13a1
li t1, 0x7189a8b1
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xdf4ca260
li t1, 0xb773df7b
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x81ea39e9
li t1, 0xd15af502
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x39a72036
li t1, 0xfcb2bab7
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3551815d
li t1, 0x56c89f4d
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd0a3685c
li t1, 0xbf01709a
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7b4f36de
li t1, 0xf54fee9d
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x81fb9779
li t1, 0xa5ff53dd
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x99873a6e
li t1, 0xd77dbfa1
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2c8c22a3
li t1, 0xe6115e63
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x32407471
li t1, 0xdc77c2d3
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x543e6bed
li t1, 0x3ed2859d
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6b4d816f
li t1, 0xb86115b3
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x892fa253
li t1, 0x412b473e
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3c8d0acc
li t1, 0x3e2b35bc
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xbc0021dc
li t1, 0x61ae2069
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x72e47a3c
li t1, 0xc3543d84
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb7173372
li t1, 0xfd6aa55
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9883b521
li t1, 0xd498b8d7
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x22675349
li t1, 0x78bc113
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0xeac2697b
li t1, 0xf52c2cd7
add t2, t1, t0
sw t2, 4(sp)
li t0, 0x98cf17bc
li t1, 0x57437ad8
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa9b85e79
li t1, 0xedb50860
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4b75f90f
li t1, 0x80f106bc
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa7eda78d
li t1, 0x4e40384a
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2f9becbb
li t1, 0x7e1d06a1
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4072232f
li t1, 0x5f5ba266
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5b328491
li t1, 0xe41f269a
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa9293e52
li t1, 0x621320a3
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc3d5ad43
li t1, 0xabde83b3
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x61dfc9cc
li t1, 0x6dbca3c4
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x143dab8b
li t1, 0x32f08ea6
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3e8b38de
li t1, 0xec52dfdc
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe72b77cc
li t1, 0xa9dfb13
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x341f34d8
li t1, 0x452b097
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa9674a80
li t1, 0xab2b301
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa861ce78
li t1, 0xaa0164fb
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6c90f2c2
li t1, 0x6b7b5f5b
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6f872e09
li t1, 0x9ca5cd86
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0xe9d08d00
li t1, 0xf6387ddb
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe184af88
li t1, 0x7a8bb287
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x67092e51
li t1, 0x698e69f3
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xf730298c
li t1, 0xb14b4416
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb04343bd
li t1, 0x85a91420
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd021fb8e
li t1, 0xb8d3bb60
or t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5610a97
li t1, 0x195f627b
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x3ef56978
li t1, 0x7ea09819
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x78844870
li t1, 0xbfa4e731
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xebfac3d8
li t1, 0x480769a5
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x1a64631c
li t1, 0x74a220ee
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0xd40a188d
li t1, 0x63f31582
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8ef676ef
li t1, 0x8f1ad886
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc1347ee6
li t1, 0x4b514136
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6c976a98
li t1, 0xb0946f41
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x25e0a7e8
li t1, 0x797e8c9f
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x99cfb4c9
li t1, 0x739d3725
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd833dc25
li t1, 0x3c032092
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0x7e36b93e
li t1, 0x57153076
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x83a1f2d2
li t1, 0x921b8b1f
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5da0dcee
li t1, 0x63cea553
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe913213
li t1, 0x99804e9e
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb1ef1718
li t1, 0xf8c58790
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0x29445156
li t1, 0x40fbc4b7
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf037e5b0
li t1, 0xa5e2224e
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x56928339
li t1, 0xfcf32517
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4f78ba4c
li t1, 0xf1059cd6
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x74c85274
li t1, 0x9f10a90d
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3c527acd
li t1, 0xf475e5e7
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x621aa3e1
li t1, 0x4c2549a8
and t2, t1, t0
sw t2, 4(sp)
li t0, 0x922dc748
li t1, 0x50eaf623
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x659562ed
li t1, 0xe96117e1
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0xfdec6bd9
li t1, 0x55a9e27
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xeef343f3
li t1, 0x33f9af40
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5a93dfa
li t1, 0xd92da048
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x767028bb
li t1, 0xf6b07eea
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0x4022c2d9
li t1, 0x788b0ab4
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa607638c
li t1, 0x8170b6ac
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdc6efedb
li t1, 0x7054ce4a
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd4e167ee
li t1, 0x368b63ee
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb2f8587c
li t1, 0xb546b035
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf339087c
li t1, 0x6985adde
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc12d1349
li t1, 0x239670dd
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x10c2e8c9
li t1, 0x3e586e0b
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbab68e7c
li t1, 0x728fa3b5
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0xfd87960d
li t1, 0xe8d95e24
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x501d9cd0
li t1, 0x5ba108e4
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6436b5cf
li t1, 0xfc2296ce
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8788c0ee
li t1, 0x333e7a76
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x427ba9ce
li t1, 0x54319cc0
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x79d079fd
li t1, 0x48b2f5b9
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3dfc690
li t1, 0x23ab0a49
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xa5dbb64a
li t1, 0x78919b48
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb8deaa30
li t1, 0x77765f8d
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xfe40dea5
li t1, 0xacd6795
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x22d32953
li t1, 0x1d089c12
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbf7197ea
li t1, 0x89210006
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0x65175a5f
li t1, 0xe3a34d65
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf06353ee
li t1, 0x44f09338
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xd18c5c89
li t1, 0x2f099384
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xdce45711
li t1, 0x8c135070
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0x455bd2b9
li t1, 0x15232513
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xee6e7655
li t1, 0x21fa0af4
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4b483af
li t1, 0x864990b0
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xeb4986a8
li t1, 0xeab093e0
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0x5d74c322
li t1, 0x2a130bfa
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5970fc35
li t1, 0xe9bb3656
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0x8d30715e
li t1, 0xbef1af88
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc858066a
li t1, 0x17b97e91
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe52ac2f6
li t1, 0xddddd6aa
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x11d6f4b5
li t1, 0x24f89d48
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd6ee8bf3
li t1, 0x53be4bfd
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xfe82f7f3
li t1, 0x181f5ea9
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xada43b2
ori t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x59fadf8f
andi t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x571ae9f
srai t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xd04bb10e
srli t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x5335f879
addi t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xa0709a4d
slti t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xf45b0a00
xori t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x7babe17
sltiu t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xa9272a33
slli t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x7b1a2959
li t1, 0xc66078df
p.subuRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x900a01f1
li t1, 0xed9f6900
p.addN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0x6a09006c
li t1, 0x9e03a3dd
p.adduN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xde0ff024
li t1, 0xf82db50d
p.adduRN t2, t0, t1, 0x1
sw t2, 4(sp)
li t0, 0xcdc8d4be
li t1, 0x39153e4c
p.addRN t2, t0, t1, 0x7
sw t2, 4(sp)
li t0, 0x5d7ef7e6
li t1, 0x4c2b3cf4
p.subRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xc41a9c73
li t1, 0xb0749692
p.subuN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xc1586cb
li t1, 0xfbd9631a
p.subN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xc7256cda
p.extractu t1, t0, 0x5, 0x2
sw t1, 4(sp)
li t0, 0xce510ba6
p.insert t1, t0, 0x5, 0x1
sw t1, 4(sp)
li t0, 0xd8fb880e
p.bclr t1, t0, 0x3, 0x0
sw t1, 4(sp)
li t0, 0x867c4fac
p.extract t1, t0, 0x3, 0x0
sw t1, 4(sp)
li t0, 0x69708f3d
p.bset t1, t0, 0x4, 0x1
sw t1, 4(sp)
li t0, 0x9f0e7a02
p.clipu t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x606bc3b2
p.clip t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x870ec764
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x41e4e0c
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x7f666e6f
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0x4c4efabd
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x1c9ce381
p.abs t1, t0
sw t1, 4(sp)
li t0, 0xa435e17b
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x1b86c108
p.clb t1, t0
sw t1, 4(sp)
li t0, 0xa0ac197a
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x55da3e4d
pv.sdotusp.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x6e9a8a31
pv.dotsp.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x5dda9e12
pv.cmpltu.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x36b75ad5
pv.avg.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0xdf86bb31
pv.sdotup.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x42c6527a
pv.add.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xad8231ba
pv.cmpleu.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x5e671465
pv.cmpleu.sci.h t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x79748d4a
pv.sub.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x8995f70c
pv.sll.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x2756c92b
pv.or.sci.h t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x4b8fdc92
pv.cmpltu.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x6a5151a2
pv.shuffleI0.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xefceeca4
pv.xor.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xcc0d83b3
pv.shuffleI2.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x127f517c
pv.add.sci.h t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x5eac6ee8
pv.sdotusp.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xa5481c05
pv.dotsp.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x9f781fa6
pv.avgu.sci.h t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x49d166f8
pv.maxu.sci.b t1, t0, 0xf
sw t1, 4(sp)
li t0, 0xe5e7de86
pv.shuffle.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x640c7978
pv.cmpne.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x900e4c83
pv.sdotsp.sci.h t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xff199f64
pv.sub.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x4970d894
pv.shuffleI1.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xa941adfd
pv.sdotup.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xfcb13a8d
pv.sra.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0xc100c17c
pv.cmpgtu.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x51642473
pv.and.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xe8bb0092
pv.cmple.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xc51027d5
pv.minu.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xaaa7c071
pv.cmpgtu.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xd1fc4d70
pv.sra.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x48b70bf4
pv.min.sci.h t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xa3f21bdd
pv.min.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xfbb89782
pv.sdotsp.sci.b t1, t0, 0x5
sw t1, 4(sp)
li t0, 0xb0c6cf71
pv.avgu.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xcdea8da6
pv.dotup.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0xa42168de
pv.maxu.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0xa7a42006
pv.and.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x6b6153dc
pv.cmpgt.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x73d8aea1
pv.cmpeq.sci.h t1, t0, 0x18
sw t1, 4(sp)
li t0, 0xb0c46ea4
pv.srl.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x653d07a9
pv.cmpgt.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xe7e4a2e0
pv.max.sci.h t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x1e6f8c4
pv.cmpne.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x3d1dce7c
pv.cmpge.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x2f7cb030
pv.cmplt.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x88f0df6e
pv.dotusp.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x462f1b8c
pv.max.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xe8469d5c
pv.cmpge.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x2e9448d4
pv.dotup.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xca92e81
pv.cmpgeu.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x669947e9
pv.cmplt.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0xf81db96e
pv.avg.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x7d9ccd9f
pv.or.sci.b t1, t0, 0xe
sw t1, 4(sp)
li t0, 0xc11a146d
pv.srl.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0x3748cc6f
pv.dotusp.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xd3850636
pv.cmple.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, 0x389972e0
pv.minu.sci.b t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x2ae9162e
pv.cmpeq.sci.b t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x19b5bdfb
pv.xor.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xb868cb5a
pv.sll.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x6bea1453
pv.shuffleI3.sci.b t1, t0, 0x16
sw t1, 4(sp)
li t0, 0x16606895
pv.cmpgeu.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x2f008b
li t1, 0x6a89f98d
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x27057cc1
li t1, 0xd1a8626e
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4f1659ec
li t1, 0x72e30f1
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x6969c92d
li t1, 0xf9a2825e
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x68aacfdf
li t1, 0x23c824c8
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x221d6682
li t1, 0xc6d5e742
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x24383191
li t1, 0x6f5601d5
div t2, t1, t0
sw t2, 4(sp)
li t0, 0x701ea41
li t1, 0x2b04fb99
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x7f16b357
li t1, 0xbf147a8
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x1f58b22a
li t1, 0x98dc3e15
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x21422fc9
li t1, 0xb0a54592
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x809be4a
li t1, 0x66366312
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1a80e9d7
li t1, 0xd1b16a2e
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x683e844a
li t1, 0x249a5667
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2b9527c7
li t1, 0xc39a4f64
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x49374ea2
li t1, 0xc7c9a118
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x50968754
li t1, 0xb06f0d4a
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2adc0691
li t1, 0xe63da82
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5c6ecd6a
li t1, 0x55e401f9
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4148e4f2
li t1, 0x50a296c8
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x62ff19ec
li t1, 0xa49f6887
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x31afef3d
li t1, 0xd3c499ef
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x54d46293
li t1, 0x6d46eead
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6596a225
li t1, 0x2fdf7518
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0xab129ed
li t1, 0xcd26c592
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x71ebf419
li t1, 0xc66ae329
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x58e230b6
li t1, 0x8195741d
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x599aa413
li t1, 0x1177a334
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6e105718
li t1, 0x54f0c303
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x751106a1
li t1, 0x556e8dd6
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x42ac8877
li t1, 0xed2d0893
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x7bcebc5
li t1, 0xb9b0d799
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x385a613c
li t1, 0xcb1515b0
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x2825353e
li t1, 0xd3bd226d
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x76c2a5b3
li t1, 0xda7f4ef7
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x61de6f8
li t1, 0x3681d078
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x6490e624
li t1, 0x6c53ae86
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x79b8e8c4
li t1, 0xb4a26c68
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x98aec3e
li t1, 0x8f4df0ab
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x7968b29b
li t1, 0x219c3640
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xbdd60fa0
li t1, 0x5f5270c0
pv.cmplt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd9d4a35c
li t1, 0x36f6d554
pv.max.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x63dcab45
li t1, 0xebf6dd41
pv.cmpgeu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xdf9fed6b
li t1, 0x36fd66a6
pv.xor.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x34665d56
li t1, 0x96fb8972
sra t2, t1, t0
sw t2, 4(sp)
li t0, 0x6cbdd09d
li t1, 0xffcd9ad4
p.min t2, t1, t0
sw t2, 4(sp)
li t0, 0xec34f6d
li t1, 0xf6b916a9
pv.avg.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x93ba2e57
li t1, 0x27366552
pv.max.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6dccd4ea
li t1, 0xc03eeb97
slt t2, t1, t0
sw t2, 4(sp)
li t0, 0x7927b7c2
li t1, 0x5e3f437c
mul t2, t1, t0
sw t2, 4(sp)
li t0, 0xcf16a613
li t1, 0x88ae3b0b
p.extractur t2, t1, t0
sw t2, 4(sp)
li t0, 0xce583df7
li t1, 0x296809ae
pv.sub.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa902f67b
li t1, 0xc8dab3cc
pv.cmpleu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x381bdf2f
li t1, 0xc3395cd2
pv.srl.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4dc3951b
li t1, 0x353c741a
pv.dotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf76b1aa
li t1, 0x89653a88
pv.and.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb51ddd59
li t1, 0xb97e48b8
pv.cmpgt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x65d173ad
li t1, 0x748de419
pv.max.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7a60bd5c
li t1, 0x2ec01213
pv.cmpge.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6faf48bf
li t1, 0x7826ccf4
pv.cmpgeu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x34e51db6
li t1, 0x3a6c91a8
pv.dotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x76e277ea
li t1, 0x8d4b5cfe
pv.sdotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe5743c21
li t1, 0x798f4b9b
pv.or.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x76abfe33
li t1, 0xe136330d
p.insertr t2, t1, t0
sw t2, 4(sp)
li t0, 0xd19a9c8c
li t1, 0x298f4399
pv.pack.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f6b9c4e
li t1, 0x495fc53f
p.addRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xa3e3861d
li t1, 0x325c131d
pv.add.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x410c12cb
li t1, 0x74f02c54
pv.avg.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6edbef9e
li t1, 0xf527f335
pv.shuffle2.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4150df76
li t1, 0x4b94b0d2
pv.sra.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3b9ff049
li t1, 0x949d8ce0
pv.sll.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x775024b8
li t1, 0x8edceda5
pv.cmpleu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5589ecc9
li t1, 0xe8170515
pv.cmpne.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8c4f4905
li t1, 0x796b41ab
pv.cmpgeu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf81a4671
li t1, 0x88eac559
pv.avg.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7c630406
li t1, 0xd9124d0
p.minu t2, t1, t0
sw t2, 4(sp)
li t0, 0xe14793df
li t1, 0x4c4747c2
pv.maxu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x19f413d5
li t1, 0x86f15596
pv.cmpge.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xeb4117fe
li t1, 0x8e7021f1
pv.cmpne.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x109b6d96
li t1, 0x2eb7a6d3
pv.cmpleu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x172d02cf
li t1, 0x2c748b71
pv.cmpgt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb2f172a5
li t1, 0x26afa28d
p.maxu t2, t1, t0
sw t2, 4(sp)
li t0, 0x8df323ac
li t1, 0xd0055094
sll t2, t1, t0
sw t2, 4(sp)
li t0, 0xdcdeab96
li t1, 0x6d360fbe
add t2, t1, t0
sw t2, 4(sp)
li t0, 0x82c21a5a
li t1, 0x31dd6ef8
p.bclrr t2, t1, t0
sw t2, 4(sp)
li t0, 0xdc442855
li t1, 0x104dfe70
pv.sll.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x8e9ebc83
li t1, 0xeb93f041
pv.shuffle.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7f98f423
li t1, 0xc706f24b
pv.dotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2d1ca002
li t1, 0xdb176475
pv.cmpeq.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9d3f8330
li t1, 0xd5965af6
pv.cmple.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3fb85fff
li t1, 0x71d5cd5a
pv.dotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x1eccf116
li t1, 0x1823bd4f
pv.packhi.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x123a144f
li t1, 0x8d8d1dc8
p.adduNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x64a78ae3
li t1, 0xebe3471
p.subNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x1b8b90c1
li t1, 0xc8e52efd
pv.cmple.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x282c66d3
li t1, 0xc2892446
pv.cmpltu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xb3e9166
li t1, 0xf0bce772
pv.cmpleu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2c0d93c8
li t1, 0x285ec2d8
pv.or.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x6e03d3e1
li t1, 0xdbd928a7
pv.and.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xca32db37
li t1, 0x2fd8eb36
pv.srl.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbba58fb6
li t1, 0x82aeb74b
pv.cmpgt.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x876c395
li t1, 0xd2a1db49
pv.and.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2880556b
li t1, 0x80c7cb7c
pv.cmpeq.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x3ebf1802
li t1, 0x50d7d118
pv.min.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7d8797fa
li t1, 0x29e3c542
p.subuNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6fc1471
li t1, 0xe2578fed
pv.cmpltu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6f95669a
li t1, 0x54e31a23
p.slet t2, t1, t0
sw t2, 4(sp)
li t0, 0x590b67e0
li t1, 0x363ef97d
p.addNr t2, t1, t0
sw t2, 4(sp)
li t0, 0x159fc60c
li t1, 0x29e6591c
sub t2, t1, t0
sw t2, 4(sp)
li t0, 0x24434def
li t1, 0x96e1a2a8
pv.sdotup.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5f4e57e
li t1, 0xd5ff874c
pv.minu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x230f021e
li t1, 0xeb6cfc43
p.subRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xf017b956
li t1, 0x219682d8
p.sletu t2, t1, t0
sw t2, 4(sp)
li t0, 0x27a27efd
li t1, 0xf9c0308f
pv.sub.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x8f31a47d
li t1, 0x9b5e428b
pv.srl.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x714fb8a9
li t1, 0x64f3966d
pv.xor.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbe79b33e
li t1, 0xf63576d8
pv.cmpne.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7d3fccac
li t1, 0x15951e81
pv.or.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5540b3a1
li t1, 0x7ee08fff
pv.cmpeq.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xcc07512a
li t1, 0x4483bcb2
pv.min.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7781fe6
li t1, 0x7545c309
pv.xor.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x20fc6961
li t1, 0x2e2c40cb
pv.maxu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x32b34618
li t1, 0xcf285438
pv.sub.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xff5c0ea3
li t1, 0xd89a8c4b
pv.sra.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x10985d2b
li t1, 0xc9203803
pv.minu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc2d061c3
li t1, 0xa2bf4da3
pv.cmplt.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x4e1505cb
li t1, 0xce4ec47d
pv.cmpgtu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9a4de427
li t1, 0x96799d3e
pv.avgu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd3f6e43f
li t1, 0x8e1a910e
or t2, t1, t0
sw t2, 4(sp)
li t0, 0xaeea8985
li t1, 0x28feed79
pv.add.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xaae53b70
li t1, 0x34fb1992
p.subuRNr t2, t1, t0
sw t2, 4(sp)
li t0, 0xb6a66aec
li t1, 0x3ff82edc
pv.packlo.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xff2537c7
li t1, 0x7c1fa0fe
and t2, t1, t0
sw t2, 4(sp)
li t0, 0xda315312
li t1, 0x327ea8c0
pv.sll.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xe15be55
li t1, 0x92104613
srl t2, t1, t0
sw t2, 4(sp)
li t0, 0xc75bfa2
li t1, 0xb42e6571
pv.add.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xf8f99493
li t1, 0xf51eb0c4
pv.cmpge.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x18acc04
li t1, 0x34bf7a0c
pv.avgu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x84c88645
li t1, 0xab6298a2
pv.and.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7252e3
li t1, 0x59c48abe
pv.avg.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xc0718ba4
li t1, 0x82cdbab2
pv.cmpgtu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x406caecf
li t1, 0xf05c5d6
pv.cmpltu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x93920d1e
li t1, 0xf4edf1d4
pv.or.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x59823e02
li t1, 0x1b4ad48d
pv.srl.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x790ffbce
li t1, 0xeb7020b6
pv.cmplt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x109cba0f
li t1, 0x55b8b7fc
pv.avgu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x7443eb42
li t1, 0xe14e1fa7
xor t2, t1, t0
sw t2, 4(sp)
li t0, 0x9b2344ca
li t1, 0xff95492e
pv.cmpeq.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xe3441e5d
li t1, 0xa644fd0e
pv.cmpgt.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x66962281
li t1, 0xe988e8a4
pv.add.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xd99ca821
li t1, 0xc6c4145d
pv.minu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7ec5f9b7
li t1, 0x8e069e65
pv.xor.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9dca35cb
li t1, 0xe7c209df
sltu t2, t1, t0
sw t2, 4(sp)
li t0, 0xe1a51226
li t1, 0x8a5a5cd
pv.avgu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9f96302
li t1, 0xb40268cc
pv.minu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x2b61833e
li t1, 0x25da3ed8
pv.cmpgeu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xa31a9f46
li t1, 0xb9db6b93
pv.shuffle.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xb125268
li t1, 0x2ef250bd
pv.maxu.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x9c0ef28a
li t1, 0xd27fa7e4
p.max t2, t1, t0
sw t2, 4(sp)
li t0, 0x1368b7aa
li t1, 0xcc963eea
pv.cmple.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x7397c0c0
li t1, 0xc20d5d71
mulhu t2, t1, t0
sw t2, 4(sp)
li t0, 0x3ae1d643
li t1, 0xf771bcda
p.ror t2, t1, t0
sw t2, 4(sp)
li t0, 0x84c22d8
li t1, 0xa2de54ba
pv.sll.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x4181105e
li t1, 0xc08f5764
pv.cmpne.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x679c44e4
li t1, 0x752db165
pv.sdotusp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x5395cb59
li t1, 0x615c4e1d
pv.sub.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x6579ee51
li t1, 0xcea3472
pv.maxu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x11870569
li t1, 0x9c8481e8
pv.sra.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xbd6863ad
li t1, 0xd80b9409
pv.max.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xdd6a7976
li t1, 0x9dc7c762
pv.cmpgtu.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xcc077ba8
li t1, 0x53eecb90
p.bsetr t2, t1, t0
sw t2, 4(sp)
li t0, 0xfaa6cf73
li t1, 0xfc16ba43
pv.cmpge.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x974e0323
li t1, 0xbf563156
pv.sdotup.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9edb3a18
li t1, 0xec8f1080
pv.dotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3c250316
li t1, 0xe09140f
pv.cmple.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0x2386d0d6
li t1, 0x2dc337c
mulh t2, t1, t0
sw t2, 4(sp)
li t0, 0x936970c
li t1, 0x6bb365f2
pv.dotsp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x5b2debf5
li t1, 0xe8baf86c
pv.sra.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x9fd25d19
li t1, 0xd6415177
pv.min.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xc5764187
li t1, 0x1b2e1625
pv.cmpgtu.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x68e800a7
li t1, 0x40a083b3
pv.sdotusp.sc.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x83be16ac
li t1, 0x87fd2848
pv.cmplt.b t2, t1, t0
sw t2, 4(sp)
li t0, 0xd48e4923
li t1, 0x55e38dda
mulhsu t2, t1, t0
sw t2, 4(sp)
li t0, 0x88b43330
li t1, 0x6fc1a7ed
pv.sdotsp.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xff9a2b29
li t1, 0x39aba5ef
pv.min.sc.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xf8c6953
li t1, 0x7474ee8a
pv.cmpltu.b t2, t1, t0
sw t2, 4(sp)
li t0, 0x3908b789
li t1, 0x13477635
p.extractr t2, t1, t0
sw t2, 4(sp)
li t0, 0x66439162
li t1, 0x218d543e
pv.shuffle2.h t2, t1, t0
sw t2, 4(sp)
li t0, 0xef2a7ec1
srli t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xaf1f93f3
srai t1, t0, 0xc
sw t1, 4(sp)
li t0, 0x81a1984d
andi t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xe1ce1104
ori t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x8a68396d
addi t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xb8710c38
slli t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xf2fdfac2
sltiu t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x97c2c43d
xori t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x9a9432b5
slti t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x456fe1d6
li t1, 0x69c261be
p.adduN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xfc34aa84
li t1, 0x86117074
p.subuN t2, t0, t1, 0x6
sw t2, 4(sp)
li t0, 0x9ce6e9d8
li t1, 0x6d90d308
p.subuRN t2, t0, t1, 0x3
sw t2, 4(sp)
li t0, 0xcec5fbb8
li t1, 0xd8616d57
p.subRN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xc5c2adf6
li t1, 0xd2b86993
p.addN t2, t0, t1, 0x0
sw t2, 4(sp)
li t0, 0xa0c1db62
li t1, 0x1ee0f76b
p.subN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xe7727e26
li t1, 0x8e716326
p.adduRN t2, t0, t1, 0x2
sw t2, 4(sp)
li t0, 0xadc43887
li t1, 0xb9bad2d1
p.addRN t2, t0, t1, 0x5
sw t2, 4(sp)
li t0, 0xdbd62070
p.bclr t1, t0, 0x1, 0x1
sw t1, 4(sp)
li t0, 0xa792ff0c
p.bset t1, t0, 0x6, 0x2
sw t1, 4(sp)
li t0, 0x2918b607
p.insert t1, t0, 0x1, 0x2
sw t1, 4(sp)
li t0, 0x935c9710
p.extract t1, t0, 0x3, 0x3
sw t1, 4(sp)
li t0, 0x45796e99
p.extractu t1, t0, 0x4, 0x3
sw t1, 4(sp)
li t0, 0x665ec729
p.clipu t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xd52f272a
p.clip t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x4f4038d6
p.ff1 t1, t0
sw t1, 4(sp)
li t0, 0x6f0af947
p.extbz t1, t0
sw t1, 4(sp)
li t0, 0x5f59ba9e
p.abs t1, t0
sw t1, 4(sp)
li t0, 0xb72dc918
p.fl1 t1, t0
sw t1, 4(sp)
li t0, 0x791beedb
p.cnt t1, t0
sw t1, 4(sp)
li t0, 0x2672b434
p.extbs t1, t0
sw t1, 4(sp)
li t0, 0x81b5cff8
p.clb t1, t0
sw t1, 4(sp)
li t0, 0x68060634
p.exths t1, t0
sw t1, 4(sp)
li t0, 0x7659770e
pv.cmpgtu.sci.b t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x4240189f
pv.and.sci.h t1, t0, 0x1f
sw t1, 4(sp)
li t0, 0x8382c7cf
pv.sdotsp.sci.h t1, t0, 0x3
sw t1, 4(sp)
li t0, 0xa539a6df
pv.sdotsp.sci.b t1, t0, 0x4
sw t1, 4(sp)
li t0, 0x4f9af2e9
pv.minu.sci.h t1, t0, 0xe
sw t1, 4(sp)
li t0, 0x8e9d8614
pv.add.sci.h t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0xa0e3297e
pv.srl.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x8a11e0a
pv.xor.sci.h t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x57e3aa37
pv.cmpne.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x51c7c805
pv.cmpgt.sci.b t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x85d1f88b
pv.max.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0x6c771641
pv.avgu.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x756c9f17
pv.sra.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0x84ca5d2d
pv.and.sci.b t1, t0, 0x17
sw t1, 4(sp)
li t0, 0x58c88701
pv.cmpgeu.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x7489a4f1
pv.or.sci.h t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x1ebdcafe
pv.cmpgtu.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x5fb9573
pv.cmpleu.sci.b t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x71295218
pv.cmpgt.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0x3fcb04f
pv.cmpeq.sci.b t1, t0, 0x1a
sw t1, 4(sp)
li t0, 0x778d4e8f
pv.cmplt.sci.h t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xb0a1edaf
pv.sdotusp.sci.h t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x73d9870f
pv.dotusp.sci.h t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xb336746e
pv.shuffleI2.sci.b t1, t0, 0x9
sw t1, 4(sp)
li t0, 0x9574eb77
pv.sdotusp.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xb240ee58
pv.shuffleI1.sci.b t1, t0, 0x10
sw t1, 4(sp)
li t0, 0x3140bdc1
pv.minu.sci.b t1, t0, 0x12
sw t1, 4(sp)
li t0, 0xe81e7937
pv.avg.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x4a9cded7
pv.cmpge.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x8dba8bba
pv.sra.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xce00da7b
pv.min.sci.h t1, t0, 0x15
sw t1, 4(sp)
li t0, 0x89cb1b37
pv.xor.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x245692f3
pv.cmpeq.sci.h t1, t0, 0x8
sw t1, 4(sp)
li t0, 0xd30991b6
pv.sub.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xc2a868b2
pv.avg.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0x7266880
pv.cmpleu.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xf17eb5c0
pv.cmpgeu.sci.h t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0xd734a29c
pv.cmplt.sci.b t1, t0, 0x2
sw t1, 4(sp)
li t0, 0xe0158e2d
pv.dotsp.sci.b t1, t0, 0x14
sw t1, 4(sp)
li t0, 0xa00225db
pv.shuffle.sci.h t1, t0, 0x2
sw t1, 4(sp)
li t0, 0x133d171a
pv.shuffleI3.sci.b t1, t0, 0x1c
sw t1, 4(sp)
li t0, 0x79a9092b
pv.sll.sci.b t1, t0, 0xc
sw t1, 4(sp)
li t0, 0xe079be84
pv.dotup.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xabb202aa
pv.cmpltu.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0xa31651b0
pv.sll.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xed9d30a8
pv.sdotup.sci.h t1, t0, 0x1
sw t1, 4(sp)
li t0, 0xe81a86f6
pv.maxu.sci.h t1, t0, 0x14
sw t1, 4(sp)
li t0, 0x1d45cf7a
pv.shuffleI0.sci.b t1, t0, 0x1d
sw t1, 4(sp)
li t0, 0xe73958a7
pv.max.sci.h t1, t0, 0x0
sw t1, 4(sp)
li t0, 0x3ee1820c
pv.cmple.sci.h t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x6de4d4df
pv.or.sci.b t1, t0, 0x18
sw t1, 4(sp)
li t0, 0x12604383
pv.cmpne.sci.h t1, t0, 0x12
sw t1, 4(sp)
li t0, 0x3040f663
pv.min.sci.b t1, t0, 0x1
sw t1, 4(sp)
li t0, 0x38dca5bb
pv.dotusp.sci.b t1, t0, 0xd
sw t1, 4(sp)
li t0, 0x9b7bec36
pv.add.sci.b t1, t0, 0xa
sw t1, 4(sp)
li t0, 0xcbf02361
pv.srl.sci.b t1, t0, 0x1b
sw t1, 4(sp)
li t0, 0xde91d40b
pv.sdotup.sci.b t1, t0, 0x6
sw t1, 4(sp)
li t0, 0x92f294e3
pv.cmpge.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xe504014e
pv.sub.sci.h t1, t0, 0x19
sw t1, 4(sp)
li t0, 0x4b6e8a72
pv.dotup.sci.h t1, t0, 0x7
sw t1, 4(sp)
li t0, 0xe1b8ea1b
pv.cmple.sci.b t1, t0, 0x1e
sw t1, 4(sp)
li t0, 0xf881c7dd
pv.maxu.sci.b t1, t0, 0x3
sw t1, 4(sp)
li t0, 0x12b5cfe0
pv.cmpltu.sci.h t1, t0, 0xb
sw t1, 4(sp)
li t0, 0x276af068
pv.avgu.sci.h t1, t0, 0x11
sw t1, 4(sp)
li t0, 0xc6c25ba7
pv.dotsp.sci.h t1, t0, 0x5
sw t1, 4(sp)
li t0, -0x1977358
li t1, 0x416af333
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5e82eedb
li t1, 0x88b9f04b
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x397e48d1
li t1, 0x7fa184d6
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x305a6d64
li t1, 0x6620e92f
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x5781df8d
li t1, 0x78a998f8
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x3cb1e54b
li t1, 0x805a1513
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x134632dd
li t1, 0xba48b644
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x3be6132a
li t1, 0x5d2bd4b9
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0x6cd97bf
li t1, 0x5266b754
rem t2, t1, t0
sw t2, 4(sp)
li t0, -0x2c37a0d9
li t1, 0x660166ee
rem t2, t1, t0
sw t2, 4(sp)
li t0, 0xe20c5f
li t1, 0x25ab5fbe
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3649490d
li t1, 0xcc9e1bc3
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x151fc62a
li t1, 0xb7b8533c
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x500426bf
li t1, 0x64c05c16
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x1acb0d06
li t1, 0xe5d9ee0c
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x68826b27
li t1, 0x439b4bbe
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x94ec25a
li t1, 0xf2f64519
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x6f098ffd
li t1, 0xebb9b273
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x458de904
li t1, 0xf1b37ea5
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x318d08b4
li t1, 0xc2a46da8
divu t2, t1, t0
sw t2, 4(sp)
li t0, -0x4cc17de0
li t1, 0x15ddedec
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4f1859d6
li t1, 0x7b964329
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x73adadb6
li t1, 0xefe01862
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x7f7a68f6
li t1, 0x6fe6c92e
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x39e70eec
li t1, 0x91301d05
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x2424ca6d
li t1, 0xa622adc3
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4d52e8a
li t1, 0x43709cc7
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x2d8cf578
li t1, 0xdbc3ae84
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x5ce9ceaf
li t1, 0x9f059cf7
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x4134fb6d
li t1, 0xe8a9d1d2
div t2, t1, t0
sw t2, 4(sp)
li t0, -0x255ebf54
li t1, 0xe6f59a5a
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x60ffe950
li t1, 0x1b16777a
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x536d0cfc
li t1, 0x92fe783a
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x44438cb3
li t1, 0xf6dd9452
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x26c4fb0
li t1, 0x9606ac72
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3b65b48a
li t1, 0x80f7b827
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x3bebb7ae
li t1, 0x293f7c5c
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x2be57595
li t1, 0xd64a113f
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x7f1e8931
li t1, 0x244b752b
remu t2, t1, t0
sw t2, 4(sp)
li t0, -0x5562fb4e
li t1, 0x51b93c78
remu t2, t1, t0
sw t2, 4(sp)
li t0, 0x1
li t1, 0x1
lp.setupi x0, 30, Lfend
p.fl1 t2,t0
sw t2, 4(sp)
p.ff1 t2, t0
Lfend: sll t0,t0,t1

/* p.beqimm */

li t2, 0x8a792fc5
p.beqimm t2, 0x4, GO
sw t2, 4(sp)
li t0, 0x3cda
add t3, t1, t2
GO: add t3, t0, t2
sw t3, 4(sp)
sub t0, t3, t0
sw t0, 4(sp)
li t3, 0xc3e7
li t0, 0x01
p.beqimm t0, 0x01, L1
sw t0, 4(sp)
li t0, 0xf5a2
L1: li t1, 0xd710a
add t2, t0, t1
sw t2, 4(sp)

/* p.bneimm */

li t0, 0x2
li t0, 0xfca
li t1, 0xac130
p.bneimm t0, 0x2, NE1
sw t0, 4(sp)
add t2, t0, t1
NE1: sub t2, t1, t0
li t0, 0xe2f8
p.bneimm t2, 0x7, NE2
sw t1, 4(sp)
add t3, t2, t0
sw t3, 4(sp)
NE2: sub t3, t0, t2

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
