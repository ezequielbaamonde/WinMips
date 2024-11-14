#Loop con forwarding Ejecutar el programa con Forwarding habilitado y responder:
# - ¿Cuántos CPI tiene la ejecución de este programa? Tomar nota del número de ciclos, cantidad de
#   instrucciones y CPI. Comparar con el caso anterior.

# - Cambiar el valor de B a 1000 y ejecutar. ¿Cómo cambió la cantidad de CPIs?

#Respuestas:
# - Tiene 1.692 CPI, 22 ciclos y 13 instrucciones.
# - Si, cambia de manera poco significativa. Es de 1.667 CPI.
#

.data
 A: .word 1
 B: .word 1000 #Anteriormente 3
 C: .word 0
 
.code
 ld $t1, A($0)
 ld $t2, B($0)
 loop: dsll $t1, $t1, 1
 daddi $t2, $t2, -1
 bnez $t2, loop
 sd $t1, C($0)
 halt