#e) comparar: Recibe como parámetros las direcciones del comienzo de dos cadenas terminadas en cero y
#retorna la posición en la que las dos cadenas difieren. En caso de que las dos cadenas sean idénticas, debe
#retornar -1.

.data
 string1: .asciiz "Sa"
 string2: .asciiz "Se"
 pos: .word 0

.code
 daddi $sp, $sp, 0x400
 daddi $a0, $0, string1 #Argumento 1
 daddi $a1, $0, string2 #Argumento 2
 jal comparar
 sd $v0, pos($0) #---> Cargo en memoria
 halt
 
comparar: daddi $v0, $0, $0 #Valor inicial
	loop: lbu $t1, 0($a0) #Traigo char
		  beqz $t1, identico #Si el char es un cero, llegamos al final de la cadena
		  lbu $t2, 0($a1) #Traigo char
		  dsub $t3, $t1, $t2 #Resto char's para ver si son iguales
		  bnez $t3, fin #Si la resta no da cero, quiere decir que son distintos.
		  #Podria ser BNE también entre $t1 y $t2 en vez de restar
		  daddi $v0, $v0, 1 #cargo posición
		  daddi $a0, $a0, 1 #incremento posición
		  daddi $a1, $a1, 1 #incremento posición
		  j loop
identico: daddi $v0, $0, -1		  
	 fin: jr $ra #ret