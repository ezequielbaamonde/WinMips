#Los siguientes programas tienen errores en el uso de la convención de registros. Indicar qué registros cuál es
#el error y cómo se podría arreglar el problema en cada caso.

.code
 daddi $t0, $0, 10 # dimension (ya comentado)
 daddi $t1, $0, 0 # contador de pares (ya comentado)
 daddi $t2, $0, 0 # desplazamiento vector(ya comentado)
loop: bnez $t0, fin #Mientras no sea 0, salta. Está mal, debe ser beqz.
	  ld $a0, tabla ($t2)
	  jal espar
	  bnez $v0, seguir
	  daddi $t1, $t1, 1
	  seguir:daddi $t2, $t2, 1 %debe ser t1 u otro reg, no tiene sentido desplazarse nuevamente más adelante
	  daddi $t0, $t0, -1
	  dadd $t2, $t2, 8 #debe ser daddi
	  j loop
	  
sd $t2, resultado($0) #Debe ser T1 ya que contiene el contador.
fin: halt
3. Uso