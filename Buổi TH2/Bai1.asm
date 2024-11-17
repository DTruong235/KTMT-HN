.data
Input: .asciiz "Nhap vao mot ky tu: "
Output_Front: .asciiz "\nFront: "
Output_Back: .asciiz "\nBack: "

.text
main:
	li $v0,4
	la $a0,Input
	syscall
	
	li $v0,12
	syscall
	move $t0,$v0
	
	While_Loop:
		bne $t0,$t1,Next_Loop #$t1 :i
		sub $t2,$t1,1 #$t2: Front
		add $t3,$t1,1 #t3: Back
		
		li $v0,4
		la $a0,Output_Front
		syscall
		
		li $v0,11
		move $a0,$t2
		syscall	
		
		li $v0,4
		la $a0,Output_Back
		syscall
		
		li $v0,11
		move $a0,$t3
		syscall	
		
		li $v0,10
		syscall
		Next_Loop:
			add $t1,$t1,1
			j While_Loop
		