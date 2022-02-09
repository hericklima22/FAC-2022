.data

str:	.asciiz "Ola Mundo"

.text

main:
	li $v0, 4	# chama a função print_str
	la $a0, str	# carrega a string para o endereço principal
	syscall
	
	li $v0, 10	# fim do programa
	syscall