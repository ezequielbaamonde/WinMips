#a) Correr el programa del ejercicio 3 de esta parte pero ahora con DS habilitado y anotar el CPI. Notar el
#   resultado almacenado en la variable MAX ¿Por qué es incorrecto?

#   ---> El resultado almacenado en max es 1. El CPI es de 1.788
#   Es incorrecto el valor almacenado porque a cada vez que salta modifica el valor de $t1, en este caso nunca so-
#	breescribe el max.

.data
 A: .word 2,1,3,1,4,1
 MAX: .word -1
.code
 ld $t1, MAX($0)
 daddi $t2,$0,0
 daddi $t3,$0,6
 loop: ld $t4, A($t2)
	   slt $t5,$t1,$t4
	   beqz $t5, chico 
	   daddi $t1,$t4,0
 chico: daddi $t2, $t2,8
	    daddi $t3, $t3, -1
	    bnez $t3, loop 
 sd $t1, MAX($0)
 halt