#B.11 Escriba un programa que imprima por 
#consola el valor dado (8 bits signado)
#almacenado en memoria


.data
    var: .byte 129

.text
   la x5,var
   lb a0,0(x5)
   li a7,1
   ecall
   
#De salida muestra -127 porque lb (load byte), rellena lo demas con 1, es decir F