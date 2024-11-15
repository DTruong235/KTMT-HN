.data
Arr: .word 0:100
Input_M: .asciiz "Nhap so nguyen M:\n"
Input: .asciiz "Nhap so phan tu: "
Input1: .asciiz "Nhap cac phann tu cua mang:\n"
Output: .asciiz "Cac phan tu >= M: "
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
	li $t2,0
	Loop_Input:
		bge $t2,$t1,End_Input
		li $v0,5
		syscall
		
		sw $v0,($t0)
		add $t2,$t2,1 #i
		add $t0,$t0,4
		j Loop_Input
	End_Input:
		li $v0,4
		la $a0,Input_M
		syscall
	
		li $v0,5
		syscall
		move $t4,$v0 #M
	
		li $v0,4
		la $a0,Output
		syscall
		
		la $t0,Arr
		li $t2,0
	Check:
		bge $t2,$t1,End
		lw $t3,0($t0)
		bge $t3,$t4,Print
		add $t2,$t2,1
		add $t0,$t0,4
		j Check
	Print:
		li $v0,4
		la $a0,Space
		syscall
		
		li $v0,1
		move $a0,$t3
		syscall
		add $t2,$t2,1
		add $t0,$t0,4
		j Check
		
	End: 
		li $v0,10
		syscall
		
