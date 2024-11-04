.data
 V: .word 5, 2, 6, -1, -2, 10, 4, -3, -4, -5
 MAX: .word 0; Cantidad de positivos
 
;Calcular Maximo y guardarlo en una variable llamada MAX.
.code
 daddi $t2, $zero, V; Cargo offset vector en t2
 daddi $t3, $zero, 10; Cant elementos vector
 daddi $t5, $zero, -1; Max inicial
 daddi $v0, $0, 0; Almacenar MAX
 
evaluoPos: ld $t1, 0($t2); Almaceno primer valor del vector
	  slt $t4, $t5, $t1; Si el max es menor que el elemento nuevo, $t4 es 1
	  beqz $t4, noMax; Si es cero, quiere decir que no es mayor que max inicial ($t4 = 0) y salta al sig elemento
      dadd $t5, $zero, $t1; Si es distinto de cero, quiere decir que ahora el max es el elemento en $t1
  
	  noMax: daddi $t2, $t2, 8; Paso al sig elemento
	  daddi $t3, $t3, -1; Decremento contador
	  bnez $t3, evaluoPos; Si no es cero, salta a loop
	  dadd $v0, $zero, $t5; Almaceno en $V0 el max que tengo temporalmente en $t5
 sd $v0, MAX($0); Escribo cant positivos en memoria de datos.
 halt