.data
	mensagem: .asciiz "Era verdade\n"
	mensagem2: .asciiz "Era falso\n"
	
	n1: .float 10.4
	n2: .float 10.4
	
.text

main:
	lwc1 $f0, n1	# carrega n1 (float) no registrador f0
	lwc1 $f2, n2	# carrega n2 (float) no registrador f2
	
	c.eq.s $f0, $f2	# compara se f0 é igual a f2
	# c.lt.s $f0, $f2	# compara se f0 é menor que f2
	# c.le.s $f0, $f2		# compara se f0 é menor ou igual a f2
	
	bc1t exit	# se o coprocessador 1 for true ele pula para a label exit
	
	li $v0, 4	# imrpime string
	la $a0, mensagem2
	syscall
	
	li $v0, 10
	syscall		# fim do programa
	
exit:
	li $v0, 4	# imprime string
	la $a0, mensagem
	syscall