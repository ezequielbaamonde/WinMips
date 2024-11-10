# d) cant_vocales Usando la subrutina escrita en el ejercicio anterior, cant_vocales recibe una cadena
#    terminada en cero y devuelve la cantidad de vocales que tiene esa cadena.


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