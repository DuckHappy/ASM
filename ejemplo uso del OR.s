#ejemplo, uso del or
.data
    n1: .word 0x12340000   # Define un n�mero n1 con el valor hexadecimal 0x12340000
    n2: .word 0x00005678   # Define un n�mero n2 con el valor hexadecimal 0x00005678

.text
    # Cargar la direcci�n de la variable "n1" en el registro a1
    la a1, n1              # "la" (load address) carga la direcci�n de memoria de "n1" en el registro a1

    # Cargar el valor almacenado en la direcci�n de "n1" en el registro t1
    lw t1, 0(a1)           # "lw" (load word) carga el valor de "n1" (0x12340000) desde la memoria a t1

    # Cargar la direcci�n de la variable "n2" en el registro a2
    la a2, n2              # "la" carga la direcci�n de memoria de "n2" en el registro a2

    # Cargar el valor almacenado en la direcci�n de "n2" en el registro t2
    lw t2, 0(a2)           # "lw" carga el valor de "n2" (0x00005678) desde la memoria a t2

    # Realizar la operaci�n OR bit a bit entre t1 y t2 y guardar el resultado en a0
    or a0, t1, t2          # "or" realiza la operaci�n bit a bit OR entre t1 (0x12340000) y t2 (0x00005678)
                           # Resultado: a0 = 0x12345678 (combinaci�n de los bits de t1 y t2)

    # Preparar para imprimir el valor de a0 (que contiene 0x12345678)
    li a7, 1               # "li" (load immediate) carga el c�digo del sistema para imprimir entero (syscall 1) en a7

    # Llamar al sistema para imprimir el valor en a0
    ecall                  # "ecall" es la llamada al sistema para ejecutar la operaci�n (imprimir en este caso)

    