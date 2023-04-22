# Laboratory Exercise 6, Assignment 4
# Author: Phung Tien Dat - 20210163

.data
	#A: .word 7, -2, 5, 1, 5,6,7,3,60,8,8,59,5
	A: .word 3,2,1
	Aend: .word
.text
main: 
	la $a0,A #$a0 = Address(A[0])
	la $a1,Aend
	addi $a1,$a1,-4#$a1 = Address(A[n-1])	
	addi $a2,$a0,0 #$a2 = Address(A[0])
	j insertion_sort  #sort
after_sort: 
	li $v0, 10 #exit
	syscall
end_main:

insertion_sort:
loop1:
	addi $a2,$a2,4 #set i
	slt $t2,$a1,$a2#n<i ?
	bne $t2,$zero,return# if(n<i) return
	addi $t0,$a2,0 #set j
	loop2:
		sgt $t2,$t0,$a0#j>0
		beq $t2,$zero,exit_loop2#if(j<=0) exit
		addi $t1, $t0, -4#set j-1
		lw $t3,0($t0)#A[j]
		lw $t4,0($t1)#A[j-1]
		slt $t2,$t3,$t4#A[j-1]>A[j]
		bne $t2,$zero,swap
		j exit_loop2
	swap:
		sw $t3,0($t1)
		sw $t4,0($t0)
		addi $t0,$t0,-4#j--
		j loop2 
	exit_loop2:
		j loop1
return:
	j after_sort
