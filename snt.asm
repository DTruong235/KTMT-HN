# s? nguyên t? 
.data
str1: .asciiz "Nhap so n: "
false: .asciiz " Khong phai so nguyen to"
true: .asciiz " la so nguyen to"

.text
main:
	li $v0,4
	la $a0,str1
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	add $t1,$zero,2 # const = 2
	li $t2,0 # count = 0
	li $t3,1 # i = 1
	
	blt  $t0,$t1,FALSE
	Loop:
		bgt $t3,$t0,Result
		div $t0,$t3
		mfhi  $t4
		bnez $t4,EXIT
		add $t2,$t2,1 # count ++	
		add $t3,$t3,1 #i++
		j Loop
	FALSE:
		move $a0,$t0
		li $v0,1
		syscall
		
		li $v0,4
		la $a0,false
		syscall
		
		j EXIT1
	EXIT: 
		add $t3,$t3,1
		j Loop	
	
	Result:	
		bne $t2,$t1,FALSE1
		move $a0,$t0
		li $v0,1
		syscall
		
		li $v0,4
		la $a0,true
		syscall
		j EXIT1
	
	FALSE1:
		move $a0,$t0
		li $v0,1
		syscall
		
		li $v0,4
		la $a0,false
		syscall
	
	EXIT1:
		li $v0,10
		syscall