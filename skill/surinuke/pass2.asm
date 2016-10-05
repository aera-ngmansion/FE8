@thumb
;;@org	$0801A1D0 > 00 48 87 46 XX XX XX 08

	cmp	r3, #0
	bne	check
	strb	r3, [r6, #8]
	ldr	r0, =$0801a1ea
	mov	pc, r0
check
	mov	r0, r13
	ldr	r1, =$03007D18	;道具消滅バグ
	cmp	r0, r1
	beq	non
;ユニット
	ldr	r0, [r4]
	ldrh	r0, [r0, #0x26]
	lsl	r0, r0, #20
	bmi	pass
class
	ldr	r0, [r4, #4]
	ldrb	r0, [r0, #4]
	cmp	r0, #0x17			;クラス
	beq	pass
	cmp	r0, #0x18			;クラス
	beq	pass
	cmp	r0, #0x00			;クラス
	beq	pass
	cmp	r0, #0x00			;クラス
	beq	pass
non
	mov	r0, #1
	b	end
pass
	mov	r0, #0
end
	ldr	r1, =$0801a1e6
	mov	pc, r1