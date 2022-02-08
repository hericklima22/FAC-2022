.data

str:	.asciiz "Chamou\n"
saida:	.asciiz "\n"
.text

main:
	add $t0, $zero, $zero	# inicializa a variavel t0 com 0
for:
	li $v0, 1	# função print_int
	move $a0, $t0 	# carrega o int em a0
	syscall
	li $v0, 4	# função print_str
	la $a0, saida	# carrega a string em a0
	syscall

	addi $t0, $t0, 1	# incrementa 1 em t0
	slti $t1, $t0, 16	# t1 = 1 se t0 < 10
	bne $t1, $zero, for	# volta para for se t1 < 10

	li $v0, 10
	syscall