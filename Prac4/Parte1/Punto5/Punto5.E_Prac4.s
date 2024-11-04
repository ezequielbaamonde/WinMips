;Escribir un programa en WINMIPS que:
;	e) Guarda en B el valor 1 si A es impar y 0 de lo contrario

.data
 A: .word 2
 B: .word 0
 
.code
 ld r1, N(r0); MOV R1, N=2
 ld r2, L(r0); MOV R2, L=0
 
 dadd r3, r0, r0; Lo utilizo como flag de cmp
 daddi r4, r0, 2; Lo utilizo como divisor de A
 
mientras: ddiv r1, r1, r4; A = A/2

		  beqz r1, par; Si R3=0 entonces A es par
	 
 fin: halt; Fin programa