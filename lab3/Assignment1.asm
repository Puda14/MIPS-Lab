# Laboratory Exercise 3, Assignment 1
# Author: Phung Tien Dat - 20210163
.text
		addi	$s1, $zero, 6	# i = 6
		addi	$s2, $zero, 4	# j = 4
		addi 	$t1, $zero, 1   # x = 1
		addi 	$t2, $zero, 2	# y = 2
		addi 	$t3, $zero, 3	# z = 3
start:
		slt	$t0, $s2, $s1 		# j < i
		bne	$t0, $zero, else	# brach to else if j < i
		addi	$t1, $t1, 1		# then part: x=x+1
		addi	$t3, $zero, 1	# z=1
		j		endif		    # skip “else” part
else:	addi	$t2, $t2, -1	# begin else part: y=y-1
		add	$t3, $t3, $t3 		# z=2*z
endif:
