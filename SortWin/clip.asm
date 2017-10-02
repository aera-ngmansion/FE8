@thumb
; 00094fc0
;逆ソートは000950b0

	ldr		r3, [r4, #0]
	ldr		r0, [r3, #0]
	ldr		r1, [r0, #0]	;メモリ先頭4バイトのユニットデータのベースアドレス
	ldrb	r0, [r2, #4]	;Unit ID
	ldrb	r1, [r1, #4]	;Unit ID
	
	lsl		r0, r0, #4
	lsl		r1, r1, #4
	
	ldr		r2, =$080a7678
	ldr		r2, [r2]
	ldrh	r0, [r2, r0]
	ldrh	r1, [r2, r1]
	
	ldr		r2, =$000003FF
	and		r0, r2
	and		r1, r2
	
	ldr	r2, =$08094fca	;逆ソートは080950ba
	mov	pc, r2
;	cmp	r0, r1
	
	