# Laboratory Exercise 7, Assignment 1
# Author: Phung Tien Dat - 20210163
.text
main: 
	li $a0,-45 #load input parameter
	jal abs #jump and link to abs procedure
	nop
	add $a1, $zero, $v0 #$a1 = abs($a0)
	li $v0,10 #terminate
	syscall
endmain:
abs:
	sub $v0,$zero,$a0 #put -(a0) in v0; in case (a0)<0
	bltz $a0,done #if (a0)<0 then done
	nop
	add $v0,$a0,$zero #else put (a0) in v0
done:
	jr $ra
