#B.12 Escriba un programa que imprima el tercer 
#elemento del vector.

.data
    var: .word 100,1000,65536,65537,1000000

.text
   la x5,var
   lw a0,8(x5)
   li a7,1
   ecall
   
#Cada espacio es asignado con 4 bits, por lo cual 100 ocupa 4
#1000 ocupa 4, necesitaria empujar 8 bits para llegar a la tercera posicion
