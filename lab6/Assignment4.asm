# Laboratory Exercise 6, Assignment 4
# Author: Phung Tien Dat - 20210163

.data
	A: .word 1000,2000,1000000000,10,1000
	#A: .word 3,2,1
	Aend: .word
.text
main: 
	la $a0,A #$a0 = Address(A[0])
	la $a1,Aend
	addi $a1,$a1,-4#$a1 = Address(A[n-1])	
	addi $a2,$a0,0 #$a2 = Address(A[0])
	j insertion_sort  #sort
after_sort: 
	j print_array
	after_print:
	li $v0, 10 #exit
	syscall
end_main:

insertion_sort:
loop1:
	addi $a2,$a2,4 
	slt $t2,$a1,$a2
	bne $t2,$zero,return
	addi $t0,$a2,0 
	loop2:
		sgt $t2,$t0,$a0
		beq $t2,$zero,exit_loop2
		addi $t1, $t0, -4
		lw $t3,0($t0)#$t3 = A[j]
		lw $t4,0($t1)#$t4 = A[j-1]
		slt $t2,$t3,$t4#A[j-1]>A[j]
		bne $t2,$zero,swap
		j exit_loop2
	swap:
		sw $t3,0($t1)
		sw $t4,0($t0)
		addi $t0,$t0,-4
		j loop2 
	exit_loop2:
		j loop1
return:
	j after_sort
	
print_array:
	addi $t0, $a0, 0
	addi $a1, $a1, 4
	loop3:
		slt $t6, $t0, $a1
		beq $t6, $zero, after_print
		li $v0, 1
		lw $a0, 0($t0)
		syscall
		li $v0, 11
		li $a0, 32
		syscall
		addi $t0, $t0, 4
		j loop3
