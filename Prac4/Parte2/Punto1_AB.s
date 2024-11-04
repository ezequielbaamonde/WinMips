.data
 texto: .asciiz "Hola, Mundo!\n" #El mensaje a mostrar
 CONTROL: .word 0x10000
 DATA: .word 0x10008
 
.code
 ld $t0, CONTROL($zero) #; $t0 = dirección de CONTROL
 ld $t1, DATA($zero) # $t1 = dirección de DATA
 daddi $t3, $zero, 10 #Contador del loop
 
 #b) Modifique el programa (a) para que el mensaje se muestre 10 veces.
loop: daddi $t2, $zero, texto # $t2 = dirección del mensaje a mostrar
	  sd $t2, 0($t1) # DATA recibe el puntero al comienzo del mensaje
      daddi $t2, $zero, 4 # $t2 = 4 -> función 4: salida de una cadena ASCII
	  sd $t2, 0($t0) # CONTROL recibe 4 y produce la salida del mensaje
	  daddi $t3, $t3, -1 #Decremento contador
	  bnez $t3, loop
 halt
 
#a) ¿Qué valor tienen los registros $t0 y $t1? 
#		Tienen el valor 0x10000 y 0x10008

