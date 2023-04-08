# Laboratory Exercise 4, Assignment 2
# Author: Phung Tien Dat - 20210163
.text
	addi $s0, $zero, 0x12345678 # set $s0
	andi $t1, $s0, 0xff000000   # Extract MSB of $s0	
	andi $t2, $s0, 0xffffff00   # Clear LSB of $s0	
	or $t3, $s0, 0x000000ff	   # Set LSB of $s0 (bits 7 to 0 are set to 1)	
	xor $s0, $s0, $s0		   # Clear $s0 (s0=0, use xors)