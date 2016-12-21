@thumb
	push	{lr}
	ldr	r0, =$080ba8f8
	mov	lr, r0	
	@dcw	$F800
	cmp	r0, #0
	beq	end
	mov	r0, #1
end	
	ldr	r1, =$030004B0
	str	r0, [r1, #48]
	mov	r0, #0
	pop	{pc}

;400D0000 ??????08	プログラム(コレ)設置箇所(+1ね)
;400CXX00 0C000000	評価Eならジャンプ
;410CXX00 0C000000	評価D以上ならジャンプ
;20080100	ジャンプ先


