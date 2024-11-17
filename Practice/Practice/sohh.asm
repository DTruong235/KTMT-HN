#So hoan hao
.data
n: .asciiz "Nhap so nguyen n: "
true: .asciiz " la so hoan hao"
false: .asciiz " khong la so hoan hao"
.text
main: 
	li  $v0,4
	la $a0,n
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $t1,2 #i=2
	Loop:
		bgt $t1,$t0,Result
		div $t0,$t1
		mflo $t4
		mfhi $t3
		bnez $t3,NEXT
		add $t2,$t2,$t4
		add $t1,$t1,1
		j Loop
		NEXT:
			add $t1,$t1,1
			j Loop
	Result: 
		bne $t2,$t0,False
		move $a0,$t0
		li $v0,1
		syscall
		
		li $v0,4
		la $a0,true
		syscall
		
		li $v0,10
		syscall
	False: 
		move $a0,$t0
		li $v0,1
		syscall
		
		li $v0,4
		la $a0,false
		syscall
		
		li $v0,10
		syscall
		
