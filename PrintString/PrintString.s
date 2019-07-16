###########################################################
# Author: Filip Matic
# Description: This is my first assembly language program.
# It prints: 
#	"Sample Text 1. 
#	 Sample Text 2".
###########################################################

#data declarations: declare variable names used in program, storage allocated in RAM
		.data
message1:	.asciiz "Sample Text 1.\n" 	#Create first string
message2:	.asciiz "Sample Text 2.\n"	#Create second string

#Program code is contained below under .text
	.text
	.globl  main		# Define a global function main

#The program begins execution at main()
main:
	la	$a0, message1	# $a0 = address of message1
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall				# Call print_string() for the first string
	
	la	$a0, message2	# $a0 = address of message2
	li 	$v0, 4			# $v0 = 4 --- This is to call print_string()
	syscall				# Call print_string() for the second string
	jr	$ra				# Return