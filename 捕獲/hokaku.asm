@thumb
@org	$080252f4
;救出条件
	push	{r4, r5, lr}
	mov	r4, r0	
	ldr	r5, [$0802538c]
	ldr	r5, [r5]
;自亡霊戦士
	ldr	r0, [r5, #4]
	ldrb	r0, [r0, #4]
	cmp	r0, #81
	beq	$08025412	;亡霊戦士は救出不可
;所属チェック
	mov	r1, #11
	ldsb	r0, [r5, r1]
	ldsb	r1, [r4, r1]	;所属IDロード
	bl	$08024d3c		;r3消去
	
	ldr	r3, [r4, #4]	;;r3=敵クラス
	
	cmp	r0, #0
	bne	normal
;体格条件
	ldr	r0, [r5]
	mov	r2, #0x13
	ldsb	r0, [r0, r2]	;キャラ体格
	ldr	r1, [r5, #4]
	ldrb	r1, [r1, #0x11]	;クラス体格
	add	r0, r0, r1

	ldr	r1, [r4]
	ldsb	r1, [r1, r2]	;キャラ体格
	ldrb	r2, [r3, #0x11]	;クラス体格
	add	r1, r2, r1

	cmp	r0, r1
;	ble	$08025412
;HP条件
	ldrb	r0, [r5, #20]	;力
	asr	r0, r0, #1
	ldrb	r1, [r4, #19];敵HP
	cmp	r0, r1
	blt	$08025412
normal	;スリープ
	ldrh	r1, [r4, #48]
	mov	r0, #0xF
	and	r1, r0
	cmp	r1, #2
	beq	sleep
;;騎馬判定
	ldr	r1, [r3, #40]
	lsl	r0, r1, #31
	lsr	r0, r0, #31
	bne	$08025412
sleep	;敵輸送隊判定
	ldr	r1, [r4]
	ldr	r1, [r1, #40]
	ldr	r0, [r3, #40]
	orr	r1, r0
	lsl	r0, r1, #22
	lsr	r0, r0, #31
	bne	$08025412	;不可
;？？
	ldr	r0, [r4, #12]
	mov	r1, #48	;0x30 	救出もしくは被救出？
	and	r0, r1
	bne	$08025412	;不可
;終了
	mov	r0, r5
	mov	r1, r4
	b	$0802551c
	
;00025412 bc30     	pop	{r4, r5}
;00025414 bc01     	pop	{r0}
;00025416 4700     	bx	r0

;0002551c f7f2 fd88	bl	$00018030=救出値計算
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