#codigo 1
.code
 ddiv $t1, $t2, $t3
 dadd $t1, $t2, $t3
halt

#codigo 2
.code
 dmul $t1, $0, $0
 dmul $t3, $t1, $t2
 dadd $t2, $0, $0
halt

#Los siguientes programas presentan ejemplos minimalistas de tipo de atascos. Responder:
#	1. Estudiar el código sin simularlo y responder ¿cuál es el programa que tiene WAR y cual WAW?
#	   Simular los programas para comprobar.
#	---> El programa que tiene WAW es el 1. El que tiene WAR es el 2.
	
	
#	2. En el caso del WAR, ¿cuál es la instrucción lenta y cuál la rápida? ¿Qué registro se quiere leer y
#	   escribir?
#	---> La instrucción lenta es el dmul y la rapida el ddad. El registro que se quiere leer y escribir es $t2

#	3. Idem para el caso WAW.
#	---> La instrucción lenta es el DDIV y la rapida el DADD. El registro que quiere escribirse luego de escribirse
#		 es el $t1