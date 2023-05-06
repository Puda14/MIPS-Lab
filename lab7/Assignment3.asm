# Laboratory Exercise 7, Assignment 3
# Author: Phung Tien Dat - 20210163
.text
main: 
	li $s0,112 
	li $s1,36
	jal swap #call max procedure
	nop
	li $v0,10 #terminate
	syscall
endmain:

swap:
	push: 
		addi $sp,$sp,-8 #adjust the stack pointer
		sw $s0,4($sp) #push $s0 to stack
		sw $s1,0($sp) #push $s1 to stack
	pop: 
		lw $s0,0($sp) #pop from stack to $s0
		lw $s1,4($sp) #pop from stack to $s1
 		addi $sp,$sp,8 #adjust the stack pointer
   jr $ra