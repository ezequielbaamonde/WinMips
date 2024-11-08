#Implemente subrutinas típicas para manipular strings, de modo de tener construir una pequeña librería de
#código reutilizable.
#	a) longitud: Recibe en $a0 la dirección de un string y retorna su longitud en $v0

.data
 str: .asciiz "Tomas"
 result: .word 0
 
.code
 daddi $sp, $sp, 0x400
 daddi $a0, $zero, str #traigo DIR
 jal contarLongitud
 sd $v0, result($0)
 halt
 
contarLongitud: daddi $v0, $0, 0 #--> Inicialmente mi contador
	      loop:	lbu $t1, 0($a0)
				beqz $t1, fin
				daddi $v0, $v0, 1 #--> Incremento contador
				daddi $a0, $a0, 1 # --> Salto al sig char
				j loop
		  fin: jr $ra