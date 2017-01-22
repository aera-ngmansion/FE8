@thumb

	ldrh	r0, [r1, #0x26]
	mov r5, #0x3B
	strb	r0, [r4, r5]	;スキルストア
	ldrb	r0, [r2, #12]	;力クラス初期値
	ldrb	r5, [r1, #13]	;力ユニット初期値
	add	r0, r0, r5
	strb	r0, [r4, #20]	;力ストア
	
	ldr r0, =$08017b6c
	mov pc, r0