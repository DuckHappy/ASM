.data
cadena1: .string "Hola Mundo!"                  # Cadena 1: "Hola Mundo!"
cadena2: .string "Inserte cadena de texto"      # Cadena 2: "Inserte cadena de texto"
cadena3: .string "Hola Mundo!"                  # Cadena 3: "Hola Mundo!"
cadena4: .string "Hola Mundo! mas largo"        # Cadena 4: "Hola Mundo! mas largo"

.text

# Compara cadena1 y cadena2
li a7, 1               # Cargar el código de syscall para imprimir enteros en a7
la a4, cadena1         # Cargar la dirección de cadena1 en a4
la a5, cadena2         # Cargar la dirección de cadena2 en a5
jal strCmp             # Llamar a la subrutina strCmp para comparar las cadenas
ecall                  # Realizar la syscall para imprimir el resultado

# Compara cadena1 y cadena3
la a5, cadena3         # Cargar la dirección de cadena3 en a5
jal strCmp             # Llamar a la subrutina strCmp para comparar las cadenas
ecall                  # Realizar la syscall para imprimir el resultado

# Compara cadena1 y cadena4
la a5, cadena4         # Cargar la dirección de cadena4 en a5
jal strCmp             # Llamar a la subrutina strCmp para comparar las cadenas
ecall                  # Realizar la syscall para imprimir el resultado

# Finaliza el programa
li a7, 10              # Código de syscall para terminar el programa
ecall
nop                    # No Operation (espera a la siguiente instrucción)

# Subrutina strCmp: Compara dos cadenas de caracteres (en a4 y a5)
strCmp:
    loop: 
        lb x4, 0(a4)      # Cargar el carácter actual de la cadena1 en x4
        lb x5, 0(a5)      # Cargar el carácter actual de la cadena2 en x5
        
        beq x4, x5, equal # Si los caracteres actuales son iguales, sigue comparando
        bne x4, x5, not_equal # Si son diferentes, salta a not_equal
        
        addi a4, a4, 1    # Avanza al siguiente carácter de cadena1
        addi a5, a5, 1    # Avanza al siguiente carácter de cadena2
        
        beq x4, x0, end   # Si llegamos al final de cadena1, salta al final
        beq x5, x0, end   # Si llegamos al final de cadena2, salta al final
        
        j strCmp          # Repetir la comparación para el siguiente carácter

# Si encontramos caracteres que no son iguales
not_equal:
    li a0, 1              # Cargar 1 en a0 para indicar que las cadenas son distintas
    ret                   # Retorna al código principal

# Si llegamos al final de ambas cadenas (son iguales)
end:
    beq x4, x5, equal     # Si ambos caracteres (finales) son nulos, son iguales
    li a0, 1              # Si no, las cadenas no son iguales
    ret                   # Retorna al código principal

# Si todos los caracteres son iguales
equal:
    li a0, 0              # Cargar 0 en a0 para indicar que las cadenas son iguales
    ret                   # Retorna al código principal
