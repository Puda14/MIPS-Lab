# Laboratory Exercise 5, Assignment 1
# Author: Phung Tien Dat - 20210163
.data
	test: .asciiz "Hello World"
.text
	li $v0, 4    # $v0 = 4
 	la $a0, test # Load address of test to $a0
 	syscall 
