.data
	novaLinha:.asciiz "\n"
	palavra: .space 101
.text

main:
	###### DECLARAÇÃO DE VARIAVEIS
	# $t0 = tamanho da palavra
	# $t1 = $zero, primeira letra da palavra
	# $t2 = $t0 - 1 última letra da palavra
	# $t4 = é palindromo
	# $t6 = palavra[$t1]
	# $t7 = palavra[$t2]
	
	li 	$v0, 5				# chama a função read_int
	syscall
	
	addi 	$t0, $v0, 2			# soma 2 em $v0 e salva em $t0
	add	$t1, $t1, $zero			# soma 0 em $t1
	addi	$t2, $t0, -3			# subtrai um de $t0 e guarda em $t2
	
	li 	$v0, 8				# chama a função read_string
	la 	$a0, palavra			# carrega gabarito em a
	la 	$a1, ($t0)			# le a quantidade de caracteres no limite em qtd
	syscall

	addi	$t0, $t0, -2			# tira 1 no valor maximo da string, entao o ultimo caractere sera ignorado
	
	addi	$t5, $t5, 1			# contador do loop
	
	while:
		beq	$t1, $t2, fimLoop			# se o contador de início e fim da palavra se igualarem sai do loop pois acabou a palavra
		beq	$t5, $t0, fimLoop
		
		lb 	$t6, palavra($t1)			# carrega a letra contida em palavra[$t1]
		lb 	$t7, palavra($t2)			# carrega a letra contida em palavra[$t2]
		
		seq	$t4, $t6, $t7				# compara as letras e salva 1 ou 0 se igual ou falso em $t4
		
		#### DEBUG
#		li 	$v0, 11
#		move	$a0, $t6
#		syscall
#		
#		li 	$v0, 11
#		move	$a0, $t7
#		syscall
#		
#		li 	$v0, 1				# chama a função print_int
#		move 	$a0, $t4			# move o valor de $t4 para $a0
#		syscall
#		
#		li 	$v0, 1
#		move 	$a0, $t0
#		syscall
#		
#		li $v0, 4
#		la $a0, novaLinha
#		syscall
		####
		
		
		
		bne	$t6, $t7, fimLoop			# se as letras não forem iguais já pula pra fora do loop
		
		addi	$t1, $t1, 1				# incrementa o valor de $t1
		addi	$t2, $t2, -1				# decrementa o valor de $t2
		addi	$t5, $t5, 1				# incrementa o valor de $t5
		j while
		
	fimLoop:
	
	li 	$v0, 1				# chama a função print_int
	move 	$a0, $t4			# move o valor de $t4 para $a0
	syscall
	
	li	$v0, 10				# fim do programa
	syscall