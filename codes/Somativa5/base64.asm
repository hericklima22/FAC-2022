.data
	novaLinha: .asciiz "\n"
	igualdade: .asciiz "="
	entrada: .space 300
	decode: .byte 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9','+','/'
.text

main:
	li	$v0, 8					# lê string
	la	$a0, entrada				# carrega o espaço do array que vai salvar a entrada
	li	$a1, 32					# limite de 32 bytes de entrada
	syscall
	
	la	$t0, entrada				# salva a entrada em t0

	li	$t4, 0					# contador de digitos
	li 	$t5, 0					# acumulador
	li	$s5, 0xFC0000
	li	$s1, 0
	
strCount:
	lbu 	$t2, entrada($s1) 			# percorre cada elemento da string
	addi 	$s1, $s1, 1				# contador ++
	beq	$t2, 0x0a, fimCount
	j strCount
	
fimCount:
	addi	$s1, $s1, -1
	
loop:	
	lbu 	$t2, entrada($t1) 			# percorre cada elemento da string
	
	addi 	$t1, $t1, 1				# contador ++
		
	beq	$t2, 0x0a, naoSoma			# se o char atual for o \0 ele nao é concatenado
	
	add	$t5, $t5, $t2				# t5 += str[i]
	
naoSoma:	
	
	addi	$t4, $t4, 1				# incrementa a quantidade de letras lidas
	beq	$t4, 3, grupo				# se t5 for igual a 3 pula para a label grupo
	sll	$t5, $t5, 8				# t5 << 8
	beqz 	$t2, exit 				# se for igual a 0 sai do loop
	
	j loop
	
	
grupo:
	and	$t7, $t5, $s5				# pega os 6 digitos do grupo
	srl	$t7, $t7, 18				# anda 5 bits para a direita em t5 para caber no index do array
	
	

	sll	$t5, $t5, 6				# remove os 6 bits capturados anteriormente
	andi	$t8, $t7, 0x3F				# pega os ultimos 5 digitos
	
	lb	$a0, decode($t7)			# s0 = decode[t7]
	
	bge	$t4, 2, naoVerif
	ble	$t1, $s1, naoVerif
	
	beqz	$t8, igual				# se t8 = 0 printa "="
	
naoVerif:
	j normal

volta:
	beqz	$t4, loop
	addi	$t4, $t4, -1				# decrementa t4 em 1
	
	j grupo
	
normal:
	li	$v0, 11
	syscall
	
	j volta

igual:
	li	$v0, 4
	la	$a0, igualdade
	syscall
	
	j volta
		
exit:		
	li	$v0, 4
	la	$a0, novaLinha
	syscall
	
	li $v0, 10
	syscall

		


	
