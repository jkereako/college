#################################
# Programmer: Jeff Kereakoglow	#
# Exercise: Homework 7		#
# Description: Prints the pay-	#
# roll activity FOR six people.	#
# Added a menu.			#
#				#
# Date: Oct. 30, 2007		#
#################################


.data

	menu_item:	.asciiz "\n\n 1) Print record\n 2) Change hours worked\n 3) Change pay rate\n 4) Print payroll report\n 5) Quit\n\n Input: "
	
	prompt_a:	.asciiz "\n Indicate the employee (Enter number):"
	employee_prompt:.asciiz "\n 1) Joe Johnson\n 2) Fred Flinstone\n 3) Barney Rubble\n 4) George Jetson\n 5) Judy Jetson\n 6) Astro Jetson\n"

	new_rate:	.asciiz "\n Enter new pay rate:"
	new_hours:	.asciiz "\n Enter new hours worked:"

	header:		.asciiz "\n Employee\t\tPay Rate Pay\tHours Worked\tRegular Pay\t\tOvertime Pay\tTotal Pay"

	joej:   	.asciiz " Joe Johnson"
	fredf:	 	.asciiz "\n Fred Flinstone"
	barney:  	.asciiz "\n Barney Rubble"
	georgej: 	.asciiz "\n George Jetson"
	judyj:   	.asciiz "\n Judy Jetson  "
	astroj:  	.asciiz "\n Astro Jetson"
	ttl_payr:   	.asciiz "\n\n Total Payroll:    \t\t\t\t\t\t\t\t\t\t\t\t\t"

	newl:		.asciiz "\n"
	tab:		.asciiz "\t"
	tab3:		.asciiz "\t\t\t"
	tab4:		.asciiz "\t\t\t\t"

	record: 	.word	joej, 2, 36
			.word	fredf, 4, 48
			.word 	barney, 3, 42
			.word	georgej, 4, 40
			.word	judyj, 5, 38
			.word	astroj, 4, 44

.text

main:
	addi	$sp, $sp, -4		# Allocates space in memory
	sw	$ra, 0($sp)		# Store the return address

	#############################
	#     	  THE MENU	    #
	#############################
MENU:
	la 	$a0, menu_item		# Load the address of the menu
	jal	PRINT_STR		# Print the menu
	jal 	GET_INPUT		# Retrieve initial input
	move	$t8, $v0		# Store input into $t8

	li	$t0, 1			# Load 1 into $t0
	li	$t1, 2			# Load 2 into $t1	
	li	$t2, 3			# Load 3 into $t2
	li	$t3, 4			# Load 4 into $t3
	li	$t5, 5			# Load 5 into $t4
	li	$t6, 6			# Load 6 into $t5

	beq	$t0, $t8, PRINT_RECORD	# Jump to "PRINT_RECORD"
	beq	$t1, $t8, CHANGE_HRS	# Jump to "CHANGE_HRS"
	beq	$t2, $t8, CHANGE_RATE	# Jump to "CHANGE_RATE"
	beq	$t3, $t8, PAYROLL_RPRT	# Jump to "PAYROLL_RPRT"
	beq	$t5, $t8, EXIT		# Jump to "EXIT"

	j	MENU			# Jump back to "MENU"

PRINT_RECORD:
	la	$s0, record		# Load address of the record
	lw	$s1, 0($s0)		# Load the Joe Johnson's name
	lw	$s2, 4($s0)		# Load the Johnson's pay rate
	lw	$s3, 8($s0)		# Load the Johnson's hours worked

	la	$a0, employee_prompt	# Print the list of employees
	jal	PRINT_STR		# Label to print a string
	
	la	$a0, prompt_a		# Prompt user, "which employee?"
	jal	PRINT_STR		# Label to print a string

	jal	GET_INPUT		# Jump to "GET_INPUT" and link
	move	$t8, $v0		# Store input into $t8

	la	$a0, header		# Load address of "header"
	jal	PRINT_STR		# Label to print a string

	jal	PRINT_NL
	jal	PRINT_NL

	li	$t0, 1			# 
	li	$t1, 2			#
	li	$t2, 3			#
	li	$t3, 4			# For use in menu comparison.
	li	$t5, 5			# Same as before
	li	$t6, 6			#

	bne	$t8, $t0, FRED
	addi	$t0, $t0, -1

	li	$t7, 12

	mul	$t0, $t0, $t7
	add	$s0, $s0, $t0

	lw	$a0,0($s0)
	lw	$a1,4($s0)
	lw	$a2,8($s0)

	jal	PRINT_1_EMP

	j	MENU			# Jump back to "MENU"

FRED:	
	bne	$t8, $t1, BARNEY
	addi 	$t1, $t1, -1
	
	li	$t7, 12
	
	mul	$t1, $t1, $t7
	add	$s0, $s0, $t1

	lw	$a0,0($s0)
	lw	$a1,4($s0)
	lw	$a2,8($s0)

	jal	PRINT_1_EMP

	j	MENU			# Jump back to "MENU"

BARNEY:	
	bne	$t8, $t2, GEORGE
	addi	$t2, $t2, -1
	
	li	$t7, 12
	
	mul	$t2, $t2, $t7
	add	$s0, $s0, $t2

	lw	$a0,0($s0)
	lw	$a1,4($s0)
	lw	$a2,8($s0)

	jal	PRINT_1_EMP

	j	MENU			# Jump back to "MENU"

GEORGE:	
	bne 	$t3, $t8, JUDY
	addi 	$t3, $t3, -1

	li 	$t7, 12
	
	mul 	$t3, $t3, $t7
	add 	$s0, $s0, $t3

	lw 	$a0,0($s0)		# Load employee's name
	lw 	$a1,4($s0)		# Load employee's hourly pay rate
	lw 	$a2,8($s0)		# Load employee's hours worked

	jal 	PRINT_1_EMP

	j 	MENU

JUDY:	
	bne 	$t5, $t8, ASTRO
	addi 	$t5, $t5, -1
	
	li 	$t7, 12
	
	mul 	$t5, $t5, $t7
	add 	$s0, $s0, $t5
	
	lw 	$a0,0($s0)		# Load employee's name
	lw 	$a1,4($s0)		# Load employee's hourly pay rate
	lw 	$a2,8($s0)		# Load employee's hours worked
	
	jal 	PRINT_1_EMP

	j 	MENU

ASTRO:	
	bne 	$t6, $t8, MENU
	addi 	$t6, $t6, -1
	
	li 	$t7, 12
	
	mul 	$t6, $t6, $t7
	add 	$s0, $s0, $t6
	
	lw 	$a0,0($s0)		# Load employee's name
	lw 	$a1,4($s0)		# Load employee's hourly pay rate
	lw 	$a2,8($s0)		# Load employee's hours worked
	
	jal 	PRINT_1_EMP

	j 	MENU

OT_CALC2:	
	sub	$s8, $s2, $t8		# Find actual overtime
	mul	$s2, $t8, $s1		# Find pay for regular time
	mul 	$s8, $s8, $t6		# Find pay for overtime
	add	$s6, $s2, $s8		# Find the total pay


PRINT_OUT2:   
	jal	PRINT_TAB

        move 	$a0, $s2           	#
        jal	PRINT_INT

	jal	PRINT_3TABS
     
        move 	$a0, $s8	        # Prepares for output
        jal	PRINT_INT

	jal	PRINT_4TABS

        move 	$a0, $s6           	# Prints total pay
        jal	PRINT_INT			#

	addi 	$t0, $t0, 1
	addi 	$s0, $s0, 12

	j 	MENU

	#############################
	#     	ERROR CHECKING	    #
	#############################
FRED_CHK:	
	bne	$t8, $t1, BARNEY_CHK	# Is this the correct employee?	
	addi 	$t1, $t1, -1	
	
	li 	$t7, 12		
	
	mul	$t1, $t1, $t7
	add	$s0, $s0, $t1		# Go to correct employee
	
	sw	$s3, 4($s0)		# Change the value in the record in memory

	j	 MENU			# Jump back to "MENU"

BARNEY_CHK:	
	bne	$t8, $t2, GEORGE_CHK
	addi	$t2, $t2, -1

	li 	$t7, 12

	mul	$t2, $t2, $t7
	add 	$s0, $s0, $t2 		# Go to correct employee

	sw 	$s3, 4($s0)		# Change the value in the record in memory

	j 	MENU

GEORGE_CHK:	
	bne 	$t3, $t8, JUDY_CHK
	addi	$t3, $t3, -1

	li	$t7, 12
	mul 	$t3, $t3, $t7
	add	$s0, $s0, $t3 		# Go to correct employee

	lw 	$s2, 4($s0)		# Load employee's pay rate

	j	MENU			# Jump back to "MENU"

JUDY_CHK:	
	bne 	$t5, $t8, ASTRO_CHK
	addi	$t5, $t5, -1

	li 	$t7, 12
	mul	$t5, $t5, $t7
	add	$s0, $s0, $t5 		# Go to correct employee

	lw 	$s2, 4($s0)		# Load employee's pay rate

	j 	MENU

ASTRO_CHK:	
	bne	$t6, $t8, MENU
	addi	$t6, $t6, -1

	li 	$t7, 12

	mul	$t6, $t6, $t7
	add	$s0, $s0, $t6 		# Go to correct employee

	sw 	$s3, 4($s0)		# Change the value in the record in memory
	
	j 	MENU

FRED_CHK2:	
	bne	$t8, $t1, BARNEY_CHK2	# Is this the correct employee?	
	addi 	$t1, $t1, -1	

	li 	$t7, 12		

	mul 	$t1, $t1, $t7
	add	$s0, $s0, $t1		# Go to correct employee

	sw 	$s3, 8($s0)		# Change the value in the record in memory

	j	 MENU			# Jump back to "MENU"

BARNEY_CHK2:	
	bne 	$t8, $t2, GEORGE_CHK2
	addi 	$t2, $t2, -1

	li 	$t7, 12

	mul 	$t2, $t2, $t7
	add 	$s0, $s0, $t2 		# Go to correct employee

	sw 	$s3, 8($s0)		# Change the value in the record in memory

	j 	MENU

GEORGE_CHK2:	
	bne 	$t3, $t8, JUDY_CHK2
	addi 	$t3, $t3, -1

	li 	$t7, 12

	mul 	$t3, $t3, $t7
	add 	$s0, $s0, $t3 		# Go to correct employee

	sw 	$s3, 8($s0)		# Change the value in the record in memory

	j 	MENU

JUDY_CHK2:	
	bne 	$t5, $t8, ASTRO_CHK2
	addi 	$t5, $t5, -1

	li 	$t7, 12

	mul 	$t5, $t5, $t7
	add 	$s0, $s0, $t5 		# Go to correct employee

	sw 	$s3, 8($s0)		# Change the value in the record in memory
	
	j 	MENU

ASTRO_CHK2:	
	bne 	$t6, $t8, MENU
	addi 	$t6, $t6, -1

	li 	$t7, 12

	mul 	$t6, $t6, $t7
	add 	$s0, $s0, $t6 		# Go to correct employee

	sw 	$s3, 8($s0)		# Change the value in the record in memory
	
	j 	MENU

	#############################
	#     PRINT SINGLE RECORD   #
	#############################	
PRINT_1_EMP:
	jal 	PRINT_STR		# Jump to "PRINT_STR" and link

	jal	PRINT_TAB

	move 	$a0, $a1
	jal 	PRINT_INT

	jal	PRINT_3TABS

	move 	$a0, $a2
	jal 	PRINT_INT

	jal	PRINT_3TABS

	lw 	$t4, 0($s0)		# Load employee's name
	lw 	$s1, 4($s0)		# Load employee's pay rate
	lw 	$s2, 8($s0)		# Load employee's hours worked

	li 	$s8, 0			# Set OT to defualt (0)

	li 	$t8, 40			# Represents 40 hours worked
	
	add 	$t6, $s1, $s1		# 
	
	bgt 	$s2, $t8, OT_CALC2	# Calculate for overtime if need be
	mul 	$s2, $s2, $s1		# Else, find regular pay
	
	add 	$s7, $s7, $s2		# Update $s7 to have current total
	
	move 	$s6, $s2
	
	j 	PRINT_OUT2

	#############################
	#     	 CHANGE RATE	    #
	#############################
CHANGE_RATE:
	la 	$s0, record		# Load address of record
	lw	$s1, 0($s0)		# Load employee's name
	lw 	$s2, 4($s0)		# Load employee's pay rate
	lw 	$s3, 8($s0)		# Load employee's hours worked

	la	$a0, employee_prompt	# Load address of "employee_prompt"
	jal 	PRINT_STR		# Jump to "PRINT_STR" and link
	
	la 	$a0, prompt_a
	jal	PRINT_STR		#

	jal 	GET_INPUT		# Jump to "GET_INPUT" and link	# Jump to "GET_INPUT" and link
	move	$t8, $v0

	la 	$a0, new_rate
	jal	PRINT_STR

	jal	GET_INPUT		# Jump to "GET_INPUT" and link
	move 	$s3, $v0

	li 	$t0, 1			#
	li 	$t1, 2			#
	li 	$t2, 3			# For comparisons in "MENU"
	li 	$t3, 4			# 
	li 	$t5, 5			#
	li	$t6, 6			#

	bne 	$t8, $t0, FRED_CHK	# Error checking
	addi	$t0, $t0, -1
	
	li	$t7, 12
	
	mul 	$t0, $t0, $t7
	add 	$s0, $s0, $t0
	
	sw	$s3, 4($s0)		# Change the value and store it into $s0

	j 	MENU

	#############################
	#     CHANGE HOURS WORKED   #
	#############################
CHANGE_HRS:
	la 	$s0, record		# Load address of recor
	lw 	$s1, 0($s0)		# Load name
	lw 	$s2, 4($s0)		# Load the pay rate

	la 	$a0, employee_prompt
	jal	PRINT_STR
	
	la 	$a0, prompt_a
	jal	PRINT_STR		#

	jal 	GET_INPUT		# Jump to "GET_INPUT" and link	# Jump to "GET_INPUT" and link
	move 	$t8, $v0

	la 	$a0, new_hours
	jal	PRINT_STR

	jal	GET_INPUT		# Jump to "GET_INPUT" and link
	move 	$s3, $v0

	li 	$t0, 1			#
	li 	$t1, 2			#
	li 	$t2, 3			# For use in comparisons for "MENU"
	li 	$t3, 4			#
	li 	$t5, 5			#
	li	$t6, 6			#

	bne 	$t8, $t0, FRED_CHK2	# Error checking
	
	addi 	$t0, $t0, -1
	
	li 	$t7, 12
	
	mul	$t0, $t0, $t7
	add 	$s0, $s0, $t0

	sw 	$s3, 8($s0)		# Change the value in the record in memory
	j 	MENU

	#############################
	#     	PAYROLL REPORT	    #
	#############################
PAYROLL_RPRT:
	la 	$a0, header		# Prints the header
	jal	PRINT_STR		#

	jal	PRINT_NL		#
	jal	PRINT_NL		# Print two newlines

	la	$s0, record		# Load address of record
	
	li 	$t0, 0
	li	$t1, 6
	li	$s7, 0			# For use in finding running total

FOR:	
	beq	 $t0, $t1, END_FOR	# do following code until $t0 = $t6

	lw 	$t4, 0($s0)		# Load employee's name
	lw 	$s1, 4($s0)		# Load employee's pay rate
	lw 	$s2, 8($s0)		# Load employee's hours worked

	li 	$s8, 0			# Set overtime to default (0)
	
	li 	$t8, 40			# Represents 40 hours worked
	add	$t6, $s1, $s1		# Stores overtime pay rate

	move	$a0, $t4		#
	jal	PRINT_STR		# Print the employee's name
				
	jal	PRINT_TAB

        move 	$a0, $s1		#
	jal 	PRINT_INT		# Print employee's pay rate

	jal	PRINT_3TABS

        move	$a0, $s2		#
	jal	PRINT_INT		# Print employee's hours
	
	jal	PRINT_3TABS

	bgt 	$s2, $t8, OT_CALC	# Find overtime if need be
	mul 	$s2, $s2, $s1		# Else, find regular pay
	
	add 	$s7, $s7, $s2		# Find total	
	
	move	$s6, $s2
	
	j	PRINT_OUT

OT_CALC:	
	sub 	$s8, $s2, $t8		# Find overtime hours
	mul 	$s2, $t8, $s1		# Find pay for regular time
	mul 	$s8, $s8, $t6		# Find pay for overtime
	add	$s6, $s2, $s8		# Total pay for employee
	add 	$s7, $s7, $s6		# Total pay roll

PRINT_OUT:    
        move 	$a0, $s2		# Prepares for output
	jal	PRINT_INT

	jal	PRINT_3TABS

        move	$a0, $s8	        # Prepares for output
	jal	PRINT_INT

	jal	PRINT_4TABS

        move 	$a0, $s6		# Prepares for output
	jal	PRINT_INT

	addi 	$t0, $t0, 1
	addi 	$s0, $s0, 12

	j 	FOR
	
END_FOR: 		
	la	$a0, ttl_payr		#
	jal	PRINT_STR		# Print "Total Payroll:"
	               
        move	$a0, $s7		#
   	jal	PRINT_INT		# Print the total pay
	
	j	MENU			# Jump back to "MENU"

	#############################
	#     BASIC FUNCTIONS	    #
	#############################
PRINT_TAB:
	la	$a0, tab
	j	PRINT_STR
	jr	$ra

PRINT_3TABS:
	la	$a0, tab3
	j	PRINT_STR
	jr	$ra

PRINT_4TABS:
	la	$a0, tab4
	j	PRINT_STR
	jr	$ra
	
PRINT_NL:
	la	$a0, newl
	j	PRINT_STR
	jr	$ra

PRINT_INT:
	li 	$v0, 1
	syscall				# Print an integer
	jr	$ra			# Return to the caller


PRINT_STR:
	li 	$v0, 4			# Load the argument to print a string
	syscall				# Print a string
	jr	$ra			# Return to the caller


GET_INPUT:
	li 	$v0, 5			#
	syscall				# Retrieve input from user
	jr 	$ra			# Return to caller

EXIT:
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra			# Return to the OS