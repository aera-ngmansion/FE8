@thumb
@org	$080252f4
	push	{r4, r5, lr}
	mov	r4, r0	
	ldr	r5, [$0802538c]
	ldr	r0, [r5]
	mov	r1, #11
	ldsb	r0, [r0, r1]
	ldsb	r1, [r4, r1]	;����ID���[�h
	bl	$08024d3c		;�G����(r3����)
	ldr	r2, [r5]
	cmp	r0, #0
	bne	normal	;�G�ȊO�̓W�����v
;�ߊl����(�́E����)
	ldr	r0, [r2]
	mov	r1, #0x14
	ldsb	r0, [r0, r1]	;�L������
	asr	r0, r0, #1
	ldrb	r1, [r4, #0x13]
	cmp	r0, r1
	blt	$8025412
normal
	ldr	r0, [r2, #4]
	ldrb	r0, [r0, #4]
	cmp	r0, #0x51
	beq	$8025412
	ldr	r3, [r4, #4]
	ldrb	r0, [r3, #4]
	cmp	r0, #0x51
	beq	$8025412
	ldrh	r1, [r4, #48]
	mov	r0, #0xF
	and	r1, r0
	cmp	r1, #2
	beq	sleep
;;�R�n����
	ldr	r1, [r3, #40]
	lsl	r0, r1, #31
	bmi	$08025412
sleep	;;�A��������
	ldr	r1, [r4]
	ldr	r1, [r1, #40]
	ldr	r0, [r3, #40]
	orr	r1, r0
	lsl	r0, r1, #22
	bmi	$08025412
;;�~�o�������͔�~�o�H
	ldr	r0, [r4, #12]
	mov	r1, #48	;0x30
	and	r0, r1
	bne	$08025412
	mov	r0, r5
	mov	r1, r4
	b	$0802551c
	
;00025412 bc30     	pop	{r4, r5}
;00025414 bc01     	pop	{r0}
;00025416 4700     	bx	r0

;0002551c f7f2 fd88	bl	$00018030=�~�o�l�v�Z
;00025520 0600     	lsl	r0, r0, #24
;00025522 2800     	cmp	r0, #0
;00025524 d008     	beq	$00025538
;00025526 2010     	mov	r0, #16
;00025528 5620     	ldsb	r0, [r4, r0]
;0002552a 2111     	mov	r1, #17
;0002552c 5661     	ldsb	r1, [r4, r1]
;0002552e 220b     	mov	r2, #11
;00025530 56a2     	ldsb	r2, [r4, r2]
;00025532 2300     	mov	r3, #0
;00025534 f02b f87c	bl	$00050630
;00025538 bc30     	pop	{r4, r5}
;0002553a bc01     	pop	{r0}
;0002553c 4700     	bx	r0