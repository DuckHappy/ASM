#B.17 Complete la subrutina printVector en el siguiente programa. 
#La misma imprime los elementos de un vector (separados por ; ) cuya 
#dirección se pasa por A1 y la cantidad de elementos se pasa por A2.

.data
    var: .word 100,1000,65536,65537,1000000,0
    finvar:

.text

  la a1,var
  la,a2,finvar
  sub a2,a2,a1
  srai a2,a2,2
  
  jal x1,printVector
  li a7,10
  ecall
  nop
  
printVector:
   lw x5,0(a1)
   add a0,x0,x5
   li a7,1
   ecall
   
   addi a1,a1,4
   
   addi a2,a2,1
   
   addi a0,x0,59
   li a7,11
   ecall
   
   bne x5,x0,printVector 
      
      ret