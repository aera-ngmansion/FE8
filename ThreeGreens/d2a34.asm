@thumb
@org	$080d2a34
	push	{r4, lr}
	ldr	r0, =$08baba58
	bl	$08002dec
	ldr	r0, [r0, #20]
	ldr	r4, [r0, #20]
	mov	r0, #56
	ldrb	r0, [r0, r4]
	bl	$08017fb0
	ldr	r1, [r0, #4]
	ldrb	r0, [r1, #5]
	ldr	r2, =$089CDD18
	ldrb	r1, [r1, #4]
	lsl	r1, r1, #1
	add	r2, r1, r2
	ldrb	r1, [r2]
	cmp	r0, r1
	beq	non
	ldrb	r1, [r2, #1]
	cmp	r0, r1
	beq	non
	mov	r0, #1		;駆け出し組
	pop	{pc,r4}
non
	mov	r0, #3
	pop	{pc,r4}