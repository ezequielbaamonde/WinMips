.data
 CONTROL: .word 0x10000
 DATA: .word 0x10008
 
 texto: .asciiz "Ingrese la base del triangulo:\n" #El mensaje a mostrar
 texto2: .asciiz "Ingrese la altura del triangulo:\n" #El mensaje a mostrar
 texto3: .asciiz "Superficie: " #El mensaje a mostrar
 superficie: .word 0 #Almacena el valor de la superficie

 
.code
 ld $t0, CONTROL($zero) # $t0 = dirección de CONTROL
 ld $t1, DATA($zero) # $t1 = dirección de DATA

 #Imprime mensaje base
 daddi $t2, $zero, texto # $t2 = dirección del mensaje a mostrar
 sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
 daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
 sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
 
 #Lectura de base ($t2)
 daddi $t2, $zero, 8 # función 8: entrada de un un numero
 sd $t2, 0($t0) # CONTROL recibe 8 y produce la lectura del numero
 ld $t2, 0($t1) #Cargo en $t2 el valor ingresado que quedo en data $t1
 
 #Imprime mensaje altura
 daddi $t3, $zero, texto2 # $t3 = dirección del mensaje a mostrar
 sd $t3, 0($t1) # DATA recibe el puntero al comienzo del mensaje
 daddi $t3, $zero, 4 # $t3 = 4 -> función 4: salida de una cadena ASCII
 sd $t3, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
 
 #Lectura de altura ($t3)
 daddi $t3, $zero, 8 # función 8: entrada de un un numero sin signo
 sd $t3, 0($t0) # CONTROL recibe 8 y produce la lectura del numero
 ld $t3, 0($t1) #Cargo en $t3 el valor ingresado	  
	  
 #Evaluar Superficie = (base x altura) / 2
 dmul $t2, $t2, $t3 #(base x altura)
 daddi $t3, $0, 2
 ddiv $t2, $t2, $t3 # (base x altura) / 2
 
 #Almaceno en Variable
 sd $t2, superficie($0) #Escribo valor de superficie en variable
 
 #Impresión de resultado
 daddi $t3, $zero, texto3 # $t2 = dirección del mensaje a mostrar
 sd $t3, 0($t1) # DATA recibe el puntero al comienzo del mensaje
 daddi $t3, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
 sd $t3, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje	 
 sd $t2, 0($t1) # DATA recibe el resultado que está almacenado en $t2 
 daddi $t3, $zero, 2 # función 1: salida de un un numero CON signo
 sd $t3, 0($t0) # CONTROL recibe 1 y produce la salida del numero
 halt
 
#d) Escribir un programa que calcule la superficie de un triángulo
#rectángulo de base B y altura A, y almacene el resultado en una variable llamada superficie. Debe leer el valor de A y
#B por teclado, y mostrar el resultado.
#Pista: la superficie de un triángulo se calcula como: Superficie = (base x altura) / 2