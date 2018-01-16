#################################
# Programmer: Jeff Kereakoglow	#
# Exercise: Homework 5		#
# Description: Prints the pay-	#
# roll activity for six people.	#
#				#
# Date: Oct. 15, 2007		#
#################################

.data

  title_head:	.asciiz "Employee\t\tHourly Pay\t\tHours Worked\t\tRegular Pay\t\tOvertime Pay\tTotal Pay\n\n"

  nline:	.asciiz "\n"

  tab1:		.asciiz "\t"
  tab2:		.asciiz "\t\t"
  tab3:		.asciiz "\t\t\t"
  tab4:		.asciiz "\t\t\t\t"
  tab14:	.asciiz "\t\t\t\t\t\t\t\t\t\t\t\t\t\t"

  joejohnson:	.asciiz "Joe Johnson:"
  fredflint:	.asciiz "Fred Flinstone:"
  barneyrub:	.asciiz "Barney Rubble:"
  georgejet:	.asciiz "George Jetson:"
  judyjet:	.asciiz "Judy Jetson:"
  astrojet:	.asciiz "Astro Jetson:"
  totalpay:	.asciiz "\n\nTotal Payroll:"

  record:	.word joejohnson, 2, 36
		.word fredflint, 4, 48
		.word barneyrub, 3, 42
		.word georgejet, 4, 40
		.word judyjet, 5, 38
		.word astrojet, 4, 44
.text


main:
	#############################
	#     INITIALIZATIONS	    #
	#############################
	li	$s0, 40		# Represents 40 hours
	la	$s1, record	# Load the entire record
		
	la	$a0, title_head	#
	li	$v0, 4		# Prints the header
	syscall			#

	#############################
	#   EMPLOYEE PRINT BLOCK    #
	#############################

	####   JOE JOHNSON   ####
	lw	$s2, 4($s1)	# Loads hourly rate into $s2
	lw 	$s3, 8($s1)	# Loads hours into $s3
	
	####   PRINT OUT     ####
	la	$a0, joejohnson	#
	li 	$v0, 4		# Print employee's name
	syscall			#

	li 	$v0, 4		#
	la 	$a0, tab1	# Print 1 tab
	syscall			#

	li 	$v0, 1		#
        move 	$a0, $s2	# Print the hourly pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

        li	$v0, 1		#
        move	$a0, $s3	# Print hours worked
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab4	# Print 4 tabs
	syscall			#

	###### CONDITIONAL ######
	bgt 	$s3, $s0, OT1	# If hours are greater than 40, go to OT1
	
	mul 	$t1, $s2, $s3	# Else, solve for regular pay
	
	li	$v0, 1		#
        move	$a0, $t1	# Print regular pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $zero	# Print zero for overtime
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $t1	# Print total pay (regular pay)
        syscall			#

	li 	$v0, 4		#
	la 	$a0, nline	# Print newline
	syscall			#

	add	$s6, $s6, $t1	# Add total pay for all employees

	j	FRED		# Jump to label "FRED"


	OT1:	
		mul 	$t1, $s2, $s0	# solve for regular pay

		li	$v0, 1		#
		move	$a0, $t1	# Print regular pay (160)
		syscall			#
		
		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		sub	$s5, $s3, $s0	# Subtract hours from 40 to get overtime
		mul	$t2, $s5, $s2	# Multiply overtime hours by pay rate
		add	$t2, $t2, $t2	# Double total for actual overtime pay

		li	$v0, 1		#
        	move	$a0, $t2	# Print overtime pay
        	syscall			#

		add	$t2, $t2, $t1	# Add total pay

		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		li	$v0, 1		#
        	move	$a0, $t2	# Print total pay (regular plus overtime)
        	syscall			#

		li 	$v0, 4		#
		la 	$a0, nline	# Print newline
		syscall			#

		add	$s6, $s6, $t2	# Add total pay for all employees

		j	FRED		# Jump to label "FRED"

FRED:

	####   FRED FLINSTONE ####
	lw	$s2, 16($s1)	# Loads hourly rate into $s2
	lw 	$s3, 20($s1)	# Loads hours into $s3
	
	####   PRINT OUT     ####
	la	$a0, fredflint	#
	li 	$v0, 4		# Print employee's name
	syscall			#

	li 	$v0, 4		#
	la 	$a0, tab1	# Print 1 tab
	syscall			#

	li 	$v0, 1		#
        move 	$a0, $s2	# Print the hourly pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

        li	$v0, 1		#
        move	$a0, $s3	# Print hours worked
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab4	# Print 4 tabs
	syscall			#

	###### CONDITIONAL ######
	bgt 	$s3, $s0, OT2	# If hours are greater than 40, go to OT2
	
	mul 	$t1, $s2, $s3	# Else, solve for regular pay
	
	li	$v0, 1		#
        move	$a0, $t1	# Print regular pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $zero	# Print zero for overtime
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $t1	# Print total pay (regular pay)
        syscall			#

	li 	$v0, 4		#
	la 	$a0, nline	# Print newline
	syscall			#

	add	$s6, $s6, $t1	# Add total pay for all employees

	j	BARNEY		# Jump to label "BARNEY"


	OT2:	

		mul 	$t1, $s2, $s0	# solve for regular pay

		li	$v0, 1		#
		move	$a0, $t1	# Print regular pay (160)
		syscall			#
		
		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		sub	$s5, $s3, $s0	# Subtract hours from 40 to get overtime
		mul	$t2, $s5, $s2	# Multiply overtime hours by pay rate
		add	$t2, $t2, $t2	# Double total for actual overtime pay

		li	$v0, 1		#
        	move	$a0, $t2	# Print overtime pay
        	syscall			#

		add	$t2, $t2, $t1	# Add total pay

		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		li	$v0, 1		#
        	move	$a0, $t2	# Print total pay (regular plus overtime)
        	syscall			#

		li 	$v0, 4		#
		la 	$a0, nline	# Print newline
		syscall			#

		add	$s6, $s6, $t2	# Add total pay for all employees

		j	BARNEY		# Jump to label "BARNEY"

BARNEY:

	####  BARNEY RUBBLE  ####
	lw	$s2, 28($s1)	# Loads hourly rate into $s2
	lw 	$s3, 32($s1)	# Loads hours into $s3
	
	####   PRINT OUT     ####
	la	$a0, barneyrub	#
	li 	$v0, 4		# Print employee's name
	syscall			#

	li 	$v0, 4		#
	la 	$a0, tab1	# Print 1 tab
	syscall			#

	li 	$v0, 1		#
        move 	$a0, $s2	# Print the hourly pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

        li	$v0, 1		#
        move	$a0, $s3	# Print hours worked
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab4	# Print 4 tabs
	syscall			#

	###### CONDITIONAL ######
	bgt 	$s3, $s0, OT3	# If hours are greater than 40, go to OT3
	
	mul 	$t1, $s2, $s3	# Else, solve for regular pay
	
	li	$v0, 1		#
        move	$a0, $t1	# Print regular pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $zero	# Print zero for overtime
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $t1	# Print total pay (regular pay)
        syscall			#

	li 	$v0, 4		#
	la 	$a0, nline	# Print newline
	syscall			#

	add	$s6, $s6, $t1	# Add total pay for all employees

	j	GEORGE		# Jump to label "GEORGE"


	OT3:	
		mul 	$t1, $s2, $s0	# solve for regular pay

		li	$v0, 1		#
		move	$a0, $t1	# Print regular pay (160)
		syscall			#
		
		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		sub	$s5, $s3, $s0	# Subtract hours from 40 to get overtime
		mul	$t2, $s5, $s2	# Multiply overtime hours by pay rate
		add	$t2, $t2, $t2	# Double total for actual overtime pay

		li	$v0, 1		#
        	move	$a0, $t2	# Print overtime pay
        	syscall			#

		add	$t2, $t2, $t1	# Add total pay

		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		li	$v0, 1		#
        	move	$a0, $t2	# Print total pay (regular plus overtime)
        	syscall			#

		li 	$v0, 4		#
		la 	$a0, nline	# Print newline
		syscall			#

		add	$s6, $s6, $t2	# Add total pay for all employees

		j	GEORGE		# Jump to label "GEORGE"

GEORGE:

	####  GEORGE JETSON  ####
	lw	$s2, 40($s1)	# Loads hourly rate into $s2
	lw 	$s3, 44($s1)	# Loads hours into $s3
	
	####   PRINT OUT     ####
	la	$a0, georgejet	#
	li 	$v0, 4		# Print employee's name
	syscall			#

	li 	$v0, 4		#
	la 	$a0, tab1	# Print 1 tab
	syscall			#

	li 	$v0, 1		#
        move 	$a0, $s2	# Print the hourly pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

        li	$v0, 1		#
        move	$a0, $s3	# Print hours worked
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab4	# Print 4 tabs
	syscall			#

	###### CONDITIONAL ######
	bgt 	$s3, $s0, OT4	# If hours are greater than 40, go to OT4
	
	mul 	$t1, $s2, $s3	# Else, solve for regular pay
	
	li	$v0, 1		#
        move	$a0, $t1	# Print regular pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $zero	# Print zero for overtime
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $t1	# Print total pay (regular pay)
        syscall			#

	li 	$v0, 4		#
	la 	$a0, nline	# Print newline
	syscall			#

	add	$s6, $s6, $t1	# Add total pay for all employees

	j	JUDY		# Jump to label "JUDY"


	OT4:	
		mul 	$t1, $s2, $s0	# solve for regular pay

		li	$v0, 1		#
		move	$a0, $t1	# Print regular pay (160)
		syscall			#
		
		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		sub	$s5, $s3, $s0	# Subtract hours from 40 to get overtime
		mul	$t2, $s5, $s2	# Multiply overtime hours by pay rate
		add	$t2, $t2, $t2	# Double total for actual overtime pay

		li	$v0, 1		#
        	move	$a0, $t2	# Print overtime pay
        	syscall			#

		add	$t2, $t2, $t1	# Add total pay

		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		li	$v0, 1		#
        	move	$a0, $t2	# Print total pay (regular plus overtime)
        	syscall			#

		li 	$v0, 4		#
		la 	$a0, nline	# Print newline
		syscall			#

		add	$s6, $s6, $t2	# Add total pay for all employees

		j	JUDY		# Jump to label "JUDY"

JUDY:

	####   JUDY JETSON   ####
	lw	$s2, 52($s1)	# Loads hourly rate into $s2
	lw 	$s3, 56($s1)	# Loads hours into $s3
	
	####   PRINT OUT     ####
	la	$a0, judyjet	#
	li 	$v0, 4		# Print employee's name
	syscall			#

	li 	$v0, 4		#
	la 	$a0, tab1	# Print 1 tab
	syscall			#

	li 	$v0, 1		#
        move 	$a0, $s2	# Print the hourly pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

        li	$v0, 1		#
        move	$a0, $s3	# Print hours worked
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab4	# Print 4 tabs
	syscall			#

	###### CONDITIONAL ######
	bgt 	$s3, $s0, OT5	# If hours are greater than 40, go to OT5
	
	mul 	$t1, $s2, $s3	# Else, solve for regular pay
	
	li	$v0, 1		#
        move	$a0, $t1	# Print regular pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $zero	# Print zero for overtime
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $t1	# Print total pay (regular pay)
        syscall			#

	li 	$v0, 4		#
	la 	$a0, nline	# Print newline
	syscall			#

	add	$s6, $s6, $t1	# Add total pay for all employees

	j	ASTRO		# Jump to label "ASTRO"


	OT5:	
		mul 	$t1, $s2, $s0	# solve for regular pay

		li	$v0, 1		#
		move	$a0, $t1	# Print regular pay (160)
		syscall			#
		
		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		sub	$s5, $s3, $s0	# Subtract hours from 40 to get overtime
		mul	$t2, $s5, $s2	# Multiply overtime hours by pay rate
		add	$t2, $t2, $t2	# Double total for actual overtime pay

		li	$v0, 1		#
        	move	$a0, $t2	# Print overtime pay
        	syscall			#

		add	$t2, $t2, $t1	# Add total pay

		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		li	$v0, 1		#
        	move	$a0, $t2	# Print total pay (regular plus overtime)
        	syscall			#

		li 	$v0, 4		#
		la 	$a0, nline	# Print newline
		syscall			#

		add	$s6, $s6, $t2	# Add total pay for all employees

		j	ASTRO		# Jump to label "ASTRO"

ASTRO:

	####  ASTRO JETSON  ####
	lw	$s2, 64($s1)	# Loads hourly rate into $s2
	lw 	$s3, 68($s1)	# Loads hours into $s3
	
	####   PRINT OUT     ####
	la	$a0, astrojet	#
	li 	$v0, 4		# Print employee's name
	syscall			#

	li 	$v0, 4		#
	la 	$a0, tab1	# Print 1 tab
	syscall			#

	li 	$v0, 1		#
        move 	$a0, $s2	# Print the hourly pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

        li	$v0, 1		#
        move	$a0, $s3	# Print hours worked
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab4	# Print 4 tabs
	syscall			#

	###### CONDITIONAL ######
	bgt 	$s3, $s0, OT6	# If hours are greater than 40, go to OT6
	
	mul 	$t1, $s2, $s3	# Else, solve for regular pay
	
	li	$v0, 1		#
        move	$a0, $t1	# Print regular pay
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $zero	# Print zero for overtime
        syscall			#

	li 	$v0, 4		#
	la 	$a0, tab3	# Print 3 tabs
	syscall			#

	li	$v0, 1		#
        move	$a0, $t1	# Print total pay (regular pay)
        syscall			#

	li 	$v0, 4		#
	la 	$a0, nline	# Print newline
	syscall			#

	add	$s6, $s6, $t1	# Add total pay for all employees

	j	EXIT		# Jump to label "EXIT"


	OT6:	
		mul 	$t1, $s2, $s0	# solve for regular pay

		li	$v0, 1		#
		move	$a0, $t1	# Print regular pay (160)
		syscall			#
		
		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		sub	$s5, $s3, $s0	# Subtract hours from 40 to get overtime
		mul	$t2, $s5, $s2	# Multiply overtime hours by pay rate
		add	$t2, $t2, $t2	# Double total for actual overtime pay

		li	$v0, 1		#
        	move	$a0, $t2	# Print overtime pay
        	syscall			#

		add	$t2, $t2, $t1	# Add total pay

		li 	$v0, 4		#
		la 	$a0, tab3	# Print 3 tabs
		syscall			#

		li	$v0, 1		#
        	move	$a0, $t2	# Print total pay (regular plus overtime)
        	syscall			#

		li 	$v0, 4		#
		la 	$a0, nline	# Print newline
		syscall			#

		add	$s6, $s6, $t2	# Add total pay for all employees

		j	EXIT		# Jump to label "EXIT"




EXIT:

	la	$a0, totalpay	#
	li 	$v0, 4		# Print "Total Pay"
	syscall			#

	li 	$v0, 4		#
	la 	$a0, tab14	# Print 14 tabs
	syscall			#
	
	li	$v0, 1		#
        move	$a0, $s6	# Print total pay for all employees
        syscall			#

	jr	$ra

