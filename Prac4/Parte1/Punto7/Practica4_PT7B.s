.data
 V: .word 0;
 
;Generar un vector con los primeros 10 números impares.
.code
 daddi $t2, $zero, V; Cargo offset vector en t2
 daddi $t3, $zero, 10; Cant elementos vector
 daddi $t1, $0, 1; Inicializo t1 en 1 para ir generando los numeros
 
modif: dadd $v0, $zero, $t1
	   sd $v0, V($t2); Escribo en V el nuevo elemento en la direccion que tenga $t2 (00h, 08h, 10h...)
	   daddi $t1, $t1, 2; Genero siguiente numero impar
	   daddi $t2, $t2, 8; Paso a la sig direccion
	   daddi $t3, $t3, -1; Decremento contador
	   bnez $t3, modif; Si no es cero, salta a loop
 halt