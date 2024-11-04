.data
 V: .word 0;
 
;Generar un vector con los primeros 10 números de la secuencia de fibonacci
.code
 daddi $t2, $zero, V; Cargo offset vector en t2
 daddi $t3, $zero, 10; Cant elementos vector
 
 ;CERO
 daddi $t1, $0, 0; Inicializo t1 en 0 para ir generando los primeros 2 numeros
 dadd $v0, $zero, $t1
 sd $v0, V($t2); Escribo en V el nuevo elemento en la direccion que tenga $t2 (00h, 08h, 10h...)
 daddi $t2, $t2, 8; Paso a la sig direccion
 daddi $t3, $t3, -1; Decremento contador
 
 ;UNO
 daddi $t1, $0, 1;; Reescribo t1 en 1 para ir generando el segundo numero
 dadd $v0, $zero, $t1
 sd $v0, V($t2); ; Escribo en V el nuevo elemento en la direccion que tenga $t2
 daddi $t1, $0, 1; Reescribo t1 en 1 para ir generando el segundo numero
 daddi $t2, $t2, 8; Paso a la sig direccion; (10h)
 daddi $t3, $t3, -1; Decremento contador
 
 finobacci: 
			daddi $t4, $t2, -8; Primer numero anterior
			ld $v0, V($t4); Almaceno en $v0 el valor que hay en la dirección $t4
			
			daddi $t5, $t2, -16; Segundo numero anterior
			ld $v1, V($t5); Almaceno en $v1 el valor que hay en la dirección $t5
			
			dadd $t4, $0, $v0; Soobrescribo ahora en t4 la dirección por el valor numerico que tiene $v0
			dadd $t5, $0, $v1; Soobrescribo ahora en t5 la dirección por el valor numerico que tiene $v1
			
			dadd $t1, $t4, $t5; Genero siguiente numero con la suma de los 2 anteriores (primer vuelta 08h + 00h)
			dadd $v0, $zero, $t1; Paso valor temporal a variable local
			sd $v0, V($t2); Escribo en V el nuevo elemento en la direccion que tenga $t2
			
			daddi $t2, $t2, 8; Paso a la sig direccion
			daddi $t3, $t3, -1; Decremento contador
			bnez $t3, finobacci; Si no es cero, salta a loop
 halt