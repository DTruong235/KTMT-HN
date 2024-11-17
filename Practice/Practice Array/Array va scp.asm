# Mang khong chua so chinh phuong
.data
Array: .word 0:100
Array1: .word 0:100
Input: .asciiz "Nhap so luong phan tu: "
Input1: .asciiz "Nhap cac phan tu cua mang:\n"
Input2: .asciiz "Nhap phan tu thu "
Square_bracket: .asciiz "["
Square_bracket1: .asciiz "]"
Colon: .asciiz ": "
Output: .asciiz "Mang khong chua so chinh phuong: "
Output1: .asciiz "\nMang chua so chinh phuong: "
Space: .asciiz " "

.text
main:
	li $v0,4
	la $a0,Input
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,Input1
	syscall
	
	la $t0,Array
	li $t2,0
Loop_Input:
	bge $t2,$t1,End_Input
	
	li $v0,4
	la $a0,Input2
	syscall
	
	li $v0,4
	la $a0,Square_bracket
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall
	
	li $v0,4
	la $a0,Square_bracket1
	syscall
	
	li $v0,4
	la $a0,Colon
	syscall
	
	li $v0,5
	syscall
	
	sw $v0,($t0)
	
	add $t2,$t2,1
	add $t0,$t0,4
	
	j Loop_Input
End_Input:
	la $t0,Array
	la $t7,Array1
	li $t2,0
	
	li $v0,4
	la $a0,Output
	syscall
	
	Check:
		li $t5,0 #duyet phan tu
		bge $t2,$t1,End
		lw $t3,($t0)
		div $t4,$t3,2 #Pham vi kiem tra phan tu
		mflo $t4
		Check_elemet:
			bgt $t5,$t4,Print
			mul $t6,$t5,$t5
			beq $t6,$t3,Goto_Arr1
			add $t5,$t5,1
			j Check_elemet
		Goto_Arr1:
			sw $t6,($t7)
			add $t8,$t8,1
			add $t7,$t7,4
			add $t2,$t2,1
			add $t0,$t0,4
			j Check
		Print:
			li $v0,1
			move $a0,$t3
			syscall
			
			li $v0,4
			la $a0,Space
			syscall
			
			add $t2,$t2,1
			add $t0,$t0,4
			
			j Check
	End: 
		li $v0,4
		la $a0,Output1
		syscall
		la $t7,Array1
		li $t2,0
		Print1:
			bge $t2,$t8,End1
			lw $t3,($t7)
			li $v0,1
			move $a0,$t3
			syscall
			
			li $v0,4
			la $a0,Space
			syscall
			
			add $t2,$t2,1
			add $t7,$t7,4
			j Print1
	End1:		
		li $v0,10
		syscall
	