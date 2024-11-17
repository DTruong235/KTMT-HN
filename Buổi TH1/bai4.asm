.data
str: .asciiz "Nhap vao so nguyen duong: "
chiahet: .asciiz " chia het cho 3 "
khongchiahet: .asciiz " khong chia het cho 3 "

.text
main: 
	li $v0,4
	la $a0,str
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	add $t1,$t1,3
	
	div $t0,$t1
	
	mfhi $t1
	
	bne $t1,$0,kch
		move $a0,$t0
		li $v0,1
		syscall
		li $v0,4
		la $a0,chiahet
		syscall
		j Exit
	kch: 
		move $a0,$t0
		li $v0,1
		syscall
		li $v0,4
		la $a0,khongchiahet
		syscall
	Exit:
	li $v0,10
	syscall
	
	
	
	