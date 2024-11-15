#1) Atascos por salto (BTS) ⭐
#   Ejecutar el programa del ejercicio 3 de la Segunda Parte, reordenado y con Forwarding, de modo que no haya
#   atascos RAW. El programa sigue teniendo algunos atascos, llamados Branch Taken Stall (BTS), también
#   conocidos como atascos por salto.

#	---> CPI: 1.462 y 2 BTS

#   	1. Cambiar el valor de B a 1000 y ejecutar. ¿Cómo cambió la cantidad de BTS? ¿y el CPI?
#		   ---> La cantidad de BTS aumento demasiado. En cambio, el CPI bajó (1.334).

#   	2. Completar la siguiente frase: Al ejecutar un loop simple con N iteraciones, se producen: "N-1"
#   	   atascos BTS.
#
#
#   	3. ¿Por qué se producen los BTS? ¿Qué sucede con la instrucción siguiente al salto?
#		   ---> Los BTS se producen debido a qué, al momento de evaluar si se salta o no, el programa de igual
#		   manera debe cargar la  siguiente instrucción. Luego cuando se reconoce que debe "saltar" la "tira/cancela"
#		   y vuelve a cargar la primer instrucción del LOOP

#   	4. ¿Pueden evitarse los BTS reordenando instrucciones?
#		   No, no se pueden evitar con REORDENANDO INSTRUCCIONES. En todo caso con un BTB.

#   	5. Al ocurrir un BTS, una instrucción se empieza a ejecutar y luego se descarta, pero ¿debe contarse
#   	   como una instrucción para el cálculo del CPI?
#		   ---> No, no deberia contarse para las estadísticas debido a que no se ejecuta


.data
 A: .word 1
 B: .word 3
 C: .word 0
 
.code
 ld $t2, B($0)
 ld $t1, A($0)
 loop: daddi $t2, $t2, -1
 dsll $t1, $t1, 1
 bnez $t2, loop
 sd $t1, C($0)
 halt