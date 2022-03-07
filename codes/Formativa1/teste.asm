.data

FloatZero: .float 0.0
simbolo: .asciiz "0x"
quebraLinha: .asciiz "\n"
positivo: .asciiz "+\n"
negativo: .asciiz "-\n"
resultadoHexa:  .space  8
    
    .text
main:
    li $v0, 6 #le a variavel float
    syscall #chama a leitura do float
    mfc1 $t8 $f0 #armazena no $t8
    
    li $v0, 2 # chama a impressão com codigo 2 codigo de float
    mov.s $f12, $f0 # move de um registrador f0 para fl12 ao qual será impresso
    syscall # chamada de sistema
    
    li $v0, 4 # chama a impressão
    la $a0, quebraLinha # chama o caractere '\n'
    syscall # chamada de sistema
    
    # extrai o bit 31
    ori  $t0 $zero 0x1
    sll  $t0 $t0 31 
    and  $a0 $t0 $t8
    srl  $a0 $a0 31 # shift lateral a esquerda
    add  $t1, $zero, $a0
    beq  $a0, 0, imprimePositivo
    bne  $a0, 0, imprimeNegativo
    
central:   
    ori  $t0 $zero 0xFF # extrai os bits 23-30
    sll  $t0 $t0 23
    and  $a0 $t0 $t8
    srl  $a0 $a0 23
    addi  $t3, $zero, 127
    sub $a0, $a0, $t3
    
    addi $v0 $zero 1 # imprime o expoente
    syscall

    li $v0, 4 
    la $a0, quebraLinha
    syscall

    
    li $v0, 4
    la $a0, simbolo
    syscall

    #extrai os bits 0-22
    
    ori  $t0 $zero 0xFFFF
    sll  $t0 $t0 7
    ori  $t0 $t0 0x7F
    and  $a0 $t0 $t8
    jal hex
    
    li $v0, 4 
    la $a0, quebraLinha
    syscall
 
    li $v0, 10
    syscall

imprimePositivo:
    add $t4, $zero, $a0
    li $v0, 4 
    la $a0, positivo
    syscall
    beqz $ra, central # quando $ra for zero finaliza o programa else continua
    j central
    
imprimeNegativo:
    add $t4, $zero, $a0
    li $v0, 4 
    la $a0, negativo
    syscall
    beqz $ra, central # quando $ra Ã© zero finaliza o programa else continua
    j central
    
hex:    
    sub $sp, $sp, 24            # joga o registrador na pilha
    sw $a0, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    sw $s2, 12($sp)
    sw $s3, 16($sp)
    sw $s4, 20($sp)
    move $s2, $a0               # Move a0 to s2
    li $s0, 8                   # 8 separa 8 digitos pra palavra
    la $s3, resultadoHexa           # string definida aqui

loopHexa:
    rol $s2, $s2, 4             # comeÃ§a com digito mais significativo a esquerda
    and $s1, $s2, 0xf           # mascara 15 digitos no s2 ae coloca o resultado no s1
    ble $s1, 9, imprimeHexa        # If s1 <= 9, vai para rotina de impressÃ£o
    add $s1, $s1, 7             # Else s1 = s1 + 7 (to get A-F)

imprimeHexa:
    add $s1, $s1, 48            # Soma 48 (30 hex) para pegar o codigo ascii
    sb $s1,($s3)                # armazena o byte no resultado. s3 -> result
    add $s3, $s3, 1             # s3 = s3 + 1
    add $s0, $s0, -1            # s0 = s0 - 1
    bnez $s0, loopHexa           # If s0 != 0, vai para o loop do hexa
    
    la $a0, resultadoHexa           # Mostra o resultado hexa
    li $v0, 4
    syscall

    jr $ra                      # Retorna
	syscall