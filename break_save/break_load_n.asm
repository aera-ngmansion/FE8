@thumb
;aa200
mov	r6, sp

	ldr	r2, [r6, #4]
	lsl	r0, r2, #14
	lsr	r0, r0, #26
	strb	r0, [r4, #20]
	lsl	r0, r2, #8
	lsr	r0, r0, #26
	strb	r0, [r4, #21]
	lsl	r0, r2, #2
	lsr	r0, r0, #26
	strb	r0, [r4, #22]
	lsr	r1, r2, #30
	ldr	r2, [r6, #8]
	lsl r0, r2, #28
	lsr r0, r0, #26
	orr r0, r1
	strb	r0, [r4, #23]
	
	lsl	r0, r2, #22
	lsr	r0, r0, #26
	strb	r0, [r4, #24]
	lsl	r0, r2, #16
	lsr	r0, r0, #26
	strb	r0, [r4, #25]
	lsl	r0, r2, #11
	lsr	r0, r0, #27
	
	ldrb	r2, [r6, #27]
	lsr	r1, r2, #7
	lsl	r1, r1, #5
	orr r0, r1
	strb	r0, [r4, #26]
	lsl r0, r2 #25
	lsr r0, r0 #25
	strb	r0, [r4, #18]
	
	ldrb	r0, [r6, #28]
	mov r1, #0x3B
	strb	r0, [r4, r1]
	
	
	mov	r5, r4
	add	r5, #40
	
	ldrb	r2, [r6, #21]
	lsl	r2, r2, #28
	lsr	r2, r2, #28
	ldrb	r0, [r6, #23]
	strb	r0, [r5, r2]
	
	ldrb	r2, [r6, #21]
	lsl	r2, r2, #24
	lsr	r2, r2, #28
	ldrb	r0, [r6, #24]
	cmp	r0, #0
	beq	end
	strb	r0, [r5, r2]

	ldrb	r2, [r6, #22]
	lsl	r2, r2, #28
	lsr	r2, r2, #28
	ldrb	r0, [r6, #25]
	cmp	r0, #0
	beq	end
	strb	r0, [r5, r2]

	ldrb	r2, [r6, #22]
	lsl	r2, r2, #24
	lsr	r2, r2, #28
	ldrb	r0, [r6, #26]
	cmp	r0, #0
	beq	end
	strb	r0, [r5, r2]
end:
mov	r5, #1
	ldr	r0, =$080aa254
	mov pc, r0