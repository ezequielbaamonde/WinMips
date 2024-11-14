# 4 atascos raw porque en cada iteracion, menos la ultima, del loop se atasca en la comparación
#Se puede reducir colocando el "iterador" al principio del loop y no antes de su evaluación, dandole una instrucción de tiempo.
.data
 res: .word 0
 
.code
 daddi $t1, $0, 4
 daddi $t2, $0, 3
 daddi $t3, $0, 0
 
 loop: daddi $t1, $t1, -1 
       dadd $t3, $t3, $t2
	   bnez $t1, loop #Atasco raw en la comparacion por el daddi anterior
	   sd $t3, res($0)
 halt