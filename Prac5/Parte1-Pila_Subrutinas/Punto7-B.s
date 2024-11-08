#b) contiene: Recibe en $a0 la dirección de un string y en $a1 un carácter (código ascii) y devuelve en $v0 1 si
#el string contiene el carácter $a1 y 0 de lo contrario.

.data
 str: .asciiz "Lucia"
 char: .ascii "u"
 
.code
 daddi $a0, $0, str
 daddi $a1, $0, char
 jal contiene
 #Ver contenido de $v0, deberias ser 1
 halt
 
 contiene: daddi $v0, $0, 0 #---> Inicialmente en 0
		   lbu $t1, 0($a1) #---Cargo char a evaluar
	 loop: lbu $t0, 0($a0) #---Cargo letra del str en pos ($a0)
		   beqz $t0, fin
		   bne $t0, $t1, hay
		   daddi $a0, $a0, 1
		   j loop
		   
	  hay: daddi $v0, $0, 1
	  fin: jr $ra