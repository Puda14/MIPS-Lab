# Laboratory Exercise 5, Assignment 2
# Author: Phung Tien Dat - 20210163
.data
	#“The sum of (s0) and (s1) is (result)” 
	Message1: .asciiz "The sum of "
	Message2: .asciiz " and "
	Message3: .asciiz " is "
.text
	li $s0, 100
	li $s1, 222
	
	#print Message1
	la $a0, Message1
	li $v0, 4 
	syscall 
	
	#print $s0
	add $a0, $zero, $s0
	li $v0, 1
	syscall 
	
	#print Message2
	la $a0, Message2
	li $v0, 4  
	syscall 
	
	#print $s1
	add $a0, $zero, $s1
	li $v0, 1
	syscall 
	
	#print Message3
	la $a0, Message3
	li $v0, 4  
	syscall 
	
	#print $s0 + $s1
	add $a0, $s0, $s1
	li $v0, 1
	syscall 