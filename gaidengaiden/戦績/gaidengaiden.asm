@thumb

@org	$080bc37c
	ldrb	r1, [r0, #0xF]
	add	r0, #0x80
	ldrb	r0, [r0]
	lsr	r2, r0, #1
	cmp	r1, #0
	bne	iden
	cmp	r0, #0
	beq	first
	cmp	r0, #0xFF
	beq	last
	lsl	r0, r0, #31
	lsr	r0, r0, #31
	bne	gaiden
	b	$080bc4ac	;章
first
	b	$080bc428	;序章
gaiden
	b	$080bc468	;章外伝
iden
	b	$080bc47e	;章異伝
last
	b	$080bc42c	;終章

@org	$080bc47c
	b	$080bc4c0
	lsl	r4, r6, #5
	sub	r0, r4, #1
	add	r0, #6
	lsl	r0, r0, #1
	ldr	r5, [$080bc4a4+4]
	add	r0, r0, r5
	mov	r1, #2
	bl	$08004a90
	mov	r0, #229
	b	$080bc4c0