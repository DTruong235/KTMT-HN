.data
Arr: .word 0:100
Input: .asciiz "Nhap so luong phan tu: "
Input1: .asciiz "Nhap cac phan tu cua mang:\n"
Output: .asciiz "Phan tu lon nhat cua mang: "

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
		la $t0,Arr
		li $t2,0
	Check:
		bge $t2,$t1,End
		lw $t3,($t0)
		bge $t3,$t4,Max
		add $t2,$t2,1
		add $t0,$t0,4
		j Check
	Max:
		add $t4,$t3,0
		add $t2,$t2,1
		add $t0,$t0,4
		j Check
	End:
		li $v0,4
		la $a0,Output
		syscall
	
		li $v0,1
		move $a0,$t4
		syscall
		
		li $v0,10
		syscall
		
	