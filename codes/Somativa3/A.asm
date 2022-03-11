.data
	gabarito: .space 100
	respostas: .space 100
.text

main:
	##### DECLARAÇÃO DE VARIÁVEIS
	# $t0 = limite de leitura
	# $t1 = index do loop
	# $t2 = contador de acertos
	# $t3 = gabarito[i]
	# $t4 = respostas[i]
	# $t5 = guarda seq
	
	li $v0, 5		# chama a função read_int
	syscall

	addi $t0, $v0, 2	# soma 1 no valor de t0
	
	li $v0, 8		# chama a função read_string
	la $a0, gabarito	# carrega gabarito em a
	la $a1, ($t0)		# le a quantidade de caracteres no limite em qtd
	syscall
	
	li $v0, 8		# chama a função read_string
	la $a0, respostas	# carrega gabarito em a
	la $a1, ($t0)		# le a quantidade de caracteres no limite em qtd
	syscall
	
	addi $t0, $t0 -2	# tira 1 no valor maximo da string, entao o ultimo caractere sera ignorado
	
	move $t1, $zero		# inicializa t1 com 0
	
	
	while:
		beq $t1, $t0, loopOut		# se o index for igual ao limite em t0, sai do loop
		
		lb $t3, gabarito($t1)		# joga o valor de gabarito[i] em $t3
		lb $t4, respostas($t1)		# joga o valor de respostas[i] em $t4
		
		seq $t5, $t3, $t4		# se $t3 for igual a $t4 joga o valor 1 em $t5
		add $t2, $t2, $t5		# se $t5 = 1 entao incrementa t2, se $t5 igual a 0, não incrementa		
				
		addi $t1, $t1, 1		# incrementa o valor do index
		j while
	
	loopOut:
			
	li $v0, 1		# chama a funçao print_int
	move $a0, $t2		# move o valor de t0 para a0 para imprimir
	syscall


	li $v0, 10		# fim do programa
	syscall