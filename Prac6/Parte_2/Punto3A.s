#Loop sin forwarding; Ejecutar el programa deshabilitando el Forwarding y responder:
# - ¿Qué instrucciones generan los atascos tipo RAW y por qué? ¿En qué etapa del cauce se produce el
#   atasco en cada caso y durante cuántos ciclos? --> Las instrucciones que generan los atascos tipo RAW son la "dssl" y la
#   de comparación "bnez".
#    El atasco por "dssl" se produce durante la etapa "ID" durante 1 ciclo, donde necesita esperar a que la instrucción "LD" llegue a su
#	etapa "WB".
#     El atasco por "bnez" se produce durante la etapa "ID" durante 2 ciclos. Esto es porque debe esperar a que la instrucción "daddi", que
#	calcula $t2, llegue a su etapa "WB"

# - ¿Cuántos CPI tiene la ejecución del programa en este caso? ---> 2.0

# - Cambiar el valor de B a 1000 y ejecutar. ¿Cómo cambió la cantidad de CPIs? ---> No, no cambió

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