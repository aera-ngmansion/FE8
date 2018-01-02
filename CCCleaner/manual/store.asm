@thumb
;0002f740


	cmp r0, #0x89
	beq	meti
	ldr	r1, =$080174E4
	mov lr, r1
	@dcw $F800
	cmp r0, #0x2E
	beq manual
	
	ldr	r1, =$0802f760 ;その他のアイテムへ
	mov pc, r1
manual:
	
	mov	r0, r6
    ldr r1, =$08017384 ;武器威力
    mov lr, r1
    @dcw $F800
    cmp r0, #255
    bne not_eraser
    ldr r1, =%1111000000000000
    ldrh r2, [r4, #0x3A]
    and r2, r1
    strh r2, [r4, #0x3A]
	mov	r0, r4
        ldr r1, =$080186a8
        mov lr, r1
    mov r1, r7
    @dcw $F800
    @align 4
    ldr r0, [adr+4] ;使用後の説明
    ldr r1, =$0802f858
    mov pc, r1
    
not_eraser:
    mov r1, %111111
    and r0, r1
merge:
    ldrh r2, [r4, #0x3A]
    and r1, r2
    cmp r1, #0
    beq low
    
    ldr r3, [r4]
    ldrb r2, [r3, #0x26]
    cmp r1, r2
    beq low ;被り
    ldrb r2, [r3, #0x27]
    cmp r1, r2
    beq low ;被り
    b hi ;下位チェックは完了したので、後は確実に上位
low:
    ldrh r2, [r4, #0x3A]
    ldr r1, =%111111000000
    and r2, r1
    orr r0, r2
    strh r0, [r4, #0x3A]
    b return
hi:
    lsl r0, r0, #6
    ldrh r2, [r4, #0x3A]
    mov r1, %111111
    and r2, r1
    orr r0, r2
    strh r0, [r4, #0x3A]

return:
	mov	r0, r4
        ldr r1, =$080186a8
        mov lr, r1
    mov r1, r7
    @dcw $F800
    @align 4
    ldr r0, [adr] ;使用後の説明
    ldr r1, =$0802f858
    mov pc, r1
meti: ;メティスの書
	ldr	r0, [r4, #12]
	mov	r1, #128
	lsl	r1, r1, #6
	orr	r0, r1
	str	r0, [r4, #12]
	mov	r0, r4
ldr	r1, =$0802f750
mov pc, r1
@ltorg
adr: