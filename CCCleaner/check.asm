@thumb
	push {lr}
	mov r2, r0
	lsl r0, r1, #24
	lsr	r0, r0, #24
	cmp r0, #0x89
	beq meti
	b scroll
meti:
	ldr	r0, [r2, #12]
	mov	r1, #128
	lsl	r1, r1, #6
	and	r0, r1
	cmp	r0, #0
	bne	aruyo
	b	naiyo
scroll:
	ldr	r1, =$080174E4
	mov lr, r1
	@dcw $F800
	cmp r0, #0x19
	beq	one
	cmp r0, #0x1A
	beq	two
	cmp r0, #0x1B
	beq	three
	cmp r0, #0x1C
	beq	four
	cmp r0, #0x1D
	beq	five
	cmp r0, #0x30
	beq	six
	cmp r0, #0x31
	beq	seven
	cmp r0, #0x32
	beq	eight
	b	aruyo
one:
	mov	r1, #0x1
	b merge
two:
	mov	r1, #0x2
	b merge
three:
	mov	r1, #0x4
	b merge
four:
	mov	r1, #0x8
	b merge
five:
	mov	r1, #0x10
	b merge
six:
	mov	r1, #0x20
	b merge
seven:
	mov	r1, #0x40
	b merge
eight:
	mov	r1, #0x80
merge:
	lsl	r1, r1, #24
	ldr	r0, [r2, #56]
	and	r0, r1
	beq naiyo
aruyo:
	mov r0, #1
	b end
naiyo:
	mov r0, #0
end:
	pop {pc}