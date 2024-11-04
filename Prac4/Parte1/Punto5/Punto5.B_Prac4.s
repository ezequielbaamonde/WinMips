;Escribir un programa en WINMIPS que:
;	c) Calcula el factorial de N, y lo guarda en F

.data
 A: .word 0
 B: .word 5
 C: .word 0;  Si "A" == 0, C = 0. Si "A" > "B" entonces C = A*2. Sino C = B
.code
 ld r1, A(r0); MOV R1, A
 ld r2, B(r0); MOV R2, B
 
 ;C
 beqz r1, a_es_cero; Si A == 0, salta a la etiqueta. Si no es cero, comparo menores abajo
 dadd r3, r0, r0; Inicializo r3 en cero para almacenar resultado de comparación
 slt r3, r2, r1; Comparo ¿B<A? Si "B" es menor, r3= 1, sino 0. 
 bnez r3, a_es_mayor; Si es 1, A es mayor que "B" y "C" tendra que valer (A*2)
 sd r2, C(r0); Si "A" NO es mayor que B, C=B
 j fin; Salto incondicional a FIN
a_es_cero: sd r1, C(r0); C es igual a CERO (A) 
		   j fin; salto a FIN


a_es_mayor: dadd r4, r0, r0; Inicializo R4 en cero para calcular A*2 y luego dejarlo en C
			daddi r5, r0, 2; r5 lo dejo en 2 para multiplicarlo con r4
		    dmul r4, r1, r5; r4<---- A*2 (r1*r5)
			sd r4, C(r0); Almaceno el resultado de r4 en C
fin: halt; Fin programa