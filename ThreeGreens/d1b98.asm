@thumb
;000d1b7a:3E 28 > 0D E0
@org	$080d1b98

	mov	r1, r10
	ldr	r1, [r1, #4]
	ldrb	r0, [r1, #5]
	ldr	r2, =$089CDD18
	ldrb	r1, [r1, #4]
	lsl	r1, r1, #1
	add	r2, r1, r2
	ldrb	r1, [r2]
	cmp	r0, r1
	beq	$080d1c0a
	ldrb	r1, [r2, #1]
	cmp	r0, r1
	beq	$080d1c0a
	mov	r0, r10
	ldr	r0, [r0, #4]
	ldrb	r1, [r0, #5]
	strh	r1, [r5, #48]
	mov	r0, r5
	add	r0, #54
	mov	r2, r9
	bl	$080d2260
	mov	r1, r5
	add	r1, #76
	strb	r0, [r1, #0]
	mov	r0, r10
	ldr	r0, [r0, #4]
	ldrb	r0, [r0, #5]
	b	$080d1bec