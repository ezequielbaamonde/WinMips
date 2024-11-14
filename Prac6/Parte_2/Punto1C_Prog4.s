# 4 atascos raw porque en cada iteracion, menos la ultima, del loop se atasca en la comparación
#Se pueden reducir reordenando el puntero luego de cargar $t3 y no dejandolo antes del bnez.
.data
 A: .word 1, 2, 0
 RES: .word 0
 
.code
 daddi $t1, $0, 0
 daddi $t2, $0, 0

 loop: ld $t3, A($t1)
	   daddi $t1, $t1, 8
	   dadd $t2, $t2, $t3
	   bnez $t3, loop #Atasco raw en la comparacion por el daddi anterior
	   sd $t2, RES($0)
 halt