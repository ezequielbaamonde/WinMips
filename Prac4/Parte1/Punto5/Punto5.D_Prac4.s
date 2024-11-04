;Escribir un programa en WINMIPS que:
;	d) Calcula el logaritmo (entero) en base 2 de N (N positivo)
;	   mediante divisiones sucesivas y lo guarda en L

.data
 N: .word 20
 L: .word 0
 
.code
 ld r1, N(r0); MOV R1, N=20
 ld r2, L(r0); MOV R2, L=0
 
 dadd r3, r0, r0; Lo utilizo como flag de cmp
 daddi r4, r4, 2; Lo utilizo como divisor de N
 
mientras: slt r3, r0, r1; Si 0<N entonces r3=1, sino r3=0
		  beqz r3, fin; Si R3=0 sale del mientras. Significa que N es menor a cero
		  
		  ddiv r1, r1, r4; N = N/2
		  daddi r2, r2, 1; Incremento L = L+1
		  bnez r1, mientras; Mientras N no sea igual a 0, loopea
	 
 fin: halt; Fin programa