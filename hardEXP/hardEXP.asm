@thumb
@org	$0802c3aa
	ldr	r0, [$0802c53c+4]
	ldrb	r0, [r0, #20]
	lsl	r0, r0, #25
	lsr	r0, r0, #31
	beq	$0002c3ca
	
@org	$0802c3ca
	mov	r6, #20