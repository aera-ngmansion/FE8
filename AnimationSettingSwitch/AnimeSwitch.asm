@thumb
@org	$0802c9d0
	push	{lr}
	ldr	r0, [adr1+4]
	add	r0, #66
	ldrb	r0, [r0]
	lsl	r0, r0, #29
	lsr	r0, r0, #30
	cmp	r0, #2
	bne	end		;個別以外は終了。オフ=1, 背景=3
;;個別の処理
	ldr	r2, [adr2]
	mov	r0, #11
	ldsb	r0, [r2, r0]
	mov	r1, #0x80
	and	r0, r1
	bne	next
	ldr	r0, [adr3]
	mov	r3, #0x0B
	ldsb	r0, [r0, r3]
	and	r0, r1
	bne	two
	ldr	r0, [adr2+4]
	b	three
next
	ldr	r2, [adr3+4]
	mov	r0, #11
	ldsb	r0, [r2, r0]
	and	r0, r1
	beq	two
	mov	r0, #1
	b	end
two
	mov	r0, r2
three
	bl	$0802c9a8
end
	ldr	r1, [adr4+4]
	ldr	r1, [r1]
	ldrh	r1, [r1, #4]
	lsl	r1, r1, #22
	bpl	nonpress
	cmp	r0, #1
	beq	jump
	mov	r0, #1
	pop	{pc}
jump
	mov	r0, #3
nonpress
	pop	{pc}
adr1	@dcd	$0202bcec
adr2	@dcd	$0203a4e8
adr3	@dcd	$0203a568
adr4	@dcd	$085775CC