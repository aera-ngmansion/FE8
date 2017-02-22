@thumb
	add	r0, r0, r1
	push	{r0}
	push	{r5, r6}
	mov	r5, r2
	cmp	r5, #1
	bne	rope
	sub	r4, #49
rope:
	mov	r3, #28
loop:
	add	r3, #2
	cmp	r3, #40
	beq	naiyo
	
	ldrh	r0, [r4, r3]
	cmp	r0, #0
	beq	loop
	ldr	r1, =$08017314
	mov	lr, r1
	@dcw $F800
	mov	r2, r1
	mov	r1, r0
	lsl	r0, r1, #6	;盾パッチの下
	bmi	TATEkamo
	b	loop
naiyo:
	mov	r1, #0
	b	end
TATEkamo:
	ldr	r6, [r2, #16]
	cmp	r6, #0
	bne	CLASSN
	b	mikke
	
	
CLASSN:
	ldr	r0, [r4, #4]
	ldrb	r0, [r0, #4]
CALN_loop:
	ldrb	r1 [r6]
	cmp	r1, #0
	beq	loop
	cmp	r0, r1
	beq	mikke
	add	r6, #1
	b	CALN_loop
	
mikke:
	ldr	r1, [r2, #12]
	add	r1, #4
	ldrb	r1, [r1, r5]
end:
	pop	{r5, r6}
	pop	{r0}
	
	add	r0, r0, r1
	pop	{r4}
	pop	{r1}
	bx	r1
	