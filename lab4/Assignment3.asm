# Laboratory Exercise 4, Assignment 3
# Author: Phung Tien Dat - 20210163
.text
	li $s1, -2
	li $s2, 3
	
	#a. abs $s0, $s1
	sra $t0, $s1, 0x0000001f
	xor $s0, $t0, $s1
	subu $s0, $s0, $t0
	
	# b. move $s0, $s1
	addu $s0, $zero, $s1
	
	#not $s0, $s1
	nor $s0, $s1, $zero
	
	# d. ble $s1, $s2, label
	slt $t0, $s2, $s1
	beq $t0, $zero, label
label:
