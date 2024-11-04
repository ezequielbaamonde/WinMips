.data
 V: .word 5, 2, 6;
 
;Modificar los elementos del vector, de modo que cada elemento se multiplique por 2.
.code
 daddi $t2, $zero, V; Cargo offset vector en t2
 daddi $t3, $zero, 3; Cant elementos vector
 daddi $t5, $0, 2; Producto
 
modif: ld $t1, V($t2); Almaceno primer valor del vector en un temporal
       dmul $t4, $t1, $t5; ElementoV*2
	   dadd $v0, $zero, $t4
	   sd $v0, V($t2); Escribo en V el nuevo elemento en la dirección que tenga $t2 (00h, 08h, 10h...)
	   daddi $t2, $t2, 8; Paso al sig elemento
	   daddi $t3, $t3, -1; Decremento contador
	   bnez $t3, modif; Si no es cero, salta a loop
 halt