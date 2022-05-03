.data
	celsius: .byte 'C'
	kelvin: .byte 'K'
	fahren: .byte 'F'
	p: .space 3
	d: .space 3
.text

main:
	li	$t0, 2				# limite de caracteres a serem lidos

	li	$v0, 8				# chama a função de leitura de char
	la	$a0, p				# carrega p em a0
	la	$a1, ($t0)			# limita a entrada
	syscall				
	
	li	$v0, 8				# chama a função de leitura de char
	la	$a0, d				# carrega d em a0
	la	$a1, ($t0)			# limita a entrada 
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	