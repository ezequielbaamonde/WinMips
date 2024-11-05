#Los siguientes programas tienen errores en el uso de la convención de registros. Indicar qué registros cuál es
#el error y cómo se podría arreglar el problema en cada caso.

.code
 daddi $a0, $0, tabla #deberia ser
 jal subrutina
 daddi $t0, $0, 10
 daddi $t1, $0, 0
loop: bnez $t0, fin #DEBERIA SER beqz no bnez (si es igual a cero, salta)
	  ld $t2, 0($a0) #deberia ser "tabla($t)" o "0($puntero)" donde puntero puede ser un desplazamiento o un reg temporal de pos
	  dadd $t1, $t1, $t2
	  daddi $t0, $t0, -1
	  dadd $a0, $a0, 8 #deberia ser un registro temporal no un argumento
      j loop
fin: halt