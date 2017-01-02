@thumb
;@org	$080169a4 > 00 48 87 46 XX XX XX 08

	ldr	r1, =$0203a568
	cmp	r1, r4
	bne	nonchange
	ldr	r1, =$0203a4e8
nonchange

	ldr	r0, [r1, #4]
	ldr	r1, [r1, #0]
	ldr	r0, [r0, #40]
	ldr	r1, [r1, #40]
	orr	r0, r1
	lsl	r0, r0, #8
	bmi	NIHIL
;練達個人
	ldr	r1, [r4]
	ldrh	r1, [r1, #0x26]	;;ユニット0x1000練達
	lsl	r1, r1, #19
	bmi	zero
;練達兵種
	ldr	r5, =$00000000	;練達兵種指定
	cmp	r5, #0
	beq	NIHIL
	ldr	r1, [r4, #4]
	ldrb	r0, [r1, #4]
loop
	ldrb	r1, [r5]
	cmp	r0, r1
	beq	zero
	add	r5, #1
	cmp	r1,	#0
	bne	loop
NIHIL
	mov	r0, #255
	and	r0, r3
	lsl	r1, r0, #3
	add	r1, r1, r0
	ldr	r5, =$080169ac
	mov	pc, r5
zero
	mov	r0, #0
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1

;memo
;R04=0203a4e8
;R05=0203a568