@thumb
;000a7c28
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    @dcw $b0ac ;sub sp, #176
    @dcw $b0ac ;sub sp, #176
    
    ldr r1, =$0E004760 ;1
    cmp r0, r1
    beq one
    ldr r1, =$0E005528 ;2
    cmp r0, r1
    beq two
    ldr r1, =$0E005B54 ;3
    cmp r0, r1
    beq three
    mov r0, #0
    b merge
one:
    mov r0, #1
    b merge
two:
    mov r0, #2
    b merge
three:
    mov r0, #3
merge:
    ldr r1, =0x160
    mul r0, r1
    ldr r1, =$0E007400
    add r0, r0, r1
    
    mov r8, r0
        ldr r0, =$0803144c ;=輸送隊のベースアドレスロード
        mov lr, r0
    @dcw $F800
    mov r6, r0
    @dcw $AD19
    add r5, #100
    ldr r0, =$080a7c3a
    mov pc, r0