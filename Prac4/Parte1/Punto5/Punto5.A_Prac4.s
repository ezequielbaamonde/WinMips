;Escribir un programa en WINMIPS que:
;	a) Lee 2 números "A" y "B" de la memoria de datos, y calcula S, P y D, que luego se 
;	  guardan en la memoria de datos

.data
 A: .word 5
 B: .word 10
 S: .word 0; A+B
 P: .word 0; 2 + (A*B)
 D: .double 0; A^2 / B
.code
 ld r1, A(r0); MOV R1, A
 ld r2, B(r0); MOV R2, B
 
 ;S
 dadd r3, r1, r2; Sumo A+B y lo guardo en r3
 sd r3, S(r0); MOV S, R3 ---> resultado de la suma
 
 ;P
 dadd r4, r0, r0; Inicializo R4 en cero
 dmul r4, r1, r2; Multiplico (A*B) y lo guardo en r4
 daddi r4, r4, 2; Le sumo 2 al resultado del producto entre A y B
 sd r4, P(r0); MOV P, R4 ---> resultado de 2+(A*B)
 
 ;D
 dadd r5, r0, r0; Inicializo R5 en cero
 dmul r5, r1, r1; Multiplico 2 veces "A"
 ddiv r5, r5, r2; Divido R5 (A^2) por B (10) y almaceno el resul en R5 
 sd r5, D(r0); MOV D, R5 ---> resultado de A^2 / B
 
halt; Fin programa