# Laboratory Exercise 3, Assignment 4
# Author: Phung Tien Dat - 20210163
.data
		x: .word 1
		y: .word 2
		z: .word 3
.text
		addi	$s1, $zero, 10	# i = 8 
		addi	$s2, $zero, 9	# j = 9
		la	$a0, x		# set $a0 to x's address 
		lw	$t1, 0($a0)	# set $t1 to contents of y
		la	$a0, y		# set $a0 to y's address
		lw	$t2, 0($a0)	# set $t2 to contents of y
		la	$a0, z		# set $a0 to z's address
		lw	$t3, 0($a0) 	# set $t3 to contents of z 

start_a:
		slt	$t0, $s1, $s2 		# i < j
		beq	$t0, $zero, else_a	# brach to else if i >= j
		addi	$t1, $t1, 1		# then part: x=x+1
		addi	$t3, $zero, 1		# z=1
		j	endif_a			# skip “else” part
else_a:	addi	$t2, $t2, -1		# begin else part: y=y-1
		add	$t3, $t3, $t3 		# z=2*z
endif_a: 



start_b:
		slt	$t0, $s1, $s2 		# i < j
		bne	$t0, $zero, else_b	# brach to else if i < j
		addi	$t1, $t1, 1		# then part: x=x+1
		addi	$t3, $zero, 1		# z=1
		j	endif_b			# skip “else” part
else_b:	addi	$t2, $t2, -1		# begin else part: y=y-1
		add	$t3, $t3, $t3 		# z=2*z
endif_b:


start_c:
		add	$t4, $s1, $s2		# $t4 = i + j
		sgt 	$t0, $t4, 0 		# i + j > 0 
		bne	$t0, $zero, else_c	# brach to else if i + j > 0
		addi	$t1, $t1, 1		# then part: x=x+1
		addi	$t3, $zero, 1		# z=1
		j	endif_c			# skip “else” part
else_c:	addi	$t2, $t2, -1		# begin else part: y=y-1
		add	$t3, $t3, $t3 		# z=2*z
endif_c:


start_d:	
		add	$s6, $zero, 6		# m = 6
		add  $s7, $zero, 7		# n = 7
		add	$t4, $s1, $s2		# $t4 = i + j
		add	$t5, $s6, $s7		# $t5 = m + n
		sgt 	$t0, $t4, $t5  	# i + j > m + n
		beq	$t0, $zero, else_d	# brach to else if i + j > m + b
		addi	$t1, $t1, 1		# then part: x=x+1
		addi	$t3, $zero, 1		# z=1
		j	endif_d			# skip “else” part
else_d:	addi	$t2, $t2, -1		# begin else part: y=y-1
		add	$t3, $t3, $t3 		# z=2*z
endif_d: