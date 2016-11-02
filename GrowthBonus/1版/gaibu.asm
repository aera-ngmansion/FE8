@thumb
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
	orr	r0, r2
jump1
	cmp	r1, #0x5C	;エナジーリング
	bne		jump2
	mov	r2, #0x2
	orr	r0, r2
jump2
	
	cmp	r1, #0x5D	;秘伝の初
	bne		jump3
	mov	r2, #0x4
	orr	r0, r2
jump3
	
	cmp	r1, #0x5E	;疾風のはね
	bne		jump4
	mov	r2, #0x8
	orr	r0, r2
jump4
	
	cmp	r1, #0x5F	;女神の像
	bne		jump5
	mov	r2, #0x10
	orr	r0, r2
jump5
	
	cmp	r1, #0x60	;竜の盾
	bne		jump6
	mov	r2, #0x20
	orr	r0, r2
jump6
	
	cmp	r1, #0x61	;魔除け
	bne		jump7
	mov	r2, #0x40
	orr	r0, r2
jump7
	add	r3, #1
	cmp	r3, #4
	ble	loop
end
	mov	r10, r0
	ldr	r0, =$$0802b9d6
	mov	pc, r0