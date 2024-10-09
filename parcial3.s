# 1.completar la subrutina "negativos" recibe en a0 la dirección inicial del vector, cuenta la 
#cantidad de numeros negativos e impimir el resultado antes de retornar
.data
    vecneg: .word -4,-7,10,100,-24  # Defino un vector con algunos números negativos
    fneg:                          # Marcador para el fin del vector

.text
    la a0,vecneg    # Cargo en a0 la dirección de inicio del vector de números
    la a1,fneg      # Cargo en a1 la dirección del fin del vector
    jal negativos   # Llamo a la subrutina 'negativos' para contar los números negativos
    
    la a0,vecneg    # Cargo en a0 la dirección de inicio del vector de nuevo
    la a1,fneg      # Cargo en a1 la dirección del fin del vector de nuevo
    jal imprimir_negativos  # Llamo a la subrutina 'imprimir_negativos' para mostrar el resultado

fin:
    beq x0,x0,fin   # Instrucción de bucle infinito para terminar el programa

# Subrutina "negativos": Cuenta la cantidad de números negativos en el vector
negativos:
    mv t0,a0        # Muevo la dirección inicial del vector a t0 para recorrerlo
    li t2,0         # Inicializo el contador de números negativos en t2 a 0
loop:
    lw t1,0(t0)     # Cargo el valor del vector actual en t1
    blt x0,t1,siguiente  # Si el valor es negativo (t1 < 0), salta a 'siguiente'
    addi t2,t2,1    # Si es negativo, incremento el contador en 1
    addi t0,t0,4    # Avanzo a la siguiente posición del vector (cada word es 4 bytes)
    beq t0,a1,imprimir_negativos  # Si t0 llega al fin del vector, paso a imprimir
    bne t0,a1,loop  # Si no hemos llegado al fin del vector, repito el bucle

siguiente:
    addi t0,t0,4    # Si el valor no era negativo, solo avanzo al siguiente número
    bne t0,a1,loop  # Repito el bucle si no llegué al final del vector

# Subrutina "imprimir_negativos": Imprime el número de negativos encontrados
imprimir_negativos:
    mv a0,t2        # Muevo el número de negativos contados (t2) a a0 para imprimir
    li a7,1         # Cargamos el código de syscall para imprimir enteros (1)
    ecall           # Llamada al sistema para imprimir el entero en a0


# 2.Completar la subrutina "toupper" e "imprimir" toupper transforma una cadena de 
#carácteres de minúsculas a mayúsculas (restar 32), guardar el resultado en la posición de 
#memoria correspondiente
.data
    vecstring: .string "PAlabrA"  # Defino una cadena de caracteres que incluye mayúsculas y minúsculas
    fvec:                         # Marcador para el fin de la cadena

.text
    la a0,vecstring     # Cargo en a0 la dirección de inicio de la cadena
    la a1,fvec          # Cargo en a1 la dirección del fin de la cadena
    jal toupper         # Llamo a la subrutina 'toupper' para convertir las minúsculas a mayúsculas
    
    la a0,vecstring     # Cargo de nuevo en a0 la dirección de la cadena modificada
    la a1,fvec          # Cargo en a1 la dirección del fin de la cadena
    jal imprimir        # Llamo a la subrutina 'imprimir' para mostrar la cadena resultante

fin2:
    beq x0,x0,fin2      # Bucle infinito para finalizar el programa

# Subrutina "toupper": Convierte los caracteres en minúsculas a mayúsculas (resta 32 a las minúsculas)
toupper:
    mv t0,a0            # Muevo la dirección de inicio de la cadena a t0 para recorrerla
    li t3,-32           # Cargo en t3 el valor -32 (diferencia entre minúscula y mayúscula en ASCII)
    li t4,70            # Cargo en t4 el valor ASCII de 'F' para usarlo en la comparación
    lb t1,0(t0)         # Cargo el primer byte (carácter) en t1
    addi t0,t0,1        # Avanzo al siguiente byte en t0
loop2:
    lb t1,0(t0)         # Cargo el carácter actual de la cadena en t1
    blt t1,t4,siguiente2  # Si el carácter es menor que 'F', lo salto (es mayúscula o no debe cambiar)
    add t1,t1,t3        # Si es minúscula, resto 32 (convierte a mayúscula)
    sb t1,0(t0)         # Guardo el carácter modificado en su posición original
    addi t0,t0,1        # Avanzo al siguiente byte
    beq t0,a1,imprimir  # Si llego al final de la cadena, paso a imprimir
    bne t0,a1,loop2     # Si no, repito el bucle para el siguiente carácter

# Si el carácter no es minúscula, simplemente avanzo
siguiente2:
    addi t0,t0,1        # Avanzo al siguiente byte sin modificarlo
    sb t1,0(t0)         # Guardo el carácter original sin cambios
    bne t0,a1,loop2     # Repito el bucle si no hemos llegado al final de la cadena

# Subrutina "imprimir": Imprime la cadena modificada
imprimir:
    mv t0,a0            # Muevo la dirección inicial de la cadena a t0
    li a7,4             # Cargo el código de syscall para imprimir cadenas (4)
    ecall               # Llamada al sistema para imprimir la cadena

# 3.Completar las subrutinas "imprimir" e "invertir" "Imprimir" imprime un string pasando la posición inicial 
#por a0 "Invertir" recibe por a0 la posición inicial de un string, invierte la cadena, guarda el resultado 
#en memoria
#Salida esperada: "Aprobado"
#Nota: los string terminan con cero.
.data
    vecstring2: .string "odaborpA"   # Cadena de caracteres para invertir
    fvec2:                           # Marcador del final de la cadena

.text
    la a0,vecstring2   # Cargo en a0 la dirección inicial de la cadena "odaborpA"
    la a1,fvec2        # Cargo en a1 la dirección del final de la cadena
    jal invertir       # Llamo a la subrutina 'invertir' para invertir la cadena
    
    la a0,vecstring2   # Cargo de nuevo en a0 la dirección de la cadena invertida
    la a1,fvec2        # Cargo en a1 la dirección del final de la cadena
    jal imprimir3      # Llamo a la subrutina 'imprimir3' para mostrar la cadena invertida

fin3:
    beq x0,x0,fin3     # Bucle infinito para finalizar el programa

# Subrutina "invertir": Recibe un string en a0 y lo invierte.
invertir:
    mv t0,a0           # Muevo la dirección inicial de la cadena a t0 para recorrerla
    loop3:
        lb t1,0(t0)    # Cargo el byte actual (carácter) en t1
        beq t1,x0,imprimir   # Si encuentro el terminador nulo (cero), paso a imprimir
        addi t0,t0,1   # Avanzo al siguiente byte en t0
        bne t1,x0,loop3  # Repito el bucle hasta llegar al final de la cadena

# Subrutina "imprimir3": Imprime la cadena invertida.
imprimir3:
    addi a1,a1,-1      # Retrocedo en a1 (último carácter de la cadena)
    lb a0,0(a1)        # Cargo el carácter actual en a0
    sb a3,0(a2)
    addi a2,a2,1
    li a7,11           # Código de syscall para imprimir un solo carácter
    ecall              # Llamada al sistema para imprimir el carácter
    bne a1,x0,imprimir3  # Si no es el fin de la cadena, repito hasta imprimir toda la cadena

    
 


    

    
    
    
    
