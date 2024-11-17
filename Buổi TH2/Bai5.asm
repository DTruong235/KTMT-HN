.data
char_array: .byte 65:100
Length: .asciiz "Leghth: "
Input: .asciiz "Nhap vao mot chuoi ky tu: "
Output_True: .asciiz "\nLowcase: "



.text
main:
	
	li $v0,4
	la $a0,Input
	syscall
	
	la $t0,char_array
	
	
	Loop_Input:
		
		
		li $v0,12
		syscall
		beq $v0,10,Check
		sb $v0,($t0)
		add $t0,$t0,1
		add $t1,$t1,1
		j Loop_Input
	Check:
		
		la $t0,char_array
		li $t2,0
		
		Check_Upcase:
			li $t4,65
			bgt $t2,$t1,Out
			
			lb $t3,($t0)
			
			Check_Char: 
				bgt $t4,90,Next1
			
				bne $t3,$t4,Next
			
				addi $t3,$t3,32
				sb $t3,($t0)
			
				add $t2,$t2,1
				add $t0,$t0,1
				j Check_Upcase
		Next:
			add $t4,$t4,1	
			j Check_Char
		Next1: 
			sb $t3,($t0)
			add $t2,$t2,1
			add $t0,$t0,1
			j Check_Upcase
	Out:
		li $v0,4
		la $a0,Length
		syscall	
		
		li $v0,1
		move $a0,$t1
		syscall
		
		la $t0,char_array
		li $t2,0
		
		li $v0,4
		la $a0,Output_True
		syscall
	
		Print:
			bge $t2,$t1,End
			lb $t3,($t0)
			
			li $v0,11
			move $a0,$t3
			syscall
			
			add $t2,$t2,1
			add $t0,$t0,1
			j Print
		End: 
			li $v0,10
			syscall
			
		
		
	
		
	
	
	
	
	
