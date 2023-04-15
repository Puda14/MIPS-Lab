# Laboratory Exercise 5, Assignment 5
# Author: Phung Tien Dat - 20210163
.data
	Message1: .asciiz "Chuoi da nhap la: ”
	Message2: .asciiz "Chuoi dao nguoc la: ”
	Message3: .asciiz "\n”
	string: .space 20
.text
GET_STRING:
	li $v0, 8
	la $a0, string
	li $a1, 20
	syscall
	
	#print string input
	la $a0, Message1
	li $v0, 4 
	syscall  
	la $a0, string
	li $v0, 4 
	syscall
	la $a0, Message3
	li $v0, 4 
	syscall
	
GET_LENGTH:
		la $a0, string # a0 = Address(string[0])
 		xor $v0, $zero, $zero # v0 = length = 0
 		xor $t0, $zero, $zero # t0 = i = 0
	check_char: 
		add $t1, $a0, $t0 # t1 = a0 + t0
 				   #= Address(string[0]+i)
 		lb $t2, 0($t1) # t2 = string[i]
 		beq $t2,$zero,end_of_str # Is null char?
 		addi $v0, $v0, 1 # v0=v0+1->length=length+1
 		addi $t0, $t0, 1 # t0=t0+1->i = i + 1
 		j check_char
	end_of_str:
	end_of_get_length:
	save_length: 
		add $t2, $zero, $v0 
		subi $t2, $t2, 1 #NULL characters are not counted 
	
REVERSE_STRING:
	add $t0, $zero, $zero #i = 0
	add $t1, $zero, $t2	  #j = length
	loop:
		slt $t3, $t0, $t1 # $t3 = (i < j) ? 1 : 0
		beq $t3, $zero, exit # (i>=j) => exit
		add $t4, $a0, $t0
		add $t5, $a0, $t1
		lb $t6, 0($t4) #$t6 = str[i]
		lb $t7, 0($t5) #$t7 = str[j]
		sb $t7, 0($t4) #str[i] = $t7
		sb $t6, 0($t5) #str[i] = $t6
		addi $t0, $t0, 1#i++
		subi $t1, $t1, 1#j--
		j loop
	exit:
	
	#Print the reverse string
	la $a0, Message2
	li $v0, 4 
	syscall  
	
	la $a0, string
	li $v0, 4 
	syscall 