.data
Arr: .word 0:100
Input: .asciiz "Nhap so luong phan tu: "
Input1: .asciiz "Nhap cac phan tu cua mang:\n"
Input2: .asciiz "Nhap phan tu can chen:\n"
Input3: .asciiz "Nhap vi tri can chen:\n"
Output: .asciiz "Mang sau khi chen: "
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
	
	la $t0,Arr
	
	Loop_Input:
		bge $t2,$t1,End_Input
		li $v0,5
		syscall
		sw $v0,($t0)
		add $t2,$t2,1
		add $t0,$t0,4
		j Loop_Input
	End_Input:
		li $v0,4
		la $a0,Input3
		syscall
	
		li $v0,5
		syscall
		move $t3,$v0 #vi tri
		
		li $v0,4
		la $a0,Input2
		syscall
	
		li $v0,5
		syscall
		move $t4,$v0 #phan tu
		
		add $t1,$t1,1 #tang do dai mang len 1
		la $t0,Arr
		li $t2,0
	#Chen phan tu
		mul $t6,$t3,4 # tinh vi tri can chen
		add $t0,$t0,$t6 # di toi vi tri can chen
	
		lw $t5,($t0) 
		sw $t4,($t0) #chèn phan tu 
		#Lùi các lui cac phan tu ve 1 
	Back:
		add $t0,$t0,4 
		lw $t4,($t0) 
		sw $t5,($t0) 
		add $t5,$t4,0 
		add $t3,$t3,1
		blt $t3,$t1,Back
	li $v0,4
	la $a0,Output
	syscall
	la $t0,Arr
	Print:
		bge $t2,$t1,End
		li $v0,4
		la $a0,Space
		syscall
		
		lw $t3,($t0)
		li $v0,1
		move $a0,$t3
		syscall
		
		add $t2,$t2,1
		add $t0,$t0,4
		j Print
	End: 
		li $v0,10
		syscall
		
		
		
