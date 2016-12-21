@thumb
	push	{r4, lr}
	ldr	r0, =$080a8e1c	
	mov	lr, r0	
	@dcw	$F800
	ldr	r2, =$030004B0
	ldr	r1, [r2, #8]
	cmp	r0, r1
	bgt	bad
	mov	r0, #1
	b	end
bad
	mov	r0, #0
end	
	str	r0, [r2, #48]
	mov	r0, #0
	pop	{pc, r4}

;40050200 ????0000	????条件累計ターン
;400D0000 ??????08	プログラム(コレ)設置箇所(+1ね)
;400CXX00 0C000000	未達成ならジャンプ
;410CXX00 0C000000	達成ならジャンプ
;20080100	ジャンプ先

