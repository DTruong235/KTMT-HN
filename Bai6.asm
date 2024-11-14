.data
Char_arr: .byte 65:100
Input: .asciiz "Nhap vao chuoi ky tu: "
Output: .asciiz "\nChuoi dao nguoc: "

.text
main:
	li $v0,4
	la $a0,Input
	syscall
	
	la $t0,Char_arr
	Loop_Input:

		li $v0,12
		syscall
		sb $v0,($t0)
		beq $v0,10,End_Input
		add $t1,$t1,1
		add $t0,$t0,1
		j Loop_Input
	End_Input:
		la $t0,Char_arr
		Push:
			lb $t2,($t0)
			subi $sp,$sp,1
			sb $t2,($sp)
			add $t3,$t3,1 #i++
			add $t0,$t0,1
			blt $t3,$t1,Push
		la $t0,Char_arr
		li $t3,0
		Pop:
			lb $t2,($sp)
			addi $sp,$sp,1
			sb $t2,($t0)
			add $t3,$t3,1
			add $t0,$t0,1
			blt $t3,$t1,Pop
		la $t0,Char_arr
		li $t3,0
		
		li $v0,4
		la $a0,Output
		syscall
		Print:
			lb $t2,($t0)
			li $v0,11
			move $a0,$t2
			syscall
			add $t3,$t3,1
			add $t0,$t0,1
			blt $t3,$t1,Print
		li $v0,10
		syscall
			
			
		
		
