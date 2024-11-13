.data
M:  .asciiz " Nhap so M        : "
N:  .asciiz " Nhap so N        : "
KQ: .asciiz " Ket qua bieu thuc: "

.text
.globl main
main: 
	li $v0,4
	la $a0,M
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,4
	la $a0,N
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	ori $t2,$0,2
	ori $t3,$0,5
	
	mult $t2,$t1
	mflo $t1
	
	mult $t3,$t0
	mflo $t0
	
	add $t4,$t0,$t1
	
	li $v0,4
	la $a0,KQ
	syscall
	
	move $a0,$t4
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
