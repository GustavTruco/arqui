	.file	"sort-c-apnom.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	sort
	.type	sort, @function
sort:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	slli	s4,a1,2
	addi	s4,s4,-4
	add	s4,a0,s4
	bgeu	a0,s4,.L1
	mv	s5,a0
	mv	s1,a0
	li	s0,32
	j	.L12
.L16:
	lbu	a5,0(a1)
	beq	a5,s0,.L15
.L6:
	addi	a1,a1,1
.L3:
	lbu	a5,0(a0)
	beq	a5,s0,.L16
	addi	a0,a0,1
	lbu	a5,0(a1)
	bne	a5,s0,.L6
	j	.L3
.L15:
	addi	a1,a1,1
	addi	a0,a0,1
	call	strcmp
	bne	a0,zero,.L7
	mv	a1,s3
	mv	a0,s2
	call	strcmp
	ble	a0,zero,.L17
	sw	s3,0(s1)
	sw	s2,4(s1)
.L10:
	mv	s1,s5
.L12:
	lw	s2,0(s1)
	lw	s3,4(s1)
	mv	a1,s3
	mv	a0,s2
	j	.L3
.L17:
	addi	s1,s1,4
.L9:
	bltu	s1,s4,.L12
.L1:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	addi	sp,sp,32
	jr	ra
.L7:
	blt	a0,zero,.L18
	sw	s3,0(s1)
	sw	s2,4(s1)
	j	.L10
.L18:
	addi	s1,s1,4
	j	.L9
	.size	sort, .-sort
	.ident	"GCC: (GNU) 10.2.0"
