#Write a program to get decimal numbers, display those numbers in binary and hexadecimal
.data
	Message: .asciiz "Enter a decimal number: "
	convertBinary: .asciiz "Binary: "
	convertHex: .asciiz "Hexa: "
	endLine: .asciiz "\n"
	hexDigit:.asciiz "0123456789ABCDEF"
.text

main:
	li $v0, 51
	la $a0, Message
	syscall 
	
	add $a1, $a0, $zero
	jal decimalToBinary
	li $v0, 4
	la $a0, endLine
	syscall
	jal decimalToHex

	li $v0, 10
	syscall
endMain:

decimalToBinary:
	addi $t0, $zero, 32
	addi $t1, $zero, 0 #index
	addi $t2, $a1, 0 
	addi $fp, $sp, 0
	print1:
		li $v0, 4
		la $a0, convertBinary
		syscall
	loop1:
		addi $sp, $sp, -4
		andi $t3, $t2, 1
		srl $t2, $t2, 1# next bit
		sw $t3, 0($sp) #store bit to stack
		addi $t1, $t1, 1
		slt $t4, $t1, $t0 # index < 32
		bne $t4, $zero, loop1
	
	li $v0, 1 #option to print
	showBinary:
		lw $t3, 0($sp)
		add $a0, $t3, $zero
		syscall
		addi $sp, $sp, 4
		slt $t4, $sp, $fp
		bne $t4, $zero, showBinary
	freeFrameStack1:
	addi $fp, $zero, 0 
	jr $ra
	
decimalToHex:
	addi $t0, $zero, 8
	addi $t1, $zero, 0 #index
	addi $t2, $a1, 0 
	addi $fp, $sp, 0
	print2:
		li $v0, 4
		la $a0, convertHex
		syscall
	loop2:
		addi $sp, $sp, -4
		andi $t3, $t2, 15
		srl $t2, $t2, 4# next bit
		sw $t3, 0($sp) #store bit to stack
		addi $t1, $t1, 1
		slt $t4, $t1, $t0 # index < 32
		bne $t4, $zero, loop2
	
	li $v0,11 #option to print
	showHex:
		lw $t3, 0($sp)
		lb $a0,hexDigit($t3)
		syscall
		addi $sp, $sp, 4
		slt $t4, $sp, $fp
		bne $t4, $zero, showHex
	freeFrameStack2:
	addi $fp, $zero, 0 
	jr $ra
