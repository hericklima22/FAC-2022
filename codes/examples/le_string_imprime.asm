.data

entrada:
	.asciiz "Digite seu nome: "
resposta:
	.asciiz "Seu nome: "
buffer:
	.space 20
	.text
	
main:
	la $a0, entrada	# carrega a string
	li $v0, 4	# chama a função de imrpimir string	
	syscall
	
	li $v0, 8	# chama a função que lê string
	la $a0, buffer	# carrega o byte space no a0
	li $a1, 20	# distribui o byte em string
	move $t0, $a0	# salva a string em t0
	syscall
	
	la $a0, resposta	# carrega a string em a0
	li $v0, 4
	syscall 
	
	la $a0, buffer	# recoloca o buffer em a0 (endereço primário)
	move $a0, $t0	# carrega o ponteiro de t0 para a string'
	li $v0, 4	# chama a função de imprimir string
	syscall
	
	
	
	
	li $v0, 10	# saída do programa
	syscall