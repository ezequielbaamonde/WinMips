#Número combinatorio: Utilizando factorial, implementa la subrutina comb que calcula el 
#número combinatorio (también llamado coeficiente binomial) comb(m,n) = m! / (n! * (n-m)!).
#Asumir que n > m.


#Revisar BUCLE INFINITO
.data
 n: .word 24
 m: .word 4
 resul: .word 0
 
.code
 daddi $sp,$0, 0x400
 ld $a0, n($0) #Cargo el valor 6 en $a0
 ld $a1, m($0) #Cargo el valor 3 en $a1
 jal comb #llamo a subrutina comb
 
 sd $v0, resul($0) #Seteo resultado final
 halt
 
 
factorial: daddi $v0, $0, 1
     loop: dmul $v0, $v0, $a0
		   daddi $a0, $a0, -1 #Decremento $t0
		   bnez $a0, loop
		   jr $ra   
		   
comb: daddi $sp, $sp, -8 #Apilo $ra prog principal	  
	  sd $ra, 0($sp) #Cargo en pila $ra prog principal	   
	  
	  dsub $t0, $a0, $a1 #n-m
	  jal factorial
	  dadd $t1, $0, $v0 #Guardo n!
	  dadd $a0, $0, $a1 #a0 ahora es m	  
	  jal factorial	  	
	  dadd $t2, $0, $v0 #Guardo m!
	  dadd $a0, $0, $t0 #a0 ahora es (n-m)  	  
	  jal factorial
	  
	  dmul $t0, $t1, $v0 # (n! * (n-m)!)
	  ddiv $v0, $t2, $t0 # m! / (n! * (n-m)!)
	  ld $ra, 0($sp) #Recupero de la pila el $ra
	  daddi $sp, $sp, 8 #Desapilo $ra prog principal	  
	  jr $ra #Retorno al prog pricipal