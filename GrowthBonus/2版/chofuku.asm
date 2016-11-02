@thumb
;@org	0002b9d2 > C0 46 00 48 87 46 XX XX XX XX

	bl	RED10
	ldr	r0, [r7, #0]
	ldrb	r0, [r0, #28]
	mov	r1, r10
	lsl	r1, r1, #28
	lsr	r1, r1, #28
	mov	r2, #20
	mul	r1, r2
	add	r0, r0, r1
ldr	r2, =$0802b8e8
mov	lr, r2
@dcw	$F800
	mov	r1, r7
	add	r1, #115
	str	r1, [sp, #0]
	strb	r0, [r1, #0]
	mov	r6, r0
;力
	ldr	r0, [r7, #0]
	ldrb	r0, [r0, #29]
	mov	r1, r10
	lsl	r1, r1, #24
	lsr	r1, r1, #28
	mov	r2, #10
	mul	r1, r2
	add	r0, r0, r1
ldr	r2, =$0802b8e8
mov	lr, r2
@dcw	$F800
	mov	r1, r7
	add	r1, #116
	str	r1, [sp, #4]
	strb	r0, [r1, #0]
	add	r6, r6, r0
;技
	ldr	r0, [r7, #0]
	ldrb	r0, [r0, #30]
	mov	r1, r10
	lsl	r1, r1, #20
	lsr	r1, r1, #28
	mov	r2, #10
	mul	r1, r2
	add	r0, r0, r1
ldr	r2, =$0802b8e8
mov	lr, r2
@dcw	$F800
	mov	r1, #117
	add	r1, r1, r7
	mov	r8, r1
	strb	r0, [r1, #0]
	add	r6, r6, r0
;速さ
	ldr	r0, [r7, #0]
	ldrb	r0, [r0, #31]
	mov	r1, r10
	lsl	r1, r1, #16
	lsr	r1, r1, #28
	mov	r2, #10
	mul	r1, r2
	add	r0, r0, r1
ldr	r2, =$0802b8e8
mov	lr, r2
@dcw	$F800
	mov	r1, #118
	add	r1, r1, r7
	mov	r9, r1
	strb	r0, [r1, #0]
	add	r6, r6, r0
;守備
	ldr	r0, [r7, #0]
	add	r0, #32
	ldrb	r0, [r0, #0]
	mov	r1, r10
	lsl	r1, r1, #8
	lsr	r1, r1, #28
	mov	r2, #10
	mul	r1, r2
	add	r0, r0, r1
ldr	r2, =$0802b8e8
mov	lr, r2
@dcw	$F800
	mov	r5, r7
	add	r5, #119
	strb	r0, [r5, #0]
	add	r6, r6, r0
;魔防
	ldr	r0, [r7, #0]
	add	r0, #33
	ldrb	r0, [r0, #0]
	mov	r1, r10
	lsl	r1, r1, #4
	lsr	r1, r1, #28
	mov	r2, #10
	mul	r1, r2
	add	r0, r0, r1
ldr	r2, =$0802b8e8
mov	lr, r2
@dcw	$F800
	mov	r4, r7
	add	r4, #120
	strb	r0, [r4, #0]
	add	r6, r6, r0
;幸運
	ldr	r0, [r7, #0]
	add	r0, #34
	ldrb	r0, [r0, #0]
	mov	r1, r10
	lsl	r1, r1, #12
	lsr	r1, r1, #28
	mov	r2, #20
	mul	r1, r2
	add	r0, r0, r1
ldr	r2, =$0802b8e8
mov	lr, r2
@dcw	$F800
	mov	r1, r7
	add	r1, #121
	strb	r0, [r1, #0]
	add	r6, r6, r0
	ldr	r0, =$0802ba8c
	mov	pc, r0

RED10
	push	{lr}
ldr	r0, =$0805BDCC
mov	lr, r0
@dcw	$F800
	cmp	r0, #1
	bne	start
	mov	r0, #0
	b	end
start
	mov	r3, #0
	mov	r0, #0
loop
	mov	r1, r7
	add	r1, #30
	lsl	r2, r3, #1
	ldrb	r1, [r1, r2]
	cmp	r1, #0
	beq	end
	cmp	r1, #0x5B	;天使の衣
	bne		jump1
	mov	r2, #0x1
	add	r0, r0, r2
jump1
	cmp	r1, #0x5C	;エナジーリング
	bne		jump2
	mov	r2, #0x1
	lsl	r2, r2, #4
	add	r0, r0, r2
jump2
	
	cmp	r1, #0x5D	;秘伝の書
	bne		jump3
	mov	r2, #0x1
	lsl	r2, r2, #8
	add	r0, r0, r2
jump3
	
	cmp	r1, #0x5E	;疾風のはね
	bne		jump4
	mov	r2, #0x1
	lsl	r2, r2, #12
	add	r0, r0, r2
jump4
	
	cmp	r1, #0x5F	;女神の像
	bne		jump5
	mov	r2, #0x1
	lsl	r2, r2, #16
	add	r0, r0, r2
jump5
	
	cmp	r1, #0x60	;竜の盾
	bne		jump6
	mov	r2, #0x1
	lsl	r2, r2, #20
	add	r0, r0, r2
jump6
	
	cmp	r1, #0x61	;魔除け
	bne		jump7
	mov	r2, #0x1
	lsl	r2, r2, #24
	add	r0, r0, r2
jump7
	add	r3, #1
	cmp	r3, #4
	ble	loop
end
	mov	r10, r0
	pop	{pc}