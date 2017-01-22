@thumb
;0002f740


	cmp r0, #0x89
	beq	meti
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
	cmp r0, #0x2F	;0x8A
	beq	nine
	cmp r0, #55	;0xC1
	beq	ten
	ldr	r1, =$0802f760
	mov pc, r1
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
	b merge
nine:
	mov	r1, #0x80
	lsl r1, r1, #1
	b merge
ten:
	mov	r1, #0x80
	lsl r1, r1, #2
merge:
	lsl	r1, r1, #24
	ldr	r0, [r4, #56]
	orr	r0, r1
	str	r0, [r4, #56]
	mov	r0, r4
ldr	r1, =$080186a8
mov	lr, r1
	mov	r1, r7
	@dcw $F800
	ldr	r0, =$081D
	ldr	r1, =$0802f858
	mov pc, r1
meti:
	ldr	r0, [r4, #12]
	mov	r1, #128
	lsl	r1, r1, #6
	orr	r0, r1
	str	r0, [r4, #12]
	mov	r0, r4
ldr	r1, =$0802f750
mov pc, r1