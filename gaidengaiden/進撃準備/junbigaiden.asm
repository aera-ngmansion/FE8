@thumb
@org	$08098e00
	b	$08098e3a
@org	$08098e3a

	mov	r0, r4
	bl	$08034520
	add	r0, #128
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	$08098e4a
	cmp	r0, #0xFF
	beq	$08098e4a
	b	$08098e52
