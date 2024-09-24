#B.25 Utilizando toLower, cree ‘strCmpi’ que sea una versión de 
#‘strCmp’ pero de forma “case-insensitive”, es decir, que no preste 
#atención a mayúsculas/minúsculas.

.data
texto1: .string "UnA"
texto2: .string "una frase"

.text 
li a7,1
la,a4,texto1
la a5,texto2
jal strCmpi
ecall

li a7,10
ecall
nop

strCmpi:
     li t1,90
     li t2,32
        loop:
            lb x4,0(a4)
            lb x5,0(a5)
            
            beq x4,x0,end
            
            blt x4,t1,toLower 
            beq x4,x5,sum
            
toLower:
    add x4,x4,t2
    beq x4,x5,sum
    
    j loop

sum:
    addi a0,a0,1
    addi a4,a4,1
    addi a5,a5,1
   j loop

end:  
    li a0,0            
    ret
    
