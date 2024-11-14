#Modificar los programas para que se reduzca la cantidad de atascos RAW, reordenando las instrucciones
#de forma que el resultado final del programa sea el mismo. Comparar la cantidad de atascos y CPI de cada
#uno con el caso anterior.

#No tiene atascos.

.data
 A: .word 0

.code
 daddi $t1, $0, 5
 daddi $t2, $0, 7
 slt $t3, $t1, $t2
 daddi $t1, $0, 1
 and $t4, $t3, $t1
 daddi $t1, $0, 8
 sd $t4, A($t1)
 halt