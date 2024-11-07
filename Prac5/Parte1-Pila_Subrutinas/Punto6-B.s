#Número combinatorio: Utilizando factorial, implementa la subrutina comb que calcula el 
#número combinatorio (también llamado coeficiente binomial) comb(m,n) = m! / (n! * (n-m)!).
#Asumir que n > m.


#Revisar BUCLE INFINITO
.data
 n: .word 4
 m: .word 2
 resul: .word 0
 
.code
 daddi $sp,$0, 0x400
 ld $a0, n($0) #Cargo el valor 4 en $a0
 ld $a1, m($0) #Cargo el valor 2 en $a1
 jal comb #llamo a subrutina comb
 
 sd $v0, resul($0) #Seteo resultado final
 halt
 
 
factorial: daddi $v0, $0, 1
     loop: dmul $v0, $v0, $a0
		   daddi $a0, $a0, -1 #Decremento $t0
		   bnez $a0, loop
		   jr $ra
		   
comb: dsub $t0, $a0, $a1 #n-m
	  daddi $sp, $sp, -8
	  sd $ra, 0($sp) #$ra prog principal
	  
	  jal factorial
	  daddi $s0, $v0, 0 #Guardo n!
	  daddi $a0, $a1, 0 #a0 ahora es m
	  jal factorial
	  daddi $s1, $v0, 0 #Guardo m!
	  daddi $a0, $t0, 0 #a0 ahora es (n-m)
	  jal factorial
	  dmul $v0, $s0, $v0 # (n! * (n-m)!)
	  ddiv $v0, $s1, $v0 # m! / (n! * (n-m)!)
	  
	  ld $ra, 0($sp)
	  daddi $sp, $sp, 8
	  jr $ra #Retorno al prog pricipal