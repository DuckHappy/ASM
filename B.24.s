#B.24 Escriba la rutina toLower que reciba un carácter (byte) 
#en a0, y si el mismo está en mayúscula [A-Z] devuelva el mismo 
#en minúscula [a-z]

.data
letraA: .string "A"      # Cadena que contiene la letra "A"
letraB: .string "b"      # Cadena que contiene la letra "b"

.text
li a7, 11                # Cargar el código de syscall para imprimir un carácter

# Probar con la letra A
lb a0, letraA            # Cargar el carácter 'A' en el registro a0
jal toLower              # Llamar a la subrutina toLower para convertir a minúscula
ecall                    # Imprimir el resultado (el carácter convertido)

# Probar con la letra b
lb a0, letraB            # Cargar el carácter 'b' en el registro a0
jal toLower              # Llamar a la subrutina toLower
ecall                    # Imprimir el resultado (el carácter, que no cambia)

# Finalizar el programa
li a7, 10                # Cargar el código de syscall para finalizar el programa
ecall                    # Llamar a la syscall para terminar
nop                      # No operation (instrucción vacía)

# Subrutina toLower
# Esta subrutina convierte un carácter mayúscula (A-Z) a minúscula (a-z)
toLower:
    li t0, 65            # Cargar el valor ASCII de 'A' en t0
    li t1, 90            # Cargar el valor ASCII de 'Z' en t1
    li t2, 32            # Cargar el valor 32 (diferencia entre mayúsculas y minúsculas) en t2
    
    # Comprobar si el carácter es menor que 'A'
    blt a0, t0, nocambia  # Si el carácter en a0 es menor que 'A', ir a nocambia
    
    # Comprobar si el carácter es mayor que 'Z'
    blt t1, a0, nocambia  # Si el carácter en a0 es mayor que 'Z', ir a nocambia
    
    # Convertir a minúscula si es mayúscula
    add a0, a0, t2        # Sumar 32 al carácter en a0 para convertir a minúscula

nocambia:
    ret                   # Retornar al código principal

    

    
    
    
    