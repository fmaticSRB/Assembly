###########################################################
# Author: Filip Matic
# Description: This program loads addresses of variables, 
#	performs arithmetic on the variables, 
#	and uses syscall to display the results. 
###########################################################

#Data declaration: Declare variable names used in the program.
		.data
message1:	.asciiz "num1 is: "
message2:	.asciiz "\nnum2 is: "
message3:	.asciiz "\nnum1+num2= "
message4:	.asciiz "\nnum1-num2= "
num1:		.word	65374
num2:		.word	0xC7F

#Program code is contained below under .text
		.text
		.globl	main		# Define a global function main

#The program begins execution at main()
main:
	la	$a0, message1	# $a0 = address of message1
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall				# Call print_string()
	lw	$t0, num1		# $t0 gets num1
	move	$a0, $t0	# $a0 gets $t0 (Which is num1)
	li	$v0, 1			# $v0 = 1 --- This is to call print_int()
	syscall				# Call print_int()
	
	la	$a0, message2	# $a0 = address of message2
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall				# Call print_string()
	lw	$t0, num2		# $t0 gets num2
	move	$a0, $t0	# $a0 gets $t0 (Which is num2)
	li	$v0, 1			# $v0 = 1 --- This is to call print_int()
	syscall				# Call print_int()
	
	
	la	$a0, message3	# $a0 = address of message3
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall				# Call print_string()
	lw	$t0, num1		# $t0 gets num1
	lw	$t1, num2		# $t1 gets num2
	add	$t2, $t0, $t1	# Add $t1 and $t0 and store the result to $t2
	move	$a0, $t2	# $a0 = address of $t2
	li 	$v0, 1			# $v0 = 1 --- This is to call print_int()
	syscall				# Call print_int()
	
	la	$a0, message4	# $a0 = address of message4
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall				# Call print_string()
	lw	$t0, num1		# $t0 gets num1
	lw	$t1, num2		# $t1 gets num2
	sub	$t2, $t0, $t1	# Sutract $t1 and $t0 and store the result to $t2
	move	$a0, $t2	# $a0 = address of $t2
	li 	$v0, 1			# $v0 = 1 --- This is to call print_int()
	syscall				# Call print_int()
	
	jr	$ra			# Return