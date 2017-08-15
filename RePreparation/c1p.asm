@thumb
	
	mov	r0, #52
	
	ldr  r1, =$08002424
	mov  lr, r1
	mov  r1, #0
	@dcw $F800
	ldr  r0, =$080b692a
	mov  pc, r0