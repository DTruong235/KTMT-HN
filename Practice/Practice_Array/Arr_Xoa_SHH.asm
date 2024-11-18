# xoa so hoan hao trong mang
.data 
Arr: .word 0:100
Input_Sl: .asciiz "Nhap so luong phan tu: "
Input_Arr: .asciiz "Nhap cac phan tu:\n"
Input_Ptu: .asciiz "Nhap phan thu "
Ngoac_vuong_mo: .asciiz "["
Ngoac_vuong_dong: .asciiz "]"
Hai_cham: .asciiz ":"
Output: .asciiz "Mang sau khi xoa so hoan hao: "
Space: .asciiz " "

.text
main:
	li $v0,4
	la $a0,Input_Sl
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,Input_Arr
	syscall
	
	la $t0,Arr
	li $t2,0
	Loop_Input:
		beq $t2,$t1,End_Input
		
		li $v0,4
		la $a0,Input_Ptu
		syscall
		
		li $v0,4
		la $a0,Ngoac_vuong_mo
		syscall
		
		li $v0,1
		move $a0,$t2
		syscall
		
		li $v0,4
		la $a0,Ngoac_vuong_dong
		syscall
		
		li $v0,4
		la $a0,Hai_cham
		syscall
		
		li $v0,5
		syscall
		sw $v0,($t0)
		
		add $t0,$t0,4
		add $t2,$t2,1
		j Loop_Input
	
	End_Input:
		la $t0,Arr
		li $t2,0
		
		li $v0,4
		la $a0,Output
		syscall
		
		li $t5,0
		li $t6,0
		Duyet_Ptu:
			li $t4,2
			li $t7,0
			beq $t2,$t1,Output_Arr
			lw $t3,($t0)
			
			Check_Ptu:
				bgt $t4,$t3,Check_SHH
				divu $t3,$t4
				mflo $t6 #phan ngyuen
				mfhi $t5 #phan du
				beqz $t5,Tinh_SHH
				add $t4,$t4,1
				j Check_Ptu
				Tinh_SHH:
					add $t7,$t7,$t6
					add $t4,$t4,1
					j Check_Ptu
			Check_SHH:
				beq $t7,$t3,Delete_SHH
				add $t2,$t2,1
				addu $t0,$t0,4
				j Duyet_Ptu
		Delete_SHH:

			Loop_Delete:
			bgt $t2,$t1,Next_Duyet_Ptu
			add $t0,$t0,4
			lw $t3,($t0)
			sub $t0,$t0,4
			sw $t3,($t0)
			add $t0,$t0,4
			add $t2,$t2,1
			j Loop_Delete	
				
		Next_Duyet_Ptu:
			la $t0,Arr
			sub $t1,$t1,1
			li $t2,0
			j Duyet_Ptu
		Output_Arr:
			la $t0,Arr
			li $t2,0
			Print_Arr:
				beq $t2,$t1,End
				lw $t3,($t0)
				
				li $v0,1
				move $a0,$t3
				syscall
				
				li $v0,4
				la $a0,Space
				syscall
	
				add $t2,$t2,1
				addu $t0,$t0,4
				j Print_Arr
		End:
			li $v0,10
			syscall
