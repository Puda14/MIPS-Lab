# Laboratory Exercise 3, Assignment 1
# Author: Phung Tien Dat - 20210163
.data
		x: .word 1
		y: .word 2
		z: .word 3
.text
		addi	$s1, $zero, 8	# i = 8 
		addi	$s2, $zero, 9	# j = 9
		la	$a0, x		# set $a0 to x's address 
		lw	$t1, 0($a0)	# set $t1 to contents of y
		la	$a0, y		# set $a0 to y's address
		lw	$t2, 0($a0)	# set $t2 to contents of y
		la	$a0, z		# set $a0 to z's address
		lw	$t3, 0($a0) 	# set $t3 to contents of z 
start:
		slt	$t0, $s2, $s1 		# j < i
		bne	$t0, $zero, else	# brach to else if j < i
		addi	$t1, $t1, 1		# then part: x=x+1
		addi	$t3, $zero, 1		# z=1
		j		endif		# skip “else” part
else:	addi	$t2, $t2, -1		# begin else part: y=y-1
		add	$t3, $t3, $t3 		# z=2*z
endif: 
	
