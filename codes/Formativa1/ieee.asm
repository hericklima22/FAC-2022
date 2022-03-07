.data
	n1: .float 3.14
	n2: .float 2.71
	n3: .double 3.14
	n4: .double 2.71
	nextline: .asciiz "\n"
	n5: .double 3.00
	n6: .double 2.01
	n7: .double 6.00
	n8: .double 2.00
.text

main:
	lwc1 $f2, n1	# load word in coprocessor 1 : carrega a label n1 no registrador f2 que faz parte do coprocessador de FPU
	lwc1 $f4, n2	# load word in coprocessor 1 : carrega a label n1 no registrador f4 que faz parte do coprocessador de FPU
	
	add.s $f12, $f2, $f4 # somando os valores de precisão simples de f2 e f4 e colocando em f12
	
	li $v0, 3	# imprime o valor do registrador f12
	syscall
	
	li $v0, 4
	la $a0, nextline
	syscall
	
	################### agora para operações com double
	
	ldc1 $f6, n3	# o tipo double ocupa dois registradores, mas uitilizar somente o registr5ador par como referencia
	ldc1 $f8, n4	# carrega n4 nos registradores f8 e f9
	
	add.d $f12, $f6, $f8	# soma de double
	
	li $v0, 3	# imprime o valor do registrador f12
	syscall
	
	li $v0, 4
	la $a0, nextline
	syscall
	
	################### multiplicaçao de double
	
	ldc1 $f14, n5
	ldc1 $f16, n6
	
	mul.d $f12, $f14, $f16	# multiplica n5 e n6 e guarda o resultado em f12
	
	li $v0, 3	# imprime o valor do registrador f12
	syscall
	
	li $v0, 4
	la $a0, nextline
	syscall
	
	################### divisão de double
	
	ldc1 $f18, n7
	ldc1 $f20, n8
	
	div.d $f12, $f18, $f20	# divide n7 por n8 e guarda o resultado em f12
	
	li $v0, 3	# imprime o valor do registrador f12
	syscall
	
	li $v0, 4
	la $a0, nextline
	syscall
	
	################### subtração de double
	
	ldc1 $f22, n7
	ldc1 $f24, n8
	
	sub.d $f12, $f18, $f20	# subtrai n8 de n7 e guarda o resultado em f12
	
	li $v0, 3	# imprime o valor do registrador f12
	syscall
	
	li $v0, 4
	la $a0, nextline
	syscall