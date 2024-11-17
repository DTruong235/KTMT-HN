.data
cd: .asciiz " Nhap vao chieu dai : "
cr: .asciiz " Nhap vao chieu rong: "
cv: .asciiz " Chu vi             : "

.text
main: 
	li $v0,4
	la $a0,cd
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,4
	la $a0,cr
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0

	add $t2,$t0,$t1
	
	ori $t3,$0,2
	
	mult $t2,$t3
	
	mflo $t2
	
	li $v0,4
	la $a0,cv
	syscall
	
	move $a0,$t2
	li $v0,1
	syscall
	
	li $v0,10
	syscall	