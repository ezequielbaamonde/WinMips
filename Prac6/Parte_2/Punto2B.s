#b) Ejecutarlo en el simulador con la opción Configure/Enable Forwarding HABILITADA.
#¿Por qué no se presenta ningún atasco en este caso? Explicar la mejora. ---> Se debe a que al tener activado el forwarding,
# la instrucción LD no necesita esperar al WB para tener el resultado final, sino que ya en EX lo tiene. Por lo que el SD,
# al llegar a su etapa ID ya va a tener en el mismo ciclo el resultado de SD (estando en etapa ex)

#¿Cuál es el CPI? ---> 1.8, mejor que sin Forwarding

#¿Qué indica el color de los registros en la ventana Register durante la ejecución? La etapa en la que esta siendo usada ese registro


.data
 A: .word 1
 B: .word 2
 
.code
 ld $t1, A($0)
 ld $t2, B($0)
 sd $t2, A($0)
 sd $t1, B($0)
 halt