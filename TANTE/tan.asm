@thumb
	
	ldr	r0, =$0203a4d0
	ldrh	r1, [r0, #0]
	mov	r0, #2
	and	r0, r1
	cmp	r0, #0
	bne	normal	;予測ならノーマル
	mov	r0, #0x50
	ldrb	r0, [r7, r0]
	cmp	r0, #4
	ble	denai
	cmp	r0, #8
	bge	denai
	mov	r0, #1
	b	osoba
denai:
	mov	r0, #0
osoba:
	mov	r1, r8
	bl	SHIELD
	cmp	r0, #0
	beq	normal
	cmp	r1, #255
	beq	normal	;壊れないならジャンプ
	
	add	r1, r8
	ldrb	r2 [r1, #1]
	cmp	r2,	#0
	beq	KOWARE
	sub	r2, #1
	strb	r2 [r1, #1]
	b	normal
KOWARE
	sub	r4, r4, r0
normal:
	ldr	r0, =$0802b3b8
	mov	pc, r0
	
	
	
	
	
	
	
	
;盾装備判定
	
SHIELD:
	push	{r4, r5, r6, lr}
	mov	r5, r0 ;魔法判定
	mov	r4, r1 ;相手ステータス
	@align 4
	ldr	r6 [adr]

	mov	r3, #28
TATE_loop:
	add	r3, #2
	cmp	r3, #40
	beq	naiyo
	
	ldrh	r0, [r4, r3]
	cmp	r0, #0
	beq	TATE_loop
	ldr	r1, =$08017314
	mov	lr, r1
	@dcw $F800
	mov	r2, r1
	mov	r1, r0
	lsl	r0, r1, #6	;盾パッチの下
	bmi	TATEkamo
	b	TATE_loop
	
naiyo:
	mov	r0, #0
	mov	r1, #0
	b	end
	
	
	
TATEkamo:
	lsl	r0, r1, #5	;盾パッチの2下
	bmi	CLASSN
	b	MAGI

CLASSN:

	ldr	r0, [r4, #4]
	ldrb	r0, [r0, #4]
CALN_loop:
	ldrb	r1 [r6]
	cmp	r1, #0
	beq	TATE_loop
	cmp	r0, r1
	beq	MAGI
	add	r6, #1
	b	CALN_loop
	
MAGI:
	ldr	r0, [r2, #12]
	add	r0, #4
	ldrb	r0, [r0, r5]
	ldr	r2, [r2, #8]
	lsl	r2, r2, #28
	bpl	kowareru
	mov	r3, #255
kowareru:
	mov	r1, r3
	
end:
	pop	{r4, r5, r6, pc}
	
	
@ltorg
adr: