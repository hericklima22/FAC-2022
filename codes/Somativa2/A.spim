.data
	soma: .asciiz "ADD: " 
	subtracao: .asciiz "SUB: "
	e_logico: .asciiz "AND: "
	ou_logico: .asciiz "OR: "
	ou_exclusivo: .asciiz "XOR: "
	mascara: .asciiz "MASK: "
	shift_left: .asciiz "SLL"
	p1: .asciiz "("
	p2: .asciiz "): "
	shift_right: .asciiz "SRL"
	nova_linha: .asciiz "\n"

.text


main:
	# LEITURA DO VALOR A
	li $v0, 5	# carrega a função read_int
	syscall
	
	move $t0, $v0	# move o valor de entrada para t0
	
	
	# LEITURA DO VALOR B
	li $v0, 5		# carrega a função read_int
	syscall
	
	move $t1, $v0		# move o valor de entrada para t1
	
	
	# LEITURA DO VALOR C
	li $v0, 5		# carrega a função read_int
	syscall
	
	move $t2, $v0		# move o valor de entrada para t2
	
	
	############ SOMA
	add $t3, $t0, $t1	# soma t0 e t1 em t4
	
	li $v0, 4		# carrega a função print_str
	la $a0, soma		# carrega a string soma e printa
	syscall
	
	li $v0, 1		# carrega a função print_int
	move $a0, $t3		# imprime o valor de t3
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, nova_linha	# carrega a string nova_linha e printa
	syscall
	
	
	############ SUBTRAÇAO
	sub $t3, $t0, $t1	# subtrai t1 de t0
	
	li $v0, 4		# carrega a função print_str
	la $a0, subtracao	# carrega a string subtracao e printa
	syscall
	
	li $v0, 1		# carrega a função print_int
	move $a0, $t3		# imprime o valor de t3
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, nova_linha	# carrega a string nova_linha e printa
	syscall
	
	
	############ AND
	and $t3, $t0, $t1	# faz o and entre t0 e t1
	
	li $v0, 4		# carrega a função print_str
	la $a0, e_logico	# carrega a string e_logico e printa
	syscall
	
	li $v0, 1		# carrega a função print_int
	move $a0, $t3		# imprime o valor de t3
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, nova_linha	# carrega a string nova_linha e printa
	syscall
	
	
	############ OR
	or $t3, $t0, $t1	# ou entre t0 e t1
	
	li $v0, 4		# carrega a função print_str
	la $a0, ou_logico	# carrega a string ou_logico e printa
	syscall
	
	li $v0, 1		# carrega a função print_int
	move $a0, $t3		# imprime o valor de t3
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, nova_linha	# carrega a string nova_linha e printa
	syscall
	
	
	############ XOR
	xor $t3, $t0, $t1	# xor entre t0 e t1
	
	li $v0, 4		# carrega a função print_str
	la $a0, ou_exclusivo	# carrega a string ou_exclusivo e printa
	syscall
	
	li $v0, 1		# carrega a função print_int
	move $a0, $t3		# imprime o valor de t3
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, nova_linha	# carrega a string nova_linha e printa
	syscall
	
	
	############ MASK ( M )
	and $t3, $t2, 0x1f	# and entre c e 31
	
	li $v0, 4		# carrega a função print_str
	la $a0, mascara		# carrega a string mascara e printa
	syscall
	
	li $v0, 1		# carrega a função print_int
	move $a0, $t3		# imprime o valor de t3
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, nova_linha	# carrega a string nova_linha e printa
	syscall
	
	
	############ SLL
	sllv $t0, $t0, $t3	# desloca M bits a esquerda de a
	
	li $v0, 4		# carrega a função print_str
	la $a0, shift_left	# carrega a string shift_left e printa
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, p1		# carrega a string p1 e printa
	syscall
	
	li $v0, 1		# carrega a função print_int
	move $a0, $t3		# imprime o valor de t3
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, p2		# carrega a string p2 e printa
	syscall
	
	li $v0, 1		# carrega a função print_int
	move $a0, $t0		# imprime o valor de t0
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, nova_linha	# carrega a string nova_linha e printa
	syscall
	
	
	############ SRL
	srlv $t1, $t1, $t3	# desloca M bits a esquerda de a
	
	li $v0, 4		# carrega a função print_str
	la $a0, shift_right	# carrega a string shift_right e printa
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, p1		# carrega a string p1 e printa
	syscall
	
	li $v0, 1		# carrega a função print_int
	move $a0, $t3		# imprime o valor de t3
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, p2		# carrega a string p2 e printa
	syscall
	
	li $v0, 1		# carrega a função print_int
	move $a0, $t1		# imprime o valor de t1
	syscall
	
	li $v0, 4		# carrega a função print_str
	la $a0, nova_linha	# carrega a string nova_linha e printa
	syscall
	
	
	li $v0, 10		# fim do programa
	syscall
	
	
	
	