.data
songuyen1: .asciiz "Nhap vao so nguyen thu nhat: "
songuyen2: .asciiz "Nhap vao so nguyen thu hai: "
songuyen3: .asciiz "Nhap vao so nguyen thu ba: "
max:       .asciiz "	Max: "

.text
.globl main
main:
	li $v0,4
	la $a0,songuyen1
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,4
	la $a0,songuyen2
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,songuyen3
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	
	add $t3,$0,$0
	
	blt $t3,$t0,Max
	Max:
		add $t3,$0,$t0
		blt $t3,$t1,Max1
		j upd
	Max1: 	add $t3,$0,$t1
		j upd
	upd: blt $t3,$t2,Max2
		j exit
	Max2: 
		add $t3,$0,$t2
	exit:
		
	li $v0,4
	la $a0,max
	syscall		
	move $a0,$t3
	li $v0,1
	syscall

	
	li $v0,10
	syscall
