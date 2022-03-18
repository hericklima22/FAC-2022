.data
	novaLinha: .asciiz "\n"
	porcento: .double 100.00
	
.text

main:

	li	$v0, 7				# chama a função de leitura de double
	syscall
	mov.d	$f2, $f0			# move o valor de entrada para t0
	
	li	$v0, 7				# chama a função de leitura de int
	syscall
	mov.d	$f8, $f0			# move o conteudo da entrada para f8
	
	li	$v0, 7				# chama a função de leitura de int
	syscall
	mov.d	$f10, $f0			# move o conteudo da entrada para f10

	add.d	$f8, $f8, $f10			# soma as porcentagens
	
	ldc1	$f6, porcento			# carrega o valor 100 em f4
		
	div.d	$f8, $f8, $f6			# divide f4 por f6 e salva em f6
	
	mul.d	$f4, $f2, $f8			# multiplica o custo da fabrica pela margem de lucro
	
	add.d	$f2, $f2, $f4
		
	li	$v0, 3				# chama a função de imprimir double
	mov.d	$f12, $f2			# move para f12 o valor de f2 para imprimir
	syscall	
	
	li $v0, 10				# fim do programa
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
