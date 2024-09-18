#B.18 Escriba un programa que defina un string y lo imprima por consola

.data
    texto: .string "Hola Mundo!"
    
.text
    la a0,texto
    li a7,4
    ecall