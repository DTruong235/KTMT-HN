.data
str:  .asciiz " 	PHEP CHIA 	"
str1: .asciiz "\n Nhap vao so nguyen thu nhat: "
str2: .asciiz " Nhap vao so nguyen thu hai: "
str3: .asciiz " \n Thuong so: "
str4: .asciiz "\n   So du  : "

.text	
main:
	li $v0,4
	la $a0,str
	syscall
	
	# nhap so nguyen thu nhat
	li $v0,4
	la $a0,str1
	syscall
	li $v0,5
	syscall
	move $t0,$v0
	
	# nhap so nguyen thu hai
	li $v0,4
	la $a0,str2
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	
	divu $t0,$t1

	mflo $t0
	mfhi $t1
	
	# Thuong so
	li $v0,4
	la $a0,str3
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall

	# So du
	li $v0,4
	la $a0,str4
	syscall
	
	move $a0,$t1
	li $v0,1
	syscall
	
	
	li $v0,10
	syscall
	

