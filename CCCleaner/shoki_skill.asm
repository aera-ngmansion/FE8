@thumb

	ldrh	r0, [r1, #0x26]
	mov r5, #0x3B
	strb	r0, [r4, r5]	;�X�L���X�g�A
	ldrb	r0, [r2, #12]	;�̓N���X�����l
	ldrb	r5, [r1, #13]	;�̓��j�b�g�����l
	add	r0, r0, r5
	strb	r0, [r4, #20]	;�̓X�g�A
	
	ldr r0, =$08017b6c
	mov pc, r0