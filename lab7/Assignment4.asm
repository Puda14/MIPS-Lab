# Laboratory Exercise 7, Assignment 4
# Author: Phung Tien Dat - 20210163
.data
	Message: .asciiz "Ket qua tinh giai thua la: "
.text
main: 
	jal warp
	print: 
		add $a1, $v0, $zero # $a1 = result from N!
		li $v0, 56
		la $a0, Message
		syscall
	quit: 
		li $v0, 10 #terminate
 		syscall
endmain:

warp:
	li $a0, 3 #$a0 = n
	addi $sp, $sp, -4#need store $ra to come back main:
	sw $ra, 0($sp)
	jal fact
	nop
	lw $ra, 0($sp)
	addi $sp, $sp, 4 
	jr $ra
fact:
	addi $sp, $sp, -8#need store $a0 and $ra
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	slti $t0, $a0, 2
	beq $t0, $zero, loop#if n >=2 then store n-1 to stack
	addi $v0, $zero, 1 #if n < 2 then n! = 1
	addi $sp, $sp, 8
	jr $ra
loop:
	addi $a0, $a0, -1#n=n-1
	jal fact 
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	mul $v0,$a0,$v0
	jr $ra