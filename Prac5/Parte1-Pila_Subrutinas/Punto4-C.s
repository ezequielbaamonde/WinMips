#*VARIANTES DE LA SUBRUTINA POTENCIA*#

#La versión anterior de potencia utiliza pasaje por registros y por valor. Escribir distintas versiones de la
#subrutina potencia en base términos del pasaje de parámetros.
# C) Referencia y Pila Pasando los parámetros por referencia desde el programa principal a través de la pila, y
#	 devolviendo el resultado a través de un registro por valor
.data
 b: .word 5
 e: .word 2
 result: .word 0
 
.code
 daddi $sp, $zero, 0x400 #Dirección SP
 daddi $a0, $0, b #Cargo dirección de base en $a0
 daddi $sp, $sp, -8 #Push de $a0
 sd $a0, 0($sp) #Cargo argumento en pila
 
 daddi $a1, $0, e #Cargo dirección de exponente en $a1
 daddi $sp, $sp, -8 #Push de $a0
 sd $a1, 0($sp) #Cargo argumento en pila
 
 jal potencia #llamo subrutina
 
 sd $v0, result($0) #Por reg por valor
halt

 potencia: daddi $v0, $0, 1 #Cargo primer multi
		   ld $t2, 0($sp) #Cargo $a1 (exp) en $t2
		   daddi $sp, $sp, 8 #Desapilo
		   ld $t1, 0($t2) #cargo valor en $t1 de la dirección que está en $t2
		   
		   ld $t2, 0($sp) #Cargo $a0 (base) en $t2
		   daddi $sp, $sp, 8 #Desapilo
		   ld $t0, 0($t2) #cargo valor en $t0 de la dirección que está en $t2
		   
		   lazo: beqz $t1, fin #Cambio a $t1
				 daddi $t1, $t1, -1 #Decremento exponente
				 dmul $v0, $v0, $t0 #Ahora es $t0 la base
				 j lazo
		   fin: jr $ra