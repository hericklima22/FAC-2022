.data

.text

main:
	li $v0, 5	# chama a função read_int
	syscall		# executa a função
	
	move $t0, $v0	# move o valor de v0 para t0
	
	li $v0, 5	# chama a função read_int
	syscall		# executa a função
	
	move $t1, $v0	# move o valor de v0 para t0
	
	add $t2, $t0, $t1	# soma t0 e t1 e coloca em t2
	
	li $v0, 1	# chama a funcao print_int
	move $a0, $t2	# carrega t2 em a0
	syscall		# executa a função
	
	li $v0, 10	# fim do programa
	syscall