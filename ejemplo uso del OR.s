#ejemplo, uso del or
.data
    n1: .word 0x12340000   # Define un número n1 con el valor hexadecimal 0x12340000
    n2: .word 0x00005678   # Define un número n2 con el valor hexadecimal 0x00005678

.text
    # Cargar la dirección de la variable "n1" en el registro a1
    la a1, n1              # "la" (load address) carga la dirección de memoria de "n1" en el registro a1

    # Cargar el valor almacenado en la dirección de "n1" en el registro t1
    lw t1, 0(a1)           # "lw" (load word) carga el valor de "n1" (0x12340000) desde la memoria a t1

    # Cargar la dirección de la variable "n2" en el registro a2
    la a2, n2              # "la" carga la dirección de memoria de "n2" en el registro a2

    # Cargar el valor almacenado en la dirección de "n2" en el registro t2
    lw t2, 0(a2)           # "lw" carga el valor de "n2" (0x00005678) desde la memoria a t2

    # Realizar la operación OR bit a bit entre t1 y t2 y guardar el resultado en a0
    or a0, t1, t2          # "or" realiza la operación bit a bit OR entre t1 (0x12340000) y t2 (0x00005678)
                           # Resultado: a0 = 0x12345678 (combinación de los bits de t1 y t2)

    # Preparar para imprimir el valor de a0 (que contiene 0x12345678)
    li a7, 1               # "li" (load immediate) carga el código del sistema para imprimir entero (syscall 1) en a7

    # Llamar al sistema para imprimir el valor en a0
    ecall                  # "ecall" es la llamada al sistema para ejecutar la operación (imprimir en este caso)

    