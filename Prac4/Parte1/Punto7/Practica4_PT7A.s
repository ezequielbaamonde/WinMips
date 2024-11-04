.data
 V: .word 5, 2, 6, -1, -2, 10, 4, -3, -4, -5
 POS: .word 0; Cantidad de positivos
 
;Contar positivos. Contar la cantidad de elementos positivos, y guardar la cantidad en una variable llamada POS.
.code
 daddi $t2, $zero, V; Cargo offset vector en t2
 daddi $t3, $zero, 10; Cant elementos vector
 daddi $v0, $0, 0; Almacenar positivos
 
evaluoPos: ld $t1, 0($t2); Almaceno primer valor del vector
	  slt $t4, $t1, $zero; Si el valor es menor que cero, $t4 es 1
	  bnez $t4, noPos; Si no es cero, quiere decir que es negativo ($t4 =1)
      daddi $v0, $v0, 1; Incremento $v0
  
	  noPos: daddi $t2, $t2, 8; Paso al sig elemento
	  daddi $t3, $t3, -1; Decremento contador
	  bnez $t3, evaluoPos; Si no es cero, salta a loop
	
 sd $v0, POS($0); Escribo cant positivos en memoria de datos.
 halt