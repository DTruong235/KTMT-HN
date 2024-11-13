.data
Input_X: .asciiz "Nhap vao so nguyen X: "
Input_Y: .asciiz "Nhap vao so nguyen Y: "
Input_Operator: .asciiz "Nhap vao phep toan: "
Output: .asciiz "\nKet qua: "

.text
main:
	li $v0,4
	la $a0,Input_X
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,4
	la $a0,Input_Y
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,Input_Operator
	syscall
	
	li $v0,12
	syscall
	move $t3,$v0
	
	bne $t3,43,Sub
	
	add $t0,$t0,$t1
	
	li $v0,4
	la $a0,Output
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	
	li $v0,10
	syscall
	
	Sub:
		sub $t0,$t0,$t1
		
		li $v0,4
		la $a0,Output
		syscall
		
		li $v0,1
		move $a0,$t0
		syscall
		
		li $v0,10
		syscall