#B.26 Modifique el programa de la subrutina ‘contiene’ para que 
#ahora soporte búsquedas case-insensitive.

.data
palabra: .string "una"
frase: .string "Es UNA"
palabra2: .string "no"

.text
la a1,palabra
la a2,frase
la a3,palabra2

contiene:
    li t0,90
    li t1,32
    loop:
        lb x1,0(a1)
        lb x2,0(a2)
        
        beq x1,x0,endc 
        beq x2,x0,endi
        
        blt x2,t0,lowcase
        addi a2,a2,1
    
lowcase:
    add x2,x2,t1
    beq x1,x2,next
    bne x1,x2,sum

sum:
    addi a2,a2,1
    jal loop
    
next:
    addi a1,a1,1
    addi a2,a2,1
    jal loop  
    
    
endc:
    li a0,0
    li a7,1
    ecall
    
    jal contiene2
    
endi:
    li a0,1
    li a7,1
    ecall
    li a7,10
    ecall
    
contiene2:
    loop2:
        lb x3,0(a3)
        lb x2,0(a2)
        
        beq x1,x0,endc 
        beq x2,x0,endi
        
        blt x2,t0,lowcase2
        addi a2,a2,1
    
lowcase2:
    add x2,x2,t1
    beq x3,x2,next2
    bne x3,x2,sum2

sum2:
    addi a2,a2,1
    jal loop2
    
next2:
    addi a3,a3,1
    addi a2,a2,1
    jal loop2  
    
    
    