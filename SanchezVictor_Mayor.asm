
# Estas líneas definen las cadenas de texto que usaremos en el programa.  
.data
    msg_cantidad:    .asciiz "Ingrese la cantidad de numeros a comparar (3-5): "
    msg_numero:      .asciiz "Ingrese el numero "
    msg_mayor:       .asciiz "El numero mayor es: "
    msg_error:       .asciiz "Error: La cantidad debe estar entre 3 y 5.\n"
    newline:         .asciiz "\n"

#Se marca el inicio de la sección de código.
.text
.globl main	                                    #Hace que la etiqueta "main" sea goblal, permitiendo
						    #sea el punto de entrada del programa.

main:
    # Pedir cantidad de números
    li $v0, 4                                      #Carga el valor 4 en $v0, que es el código para imprimir una cadena.
    la $a0, msg_cantidad                           #Carga la dirección de msg_cantidad en $a0.
    syscall                                        #Llama al sistema para ejecutar la impresión.                      

    # Leer cantidad
    li $v0, 5                                      #Prepara para leer un entero.
    syscall                                        #Lee el entero ingresado por el usuario.
    move $s0, $v0                                  # $s0 = cantidad  Mueve el valor leído a $s0 para guardarlo.

    # Verificar si la cantidad está entre 3 y 5 Si es menor que 3 o mayor que 5, salta a "error_cantidad".
    blt $s0, 3, error_cantidad
    bgt $s0, 5, error_cantidad

    # Inicializar contador y mayor. Inicializa el contador ($t0) en 1 y el número mayor ($s1) en 0.
    li $t0, 1  # contador
    li $s1, 0  # mayor

comparar_loop:               #Esta sección imprime el mensaje para pedir cada número, incluyendo el contador actual.
    # Pedir número
    li $v0, 4
    la $a0, msg_numero
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # Leer número. Lee el número ingresado por el usuario y lo guarda en $t1.
    li $v0, 5
    syscall
    move $t1, $v0  # $t1 = número actual

    # Comparar con el mayor
    bge $s1, $t1, no_actualizar   #Si el mayor es mayor o igual, salta a "no_actualizar".
    move $s1, $t1                 #Si no, actualiza el mayor con el número actual.

no_actualizar:
    # Incrementar contador y comparar
    addi $t0, $t0, 1
    ble $t0, $s0, comparar_loop  #Si el contador es menor o igual que la cantidad total, vuelve a comparar_loop.

    # Mostrar resultado. Imprime el mensaje final y el número mayor.
    li $v0, 4
    la $a0, msg_mayor
    syscall

    li $v0, 1
    move $a0, $s1
    syscall

    # Salir del programa
    li $v0, 10
    syscall

#Esta sección se ejecuta si la cantidad ingresada no está entre 3 y 5.
#Imprime un mensaje de error y vuelve al inicio del programa.
error_cantidad:
    li $v0, 4
    la $a0, msg_error
    syscall
    j main