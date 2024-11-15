#El BTB puede aumentar el desempeño significativamente en la mayoría de los lazos. No obstante, en algunos
#puede tener un comportamiento patológico y de hecho reducir la eficiencia del programa. El siguiente
#programa calcula el máximo de un vector

#a) Antes de ejecutar en el simulador, encontrar las instrucciones de salto, y pensar cómo se comportará
#el BTB en cada caso. Recordar que la predicción del BTB guarda un bit de historia distinto por cada
#instrucción de salto.


.data
 A: .word 2,1,3,1,4,1
 MAX: .word -1
.code
 ld $t1, MAX($0)
 daddi $t2,$0,0
 daddi $t3,$0,6
 loop: ld $t4, A($t2)
	   slt $t5,$t1,$t4
	   beqz $t5, chico # ---> El BTB en este momento predice que NO SALTA, si salta se atasca 2 BTS
	   daddi $t1,$t4,0
 chico: daddi $t2, $t2,8
	    daddi $t3, $t3, -1
	    bnez $t3, loop # ---> El BTB en este momento predice que NO SALTA, si salta se atasca 2 BTS
 sd $t1, MAX($0)
 halt