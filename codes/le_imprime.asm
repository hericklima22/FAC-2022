# lê um número e depois imprime ele

	.data
str1:
	.asciiz "Insira o valor: "
str2:	
	.asciiz "valor inserido: "
n:	
	.asciiz "\n"
	
buffer:
	.space 4
	.text
	
main:
	li $v0, 4	# código da chamada da função de imprimir string
	la $a0, str1	# carrega a string que vai ser imprimida
	syscall		# imprime a string
	
	li $v0, 5	# chamada da função de leitura de inteiro, read_int
	syscall		# executa a chamada da função anterior
	
	move $t0, $v0	# move o inteiro da entrada para o registrador v0
		
	li $v0, 4	# cahamda da cfunção print_str
	la $a0, str2    # carrega a string que vai ser imprimida
	syscall		# imprime a string
	
	li $v0, 1	# cahama a função read_int
	move $a0, $t0	# grava o int em a0
	syscall		# imŕime o a0
	
	li $v0, 4	# chamada da função print_str
	la $a0, n	# carrega a string
	syscall 	# imprime a string
	
	li $v0, 10 # código de chamada para o fim do programa
	syscall