.data
Input: .asciiz "Nhap vao mot ky tu: "
Output: .asciiz "\nUpcase: "
Output1: .asciiz "\nKy tu vua nhap khong phai ky tu chu!"

.text
main: 
	li $v0,4
	la $a0,Input
	syscall
	
	li $v0,12
	syscall
	move $t0,$v0
	
	li $t1,97
	
	Loop:
		bgt $t1,122,Exit
		
		bne $t1,$t0,Next
		sub $t0,$t0,32
		
		li $v0,4
		la $a0,Output
		syscall
		
		li $v0,11
		move $a0,$t0
		syscall
		
		li $v0,10
		syscall
		
		Next:
			add $t1,$t1,1
			j Loop
	Exit: 
		li $v0,4
		la $a0,Output1
		syscall
		
		li $v0,10
		syscall
		
		
	
	