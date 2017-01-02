@thumb
	ldr	r0, =$0202CFD3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	zero
	mov	r0, #1
	b	end
zero
	mov	r0, #0
end
	ldr	r1, =$030004B0
	str	r0, [r1, #48]
	mov	r0, #0
	bx	lr