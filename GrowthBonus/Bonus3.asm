@thumb
;@org 0002b9e6
;r9 増加保存領域
    
    mov r0, #0
    mov r9, r0
        bl RED10A
    ldr r5, [r7]
    add r5, #28
    mov r6, #0
    add r7, #115
saihan:
    mov r4, #0
loopin:
    ldrb r0, [r5, r4]
    add r0, r10

    mov r2, #7
    sub r2, r2, r4
    lsl r2, r2, #2
    mov r1, r9
    lsl r1, r2
    lsr r1, r1, #28
    lsl r1, r1, #1
    add r0, r0, r1
    lsl r1, r1, #2
    add r0, r0, r1
        ldr r1, =$0802b8e8 ;r0に成長率で判定
        mov lr, r1
        @dcw $F800
    strb r0, [r7, r4]
    ldsb r0, [r7, r4]
    add r6, r6, r0
    add r4, #1
    cmp r4, #3
    ble loopin
    
    bl RED10B
    
loopin_b:
    ldrb r0, [r5, r4]
    add r0, r10

    mov r2, #3
    sub r2, r2, r4
    lsl r2, r2, #3 ;8倍
    mov r1, r9
    lsl r1, r2
    lsr r1, r1, #24
    lsl r1, r1, #1
    add r0, r0, r1
    lsl r1, r1, #2
    add r0, r0, r1
        ldr r1, =$0802b8e8 ;r0に成長率で判定
        mov lr, r1
        @dcw $F800
    strb r0, [r7, r4]
    ldsb r0, [r7, r4]
    add r6, r6, r0
    add r4, #1
    cmp r4, #6
    ble loopin_b
    
    
    
    
;魔力
    ldrb r0, [r5, #23]
    cmp r0, #0
    beq nonmag
    add r0, r10
    mov r1, r9
    lsr r1, r1, #28
    lsl r1, r1, #1
    add r0, r0, r1
    lsl r1, r1, #2
    add r0, r0, r1
        ldr r1, =$0802b8e8
        mov lr, r1
        @dcw $F800
    strb r0, [r7, r4]
    ldsb r0, [r7, r4]
    add r6, r6, r0
nonmag:

    cmp r6, #1
    ble saihan
    
    
    
    
part_B:
    
    
    
    
    
    
    sub r7, #115
    ldr r0, =$0802bb28
    mov pc, r0


RED10A:
    push {lr}
    mov r0, #0
    mov r9, r0
    
    ldr r0, =$0203a4d0
    ldrh r0, [r0]
    mov r1, #0x20
    and r0, r1
    beq start ;闘技場チェック
    mov r0, #0
    b endA
start:
    bl classA
    bl dopingA
    bl itemA
endA:
    pop {pc}
    
    
classA:
    push {lr}
    ldr r2, [r7, #4]
    add r2, #0x22
    mov r1, #0
    ldrb r0, [r2, r1] ;HP
    bl bonus_extend_H
    bl calc_bit
    
    ldr r2, [r7, #4]
    add r2, #0x22
    mov r1, #1
    ldrb r0, [r2, r1] ;力
    bl bonus_extend
    bl calc_bit
    
    ldr r2, [r7, #4]
    add r2, #0x22
    mov r1, #2
    ldrb r0, [r2, r1] ;技
    bl bonus_extend
    bl calc_bit
    
    ldr r2, [r7, #4]
    add r2, #0x22
    mov r1, #3
    ldrb r0, [r2, r1] ;速さ
    bl bonus_extend
    bl calc_bit
    push {pc}
    
    
    
dopingA:
    push {r4, r5, lr}
    mov r5, #0
loop_dopingA:
    mov r5, r7
    add r5, #30
    lsl r2, r4, #1
    ldrb r1, [r5, r2]
    cmp r1, #0
    beq end ;アイテム無し
    cmp r1, #0x5B	;天使の衣
    bne jump1
    mov r0, #20 ;+20
    mov r1, #1
    bl calc_bit
jump1
    lsl r2, r4, #1
    ldrb r1, [r5, r2]
    cmp r1, #0x5C	;エナジーリング
    bne jump2
    mov r0, #10 ;+10
    mov r1, #1
    bl calc_bit
jump2
    lsl r2, r4, #1
    ldrb r1, [r5, r2]
    cmp r1, #0x5D	;秘伝の書
    bne jump3
    mov r0, #10 ;+10
    mov r1, #2
    bl calc_bit
jump3
    lsl r2, r4, #1
    ldrb r1, [r5, r2]
    cmp r1, #0x5E	;疾風のはね
    bne jump4
    mov r0, #10 ;+10
    mov r1, #2
    bl calc_bit
jump4
    add r4, #1
    cmp r4, #4
    ble dopingA
end:
    pop {r4, r5, pc}


    cmp r1, #0x60	;竜の盾
    bne jump6
    mov r2, #0x1
    lsl r2, r2, #16
    add r0, r0, r2
jump6

    cmp r1, #0x61	;魔除け
    bne jump7
    mov r0, #10
    mov r1, #1
    bl calc_bit
jump7
    cmp r1, #0x5F	;女神の像
    bne jump5
    mov r2, #0x2
    lsl r2, r2, #24
    add r0, r0, r2
jump5
    cmp r1, #0x63	;ボデリン
    bne jump8
    mov r2, #0x1
    lsl r2, r2, #28
    add r0, r0, r2
jump8
    add r3, #1
    cmp r3, #4
    ble loop
end
    mov r9, r0
    pop {pc}
    
    
    
bonus_extend_H:
    ;r0増減算出元値
    cmp r0, #0
    beq zero_bonus_H
    cmp r0, #2
    ble one_bonus_H
    cmp r0, #4
    ble good_bonus_H
    mov r0, #20 ;+20
    bx lr
zero_bonus_H:
    mov r0, 0
    sub r0, #10 ;+10
    bx lr
one_bonus_H:
    mov r0, #5 ;+5
    bx lr
good_bonus_H:
    mov r0, #10 ;+10
    bx lr
    
bonus_extend:
    ;r0増減算出元値
    cmp r0, #0
    beq zero_bonus
    cmp r0, #1
    beq one_bonus
    cmp r0, #2
    beq good_bonus
    mov r0, #20 ;+20
    bx lr
zero_bonus:
    mov r0, 0
    sub r0, #10 ;-10
    bx lr
one_bonus:
    mov r0, #5 ;+5
    bx lr
good_bonus:
    mov r0, #10 ;+10
    bx lr

calc_bit:
    ;r0 増減量
    ;r1 位置(0～3)
;位置を8倍して定位置に
    mov r2, #3
    sub r1, r2, r1
    lsl r1, r1, #3
;降ろしてくる
    mov r2, r9
    lsl r2, r2, r1
    asr r2, r2, #24
;計算する
    add r0, r0, r2
;ビットマスクをする
    mov r2, #0xFF
    and r0, r2
;ビットマスクをする
    lsl r2, r2, #24
    lsr r2, r2, r1
    neg r2
    mov r3, r9
    and r2, r3
;結果を格納する
    lsl r0, r0, #24
    lsr r0, r0, r1
    orr r0, r0, r2
    mov r9, r0
    bx lr
    