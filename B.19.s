#B.19 Escriba una subrutina PrintLen que imprima
#cuantas letras componen un string cuya 
#dirección comienza en A1.
.data
    texto: .string "Hola Mundo!"
    
.text
    la a1,texto
    jal PrintLen
    li a7,10
    ecall
    nop
    
PrintLen:
    
    li x5,0 #inicializo contador 
    
loop:
    
    lb x6,0(a1) #posicional
    beqz x6,done #evito que sume uno de mas
    
    addi a1,a1,1 #adelanto posiciones
    addi x5,x5,1 #contador
    add a0,x0,x5 #lo cargo en a0, para el ecall
    
    bnez x6,loop
    
done:
    li a7,1
    ecall   
 
    ret
    


