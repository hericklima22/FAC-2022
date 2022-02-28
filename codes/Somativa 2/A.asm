.data

	novaLinha: .asciiz "\n"
	pos: .asciiz "+\n"
	negt: .asciiz "-\n"
.text

main:
	li $v0, 6 		# chama a função de leitura de float
    	syscall
	mfc1 $t0, $f0 		# move o valor inserido para $t0
	
	li $v0, 2 		# chama a função de impreção de float
    	mov.s $f12, $f0 	# move o valor de f0 para f12
    	syscall 		
	
	li $v0, 4 		# chama a função printStr
    	la $a0, novaLinha 	# move o valor de novaLinha para a0
    	syscall 		# imprime a0 (quebra a linha)
	
	# pega o MSB para verificar o sinal
	add $t1, $zero, 1	# soma o valor 1 em t1
	sll $t1, $t1, 31	# move o 1 31 bits para a esquerda, tornando-o MSB
	and $a0, $t1, $t0	# se o MSB do float de entrada for 1, então a0 = 1 (negativo); se não, a0 = 0 (positivo). no MSB de a0
	srl $a0, $a0, 31	# move o MSB de a0 31 bits para a direita, tornando-o LSB
	move $t2, $a0		# grava o valor de a0 em t2
	
	beqz $t2, printPos	# se t2 for igual a 0, chama a função printPos
	beq $t2, 1, printNeg	# se t2 for igual a 1, chama a função printNeg
	
	li $v0, 4 		# chama a função printStr
    	la $a0, pos 		# move o valor de novaLinha para a0
    	syscall 		# imprime a0 (quebra a linha)
	
	
	
	li $v0, 10
	syscall			# fim do programa

printPos:
	li $v0, 4		# chama a função printStr
	la $a0, pos		# carrega o valor de pos em a0
	syscall
	j expoente		# vai para a função expoente

printNeg:
	li $v0, 4		# chama a função printStr
	la $a0, negt		# carrega o valor de negt em a0
	syscall
	j expoente			# vai para a função expoente

expoente:
	add $t2, $zero, 255	# coloca 8 bits com 1 em t2 (255 = 1111 1111)
	sll $t2, $t2, 23	# desloca 23 bits para a esquerda (0111 1111 1000 0000 0000 0000 0000 0000) somente os bits do expoente no padrão IEEE 754
	and $a0, $t2, $t1	# se o bit de t2[i] for 1, a0[i] = 1; se t2[i] for 0, a0[i] = 0 (só vai capturar os bit de a0 quando os bits de t2 forem 1!)
	srl $a0, $a0, 23 	# desloca a0 23 para a direita
	add $t3, $zero, 127	# coloca o balanceio em t3
	sub $a0, $a0, $t3	# a0 = a0 - t3
	
	li $v0, 1		# chama função de imprimir inteiro
	syscall
	
	
	
	
	
	
	
	
	
	
	
	