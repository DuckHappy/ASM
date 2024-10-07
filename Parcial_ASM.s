.data
    textoMax: .string "El maximo es: "            # Mensaje para imprimir el m�ximo
    textoCan: .string " ,Veces que aparece: "     # Mensaje para imprimir la cantidad de veces que aparece
    vectorUnsigned: .half 100,32799,20,1000,6502,12345,65000,41234,56,65535,20,65535,65535  # Vector de halfwords (2 bytes)
    vectorPos: .byte 1,2,3,5,7,10                # Vector de posiciones (1 byte cada uno)
    finPos:                                      # Marca el fin de vectorPos
.text
# Cargo vectores como argumentos
    la a3, vectorUnsigned  # Cargo la direcci�n base de vectorUnsigned en a3
    la a4, vectorPos       # Cargo la direcci�n base de vectorPos en a4
    la a5, finPos          # Cargo la direcci�n del fin de vectorPos en a5

# Primera parte: buscar el m�ximo valor en el vectorUnsigned
    li a7, 4               # C�digo para imprimir cadenas de texto
    la a0, textoMax        # Cargo la direcci�n de "El m�ximo es:" en a0
    ecall                  # Llamo al sistema para imprimir el mensaje
    jal buscaMax           # Llamo a la subrutina buscaMax para obtener el valor m�ximo
    li a7, 1               # C�digo para imprimir enteros
    ecall                  # Llamo al sistema para imprimir el valor m�ximo
  
# Segunda parte: contar cu�ntas veces aparece el m�ximo en el vectorUnsigned
    li a7, 4               # C�digo para imprimir cadenas de texto
    la a0, textoCan        # Cargo la direcci�n de " ,Veces que aparece:" en a0
    ecall                  # Llamo al sistema para imprimir el mensaje
    jal buscaCant          # Llamo a la subrutina buscaCant para contar las apariciones del m�ximo
    li a7, 1               # C�digo para imprimir enteros
    ecall                  # Imprimo el n�mero de veces que aparece el m�ximo
    
    # Imprimir salto de l�nea
    li a7, 11              # C�digo para imprimir caracteres
    li a0, 10              # Cargar el c�digo ASCII del salto de l�nea
    ecall                  # Imprimir salto de l�nea
    
# Tercera parte: imprimir los valores en las posiciones indicadas por vectorPos
    jal imprimePos         # Llamo a la subrutina imprimePos para imprimir los valores seg�n las posiciones
    
    # Terminar
    li a7, 10              # C�digo para terminar el programa
    ecall                  # Llamo al sistema para finalizar
    
# Subrutina buscaMax: encuentra el valor m�ximo en vectorUnsigned
buscaMax:
    mv t3, a3              # Cargar la direcci�n base de vectorUnsigned en t3
    lhu a0, 0(t3)          # Cargar el primer valor en a0 como valor inicial del m�ximo
    addi t3, t3, 2         # Avanzar a la siguiente posici�n (siguiente halfword)
    
loop:
    lhu t0, 0(t3)          # Cargar el valor en t0 desde vectorUnsigned
    bgeu t0, a0, cambiar   # Si el valor en t0 es mayor o igual que a0, ir a cambiar
    addi t3, t3, 2         # Si no, avanzar a la siguiente posici�n
    bne t3, a4, loop       # Si no hemos llegado al final del vector, repetir el bucle
    
cambiar:
    mv a0, t0              # Guardar el nuevo valor m�ximo en a0
    addi t3, t3, 2         # Avanzar a la siguiente posici�n
    bne t3, a4, loop       # Repetir si no hemos llegado al final del vector
    ret                    # Retornar con el valor m�ximo en a0

# Subrutina buscaCant: cuenta cu�ntas veces aparece el valor m�ximo en vectorUnsigned
buscaCant:
    addi a6, x1, 0         # Guardar el valor de x1 en a6 (preservar el valor)
    jal buscaMax           # Llamar a buscaMax para obtener el valor m�ximo
    mv t4, a3              # Cargar la direcci�n base de vectorUnsigned en t4
    mv t5, a0              # Guardar el valor m�ximo en t5
    li a0, 0               # Inicializar el contador a 0
    
bucle:
    lhu t3, 0(t4)          # Cargar el valor desde vectorUnsigned en t3
    beq t3, t5, igual      # Si t3 es igual al m�ximo, ir a igual
    addi t4, t4, 2         # Si no, avanzar a la siguiente posici�n
    beq t4, a4, fin        # Si hemos llegado al final del vector, ir a fin
    bne t4, a4, bucle      # Repetir el bucle si no hemos terminado
    
igual:
    addi t4, t4, 2         # Avanzar a la siguiente posici�n
    addi a0, a0, 1         # Incrementar el contador
    bne t4, a4, bucle      # Repetir el bucle si no hemos terminado
    
fin:
    addi x1, a6, 0         # Restaurar el valor de x1 desde a6
    ret                    # Retornar con el contador en a0

# Subrutina imprimePos: imprime los valores de vectorUnsigned en las posiciones indicadas por vectorPos
imprimePos:
    addi a6, x1, 0         # Guardar x1 en a6 (preservar)
    mv t3, a3              # Cargar direcci�n base de vectorUnsigned en t3
    mv t5, a4              # Cargar direcci�n base de vectorPos en t5
    
rep:
    lb t6, 0(t5)           # Cargar �ndice de vectorPos en t6
    add t6, t6, t6         # Multiplicar t6 por 2 (porque los halfwords son de 2 bytes)
    
    add t1, t3, t6         # Sumar el desplazamiento a la direcci�n base de vectorUnsigned
    lhu a0, 0(t1)          # Cargar el valor desde vectorUnsigned
    
    li a7, 1               # C�digo para imprimir enteros
    ecall                  # Imprimir el valor en a0
    
    li a7, 11              # C�digo para imprimir caracteres
    li a0, 32              # Imprimir un espacio entre los valores
    ecall                  # Imprimir el espacio
    
    addi t5, t5, 1         # Avanzar al siguiente �ndice en vectorPos
    bne t5, a5, rep        # Si no hemos llegado al final de vectorPos, repetir el bucle
    
    ret                    # Restaurar y terminar
