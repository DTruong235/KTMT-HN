.data
Char_arr: .byte 32:100
Input: .asciiz "Nhap mot chuoi: "
Output1: .asciiz "\nSo ki tu so: "
Output2: .asciiz "\nSo ki tu chu: "
Output3: .asciiz "\nSo ki tu khac: "

.text
main:
	li $v0,4
	la $a0,Input
	syscall
	
	la $t0,Char_arr #a[...]
	Loop_Input:
		li $v0,12
		syscall
		beq $v0,10,End_Input
		sb $v0,($t0)
		add $t1,$t1,1
		add $t2,$t2,1 #i++
		add $t0,$t0,1
		j Loop_Input
	End_Input:
		la $t0,Char_arr
		li $t2,0
		
		li $t4,-1
		li $t5,0
		li $t6,0
	Check:
		
		bgt $t2,$t1,Output
		lb $t3,($t0) #a[i]
		
	Char_32to47: 
		bge $t3,32,Char1
	Char1:
		bgt $t3,47,Num_48to57
		add $t4,$t4,1 #ki tu khac
		add $t2,$t2,1
		add $t0,$t0,1
		j Check
	Num_48to57:
		bge $t3,48,Num1
	Num1:
		bgt $t3,57,Char_58to64
		add $t5,$t5,1 #ki tu So
		add $t2,$t2,1
		add $t0,$t0,1
		j Check
	Char_58to64:
		bge $t3,58,Char2
	Char2:
		bgt $t3,64,Letter_65to90
		add $t4,$t4,1 #ki tu Khac
		add $t2,$t2,1
		add $t0,$t0,1
		j Check
	Letter_65to90:
		bge $t3,65,Letter1
	Letter1:
		bgt $t3,90,Char_91to96
		add $t6,$t6,1 #ki tu Chu
		add $t2,$t2,1
		add $t0,$t0,1
		j Check
	Char_91to96:
		bge $t3,91,Char3
	Char3: 
		bgt $t3,96,Letter_97to122
		add $t4,$t4,1 #ki tu Khac
		add $t2,$t2,1
		add $t0,$t0,1
		j Check
	Letter_97to122:
		bge $t3,97,Letter2
	Letter2:
		bgt $t3,122,Char_123to126
		add $t6,$t6,1 #ki tu Chu
		add $t2,$t2,1
		add $t0,$t0,1
		j Check
	Char_123to126:
		bge $t3,123,Char4
	Char4:
		ble $t3,126,Char5
	Char5:
		add $t4,$t4,1 #ki tu Khac
		add $t2,$t2,1
		add $t0,$t0,1
		j Check
	Output:
		li $v0,4
		la $a0,Output1
		syscall
		
		li $v0,1
		move $a0,$t5
		syscall
		
		li $v0,4
		la $a0,Output2
		syscall
		
		li $v0,1
		move $a0,$t6
		syscall
		
		li $v0,4
		la $a0,Output3
		syscall
		
		li $v0,1
		move $a0,$t4
		syscall
		
		li $v0,10
		syscall

		
	