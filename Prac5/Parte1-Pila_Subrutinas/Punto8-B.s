#b) positivos Idem a), pero la subrutina debe contar la cantidad de números positivos. Para ello, implementar y
#usar otra subrutina llamada es_positivo, que reciba un número en $a0 y devuelva en $v0 1 si es positivo y 0
#de lo contrario
.data
 vec: .word 1, 2, 3, 4
 cant: .byte 4
 pos: .word 0
 
.code
 daddi $sp, $sp, 0x400 #pila
 daddi $a0, $0, vec
 lbu $a1, cant($0)
 jal contar #cuenta positivos
 sd $v0, pos($0)
halt
 
contar: daddi $v0, $0, 0 #Inicialmente en cero
	    dadd $t1, $0, $a1 #Paso a $t1 cant elementos para usar como índice del loop
		daddi $t4, $0, 1 #1 para indicar que es positivo
		
 loop: ld $t2, 0($a0) #Traigo numero
	   #push v0 (valor que retorna subrutina)
	   daddi $sp, $sp, -8
	   sd $v0, 0($sp)	
	   
	   #push $a0 (contiene dirección vector)
	   daddi $sp, $sp, -8 
	   sd $a0, 0($sp)	
	   
	   #push dirección de retorno
	   daddi $sp, $sp, -8 
	   sd $ra, 0($sp)
	   
	   #subrutina positivo
	   dadd $a0, $0, $t2 #--> Paso número del vector como argumento
	   jal es_positivo
	   dadd $t3, $0, $v0 #--> Paso el valor que retorna "es_positivo" a $t3

	   #pop dirección
	   ld $ra, 0($sp)
	   daddi $sp, $sp, 8	   
	   
	   #pop $a0 (contiene dirección vector)
	   ld $a0, 0($sp)	
	   daddi $sp, $sp, 8 	    
	   
	   #pop $v0 para contar si es o no
	   ld $v0, 0($sp)	
	   daddi $sp, $sp, 8 	 	   
	   
	   #evaluo si sumo o no sumo positivo
	   beq $t3, $t4, positivo #si es 1 el valor retornado, es positivo
	   j seguir #si no es 1 el valor retornado de la subrutina, quiere decir que no es positivo
positivo: daddi $v0, $v0, 1 #Incremento cant positivos
seguir: daddi $a0, $a0, 8 #Paso al sig elemento (64 bits)
	   daddi $t1, $t1, -1 #Decremento índice
	   bnez $t1, loop
	   jr $ra #fin subrutina

es_positivo: daddi $v0, $0, 0 #---> Negativo
			 slti $t0, $a0, 0 #---> Si es menor, deja 1 en $t0, dlc deja 0
			 bnez $t0, irme #Si no es cero, se va a "irme" porque es negativo. Si es cero, sigue.
			 daddi $v0, $0, 1	 
	   irme: jr $ra #fin subrutna