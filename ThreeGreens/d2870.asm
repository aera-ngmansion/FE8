@thumb
@org	$080d2870
	ldr	r0, =$089CDD18
	lsl	r3, r1, #1
	add	r3, r3, r0
	ldr	r0, [r5, #4]
	ldrb	r0, [r0, #5]
	ldrb	r6, [r3]
	cmp	r0, r6
	beq	$080d2896
	ldrb	r6, [r3, #1]
	cmp	r0, r6
	beq	$080d2896
three
	strb	r0, [r2, #0]
	b	$080d289e