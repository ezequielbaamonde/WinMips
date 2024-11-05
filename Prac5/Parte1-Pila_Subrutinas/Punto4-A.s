#*VARIANTES DE LA SUBRUTINA POTENCIA*#

#La versión anterior de potencia utiliza pasaje por registros y por valor. Escribir distintas versiones de la
#subrutina potencia en base términos del pasaje de parámetros.
# a) Referencia y Registro Pasando los parámetros por referencia desde el programa principal a través de
#	registros, y devolviendo el resultado a través de un registro por valor.
.data
 base: .word 2
 exp: .word 3
 result: .word 0
 
.code
 daddi $a0, $0, base #dirección de memoria de base
 daddi $a1, $0, exp #dirección de memoria de exp
 jal potencia
 dadd $t0, $zero, $v0
 sd $t0, result($0) #Por reg por valor
halt

 potencia: daddi $v0, $0, 1 #Cargo primer multi
				 ld $t0, 0($a0) #contenido dirección de memoria base
				 ld $t1, 0($a1) #contenido dirección de memoria exponente
		   lazo: beqz $t1, fin
				 daddi $t1, $t1, -1 #Decremento exponente
				 dmul $v0, $v0, $t0
				 j lazo
		   fin: jr $ra