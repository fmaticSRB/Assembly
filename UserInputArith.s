###########################################################
# Author: Filip Matic
# Description: This program asks the user for four
#	integers and then performs arithmetic 
#	operations on the entered integers
###########################################################

#Data declaration: Declare variable names used in the program.
		.data
message1:	.asciiz "Enter a value:\n"
message2:	.asciiz "Enter another value:\n"
message3:	.asciiz "Enter one more value:\n"
message4:	.asciiz "Enter one more value:\n"
message5:	.asciiz "num3+num2= "
message6:	.asciiz "\nnum3-num1= "
message7:	.asciiz "\nnum1*num4= "
message8:	.asciiz "\nnum2/num1= "
message9:	.asciiz "\nnum4 mod num3= "
message10:	.asciiz "\nnum2+((((num4-5)/6)*num1)-num3)= "
num1:		.word	6

#Program code is contained below under .text
		.text
		.globl	main	# Define a global function main
		
#The program begins execution at main()
main:
	la	$a0, message1	# $a0 = address of message1
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall				# Call print_string()
	li	$v0, 5			# Call read_int()
	syscall				# Read in user entered value
	add	$s0, $v0, 0		# Place the entered integer into $s0

	la	$a0, message2	# $a0 = address of message2
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall				# Call print_string()
	li	$v0, 5			# Call read_int()
	syscall				# Read in user entered value
	add	$s1, $v0, 0		# Place the entered integer into $s1
	
	la	$a0, message3	# $a0 = address of message3
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall				# Call print_string()
	li	$v0, 5			# Call read_int()
	syscall				# Read in user entered value
	add	$s2, $v0, 0		# Place the entered integer into $s2
	
	la	$a0, message4	# $a0 = address of message4
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall				# Call print_string()
	li	$v0, 5			# Call read_int()
	syscall				# Read in user entered value
	add	$s3, $v0, 0		# Place the entered integer into $s3
	
	la	$a0, message5	# $a0 = address of message5
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall	
	add	$t0, $s2, $s1	# $t0 = $s2 + $s1 (Add 2nd and 3rd integers entered)
	move	$a0, $t0	# $a0 gets $t0
	li	$v0, 1			# $v0 = 1 --- This is to call print_int()
	syscall				# Call print_int()
	
	la	$a0, message6	# $a0 = address of message6
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall	
	sub	$t0, $s2, $s0	# $t0 = $s2 - $s0 (Subtract the 3rd and 1st integers entered)
	move	$a0, $t0	# $a0 gets $t0
	li	$v0, 1			# $v0 = 1 --- This is to call print_int()
	syscall				# Call print_int()
	
	la	$a0, message7	# $a0 = address of message7
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall	
	mult	$s0, $s3	# Multiply the 1st and 4th integers entered ($s0 * $s3)
	mflo	$a2			# Move the result to $a2
	move	$a0, $a2	# $a0 gets $a2
	li	$v0, 1			# $v0 = 1 --- This is to call print_int()
	syscall				# Call print_int()
	
	la	$a0, message8	# $a0 = address of message8
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall	
	div	$s1, $s0		# Divide the 2nd and 1st integers entered ($s1/$s0)
	mflo	$a2			# Store the quotient of the division to $a2
	move	$a0, $a2	# $a0 gets $a2
	li	$v0, 1			# $v0 = 1 --- This is to call print_int()
	syscall				# Call print_int()
	
	la	$a0, message9	# $a0 = address of message9
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall	
	div	$s3, $s2		# Divide the 4th and 3rd integers entered ($s3/$s2)
	mfhi	$a2			# Store the remainder of the division to $a2
	move	$a0, $a2	# $a0 gets $a2
	li	$v0, 1			# $v0 = 1 --- This is to call print_int()
	syscall				# Call print_int()
	
	la	$a0, message10	# $a0 = address of message10
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall	
	sub	$s4, $s3, 5		# $s4 = $s3 - 5 (Subtract 5 from the 4th entered integer
	lw	$t1, num1		# $t1 gets 6
	div	$s4, $t1		# Divide previous result by 6
	mflo	$a2			# Store the quotient of the division to $a2
	move	$s5, $a2	# $s5 gets $a2
	mult	$s5, $s0	# Multiply the result by the 1st integer
	mflo	$a2			# Move the result to $a2
	move	$s6, $a2	# $s6 gets $a2
	sub	$s7, $s6, $s2	# Subtract the 3rd integer from the latest result ($s7 = $s6 - $s2)
	add	$t3, $s7, $s1	# Add the 2nd integer to the previous result ($t3 = $s7 + $s1)
	move	$a0, $t3	# $a0 gets $t3
	li	$v0, 1			# $v0 = 1 --- This is to call print_int()
	syscall				# Call print_int()
	
	jr	$ra			# Return