@thumb
@org	$08089598
;����
	ldr	r0, [r5, #12]
	bl	$08018ecc
	str	r0, [sp]
	
	ldr	r1, [r5, #12]
	ldrb	r3, [r1, #26]	;�̊i�ǂݍ���
	ldr	r0, [r1, #4]
	ldrb	r0, [r0, #25]	;�̊i����ǂݍ���
;	lsl	r0, r0, #24
;	asr	r0, r0, #24
	str	r0, [sp, #4]
	mov	r0, #7
	mov	r1, #5	;x��
	mov	r2, #3	;y��
	bl	$08089354
;�ړ�
	ldr	r6, [$08089678]	;=$02003FB6
	ldr	r1, [r5, #12]
	ldr	r0, [r1, #4]
	mov	r2, #18
	ldsb	r2, [r0, r2]	;��b�l
	mov	r0, #29
	ldsb	r0, [r1, r0]	;doping
	add	r2, r2, r0
	mov	r1, #4
	cmp	r0, #0
	bne	hikaru
	mov	r1, #2
hikaru
	mov	r0, r6
	bl	$08004a9c
;�̊i
	ldr	r1, [r5, #12]
	ldr	r0, [r1]
	mov	r2, #19
	ldsb	r0, [r0, r2]	;���j�b�g
	ldr	r2, [r1, #4]
	ldrb	r2, [r2, #17]
	add	r2, r2, r0
	add	r6, #0x80
	mov	r0, r6
	mov	r1, #2
	bl	$08004a9c
;�R�n�A�C�R��
	ldr	r0, [r5, #12]
	ldr	r1, [r0, #0]
	ldr	r2, [r0, #4]
	ldr	r0, [r1, #40]
	ldr	r1, [r2, #40]
	orr	r0, r1
	bl	$08018804
	mov	r1, r0
	mov	r2, #160
	lsl	r2, r2, #7
	add	r0, r6, #2
	bl	$08003608	;�nor�V�nor�򗳃A�C�R��
;�~�o������
	mov	r4, r5
	add	r4, #120
	ldr	r0, [r5, #12]
	bl	$080190c0
	mov	r3, r0
	mov	r1, #24
	mov	r2, #2
	mov	r0, r4
	bl	$080043b8	;=�����`��
	ldr	r6, =$02003ec6;(��$02003e86)
	b	$0808962a	;��Ԃ�
	
;@org	$080895b6
;	ldr	r1, [r5, #12]
;	ldr	r0, [r1, #4]
;	mov	r2, #17
;	ldsb	r2, [r0, r2]
;	ldr	r0, [r1, #0]
;	ldrb	r0, [r0, #19]
;	lsl	r0, r0, #24
;	asr	r0, r0, #24
;	add	r2, r2, r0
;	ldr	r0, =$02003E06
;	mov	r1, #2
;	bl	$08004a9c
;	b	$080895e4