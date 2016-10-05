;531D8>

;part1
	ldr	r0, [r5, #92]
bl	$0805af10
	mov	r1, #1
	sub	r0, r0, #1
	neg	r0, r0
	and	r0, r1
	ldr	r1, =$0203E14E
	cmp	r0, #0
	beq	number1
	lsl	r0, r0, #1
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #1
	add	r0, r0, #1
	lsl	r0, r0, #1
	b	number2
number1
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #2
number2
	ldr	r1, =$0203AB20	;(勝手な太陽フラグ)
	add	r0, r0, r1
	ldrb	r1, [r0, #0]
	cmp	r1, #1
	bne	number7
	mov	r1, #0
	strb	r1, [r0]
	b	number8
number7
	mov	r1, #0
	b	number9
number8
	ldr	r1, =$08E48841		;次の処理の先頭
number9
	str	r1, [r5, #12]
	mov	r0, r5
	ldr	r1, =$080531F0
	mov	pc, r1





;(E48841)

	push	{r4, r5, r6, r7, lr}
	mov	r6, r0
	ldrh	r0, [r6, #44]
	add	r0, #1
	mov	r7, #0
	strh	r0, [r6, #44]
	lsl	r0, r0, #16
	asr	r0, r0, #16
	mov	r2, #46
	ldsh	r1, [r6, r2]
	cmp	r0, #10
	ble	number19
	ldr	r4, =$0203e14e
	ldr	r0, [r6, #92]
bl	$0805af10
	lsl	r0, r0, #1
	add	r0, r0, r4
	mov	r1, #0
	ldsh	r5, [r0, r1]
	add	r4, r5, #1
	lsl	r4, r4, #16
	asr	r4, r4, #16
	ldr	r0, [r6, #92]
bl	$0805af10
	lsl	r5, r5, #1
	add	r5, r5, r0
	mov	r0, r5
bl	$08059890
	lsl	r0, r0, #16
	asr	r0, r0, #16
	str	r0, [r6, #76]
	ldr	r0, [r6, #92]
bl	$0805af10
	lsl	r4, r4, #1
	add	r4, r4, r0
	mov	r0, r4
bl	$08059890
	lsl	r0, r0, #16
	asr	r0, r0, #16
	str	r0, [r6, #80]
	strh	r7, [r6, #44]
	ldr	r1, [r6, #76]
	strh	r1, [r6, #46]
	str	r7, [r6, #84]
	str	r7, [r6, #88]
	cmp	r1, r0
	bne	number11
	mov	r0, #1
	str	r0, [r6, #88]
number11
	ldr	r1, [r6, #76]
	ldr	r0, [r6, #80]
	cmp	r1, r0
	ble	number12
	mov	r0, #1
	neg	r0, r0
	b	number13

number12
	mov	r0, #1
number13
	str	r0, [r6, #72]
	mov	r0, r6
;攻撃後回復に繋げる処理
		mov	r1, #0
		mov	r0, #41
		strb	r1, [r6, r0]
		ldr	r1, =$0805351D
		str	r1, [r6, #12]
	ldr	r0, [r6, #92]
bl	$0805af10
	ldr	r1, =$02017780
	lsl	r0, r0, #1
	add	r0, r0, r1
	mov	r1, #2
	strh	r1, [r0, #0]

number19
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0





;太陽フラグ(594bc>攻めリザイア)
	mov	r0, r10
	lsl	r0, r0, #1
	add	r0, #1
	lsl	r0, r0, #1
	add	r0, r0, r6
	strh	r1, [r0]	;ここまでは従来の仕事
	ldr	r6, =$0203AB20
	mov	r0, r9
;	lsl	r0, r0, #0
	lsl	r0, r0, #2
;	lsl	r0, r0, #0
	add	r0, r0, r6
	mov	r1, #1
	strh	r1, [r0]
	ldr	r0, =$080595C6
	mov	pc, r0



;(59456>返しリザイア)
	mov	r0, r9
	lsl	r0, r0, #2
	add	r0, r0, r6
	strh	r1, [r0]
	ldr	r6, =$0203AB20	;勝手なリザイア
	mov	r0, r10
;	
;
	lsl	r0, r0, #1
	add	r0, #1
	lsl	r0, r0, #1
	add	r0, r0, r6
	mov	r1, #1
	strh	r1, [r0]
	ldr	r0, =$0805950C
	mov	pc, r0



;(2B666 > )
;フラグ初期化
	mov	r0, #0
	ldr	r1, =$0203AB20
	str	r0, [r1]
	str	r0, [r1, #4]
	str	r0, [r1, #8]
	str	r0, [r1, #12]
	str	r0, [r1, #16]
	str	r0, [r1, #20]
	str	r0, [r1, #24]
	str	r0, [r1, #28]
;太陽発動分岐
	ldr	r0, =$0203A4D0
	ldrb	r0, [r0, #4]
	cmp	r0, #0
	beq	buki
	ldr	r0, [r5, #4]
	ldrb	r0, [r0, #4]
	cmp	r0, #7		;太陽クラス
	beq	taiyo
buki
	ldrh	r0, [r7, #0]
	bl	$080174cc
	cmp	r0, #2
	beq	rizaia
hazure
	ldr	r0, =$0802b6a2
	mov	pc, r0
taiyo
	mov	r0, #21
	ldsb	r0, [r5, r0]
	mov	r1, #0
	bl	$0802a490
	lsl	r0, r0, #13
	asr	r0, r0, #13
	cmp	r0, #1
	bne	buki
	ldr	r3, [r6, #0]
	ldr	r2, [r3, #0]
	lsl	r1, r2, #13
	lsr	r1, r1, #13
	ldr	r0, =$00010000
	orr	r1, r0
	ldr	r0, =$FFF80000
	and	r0, r2
	orr	r0, r1
	str	r0, [r3, #0]
rizaia
	ldr	r0, =$0802B670
	mov	pc, r0