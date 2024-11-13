.data
str1: .asciiz "Nhap vao so nguyen n: "
true: .asciiz " La so chinh phuong!"
false: .asciiz " Khong la so chinh phuong!"
.text
main:
	li $v0,4
	la $a0,str1
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	addiu $t1,$t1,1 # bien i=1 
	
	Loop:
		 bgt $t1,$t0,False
		 div $t0,$t1
		 mflo $t2 # so gia tri nguyen vao thanh ghi t2
		 
		 beq $t2,$t1,True
		 add $t1,$t1,1
		 
		 j Loop
		 
	False:
		li $v0,4
		la $a0,false
		syscall
		
		j Exit
		 
	True: 
		li $v0,4
		la $a0,true
		syscall
	
	Exit:
		li $v0,10
		syscall