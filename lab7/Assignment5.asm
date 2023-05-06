# Laboratory Exercise 7, Assignment 5
# Author: Phung Tien Dat - 20210163
.data
	Message1: .asciiz "Largest: "
	Message2: .asciiz "Smallest: "
	Comma: .asciiz ","
	Endline: .asciiz "\n"
.text
main: 
	jal warp
	print: 
		add $a1, $v0, $zero # $a1 = result from max(list)
		add $a2, $v1, $zero # $a1 = result from min(list)
		
		li $v0, 4
		la $a0, Message1
		syscall
		
		li $v0, 1
		addi $a0, $a1, 0
		syscall
		
		li $v0, 4
		la $a0, Comma
		syscall
		
		li $v0, 1
		addi $a0, $t0, 0
		syscall
		
		li $v0, 4 
		la $a0, Endline
		syscall
		
		li $v0, 4 
		la $a0, Message2
		syscall
		
		li $v0, 1
		addi $a0, $a2, 0
		syscall
		
		li $v0, 4
		la $a0, Comma
		syscall
		
		li $v0, 1
		addi $a0, $t1, 0
		syscall
		
	quit: 
		li $v0, 10 #terminate
 		syscall
endmain:

warp:
	addi $fp, $sp, 0
	addi $sp, $sp, -32
	
	addi $s0, $zero, 20
	sw $s0, 28($sp)
	addi $s1, $zero, 30
	sw $s1, 24($sp)
	addi $s2, $zero, 20
	sw $s2, 20($sp)
	addi $s3, $zero, -99
	sw $s3, 16($sp)
	addi $s4, $zero, 40
	sw $s4, 12($sp)
	addi $s5, $zero, 22
	sw $s5, 8($sp)
	addi $s6, $zero, 35
	sw $s6, 4($sp)
	addi $s7, $zero, 21
	sw $s7, 0($sp)
	
	addi $v0, $zero, 0x80000000 # value of max element
	addi $v1, $zero, 0x7fffffff # value of min element
	addi $t0, $zero, 7 # index of max element
	addi $t1, $zero, 7 # index of min element
	addi $t7, $zero, 7 # index
loop:
	lw $t2, 0($sp)
	
	check_max:
	slt $t3, $v0, $t2 #check: max < current 
	beq $t3, $zero, check_min # if max > current then next check
	addi $v0, $t2, 0 #if max < current then update: max = current
	addi $t0, $t7, 0 # update index
	
	check_min:
	slt $t3, $t2, $v1#check: current < min
	beq $t3, $zero, continue# if current > min then continue
	addi $v1, $t2, 0 #if min > current then update: min = current
	addi $t1, $t7, 0 #update idex
	
	continue:
	addi $sp, $sp, 4
	addi $t7, $t7, -1
	bne $sp, $fp, loop
	jr $ra