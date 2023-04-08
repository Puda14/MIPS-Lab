# Laboratory Exercise 4, Assignment 5
# Author: Phung Tien Dat - 20210163
.text	
	li $s0, 9
	li $s1, 32
	li $s2, 0
	add $t0, $s1, $zero
loop:
	beq $t0, 1, multiple
	srl $t0, $t0, 1
	addi $t2, $t2, 1
	j loop
multiple:
	sllv $s3, $s0, $t2