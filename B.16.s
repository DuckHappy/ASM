#B.16 Repita los últimos dos ejercicios, pero el vector 
#se encuentra compuesto de bytes (8 bits)

.data
    var: .word 100,1000,65536,65537,1000000,0

.text

   la x5,var
   li x6,0
   li a7,1
   
loop:
   
   lb a0,0(x5) 
   addi x5,x5,1 # al ser load byte, de los 4 bits, se vuelve 1
   addi x6,x6,1
   
   bne a0,x0,loop
   nop
   
   add a0,x6,x0
   ecall
   
#lo unico que cambia es a la hora de cargar sera con load byte, 
#fuerza la lectura half y acomodar el puntero