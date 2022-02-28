.data

in1: .asciiz "Multiplicando: "
in2: .asciiz "Multiplicador: "

.text

main:
	li $v0, 4	#função print_str
	la $a0, in1	#carrega a string
	syscall 	#imprime a0
	
	li $v0, 5 	#função read_int
	syscall
	
	move $t0, $v0	#move para a0 o valor de v0
	
	li $v0, 1	#função print_int
	move $a0, $t0	#move para a0 o valor de v0
	syscall
	
	li $v0, 10	#fim do programa
	syscall