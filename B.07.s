#B.07 Modifique el programa anterior para que 
#cada elemento se encuentre rodeado entre
# corchetes [ ] (verifique la tabla ASCII para los valores de los corchetes).

.text
    li x5,57
    li x6,32
    
    li a0,91
    li a7,11
    ecall
    
    li a0,33
    li a7,11
    ecall
    
    li a0,93
    li a7,11
    ecall

loop: 
    addi x6,x6,1
    
    li a0,91
    li a7,11
    ecall
    
    addi a0,x6,1
    addi x7,x6,0
    li a7,11
    ecall
    
    li a0,93
    li a7,11
    ecall
    
    bne x7,x5,loop
 
    li a7,10
    ecall
    
#Comentario personal, cabe agregar que esta actividad
#se debia realizar repitiendo la ecall, pero me tire
#a hacer un loop