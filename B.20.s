#B.20 Complete la subrutina StrLen que recibe 
#en A1 la dirección de comienzo de un string, y
#devuelve en A0 el largo del string. IMPORTANTE: 
#El valor de A1 debe ser el mismo al momento
#de retornar de la subrutina.

.data
    texto: .string "Hola Mundo!"
    
.text
la a1,texto
#strlen devuelve en a0
#el largo del string
jal StrLen
li a7,1
ecall
li a7,10
ecall
nop

StrLen:
    addi a2,a1,0
    addi a0,a0,0
    
    StrLenLoop:
        
        lb x5,0(a2)
        beq x5,x0,finish
    
        addi a2,a2,1
        addi a0,a0,1
    
        j StrLenLoop
        
        finish:
    
            ret