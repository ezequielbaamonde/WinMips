.data
 texto: .asciiz "Ingrese una clave de 4 caracteres:\n" #El mensaje a mostrar
 str: .asciiz "...." #reservo 4bytes (5 con el 0 al final)
 clave: .asciiz "hola" #Clave a comparar
 
 clavec: .asciiz "Clave correcta: acceso permitido\n" #Impresión si es correcto.
 clavei: .asciiz "Clave incorrecta. Reintente nuevamente...\n" #Impresión si es correcto.
 
 CONTROL: .word 0x10000
 DATA: .word 0x10008
 
.code
 ld $t0, CONTROL($zero) #; $t0 = dirección de CONTROL
 ld $t1, DATA($zero) # $t1 = dirección de DATA
 
 #IMPRESIÓN MSJ INICIAL
inicio: daddi $t2, $zero, texto # $t2 = dirección del mensaje a mostrar
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
 ld $t5, str($0) #Cargo cadena str
 ld $t6, clave($0) #Cargo cadena clave
 beq $t5, $t6, enviar # Si las cadenas son iguales, salta a "enviar". Si no es igual, reingresa clave
 daddi $t2, $zero, clavei # MSJ INCORRECTO
 sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
 daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
 sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
 j inicio
	   
enviar: daddi $t2, $0, clavec # MSJ CORRECTO 
		sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
		daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
		sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
 
halt

#b) Comprobación infinita Modificar el programa anterior para solicitar nuevamente el ingreso de la clave cuando es
# incorrecta. El programa solo termina cuando la clave ingresada es la correcta