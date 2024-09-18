#B.09 Escriba un programa que imprima por 
#consola el valor dado (16 bits signado)
#almacenado en memoria.

.data
    var: .half 32769

.text
   la x5,var
   lh a0,0(x5)
   li a7,1
   ecall
   
#recordemos que si bien la variable var carga con 32719
#mostrara -32767, porque estamos usando lh
#al ser load high, rellenara lo demas con F, y de ahi cambia a negativo