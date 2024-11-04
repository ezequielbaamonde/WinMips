.data
 texto: .asciiz "Ingrese una clave de 4 caracteres:\n" #El mensaje a mostrar
 
 str: .asciiz "...." #reservo 4bytes (5 con el 0 al final)
 clave: .asciiz "hola" #Clave a comparar
 
 clavec: .asciiz "Clave correcta: acceso permitido\n" #Impresión si es correcto.
 clavei: .asciiz "Clave incorrecta\n" #Impresión si es correcto.
 
 CONTROL: .word 0x10000
 DATA: .word 0x10008
 
.code
 ld $t0, CONTROL($zero) #; $t0 = dirección de CONTROL
 ld $t1, DATA($zero) # $t1 = dirección de DATA
 
 #IMPRESIÓN MSJ INICIAL
 daddi $t2, $zero, texto # $t2 = dirección del mensaje a mostrar
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
 bne $t5, $t6, noig # Si las cadenas no son iguales, salta a INCORRECTO. Si es igual, sigue
 daddi $t2, $0, clavec # MSJ CORRECTO
 j enviar
 noig: daddi $t2, $zero, clavei # MSJ INCORRECTO
enviar: sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
		daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
		sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
 
halt

#a) Comprobación simple Escriba un programa que solicite el ingreso por teclado de una clave, representada por un
#string de 4 carácteres. Para indicar al usuario que debe ingresar un valor, imprimir en pantalla “Ingrese una clave 
#de4 carácteres”. Luego, debe comparar la secuencia ingresada con una cadena almacenada en la variable clave. Si las
#dos cadenas son iguales entre sí, mostrar el texto “Clave correcta: acceso permitido” en la salida estándar del
#simulador (ventana Terminal). En cambio, si las cadenas no son iguales, mostrar “Clave incorrecta.”