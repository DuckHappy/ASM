# Imprimir solo los números pares de un vector separados por un guion
.data 
    numeros: .word 4,7,29,14,24,35,12  # Vector de números
    fnumeros:                          # Dirección final del vector

.text
    la a1, numeros                     # Cargar la dirección del inicio del vector en a1
    la a2, fnumeros                    # Cargar la dirección final del vector en a2
    jal pares                           # Llamar a la subrutina pares

fin:
    beq x0, x0, fin                    # Bucle infinito (fin del programa)

# Subrutina para imprimir números pares
pares:
    li a0, 0                            # Inicializar a0 (donde se carga cada número)
    lw a0, 0(a1)                        # Cargar el primer número en a0
    beq a2, a1, fin                     # Si hemos llegado al final, salir
    andi t1, a0, 1                      # Verificar si es par (bit menos significativo)
    bne t1, x0, siguiente               # Si no es par, ir a siguiente
    li a7, 1                            # Código para imprimir entero
    ecall                                # Imprimir el número

siguiente:
    addi a1, a1, 4                      # Mover a la siguiente posición en el vector
    bne a2, a1, pares                   # Si no hemos llegado al final, repetir

# Pasar los negativos de un vector a positivos (cambiarlos en el vector) e imprimirlos
.data
    cadena_1: .byte -45, 0, 20, 23, -58, 98, -100, 24, 49  # Vector de bytes con algunos negativos
    cadena_f:  # Direccion final del vector

.text
    la a0, cadena_1                   # Cargar la dirección de inicio del vector en a0
    la a2, cadena_f                   # Cargar la dirección final del vector en a2
    jal negapos                        # Llamar a la subrutina negapos

fin2:
    beq x0, x0, fin2                  # Bucle infinito (fin del programa)

# Subrutina para cambiar negativos a positivos e imprimir
negapos:
    mv a1, a0                          # Mover a0 a a1 para manipulación
loop2:   
    lb t1, 0(a1)                       # Cargar el byte actual en t1
    beq a2, a1, fin2                   # Si hemos llegado al final, salir
    bge t1, x0, siguiente2             # Si es positivo, ir a siguiente
    mv a0, t1                          # Mover el número negativo a a0
    li a7, 1                           # Código para imprimir entero
    ecall                               # Imprimir el número
    li a0, 0                           # Reiniciar a0 para imprimir el separador
    addi a0, a0, 124                   # Cargar el código ASCII de '|'
    li a7, 11                          # Código para imprimir carácter
    ecall                               # Imprimir el separador
    neg t1, t1                         # Negar el número para hacerlo positivo

siguiente2:
    addi a1, a1, 1                     # Mover a la siguiente posición en el vector
    bne a2, a1, loop2                  # Si no hemos llegado al final, repetir

# Dado un vector con words, empaquetar los números en un solo word
.data
    datos: .word 4, 7, 10, 100, 24, 56, 12, 0  # Vector de números
    fdatos:                                   # Dirección final del vector

.text
    la a0, datos                      # Cargar la dirección del inicio del vector en a0
    la a1, fdatos                    # Cargar la dirección final del vector en a1
    jal empaquetar                   # Llamar a la subrutina empaquetar
    
    la a0, datos                     # Cargar de nuevo la dirección de inicio del vector en a0
    la a1, fdatos                    # Cargar la dirección final del vector en a1
    jal imprimir_datos3              # Llamar a la subrutina para imprimir datos

fin3:
    beq x0, x0, fin                  # Bucle infinito (fin del programa)

# Subrutina para empaquetar los números
empaquetar:
    mv t0, a0                        # t0 apunta al inicio del vector
    mv t1, a0                        # t1 también apunta al inicio del vector
    addi t0, t0, 1                   # Mover a la siguiente dirección de byte
    addi t1, t1, 4                   # Mover a la siguiente palabra
loop3:
    lw t2, 0(t1)                     # Cargar la palabra actual en t2
    sb t2, 0(t0)                     # Almacenar el último byte en t0
    li t2, 0                          # Reiniciar t2 a 0
    sw t2, 0(t1)                     # Reiniciar la palabra a 0
    addi t0, t0, 1                    # Mover a la siguiente dirección de byte
    addi t1, t1, 4                    # Mover a la siguiente dirección de palabra
    beq t1, a1, imprimir_datos3      # Si hemos llegado al final, imprimir
    bne t1, a1, loop3                # Repetir el bucle

# Subrutina para imprimir los datos empaquetados
imprimir_datos3:
    mv t0, a0                        # t0 apunta al inicio del vector
bucle3:
    lw a0, 0(t0)                     # Cargar la palabra actual en a0
    li a7, 1                          # Código para imprimir entero
    ecall                              # Imprimir el número
    beq t0, a1, fin                  # Si hemos llegado al final, salir
    
    li a0, 44                         # Cargar el código ASCII de la coma
    li a7, 11                         # Código para imprimir carácter
    ecall                              # Imprimir la coma
    
    addi t0, t0, 4                    # Mover a la siguiente palabra
    bne t0, a1, bucle3               # Repetir hasta llegar al final
