.data
Char_arr: .byte 65:100
Input: .asciiz "Nhap vao mot chuoi: "
Output_True: .asciiz " la chuoi doi xung"
Output_False: .asciiz " la chuoi khong doi xung"

.text
main: 
	li $v0,4
	la $a0,Input
	syscall
	
	la $t0,Char_arr
	li $t1,0
	Loop_Input:
		li $v0,12
		syscall
		sb $v0,0($t0)
		beq $v0,10,End_Input
		add $t1,$t1,1
		add $t0,$t0,1
		j Loop_Input
	End_Input:
		la $t0,Char_arr
		li $t3,0
	Push:
		lb $t2,0($t0)
		subi $sp,$sp,1
		sb $t2,0($sp)
		add $t0,$t0,1
		add $t3,$t3,1
		blt $t3,$t1,Push
	la $t0,Char_arr
	
	li $t3,0
	add $t6,$t1,0
	div $t6,$t6,2
	mflo $t5
	Check:
		lb $t2,0($t0)
		lb $t4,0($sp)
		addi $sp,$sp,1
		addi $t0,$t0,1
		
		bne $t2,$t4,Print_False
		add $t3,$t3,1
		blt $t3,$t5,Check
		
	la $t0,Char_arr
	li $t3,0
	Print_True:
		lb $t2,($t0)
		li $v0,11
		move $a0,$t2
		syscall
		add $t3,$t3,1
		add $t0,$t0,1
		blt $t3,$t1,Print_True
		
		li $v0,4
		la $a0,Output_True
		syscall
		
		li $v0,10
		syscall
	Print_False:
	la $t0,Char_arr
	li $t3,0
	Print:
			lb $t2,($t0)
			li $v0,11
			move $a0,$t2
			syscall
			add $t3,$t3,1
			add $t0,$t0,1
			blt $t3,$t1,Print
	
		li $v0,4
		la $a0,Output_False
		syscall
		
		li $v0,10
		syscall
		
		
		
	
		
		
	
	
