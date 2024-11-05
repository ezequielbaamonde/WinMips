#*VARIANTES DE LA SUBRUTINA POTENCIA*#

#La versión anterior de potencia utiliza pasaje por registros y por valor. Escribir distintas versiones de la
#subrutina potencia en base términos del pasaje de parámetros.
# b) Valor y Pila Pasando los parámetros por valor desde el programa principal a través de la pila, y
#    devolviendo el resultado a través de un registro por valor.
.data
 b: .word 5
 e: .word 2
 result: .word 0
 
.code
 daddi $sp, $zero, 0x400 #Dirección SP
 ld $a0, b($0) #Cargo base en $a0
 daddi $sp, $sp, -8 #Push de $a0
 sd $a0, 0($sp) #Cargo en pila
 
 ld $a1, e($0) #Cargo exponente en $a1
 daddi $sp, $sp, -8 #Push de $a1
 sd $a1, 0($sp) #Cargo en pila
 
 jal potencia #llamo subrutina
 
 sd $v0, result($0) #Por reg por valor
halt

 potencia: daddi $v0, $0, 1 #Cargo primer multi
		   ld $t1, 0($sp) #Cargo $a1 (exp) en $t1
		   daddi $sp, $sp, 8 #Desapilo
		   ld $t0, 0($sp) #Cargo $a0 (base) en $t0
		   daddi $sp, $sp, 8 #Desapilo
		   lazo: beqz $t1, fin #Cambio a $t1
				 daddi $t1, $t1, -1 #Decremento exponente
				 dmul $v0, $v0, $t0 #Ahora es $t0 la base
				 j lazo
		   fin: jr $ra