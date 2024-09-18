#B.04 Utilizando la system call 
#‘PrintInt’ (a7=1) imprima por consola el valor 1234.

.data
    numero: .word 1234
    
.text
    la a0,numero
    lw a0,0(a0)
    li a7,1
    ecall