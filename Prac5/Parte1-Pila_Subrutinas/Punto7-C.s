#es_vocal: Determina si un carácter es vocal o no, ya sea mayúscula o minúscula. La rutina debe recibir el
#carácter y debe retornar el valor 1 si es una vocal ó 0 en caso contrario. Para implementar es_vocal, utilizar
#la subrutina contiene, de modo que para preguntar si un carácter es una vocal, se pregunte si un string con
#todas las vocales posibles contiene a este carácter.


#EL STR CARGADO EN .DATA ANTES QUE EL CHAR. Sino se corre la dir correcta

.data
 vocales: .asciiz "AEIOUaeiou" #vocales
 char: .ascii "A" #Valor a buscar
 
.code
 daddi $sp, $sp, 0x400
 daddi $a0, $0, vocales #Cargo direccion del str de vocales
 daddi $a1, $0, char #Cargo char a evaluar
 jal es_vocal
 #Ver contenido de $v0, deberias ser 1
 halt
 
 contiene: daddi $v0, $0, 0 #---> Inicialmente en 0
		   lbu $t1, 0($a1) #---Cargo char a evaluar
	 loop: lbu $t0, 0($a0) #---Cargo letra del str en pos $a0
		   beqz $t0, fin # ---> Evaluo si la letra es igual a 0, si es así termina el prorgama
		   beq $t0, $t1, hay # --> Evaluo si las letras son iguales 
		   daddi $a0, $a0, 1
		   j loop
	  hay: daddi $v0, $0, 1
	  fin: jr $ra
	  
# $V0 = 1 si es vocal o 0 DLC	  
es_vocal: daddi $sp, $0, 8
		  sd $ra, 0($sp) #salvo $ra prog principal
		  jal contiene
		  
		  ld $ra, 0($sp)
		  daddi $sp, $0, -8 #Desapilo $ra
		  jr $ra