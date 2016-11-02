@thumb
@org	$080977ea
	bl	$08034520
	ldrb	r0, [r0, #0xD]
	cmp	r0, #1
	beq	$080977fc
 	mov	r0, #1
	b	$080977fe