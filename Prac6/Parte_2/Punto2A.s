#a) Ejecutarlo en el simulador con la opción Configure/Enable Forwarding DESHABILITADA.
#¿Cuántos atascos RAW hay? ---> 2
#¿Cuál es el CPI? ---> 2.2

.data
 A: .word 1
 B: .word 2
 
.code
 ld $t1, A($0)
 ld $t2, B($0)
 sd $t2, A($0)
 sd $t1, B($0)
 halt