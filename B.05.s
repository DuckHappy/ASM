#B.05 Modifique el programa anterior para que imprima 
#-1234 y luego el programa termine (Syscall Exit A7=10).

.data
    numero: .word 1234
    
.text
    la a0,numero
    lw a0,0(a0)
    li a7,1
    ecall
    
    li a7,10
    ecall