#B.23 Complete la subrutina contiene, la misma recibe en A2 un 
#string que apunta a un texto (palabra) y en A3 un string que apunta 
#a otro texto (frase). La subrutina debe devolver en A0 un 0 si la 
#palabra NO se encuentra en el texto o 1 si la palabra es parte de 
#la frase. NOTA: Recomendamos utilizar la subrutina previa ‘strCmp’ 
#de forma anidada en ‘contiene’ para resolver este problema.

.data
palabra: .string "una"           # Cadena con la palabra a buscar ("una")
frase: .string " es una"          # Cadena con la frase donde buscar (" es una")
palabra2: .string "no"           # Cadena con otra palabra a buscar ("no")

.text

# Configurar registros para comparar palabra con frase
la a2, palabra                  # Cargar la dirección de la palabra "una" en el registro a2
la a3, frase                    # Cargar la dirección de la frase " es una" en el registro a3
jal contiene                    # Llamar a la subrutina 'contiene' para buscar la palabra en la frase
li a7, 1                        # Preparar syscall para imprimir el resultado
ecall                           # Llamar a syscall para imprimir el valor de a0 (resultado de 'contiene')

# Configurar registros para comparar palabra2 con frase
la a2, palabra2                 # Cargar la dirección de la palabra "no" en el registro a2
la a3, frase                    # Cargar la dirección de la frase " es una" en el registro a3
jal contiene                    # Llamar a la subrutina 'contiene' para buscar palabra2 en la frase
ecall                           # Llamar a syscall para imprimir el valor de a0 (resultado de 'contiene')

# Finalizar el programa
li a7, 10                       # Preparar syscall para finalizar el programa
ecall                           # Llamar a syscall para terminar el programa
nop                             # No operation (espera a la siguiente instrucción)

# Subrutina 'contiene'
# Recibe dos punteros: a2 (palabra) y a3 (frase).
# Devuelve 1 en a0 si la palabra se encuentra en la frase, y 0 si no se encuentra.
contiene:
    mv a2, a2                   # Copiar el valor de a2 (palabra) en a2
    mv a3, a3                   # Copiar el valor de a3 (frase) en a3
    
    loop:                       
        lb x2, 0(a2)            # Cargar el carácter actual de la palabra en x2
        lb x3, 0(a3)            # Cargar el carácter actual de la frase en x3
        
        beq x2, x3, equal       # Si los caracteres coinciden, ir a 'equal' para seguir comparando
        beq x3, x0, noequal     # Si llegamos al final de la frase (x3 == 0), ir a 'noequal'
        
        addi a3, a3, 1          # Avanzar al siguiente carácter en la frase
        j loop                  # Repetir el ciclo hasta encontrar coincidencia o final de la frase
        
    # Si los caracteres coinciden, seguir comparando el resto de la palabra con la frase
    equal:
        addi a2, a2, 1          # Avanzar al siguiente carácter en la palabra
        addi a3, a3, 1          # Avanzar al siguiente carácter en la frase
        beq x2, x0, isequal     # Si llegamos al final de la palabra (x2 == 0), la palabra completa coincide
        beq x2, x3, loop        # Si los siguientes caracteres también coinciden, seguir comparando en 'loop'

    isequal:                    # Si toda la palabra coincide con parte de la frase
        li a0, 1                # Cargar 1 en a0 para indicar que la palabra se encuentra en la frase
        ret                     # Retornar al código principal

    # Si no encontramos coincidencia o llegamos al final de la frase sin éxito
    noequal:
        li a0, 0                # Cargar 0 en a0 para indicar que la palabra no se encuentra en la frase
        ret                     # Retornar al código principal

#Nota: el resultado muestra primero un 1 indicando que
#‘una’ es parte de la frase, y luego 0 indicando que la
#palabra ‘no’ está excluida de la frase.