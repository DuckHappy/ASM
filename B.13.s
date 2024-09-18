#B.13 Escriba un programa que cuente cuantos 
#elementos componen un vector utilizando cero
#como último elemento del vector.


.data
    var: .word 100,1000,65536,65537,1000000,0

.text

   la x5,var
   li x6,0
   li a7,1
   
loop:
   
   lw a0,0(x5) 
   addi x5,x5,4
   addi x6,x6,1
   
   bne a0,x0,loop
   nop
   
   addi a0,x6,-1
   ecall