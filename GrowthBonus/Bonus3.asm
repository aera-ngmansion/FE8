@thumb
;@org 0002b9e6
	bl	RED10

	ldr	r5, [r7]
	add	r5, #28
	mov	r6, #0
	add	r7, #115
saihan:
	mov	r4, #0
loopin:
	ldrb	r0, [r5, r4]
	add	r0, r10
	
	mov r2, #7
	sub r2, r2, r4
	lsl	r2, r2, #2
	mov r1, r9
	lsl	r1, r2
	lsr	r1, r1, #27
	add	r0, r0, r1
	lsl	r1, r1, #2
	add	r0, r0, r1
	
ldr	r1, =$0802b8e8
mov	lr, r1
@dcw	$F800
	
	

	strb	r0, [r7, r4]
	ldsb	r0, [r7, r4]
	add	r6, r6, r0
	add	r4, #1
	cmp	r4, #6
	ble loopin
;魔力
	ldrb	r0, [r5, #23]
	cmp	r0, #0
	beq	nonmag
	add	r0, r10
	mov r1, r9
	lsr	r1, r1, #27
	add	r0, r0, r1
	lsl	r1, r1, #2
	add	r0, r0, r1
	
ldr	r1, =$0802b8e8
mov	lr, r1
@dcw	$F800
	strb	r0, [r7, r4]
	ldsb	r0, [r7, r4]
	add	r6, r6, r0
nonmag:

	cmp	r6, #1
	ble	saihan
	sub	r7, #115
	ldr	r0, =$0802bb28
	mov	pc, r0
	
	
RED10:
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
	mov	r2, #0x2
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
		
	cmp	r1, #0x60	;竜の盾
	bne		jump6
	mov	r2, #0x1
	lsl	r2, r2, #16
	add	r0, r0, r2
jump6
	
	cmp	r1, #0x61	;魔除け
	bne		jump7
	mov	r2, #0x1
	lsl	r2, r2, #20
	add	r0, r0, r2
jump7
	cmp	r1, #0x5F	;女神の像
	bne		jump5
	mov	r2, #0x2
	lsl	r2, r2, #24
	add	r0, r0, r2
jump5
	cmp	r1, #0x63	;ボデリン
	bne		jump8
	mov	r2, #0x1
	lsl	r2, r2, #28
	add	r0, r0, r2
jump8
	add	r3, #1
	cmp	r3, #4
	ble	loop
end
	mov	r9, r0
	pop	{pc}