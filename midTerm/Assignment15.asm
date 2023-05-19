.data
	Message: .asciiz "Result: "
	array: .word 1,5,1
	endArray: .word
.text
main:
	jal arrayChange
	printResult:
		li $v0, 4
		la $a0, Message
		syscall
		li $v0, 1
		add $a0, $t0, $zero
		syscall
	li $v0, 10
	syscall
endMain:

arrayChange:
	addi $t0, $zero, 0
	la $a0, array
	la $a1, endArray
	addi $a1, $a1, -4
	loop1:
		lw $t1, 0($a0)
		lw $t2, 4($a0)
		loop2:
			slt $t3, $t1, $t2
			bne $t3, $zero, endLoop2
			addi $t2, $t2, 1
			addi $t0, $t0, 1
			j loop2
		endLoop2:	
		sw $t2, 4($a0) 
		addi $a0, $a0, 4
		bne $a0, $a1, loop1
	jr $ra