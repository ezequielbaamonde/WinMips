# 4) Reducción de BTS con Delay Slot (DS)⭐⭐
#    El delay slot (DS) cambia el funcionamiento de los saltos. Cuando está activado, el salto se realiza con un
#    retardo de un ciclo. Esto significa que la instrucción siguiente al salto también se ejecuta. De esta forma, los
#    BTS desaparecen completamente, aunque esto no significa necesariamente que la ejecución sea más eficiente.
# a) Anotar en la tabla de abajo las estadísticas del programa del ejercicio 3 de la Segunda Parte al
#     ejecutarse sin forwarding, y con BTB y delay slot desactivados

# b) Ejecutar el programa del ejercicio 3 de la Segunda Parte, pero ahora con BTB activado y forwarding desactivado.

# c) Ejecutar el programa del ejercicio 3 de la Segunda Parte, pero ahora con delay slot activado, BTB
#    desactivado y forwarding activado. Anotar los CPI y la cantidad de instrucciones en la tabla de abajo.
#    ¿Qué sucede con la instrucción sd $t1, C($0)? ¿Cuántas veces se ejecuta? ¿Son necesarias todas las
#    ejecuciones?

	# ---> Se ejecuta 3 veces, las primeras 2 no son necesarias ya que viene despues del salto, pero como tiene Delay
	# las ejecuta de igual manera

# d) Modificar el programa del ejercicio 3 de la Segunda Parte agregando un NOP antes de la instrucción
#    sd $t1, C($0). Ejecutar el programa en el simulador y anotar los CPI. Los CPI serán menores que en el
#    caso anterior

# e) Modificar el programa del ejercicio 3 de la Segunda Parte, pero ahora reordenando las instrucciones
#    de modo de ejecutar una instrucción útil debajo del salto, sin aumentar el número total de
#    instrucciones a ejecutar.

.data
 A: .word 1
 B: .word 3
 C: .word 0
 
.code
 ld $t1, A($0)
 ld $t2, B($0)
 loop: dsll $t1, $t1, 1
 bnez $t2, loop
 daddi $t2, $t2, -1 #---> Reordenamiento
 sd $t1, C($0)
 halt