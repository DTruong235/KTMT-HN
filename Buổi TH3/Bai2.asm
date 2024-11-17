.data
Arr: .word 0:100
Input: .asciiz "Nhap so phan tu: "
Input1: .asciiz "Nhap cac phan tu cua mang:\n "
Output: .asciiz "\nTong cac phan tu le: "
Space: .asciiz " "
.text
main: 
	li $v0,4
	la $a0,Input
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,Input1
	syscall
	
	la $t0,Arr
	#li $t2,0
	Loop_Input:
	
		bge $t2,$t1,End_Input
		li $v0,5
		syscall
		sw $v0,($t0)
		add $t2,$t2,1 #i
		add $t0,$t0,4
		j Loop_Input
	End_Input:
		la $t0,Arr
		li $t2,0
		
		li $v0,4
		la $a0,Output
		syscall
	Loop_Check:
		bgt $t2,$t1,End
		lw $t3,($t0)
		div $t4,$t3,2
		mfhi $t4
		bnez $t4,Sum
		add $t2,$t2,1
		add $t0,$t0,4
		j Loop_Check
	Sum:
		add $t5,$t5,$t3
		add $t2,$t2,1
		add $t0,$t0,4
		j Loop_Check
		
	End: 
		li $v0,1
		move $a0,$t5
		syscall
		
		li $v0,10
		syscall
		
		
	
	