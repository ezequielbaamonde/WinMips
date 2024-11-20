#b) Reordenar las instrucciones del programa para que funcione correctamente, y además la instrucción
#	sd $t1, MAX($0) solo se ejecute una vez, sin agregar instrucciones a ejecutar. Anotar el CPI, y
#	comparar con el caso anterior ¿qué mejora se obtuvo?

#   ---> El CPI: 2.091. A comparación del caso anterior ahora el programa funciona correctamente, se redujeron la
#	cant de instrucciones y 1 ciclo menos.

.data
 A: .word 2,1,3,1,4,1
 MAX: .word -1
.code
 ld $t1, MAX($0)
 daddi $t2,$0,0
 daddi $t3,$0,6
 loop: ld $t4, A($t2)
	   slt $t5,$t1,$t4
	   beqz $t5, chico 
	   daddi $t3, $t3, -1
	   daddi $t1,$t4,0
 chico: bnez $t3, loop 
		daddi $t2, $t2,8
 sd $t1, MAX($0)
 halt