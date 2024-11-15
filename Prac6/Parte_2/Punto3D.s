#d) Cantidad de instrucciones de un lazo:
#- Viendo el código del programa de forma estática (es decir, sin ejecutarlo), la cantidad de
#  instrucciones que tiene sería 7. No obstante, las estadísticas del simulador indican que hay 13
#  instrucciones ¿de dónde sale esta diferencia? ¿Cómo calcularías la cantidad de instrucciones de un
#  programa con un lazo?


# ---> La cantidad de instrucciones son 13 porque son las que se ejecutaron, no las que tiene el programa.
# En programas más simples la cant instrucciones coinciden con la cant instrucciones que se ejecutan


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