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
saihan
    mov r4, #0
loopin
    ldrb r0, [r5, r4]
    add r0, r10

    mov r2, #3
    sub r2, r2, r4
    lsl r2, r2, #3
    
    mov r1, r9
    lsl r1, r2
    asr r1, r1, #24
    add r0, r0, r1
    cmp r0, #0
    bge zeroA
    mov r0, #0
zeroA
        ldr r1, =$0802b8e8 ;r0に成長率で判定
        mov lr, r1
        @dcw $F800
    strb r0, [r7, r4]
    ldsb r0, [r7, r4]
    add r6, r6, r0
    add r4, #1
    cmp r4, #3
    ble loopin
    sub r7, #115
;次ループ
    bl RED10B
    add r7, #115
loopin_b
    ldrb r0, [r5, r4]
    add r0, r10

    mov r2, #3
    sub r2, r2, r4
    lsl r2, r2, #3
    
    mov r1, r9
    lsl r1, r2
    asr r1, r1, #24
    add r0, r0, r1
    cmp r0, #0
    bge zeroB
    mov r0, #0
zeroB
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
    asr r1, r1, #28
    add r0, r0, r1
    cmp r0, #0
    bge zeroC
    mov r0, #0
zeroC
        ldr r1, =$0802b8e8
        mov lr, r1
        @dcw $F800
    strb r0, [r7, r4]
    ldsb r0, [r7, r4]
    add r6, r6, r0
nonmag
    cmp r6, #1
    ble saihan
    
    sub r7, #115
    ldr r0, =$0802bb28
    mov pc, r0


RED10A:
    push {lr}
    mov r0, #0
    mov r9, r0
    
    bl classA
    ldr r0, =$0203a4d0
    ldrh r0, [r0]
    mov r1, #0x20
    and r0, r1
    beq startA ;闘技場チェック
    mov r0, #0
    b endA
startA
    bl dopingA
    bl itemA
endA
    pop {pc}
    
RED10B:
    push {lr}
    mov r0, #0
    mov r9, r0
    bl classB
    ldr r0, =$0203a4d0
    ldrh r0, [r0]
    mov r1, #0x20
    and r0, r1
    beq startB ;闘技場チェック
    mov r0, #0
    b endB
startB
    bl dopingB
    bl itemB
endB
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
    pop {pc}
    
classB:
    push {lr}
    ldr r2, [r7, #4]
    add r2, #0x26
    mov r1, #0
    ldrb r0, [r2, r1] ;守備
    bl bonus_extend
    bl calc_bit
    
    ldr r2, [r7, #4]
    add r2, #0x26
    mov r1, #1
    ldrb r0, [r2, r1] ;魔防
    bl bonus_extend
    bl calc_bit
    
    ldr r2, [r7, #4]
    add r2, #0x50
    ldrb r0, [r2, #2] ;魔力CC
    mov r1, #3
    bl bonus_extend
    bl calc_bit
    pop {pc}
    
    
dopingA:
    push {r4, r5, lr}
    mov r4, #0
    mov r5, r7
    add r5, #30
loop_dopingA
    lsl r2, r4, #1
    ldrb r1, [r5, r2]
    cmp r1, #0
    beq endDopeA ;アイテム無し
    cmp r1, #0x5B	;天使の衣
    bne jump1
    mov r0, #20 ;+20
    mov r1, #0
    bl calc_bit
    b jump4
jump1
    cmp r1, #0x5C	;エナジーリング
    bne jump2
    mov r0, #10
    mov r1, #1
    bl calc_bit
    b jump4
jump2
    cmp r1, #0x5D	;秘伝の書
    bne jump3
    mov r0, #10
    mov r1, #2
    bl calc_bit
    b jump4
jump3
    cmp r1, #0x5E	;疾風のはね
    bne jump4
    mov r0, #10
    mov r1, #3
    bl calc_bit
jump4
    add r4, #1
    cmp r4, #4
    ble loop_dopingA
endDopeA
    pop {r4, r5, pc}

dopingB:
    push {r4, r5, lr}
    mov r4, #0
    mov r5, r7
    add r5, #30
loop_dopingB
    lsl r2, r4, #1
    ldrb r1, [r5, r2]
    cmp r1, #0
    beq jump9 ;アイテム無し
    cmp r1, #0x60	;竜の盾
    bne jump6
    mov r0, #10
    mov r1, #0
    bl calc_bit
    b jump8
jump6
    cmp r1, #0x61	;魔除け
    bne jump7
    mov r0, #10
    mov r1, #1
    bl calc_bit
    b jump8
jump7
    cmp r1, #0x5F	;女神の像
    bne jump5
    mov r0, #20
    mov r1, #2
    bl calc_bit
    b jump8
jump5
    cmp r1, #0x63	;ボデリン
    bne jump8
    mov r0, #10
    mov r1, #3
    bl calc_bit
jump8
    add r4, #1
    cmp r4, #4
    ble loop_dopingB
jump9
    pop {r4, r5, pc}
    
itemA:
    push {r4, r5, lr}
    mov r4, #0
    mov r5, r7
    add r5, #30
loop_bend
    lsl r2, r4, #1
    ldrb r0, [r5, r2]
    cmp r0, #0
    beq bend ;アイテム無し
    
    ldr r1, =$08017314
    mov lr, r1
    @dcw $F800
    lsl r0, r0, #4
    bpl next
    ldr r0, [r1, #12]
    ldr r0, [r0]
    mov r1. r9
    add r0, r0, r1
    mov r9, r0
next
    add r4, #1
    cmp r4, #4
    ble loop_bend
bend
    pop {r4, r5, pc}

itemB:
    push {r4, r5, lr}
    mov r4, #0
    mov r5, r7
    add r5, #30
loop_aend
    lsl r2, r4, #1
    ldrb r0, [r5, r2]
    cmp r0, #0
    beq aend ;アイテム無し
    
    ldr r1, =$08017314
    mov lr, r1
    @dcw $F800
    lsl r0, r0, #4
    bpl nextae
    ldr r1, [r1, #12]
    ldr r0, [r1, #4]
    lsl r0, r0, #8
    lsr r0, r0, #8
    
    ldrb r1, [r1, #8]
    lsl r1, r1, #24
    orr r0, r1
    
    mov r1. r9
    add r0, r0, r1
    mov r9, r0
nextae
    add r4, #1
    cmp r4, #4
    ble loop_aend
aend
    pop {r4, r5, pc}
    
    
bonus_extend_H:
    ;r0増減算出元値
    cmp r0, #0
    beq zero_bonus_H
    cmp r0, #2
    ble one_bonus_H
    cmp r0, #3
    ble good_bonus_H
    cmp r0, #4
    ble great_bonus_H
    mov r0, #20 ;+20
    bx lr
zero_bonus_H
    mov r0, #10
    neg r0, r0
    bx lr
one_bonus_H
    mov r0, #5 ;+5
    bx lr
good_bonus_H
    mov r0, #10 ;+10
    bx lr
great_bonus_H
    mov r0, #15 ;+10
    bx lr
bonus_extend:
    ;r0増減算出元値
    cmp r0, #0
    beq zero_bonus
    cmp r0, #1
    beq one_bonus
    cmp r0, #2
    ble good_bonus
    cmp r0, #3
    ble great_bonus
    mov r0, #20 ;+20
    bx lr
zero_bonus
    mov r0, #10
    neg r0, r0
    bx lr
one_bonus
    mov r0, #5 ;+5
    bx lr
good_bonus
    mov r0, #10 ;+10
    bx lr
great_bonus
    mov r0, #15 ;+10
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
    lsl r2, r1
    asr r2, r2, #24
;計算する
    add r0, r0, r2
;ビットマスクをする
    mov r2, #0xFF
    and r0, r2
;ビットマスクをする
    lsl r2, r2, #24
    lsr r2, r1
    mvn r2, r2
    mov r3, r9
    and r2, r3
;結果を格納する
    lsl r0, r0, #24
    lsr r0, r1
    orr r0, r2
    mov r9, r0
    bx lr
    