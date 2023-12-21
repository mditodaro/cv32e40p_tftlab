li t2, 0xa842cc36
li t0, 0xffffffff
p.fl1 t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x23650b06
li t3, 0x2b260fc7
li t0, 0x82008e41
p.addRN t4, t2, t3, 0x2
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x15a5d7fa
li t0, 0xc92a0830
li t1, 0xc9e1c001
p.abs t4, t2
p.addRN t5, t0, t1, 0x7
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb3b054bc
li t3, 0x29b454bc
li t0, 0x48801027
li t1, 0x94d1eb0e
sll t4, t2, t3
remu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2bdd04d5
li t3, 0x13dd52b7
li t0, 0xd10a0ee3
li t1, 0xd9a7413a
p.addRN t4, t2, t3, 0xd
p.subN t5, t0, t1, 0x2
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xbf98d2c7
li t3, 0x4d24d3d5
li t0, 0x6ca9e3
li t1, 0x7b80e3
p.adduRN t4, t2, t3, 0x0
p.addRN t5, t0, t1, 0x4
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x734b26
li t3, 0xf4b821c8
li t0, 0xa229f12e
li t1, 0x5f4e45fc
p.addRN t4, t2, t3, 0x7
pv.cmplt.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9bec0e9f
li t3, 0x93ec0e9f
li t0, 0xcf989c4c
li t1, 0xc0a3518c
sra t4, t2, t3
p.subRN t5, t0, t1, 0x6
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3a555fc9
li t3, 0x485b6e82
li t0, 0x6b02cc63
p.subRN t4, t2, t3, 0x2
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x22331476
li t3, 0x223308ff
li t0, 0xd7022945
li t1, 0x29f71a01
p.addRN t4, t2, t3, 0x18
p.subuN t5, t0, t1, 0x1d
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf7fad6ba
li t0, 0xc0865c1a
p.abs t4, t2
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2324107d
li t0, 0x111d57f8
li t1, 0x2ac82003
p.exthz t4, t2
p.subuRN t5, t0, t1, 0x9
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xba1c6bf
li t3, 0xba1c6bf
li t0, 0xe40abed8
li t1, 0xc5c6d5c0
p.ror t4, t2, t3
sra t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9823760c
li t3, 0xe88c1f2
li t0, 0x34d0c2de
li t1, 0xedf4c2d9
sra t4, t2, t3
p.subuN t5, t0, t1, 0x12
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x10c614a8
li t3, 0x10b1cae9
li t0, 0x5
p.clipr t4, t2, t3
p.bneimm t0, 0x5, L31
L31 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe082cfe
li t0, 0x22260059
li t1, 0x208c0059
p.abs t4, t2
p.addRN t5, t0, t1, 0x9
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8c07f
li t3, 0x20088037
li t0, 0x3a02
li t1, 0xd6598817
p.addRN t4, t2, t3, 0x17
p.subRN t5, t0, t1, 0x12
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xace1631d
li t3, 0xa8e1631d
li t0, 0xe77cf450
li t1, 0xd6080405
p.ror t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8b1c592f
li t3, 0x6c4af5d1
li t0, 0xd
sll t4, t2, t3
p.bneimm t0, 0x8, L39
L39 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x14a20006
li t3, 0xb2c8fffe
li t0, 0x8b1ffa8b
li t1, 0x3b335869
p.subRN t4, t2, t3, 0x6
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffbb7d7
li t0, 0xf54d9fb
li t1, 0xf0ab2604
p.exthz t4, t2
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1493
li t3, 0x8ba767d6
li t0, 0xd3b29f2d
li t1, 0xd3b29f2d
remu t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8000
li t0, 0x206cf8
p.ff1 t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x98f725f0
li t0, 0xe1f4bfc5
li t1, 0xcaae71ac
p.abs t4, t2
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x475f9876
li t0, 0x4d80ad2f
li t1, 0x4dfff27c
p.abs t4, t2
p.subRN t5, t0, t1, 0x6
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4ec7da9e
li t3, 0x4ec60b50
li t0, 0xf9bf2333
pv.cmple.h t4, t2, t3
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x317f0a77
li t3, 0x4de0df80
li t0, 0x9f82f93d
p.clipur t4, t2, t3
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb583c3f2
li t0, 0x419ffe4d
li t1, 0xd4200924
p.abs t4, t2
p.subRN t5, t0, t1, 0x4
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1b8267fe
li t3, 0xeeff48fa
li t0, 0xf8156c31
li t1, 0x18c54bed
rem t4, t2, t3
p.adduRN t5, t0, t1, 0x14
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd8589c98
li t3, 0xd8589c98
li t0, 0x3
and t4, t2, t3
p.bneimm t0, 0x5, L61
L61 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfd627d72
li t3, 0xb3d00c00
li t0, 0xa9e82943
p.subN t4, t2, t3, 0x1a
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x319a21c8
li t3, 0x319a21c8
li t0, 0x266bdc6e
li t1, 0x8fdccd6b
pv.cmpge.h t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x0
li t3, 0x9c2175d2
li t0, 0x34461048
li t1, 0x33f2072c
divu t4, t2, t3
p.subRN t5, t0, t1, 0x9
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffffff
li t3, 0x465630ed
li t0, 0x995d749e
li t1, 0x3246c608
rem t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x40408e01
li t0, 0x80912080
li t1, 0x3fd1e3a2
p.cnt t4, t2
pv.cmpgeu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x19c844f0
li t3, 0x507ddd48
li t0, 0xfad7e6e8
li t1, 0x28d70001
p.subRN t4, t2, t3, 0xc
p.subuN t5, t0, t1, 0x15
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc1c517a8
li t3, 0xc14517a8
li t0, 0x293065f
li t1, 0x7a4919b0
sra t4, t2, t3
p.subN t5, t0, t1, 0x12
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7443eda0
li t3, 0x93841b9b
li t0, 0x3258afdf
li t1, 0x7258afdf
div t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x84400
li t0, 0x5e13dc1d
li t1, 0xa1eca3e2
p.exthz t4, t2
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x0
li t3, 0xb755fdfa
li t0, 0x1ba33445
li t1, 0x73b1fef9
p.clipur t4, t2, t3
pv.cmpleu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x969838a8
li t0, 0xa4138302
li t1, 0xa0138302
p.exthz t4, t2
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x775871c8
li t0, 0x31db4f15
li t1, 0x74ede3a
p.exthz t4, t2
or t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7b39308d
li t0, 0x80098d87
li t1, 0xb7f84c60
p.cnt t4, t2
rem t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa900000
li t0, 0xa13dd5cf
p.ff1 t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7a84
li t0, 0x5acf79fc
li t1, 0xa5308603
p.clb t4, t2
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7acbef9
li t3, 0x7acc000
li t0, 0x989a3fe
li t1, 0x550bfb1d
p.sletu t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc6080319
li t0, 0xa1084224
li t1, 0x832495f9
p.abs t4, t2
p.subuRN t5, t0, t1, 0x13
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5f06c59b
li t3, 0x5ff83264
li t0, 0xf9bba264
li t1, 0xf9b45d9b
xor t4, t2, t3
p.sletu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xac6c70e0
li t0, 0xfa2bb138
p.exthz t4, t2
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xcfef34aa
li t0, 0x1184500
li t1, 0x6fe718d5
p.abs t4, t2
p.subN t5, t0, t1, 0x7
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf2f4a286
li t3, 0xb2f4a680
li t0, 0xfa45a85f
p.adduRN t4, t2, t3, 0x7
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf4f5f
li t3, 0x457d478f
li t0, 0x3e7fafff
p.addRN t4, t2, t3, 0x1
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x406e022e
li t3, 0x2bf109d0
li t0, 0x6919d2f2
li t1, 0x1d96604f
p.subRN t4, t2, t3, 0x8
p.subuRN t5, t0, t1, 0xf
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6f802464
li t0, 0x147393dd
p.abs t4, t2
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xefb49248
li t0, 0x32c42a79
li t1, 0x7a3c6fb9
p.abs t4, t2
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2565d3a7
li t3, 0x25654b47
li t0, 0x10c21a
li t1, 0xd3ee2f1c
p.adduN t4, t2, t3, 0xb
remu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8c4986c7
li t3, 0xe77298e7
li t0, 0x52c3ab21
p.subN t4, t2, t3, 0x5
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x38c00110
li t3, 0x358044ba
li t0, 0xffff9c03
li t1, 0x3a7dc5e3
pv.cmple.h t4, t2, t3
div t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1ca11ce8
li t3, 0x1ca11cea
li t0, 0x69a9ce01
li t1, 0x9d3ee2e2
p.ror t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9f5c7974
li t3, 0x9f58a118
li t0, 0xd86101d
li t1, 0x2325fb8
sra t4, t2, t3
p.subRN t5, t0, t1, 0x10
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xdb29df3d
li t3, 0xbc436d9d
li t0, 0xb04363e3
li t1, 0x12c02721
sll t4, t2, t3
p.addN t5, t0, t1, 0xc
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6ca8518c
li t3, 0x6cfc37df
li t0, 0xdc673f7b
li t1, 0xdc27ff5b
and t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x90572806
li t3, 0x9969d1c7
li t0, 0xb32850ad
li t1, 0x4cd7af72
or t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6c
li t3, 0x43e453f2
li t0, 0x10000
li t1, 0x775eb7b6
or t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2d2217eb
li t0, 0x176bfed0
li t1, 0xff7901d0
p.exthz t4, t2
pv.cmpleu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xce0539b5
li t3, 0x6bf839ee
li t0, 0x6bf50e94
pv.cmpgeu.h t4, t2, t3
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf7fadfb5
li t0, 0x82fd761a
p.exths t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb49a0aaa
li t0, 0x2ab80000
p.cnt t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd5f9ff85
li t3, 0xe5d55e9e
li t0, 0xe0000000
div t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x19c0c055
li t3, 0xe63f3faa
li t0, 0x543f6df4
li t1, 0x543f6c98
p.clipr t4, t2, t3
pv.cmpleu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe48f240b
li t3, 0x42103a55
li t0, 0x2205be05
li t1, 0x6037dd26
and t4, t2, t3
p.subN t5, t0, t1, 0x6
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x87a39dfc
li t0, 0xa5cf19fe
li t1, 0xa5eaf620
p.abs t4, t2
p.sletu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xee8c9103
li t0, 0xf96889f
li t1, 0x52139da9
p.exths t4, t2
p.max t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x0
li t0, 0x82808f5a
li t1, 0xcdfb2a7c
p.ff1 t4, t2
and t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x0
li t3, 0x663d952c
li t0, 0x6c312bec
li t1, 0x6c312bfc
divu t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc95c3278
li t0, 0x80573d23
li t1, 0x4df269bb
p.clb t4, t2
p.subRN t5, t0, t1, 0x13
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x472dcb65
li t3, 0xf0dec088
li t0, 0x9f86df35
li t1, 0xf535c350
sll t4, t2, t3
sra t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc51a056d
li t3, 0xc51a056f
li t0, 0xaa374636
li t1, 0x1588cadf
p.ror t4, t2, t3
xor t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x710171cf
li t3, 0x8d5c34d5
li t0, 0xbe481d49
li t1, 0x21d0a398
p.subuRN t4, t2, t3, 0x8
sra t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xca66fbe6
li t3, 0xbea8586b
li t0, 0x2805908f
li t1, 0xbd03d18d
sra t4, t2, t3
p.adduN t5, t0, t1, 0x15
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc1732dfe
li t3, 0x1e522e3a
li t0, 0x29817f33
li t1, 0x44fb0896
rem t4, t2, t3
p.subN t5, t0, t1, 0x1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x19e4a716
li t3, 0x20c78193
li t0, 0x80006
sll t4, t2, t3
p.exthz t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4f11c7f3
li t3, 0xb0ee380c
li t0, 0xa94d208f
li t1, 0x56b2df70
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffffb77
li t0, 0xc2cc1968
li t1, 0x3d33c697
p.exthz t4, t2
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5cf07410
li t3, 0x9ddcba6a
li t0, 0x6e78e600
and t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffba87
li t0, 0x1450101c
p.clb t4, t2
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x20477eb2
li t0, 0x4e4e00ca
p.abs t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9a27423d
li t0, 0x36f07400
p.clb t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xff95ff1a
li t3, 0xde173c1
li t0, 0x3c000000
rem t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb74c5359
li t3, 0xe785d2f1
li t0, 0xfba639ac
li t1, 0xf3c2f97e
rem t4, t2, t3
p.minu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4f78d8bb
li t3, 0xb2bab05
li t0, 0x3faa9499
li t1, 0x1c4a0f5e
xor t4, t2, t3
p.addRN t5, t0, t1, 0x13
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x41e005a
li t3, 0x5a09bf0e
li t0, 0x2d8f6e8b
li t1, 0x47d0046e
p.subRN t4, t2, t3, 0xe
p.addRN t5, t0, t1, 0x4
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3bb6180
li t3, 0xb97e1b7f
li t0, 0x36a9c394
li t1, 0x21883630
p.subRN t4, t2, t3, 0x3
p.max t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4277594f
li t3, 0x4277595f
li t0, 0xc48d0884
li t1, 0xee9a6216
and t4, t2, t3
p.subuRN t5, t0, t1, 0x1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5e1c184
li t3, 0x6e7c586f
li t0, 0xbd33fbb7
li t1, 0x15bac85d
p.subRN t4, t2, t3, 0x2
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2f8386d
li t3, 0x170240b6
li t0, 0x415c5dd3
li t1, 0xadd6823
p.subuRN t4, t2, t3, 0x1e
xor t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x81e7d51
li t3, 0xc2a319b4
li t0, 0x5deb7de6
li t1, 0x379cd939
p.addRN t4, t2, t3, 0x7
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x55616a00
li t0, 0xb3a31e
p.ff1 t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x527eccd3
li t3, 0x1a260292
li t0, 0x21f1e4e9
li t1, 0x21d1c2dd
p.subN t4, t2, t3, 0x15
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6025f23a
li t3, 0x63d4616c
li t0, 0x7013bfb4
li t1, 0x54099db6
p.slet t4, t2, t3
p.addRN t5, t0, t1, 0x17
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1092e5d6
li t3, 0x666a27fd
li t0, 0x876b7d1a
li t1, 0x7d56a90
p.subuN t4, t2, t3, 0x17
p.addRN t5, t0, t1, 0x1d
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa1197d87
li t3, 0xa0b61c5b
li t0, 0x1d239009
li t1, 0xd89e0e7c
sll t4, t2, t3
p.subuRN t5, t0, t1, 0x16
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3791c9a5
li t3, 0x3dd2282
li t0, 0x3c9a5c64
li t1, 0xc14ed880
p.addRN t4, t2, t3, 0x9
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3361e86f
li t3, 0x1e883844
li t0, 0xc244a39e
li t1, 0x73f40e85
p.clipr t4, t2, t3
xor t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x95d46ee3
li t3, 0x6a2b911c
li t0, 0xd5b537b2
li t1, 0x9c3971a4
p.clipr t4, t2, t3
xor t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x825bf593
li t0, 0x3db61695
p.exths t4, t2
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x850dfac9
li t3, 0xc2ead602
li t0, 0x1200000
p.addN t4, t2, t3, 0x6
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xaa22536f
li t3, 0x160aadd5
li t0, 0x4132518
xor t4, t2, t3
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe3c2a024
li t3, 0x830556ea
li t0, 0x10be9f53
p.subN t4, t2, t3, 0xa
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x366402df
li t3, 0x478806a0
li t0, 0xffffffef
or t4, t2, t3
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa9d00000
li t0, 0xfbdc99d7
p.ff1 t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9d990208
li t3, 0x9d9969b8
li t0, 0xd4eb7fe3
li t1, 0x2b76fc55
p.clipr t4, t2, t3
remu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2cf2bfa8
li t3, 0x7031c070
li t0, 0xff398fd4
li t1, 0x4998b0b8
p.subRN t4, t2, t3, 0xa
rem t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x15078fd5
li t3, 0xa7d8244c
li t0, 0x26f90ca3
li t1, 0x6cc6410d
p.addRN t4, t2, t3, 0x1b
p.addRN t5, t0, t1, 0xc
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x105f9382
li t3, 0x7b002d7f
li t0, 0x767b1269
li t1, 0x896408ad
p.subRN t4, t2, t3, 0x3
p.subuRN t5, t0, t1, 0x0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2b38400f
li t3, 0x4f68c02f
li t0, 0xbb3c7f2c
li t1, 0xc8719682
p.addRN t4, t2, t3, 0x7
p.subRN t5, t0, t1, 0xb
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5b030371
li t3, 0x10492a16
li t0, 0x1a1219cf
li t1, 0x62c212f5
p.subN t4, t2, t3, 0xa
p.addRN t5, t0, t1, 0x4
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe6fb8ea8
li t3, 0x968e3dbb
li t0, 0x4a887c3e
p.addRN t4, t2, t3, 0x1
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x35443e5f
li t3, 0x5b91cb57
li t0, 0xe26e1d97
p.clipr t4, t2, t3
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5383aca
li t3, 0xfac7c535
li t0, 0x2acc9504
li t1, 0xacfa3fca
p.clipr t4, t2, t3
p.subN t5, t0, t1, 0x10
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x53e308db
li t3, 0x5077b334
li t0, 0x9b056614
li t1, 0xf26ce4f4
rem t4, t2, t3
sra t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x973846c
li t3, 0xa83bd918
li t0, 0x2914349
li t1, 0x2916349
div t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x54bac336
li t3, 0xd41ded8c
li t0, 0xc
pv.cmpgt.h t4, t2, t3
p.bneimm t0, 0xc, L247
L247 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x62d8611b
li t0, 0x8790c32
li t1, 0x9e2ebe0f
p.cnt t4, t2
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x852eb08d
li t3, 0xb5047b23
li t0, 0x1d125a9f
li t1, 0xdf091044
pv.cmpltu.h t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x34097192
li t3, 0xc0935789
li t0, 0xffffffff
p.subuN t4, t2, t3, 0x12
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3f7f5379
li t3, 0xc080ec86
li t0, 0x5922014c
li t1, 0xa6d5feb3
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7f4473a6
li t3, 0x9a8173a6
li t0, 0xa
pv.cmpge.h t4, t2, t3
p.bneimm t0, 0xa, L257
L257 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xed3c5a4b
li t0, 0x798daa1b
li t1, 0x798daa1b
p.exths t4, t2
xor t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9a52b053
li t3, 0x4ca1b04e
li t0, 0x1e15096c
li t1, 0x182ab754
pv.cmplt.h t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa00
li t0, 0xc028503d
li t1, 0x10bdc00d
p.cnt t4, t2
xor t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3fd7ffff
li t0, 0x83d16e83
li t1, 0xa925601d
p.cnt t4, t2
sra t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x80000
li t0, 0x17a99017
p.fl1 t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffffff
li t0, 0x2e4c0f7f
p.clb t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x301c14ab
li t3, 0x301c17b1
li t0, 0xc1227e87
li t1, 0x5798460c
p.sletu t4, t2, t3
remu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe0922e41
li t3, 0xabcf2304
li t0, 0xc6083077
li t1, 0x749d919a
p.ror t4, t2, t3
div t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x80000476
li t3, 0x41800375
li t0, 0xd
p.addRN t4, t2, t3, 0xe
p.bneimm t0, 0x7, L275
L275 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5c0f54db
li t3, 0x5c1754a8
li t0, 0xfffe2356
li t1, 0xefe833a0
pv.cmpleu.h t4, t2, t3
rem t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb9c4523c
li t3, 0x31cd636c
li t0, 0xf10137fa
li t1, 0x568f990f
p.addRN t4, t2, t3, 0x14
and t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x38801bf8
li t0, 0x453529ad
li t1, 0x429a18ac
p.abs t4, t2
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffc96aa8
li t3, 0xb4d86658
li t0, 0x1c35bc50
li t1, 0x72cf04ce
div t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6cc17df8
li t3, 0xc4d998d
li t0, 0x602199a8
p.adduN t4, t2, t3, 0x18
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4dc53078
li t3, 0x12782369
li t0, 0xa1618df3
p.ror t4, t2, t3
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4c043335
li t3, 0xeba999
li t0, 0xd65d80a0
li t1, 0xd52780a0
sll t4, t2, t3
pv.cmpleu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6a1b
li t3, 0x60016821
li t0, 0xd24fc8f6
li t1, 0xe75a63a3
p.addN t4, t2, t3, 0x1a
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7c31be1b
li t3, 0xe9d61989
li t0, 0xe4c17bbc
li t1, 0xe5f00203
p.adduN t4, t2, t3, 0x10
p.subRN t5, t0, t1, 0x14
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4dcf06aa
li t3, 0xb231f955
li t0, 0xc6c52baf
li t1, 0x393ad050
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4000
li t3, 0xea2ba4
li t0, 0xb2093ab1
li t1, 0xbdc01da
p.clipur t4, t2, t3
pv.cmpltu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3
li t0, 0x59049df8
li t1, 0x5dee002d
p.beqimm t2, 0x3, L298
L298 :
p.sletu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x218d0a45
li t3, 0x5fda0a45
li t0, 0xfffeffff
li t1, 0x25010200
pv.cmpgt.h t4, t2, t3
and t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x11140252
li t0, 0x29bff381
li t1, 0xcec7e717
p.cnt t4, t2
and t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffffffe
li t0, 0xc7a01ec1
li t1, 0xfaec3da4
p.clb t4, t2
p.maxu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2000
li t0, 0x30ffe864
p.ff1 t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffffffb
li t0, 0xf328ff93
li t1, 0x2df32651
p.clb t4, t2
rem t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffffffc
li t0, 0xd47c7d90
li t1, 0xd47c7e3e
p.clb t4, t2
p.slet t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x95b5ebcd
li t3, 0xd6f207a4
li t0, 0x409af1a2
li t1, 0xeb7e83dd
p.clipr t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xff529ff2
li t3, 0xe8330fc1
li t0, 0x21895ff9
li t1, 0xf61987fd
rem t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2004000
li t3, 0x4ade2fe8
li t0, 0x7cc4a7fc
li t1, 0x3a0cc3f0
p.subRN t4, t2, t3, 0x7
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xda94010
li t0, 0xad1db4fa
li t1, 0xc088afd3
p.abs t4, t2
p.adduRN t5, t0, t1, 0x0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x68da012f
li t3, 0xc0d6abb
li t0, 0x85f13dfe
li t1, 0x7dcb9944
p.subN t4, t2, t3, 0x1
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3880c378
li t3, 0x87755dc5
li t0, 0x42f89ebf
li t1, 0x1ee58ce2
pv.cmpltu.h t4, t2, t3
p.addRN t5, t0, t1, 0xa
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x12d4e1ff
li t3, 0x7efbee71
li t0, 0x1903b42f
p.addN t4, t2, t3, 0x5
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffdffff
li t0, 0x4000000d
li t1, 0x2fffffe6
p.clb t4, t2
p.subRN t5, t0, t1, 0x7
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffffff4
li t0, 0x384ed6c7
li t1, 0x335df831
p.clb t4, t2
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9f241862
li t3, 0xa0c4e22c
li t0, 0x9679ab0d
li t1, 0x9679ab0b
p.addRN t4, t2, t3, 0xa
pv.cmpgtu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3f918433
li t3, 0x5362f106
li t0, 0x6bb4381
li t1, 0xccd5be14
sll t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4fc846b9
li t3, 0xf9113899
li t0, 0x631989da
li t1, 0xe66adf1d
p.subRN t4, t2, t3, 0x10
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3157edab
li t3, 0xcea81a54
li t0, 0x5e6fdc2
li t1, 0x218df5b3
p.clipr t4, t2, t3
p.subuRN t5, t0, t1, 0x7
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4c5c3415
li t3, 0xb3a38bea
li t0, 0x82f776c1
li t1, 0x1086fad1
p.clipr t4, t2, t3
xor t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xcfc0719e
li t3, 0x303b8e61
li t0, 0x7f80c317
li t1, 0x7f0e2bbc
p.clipr t4, t2, t3
or t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x37fe7019
li t0, 0x9bff380c
li t1, 0xec7e717f
p.cnt t4, t2
pv.cmplt.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4d7fde07
li t0, 0x1a3
p.ff1 t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa6ffcc03
li t3, 0x3b1f9c5f
li t0, 0xffbfffff
p.slet t4, t2, t3
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1210793
li t0, 0xfbbc2f08
li t1, 0x7935ebb2
p.cnt t4, t2
div t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x0
li t0, 0x1ea60000
p.ff1 t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffbffff
li t0, 0xffffffda
li t1, 0x9513463a
p.clb t4, t2
rem t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4
li t0, 0xb36de33e
p.fl1 t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfdfac726
li t0, 0x59b6f1be
li t1, 0xdc713e3c
p.clb t4, t2
pv.cmpgeu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x55b8ef93
li t3, 0x55b8edfb
li t0, 0x6fa326cf
pv.cmpleu.h t4, t2, t3
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5d19367
li t3, 0xee29253d
li t0, 0xb58497a3
li t1, 0x157707eb
p.subN t4, t2, t3, 0x1c
pv.cmpltu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfafc4bd1
li t3, 0x82b382fd
li t0, 0x50906828
li t1, 0x50730f48
p.subN t4, t2, t3, 0x15
p.addRN t5, t0, t1, 0x9
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x164e5c0
li t0, 0x29003213
li t1, 0xebdf1126
p.abs t4, t2
p.addRN t5, t0, t1, 0x2
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd8c079c1
li t3, 0x91c679c1
li t0, 0x8e0e07f7
li t1, 0x8e0d5912
pv.cmpgtu.h t4, t2, t3
pv.cmple.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb9d7862
li t3, 0xba09cc89
li t0, 0x85ceba51
li t1, 0x5d04e240
sll t4, t2, t3
p.addRN t5, t0, t1, 0x8
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7433f282
li t3, 0xc655df87
li t0, 0xf9303445
li t1, 0x3850b5e8
p.subuRN t4, t2, t3, 0x4
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffa004
li t3, 0x2e74d223
li t0, 0xfe991a62
li t1, 0x9e27daf9
rem t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xee1f9e12
li t3, 0xe551be75
li t0, 0x80f7b119
sra t4, t2, t3
p.exthz t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x392a0e91
li t3, 0x2bdc2079
li t0, 0xc83ac88e
li t1, 0xc061842f
pv.cmpleu.h t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe44efc50
li t3, 0x9fb0286
li t0, 0x241d0006
li t1, 0x40360017
p.subRN t4, t2, t3, 0x9
p.addRN t5, t0, t1, 0x7
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe766cbad
li t3, 0x7178300e
li t0, 0xf60efe23
li t1, 0x3018710a
sll t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x42b021f7
li t3, 0x737adc06
li t0, 0xf9177900
p.subuRN t4, t2, t3, 0x1d
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4
li t3, 0xfcc83
li t0, 0x1b33c290
li t1, 0x3e6dcf26
p.clipur t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc3ae9977
li t3, 0x3cd16688
li t0, 0xea85af5c
li t1, 0xed5d31f7
p.clipr t4, t2, t3
p.slet t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xae73b032
li t3, 0x518c4ecd
li t0, 0x3b58813d
li t1, 0xc4877ec2
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x491d44df
li t3, 0x4262a78f
li t0, 0x9aba06c3
li t1, 0xe1c1ece3
p.sletu t4, t2, t3
p.minu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x21fb7e3f
li t3, 0xa9ad4251
li t0, 0xfffffbd7
p.sletu t4, t2, t3
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf785e10f
li t0, 0xbfacfce5
p.fl1 t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3bc2f087
li t3, 0x935ebb26
li t0, 0x9de17875
sll t4, t2, t3
p.exthz t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2
li t0, 0x8fd5afa9
li t1, 0xe4d7aec9
p.fl1 t4, t2
p.subuN t5, t0, t1, 0x4
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x200
li t0, 0x62edc8a5
li t1, 0x625aed9e
p.cnt t4, t2
p.sletu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2aabaf29
li t0, 0x100000
p.cnt t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xba56bec6
li t3, 0x3acc56f9
li t0, 0xffffecd3
p.adduRN t4, t2, t3, 0x11
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xff8692ce
li t3, 0x7f3cc6e2
li t0, 0x80c9182a
div t4, t2, t3
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfd0e84c2
li t0, 0x3b00fe08
p.fl1 t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3e88409f
li t3, 0xf63bde25
li t0, 0x9ed7365f
li t1, 0xfa90e71a
p.subuN t4, t2, t3, 0x1d
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xade6568e
li t3, 0x9f101e1a
li t0, 0xb8338599
li t1, 0xb811895f
p.ror t4, t2, t3
p.addRN t5, t0, t1, 0xf
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xbe1592cd
li t3, 0xbe1684af
li t0, 0xf55d07bc
li t1, 0x33b8ee5c
pv.cmpleu.h t4, t2, t3
p.subRN t5, t0, t1, 0xa
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe133cf6d
li t3, 0x9b9bc565
li t0, 0x99435e13
li t1, 0x7a868ab0
p.subuRN t4, t2, t3, 0x7
p.subuRN t5, t0, t1, 0x3
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7457a9d3
li t3, 0xbd854fc0
li t0, 0xcca1a709
li t1, 0xbd434d58
p.subRN t4, t2, t3, 0xd
p.subuRN t5, t0, t1, 0x15
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4cc24e53
li t3, 0x87a09daf
li t0, 0x43c28a27
li t1, 0xd643f52
p.ror t4, t2, t3
pv.cmpgtu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x776bd4d4
li t3, 0x31dba59c
li t0, 0xe186447e
li t1, 0x7274790a
p.ror t4, t2, t3
p.addN t5, t0, t1, 0x1e
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x60c3222f
li t3, 0x393a3c8d
li t0, 0xbe56307d
li t1, 0x43a9cf82
pv.cmpgt.h t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x38619117
li t3, 0xdc9d1e46
li t0, 0xf3af5b33
li t1, 0xc54a4dc
pv.cmple.h t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf13f8ca1
li t3, 0xec0635e
li t0, 0x6cf5a9e8
p.clipr t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd3e54519
li t3, 0x2c1ab2e6
li t0, 0x54971859
li t1, 0x28e43899
p.clipr t4, t2, t3
p.addRN t5, t0, t1, 0x19
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x400
li t3, 0x80f4687c
li t0, 0xc9140fda
p.clipur t4, t2, t3
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffc12080
li t0, 0x8f2d
p.clb t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x30c45ded
li t3, 0x1fd0d1ea
li t0, 0x3600c010
p.sletu t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1b2bb5eb
li t3, 0xcc5a2608
li t0, 0x6fdedbff
xor t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x60a1fe7e
li t0, 0xfffffff7
p.cnt t4, t2
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8bb72681
li t3, 0x896bb679
li t0, 0xffffffff
p.subN t4, t2, t3, 0xf
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffafaf
li t0, 0x44e92070
p.cnt t4, t2
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1740038
li t0, 0xb6505984
p.fl1 t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x10
li t0, 0xe3a00000
p.fl1 t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x20
li t0, 0x9
p.clb t4, t2
p.bneimm t0, 0x3, L451
L451 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd8f55913
li t3, 0xd8f55594
li t0, 0x84cdc3df
li t1, 0xde501729
pv.cmple.h t4, t2, t3
div t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4a73ff41
li t3, 0x45a5296
li t0, 0x5539ffa0
li t1, 0xb22d695b
p.addRN t4, t2, t3, 0x7
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1289c17f
li t3, 0x52676db6
li t0, 0xc944f0bf
li t1, 0xa93236d3
srl t4, t2, t3
p.adduRN t5, t0, t1, 0xf
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x48e3fd7e
li t3, 0x482861e3
li t0, 0x64a2785f
li t1, 0xd4991b69
p.addRN t4, t2, t3, 0x8
and t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa2b81607
li t3, 0x3f061231
li t0, 0xefe349d9
li t1, 0xe8d47cd7
p.addRN t4, t2, t3, 0xc
p.max t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7eb287f7
li t3, 0xbdcdf9ac
li t0, 0xc5c1b4ec
li t1, 0xc54bde19
p.subuRN t4, t2, t3, 0x3
p.subRN t5, t0, t1, 0x1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x93ac6eaa
li t3, 0x6ac4d2ee
li t0, 0xf1c4ff06
li t1, 0x24dd5ff8
sra t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x71c329fa
li t3, 0x3e10b077
li t0, 0xd7f3
pv.cmpge.h t4, t2, t3
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf48a52
li t3, 0x147a8139
li t0, 0x807a4529
li t1, 0xa3d409c
xor t4, t2, t3
rem t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xed564cc5
li t3, 0xa457b2ab
li t0, 0x32311366
li t1, 0x54311371
sll t4, t2, t3
pv.cmpge.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2b55c171
li t3, 0x58542d2a
li t0, 0x8
li t1, 0x142a77f5
p.addRN t4, t2, t3, 0xe
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xce6a3ec6
li t3, 0x31d5c139
li t0, 0x989c43d1
li t1, 0xe69a5f87
p.clipr t4, t2, t3
p.adduN t5, t0, t1, 0x16
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x476f1277
li t3, 0xb810ed88
li t0, 0x4000000
li t1, 0x7a5a8246
p.clipr t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa412f556
li t3, 0xa412f556
li t0, 0xf
div t4, t2, t3
p.beqimm t0, 0xf, L479
L479 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe513d17e
li t3, 0xf17da6b2
li t0, 0x3989e8bf
li t1, 0x393e9651
p.clipur t4, t2, t3
p.subuN t5, t0, t1, 0x7
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5bb15cd1
li t3, 0x5bb15ad8
li t0, 0x6e926728
li t1, 0xd1fd2cfa
pv.cmple.h t4, t2, t3
and t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc0a81578
li t3, 0x5b96c817
li t0, 0x2384
div t4, t2, t3
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe0547abc
li t3, 0x2dcb640b
li t0, 0xdfa4ffc2
p.adduRN t4, t2, t3, 0x0
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf02a3d5e
li t0, 0x200
p.fl1 t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x68ab7a68
li t0, 0xf84c9e1
li t1, 0x34f3eb3d
p.cnt t4, t2
div t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfefffff0
li t0, 0x1000000
p.clb t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb52c6a5b
li t0, 0xfffffc10
p.ff1 t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9adf00d7
li t3, 0xb0f99aff
li t0, 0x82667239
li t1, 0x919f3b1e
p.subRN t4, t2, t3, 0xc
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x0
li t3, 0xc8cd9d8a
li t0, 0xdf900d4e
li t1, 0xd8118b4
rem t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6fe806a6
li t3, 0x14408c5f
li t0, 0x13c2274a
li t1, 0xd4d7b9a2
p.adduRN t4, t2, t3, 0x7
p.subRN t5, t0, t1, 0xa
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x37e40353
li t3, 0x360460f
li t0, 0x890d1385
li t1, 0x681fd2a1
p.subRN t4, t2, t3, 0x1a
p.adduRN t5, t0, t1, 0x15
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfefb986b
li t0, 0x2d4657ab
li t1, 0x72b9a7c4
p.fl1 t4, t2
p.addRN t5, t0, t1, 0x9
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x95745af7
li t3, 0x9dcc2ccd
li t0, 0x4eaa2d79
li t1, 0xccf6166e
p.min t4, t2, t3
pv.cmpgt.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5d16567
li t3, 0x6c66c66
li t0, 0x4a15217f
li t1, 0xed64c48
p.min t4, t2, t3
p.subuRN t5, t0, t1, 0x2
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x37106a86
li t3, 0xdb3f08b9
li t0, 0xa52a42bd
p.ror t4, t2, t3
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1b856d47
li t3, 0x6d9f8452
li t0, 0xbd9cb29d
li t1, 0x8a02e129
p.subRN t4, t2, t3, 0x1
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x64696cff
li t3, 0x77d300c0
li t0, 0x31c7ca00
li t1, 0xacc6a7ff
p.subRN t4, t2, t3, 0x12
p.subuN t5, t0, t1, 0x1b
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xda1f9d9d
li t3, 0xfd74095e
li t0, 0x88e3e546
li t1, 0x46635377
p.ror t4, t2, t3
p.minu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb1148449
li t3, 0x5eeb7bb6
li t0, 0xcc71f2a3
li t1, 0x2b31a9bb
p.clipr t4, t2, t3
pv.cmpgt.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8cae642a
li t3, 0x73559bd5
li t0, 0x6638f951
li t1, 0x9598d4dd
p.clipr t4, t2, t3
pv.cmple.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x10ae61a8
li t3, 0xef519e17
li t0, 0x544dd95a
li t1, 0x2bb226a5
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9d902025
li t3, 0x626edfda
li t0, 0x540a0d09
p.clipr t4, t2, t3
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd7d6f96d
li t3, 0x11e6707b
li t0, 0x452c3146
xor t4, t2, t3
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8360a6ff
li t0, 0x7e42bf93
p.exths t4, t2
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffffe96
li t0, 0xc439b940
p.clb t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf0993c26
li t3, 0x9e7d67bc
li t0, 0x20000
rem t4, t2, t3
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4a035dfd
li t3, 0x4f3eb3de
li t0, 0x155e29ff
p.subuN t4, t2, t3, 0x16
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xbc264f09
li t0, 0x10000
p.clb t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xde132784
li t3, 0xd3cfacf7
li t0, 0xfffeffff
p.slet t4, t2, t3
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc5df9652
li t3, 0xdaa24a80
li t0, 0x1
pv.cmpgeu.h t4, t2, t3
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfeefcb29
li t3, 0x6d512540
li t0, 0x1000
div t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x24a873c6
li t3, 0x6c0ad820
li t0, 0x8
p.addRN t4, t2, t3, 0x11
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5f8bafb1
li t3, 0xeca72690
li t0, 0xffffff9b
p.sletu t4, t2, t3
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x67d3e18a
li t3, 0x2cb151c8
li t0, 0x350d20c5
li t1, 0x1678ecec
p.subRN t4, t2, t3, 0xa
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8dac8318
li t3, 0x28cf1e7d
li t0, 0xd904ebef
li t1, 0x6762e2de
pv.cmplt.h t4, t2, t3
p.subRN t5, t0, t1, 0x8
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2e666f80
li t3, 0x93786307
li t0, 0xec827df7
p.adduRN t4, t2, t3, 0x7
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5738d1a9
li t3, 0x1b221db
li t0, 0xd830d424
li t1, 0x467fe8de
p.adduRN t4, t2, t3, 0x1f
p.subRN t5, t0, t1, 0x0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9810c566
li t3, 0x5b1f309b
li t0, 0x482156ee
li t1, 0x75f70c51
p.adduRN t4, t2, t3, 0x1c
p.subRN t5, t0, t1, 0x17
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9fd0ab77
li t3, 0x20c38624
li t0, 0x62dba653
li t1, 0x4c618666
sll t4, t2, t3
divu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9cdde94b
li t3, 0xf2d43b28
li t0, 0x306dd329
srl t4, t2, t3
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf32e2ca1
li t3, 0xf2693597
li t0, 0xdd697fc6
li t1, 0x9bb2b18
pv.cmple.h t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffffd1
li t3, 0xde7fdf0c
li t0, 0x59e4dfac
li t1, 0x2db1e358
div t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd5b594d8
li t3, 0xef37ef86
li t0, 0xe5afdf80
li t1, 0x1a58207f
p.min t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6ad8ca6c
li t3, 0x779df7c3
li t0, 0xd583a915
li t1, 0x2a7e56ea
pv.cmpgt.h t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x376d6736
li t3, 0x3bcffbe1
li t0, 0x367e6062
li t1, 0xc9819d9d
sra t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1ab6b2bb
li t3, 0x1de7fdf0
li t0, 0x14e02853
li t1, 0xeb1fd78c
p.max t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x200000
li t3, 0xdf7720
li t0, 0xa19df1dd
p.clipur t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x0
li t0, 0x9510ffbc
li t1, 0x62e702de
p.clb t4, t2
rem t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc2710000
li t0, 0x4e88b75e
li t1, 0x3173816f
p.ff1 t4, t2
pv.cmpgeu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfbf8ff02
li t0, 0x609bcdfd
p.clb t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x80b900f9
li t0, 0x304de6fe
li t1, 0xe10dc51b
p.fl1 t4, t2
xor t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffffffd
li t0, 0x5df9652f
p.clb t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x80000000
li t0, 0x2efcb296
li t1, 0xd5125406
p.ff1 t4, t2
p.adduRN t5, t0, t1, 0x1b
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffefffff
li t0, 0x177e514b
p.clb t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x800
li t0, 0x8b3f2ca5
li t1, 0xb5449501
p.ff1 t4, t2
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x100
li t0, 0xefe27bef
p.ff1 t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x45a35c27
li t0, 0x80
p.cnt t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa997165d
li t3, 0xd07d1ccb
li t0, 0x5cf80000
div t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9f8c4360
li t3, 0xa848d439
li t0, 0xc48021fe
li t1, 0x14495040
p.addRN t4, t2, t3, 0x9
p.subuN t5, t0, t1, 0x14
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe240faff
li t3, 0xa242920
li t0, 0x3a66e831
li t1, 0xc576064c
p.subRN t4, t2, t3, 0x13
p.addRN t5, t0, t1, 0xe
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x15df1482
li t3, 0xf139897f
li t0, 0x80014ea3
li t1, 0xfffe4408
p.adduRN t4, t2, t3, 0x18
p.subRN t5, t0, t1, 0x4
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4aef8a21
li t3, 0x1894c4e7
li t0, 0x2a14a770
li t1, 0x2a1b2217
p.subuRN t4, t2, t3, 0x13
pv.cmple.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x0
li t0, 0x6
p.bneimm t2, 0x2, L606
L606 :
p.bneimm t0, 0x5, L607
L607 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1e790f0f
li t0, 0x27b8752d
li t1, 0x4345cfef
p.abs t4, t2
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x955ad2f6
li t3, 0xde4329b
li t0, 0x132c0a96
li t1, 0xa14ec7f7
p.adduRN t4, t2, t3, 0x1f
p.addRN t5, t0, t1, 0x11
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9e662052
li t3, 0xb0661f37
li t0, 0xc1545e83
p.subRN t4, t2, t3, 0xa
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffff7c
li t0, 0xebec971f
li t1, 0x449442d
p.clb t4, t2
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7daa7cab
li t3, 0xbd077e90
li t0, 0x76b0f3c9
li t1, 0xc240384e
p.ror t4, t2, t3
pv.cmpgtu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xed60d1f4
li t3, 0x129f2f0b
li t0, 0x5fac3cf2
li t1, 0x50902e11
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x36d4b363
li t3, 0xe92b4c9c
li t0, 0x3fd61e79
li t1, 0x38481708
p.clipr t4, t2, t3
pv.cmpgeu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf329257d
li t3, 0x4cd6da82
li t0, 0x9feb8f3c
li t1, 0x9c248b84
p.clipr t4, t2, t3
srl t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x59393457
li t3, 0xa6c64ba8
li t0, 0x44b33fd4
li t1, 0xe761f9e
p.clipr t4, t2, t3
p.addN t5, t0, t1, 0x1b
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc0dfe333
li t3, 0x3f201cc8
li t0, 0xa91f27a6
li t1, 0x475f1593
p.clipr t4, t2, t3
p.slet t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1000
li t3, 0x522c4db6
li t0, 0xdfc92b9d
p.clipur t4, t2, t3
p.exthz t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xefee95ce
li t3, 0xb1eec84a
li t0, 0xe
pv.cmple.h t4, t2, t3
p.beqimm t0, 0x5, L631
L631 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xbcb4f2a9
li t3, 0x5896fe79
li t0, 0xf04611e8
pv.cmpge.h t4, t2, t3
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfe5a7954
li t0, 0x43c
p.clb t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xae800000
li t0, 0x5a35c272
li t1, 0x320d2e1
p.ff1 t4, t2
pv.cmple.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffdfffff
li t0, 0x4000
p.clb t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x168d701c
li t3, 0x80c834b8
li t0, 0xb400f780
and t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2e4119
li t0, 0xfff7ffff
p.fl1 t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8977208c
li t3, 0xfda22144
li t0, 0xfffffff7
or t4, t2, t3
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x20cbfaa3
li t3, 0x20cbfde1
li t0, 0x6
pv.cmpleu.h t4, t2, t3
p.beqimm t0, 0xc, L647
L647 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x340c15c2
li t3, 0xe7833752
li t0, 0xda060ae1
li t1, 0x73c19ba6
p.ror t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfbf6a234
li t3, 0xa95247ac
li t0, 0x84a51cf3
li t1, 0x54e34e47
pv.cmpleu.h t4, t2, t3
p.addRN t5, t0, t1, 0x1b
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xcd151003
li t3, 0xaaed615f
li t0, 0x68793905
li t1, 0xaaad36a2
p.subuRN t4, t2, t3, 0x4
p.subuRN t5, t0, t1, 0x8
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe68aa801
li t3, 0xd5f6d0af
li t0, 0x5f7c9c82
li t1, 0xa0969b51
p.subuRN t4, t2, t3, 0x6
p.subRN t5, t0, t1, 0x8
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf3454400
li t3, 0xeafb5857
li t0, 0xcb00e319
li t1, 0x8e3deea2
p.sletu t4, t2, t3
p.subuRN t5, t0, t1, 0x14
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7274a0d7
li t3, 0x63b99f7f
li t0, 0x57483095
li t1, 0x3c583558
p.subRN t4, t2, t3, 0xf
pv.cmpge.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8e11ff52
li t3, 0x1f000aab
li t0, 0x535e269e
li t1, 0x532937fb
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xce97e75a
li t3, 0xd8cee75d
li t0, 0x5b205256
li t1, 0x7e50d976
pv.cmplt.h t4, t2, t3
p.addN t5, t0, t1, 0x1a
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x88584556
li t3, 0x229bb55a
li t0, 0x1f7ee832
p.ror t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x80
li t3, 0x17914b20
li t0, 0x77ce6612
li t1, 0x893199ed
p.clipur t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x18dd298e
li t3, 0xe732d671
li t0, 0xe3efdd06
li t1, 0x720d85c6
p.clipr t4, t2, t3
p.adduRN t5, t0, t1, 0x3
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5956a4f4
li t3, 0x86a95b0b
li t0, 0x10000000
li t1, 0x617914b2
p.clipr t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8215b658
li t3, 0x6fc723f8
li t0, 0x74726bd2
p.adduN t4, t2, t3, 0x18
p.exths t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb1c0c03
li t3, 0x1d17ab33
li t0, 0x65400000
pv.cmpleu.h t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x858e0601
li t3, 0x8e8bd599
li t0, 0x2d1001b
pv.cmpgeu.h t4, t2, t3
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x40000000
li t0, 0x3810a10c
li t1, 0x9e00d422
p.ff1 t4, t2
p.addRN t5, t0, t1, 0x12
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x40000
li t0, 0x2ee4019f
li t1, 0xb4442898
p.fl1 t4, t2
p.subuN t5, t0, t1, 0x9
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x17c0
li t0, 0x23e0
p.fl1 t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffd90467
li t0, 0x8f0
p.clb t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x65dc8a33
li t0, 0xfffff778
p.exths t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd29203a9
li t3, 0x6b424d04
li t0, 0x8000000
sra t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6d4901d4
li t3, 0xb5a12682
li t0, 0xcd603ccf
li t1, 0x62576093
remu t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffe343
li t3, 0x3192de45
li t0, 0x2c894200
div t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe66b5157
li t3, 0x8943ee12
li t0, 0xa9a7ab02
li t1, 0x2fe31a01
sll t4, t2, t3
p.addRN t5, t0, t1, 0x1f
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x54d31590
li t0, 0x546c974f
li t1, 0x9b6cdf41
p.abs t4, t2
p.addRN t5, t0, t1, 0x1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x70fbe96b
li t3, 0xe0baa384
li t0, 0x257d8cd9
li t1, 0x257c8cda
p.ror t4, t2, t3
pv.cmpleu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x387df474
li t3, 0xf05d5142
li t0, 0x9835d119
li t1, 0xc3dd7f58
p.adduRN t4, t2, t3, 0x8
p.subRN t5, t0, t1, 0x5
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9c3efa5a
li t3, 0x782ea8e1
li t0, 0xcd38e88e
li t1, 0xe1c6bfa1
div t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x148d7e84
li t3, 0x57551974
li t0, 0xfcdf0dd8
li t1, 0xba4d9efc
div t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd0d4bceb
li t3, 0x40e8c1bc
li t0, 0x14e78bbf
li t1, 0xeb187442
pv.cmple.h t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7b528ee0
li t3, 0x84ad751f
li t0, 0xeea72c83
p.clipr t4, t2, t3
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x57819013
li t3, 0xa87e6ffc
li t0, 0x5084bd67
li t1, 0xaf7b42d8
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa33bc88d
li t3, 0x879c525e
li t0, 0xc467f8e0
li t1, 0x3998071f
p.subN t4, t2, t3, 0x1a
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x950744b8
li t3, 0x6af8bb47
li t0, 0x507f3f7
p.clipr t4, t2, t3
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x800000
li t3, 0x71081cf1
li t0, 0x100
li t1, 0x78a40e78
p.clipur t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x141fcfd
li t0, 0x9ac07c96
li t1, 0x160e2e25
p.exthz t4, t2
pv.cmpgeu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x43720000
li t0, 0x1ff33de2
li t1, 0x60455a16
p.ff1 t4, t2
pv.cmpltu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf7bfff87
li t0, 0x516b9d58
li t1, 0x5b61e00f
p.clb t4, t2
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x83bff001
li t0, 0xcec8e4bf
li t1, 0x7d9a7507
p.ff1 t4, t2
srl t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x40
li t0, 0xe764727f
li t1, 0xbecd3a83
p.fl1 t4, t2
p.adduN t5, t0, t1, 0x14
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x10000000
li t0, 0x6
p.ff1 t4, t2
p.bneimm t0, 0x5, L729
L729 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6799ec
li t0, 0x54901d4b
p.fl1 t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3603ccf4
li t0, 0x2a480ea5
li t1, 0xad093411
p.fl1 t4, t2
p.subuN t5, t0, t1, 0x8
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6b01e67b
li t0, 0xb1240752
li t1, 0xd6849a08
p.fl1 t4, t2
pv.cmpgtu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x780f33d
li t0, 0x95f92c41
li t1, 0xbd7b1162
p.fl1 t4, t2
p.subuN t5, t0, t1, 0x6
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x725b9
li t0, 0x8afc9620
li t1, 0xdebd88b0
p.clb t4, t2
and t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2dba9fe9
li t3, 0x5569fbff
li t0, 0x32463b5
li t1, 0x1749ec9d
p.addN t4, t2, t3, 0x10
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x919231da
li t3, 0xaba7f64e
li t0, 0x1625c628
li t1, 0x3dfced5e
p.subRN t4, t2, t3, 0x4
p.addRN t5, t0, t1, 0xd
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x553034ac
li t3, 0xf8acea45
li t0, 0x110dc6ad
li t1, 0x110adb40
p.maxu t4, t2, t3
p.slet t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xaa981a56
li t3, 0x7c547522
li t0, 0xa05a90b5
li t1, 0x45a895f9
pv.cmpgtu.h t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1f6c2a09
li t3, 0x7a7d0d9a
li t0, 0xd02d485a
li t1, 0xa0d44afc
p.ror t4, t2, t3
pv.cmpleu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x592c4e8c
li t3, 0x592c4e8c
li t0, 0x7def886c
li t1, 0xed15341c
pv.cmpgeu.h t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xbf172f3b
li t3, 0x44cbee88
li t0, 0xab0ee837
li t1, 0xcbf38b6c
p.subRN t4, t2, t3, 0x8
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x40
li t3, 0x7b375aab
li t0, 0xd587743b
li t1, 0xe5f9c5b2
p.clipur t4, t2, t3
pv.cmpgeu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5c6078b6
li t3, 0xa39f874d
li t0, 0x7f3a965c
li t1, 0x4f87d3b9
p.clipr t4, t2, t3
p.adduRN t5, t0, t1, 0x1b
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x102c6d81
li t3, 0xefd3b27e
li t0, 0xb6a85564
li t1, 0x4957aa8b
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2000
li t3, 0xb9f7533e
li t0, 0x90e2e8aa
li t1, 0xea3667a4
p.clipur t4, t2, t3
srl t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x70057643
li t0, 0xc8717455
li t1, 0x751f33d2
p.exths t4, t2
p.max t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1
li t0, 0xffff7590
p.bneimm t2, 0x8, L764
L764 :
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb21c5d15
li t3, 0x5d46ccf4
li t0, 0xee00ae20
pv.cmple.h t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xff005764
li t0, 0xb95e3b04
li t1, 0xea2aa25f
p.clb t4, t2
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x60b
li t0, 0xc94631c3
li t1, 0xc86e444d
p.clb t4, t2
remu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x25dbbc
li t3, 0x25da49
li t0, 0x606974e7
li t1, 0x60693ecb
p.slet t4, t2, t3
p.sletu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x29ae0000
li t0, 0x94d7d0b4
li t1, 0xd5940e99
p.ff1 t4, t2
pv.cmpleu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xafc9623f
li t3, 0xebd88b36
li t0, 0x2bf25883
li t1, 0x7af602c5
p.addRN t4, t2, t3, 0x2
p.addRN t5, t0, t1, 0xd
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xef742d4c
li t3, 0x57319628
li t0, 0x94a92601
li t1, 0x42fdf217
p.subuRN t4, t2, t3, 0x14
sra t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe
li t0, 0xd3662215
li t1, 0xd5b7220e
p.bneimm t2, 0xf, L780
L780 :
pv.cmpleu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xeef2393f
li t3, 0x160b104f
li t0, 0xbbb327ba
li t1, 0xf6dba169
p.addRN t4, t2, t3, 0xf
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x980d31cb
li t3, 0xdc341dcb
li t0, 0x3d0e268c
li t1, 0xc2f1db73
p.min t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x96f3360a
li t3, 0x692cc9f5
li t0, 0xc9776126
li t1, 0xa03c801e
p.clipr t4, t2, t3
p.sletu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa99e1998
li t3, 0x5661f667
li t0, 0x8eecda4e
li t1, 0x711325b1
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf25dd849
li t3, 0xa80f2407
li t0, 0xa852b76d
li t1, 0x17ad4892
div t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x165ac170
li t3, 0x873605ef
li t0, 0x1aa7c49f
li t1, 0xe1583b60
pv.cmpgeu.h t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x64514dec
li t3, 0x16aa951b
li t0, 0x80000
li t1, 0x7bb0cb3a
p.clipr t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x76627e2f
li t3, 0x529b32aa
li t0, 0x491f6353
li t1, 0x481f9253
p.ror t4, t2, t3
pv.cmplt.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3b313f17
li t3, 0xa94d9955
li t0, 0x18740000
p.minu t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6e008202
li t0, 0x5202743b
li t1, 0x96fa3a4f
p.ff1 t4, t2
or t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffffdf
li t0, 0x1b013a1d
li t1, 0x1b7d1d27
p.clb t4, t2
p.addRN t5, t0, t1, 0x1d
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb5809d0e
li t3, 0xe5be8e93
li t0, 0x7
p.subuN t4, t2, t3, 0x3
p.bneimm t0, 0x9, L805
L805 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xed602743
li t3, 0xb96fa3a4
li t0, 0x99c43ef5
li t1, 0x8b86463e
p.slet t4, t2, t3
p.min t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa396322e
li t3, 0x92f2b4f3
li t0, 0x235f9a21
li t1, 0x4f2466ca
p.subuN t4, t2, t3, 0x11
p.subuRN t5, t0, t1, 0x1b
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x60dbe044
li t3, 0x90a7a489
li t0, 0x49f022
li t1, 0xfeedd244
sll t4, t2, t3
p.subuRN t5, t0, t1, 0xe
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf742d545
li t0, 0x73a162a2
li t1, 0xb98cbb63
p.exths t4, t2
pv.cmpgeu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xbdd0b551
li t3, 0x5cc65fb3
li t0, 0x8aff6242
li t1, 0x1f428283
p.subuRN t4, t2, t3, 0x3
p.subRN t5, t0, t1, 0x4
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xdee85aa8
li t3, 0xae632fd9
li t0, 0x4579b12e
li t1, 0x6fab4148
p.subuRN t4, t2, t3, 0x11
p.subuRN t5, t0, t1, 0x11
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x57afc7ca
li t3, 0xe95cc0bf
li t0, 0xb4811d71
li t1, 0xc4185aac
p.addRN t4, t2, t3, 0x3
p.adduRN t5, t0, t1, 0x14
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2bd7e3e5
li t3, 0x74ae605e
li t0, 0x5a42beb9
li t1, 0xe21c3d56
p.adduRN t4, t2, t3, 0x1
p.addRN t5, t0, t1, 0x16
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x42443638
li t3, 0x530bf090
li t0, 0xf68ddcd6
pv.cmpltu.h t4, t2, t3
p.cnt t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf857ec25
li t3, 0x1ea3481f
li t0, 0x2ce929a1
li t1, 0x89305cc4
p.clipr t4, t2, t3
p.adduRN t5, t0, t1, 0x16
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xaecf56
li t3, 0xcb69d4d2
li t0, 0x167494d1
li t1, 0xc4982e62
p.subRN t4, t2, t3, 0x2
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe707bc54
li t3, 0x18f843aa
li t0, 0xd8958da2
li t1, 0x8b10d78e
p.clipr t4, t2, t3
sll t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe5e2d524
li t3, 0x1e1d2adb
li t0, 0xee4ac651
li t1, 0x45886b47
p.clipr t4, t2, t3
p.maxu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb192ccd4
li t3, 0x4e6d33ab
li t0, 0xa08aa4a2
li t1, 0x4b98f5dc
p.clipr t4, t2, t3
p.subRN t5, t0, t1, 0x1b
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb4cff331
li t3, 0x4b300c4e
li t0, 0x44e50dca
li t1, 0xbb0af235
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x4822a928
li t3, 0x92e63d57
li t0, 0x20000000
li t1, 0x44603e7a
p.sletu t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xe3ae935e
li t3, 0xa02fde14
li t0, 0x100000
li t1, 0x76486591
p.clipur t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa6708e65
li t0, 0x2
li t1, 0xbf3c4864
p.exthz t4, t2
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd38a4732
li t3, 0xdc8a97da
li t0, 0x0
p.subuRN t4, t2, t3, 0x18
p.bneimm t0, 0x2, L843
L843 :
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8809b04
li t0, 0xb8233ede
li t1, 0x89f426b
p.ff1 t4, t2
p.adduRN t5, t0, t1, 0xc
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb0dbf0df
li t3, 0xbedbb081
li t0, 0xbbe58a5
li t1, 0xed13618a
p.addRN t4, t2, t3, 0xd
div t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xafa3c51e
li t3, 0xafa4aaec
li t0, 0x69fbe28f
li t1, 0x69f95576
p.slet t4, t2, t3
p.sletu t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x42ef9629
li t3, 0x7b44d862
li t0, 0xc99cf8a7
li t1, 0x476b555d
p.addRN t4, t2, t3, 0x10
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb856dd4d
li t0, 0x57745cdf
li t1, 0x5e492d53
p.abs t4, t2
p.adduRN t5, t0, t1, 0x0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8b84e96c
li t3, 0x6c7f160c
li t0, 0x1e7f531f
li t1, 0x6b1cec1a
p.subuN t4, t2, t3, 0xd
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xfffffffe
li t3, 0x363fdb06
li t0, 0xcf9fa98f
li t1, 0xb58e7607
div t4, t2, t3
p.ror t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb54eed91
li t3, 0xf2432d3c
li t0, 0x7afc7cae
li t1, 0x15cc0bf0
pv.cmple.h t4, t2, t3
pv.cmpleu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf59dc143
li t3, 0x8a623ebc
li t0, 0xf1f2b
li t1, 0xa57302fc
p.clipr t4, t2, t3
div t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xd035f5c7
li t3, 0x10e1eaba
li t0, 0xaf5fef95
li t1, 0xd2b9017e
p.ror t4, t2, t3
p.addN t5, t0, t1, 0x6
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x690afae3
li t3, 0x8870f55d
li t0, 0x983da220
li t1, 0x1d95fa3a
p.ror t4, t2, t3
p.max t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x1
li t3, 0xe6238d3a
li t0, 0x20
li t1, 0xf311469d
p.clipur t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x3e32caa9
li t3, 0x5af084b4
li t0, 0x10
li t1, 0x1f2b6e64
p.slet t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8724c775
li t3, 0xb0edb860
li t0, 0x96d130d
li t1, 0xfe92ecf2
p.minu t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xf24f80be
li t3, 0xdb07f49
li t0, 0x8219840e
li t1, 0x7da67bf1
p.clipr t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x7
li t0, 0x9620fcd2
li t1, 0x69dd032d
p.beqimm t2, 0x8, L874
L874 :
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x76b292b
li t3, 0xf67699dc
li t0, 0x6e52cdb0
li t1, 0x91ad3247
p.slet t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9b8836b0
li t3, 0xe6aeb6d4
li t0, 0x40000000
li t1, 0x8a86e777
p.minu t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xc5c41b58
li t3, 0x73575b6a
li t0, 0x8000000
li t1, 0x754373bb
pv.cmpgt.h t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x66e20dac
li t3, 0x39abadb5
li t0, 0x1000000
li t1, 0x72a1b9dd
pv.cmple.h t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xa94ca4f7
li t3, 0x1402ce0
li t0, 0x2000000
li t1, 0x5d7351d4
p.min t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x800
li t3, 0x299a25d0
li t0, 0x400000
li t1, 0x148d12e8
p.clipur t4, t2, t3
p.clipur t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x8000
li t3, 0xac45044e
li t0, 0x15adaf1b
p.clipur t4, t2, t3
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x20000
li t3, 0x56208227
li t0, 0x92eb75ac
li t1, 0xf323da70
p.clipur t4, t2, t3
pv.cmpgtu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x40000
li t3, 0x4d32cc29
li t0, 0x514818f7
li t1, 0x64041702
p.clipur t4, t2, t3
p.clipr t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x200
li t3, 0x40baf92e
li t0, 0x130cdcd
li t1, 0x70dd7593
p.clipur t4, t2, t3
pv.cmplt.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x9452063d
li t3, 0xd90105c0
li t0, 0xb866e6
and t4, t2, t3
p.exthz t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x6514818f
li t3, 0x76404170
li t0, 0x2ab7e2e6
li t1, 0xa6b5da82
sll t4, t2, t3
pv.cmpltu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x5452b207
li t3, 0xb2265a63
li t0, 0x8d665352
li t1, 0x4ecf177b
or t4, t2, t3
p.max t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffda9b
li t0, 0x4d96
p.clb t4, t2
p.fl1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xb7cf0061
li t0, 0x21b
p.clb t4, t2
p.clb t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x85bedbe
li t0, 0xc1cd1108
p.fl1 t4, t2
p.abs t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x200000
li t0, 0x60f688c4
li t1, 0x7657e8eb
p.fl1 t4, t2
pv.cmpge.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0xffffffbf
li t0, 0x307b4442
li t1, 0x3b2bf475
p.clb t4, t2
pv.cmpleu.h t5, t0, t1
sw t4, 4(sp)
sw t5, 8(sp)

li t2, 0x2000000
li t0, 0x4000000
p.ff1 t4, t2
p.ff1 t5, t0
sw t4, 4(sp)
sw t5, 8(sp)

