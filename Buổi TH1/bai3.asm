.data
str: .asciiz "Nhap vao so nguyen duong: "
Chan: .asciiz " la so chan "
Le: .asciiz " la so le "

.text
main: 
	li $v0,4
	la $a0,str
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	add $t1,$t1,2
	
	div $t0,$t1
	
	mfhi $t1
	
	bne $t1,$0,SoLe
		move $a0,$t0
		li $v0,1
		syscall
		li $v0,4
		la $a0,Chan
		syscall
		j Exit
	SoLe: 
		move $a0,$t0
		li $v0,1
		syscall
		li $v0,4
		la $a0,Le
		syscall
	Exit:
	li $v0,10
	syscall
	
	
	
	