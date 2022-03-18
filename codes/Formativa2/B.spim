.data
	novaLinha: .asciiz "\n"	
.text

main:
	############# DECLARAÇÂO DE VARIÁVEIS
	# $t0 = N
	# $t1 = index
	# $t2 = contador do loop
	# $f2 = numero atual
	# $f4 = peso atual
	# $f6 = media temporaria
	# $f8 = media final
	
	
	li	$v0, 5					# leitura de int
	syscall
	
	move	$t0, $v0				# move v0 para t0
	
	add 	$t1, $zero, $zero			# inicializa t1 com 0
	add 	$t2, $zero, $zero			# inicializa t2 com 0
	
	
	# loop para entrada de dados
	loop:
		li 	$v0, 7					# chama a função de leitura de double (numero que vai somar na media)
		syscall
		mov.d	$f2, $f0				# move o valor de entrada para $f2
					
		li 	$v0, 7					# chama a função de leitura de double (peso da media)
		syscall
		mov.d	$f4, $f0				# move o valor de entrada para $f4
		
		mul.d	$f6, $f2, $f4				# multiplica $f2 e $f4 e salva em $f6
		add.d	$f8, $f8, $f2
		add.d	$f10, $f10, $f6				# acrescenta o valor de $f6 em $f8
		
		addi	$t2, $t2, 1				# incrementa o contador do loop
		beq	$t2, $t0, fimDoLoopDeEntrada		# se t2 == t0 sai do loop
		j loop
		
		
	fimDoLoopDeEntrada:
	
	div.d	$f12, $f10, $f8				# divide pelo peso somado
	
	li	$v0, 3					# chama a função de imprimir double
	syscall
	
	li $v0, 4 					# chama a função printStr
    	la $a0, novaLinha 				# move o valor de novaLinha para a0
    	syscall	
	
	li 	$v0, 10					# fim do programa
	syscall
