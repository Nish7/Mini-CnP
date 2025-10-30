	.build_version macos, 13, 0
	.file	1 "/opt/homebrew/Cellar/zig/0.15.1/lib/zig/std" "builtin.zig"
	.file	2 "/Users/nish7/.cache/zig/b/6ce966b706a7b83a244e965908a79799" "builtin.zig"
	.file	3 "/opt/homebrew/Cellar/zig/0.15.1/lib/zig/std" "start.zig"
	.file	4 "/Users/nish7/Code/mini-CnP/src" "stencils.zig"
	.file	5 "/opt/homebrew/Cellar/zig/0.15.1/lib/zig/std" "Target.zig"
	.file	6 "/opt/homebrew/Cellar/zig/0.15.1/lib/zig/std/Target" "aarch64.zig"
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_push_const_stencil
	.p2align	2
_push_const_stencil:
Lfunc_begin0:
	.loc	4 17 0
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp0:
	.loc	4 21 5 prologue_end
Lloh0:
	adrp	x8, _hole_slot@PAGE
Lloh1:
	ldr	x8, [x8, _hole_slot@PAGEOFF]
Ltmp1:
	.loc	4 22 18
	ldr	x9, [x0, #2048]
	.loc	4 22 14 is_stmt 0
	str	x8, [x0, x9, lsl #3]
	.loc	4 23 8 is_stmt 1
	ldr	x8, [x0, #2048]
Ltmp2:
	.loc	4 23 12 is_stmt 0
	add	x8, x8, #1
	str	x8, [x0, #2048]
	.cfi_def_cfa wsp, 16
	.loc	4 23 12 epilogue_begin
	ldp	x29, x30, [sp], #16
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
Ltmp3:
	.loh AdrpLdr	Lloh0, Lloh1
Lfunc_end0:
	.cfi_endproc

	.globl	_add_stencil
	.p2align	2
_add_stencil:
Lfunc_begin1:
	.loc	4 26 0 is_stmt 1
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp4:
	.loc	4 29 8 prologue_end
	ldr	x8, [x0, #2048]
	.loc	4 29 12 is_stmt 0
	sub	x9, x8, #1
	str	x9, [x0, #2048]
	.loc	4 30 24 is_stmt 1
	ldr	x9, [x0, x9, lsl #3]
Ltmp5:
	.loc	4 31 12
	sub	x8, x8, #2
	str	x8, [x0, #2048]
	.loc	4 32 24
	ldr	x10, [x0, x8, lsl #3]
Ltmp6:
	.loc	4 33 27
	add	x9, x10, x9
Ltmp7:
	str	x9, [x0, x8, lsl #3]
	.loc	4 34 8
	ldr	x8, [x0, #2048]
	.loc	4 34 12 is_stmt 0
	add	x8, x8, #1
	str	x8, [x0, #2048]
	.cfi_def_cfa wsp, 16
	.loc	4 34 12 epilogue_begin
	ldp	x29, x30, [sp], #16
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
Ltmp8:
Lfunc_end1:
	.cfi_endproc

	.globl	_sub_stencil
	.p2align	2
_sub_stencil:
Lfunc_begin2:
	.loc	4 37 0 is_stmt 1
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp9:
	.loc	4 38 8 prologue_end
	ldr	x8, [x0, #2048]
	.loc	4 38 12 is_stmt 0
	sub	x9, x8, #1
	str	x9, [x0, #2048]
	.loc	4 39 24 is_stmt 1
	ldr	x9, [x0, x9, lsl #3]
Ltmp10:
	.loc	4 40 12
	sub	x8, x8, #2
	str	x8, [x0, #2048]
	.loc	4 41 24
	ldr	x10, [x0, x8, lsl #3]
Ltmp11:
	.loc	4 42 27
	sub	x9, x10, x9
Ltmp12:
	str	x9, [x0, x8, lsl #3]
	.loc	4 43 8
	ldr	x8, [x0, #2048]
	.loc	4 43 12 is_stmt 0
	add	x8, x8, #1
	str	x8, [x0, #2048]
	.cfi_def_cfa wsp, 16
	.loc	4 43 12 epilogue_begin
	ldp	x29, x30, [sp], #16
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
Ltmp13:
Lfunc_end2:
	.cfi_endproc

	.globl	_mul_stencil
	.p2align	2
_mul_stencil:
Lfunc_begin3:
	.loc	4 46 0 is_stmt 1
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp14:
	.loc	4 47 8 prologue_end
	ldr	x8, [x0, #2048]
	.loc	4 47 12 is_stmt 0
	sub	x9, x8, #1
	str	x9, [x0, #2048]
	.loc	4 48 24 is_stmt 1
	ldr	x9, [x0, x9, lsl #3]
Ltmp15:
	.loc	4 49 12
	sub	x8, x8, #2
	str	x8, [x0, #2048]
	.loc	4 50 24
	ldr	x10, [x0, x8, lsl #3]
Ltmp16:
	.loc	4 51 27
	mul	x9, x10, x9
Ltmp17:
	str	x9, [x0, x8, lsl #3]
	.loc	4 52 8
	ldr	x8, [x0, #2048]
	.loc	4 52 12 is_stmt 0
	add	x8, x8, #1
	str	x8, [x0, #2048]
	.cfi_def_cfa wsp, 16
	.loc	4 52 12 epilogue_begin
	ldp	x29, x30, [sp], #16
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
Ltmp18:
Lfunc_end3:
	.cfi_endproc

	.globl	_div_stencil
	.p2align	2
_div_stencil:
Lfunc_begin4:
	.loc	4 55 0 is_stmt 1
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp19:
	.loc	4 56 8 prologue_end
	ldr	x8, [x0, #2048]
	.loc	4 56 12 is_stmt 0
	sub	x9, x8, #1
	str	x9, [x0, #2048]
	.loc	4 57 24 is_stmt 1
	ldr	x9, [x0, x9, lsl #3]
Ltmp20:
	.loc	4 58 12
	sub	x8, x8, #2
	str	x8, [x0, #2048]
Ltmp21:
	.loc	4 60 9
	cbz	x9, LBB4_2
Ltmp22:
	.loc	4 59 24
	ldr	x10, [x0, x8, lsl #3]
Ltmp23:
	.loc	4 61 29
	sdiv	x9, x10, x9
Ltmp24:
LBB4_2:
	.loc	4 0 0 is_stmt 0
	str	x9, [x0, x8, lsl #3]
Ltmp25:
	.loc	4 65 8 is_stmt 1
	ldr	x8, [x0, #2048]
	.loc	4 65 12 is_stmt 0
	add	x8, x8, #1
	str	x8, [x0, #2048]
	.cfi_def_cfa wsp, 16
	.loc	4 65 12 epilogue_begin
	ldp	x29, x30, [sp], #16
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
Ltmp26:
Lfunc_end4:
	.cfi_endproc

	.globl	_neg_stencil
	.p2align	2
_neg_stencil:
Lfunc_begin5:
	.loc	4 68 0 is_stmt 1
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp27:
	.loc	4 69 8 prologue_end
	ldr	x8, [x0, #2048]
	.loc	4 69 12 is_stmt 0
	sub	x8, x8, #1
	str	x8, [x0, #2048]
	.loc	4 70 24 is_stmt 1
	ldr	x9, [x0, x8, lsl #3]
Ltmp28:
	.loc	4 71 14
	neg	x9, x9
Ltmp29:
	str	x9, [x0, x8, lsl #3]
	.loc	4 72 8
	ldr	x8, [x0, #2048]
	.loc	4 72 12 is_stmt 0
	add	x8, x8, #1
	str	x8, [x0, #2048]
	.cfi_def_cfa wsp, 16
	.loc	4 72 12 epilogue_begin
	ldp	x29, x30, [sp], #16
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
Ltmp30:
Lfunc_end5:
	.cfi_endproc

	.globl	_pop_return_stencil
	.p2align	2
_pop_return_stencil:
Lfunc_begin6:
	.loc	4 77 0 is_stmt 1
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp31:
	.loc	4 78 8 prologue_end
	ldr	x8, [x0, #2048]
	.loc	4 78 12 is_stmt 0
	sub	x8, x8, #1
	str	x8, [x0, #2048]
	.loc	4 79 21 is_stmt 1
	ldr	x0, [x0, x8, lsl #3]
Ltmp32:
	.cfi_def_cfa wsp, 16
	.loc	4 79 5 epilogue_begin is_stmt 0
	ldp	x29, x30, [sp], #16
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
Ltmp33:
Lfunc_end6:
	.cfi_endproc

	.globl	_hole_slot
.zerofill __DATA,__common,_hole_slot,8,3
	.section	__DWARF,__debug_loc,regular,debug
Lsection_debug_loc:
Ldebug_loc0:
.set Lset0, Ltmp1-Lfunc_begin0
	.quad	Lset0
.set Lset1, Ltmp2-Lfunc_begin0
	.quad	Lset1
	.short	1
	.byte	88
	.quad	0
	.quad	0
Ldebug_loc1:
.set Lset2, Ltmp5-Lfunc_begin0
	.quad	Lset2
.set Lset3, Ltmp7-Lfunc_begin0
	.quad	Lset3
	.short	1
	.byte	89
	.quad	0
	.quad	0
Ldebug_loc2:
.set Lset4, Ltmp6-Lfunc_begin0
	.quad	Lset4
.set Lset5, Lfunc_end1-Lfunc_begin0
	.quad	Lset5
	.short	1
	.byte	90
	.quad	0
	.quad	0
Ldebug_loc3:
.set Lset6, Ltmp10-Lfunc_begin0
	.quad	Lset6
.set Lset7, Ltmp12-Lfunc_begin0
	.quad	Lset7
	.short	1
	.byte	89
	.quad	0
	.quad	0
Ldebug_loc4:
.set Lset8, Ltmp11-Lfunc_begin0
	.quad	Lset8
.set Lset9, Lfunc_end2-Lfunc_begin0
	.quad	Lset9
	.short	1
	.byte	90
	.quad	0
	.quad	0
Ldebug_loc5:
.set Lset10, Ltmp15-Lfunc_begin0
	.quad	Lset10
.set Lset11, Ltmp17-Lfunc_begin0
	.quad	Lset11
	.short	1
	.byte	89
	.quad	0
	.quad	0
Ldebug_loc6:
.set Lset12, Ltmp16-Lfunc_begin0
	.quad	Lset12
.set Lset13, Lfunc_end3-Lfunc_begin0
	.quad	Lset13
	.short	1
	.byte	90
	.quad	0
	.quad	0
Ldebug_loc7:
.set Lset14, Ltmp20-Lfunc_begin0
	.quad	Lset14
.set Lset15, Ltmp24-Lfunc_begin0
	.quad	Lset15
	.short	1
	.byte	89
	.quad	0
	.quad	0
Ldebug_loc8:
.set Lset16, Ltmp23-Lfunc_begin0
	.quad	Lset16
.set Lset17, Ltmp24-Lfunc_begin0
	.quad	Lset17
	.short	1
	.byte	90
	.quad	0
	.quad	0
Ldebug_loc9:
.set Lset18, Ltmp28-Lfunc_begin0
	.quad	Lset18
.set Lset19, Ltmp29-Lfunc_begin0
	.quad	Lset19
	.short	1
	.byte	89
	.quad	0
	.quad	0
Ldebug_loc10:
.set Lset20, Lfunc_begin6-Lfunc_begin0
	.quad	Lset20
.set Lset21, Ltmp32-Lfunc_begin0
	.quad	Lset21
	.short	1
	.byte	80
.set Lset22, Ltmp32-Lfunc_begin0
	.quad	Lset22
.set Lset23, Lfunc_end6-Lfunc_begin0
	.quad	Lset23
	.short	4
	.byte	163
	.byte	1
	.byte	80
	.byte	159
	.quad	0
	.quad	0
	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1
	.byte	17
	.byte	1
	.byte	37
	.byte	14
	.byte	19
	.byte	5
	.byte	3
	.byte	14
	.byte	16
	.byte	23
	.byte	27
	.byte	14
	.ascii	"\341\177"
	.byte	25
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	2
	.byte	52
	.byte	0
	.byte	3
	.byte	14
	.byte	73
	.byte	19
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	110
	.byte	14
	.byte	0
	.byte	0
	.byte	3
	.byte	4
	.byte	1
	.byte	73
	.byte	19
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.byte	58
	.byte	11
	.byte	59
	.byte	5
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	4
	.byte	40
	.byte	0
	.byte	3
	.byte	14
	.byte	28
	.byte	15
	.byte	0
	.byte	0
	.byte	5
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	62
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	6
	.byte	52
	.byte	0
	.byte	3
	.byte	14
	.byte	73
	.byte	19
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	2
	.byte	24
	.byte	110
	.byte	14
	.byte	0
	.byte	0
	.byte	7
	.byte	52
	.byte	0
	.byte	3
	.byte	14
	.byte	73
	.byte	19
	.byte	58
	.byte	11
	.byte	59
	.byte	5
	.byte	110
	.byte	14
	.byte	0
	.byte	0
	.byte	8
	.byte	19
	.byte	1
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	9
	.byte	13
	.byte	0
	.byte	3
	.byte	14
	.byte	73
	.byte	19
	.ascii	"\210\001"
	.byte	15
	.byte	56
	.byte	11
	.byte	0
	.byte	0
	.byte	10
	.byte	1
	.byte	1
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	11
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	11
	.byte	0
	.byte	0
	.byte	12
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.byte	62
	.byte	11
	.byte	0
	.byte	0
	.byte	13
	.byte	15
	.byte	0
	.byte	73
	.byte	19
	.byte	3
	.byte	14
	.byte	0
	.byte	0
	.byte	14
	.byte	4
	.byte	1
	.byte	73
	.byte	19
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	15
	.byte	23
	.byte	1
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	16
	.byte	19
	.byte	1
	.byte	3
	.byte	14
	.byte	11
	.byte	5
	.ascii	"\210\001"
	.byte	15
	.byte	0
	.byte	0
	.byte	17
	.byte	46
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	64
	.byte	24
	.byte	110
	.byte	14
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.ascii	"\341\177"
	.byte	25
	.byte	0
	.byte	0
	.byte	18
	.byte	5
	.byte	0
	.byte	2
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	19
	.byte	52
	.byte	0
	.byte	2
	.byte	23
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	20
	.byte	5
	.byte	0
	.byte	2
	.byte	23
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	21
	.byte	13
	.byte	0
	.byte	3
	.byte	14
	.byte	73
	.byte	19
	.ascii	"\210\001"
	.byte	15
	.byte	56
	.byte	5
	.byte	0
	.byte	0
	.byte	22
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset24, Ldebug_info_end0-Ldebug_info_start0
	.long	Lset24
Ldebug_info_start0:
	.short	4
.set Lset25, Lsection_abbrev-Lsection_abbrev
	.long	Lset25
	.byte	8
	.byte	1
	.long	0
	.short	12
	.long	11
.set Lset26, Lline_table_start0-Lsection_line
	.long	Lset26
	.long	20

	.quad	Lfunc_begin0
.set Lset27, Lfunc_end6-Lfunc_begin0
	.long	Lset27
	.byte	2
	.long	51
	.long	57
	.byte	2
	.byte	6
	.long	246
	.byte	3
	.long	150
	.long	63
	.byte	8
	.byte	1
	.short	1027
	.byte	8
	.byte	4
	.long	91
	.byte	0
	.byte	4
	.long	97
	.byte	1
	.byte	4
	.long	104
	.byte	2
	.byte	4
	.long	116
	.byte	3
	.byte	4
	.long	125
	.byte	4
	.byte	4
	.long	137
	.byte	5
	.byte	4
	.long	148
	.byte	6
	.byte	4
	.long	162
	.byte	7
	.byte	4
	.long	177
	.byte	8
	.byte	4
	.long	188
	.byte	9
	.byte	4
	.long	203
	.byte	10
	.byte	4
	.long	218
	.byte	11
	.byte	4
	.long	231
	.byte	12
	.byte	0
	.byte	5
	.long	87
	.byte	7
	.byte	8
	.byte	2
	.long	266
	.long	172
	.byte	3
	.byte	17
	.long	288
	.byte	5
	.long	283
	.byte	2
	.byte	1
	.byte	2
	.long	311
	.long	194
	.byte	2
	.byte	8
	.long	357
	.byte	3
	.long	227
	.long	323
	.byte	1
	.byte	1
	.short	782
	.byte	1
	.byte	4
	.long	345
	.byte	0
	.byte	4
	.long	349
	.byte	1
	.byte	4
	.long	353
	.byte	2
	.byte	0
	.byte	5
	.long	342
	.byte	7
	.byte	1
	.byte	6
	.long	377
	.long	259
	.byte	4
	.byte	15
	.byte	9
	.byte	3
	.quad	_hole_slot
	.long	391
	.byte	5
	.long	387
	.byte	5
	.byte	8
	.byte	7
	.long	410
	.long	282
	.byte	5
	.short	1153
	.long	470
	.byte	8
	.long	416
	.byte	40
	.byte	8
	.byte	9
	.long	439
	.long	301
	.byte	8
	.byte	0
	.byte	0
	.byte	10
	.long	313
	.byte	11
	.long	320
	.byte	5
	.byte	0
	.byte	5
	.long	444
	.byte	7
	.byte	8
	.byte	12
	.long	450
	.byte	8
	.byte	7
	.byte	2
	.long	499
	.long	342
	.byte	2
	.byte	14
	.long	946
	.byte	8
	.long	503
	.byte	56
	.byte	8
	.byte	9
	.long	514
	.long	668
	.byte	8
	.byte	0
	.byte	9
	.long	590
	.long	282
	.byte	8
	.byte	8
	.byte	9
	.long	599
	.long	382
	.byte	1
	.byte	48
	.byte	3
	.long	764
	.long	604
	.byte	1
	.byte	5
	.short	1777
	.byte	1
	.byte	4
	.long	623
	.byte	0
	.byte	4
	.long	630
	.byte	1
	.byte	4
	.long	634
	.byte	2
	.byte	4
	.long	638
	.byte	3
	.byte	4
	.long	644
	.byte	4
	.byte	4
	.long	650
	.byte	5
	.byte	4
	.long	658
	.byte	6
	.byte	4
	.long	666
	.byte	7
	.byte	4
	.long	677
	.byte	8
	.byte	4
	.long	681
	.byte	9
	.byte	4
	.long	687
	.byte	10
	.byte	4
	.long	693
	.byte	11
	.byte	4
	.long	698
	.byte	12
	.byte	4
	.long	706
	.byte	13
	.byte	4
	.long	714
	.byte	14
	.byte	4
	.long	720
	.byte	15
	.byte	4
	.long	732
	.byte	16
	.byte	4
	.long	744
	.byte	17
	.byte	4
	.long	749
	.byte	18
	.byte	4
	.long	754
	.byte	19
	.byte	4
	.long	761
	.byte	20
	.byte	4
	.long	768
	.byte	21
	.byte	4
	.long	777
	.byte	22
	.byte	4
	.long	784
	.byte	23
	.byte	4
	.long	789
	.byte	24
	.byte	4
	.long	795
	.byte	25
	.byte	4
	.long	803
	.byte	26
	.byte	4
	.long	811
	.byte	27
	.byte	4
	.long	821
	.byte	28
	.byte	4
	.long	831
	.byte	29
	.byte	4
	.long	843
	.byte	30
	.byte	4
	.long	853
	.byte	31
	.byte	4
	.long	861
	.byte	32
	.byte	4
	.long	869
	.byte	33
	.byte	4
	.long	875
	.byte	34
	.byte	4
	.long	881
	.byte	35
	.byte	4
	.long	889
	.byte	36
	.byte	4
	.long	897
	.byte	37
	.byte	4
	.long	905
	.byte	38
	.byte	4
	.long	908
	.byte	39
	.byte	4
	.long	915
	.byte	40
	.byte	4
	.long	922
	.byte	41
	.byte	4
	.long	926
	.byte	42
	.byte	4
	.long	933
	.byte	43
	.byte	4
	.long	939
	.byte	44
	.byte	0
	.byte	0
	.byte	13
	.long	677
	.long	520
	.byte	8
	.long	538
	.byte	72
	.byte	8
	.byte	9
	.long	555
	.long	718
	.byte	8
	.byte	0
	.byte	9
	.long	580
	.long	718
	.byte	8
	.byte	16
	.byte	9
	.long	590
	.long	282
	.byte	8
	.byte	32
	.byte	0
	.byte	8
	.long	560
	.byte	16
	.byte	8
	.byte	9
	.long	565
	.long	748
	.byte	8
	.byte	0
	.byte	9
	.long	576
	.long	313
	.byte	8
	.byte	8
	.byte	0
	.byte	13
	.long	757
	.long	569
	.byte	5
	.long	573
	.byte	7
	.byte	1
	.byte	5
	.long	620
	.byte	7
	.byte	1
	.byte	2
	.long	958
	.long	786
	.byte	2
	.byte	84
	.long	1718
	.byte	8
	.long	961
	.byte	184
	.byte	8
	.byte	9
	.long	971
	.long	1319
	.byte	8
	.byte	0
	.byte	3
	.long	1535
	.long	1218
	.byte	4
	.byte	5
	.short	311
	.byte	4
	.byte	4
	.long	1243
	.ascii	"\200\200\200 "
	.byte	4
	.long	1247
	.ascii	"\200\200\200("
	.byte	4
	.long	1253
	.ascii	"\200\200\204("
	.byte	4
	.long	1256
	.ascii	"\200\200\210("
	.byte	4
	.long	1263
	.ascii	"\200\200\2000"
	.byte	4
	.long	1269
	.ascii	"\200\200\2040"
	.byte	4
	.long	1274
	.ascii	"\200\200\2100"
	.byte	4
	.long	1279
	.ascii	"\200\200\2140"
	.byte	4
	.long	1286
	.ascii	"\200\200\200P"
	.byte	4
	.long	1292
	.ascii	"\201\200\200P"
	.byte	4
	.long	1302
	.ascii	"\202\200\200P"
	.byte	4
	.long	1312
	.ascii	"\203\200\200P"
	.byte	4
	.long	1322
	.ascii	"\204\200\200P"
	.byte	4
	.long	1332
	.ascii	"\205\200\200P"
	.byte	4
	.long	1342
	.ascii	"\206\200\200P"
	.byte	4
	.long	1352
	.ascii	"\207\200\200P"
	.byte	4
	.long	1363
	.ascii	"\210\200\200P"
	.byte	4
	.long	1372
	.ascii	"\211\200\200P"
	.byte	4
	.long	1381
	.ascii	"\212\200\200P"
	.byte	4
	.long	1390
	.ascii	"\213\200\200P"
	.byte	4
	.long	1399
	.ascii	"\214\200\200P"
	.byte	4
	.long	1408
	.ascii	"\215\200\200P"
	.byte	4
	.long	1417
	.ascii	"\216\200\200P"
	.byte	4
	.long	1426
	.ascii	"\217\200\200P"
	.byte	4
	.long	1435
	.ascii	"\220\200\200P"
	.byte	4
	.long	1444
	.ascii	"\221\200\200P"
	.byte	0
	.byte	9
	.long	1453
	.long	1064
	.byte	1
	.byte	176
	.byte	14
	.long	764
	.long	1457
	.byte	1
	.byte	5
	.byte	213
	.byte	1
	.byte	4
	.long	1471
	.byte	0
	.byte	4
	.long	91
	.byte	1
	.byte	4
	.long	1484
	.byte	2
	.byte	4
	.long	1492
	.byte	3
	.byte	4
	.long	1500
	.byte	4
	.byte	4
	.long	1507
	.byte	5
	.byte	4
	.long	1511
	.byte	6
	.byte	4
	.long	1089
	.byte	7
	.byte	4
	.long	1133
	.byte	8
	.byte	4
	.long	1517
	.byte	9
	.byte	4
	.long	1523
	.byte	10
	.byte	4
	.long	1529
	.byte	11
	.byte	4
	.long	1538
	.byte	12
	.byte	4
	.long	1542
	.byte	13
	.byte	4
	.long	1552
	.byte	14
	.byte	4
	.long	1560
	.byte	15
	.byte	4
	.long	1567
	.byte	16
	.byte	4
	.long	1575
	.byte	17
	.byte	4
	.long	1585
	.byte	18
	.byte	4
	.long	1589
	.byte	19
	.byte	4
	.long	1595
	.byte	20
	.byte	4
	.long	1600
	.byte	21
	.byte	4
	.long	1609
	.byte	22
	.byte	4
	.long	1617
	.byte	23
	.byte	4
	.long	1625
	.byte	24
	.byte	4
	.long	1179
	.byte	25
	.byte	4
	.long	1633
	.byte	26
	.byte	4
	.long	1638
	.byte	27
	.byte	4
	.long	1642
	.byte	28
	.byte	4
	.long	1646
	.byte	29
	.byte	4
	.long	1650
	.byte	30
	.byte	4
	.long	1661
	.byte	31
	.byte	4
	.long	1666
	.byte	32
	.byte	4
	.long	1673
	.byte	33
	.byte	4
	.long	1680
	.byte	34
	.byte	4
	.long	1685
	.byte	35
	.byte	4
	.long	1692
	.byte	36
	.byte	4
	.long	1697
	.byte	37
	.byte	4
	.long	1704
	.byte	38
	.byte	4
	.long	1711
	.byte	39
	.byte	0
	.byte	0
	.byte	15
	.long	985
	.byte	176
	.byte	8
	.byte	9
	.long	1008
	.long	1371
	.byte	8
	.byte	0
	.byte	9
	.long	1089
	.long	1464
	.byte	8
	.byte	0
	.byte	9
	.long	1133
	.long	1494
	.byte	8
	.byte	0
	.byte	9
	.long	1179
	.long	1542
	.byte	4
	.byte	0
	.byte	0
	.byte	8
	.long	1015
	.byte	112
	.byte	8
	.byte	9
	.long	1037
	.long	1401
	.byte	8
	.byte	0
	.byte	9
	.long	1085
	.long	1401
	.byte	8
	.byte	56
	.byte	0
	.byte	8
	.long	1041
	.byte	56
	.byte	8
	.byte	9
	.long	1057
	.long	313
	.byte	8
	.byte	0
	.byte	9
	.long	1063
	.long	313
	.byte	8
	.byte	8
	.byte	9
	.long	1069
	.long	313
	.byte	8
	.byte	16
	.byte	9
	.long	1075
	.long	718
	.byte	8
	.byte	24
	.byte	9
	.long	1079
	.long	718
	.byte	8
	.byte	40
	.byte	0
	.byte	8
	.long	1094
	.byte	168
	.byte	8
	.byte	9
	.long	1121
	.long	1371
	.byte	8
	.byte	0
	.byte	9
	.long	1127
	.long	1401
	.byte	8
	.byte	112
	.byte	0
	.byte	8
	.long	1139
	.byte	176
	.byte	8
	.byte	9
	.long	1121
	.long	1371
	.byte	8
	.byte	0
	.byte	9
	.long	1127
	.long	1401
	.byte	8
	.byte	112
	.byte	9
	.long	1167
	.long	1535
	.byte	4
	.byte	168
	.byte	0
	.byte	5
	.long	1175
	.byte	7
	.byte	4
	.byte	8
	.long	1187
	.byte	8
	.byte	4
	.byte	9
	.long	1037
	.long	804
	.byte	4
	.byte	0
	.byte	9
	.long	1085
	.long	804
	.byte	4
	.byte	4
	.byte	0
	.byte	2
	.long	1729
	.long	1587
	.byte	2
	.byte	13
	.long	1970
	.byte	3
	.long	1782
	.long	1733
	.byte	1
	.byte	5
	.short	952
	.byte	1
	.byte	4
	.long	1747
	.byte	0
	.byte	4
	.long	1752
	.byte	1
	.byte	4
	.long	1756
	.byte	2
	.byte	4
	.long	1766
	.byte	3
	.byte	4
	.long	1775
	.byte	4
	.byte	4
	.long	1783
	.byte	5
	.byte	4
	.long	1793
	.byte	6
	.byte	4
	.long	1800
	.byte	7
	.byte	4
	.long	1806
	.byte	8
	.byte	4
	.long	1813
	.byte	9
	.byte	4
	.long	1820
	.byte	10
	.byte	4
	.long	1825
	.byte	11
	.byte	4
	.long	1832
	.byte	12
	.byte	4
	.long	1167
	.byte	13
	.byte	4
	.long	1838
	.byte	14
	.byte	4
	.long	1850
	.byte	15
	.byte	4
	.long	1855
	.byte	16
	.byte	4
	.long	1866
	.byte	17
	.byte	4
	.long	1876
	.byte	18
	.byte	4
	.long	1885
	.byte	19
	.byte	4
	.long	1896
	.byte	20
	.byte	4
	.long	1904
	.byte	21
	.byte	4
	.long	1911
	.byte	22
	.byte	4
	.long	1919
	.byte	23
	.byte	4
	.long	1924
	.byte	24
	.byte	4
	.long	1932
	.byte	25
	.byte	4
	.long	1939
	.byte	26
	.byte	4
	.long	1949
	.byte	27
	.byte	4
	.long	1956
	.byte	28
	.byte	4
	.long	1961
	.byte	29
	.byte	0
	.byte	5
	.long	1744
	.byte	7
	.byte	1
	.byte	2
	.long	1982
	.long	1804
	.byte	2
	.byte	106
	.long	2066
	.byte	3
	.long	1885
	.long	1996
	.byte	1
	.byte	5
	.short	1007
	.byte	1
	.byte	4
	.long	2019
	.byte	0
	.byte	4
	.long	2021
	.byte	1
	.byte	4
	.long	2026
	.byte	2
	.byte	4
	.long	2030
	.byte	3
	.byte	4
	.long	2035
	.byte	4
	.byte	4
	.long	2039
	.byte	5
	.byte	4
	.long	1517
	.byte	6
	.byte	4
	.long	2045
	.byte	7
	.byte	4
	.long	2049
	.byte	8
	.byte	4
	.long	2055
	.byte	9
	.byte	4
	.long	2060
	.byte	10
	.byte	0
	.byte	5
	.long	2016
	.byte	7
	.byte	1
	.byte	7
	.long	1747
	.long	1908
	.byte	5
	.short	2072
	.long	2116
	.byte	16
	.long	2088
	.short	256
	.byte	1
	.byte	9
	.long	2109
	.long	1939
	.byte	1
	.byte	0
	.byte	9
	.long	576
	.long	757
	.byte	1
	.byte	255
	.byte	0
	.byte	10
	.long	757
	.byte	11
	.long	320
	.byte	255
	.byte	0
	.byte	2
	.long	2142
	.long	1966
	.byte	2
	.byte	99
	.long	2176
	.byte	16
	.long	2149
	.short	504
	.byte	8
	.byte	9
	.long	499
	.long	342
	.byte	8
	.byte	0
	.byte	9
	.long	958
	.long	786
	.byte	8
	.byte	56
	.byte	9
	.long	1729
	.long	1587
	.byte	1
	.byte	240
	.byte	9
	.long	2156
	.long	1804
	.byte	1
	.byte	241
	.byte	9
	.long	2161
	.long	1908
	.byte	1
	.byte	242
	.byte	0
	.byte	2
	.long	2019
	.long	2045
	.byte	1
	.byte	172
	.long	4019
	.byte	8
	.long	2191
	.byte	32
	.byte	8
	.byte	9
	.long	2217
	.long	2600
	.byte	8
	.byte	0
	.byte	9
	.long	1453
	.long	2074
	.byte	1
	.byte	24
	.byte	3
	.long	757
	.long	3799
	.byte	1
	.byte	1
	.short	442
	.byte	1
	.byte	4
	.long	3856
	.byte	0
	.byte	4
	.long	3861
	.byte	1
	.byte	4
	.long	3867
	.byte	2
	.byte	4
	.long	3873
	.byte	3
	.byte	4
	.long	2259
	.byte	4
	.byte	4
	.long	2351
	.byte	5
	.byte	4
	.long	2362
	.byte	6
	.byte	4
	.long	2385
	.byte	7
	.byte	4
	.long	2407
	.byte	8
	.byte	4
	.long	2425
	.byte	9
	.byte	4
	.long	2442
	.byte	10
	.byte	4
	.long	2511
	.byte	11
	.byte	4
	.long	2519
	.byte	12
	.byte	4
	.long	2531
	.byte	13
	.byte	4
	.long	2544
	.byte	14
	.byte	4
	.long	2557
	.byte	15
	.byte	4
	.long	2576
	.byte	16
	.byte	4
	.long	2591
	.byte	17
	.byte	4
	.long	2610
	.byte	18
	.byte	4
	.long	2625
	.byte	19
	.byte	4
	.long	2639
	.byte	20
	.byte	4
	.long	2653
	.byte	21
	.byte	4
	.long	2674
	.byte	22
	.byte	4
	.long	2692
	.byte	23
	.byte	4
	.long	2706
	.byte	24
	.byte	4
	.long	2724
	.byte	25
	.byte	4
	.long	2734
	.byte	26
	.byte	4
	.long	2748
	.byte	27
	.byte	4
	.long	2908
	.byte	28
	.byte	4
	.long	2919
	.byte	29
	.byte	4
	.long	2930
	.byte	30
	.byte	4
	.long	3096
	.byte	31
	.byte	4
	.long	3105
	.byte	32
	.byte	4
	.long	3120
	.byte	33
	.byte	4
	.long	3133
	.byte	34
	.byte	4
	.long	3148
	.byte	35
	.byte	4
	.long	3295
	.byte	36
	.byte	4
	.long	3309
	.byte	37
	.byte	4
	.long	3325
	.byte	38
	.byte	4
	.long	3343
	.byte	39
	.byte	4
	.long	3356
	.byte	40
	.byte	4
	.long	3367
	.byte	41
	.byte	4
	.long	3381
	.byte	42
	.byte	4
	.long	3403
	.byte	43
	.byte	4
	.long	3420
	.byte	44
	.byte	4
	.long	3433
	.byte	45
	.byte	4
	.long	3454
	.byte	46
	.byte	4
	.long	3466
	.byte	47
	.byte	4
	.long	3486
	.byte	48
	.byte	4
	.long	3495
	.byte	49
	.byte	4
	.long	3880
	.byte	50
	.byte	4
	.long	3888
	.byte	51
	.byte	4
	.long	3900
	.byte	52
	.byte	4
	.long	3911
	.byte	53
	.byte	4
	.long	3504
	.byte	54
	.byte	4
	.long	3512
	.byte	55
	.byte	4
	.long	3522
	.byte	56
	.byte	4
	.long	3537
	.byte	57
	.byte	4
	.long	3550
	.byte	58
	.byte	4
	.long	3567
	.byte	59
	.byte	4
	.long	3578
	.byte	60
	.byte	4
	.long	3595
	.byte	61
	.byte	4
	.long	3613
	.byte	62
	.byte	4
	.long	3623
	.byte	63
	.byte	4
	.long	3632
	.byte	64
	.byte	4
	.long	3641
	.byte	65
	.byte	4
	.long	3656
	.byte	66
	.byte	4
	.long	3668
	.byte	67
	.byte	4
	.long	3678
	.byte	68
	.byte	4
	.long	3693
	.byte	69
	.byte	4
	.long	3704
	.byte	70
	.byte	4
	.long	3718
	.byte	71
	.byte	4
	.long	3726
	.byte	72
	.byte	4
	.long	3736
	.byte	73
	.byte	4
	.long	3746
	.byte	74
	.byte	4
	.long	3759
	.byte	75
	.byte	4
	.long	3775
	.byte	76
	.byte	4
	.long	3925
	.byte	77
	.byte	4
	.long	3789
	.byte	78
	.byte	4
	.long	3939
	.byte	79
	.byte	4
	.long	3952
	.byte	80
	.byte	4
	.long	3965
	.byte	81
	.byte	4
	.long	3978
	.byte	82
	.byte	4
	.long	3991
	.byte	83
	.byte	4
	.long	4006
	.byte	84
	.byte	0
	.byte	0
	.byte	15
	.long	2225
	.byte	32
	.byte	8
	.byte	9
	.long	2259
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2351
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2362
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2385
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2407
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2425
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2442
	.long	3427
	.byte	8
	.byte	0
	.byte	9
	.long	2511
	.long	3427
	.byte	8
	.byte	0
	.byte	9
	.long	2519
	.long	3427
	.byte	8
	.byte	0
	.byte	9
	.long	2531
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2544
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2557
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2576
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2591
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2610
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2625
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2639
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2653
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2674
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2692
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2706
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2724
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2734
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2748
	.long	3457
	.byte	8
	.byte	0
	.byte	9
	.long	2908
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2919
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	2930
	.long	3545
	.byte	8
	.byte	0
	.byte	9
	.long	3096
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3105
	.long	3545
	.byte	8
	.byte	0
	.byte	9
	.long	3120
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3133
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3148
	.long	3644
	.byte	8
	.byte	0
	.byte	9
	.long	3295
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3309
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3325
	.long	3644
	.byte	8
	.byte	0
	.byte	9
	.long	3343
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3356
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3367
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3381
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3403
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3420
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3433
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3454
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3466
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3486
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3495
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3504
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3512
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3522
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3537
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3550
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3567
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3578
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3595
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3613
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3623
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3632
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3641
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3656
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3668
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3678
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3693
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3704
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3718
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3726
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3736
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3746
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3759
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3775
	.long	3378
	.byte	8
	.byte	0
	.byte	9
	.long	3789
	.long	3378
	.byte	8
	.byte	0
	.byte	0
	.byte	8
	.long	2271
	.byte	16
	.byte	8
	.byte	9
	.long	2311
	.long	3397
	.byte	8
	.byte	0
	.byte	0
	.byte	8
	.long	2336
	.byte	16
	.byte	8
	.byte	9
	.long	2341
	.long	150
	.byte	8
	.byte	0
	.byte	9
	.long	2346
	.long	757
	.byte	1
	.byte	8
	.byte	0
	.byte	8
	.long	2451
	.byte	24
	.byte	8
	.byte	9
	.long	2311
	.long	3397
	.byte	8
	.byte	0
	.byte	9
	.long	2495
	.long	227
	.byte	1
	.byte	16
	.byte	0
	.byte	8
	.long	2762
	.byte	24
	.byte	8
	.byte	9
	.long	2311
	.long	3397
	.byte	8
	.byte	0
	.byte	9
	.long	2808
	.long	3486
	.byte	1
	.byte	16
	.byte	3
	.long	3538
	.long	2813
	.byte	1
	.byte	1
	.short	382
	.byte	1
	.byte	4
	.long	2876
	.byte	0
	.byte	4
	.long	2884
	.byte	1
	.byte	4
	.long	2888
	.byte	2
	.byte	4
	.long	2892
	.byte	3
	.byte	4
	.long	2896
	.byte	4
	.byte	4
	.long	2902
	.byte	5
	.byte	0
	.byte	0
	.byte	5
	.long	2873
	.byte	7
	.byte	1
	.byte	8
	.long	2947
	.byte	24
	.byte	8
	.byte	9
	.long	2311
	.long	3397
	.byte	8
	.byte	0
	.byte	9
	.long	2994
	.long	3574
	.byte	1
	.byte	16
	.byte	3
	.long	1885
	.long	2999
	.byte	1
	.byte	1
	.short	400
	.byte	1
	.byte	4
	.long	3060
	.byte	0
	.byte	4
	.long	3064
	.byte	1
	.byte	4
	.long	3068
	.byte	2
	.byte	4
	.long	3072
	.byte	3
	.byte	4
	.long	3076
	.byte	4
	.byte	4
	.long	3080
	.byte	5
	.byte	4
	.long	3084
	.byte	6
	.byte	4
	.long	3088
	.byte	7
	.byte	4
	.long	3092
	.byte	8
	.byte	0
	.byte	0
	.byte	8
	.long	3166
	.byte	24
	.byte	8
	.byte	9
	.long	2311
	.long	3397
	.byte	8
	.byte	0
	.byte	9
	.long	2994
	.long	3673
	.byte	1
	.byte	16
	.byte	3
	.long	227
	.long	3214
	.byte	1
	.byte	1
	.short	421
	.byte	1
	.byte	4
	.long	3276
	.byte	0
	.byte	4
	.long	3287
	.byte	1
	.byte	0
	.byte	0
	.byte	7
	.long	4047
	.long	677
	.byte	6
	.short	2133
	.long	4056
	.byte	17
	.quad	Lfunc_begin0
.set Lset28, Lfunc_end0-Lfunc_begin0
	.long	Lset28
	.byte	1
	.byte	109
	.long	4103
	.long	4084
	.byte	4
	.byte	17
	.long	4170

	.byte	18
	.byte	1
	.byte	80
	.long	4348
	.byte	4
	.byte	17
	.long	4177
	.byte	19
.set Lset29, Ldebug_loc0-Lsection_debug_loc
	.long	Lset29
	.long	4396
	.byte	4
	.byte	21
	.long	259
	.byte	0
	.byte	17
	.quad	Lfunc_begin1
.set Lset30, Lfunc_end1-Lfunc_begin1
	.long	Lset30
	.byte	1
	.byte	109
	.long	4143
	.long	4131
	.byte	4
	.byte	26
	.long	4170

	.byte	18
	.byte	1
	.byte	80
	.long	4348
	.byte	4
	.byte	26
	.long	4177
	.byte	19
.set Lset31, Ldebug_loc1-Lsection_debug_loc
	.long	Lset31
	.long	4402
	.byte	4
	.byte	30
	.long	259
	.byte	19
.set Lset32, Ldebug_loc2-Lsection_debug_loc
	.long	Lset32
	.long	4404
	.byte	4
	.byte	32
	.long	259
	.byte	0
	.byte	17
	.quad	Lfunc_begin2
.set Lset33, Lfunc_end2-Lfunc_begin2
	.long	Lset33
	.byte	1
	.byte	109
	.long	4176
	.long	4164
	.byte	4
	.byte	37
	.long	4170

	.byte	18
	.byte	1
	.byte	80
	.long	4348
	.byte	4
	.byte	37
	.long	4177
	.byte	19
.set Lset34, Ldebug_loc3-Lsection_debug_loc
	.long	Lset34
	.long	4402
	.byte	4
	.byte	39
	.long	259
	.byte	19
.set Lset35, Ldebug_loc4-Lsection_debug_loc
	.long	Lset35
	.long	4404
	.byte	4
	.byte	41
	.long	259
	.byte	0
	.byte	17
	.quad	Lfunc_begin3
.set Lset36, Lfunc_end3-Lfunc_begin3
	.long	Lset36
	.byte	1
	.byte	109
	.long	4209
	.long	4197
	.byte	4
	.byte	46
	.long	4170

	.byte	18
	.byte	1
	.byte	80
	.long	4348
	.byte	4
	.byte	46
	.long	4177
	.byte	19
.set Lset37, Ldebug_loc5-Lsection_debug_loc
	.long	Lset37
	.long	4402
	.byte	4
	.byte	48
	.long	259
	.byte	19
.set Lset38, Ldebug_loc6-Lsection_debug_loc
	.long	Lset38
	.long	4404
	.byte	4
	.byte	50
	.long	259
	.byte	0
	.byte	17
	.quad	Lfunc_begin4
.set Lset39, Lfunc_end4-Lfunc_begin4
	.long	Lset39
	.byte	1
	.byte	109
	.long	4242
	.long	4230
	.byte	4
	.byte	55
	.long	4170

	.byte	18
	.byte	1
	.byte	80
	.long	4348
	.byte	4
	.byte	55
	.long	4177
	.byte	19
.set Lset40, Ldebug_loc7-Lsection_debug_loc
	.long	Lset40
	.long	4402
	.byte	4
	.byte	57
	.long	259
	.byte	19
.set Lset41, Ldebug_loc8-Lsection_debug_loc
	.long	Lset41
	.long	4404
	.byte	4
	.byte	59
	.long	259
	.byte	0
	.byte	17
	.quad	Lfunc_begin5
.set Lset42, Lfunc_end5-Lfunc_begin5
	.long	Lset42
	.byte	1
	.byte	109
	.long	4275
	.long	4263
	.byte	4
	.byte	68
	.long	4170

	.byte	18
	.byte	1
	.byte	80
	.long	4348
	.byte	4
	.byte	68
	.long	4177
	.byte	19
.set Lset43, Ldebug_loc9-Lsection_debug_loc
	.long	Lset43
	.long	4404
	.byte	4
	.byte	70
	.long	259
	.byte	0
	.byte	17
	.quad	Lfunc_begin6
.set Lset44, Lfunc_end6-Lfunc_begin6
	.long	Lset44
	.byte	1
	.byte	109
	.long	4315
	.long	4296
	.byte	4
	.byte	77
	.long	259

	.byte	20
.set Lset45, Ldebug_loc10-Lsection_debug_loc
	.long	Lset45
	.long	4348
	.byte	4
	.byte	77
	.long	4177
	.byte	0
	.byte	5
	.long	4343
	.byte	5
	.byte	0
	.byte	13
	.long	4186
	.long	4352
	.byte	16
	.long	4370
	.short	2056
	.byte	8
	.byte	9
	.long	4387
	.long	4218
	.byte	8
	.byte	0
	.byte	21
	.long	4393
	.long	313
	.byte	8
	.short	2048
	.byte	0
	.byte	10
	.long	259
	.byte	22
	.long	320
	.short	256
	.byte	0
	.byte	0
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"zig 0.15.1"
	.asciz	"stencils"
	.asciz	"/Users/nish7/Code/mini-CnP/src"
	.asciz	"zig_backend"
	.asciz	"builtin.CompilerBackend"
	.asciz	"u64"
	.asciz	"other"
	.asciz	"stage1"
	.asciz	"stage2_llvm"
	.asciz	"stage2_c"
	.asciz	"stage2_wasm"
	.asciz	"stage2_arm"
	.asciz	"stage2_x86_64"
	.asciz	"stage2_aarch64"
	.asciz	"stage2_x86"
	.asciz	"stage2_riscv64"
	.asciz	"stage2_sparc64"
	.asciz	"stage2_spirv"
	.asciz	"stage2_powerpc"
	.asciz	"builtin.zig_backend"
	.asciz	"simplified_logic"
	.asciz	"bool"
	.asciz	"start.simplified_logic"
	.asciz	"output_mode"
	.asciz	"builtin.OutputMode"
	.asciz	"u2"
	.asciz	"Exe"
	.asciz	"Lib"
	.asciz	"Obj"
	.asciz	"builtin.output_mode"
	.asciz	"hole_slot"
	.asciz	"i64"
	.asciz	"stencils.hole_slot"
	.asciz	"empty"
	.asciz	"Target.Cpu.Feature.Set"
	.asciz	"ints"
	.asciz	"usize"
	.asciz	"__ARRAY_SIZE_TYPE__"
	.asciz	"Target.Cpu.Feature.Set.empty"
	.asciz	"cpu"
	.asciz	"Target.Cpu"
	.asciz	"model"
	.asciz	"*Target.Cpu.Model"
	.asciz	"Target.Cpu.Model"
	.asciz	"name"
	.asciz	"[]u8"
	.asciz	"ptr"
	.asciz	"*u8"
	.asciz	"u8"
	.asciz	"len"
	.asciz	"llvm_name"
	.asciz	"features"
	.asciz	"arch"
	.asciz	"Target.Cpu.Arch"
	.asciz	"u6"
	.asciz	"amdgcn"
	.asciz	"arc"
	.asciz	"arm"
	.asciz	"armeb"
	.asciz	"thumb"
	.asciz	"thumbeb"
	.asciz	"aarch64"
	.asciz	"aarch64_be"
	.asciz	"avr"
	.asciz	"bpfel"
	.asciz	"bpfeb"
	.asciz	"csky"
	.asciz	"hexagon"
	.asciz	"kalimba"
	.asciz	"lanai"
	.asciz	"loongarch32"
	.asciz	"loongarch64"
	.asciz	"m68k"
	.asciz	"mips"
	.asciz	"mipsel"
	.asciz	"mips64"
	.asciz	"mips64el"
	.asciz	"msp430"
	.asciz	"or1k"
	.asciz	"nvptx"
	.asciz	"nvptx64"
	.asciz	"powerpc"
	.asciz	"powerpcle"
	.asciz	"powerpc64"
	.asciz	"powerpc64le"
	.asciz	"propeller"
	.asciz	"riscv32"
	.asciz	"riscv64"
	.asciz	"s390x"
	.asciz	"sparc"
	.asciz	"sparc64"
	.asciz	"spirv32"
	.asciz	"spirv64"
	.asciz	"ve"
	.asciz	"wasm32"
	.asciz	"wasm64"
	.asciz	"x86"
	.asciz	"x86_64"
	.asciz	"xcore"
	.asciz	"xtensa"
	.asciz	"builtin.cpu"
	.asciz	"os"
	.asciz	"Target.Os"
	.asciz	"version_range"
	.asciz	"Target.Os.VersionRange"
	.asciz	"semver"
	.asciz	"SemanticVersion.Range"
	.asciz	"min"
	.asciz	"SemanticVersion"
	.asciz	"major"
	.asciz	"minor"
	.asciz	"patch"
	.asciz	"pre"
	.asciz	"build"
	.asciz	"max"
	.asciz	"hurd"
	.asciz	"Target.Os.HurdVersionRange"
	.asciz	"range"
	.asciz	"glibc"
	.asciz	"linux"
	.asciz	"Target.Os.LinuxVersionRange"
	.asciz	"android"
	.asciz	"u32"
	.asciz	"windows"
	.asciz	"Target.Os.WindowsVersion.Range"
	.asciz	"Target.Os.WindowsVersion"
	.asciz	"nt4"
	.asciz	"win2k"
	.asciz	"xp"
	.asciz	"ws2003"
	.asciz	"vista"
	.asciz	"win7"
	.asciz	"win8"
	.asciz	"win8_1"
	.asciz	"win10"
	.asciz	"win10_th2"
	.asciz	"win10_rs1"
	.asciz	"win10_rs2"
	.asciz	"win10_rs3"
	.asciz	"win10_rs4"
	.asciz	"win10_rs5"
	.asciz	"win10_19h1"
	.asciz	"win10_vb"
	.asciz	"win10_mn"
	.asciz	"win10_fe"
	.asciz	"win10_co"
	.asciz	"win10_ni"
	.asciz	"win10_cu"
	.asciz	"win11_zn"
	.asciz	"win11_ga"
	.asciz	"win11_ge"
	.asciz	"win11_dt"
	.asciz	"tag"
	.asciz	"Target.Os.Tag"
	.asciz	"freestanding"
	.asciz	"contiki"
	.asciz	"fuchsia"
	.asciz	"hermit"
	.asciz	"aix"
	.asciz	"haiku"
	.asciz	"plan9"
	.asciz	"rtems"
	.asciz	"serenity"
	.asciz	"zos"
	.asciz	"dragonfly"
	.asciz	"freebsd"
	.asciz	"netbsd"
	.asciz	"openbsd"
	.asciz	"driverkit"
	.asciz	"ios"
	.asciz	"macos"
	.asciz	"tvos"
	.asciz	"visionos"
	.asciz	"watchos"
	.asciz	"illumos"
	.asciz	"solaris"
	.asciz	"uefi"
	.asciz	"ps3"
	.asciz	"ps4"
	.asciz	"ps5"
	.asciz	"emscripten"
	.asciz	"wasi"
	.asciz	"amdhsa"
	.asciz	"amdpal"
	.asciz	"cuda"
	.asciz	"mesa3d"
	.asciz	"nvcl"
	.asciz	"opencl"
	.asciz	"opengl"
	.asciz	"vulkan"
	.asciz	"builtin.os"
	.asciz	"abi"
	.asciz	"Target.Abi"
	.asciz	"u5"
	.asciz	"none"
	.asciz	"gnu"
	.asciz	"gnuabin32"
	.asciz	"gnuabi64"
	.asciz	"gnueabi"
	.asciz	"gnueabihf"
	.asciz	"gnuf32"
	.asciz	"gnusf"
	.asciz	"gnux32"
	.asciz	"code16"
	.asciz	"eabi"
	.asciz	"eabihf"
	.asciz	"ilp32"
	.asciz	"androideabi"
	.asciz	"musl"
	.asciz	"muslabin32"
	.asciz	"muslabi64"
	.asciz	"musleabi"
	.asciz	"musleabihf"
	.asciz	"muslf32"
	.asciz	"muslsf"
	.asciz	"muslx32"
	.asciz	"msvc"
	.asciz	"itanium"
	.asciz	"cygnus"
	.asciz	"simulator"
	.asciz	"macabi"
	.asciz	"ohos"
	.asciz	"ohoseabi"
	.asciz	"builtin.abi"
	.asciz	"object_format"
	.asciz	"Target.ObjectFormat"
	.asciz	"u4"
	.asciz	"c"
	.asciz	"coff"
	.asciz	"elf"
	.asciz	"goff"
	.asciz	"hex"
	.asciz	"macho"
	.asciz	"raw"
	.asciz	"spirv"
	.asciz	"wasm"
	.asciz	"xcoff"
	.asciz	"builtin.object_format"
	.asciz	"Target.DynamicLinker"
	.asciz	"buffer"
	.asciz	"Target.DynamicLinker.none"
	.asciz	"target"
	.asciz	"Target"
	.asciz	"ofmt"
	.asciz	"dynamic_linker"
	.asciz	"builtin.target"
	.asciz	"builtin.CallingConvention"
	.asciz	"payload"
	.asciz	"builtin.CallingConvention:Payload"
	.asciz	"x86_64_sysv"
	.asciz	"builtin.CallingConvention.CommonOptions"
	.asciz	"incoming_stack_alignment"
	.asciz	"?u64"
	.asciz	"data"
	.asciz	"some"
	.asciz	"x86_64_win"
	.asciz	"x86_64_regcall_v3_sysv"
	.asciz	"x86_64_regcall_v4_win"
	.asciz	"x86_64_vectorcall"
	.asciz	"x86_64_interrupt"
	.asciz	"x86_sysv"
	.asciz	"builtin.CallingConvention.X86RegparmOptions"
	.asciz	"register_params"
	.asciz	"x86_win"
	.asciz	"x86_stdcall"
	.asciz	"x86_fastcall"
	.asciz	"x86_thiscall"
	.asciz	"x86_thiscall_mingw"
	.asciz	"x86_regcall_v3"
	.asciz	"x86_regcall_v4_win"
	.asciz	"x86_vectorcall"
	.asciz	"x86_interrupt"
	.asciz	"aarch64_aapcs"
	.asciz	"aarch64_aapcs_darwin"
	.asciz	"aarch64_aapcs_win"
	.asciz	"aarch64_vfabi"
	.asciz	"aarch64_vfabi_sve"
	.asciz	"arm_aapcs"
	.asciz	"arm_aapcs_vfp"
	.asciz	"arm_interrupt"
	.asciz	"builtin.CallingConvention.ArmInterruptOptions"
	.asciz	"type"
	.asciz	"builtin.CallingConvention.ArmInterruptOptions.InterruptType"
	.asciz	"u3"
	.asciz	"generic"
	.asciz	"irq"
	.asciz	"fiq"
	.asciz	"swi"
	.asciz	"abort"
	.asciz	"undef"
	.asciz	"mips64_n64"
	.asciz	"mips64_n32"
	.asciz	"mips64_interrupt"
	.asciz	"builtin.CallingConvention.MipsInterruptOptions"
	.asciz	"mode"
	.asciz	"builtin.CallingConvention.MipsInterruptOptions.InterruptMode"
	.asciz	"eic"
	.asciz	"sw0"
	.asciz	"sw1"
	.asciz	"hw0"
	.asciz	"hw1"
	.asciz	"hw2"
	.asciz	"hw3"
	.asciz	"hw4"
	.asciz	"hw5"
	.asciz	"mips_o32"
	.asciz	"mips_interrupt"
	.asciz	"riscv64_lp64"
	.asciz	"riscv64_lp64_v"
	.asciz	"riscv64_interrupt"
	.asciz	"builtin.CallingConvention.RiscvInterruptOptions"
	.asciz	"builtin.CallingConvention.RiscvInterruptOptions.PrivilegeMode"
	.asciz	"supervisor"
	.asciz	"machine"
	.asciz	"riscv32_ilp32"
	.asciz	"riscv32_ilp32_v"
	.asciz	"riscv32_interrupt"
	.asciz	"sparc64_sysv"
	.asciz	"sparc_sysv"
	.asciz	"powerpc64_elf"
	.asciz	"powerpc64_elf_altivec"
	.asciz	"powerpc64_elf_v2"
	.asciz	"powerpc_sysv"
	.asciz	"powerpc_sysv_altivec"
	.asciz	"powerpc_aix"
	.asciz	"powerpc_aix_altivec"
	.asciz	"wasm_mvp"
	.asciz	"arc_sysv"
	.asciz	"bpf_std"
	.asciz	"csky_sysv"
	.asciz	"csky_interrupt"
	.asciz	"hexagon_sysv"
	.asciz	"hexagon_sysv_hvx"
	.asciz	"lanai_sysv"
	.asciz	"loongarch64_lp64"
	.asciz	"loongarch32_ilp32"
	.asciz	"m68k_sysv"
	.asciz	"m68k_gnu"
	.asciz	"m68k_rtd"
	.asciz	"m68k_interrupt"
	.asciz	"msp430_eabi"
	.asciz	"or1k_sysv"
	.asciz	"propeller_sysv"
	.asciz	"s390x_sysv"
	.asciz	"s390x_sysv_vx"
	.asciz	"ve_sysv"
	.asciz	"xcore_xs1"
	.asciz	"xcore_xs2"
	.asciz	"xtensa_call0"
	.asciz	"xtensa_windowed"
	.asciz	"amdgcn_device"
	.asciz	"amdgcn_cs"
	.asciz	"@typeInfo(builtin.CallingConvention).@\"union\".tag_type.?"
	.asciz	"auto"
	.asciz	"async"
	.asciz	"naked"
	.asciz	"inline"
	.asciz	"avr_gnu"
	.asciz	"avr_builtin"
	.asciz	"avr_signal"
	.asciz	"avr_interrupt"
	.asciz	"amdgcn_kernel"
	.asciz	"nvptx_device"
	.asciz	"nvptx_kernel"
	.asciz	"spirv_device"
	.asciz	"spirv_kernel"
	.asciz	"spirv_fragment"
	.asciz	"spirv_vertex"
	.asciz	"builtin.CallingConvention.c"
	.asciz	"apple_m1"
	.asciz	"Target.aarch64.cpu.apple_m1"
	.asciz	"push_const_stencil"
	.asciz	"stencils.push_const_stencil"
	.asciz	"add_stencil"
	.asciz	"stencils.add_stencil"
	.asciz	"sub_stencil"
	.asciz	"stencils.sub_stencil"
	.asciz	"mul_stencil"
	.asciz	"stencils.mul_stencil"
	.asciz	"div_stencil"
	.asciz	"stencils.div_stencil"
	.asciz	"neg_stencil"
	.asciz	"stencils.neg_stencil"
	.asciz	"pop_return_stencil"
	.asciz	"stencils.pop_return_stencil"
	.asciz	"void"
	.asciz	"ctx"
	.asciz	"*stencils.Context"
	.asciz	"stencils.Context"
	.asciz	"stack"
	.asciz	"sp"
	.asciz	"value"
	.asciz	"b"
	.asciz	"a"
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	16
	.long	16
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	0
	.long	2
	.long	3
	.long	4
	.long	6
	.long	-1
	.long	-1
	.long	8
	.long	-1
	.long	10
	.long	-1
	.long	-1
	.long	11
	.long	-1
	.long	13
	.long	14
	.long	105629200
	.long	-1688851104
	.long	-952098559
	.long	-1648155598
	.long	1510122483
	.long	-990364509
	.long	134633444
	.long	692826212
	.long	811901847
	.long	-961360265
	.long	-1272867559
	.long	1926106028
	.long	-1666031780
	.long	559442734
	.long	-1546956145
	.long	-552161889
.set Lset46, LNames12-Lnames_begin
	.long	Lset46
.set Lset47, LNames6-Lnames_begin
	.long	Lset47
.set Lset48, LNames1-Lnames_begin
	.long	Lset48
.set Lset49, LNames5-Lnames_begin
	.long	Lset49
.set Lset50, LNames7-Lnames_begin
	.long	Lset50
.set Lset51, LNames13-Lnames_begin
	.long	Lset51
.set Lset52, LNames8-Lnames_begin
	.long	Lset52
.set Lset53, LNames14-Lnames_begin
	.long	Lset53
.set Lset54, LNames15-Lnames_begin
	.long	Lset54
.set Lset55, LNames9-Lnames_begin
	.long	Lset55
.set Lset56, LNames10-Lnames_begin
	.long	Lset56
.set Lset57, LNames11-Lnames_begin
	.long	Lset57
.set Lset58, LNames2-Lnames_begin
	.long	Lset58
.set Lset59, LNames0-Lnames_begin
	.long	Lset59
.set Lset60, LNames3-Lnames_begin
	.long	Lset60
.set Lset61, LNames4-Lnames_begin
	.long	Lset61
LNames12:
	.long	4263
	.long	1
	.long	4067
	.long	0
LNames6:
	.long	4164
	.long	1
	.long	3848
	.long	0
LNames1:
	.long	391
	.long	1
	.long	234
	.long	0
LNames5:
	.long	4143
	.long	1
	.long	3775
	.long	0
LNames7:
	.long	4176
	.long	1
	.long	3848
	.long	0
LNames13:
	.long	4275
	.long	1
	.long	4067
	.long	0
LNames8:
	.long	4197
	.long	1
	.long	3921
	.long	0
LNames14:
	.long	4296
	.long	1
	.long	4125
	.long	0
LNames15:
	.long	4315
	.long	1
	.long	4125
	.long	0
LNames9:
	.long	4209
	.long	1
	.long	3921
	.long	0
LNames10:
	.long	4230
	.long	1
	.long	3994
	.long	0
LNames11:
	.long	4242
	.long	1
	.long	3994
	.long	0
LNames2:
	.long	4084
	.long	1
	.long	3717
	.long	0
LNames0:
	.long	377
	.long	1
	.long	234
	.long	0
LNames3:
	.long	4103
	.long	1
	.long	3717
	.long	0
LNames4:
	.long	4131
	.long	1
	.long	3775
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	1
	.long	0
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	1
	.long	0
	.long	12
	.long	0
	.long	1
	.short	1
	.short	6
	.long	-1
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712
	.short	1
	.short	0
	.long	24
	.long	49
	.long	20
	.long	0
	.long	3
	.short	1
	.short	6
	.short	3
	.short	5
	.short	4
	.short	11
	.long	0
	.long	2
	.long	4
	.long	6
	.long	8
	.long	10
	.long	12
	.long	16
	.long	-1
	.long	-1
	.long	18
	.long	20
	.long	22
	.long	24
	.long	-1
	.long	26
	.long	30
	.long	32
	.long	33
	.long	35
	.long	37
	.long	39
	.long	43
	.long	46
	.long	5863824
	.long	1001356800
	.long	899388697
	.long	-540490047
	.long	5863826
	.long	-72470246
	.long	890937675
	.long	2088866883
	.long	193506244
	.long	-756291252
	.long	-1213202699
	.long	-17029187
	.long	-1746184330
	.long	-1680398602
	.long	-1605296698
	.long	-835581370
	.long	1483373119
	.long	-1542520665
	.long	2089849066
	.long	-1862829942
	.long	-1325941877
	.long	-594775205
	.long	1067405604
	.long	-285621220
	.long	277156213
	.long	-2084562603
	.long	2090838615
	.long	-1194332209
	.long	-1091758585
	.long	-802481017
	.long	193493176
	.long	808000144
	.long	2090120081
	.long	599991834
	.long	-835578718
	.long	219141787
	.long	-1066858773
	.long	5863820
	.long	193426652
	.long	5863821
	.long	601724157
	.long	-1459045939
	.long	-1015088947
	.long	5863822
	.long	-1578612786
	.long	-45967410
	.long	5863823
	.long	193506143
	.long	-1640857721
.set Lset62, Ltypes16-Ltypes_begin
	.long	Lset62
.set Lset63, Ltypes3-Ltypes_begin
	.long	Lset63
.set Lset64, Ltypes45-Ltypes_begin
	.long	Lset64
.set Lset65, Ltypes11-Ltypes_begin
	.long	Lset65
.set Lset66, Ltypes14-Ltypes_begin
	.long	Lset66
.set Lset67, Ltypes29-Ltypes_begin
	.long	Lset67
.set Lset68, Ltypes39-Ltypes_begin
	.long	Lset68
.set Lset69, Ltypes36-Ltypes_begin
	.long	Lset69
.set Lset70, Ltypes1-Ltypes_begin
	.long	Lset70
.set Lset71, Ltypes32-Ltypes_begin
	.long	Lset71
.set Lset72, Ltypes43-Ltypes_begin
	.long	Lset72
.set Lset73, Ltypes48-Ltypes_begin
	.long	Lset73
.set Lset74, Ltypes24-Ltypes_begin
	.long	Lset74
.set Lset75, Ltypes6-Ltypes_begin
	.long	Lset75
.set Lset76, Ltypes26-Ltypes_begin
	.long	Lset76
.set Lset77, Ltypes27-Ltypes_begin
	.long	Lset77
.set Lset78, Ltypes20-Ltypes_begin
	.long	Lset78
.set Lset79, Ltypes33-Ltypes_begin
	.long	Lset79
.set Lset80, Ltypes12-Ltypes_begin
	.long	Lset80
.set Lset81, Ltypes35-Ltypes_begin
	.long	Lset81
.set Lset82, Ltypes10-Ltypes_begin
	.long	Lset82
.set Lset83, Ltypes8-Ltypes_begin
	.long	Lset83
.set Lset84, Ltypes31-Ltypes_begin
	.long	Lset84
.set Lset85, Ltypes17-Ltypes_begin
	.long	Lset85
.set Lset86, Ltypes7-Ltypes_begin
	.long	Lset86
.set Lset87, Ltypes37-Ltypes_begin
	.long	Lset87
.set Lset88, Ltypes46-Ltypes_begin
	.long	Lset88
.set Lset89, Ltypes44-Ltypes_begin
	.long	Lset89
.set Lset90, Ltypes42-Ltypes_begin
	.long	Lset90
.set Lset91, Ltypes47-Ltypes_begin
	.long	Lset91
.set Lset92, Ltypes5-Ltypes_begin
	.long	Lset92
.set Lset93, Ltypes21-Ltypes_begin
	.long	Lset93
.set Lset94, Ltypes2-Ltypes_begin
	.long	Lset94
.set Lset95, Ltypes19-Ltypes_begin
	.long	Lset95
.set Lset96, Ltypes9-Ltypes_begin
	.long	Lset96
.set Lset97, Ltypes25-Ltypes_begin
	.long	Lset97
.set Lset98, Ltypes34-Ltypes_begin
	.long	Lset98
.set Lset99, Ltypes4-Ltypes_begin
	.long	Lset99
.set Lset100, Ltypes13-Ltypes_begin
	.long	Lset100
.set Lset101, Ltypes40-Ltypes_begin
	.long	Lset101
.set Lset102, Ltypes18-Ltypes_begin
	.long	Lset102
.set Lset103, Ltypes0-Ltypes_begin
	.long	Lset103
.set Lset104, Ltypes22-Ltypes_begin
	.long	Lset104
.set Lset105, Ltypes30-Ltypes_begin
	.long	Lset105
.set Lset106, Ltypes15-Ltypes_begin
	.long	Lset106
.set Lset107, Ltypes38-Ltypes_begin
	.long	Lset107
.set Lset108, Ltypes28-Ltypes_begin
	.long	Lset108
.set Lset109, Ltypes23-Ltypes_begin
	.long	Lset109
.set Lset110, Ltypes41-Ltypes_begin
	.long	Lset110
Ltypes16:
	.long	620
	.long	1
	.long	764
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	323
	.long	1
	.long	194
	.short	4
	.byte	0
	.long	0
Ltypes45:
	.long	3799
	.long	1
	.long	2074
	.short	4
	.byte	0
	.long	0
Ltypes11:
	.long	538
	.long	1
	.long	677
	.short	19
	.byte	0
	.long	0
Ltypes14:
	.long	573
	.long	1
	.long	757
	.short	36
	.byte	0
	.long	0
Ltypes29:
	.long	1996
	.long	1
	.long	1804
	.short	4
	.byte	0
	.long	0
Ltypes39:
	.long	2813
	.long	1
	.long	3486
	.short	4
	.byte	0
	.long	0
Ltypes36:
	.long	2336
	.long	1
	.long	3397
	.short	19
	.byte	0
	.long	0
Ltypes1:
	.long	87
	.long	1
	.long	150
	.short	36
	.byte	0
	.long	0
Ltypes32:
	.long	2149
	.long	1
	.long	1966
	.short	19
	.byte	0
	.long	0
Ltypes43:
	.long	3166
	.long	1
	.long	3644
	.short	19
	.byte	0
	.long	0
Ltypes48:
	.long	4370
	.long	1
	.long	4186
	.short	19
	.byte	0
	.long	0
Ltypes24:
	.long	1187
	.long	1
	.long	1542
	.short	19
	.byte	0
	.long	0
Ltypes6:
	.long	416
	.long	1
	.long	282
	.short	19
	.byte	0
	.long	0
Ltypes26:
	.long	1457
	.long	1
	.long	1064
	.short	4
	.byte	0
	.long	0
Ltypes27:
	.long	1733
	.long	1
	.long	1587
	.short	4
	.byte	0
	.long	0
Ltypes20:
	.long	1041
	.long	1
	.long	1401
	.short	19
	.byte	0
	.long	0
Ltypes33:
	.long	2191
	.long	1
	.long	2045
	.short	19
	.byte	0
	.long	0
Ltypes12:
	.long	560
	.long	1
	.long	718
	.short	19
	.byte	0
	.long	0
Ltypes35:
	.long	2271
	.long	1
	.long	3378
	.short	19
	.byte	0
	.long	0
Ltypes10:
	.long	520
	.long	1
	.long	668
	.short	15
	.byte	0
	.long	0
Ltypes8:
	.long	450
	.long	1
	.long	320
	.short	36
	.byte	0
	.long	0
Ltypes31:
	.long	2088
	.long	1
	.long	1908
	.short	19
	.byte	0
	.long	0
Ltypes17:
	.long	961
	.long	1
	.long	786
	.short	19
	.byte	0
	.long	0
Ltypes7:
	.long	444
	.long	1
	.long	313
	.short	36
	.byte	0
	.long	0
Ltypes37:
	.long	2451
	.long	1
	.long	3427
	.short	19
	.byte	0
	.long	0
Ltypes46:
	.long	4343
	.long	1
	.long	4170
	.short	36
	.byte	0
	.long	0
Ltypes44:
	.long	3214
	.long	1
	.long	3673
	.short	4
	.byte	0
	.long	0
Ltypes42:
	.long	2999
	.long	1
	.long	3574
	.short	4
	.byte	0
	.long	0
Ltypes47:
	.long	4352
	.long	1
	.long	4177
	.short	15
	.byte	0
	.long	0
Ltypes5:
	.long	387
	.long	1
	.long	259
	.short	36
	.byte	0
	.long	0
Ltypes21:
	.long	1094
	.long	1
	.long	1464
	.short	19
	.byte	0
	.long	0
Ltypes2:
	.long	283
	.long	1
	.long	172
	.short	36
	.byte	0
	.long	0
Ltypes19:
	.long	1015
	.long	1
	.long	1371
	.short	19
	.byte	0
	.long	0
Ltypes9:
	.long	503
	.long	1
	.long	342
	.short	19
	.byte	0
	.long	0
Ltypes25:
	.long	1218
	.long	1
	.long	804
	.short	4
	.byte	0
	.long	0
Ltypes34:
	.long	2225
	.long	1
	.long	2600
	.short	23
	.byte	0
	.long	0
Ltypes4:
	.long	342
	.long	1
	.long	227
	.short	36
	.byte	0
	.long	0
Ltypes13:
	.long	569
	.long	1
	.long	748
	.short	15
	.byte	0
	.long	0
Ltypes40:
	.long	2873
	.long	1
	.long	3538
	.short	36
	.byte	0
	.long	0
Ltypes18:
	.long	985
	.long	1
	.long	1319
	.short	23
	.byte	0
	.long	0
Ltypes0:
	.long	63
	.long	1
	.long	57
	.short	4
	.byte	0
	.long	0
Ltypes22:
	.long	1139
	.long	1
	.long	1494
	.short	19
	.byte	0
	.long	0
Ltypes30:
	.long	2016
	.long	1
	.long	1885
	.short	36
	.byte	0
	.long	0
Ltypes15:
	.long	604
	.long	1
	.long	382
	.short	4
	.byte	0
	.long	0
Ltypes38:
	.long	2762
	.long	1
	.long	3457
	.short	19
	.byte	0
	.long	0
Ltypes28:
	.long	1744
	.long	1
	.long	1782
	.short	36
	.byte	0
	.long	0
Ltypes23:
	.long	1175
	.long	1
	.long	1535
	.short	36
	.byte	0
	.long	0
Ltypes41:
	.long	2947
	.long	1
	.long	3545
	.short	19
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
