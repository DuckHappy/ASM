#B.15 Repita los últimos dos ejercicios, pero el vector se encuentra
#compuesto de half-words (16 bits).

.data
    var: .word 100,1000,65536,65537,1000000,0

.text

   la x5,var
   li x6,0
   li a7,1
   
loop:
   
   lh a0,0(x5) 
   addi x5,x5,2 # al ser half, de los 4 bits, se vuelven 2
   addi x6,x6,1
   
   bne a0,x0,loop
   nop
   
   add a0,x6,x0
   ecall
   
#lo unico que cambia es a la hora de cargar sera con load half, 
#fuerza la lectura half y acomodar el puntero