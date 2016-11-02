@thumb
@org	$0802b9d2
	
	ldr	r0, [$0802bb44+4]
	mov	pc, r0
	ldr	r0, [r7, #0]
	ldrb	r0, [r0, #28]
	mov	r1, r10
	lsl	r1, r1, #31
	bpl	non1
	add	r0, #20
non1
	bl	$0802b8e8
	mov	r1, r7
	add	r1, #115
	str	r1, [sp, #0]
	strb	r0, [r1, #0]
	mov	r6, r0
;力
	ldr	r0, [r7, #0]
	ldrb	r0, [r0, #29]
	mov	r1, r10
	lsl	r1, r1, #30
	bpl	non2
	add	r0, #10
non2
	bl	$0802b8e8
	mov	r1, r7
	add	r1, #116
	str	r1, [sp, #4]
	strb	r0, [r1, #0]
	add	r6, r6, r0
;技
	ldr	r0, [r7, #0]
	ldrb	r0, [r0, #30]
	mov	r1, r10
	lsl	r1, r1, #29
	bpl	non3
	add	r0, #10
non3
	bl	$0802b8e8
	mov	r1, #117
	add	r1, r1, r7
	mov	r8, r1
	strb	r0, [r1, #0]
	add	r6, r6, r0
;速さ
	ldr	r0, [r7, #0]
	ldrb	r0, [r0, #31]
	mov	r1, r10
	lsl	r1, r1, #28
	bpl	non4
	add	r0, #10
non4
	bl	$0802b8e8
	mov	r1, #118
	add	r1, r1, r7
	mov	r9, r1
	strb	r0, [r1, #0]
	add	r6, r6, r0
;守備
	ldr	r0, [r7, #0]
	add	r0, #32
	ldrb	r0, [r0, #0]
	mov	r1, r10
	lsl	r1, r1, #26
	bpl	non6
	add	r0, #10
non6
	bl	$0802b8e8
	mov	r5, r7
	add	r5, #119
	strb	r0, [r5, #0]
	add	r6, r6, r0
;魔防
	ldr	r0, [r7, #0]
	add	r0, #33
	ldrb	r0, [r0, #0]
	mov	r1, r10
	lsl	r1, r1, #25
	bpl	non7
	add	r0, #10
non7
	bl	$0802b8e8
	mov	r4, r7
	add	r4, #120
	strb	r0, [r4, #0]
	add	r6, r6, r0
;幸運
	ldr	r0, [r7, #0]
	add	r0, #34
	ldrb	r0, [r0, #0]
	mov	r1, r10
	lsl	r1, r1, #27
	bpl	non5
	add	r0, #20
non5
	bl	$0802b8e8
	mov	r1, r7
	add	r1, #121
	strb	r0, [r1, #0]
	add	r6, r6, r0
	
;$0002bb42 > 00 BD XX XX XX XX
;XXに外部に置く用のファイルのアドレス