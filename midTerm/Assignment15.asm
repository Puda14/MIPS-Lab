#algorithm: start from a[2], calculate needed step to turn a[2] > a[1], then continue
.data
	msg: .asciiz "Result: "
	array: .word 1, 5, 1, 3
	endArray: .word
.text
main:
	jal 	solve
	printResult:
		li 	$v0, 4
		la 	$a0, msg
		syscall
		li 	$v0, 1
		add $a0, $s0, $zero
		syscall
	exit:
		li $v0, 10
		syscall	
solve:
	li 	$s0, 0			#ans
	la 	$t1, array		#address of a[1]
	lw	$t3, 0($t1)		#variable for previous member
	addi	$t1, $t1, 4		#we start from a[2]
	la 	$t2, endArray		#the end
	
	loop:
		lw	$t4, 0($t1)			#t4 = current member
		bgt 	$t4, $t3, done_increase	#if t4 > t3 already, dont have to do anything
		sub	$t5, $t3, $t4			#calculate step need to turn t4 into t3
		addi	$t5, $t5, 1			#increase 1, so t4 > t3
		add	$s0, $s0, $t5			#ans += step
		add	$t4, $t4, $t5			#t4 += step, now t4 > t3
	done_increase:
		sw   $t4, 0($t1)			#change value of element
		addi $t3, $t4, 0			#set t3 = t4, mean pre_mem = cur_mem
		addi	$t1, $t1, 4			#increse i
		blt	$t1, $t2, loop			#if t1 still < t2, we continue
								#else stop
	jr $ra
