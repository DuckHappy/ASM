#B.04 Utilizando la system call 
#‘PrintInt’ (a7=1) imprima por consola el valor 1234.

.text
    li a0,1234
    li a7,4
    ecall