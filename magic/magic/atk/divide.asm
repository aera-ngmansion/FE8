@thumb
;@org	$0802aac0
	
;�����
	mov	r1, #8
	ldrb	r1, [r7, r1]
	cmp	r1, #7	;�����
	bgt	butu
	cmp	r1, #4	;�����
	ble	butu
	b	magi	;���@
butu
	mov	r1, #20	;��������͓ǂݍ���
	ldsb	r1, [r6, r1]
	b	end
magi
	mov	r1, #26	;��������̊i�ǂݍ���
	ldsb	r1, [r6, r1]
end
	add	r0, r0, r1
	strh	r0, [r5]
	ldr	r0,	=$0802aac8
	mov	pc, r0