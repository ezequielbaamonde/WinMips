.data
 V: .word 5, 2, 6, -1, -2, 10, 4, -3, -4, -5
 POS: .word 0; Cantidad de positivos
 
.code
 daddi $t2, $zero, V; Cargo offset vector en t2
 daddi $t3, $zero, 10; Cant elementos vector
 daddi $v0, $0, 0; Almacenar positivos
 
loop: ld $t1, 0($t2); Almaceno primer valor del vector
      dadd $v0, $v0, $t1; Cargo valor en resultado
	  daddi $t2, $t2, 8; Paso al sig elemento
	  daddi $t3, $t3, -1; Decremento contador
	  bnez $t3, loop; Si no es cero, salta a loop
	  
 sd $v0, R($0); Escribo resultado en memoria de datos.
 halt