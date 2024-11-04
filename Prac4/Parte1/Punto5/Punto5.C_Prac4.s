;Escribir un programa en WINMIPS que:
;	c) Calcula el factorial de N, y lo guarda en F

.data
 N: .word 5
 F: .word 1
.code
 ld r1, N(r0); MOV R1, N=5
 ld r2, F(r0); MOV R2, F=1
 
loop: dmul r2, r2, r1; Multiplico F * N
      daddi r1, r1, -1; Decremento N = r1-1
	  bnez r1, loop
	  
 halt; Fin programa