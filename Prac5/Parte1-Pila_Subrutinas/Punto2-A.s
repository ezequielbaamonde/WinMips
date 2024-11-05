#Los siguientes programas tienen errores en el uso de la convención de registros. Indicar qué registros cuál es
#el error y cómo se podría arreglar el problema en cada caso.


.code
daddi $t0, $0, 5 #debe ser $a0
daddi $t1, $0, 7 #debe ser $a1
jal subrutina
sd $t2, variable ($0) #debe ser $v0 o $v1
halt

subrutina:  daddi $t4, $0, 2 #Debe ser $v0 o $v1
			dmul $t0, $t0, $t4 #debe soobrescribir el valor retorno no el argumento
			dmul $t1,$t1,$t4 #mismo aca
			dadd $t2,$t1,$t0 #suma debe ser $a1 y $a0
			jr $ra