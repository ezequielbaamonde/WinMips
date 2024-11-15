#2) Reducción de BTS con Branch Target Buffer ⭐
#	Habilitar la opción Branch Target Buffer (BTB) y volver a ejecutar el programa anterior con B=3.
#	 1. ¿Cómo cambió la cantidad de BTS? ¿y el CPI?
#		---> La cantidad de BTS sigue siendo la misma. El CPI aumento (1.615)

#	 2. Notar que ahora aparece un nuevo tipo de atasco, llamado Branch Misprediction Stall (BMS). ¿Por
#	    qué sucede? ¿Cuántos ocurren?
#		---> Ocurren 2. Sucede cuando la predicción de salto no es correcta.

#	 3. Cambiar el valor de B a 1000, habilitar BTB y ejecutar. ¿Cómo cambió la cantidad de BTS y BMS? ¿y
#	    el CPI?
#		---> La cantidad de BTS y BMS es la misma. El CPI mejora significativamente a "1.003" (Más instrucciones eje-
#			 cutadas para la misma cant atascos)

#	 4. Completar la siguiente frase: Al ejecutar un loop simple con N iteraciones, si se habilita BTB, se
#	    producen --"2"-- atascos de tipo BTS y --"2"-- atascos de tipo BMS.

#	 5. En base a los resultados anteriores ¿es mejor utilizar BTB cuando se realizan pocas o cuando se
#	    realizan muchas iteraciones?
#		---> Es mejor usar BTB para más iteraciones o en casos de muchos ciclos

.data
 A: .word 1
 B: .word 3 #Varia con 1000 en algun inciso.
 C: .word 0
 
.code
 ld $t2, B($0)
 ld $t1, A($0)
 loop: daddi $t2, $t2, -1
 dsll $t1, $t1, 1
 bnez $t2, loop
 sd $t1, C($0)
 halt