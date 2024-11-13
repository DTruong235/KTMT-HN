.data
Input: .asciiz "Nhap vao mot ky tu: "
Output_True: .asciiz " la so!"
Output_False: .asciiz " khong phai la so!"
Enter: .asciiz "\n"

.text
main:
	li $v0,4
	la $a0,Input
	syscall
	
	li $v0,12
	syscall
	move $t0,$v0
	
	li $t1,48 # so 0 trong bang asciiz
	
	While_Loop:
		bgt $t1,57,NotEqual
		
		bne $t0,$t1,Next
		
		li $v0,4
		la $a0,Enter
		syscall
	
		li $v0,11
		move $a0,$t0
		syscall
		li $v0,4
		la $a0,Output_True
		syscall
		
		li $v0,10
		syscall
		
		Next: 
			add $t1,$t1,1
			j While_Loop
	NotEqual: 
	
		li $v0,4
		la $a0,Enter
		syscall
		
		li $v0,11
		move $a0,$t0
		syscall
		
		li $v0,4
		la $a0,Output_False
		syscall
		
		li $v0,10
		syscall
		