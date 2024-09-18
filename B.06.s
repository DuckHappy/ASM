#B.06 Usando la syscall PrintChar (A7=11), imprima
#los valores ASCII desde 33 hasta 57
.text
    li x5,57
    li a0,33
    li a7,11
    ecall

loop: 
    addi a0,a0,1
  
    li a7,11
    ecall
    
    bne a0,x5,loop
 
    li a7,10
    ecall
    
#Comentario personal, cabe agregar que esta actividad
#se debia realizar repitiendo la ecall, pero me tire
#a hacer un loop