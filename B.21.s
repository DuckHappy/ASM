#B.21 Complete la subrutina reverseStr, la cual imprime 
#por pantalla el string recibido en orden inverso. 
#Tenga en cuenta que puede reutilizar subrutinas 
#anteriores como StrLen.

.data
    frase: .string "YVAN EHT NIOJ"
    
.text
    la a1,frase
    jal reverseStr
    li a7,10
    ecall 
    nop

reverseStr:
    addi a5,x1,0 #guardamos dir de retorno
    #Obtenemos el largo primero
    jal StrLen
    #Ahora en A0 tenemos el largo
    #completar-->
         
    loop:       
        beq x6,x0,end2
         
        addi a1,a1,-1
        addi x6,x6,-1
        
        lw a0,0(a1)
        li a7,11
        ecall
            
        j loop
        
        end2:
            li a7,10
            ecall
          
StrLen:
    addi x6,x0,0

    StrLenLoop:
        lb x5,0(a1)
        beq x5,x0,end
        
        addi a1,a1,1
        addi x6,x6,1
        
        j StrLenLoop
        
     end:
          ret   
        
        
    