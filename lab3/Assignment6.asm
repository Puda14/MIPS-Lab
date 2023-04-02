# Laboratory Exercise 3, Assignment 6
# Author: Phung Tien Dat - 20210163
.data
	A: .word 10,4,-6,7,-20,-2,3,8,9,1 # length(arr)=n= 10
.text
	addi $s1, $zero, 0 # i = 0
	addi $s2, $zero, 1 # step = 1
	addi $s3, $zero, 10# n = 10
	addi $s4, $zero, 0 # max = 0
	la $a0, A		    # Load address A[0] to $a0
	lw $s4, 0($a0)	    # Load value of A[0] in $s4=max
	abs $s4, $s4	    # max = abs(A[i])
loop:
	slt $t0, $s1, $s3 # i < n
	beq $t0, $zero, endloop
	add $s1,$s1,$s2 #i=i+step
	add $t1,$s1,$s1 #t1=2*s1
	add $t1,$t1,$t1 #t1=4*s1
	add $t1,$t1,$a0 #t1 store the address of A[i]
	lw  $t2,0($t1)  #load value of A[i] in $t2
	abs $t2, $t2	 #abs(A[i])	
	sgt $t3,$t2,$s4 #A[i] > max
	bne $t3,$zero,update #if A[i]>max, goto update max=A[i]
	j   loop#goto loop	
	update: add $s4, $t2, $zero#update max=A[i]
		   j	  loop#goto loop	
endloop: 