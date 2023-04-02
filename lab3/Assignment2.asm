# Laboratory Exercise 3, Assignment 2
# Author: Phung Tien Dat - 20210163
.data
	A: .word 2,3,4,5,6,7
.text
	addi $s1, $zero, 0 # i = 0
	addi $s4, $zero, 1 # step = 1
	addi $s3, $zero, 6 # n = 6
	la $s2, A		    # Load address A[0] to $s2
	lw $t0, 0($s2)	    # Load value of A[0] in $t0 
	add $s5, $zero,$t0 # sum = A[0]
	
loop:
	add $s1,$s1,$s4 #i=i+step
	add $t1,$s1,$s1 #t1=2*s1
	add $t1,$t1,$t1 #t1=4*s1
	add $t1,$t1,$s2 #t1 store the address of A[i]
	lw $t0,0($t1)   #load value of A[i] in $t0
	add $s5,$s5,$t0 #sum=sum+A[i]
	bne $s1,$s3,loop#if i != n, goto loop