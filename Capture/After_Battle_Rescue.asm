@thumb

;bl'd to from 328F0
;r4=defender, r6=attacker battle structs
;r7 should contain char data ptr of person dropping item, 0 if capturing; r5 has char data of receiver

	ldrb	r5,[r6,#0xB]		;attacker allegiance
	lsl	r0, r5, #24
	lsr	r0, r0, #30
	bne	Non
	ldrb	r7,[r4,#0xB]		;defender allegiance(‘Ò‚¿•š‚¹‚Å‚ ‚ë‚¤‚Æ³‚µ‚¢)

@align 4
ldr		r0,[Get_Char_Data]
mov		r14,r0
mov		r0,r5
@dcw	0xF800
	mov		r5,r0
	ldrb	r0,[r4,#0x13]		;defender current hp
	cmp		r0,#0x0
	beq		Defchar
	ldrb	r0,[r6,#0x13]		;attacker current hp
	cmp		r0,#0x0
	beq		SwitchCharacters
	mov		r7,#0x0
	b		GoBack				;if neither party is dead, skip this business
SwitchCharacters:
	ldrb	r7,[r6,#0xB]
	ldrb	r5,[r4,#0xB]
@align 4
ldr		r0,[Get_Char_Data]
mov		r14,r0
mov		r0,r5
@dcw	0xF800
mov		r5,r0

@align 4
Defchar:
ldr		r0,[Get_Char_Data]
mov		r14,r0
mov		r0,r7
@dcw	0xF800
	mov		r7,r0
	@align 4
	ldr		r0,[Is_Capture_Set]
	mov		r14,r0
	mov		r0,r5
	@dcw	0xF800
	cmp		r0,#0x0
	beq		Non		;UŒ‚Ò‚ª•ßŠlUŒ‚‚Å‚È‚¢‚È‚ç‚ÎƒWƒƒƒ“ƒv
;‹R”n”»’è
	ldr	r1, [r7, #4]
	ldr	r1, [r1, #40]
	lsl	r0, r1, #31
	bmi	Reset
;—A‘—‘Ì”»’è
	ldr	r1, [r7]
	ldr	r1, [r1, #40]
	ldr	r0, [r7, #4]
	ldr	r0, [r0, #40]
	orr	r1, r0
	lsl	r0, r1, #22
	bmi	Reset
	
	ldr	r0, =$08018030	;‹~o”»’è
	mov	lr, r0
	mov	r0, r5
	mov	r1, r7
@dcw	0xF800
	lsl	r0, r0, #24
	cmp	r0, #0
	beq	Reset
;‹ßÚ”»’è
	ldr	r0,	=$0203a4d2
	ldrb	r0, [r0]	;‹——£
	cmp	r0, #1
	bne	Reset
	mov	r0, #1
	strb	r0,[r7,#0x13]
	
@align 4
ldr		r0,[Write_Rescue_Data]
mov		r14,r0
mov		r0,r5
mov		r1,r7
@dcw	0xF800
	mov		r7,#0x0				;captured units don't drop anything
	ldr		r0,[r5,#0xC]
	b	Half

GoBack:

@align 4
ldr		r0,[Is_Capture_Set]
mov		r14,r0
mov		r0,r5
@dcw	0xF800
cmp		r0,#0x0
beq		Non
Reset:
	ldr		r0,[r5,#0xC]
	mov		r1,#0x10
	mvn		r1,r1
	and		r0,r1
Half:
	mov		r1,#0x80
	lsl		r1,r1,#0x17
	mvn		r1,r1
	and		r0,r1
str		r0,[r5,#0xC]		;remove the 'is capturing' bit

Non:
ldr	r0, =$08032874
mov	pc, r0

@ltorg
Get_Char_Data:
@dcd 0x08019108
Write_Rescue_Data:
@dcd 0x08018060
Is_Capture_Set:

