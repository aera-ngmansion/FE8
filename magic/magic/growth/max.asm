@thumb
	mov	r1, #26	;���Z
	ldsb	r1, [r4, r1]
	ldrb	r2, [r5, #25]	;���
	mov	r0, #25
	ldsb	r0, [r5, r0]	;���
	cmp	r1, r0
	ble	jump
	strb	r2, [r4, #26]	;���Z
jump