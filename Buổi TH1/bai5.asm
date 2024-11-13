.data
songuyen1: .asciiz "Nhap vao so nguyen thu nhat: "
songuyen2: .asciiz "Nhap vao so nguyen thu hai: "
songuyen3: .asciiz "Nhap vao so nguyen thu ba: "
ketqua:    .asciiz "Ket qua: "

.text
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
	
	mult $t0,$t1
	
	mflo $t0
	
	mult $t0,$t2
	
	mflo $t0
	
	li $v0,4
	la $a0,ketqua
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall 
	
	li $v0,10
	syscall