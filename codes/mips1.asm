#imprime um numero depois de uma string

	.data
str:	
	.asciiz "the answer is: "
	.text
main:
	li $v0, 4	# código de chamada ao sistema para print_str
	la $a0, str	# endereço da string a ser imprimida
	syscall		# imprime a string
	
	li $v0, 1	# código de chamada ao sistema para print_str
	li $a0, 5	# inteiro a ser imprimido
	syscall