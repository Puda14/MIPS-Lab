# Laboratory Exercise 3, Assignment 5
# Author: Phung Tien Dat - 20210163

.data
	A: .word 2,0,4,-10,6,7
.text
	addi $s1, $zero, 0 # i = 0
	addi $s4, $zero, 1 # step = 1
	addi $s3, $zero, 6 # n = 6
	la $s2, A		    # Load address A[0] to $s2
	lw $t0, 0($s2)	    # Load value of A[0] in $t0 
	add $s5, $zero,$t0 # sum = A[0]

loop_a:
	add $s1,$s1,$s4 #i=i+step
	add $t1,$s1,$s1 #t1=2*s1
	add $t1,$t1,$t1 #t1=4*s1
	add $t1,$t1,$s2 #t1 store the address of A[i]
	lw  $t0,0($t1)  #load value of A[i] in $t0
	add $s5,$s5,$t0 #sum=sum+A[i]
	slt $t2,$s1,$s3 # i < n
	bne $t2,$zero,loop_a#if i < n, goto loop_a

loop_b:
	add $s1,$s1,$s4 #i=i+step
	add $t1,$s1,$s1 #t1=2*s1
	add $t1,$t1,$t1 #t1=4*s1
	add $t1,$t1,$s2 #t1 store the address of A[i]
	lw  $t0,0($t1)  #load value of A[i] in $t0
	add $s5,$s5,$t0 #sum=sum+A[i]
	sgt $t2,$s1,$s3 # i > n
	beq $t2,$zero,loop_b#if i <= n, goto loop_b
		
loop_c:
	add $s1,$s1,$s4 #i=i+step
	add $t1,$s1,$s1 #t1=2*s1
	add $t1,$t1,$t1 #t1=4*s1
	add $t1,$t1,$s2 #t1 store the address of A[i]
	lw  $t0,0($t1)  #load value of A[i] in $t0
	add $s5,$s5,$t0 #sum=sum+A[i]
	slt $t2,$s5,$zero# sum < 0
	beq $t2,$zero,loop_c#if sum >= 0, goto loop_c
	
loop_d:
	add $s1,$s1,$s4 #i=i+step
	add $t1,$s1,$s1 #t1=2*s1
	add $t1,$t1,$t1 #t1=4*s1
	add $t1,$t1,$s2 #t1 store the address of A[i]
	lw  $t0,0($t1)  #load value of A[i] in $t0
	add $s5,$s5,$t0 #sum=sum+A[i]
	beq $t0,$zero,loop_d#if A[i]==0, goto loop_d