#SIN HACER


.data
 texto: .asciiz "Ingrese 1 numero entero:\n" #El mensaje a mostrar
 texto2: .asciiz "Ingrese una operación a realizar (+, -, * o /):\n" #El mensaje a mostrar
 texto3: .asciiz "Resultado de la operacion: " #El mensaje a mostrar
 
 CONTROL: .word 0x10000
 DATA: .word 0x10008
 
.code
 ld $t0, CONTROL($zero) #; $t0 = dirección de CONTROL
 ld $t1, DATA($zero) # $t1 = dirección de DATA

 #Imprime mensaje numero
 daddi $t2, $zero, texto # $t2 = dirección del mensaje a mostrar
 sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
 daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
 sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
 
 #Lectura de numero 1
 daddi $t2, $zero, 8 # función 8: entrada de un un numero
 sd $t2, 0($t0) # CONTROL recibe 8 y produce la lectura del numero
 ld $t2, 0($t1) #Cargo en $t2 el valor ingresado

 #Lectura de numero 2
 daddi $t3, $zero, 8 # función 8: entrada de un un numero sin signo
 sd $t3, 0($t0) # CONTROL recibe 8 y produce la lectura del numero
 ld $t3, 0($t1) #Cargo en $t2 el valor ingresado	  
	  
 #Evaluar Operación
 daddi $t4, $zero, texto2 # $t2 = dirección del mensaje a mostrar
 sd $t4, 0($t1) # DATA recibe el puntero al comienzo del mensaje
 daddi $t4, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
 sd $t4, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje	 
 
 #Leer CHAR de operación
 daddi $t4, $0, 9 
 sd $t4, 0($t0) # CONTROL recibe 9 y lee caracter
 lbu $t4, 0($t1) #Cargo caracter ingresado en $t4
 
 daddi $t4, $0, 43 # +
 daddi $t5, $0, 45 # -
 daddi $t6, $0, 42 # *
 daddi $t7, $0, 47 # /
 beq $t4, $t4, suma
 beq $t4, $t5, resta
 beq $t4, $t6, multi
 beq $t4, $t7, divi
 
suma: dadd $t2, $t2, $t3
	  j imprimir
	  
resta: dsub $t2, $t2, $t3
	   j imprimir

multi: dmul $t2, $t2, $t3
	   j imprimir
	 
divi: ddiv $t2, $t2, $t3
	  j imprimir

 #Impresión de resultado
imprimir: daddi $t4, $zero, texto3 # $t2 = dirección del mensaje a mostrar
		  sd $t4, 0($t1) # DATA recibe el puntero al comienzo del mensaje
		  daddi $t4, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
		  sd $t4, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje	 
		  sd $t2, 0($t1) # DATA recibe el resultado que está almacenado en $t2 
	      daddi $t4, $zero, 2 # función 1: salida de un un numero CON signo
	      sd $t4, 0($t0) # CONTROL recibe 1 y produce la salida del numero
 halt
 
#c) Modificar b) para que el programa funcione como una calculadora común. Para ello, lea
#primero un número, y luego lea pares de (operación, número). Cada vez que lee un par (operación, número), aplique la
#misma al resultado anterior y lo muestra en la pantalla.