.data
 A: .word 5

.code
 daddi r1, r0, 4
 ld r2, A(r0); le cargo a R2 el valor de A en 0 (entero)
 dadd r1, r1, r2; almaceno en R1 el resultado de la suma R1+R2

 loop: daddi r1, r1, -1 ; r1 <--- r1-1
       bnez r1, loop; si no es == 0, salta a loop
 halt