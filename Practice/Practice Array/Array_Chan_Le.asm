.data
Even_Array: .word 0:100
Odd_Array: .word 0:100
Input: .asciiz "Nhap so luong phan tu: "
Input1: .asciiz "Nhap cac phan tu cua mang:\n"
Input2: .asciiz "Nhap phan tu thu "
Square_Bracket: .asciiz "["
Square_Bracket1: .asciiz "]"
Colon: .asciiz ":"
Space: .asciiz " "
Even_Output: .asciiz "Mang so chan: "
Odd_Output: .asciiz "\nMang so le: "

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
	
	la $t0,Even_Array
	li $t2,0
	
Loop_Input:
	bge $t2,$t1,End_Input
	
	li $v0,4
	la $a0,Input2
	syscall
	
	li $v0,4
	la $a0,Square_Bracket
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall
	
	li $v0,4
	la $a0,Square_Bracket1
	syscall
	
	li $v0,4
	la $a0,Colon
	syscall
	
	li $v0,5
	syscall
	
	sw $v0,($t0)
	add $t2,$t2,1
	add $t0,$t0,4
	j Loop_Input
End_Input:
	la $t0,Even_Array
	li $t2,0
	
	la $t5,Odd_Array
	
	li $v0,4
	la $a0,Even_Output
	syscall
Check:
		bge $t2,$t1,Print_Odd
		lw $t3,($t0)
		div $t4,$t3,2
		mfhi $t4
		bnez $t4,Odd
		
		li $v0,1
		move $a0,$t3
		syscall
		
		li $v0,4
		la $a0,Space
		syscall
		
		add $t2,$t2,1
		add $t0,$t0,4
		j Check
	Odd:
		sw $t3,($t5)
		add $t6,$t6,1
		add $t5,$t5,4
		add $t2,$t2,1
		add $t0,$t0,4
		j Check
	Print_Odd:
		li $v0,4
		la $a0,Odd_Output
		syscall
		
		la $t5,Odd_Array
		li $t2,0
	Print:
		bge $t2,$t6,End
		lw $t3,($t5)
		
		li $v0,1
		move $a0,$t3
		syscall
		
		li $v0,4
		la $a0,Space
		syscall 
		
		add $t2,$t2,1
		add $t5,$t5,4
		
		j Print
	End:
		li $v0,10
		syscall	
	