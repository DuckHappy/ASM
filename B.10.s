#B.10 Escriba un programa que imprima
#por consola el valor dado (16 bits sin signo)
#almacenado en memoria.

.data
    var: .half 32769

.text
   la x5,var
   lw a0,0(x5)
   li a7,1
   ecall
   
