.data
 cadena: .ascii "" # cadena a generar
 
.code
 daddi $v0, $zero, 97 #Primer letra "a" ultima letra "104 - h"
 daddi $t3, $zero, cadena #Puntero del vector
 daddi $t4, $zero, 1; #Acumula mi cant iteración
 daddi $t5, $zero, 0; #Iteración por letra
 
 iterar: dadd $t5, $zero, $t4; # $t5 = 0 + $t4
 
	 contador: sb $v0, cadena($t3) #Envío primer letra a "cadena" en el primer byte
			   daddi $t3, $t3, 1 # Me muevo 1 byte
			   daddi $t5, $t5, -1 #Decremento iteración
			   bnez $t5, contador #Si la iteración de la letra no es cero, loopeo nuevamente
			   daddi $t4, $t4, 1 #Si la anterior condición es cero, Incremento iteración
			   daddi $v0, $v0, 1 #Paso a la siguiente letra
			   slti $t6, $v0, 105 #Compara si $v0 es menor que la letra h
			   bnez $t6, iterar #Mientras no sea cero, salta (mientras sea menor que 123)
			   #fin loop contador
	#fin loop iterar
 daddi $v0, $zero, 0 #Finalizo string con 0   
 sb $v0, cadena($t3) #Envío el cero a la cadena.
 halt

#Generar string: Escribir un programa que genere un string de la siguiente forma: “abbcccddddeeeee….”, así hasta la
#letra “h”. Para ello debe utilizar un loop e ir guardando los códigos ascii en la memoria. El string debe finalizar
#con el valor ascii 0 para que esté bien formado (debe agregar un elemento más, que valga 0, al final del string).