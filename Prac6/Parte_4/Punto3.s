#Los siguientes programas presentan ejemplos naturales de atascos estructurales y WAR. Analizar e
#identificar dónde pueden ocurrir estos atascos. Ejecutar en el simulador y comprobar el resultado.

#Resto: Calcula en $t4 el resto de $t1 div $t2
.code
 daddi $t1,$0,30 # a = 30
 daddi $t2,$0,4 # b = 4
 #Dependencia de datos entre DMUL y DDIV
 ddiv $t3,$t1,$t2 # c = a div b = 7
 #Dependencia de datos entre DSUB y DMUL (Posible WAR)
 dmul $t3, $t3, $t3 # c*b = 7*4 = 28
 dsub $t4, $t1,$t3 # resto = a-c*b = 2
halt

#factorial: Calcula en $t2 el factorial de $t1
.code
 daddi $t1,$0,5 # n=5
 daddi $t2,$0,1 # f=1
 #Dependencia de datos entre daddi y dmul (Posible WAR?)
 loop: dmul $t2,$t2,$t1 # f=f*n
	daddi $t1,$t1,-1 # n=n-1
	bnez $t1, loop
halt