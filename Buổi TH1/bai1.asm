.data
str:   .asciiz "	PHEP CONG 	"
str1:  .asciiz "Nhap vao so nguyen thu nhat: "
str2:  .asciiz "Nhap vao so nguyen thu hai: "
str3:  .asciiz "\n"
str4:  .asciiz "Tong hai so nguyen: "

.text
main:
	la $a0,str # la(load) ?ùng ?? n?p d? li?u t? b? nh? vào thanh ghi 
	addi $v0,$zero,4
	syscall 
	
	la $a0,str3
	addi $v0,$zero,4  #li $v0,4
	syscall 
	#nhap vao so nguyen thu nhat
	la $a0,str1 
	addi $v0,$zero,4  #li $v0,4
	syscall 
	
	addi $v0,$zero,5
	syscall
	move $t1,$v0
	#nhap vao so nguyen thu 2
	la $a0,str2
	addi $v0,$zero,4 # li $v0,4
	syscall 
	
	addi $v0,$zero,5
	syscall
	move $t2,$v0
	#tinh tong
	add $t3,$t1,$t2
	
	la $a0,str4
	addi $v0,$zero,4 #li $v0,4
	syscall 
	
	move $a0,$t3 #luu ket qua vao bo nho
	addi $v0,$zero,1 #in ra ket qua  #li $v0,1
	syscall 
	
	addi $v0,$zero,10 #thoat chuong trinh  #li $v0,10
	syscall