@thumb
;(2B666 > )
;フラグ初期化
	mov	r0, #0
	ldr	r1, =$0203AB20	;(勝手な太陽フラグ)
	str	r0, [r1]
	str	r0, [r1, #4]
	str	r0, [r1, #8]
	str	r0, [r1, #12]
	str	r0, [r1, #16]
	str	r0, [r1, #20]
	str	r0, [r1, #24]
	str	r0, [r1, #28]
	ldr	r0, =$0203A4D0
	ldrb	r0, [r0, #4]
	cmp	r0, #0
	beq	buki
;太陽発動分岐
	ldr	r0, [r5, #4]
	ldrb	r0, [r0, #4]
	cmp	r0, #$07		;太陽クラス
	beq	taiyo
	cmp	r0, #$00		;太陽クラス
	beq	taiyo
	cmp	r0, #$00		;太陽クラス
	beq	taiyo
	cmp	r0, #$00		;太陽クラス
	beq	taiyo
buki
	ldrh	r0, [r7, #0]
ldr	r1,	=$080174cc
mov	lr, r1
@dcw	$F800
	cmp	r0, #2
	beq	rizaia
hazure
	ldr	r0, =$0802b6a2
	mov	pc, r0
taiyo
	mov	r0, #21		;技(発動率)
	ldsb	r0, [r5, r0]
	mov	r1, #0
ldr	r2,	=$0802a490
mov	lr, r2
@dcw	$F800
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
	str	r0, [r3]
rizaia
	ldr	r0, =$0802B670
	mov	pc, r0