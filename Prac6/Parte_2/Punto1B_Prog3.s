# 4 atascos raw porque en cada iteracion, menos la ultima, del loop se atasca en la comparación
.data
 res: .word 0
 
.code
 daddi $t1, $0, 4
 daddi $t2, $0, 3
 daddi $t3, $0, 0
 
 loop: dadd $t3, $t3, $t2
	   daddi $t1, $t1, -1 
	   bnez $t1, loop #Atasco raw en la comparacion por el daddi anterior
	   sd $t3, res($0)
 halt