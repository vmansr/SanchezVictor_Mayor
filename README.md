# Encontrar el Número Mayor en MIPS

## Descripción
Este programa en ensamblador MIPS permite al usuario ingresar entre 3 y 5 números, y luego muestra cuál es el mayor de ellos. Está diseñado para ser ejecutado en el simulador MARS 4.5 (MIPS Assembler and Runtime Simulator).

## Características
- Solicita al usuario que ingrese la cantidad de números a comparar (entre 3 y 5).
- Valida la entrada del usuario y muestra un mensaje de error si la cantidad no es válida.
- Pide al usuario que ingrese cada número individualmente.
- Compara los números ingresados y encuentra el mayor.
- Muestra el número mayor al final del proceso.

## Requisitos
- MARS 4.5 (MIPS Assembler and Runtime Simulator)

## Instalación
1. Descarga MARS 4.5 desde la [página oficial de MARS](http://courses.missouristate.edu/KenVollmar/MARS/).
2. Instala Java Runtime Environment (JRE) si aún no lo tienes instalado.

## Uso
1. Abre MARS 4.5.
2. Abre el archivo `ApellidoNombre_Mayor.asm` en MARS.
3. Haz clic en el botón "Assemble" (icono de llave inglesa) para ensamblar el código.
4. Haz clic en el botón "Run" (icono de play) para ejecutar el programa.
5. Sigue las instrucciones en la consola de MARS para ingresar la cantidad de números y los números individuales.

## Estructura del Código
El código está organizado en las siguientes secciones principales:
- `.data`: Contiene las cadenas de texto utilizadas en el programa.
- `.text`: Contiene el código ejecutable del programa.
- `main`: La función principal que controla el flujo del programa.
- `comparar_loop`: El bucle que solicita y compara los números.
- `error_cantidad`: Maneja el caso de una entrada inválida para la cantidad de números.

## Ejemplo de Uso

- Ingrese la cantidad de numeros a comparar (3-5): 4
- Ingrese el numero 1: 10
- Ingrese el numero 2: 5
- Ingrese el numero 3: 15
- Ingrese el numero 4: 8
- El numero mayor es: 15
