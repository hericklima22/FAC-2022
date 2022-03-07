.data

	novaLinha: .asciiz "\n"
.text

main:
	li $a1, 11	# colocando o inteiro 11 no registrador a1
	jal showNumber	# jump and link para shownumber
	
	
	li $a1, 11	# colocando o inteiro 11 no registrador a1
	jal clearBitZero	# jump and link para clearbitzero
	
	
	move $a1, $v0
	jal showNumber
	

	li $v0, 10
	syscall		# fim do programa
	
	
# espera o número que vai ser exibido em $a1	
showNumber:
	li $v0, 4	# imprime string
	la $a0, novaLinha
	syscall
	
	li $v0, 1
	move $a0, $a1
	syscall
	
	jr $ra
	
clearBitZero:
	# mascara é $s0
	addi $sp, $sp, -4	# alocando espaço no stack pra um valor
	sw $s0, 0($sp)
	
	# fazer a máscara
	li $s0, -1	# todos os bits serao 1
	sll $s0, $s0, 1
	and $v0, $a1, $s0
	
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra