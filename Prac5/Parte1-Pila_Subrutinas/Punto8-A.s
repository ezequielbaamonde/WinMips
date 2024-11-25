#8. Subrutinas con vectores⭐⭐
#a)suma: Escribir una subrutina que reciba como argumento en $a0 la dirección de una tabla de números
#enteros de 64 bits, y en $a1 la cantidad de números de la tabla. La subrutina debe devolver en $v0 la suma de
#los números de la tabla

.data
 vec: .word 1, 2, 3, 4
 cant: .byte 4
 res: .word 0
 
.code
 daddi $a0, $0, vec
 lbu $a1, cant($0)
 jal suma
 sd $v0, res($0)
halt
 
suma: daddi $v0, $0, 0 #Inicialmente
	  dadd $t1, $0, $a1 #Paso a $t1 cant elementos para usar como índice
 loop: ld $t2, 0($a0) #Traigo elementos
	   dadd $v0, $v0, $t2 #Realizo suma
	   daddi $a0, $a0, 8 #Incremento "posición"
	   daddi $t1, $t1, -1 #Decremento índice
	   bnez $t1, loop
	   jr $ra #fin subrutina
