@thumb
;0002aec0

	ldr	r0, [sp, #0]
	bl HASON
	ldr	r0, [sp, #4]
	bl HASON
	
	ldr	r0, =$0203a604
	ldr	r3, [r0, #0]
	ldr	r1, [r3, #0]
	lsl	r1, r1, #8
	ldr	r0, =$0802aec8
	mov	pc, r0
	
HASON:
	push	{lr}
	mov	r2, r0
	
	mov	r3, #28
HASON_loop:
	add	r3, #2
	cmp	r3, #40
	beq	naiyo
	
	ldrh	r0, [r2, r3]
	cmp	r0, #0
	beq	HASON_loop
	lsr	r1, r0, #8
	bne	HASON_loop
	ldr	r1, =$08017314
	mov	lr, r1
	@dcw $F800
	lsl	r0, r0, #28	;
	bmi	HASON_loop
	mov	r0, #0
	strh	r0, [r2, r3]
	b	HASON_loop
naiyo:
	pop	{pc}
	
	
	