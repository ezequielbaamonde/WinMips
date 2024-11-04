.data
 texto: .asciiz "Ingrese un numero entero:\n" #El mensaje a mostrar
 texto2: .asciiz "Resultado de la suma: " #El mensaje a mostrar
 CONTROL: .word 0x10000
 DATA: .word 0x10008
 
.code
 ld $t0, CONTROL($zero) #; $t0 = dirección de CONTROL
 ld $t1, DATA($zero) # $t1 = dirección de DATA
 daddi $t3, $zero, 2 #Contador del loop
 daddi $t4, $zero, 0 #Inicializo resultado

loop: daddi $t2, $zero, texto # $t2 = dirección del mensaje a mostrar
	  sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
      daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
	  sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
	  
	  #Lectura de numero
	  daddi $t2, $zero, 8 # función 8: entrada de un un numero sin signo
	  sd $t2, 0($t0) # CONTROL recibe 8 y produce la lectura del numero
	  ld $t2, 0($t1) #Cargo valor ingresado en $t2
	  dadd $t4, $t4, $t2 # Sumo el numero ingresado 
	  daddi $t3, $t3, -1 #Decremento contador
	  bnez $t3, loop #evaluo que el contador no sea 0 para leer otro num
	  
 #Impresión de resultado
 daddi $t2, $zero, texto2 # $t2 = dirección del mensaje a mostrar
 sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
 daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
 sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje	 
 
 sd $t4, 0($t1) # DATA recibe el resultado 
 daddi $t2, $zero, 1 # función 1: salida de un un numero sin signo
 sd $t2, 0($t0) # CONTROL recibe 1 y produce la salida del numero
 halt
 
#A) Suma de números ⭐ Escribir un programa que lea dos números enteros y muestre su suma en la salida estándar
# del simulador (ventana Terminal) el resultado numérico
