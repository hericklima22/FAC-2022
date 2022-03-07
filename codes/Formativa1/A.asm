.data

	novaLinha: .asciiz "\n"
	pos: .asciiz "+\n"
	negt: .asciiz "-\n"
	str1: .asciiz "0x"
	hexaFinal: .space 8
	
.text

main:
	li   $v0, 6 		# chama a função de leitura de float
    	syscall
	mfc1 $t0, $f0 		# move o valor de ENTRADA para $t0
	
	li    $v0, 2 		# chama a função de impreção de float
    	mov.s $f12, $f0 	# move o valor de f0 para f12
    	syscall 		
	
	li $v0, 4 		# chama a função printStr
    	la $a0, novaLinha 	# move o valor de novaLinha para a0
    	syscall 		# imprime a0 (quebra a linha)
	
	# pega o MSB para verificar o sinal
	addi $t1, $zero, 1	# soma o valor 1 em t1
	sll  $t1, $t1, 31	# move o 1 31 bits para a esquerda, tornando-o MSB
	and  $a0, $t0, $t1	# se o MSB do float de entrada for 1, então a0 = 1 (negativo); se não, a0 = 0 (positivo). no MSB de a0
	srl  $a0, $a0, 31	# move o MSB de a0 31 bits para a direita, tornando-o LSB
	move $t2, $a0		# grava o valor de a0 em t2
	
	beqz $t2, printPos	# se t2 for igual a 0, chama a função printPos
	beq  $t2, 1, printNeg	# se t2 for igual a 1, chama a função printNeg
	
	li $v0, 4 		# chama a função printStr
    	la $a0, pos 		# move o valor de novaLinha para a0
    	syscall 		# imprime a0 (quebra a linha)
	

printPos:
	li $v0, 4		# chama a função printStr
	la $a0, pos		# carrega o valor de pos em a0
	syscall

	j expoente		# vai para a função expoente

printNeg:
	li $v0, 4		# chama a função printStr
	la $a0, negt		# carrega o valor de negt em a0
	syscall

	j expoente		# vai para a função expoente

expoente:
	addi $t2, $zero, 255	# coloca 8 bits com 1 em t2 (255 = 1111 1111)
	sll  $t2, $t2, 23	# desloca 23 bits para a esquerda (0111 1111 1000 0000 0000 0000 0000 0000) somente os bits do expoente no padrão IEEE 754
	and  $a0, $t2, $t0	# se o bit de t2[i] for 1, a0[i] = 1; se t2[i] for 0, a0[i] = 0 (só vai capturar os bit de a0 quando os bits de t2 forem 1!)
	srl  $a0, $a0, 23 	# desloca a0 23 para a direita
	addi $t3, $zero, 127	# coloca o balanceio em t3
	sub  $a0, $a0, $t3	# a0 = a0 - t3
	
	li $v0, 1		# chama função de imprimir inteiro
	syscall
	
	li $v0, 4 		# chama a função printStr
    	la $a0, novaLinha 	# move o valor de novaLinha para a0
    	syscall 		# imprime a0 (quebra a linha)
    	
    	li $v0, 4		# cahama a função printStr
    	la $a0, str1		# carrega o símbolo do hex em a0
    	syscall
	
	#ori  $t0 $zero 0xFFFF
    	#sll  $t0 $t0 7
    	#ori  $t0 $t0 0x7F
    	#and  $a0 $t0 $t8
    	#jal hex
	
	mul  $t2, $t2, $zero		# limpa o valor de t2
	ori $t2, $zero, 0xffff		# adiciona o valor de 1 nos primeiros 23 bits para usar como máscara
	sll  $t2, $t2, 7		# desloca 7 bits para a esquerda
	ori $t2, $t2, 0x7f		# adiciona o resto dos bits que faltava
	and  $a0, $t0, $t2		# se o bit de t2 for 1 então copia para a0
	jal parseHexa
	#	     111 1111 1111 1111 1111 1111		      
	# 0000 0000 0111 1111 1111 1111 1111 1111
	# 0000 0000 0111 1111 1111 1111 1000 0000
	# 0000 0000 0111 1111 1111 1111 1111 1111
	
	li $v0, 4 		# chama a função printStr
    	la $a0, novaLinha 	# move o valor de novaLinha para a0
    	syscall 		# imprime a0 (quebra a linha)
	
	li $v0, 10
	syscall	
	
	
	
	
	
parseHexa:
	addi $sp, $sp, -24	# alocando o espaço de 6 palavras no stack
	sw   $a0, 0($sp)
    	sw   $s0, 4($sp)
    	sw   $s1, 8($sp)
    	sw   $s2, 12($sp)
    	sw   $s3, 16($sp)
    	sw   $s4, 20($sp)
	move $s2, $a0		# move o conteúdo de a0 para s2
	addi $s0, $s0, 8	# iniciando o contador em 8
	la   $s3, hexaFinal	# carrega a string que vai ser guardada o resultado
	
hexLoop:
	rol  $s2, $s2, 4	# passa os 4 bits menos significativos para os 4 mais significados
	and  $s1, $s2, 0xf	# pega os 4 bits rotacionados para MSB anteriormente e coloca em s1 utilizando um AND com os 4 primeiros bits de valor 1
	ble  $s1, 9, printHex	#  # se o valor de s1 estiver entre 0 e 9 a função de impressão é chamada
	addi $s1, $s1, 7	# caso s1 seja maior que 9 é somado 7 para engolbar as letras A B C D E F do hexadecimal
	
printHex:
	addi $s1, $s1, 48	# soma 48 para traduzir para ascii
	sb   $s1, ($s3)		# armazena o resultado de s1 no array hexaFinal
	addi $s3, $s3, 1	# aumenta 1 no index de s3
	addi $s0, $s0, -1	# subtrai 1 no contador
	bnez $s0, hexLoop	# se o contador não for 0 volta para o hexLoop
	
	li $v0, 4		# chamada da função printStr
	la $a0, hexaFinal	# carrega a string em a0
	syscall
	
	jr $ra			# volta para onde a última chamada de função em ra
	syscall
	
	
	
	
	
	
