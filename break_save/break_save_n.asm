@thumb
;@org $080a9dfa
	mov	r3, sp
	mov r0, #0
	strb	r0, [r3, #23]
	str	r0, [r3, #24]
	ldr	r2, [r3, #4]
	lsl r2, r2, #20
	lsr r2, r2, #20
	ldrb	r0, [r7, #20] ; 力
	lsl	r0, r0, #12
	orr r2, r0
	ldrb	r0, [r7, #21] ; 技
	lsl	r0, r0, #18
	orr r2, r0
	ldrb	r0, [r7, #22] ; 速さ
	lsl	r0, r0, #24
	orr r2, r0
	ldrb	r1, [r7, #23] ; 守備
	lsl	r0, r1, #30
	orr r2, r0
	str	r2, [r3, #4]
	lsr	r2, r1, #2
	ldrb	r0, [r7, #24] ; 魔防
	lsl	r0, r0, #4
	orr r2, r0
	ldrb	r0, [r7, #25] ; 幸運
	lsl	r0, r0, #10
	orr r2, r0
	str	r2, [r3, #8]

	ldrb	r0, [r7, #18] ;HP
	ldrb	r1, [r7, #26] ;体格
	lsr	r1, r1, #5
	lsl	r1, r1, #7
	orr	r0, r1
	strb	r0, [r3, #27]
	
	mov r0, #0x3B
	ldrb	r0, [r7, r0]
	strb	r0, [r3, #28]
	
	
	mov r1, #1
	neg	r1, r1
	mov	r2, #0
	mov	r5, r7
	add	r5, #40
	mov	r4, r3
	add	r4, #23
loop:
	add	r1, #1
	cmp	r1, #8
	beq	end
	ldrb	r0, [r5, r1]
	cmp	r0, #0
	beq	loop
	strb	r0, [r4, r2]
	cmp	r2, #3
	beq	three
	cmp	r2, #2
	beq	two
	cmp	r2, #1
	beq	one
zero:
	strb	r1, [r3, #21]
	add	r2, #1
	b	loop
one:
	ldrb	r0, [r3, #21]
	lsl	r1, r1, #4
	orr r1, r0
	strb	r1, [r3, #21]
	lsr	r1, r1, #4
	add	r2, #1
	b	loop
two:
	strb	r1, [r3, #22]
	add	r2, #1
	b	loop
three:
	ldrb	r0, [r3, #22]
	lsl	r1, r1, #4
	orr r1, r0
	strb	r1, [r3, #22]
end:
	mov	r1, #1
	mov	r12, r1
	mov	r0, #15
	mov	r8, r0
	mov	r6, #63
	mov	r5, #31
	mov	r4, r9