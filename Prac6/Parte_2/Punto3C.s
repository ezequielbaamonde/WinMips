#Reordenamiento de instrucciones para optimización de CPI:
# - Reordenar las instrucciones para que la cantidad de RAW sea 0 en la ejecución del programa,
#   ejecutando con Forwarding habilitado y B=3. ---> Cambio el contador al principio del loop y primero cargo el $t2
#   luego el $t1. Me queda sin atascos RAW y con CPI 1.462
	
#   Cambiar el valor de B a 1000 y ejecutar. ¿Cómo cambió la cantidad de CPIs? ---> CPI 1.334, tiende más cerca del 1

# - En base a lo anterior ¿qué partes del programa conviene optimizar generalmente? ---> Generalmente las iteraciones y
#   la lectura desde memoria.


.data
 A: .word 1
 B: .word 1000 #Anteriormente 3
 C: .word 0
 
.code
 ld $t2, B($0)
 ld $t1, A($0)
 loop: daddi $t2, $t2, -1
 dsll $t1, $t1, 1
 bnez $t2, loop
 sd $t1, C($0)
 halt