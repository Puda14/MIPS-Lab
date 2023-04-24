# Laboratory Exercise 6, Assignment 3
# Author: Phung Tien Dat - 20210163

.data
	A: .word 1, 4, 2, 10, 3, 5, 6 ,7 ,8 ,9
	#A: .word 3,2,1
	Aend: .word
.text
main: 
	la $a0,A #$a0 = Address(A[0])
	la $a1,Aend
	la $a2,Aend	#$a2 = Address(A[n])	
	addi $a1,$a1,-4#$a1 = Address(A[n-1])
	addi $t0,$a0,0 #$t0 = Address(a[0])
	j bubble_sort #sort
after_sort: 
	j print_array
	after_print:
	li $v0, 10 #exit
	syscall
end_main:

bubble_sort:
loop1:
	slt $t6, $t0, $a1 #i<n
	beq $t6, $zero, return #if i>=n return
	addi $t1, $a0, 0 # $t1 = address of a[0]
	subi $a2, $a2, 4 # $a2 = address of a[n-1]
	loop2:
		slt $t6,$t1,$a2# j < n-i
		beq $t6, $zero, exit_loop2# if j>=n-i
		addi $t2, $t1, 4 # $t2 = address of a[j+1]
		lw $t3, 0($t1) #$t3 = value of a[j]
		lw $t4, 0($t2) #$t4 = value of a[j+1]
		slt $t5, $t3, $t4
		beq $t5, $zero, swap
		addi $t1, $t1, 4# $t1 =  address of next elemets
		j loop2
	swap:
		sw $t3, 0($t2)
		sw $t4, 0($t1)
		addi $t1, $t1, 4# $t1 = address of next elemets
		j loop2
	exit_loop2:
		addi $t0, $t0, 4# $t0 = address of next elemets
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
