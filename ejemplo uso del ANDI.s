#ejemplo ,uso del andi
.data
    impar:  .word 1  # Define una variable "impar" con el valor 1 (un n�mero impar)
    par:    .word 2  # Define una variable "par" con el valor 2 (un n�mero par)

.text
    la a2, par       # Cargar la direcci�n de la variable "par" en el registro a2
    la a3, impar     # Cargar la direcci�n de la variable "impar" en el registro a3

    lw t2, 0(a2)     # Cargar el valor almacenado en la direcci�n de "par" (que es 2) en el registro t2
    lw t3, 0(a3)     # Cargar el valor almacenado en la direcci�n de "impar" (que es 1) en el registro t3
    
    # Verificar si el valor en t2 (que es 2) es par o impar:
    # Realiza la operaci�n AND entre t2 y 1 (ANDI para valor inmediato)
    # Esto revisa el bit menos significativo del valor de t2.
    andi a0, t2, 1   # Si el resultado es 0, es par; si es 1, es impar (a0 = resultado)
    
    # Preparar para imprimir el resultado (el contenido de a0) en la consola:
    li a7, 1         # C�digo del sistema para imprimir entero (syscall 1)
    ecall            # Llamar al sistema para imprimir el valor de a0 (resultado de ANDI)

    # Ahora verificar si el valor en t3 (que es 1) es par o impar:
    andi a0, t3, 1   # Realiza la operaci�n AND entre t3 y 1, guardando el resultado en a0
    
    # Imprimir el resultado (el contenido de a0) en la consola:
    li a7, 1         # C�digo del sistema para imprimir entero
    ecall            # Llamada al sistema para imprimir el valor de a0
