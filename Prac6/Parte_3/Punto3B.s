#El BTB puede aumentar el desempeño significativamente en la mayoría de los lazos. No obstante, en algunos
#puede tener un comportamiento patológico y de hecho reducir la eficiencia del programa. El siguiente
#programa calcula el máximo de un vector

#b) Ejecutar el programa en el simulador con y sin BTB. ¿Qué programa es más eficiente?
# Con BTB ---> CPI: 1.683 | Atascos BTS: 4 | Atascos RAW: 18 | Atascos BMS: 2
# Sin BTB ---> CPI: 1.805 | Atascos BTS: 11 | Atascos RAW: 18 | Atascos BMS: 0

#A partir de +4 iteraciones en un loop suele ser más eficiente el uso con BTB debido a que ayuda a reducir los ciclos

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