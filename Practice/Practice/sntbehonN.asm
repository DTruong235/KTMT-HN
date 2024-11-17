# S? các s? nguyên t? < n 
.data
str1: .asciiz "nhap so nguyen n: "
result: .asciiz "so so nguyen to nho hon "
haicham: .asciiz ": "
.text
main:
	li $v0,4
	la $a0,str1
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $t1,2 #const = 2
	li $t2,2 # i = 2
	
	LoopI:
		bge $t2,$t0,Result
		li $t3,1 #j=1
		li $t4,0 #count = 0
		LoopJ:
			bgt $t3,$t2,NextI
			div $t2,$t3
			mfhi $t5
			bnez $t5,NextJ
			add $t4,$t4,1 #countj++
			add $t3,$t3,1 #j++
			j LoopJ
		NextJ:
			add $t3,$t3,1
			J LoopJ
		NextI: 
			beq $t4,$t1,CountI
			add $t2,$t2,1
			j LoopI
		CountI: 
			add $t6,$t6,1
			add $t2,$t2,1
			j LoopI
		Result: 
			li $v0,4
			la $a0,result
			syscall
			
			li $v0,1
			move $a0,$t0
			syscall
			
			li $v0,4
			la $a0,haicham
			syscall
			
			li $v0,1
			move $a0,$t6
			syscall
			
			li $v0,10
			syscall
			
			
			
			
		
	
	
			
			
		