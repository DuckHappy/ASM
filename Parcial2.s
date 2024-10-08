#imprimir solo los números pares de un vector separados por un guion
.data 
    numeros: .word 4,7,29,14,24,35,12
    fnumeros:
.text
    la a1,numeros
    la a2,fnumeros
    jal pares

fin:
    beq x0,x0,fin

pares:
    li a0,0
    lw a0,0(a1)
    beq a2,a1,fin
    andi t1,a0,1
    bne t1,x0,siguiente
    li a7,1
    ecall

siguiente:
    addi a1,a1,4
     bne a2,a1,pares
     
     
#Pasar los negativos de un vector a positivos (hay que cambiarlos en el vector), y 
#los que cambiemos hay que imprimirlos separados por |
.data
    cadena_1: .byte -45,0,20,23,-58,98,-100,24,49
    cadena_f:
        
.text
    la a0,cadena_1
    la a2,cadena_f
    jal negapos

fin2:
    beq x0,x0,fin2

negapos:
    mv a1,a0
    loop2:   
        lb t1,0(a1)
        beq a2,a1,fin2
        bge t1,x0,siguiente2
        mv a0,t1
        li a7,1
        ecall
        li a0,0
        addi a0,a0,124
        li a7,11
        ecall
        neg t1,t1
    
siguiente2:
    addi a1,a1,1
    bne a2,a1,loop2
    
#dado un vector con words (pero todos números menores de 128), hay que asignar cada uno a un bit y 
#empaquetarlos, de manera que cada 4 elementos tengamos una word. Hay que reemplazar el vector original con 
#estos nuevos números empaquetados, y el resto de elementos del vector que sobren después de hacer esto hay que 
#ponerlos en cero. Al final hay que imprimir el vector separado por coma    
.data
    datos: .word 4,7,10,100,24,56,12,0
    fdatos:
.text
    la a0,datos    #cargo en a0 la dire de inicio del vector
    la a1,fdatos    #cargo en a1 la dire de fin de datos
    jal empaquetar    #llamo a la subrutina empaquetar
    
    la a0,datos    #cargo en a0 la dire de inicio del vector
    la a1,fdatos    #cargo en a1 la dire de fin de datos
    jal imprimir_datos3    #llamu a la subrutina imprimir_datos
fin3:
    beq x0,x0,fin

empaquetar:
     mv t0,a0
     mv t1,a0
     addi t0,t0,1
     addi t1,t1,4
     loop3:
         lw t2,0(t1)
         sb t2,0(t0)
         li t2,0
         sw t2,0(t1)
         addi t0,t0,1
         addi t1,t1,4
         beq t1,a1,imprimir_datos3
         bne t1,a1,loop3
         
imprimir_datos3:
    mv t0,a0
        bucle3:
            lw a0,0(t0)
            li a7,1
            ecall
            beq t0,a1,fin
            
            li a0,44
            li a7,11
            ecall
            
            addi t0,t0,4
            
            bne t0,a1,bucle3
    
    
    
    