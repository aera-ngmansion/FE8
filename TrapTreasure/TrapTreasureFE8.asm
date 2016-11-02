@thumb
@org	$0808651a

	mov	r0, sp
	ldrb	r0, [r0, #24]
	lsl	r0, r0, #24
	asr	r0, r0, #24
	mov	r1, sp
	ldrb	r1, [r1, #25]
	lsl	r1, r1, #24
	asr	r1, r1, #24
	bl	$0802e468
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	bl	$0800d568
	
	mov	r0, sp
	mov	r1, #1
	bl	$080851b8
	
	b	$080865a4
	nop
	nop
	nop
	nop
	nop
	nop