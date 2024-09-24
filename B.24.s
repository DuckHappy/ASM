#B.24 Escriba la rutina toLower que reciba un car�cter (byte) 
#en a0, y si el mismo est� en may�scula [A-Z] devuelva el mismo 
#en min�scula [a-z]

.data
letraA: .string "A"      # Cadena que contiene la letra "A"
letraB: .string "b"      # Cadena que contiene la letra "b"

.text
li a7, 11                # Cargar el c�digo de syscall para imprimir un car�cter

# Probar con la letra A
lb a0, letraA            # Cargar el car�cter 'A' en el registro a0
jal toLower              # Llamar a la subrutina toLower para convertir a min�scula
ecall                    # Imprimir el resultado (el car�cter convertido)

# Probar con la letra b
lb a0, letraB            # Cargar el car�cter 'b' en el registro a0
jal toLower              # Llamar a la subrutina toLower
ecall                    # Imprimir el resultado (el car�cter, que no cambia)

# Finalizar el programa
li a7, 10                # Cargar el c�digo de syscall para finalizar el programa
ecall                    # Llamar a la syscall para terminar
nop                      # No operation (instrucci�n vac�a)

# Subrutina toLower
# Esta subrutina convierte un car�cter may�scula (A-Z) a min�scula (a-z)
toLower:
    li t0, 65            # Cargar el valor ASCII de 'A' en t0
    li t1, 90            # Cargar el valor ASCII de 'Z' en t1
    li t2, 32            # Cargar el valor 32 (diferencia entre may�sculas y min�sculas) en t2
    
    # Comprobar si el car�cter es menor que 'A'
    blt a0, t0, nocambia  # Si el car�cter en a0 es menor que 'A', ir a nocambia
    
    # Comprobar si el car�cter es mayor que 'Z'
    blt t1, a0, nocambia  # Si el car�cter en a0 es mayor que 'Z', ir a nocambia
    
    # Convertir a min�scula si es may�scula
    add a0, a0, t2        # Sumar 32 al car�cter en a0 para convertir a min�scula

nocambia:
    ret                   # Retornar al c�digo principal

    

    
    
    
    