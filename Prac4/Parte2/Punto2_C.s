.data
 textoini: .asciiz "Ingrese una clave de 4 caracteres ->  " #El mensaje a mostrar
 textofin: .asciiz " intentos restantes.\n" #El mensaje a mostrar
 str: .asciiz "...." #reservo 4bytes (5 con el 0 al final)
 clave: .asciiz "hola" #Clave a comparar
 
 clavec: .asciiz "Clave correcta: acceso permitido\n" #Impresión si es correcto.
 clavei: .asciiz "Clave incorrecta.\n" #Impresión si es correcto.
 
 CONTROL: .word 0x10000
 DATA: .word 0x10008
 
.code
 ld $t0, CONTROL($zero) #; $t0 = dirección de CONTROL
 ld $t1, DATA($zero) # $t1 = dirección de DATA
 daddi $t6, $0, 5 #Cant intentos
 
 #IMPRESIÓN MSJ INICIAL
inicio: daddi $t2, $zero, textoini # $t2 = dirección del 1° mensaje a mostrar
	    sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
	    daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
	    sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
		#Imprimo intentos
		sd $t6, 0($t1) # DATA recibe el numero de intentos
		daddi $t2, $zero, 1 # $t2 = 1 -> función 1: salida de una un num sin signo
	    sd $t2, 0($t0) # CONTROL recibe 1 y produce la salida del numero
		#Sigo mensaje
		daddi $t2, $zero, textofin # $t2 = dirección del 2° mensaje a mostrar
	    sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
	    daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
	    sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
		
 #LECTURA DE DATOS
 daddi $t3, $zero, 4 #cant de chars
 daddi $t2, $zero, 9 #t2 = 9 -> Función 9; Leer char
 daddi $t4, $zero, 0 #Puntero del vector str
loop: sd $t2, 0($t0) # Envío función de LEER a CONTROL
	  lbu $t5, 0($t1) #cargo el DATO ingresado en $t5
	  sb $t5, str($t4); #Escribo en el string la letra ingresada
	  daddi $t4, $t4, 1 #Aumento el puntero en 1byte
	  daddi $t3, $t3, -1 #Decremento contador de chars
	  bnez $t3, loop #Si el contador no es cero, loopea y lee otra letra
	  
 #Evaluo clave
 ld $t4, str($0) #Cargo cadena str
 ld $t5, clave($0) #Cargo cadena clave
 beq $t4, $t5, enviar # Si las cadenas son iguales, salta a "enviar". Si no es igual, reingresa clave
 daddi $t2, $zero, clavei # MSJ INCORRECTO
 sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
 daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
 sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
 daddi $t6, $t6, -1 #Decremento intentos
 bnez $t6, inicio
 j fin
	   
enviar: daddi $t2, $0, clavec # MSJ CORRECTO 
		sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
		daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
		sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
 
fin: halt

#c) Comprobación con intentos
# 	Modificar el programa anterior para que el programa termine luego de 5 intentos fallidos. Indicar la cantidad de 
#intentos restantes con el mensaje: “Ingrese una clave de 4 carácteres (X intentos restantes)”. Pista: Para imprimir
#este mensaje, utilice 3 impresiones: primero con el comienzo del string, luego el valor X y luego el resto del string.