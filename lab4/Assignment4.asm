# Laboratory Exercise 4, Assignment 3
# Author: Phung Tien Dat - 20210163
.text
     li $t3, 0 #No Overflow is default status
     
	addi $s0, $zero, 0x80000000 
	addi $s1, $zero, 0xFFFFFFFF
	
	xor  $t0, $s0, $s1 # Test if $s0 and $s1 have the same sign
	bltz $t0, EXIT	    # if NOT, EXIT
	
	addu $s2, $s0, $s1 # $s2 = $s0 + $s1
	xor	$t1, $s2, $s0 # Test if $s2 and $s1 have the same sign
	bltz $t1, OVERFLOW # if NOT, OVERFLOW
	j	EXIT
OVERFLOW:
	li $t3, 1 #the result is overflow
EXIT: