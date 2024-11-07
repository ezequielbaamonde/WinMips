#v0: devuelve la cantidad de bits 0 Que tiene un número de 64 bits
#a0: número entero cualquiera

cant0: daddi $t0, $0, 0 #---> Deberia ser $s0 ya que no queremos perderlo
	   daddi $t1, $0, 64 #---> Deberia ser $s1 idem arriba
	   #--Falta pasar un argumento a la subrutina--
loop:  jal espar #---> Hay que salvar al registro $ra pusheando y popeando
	   dadd $t0,$t0,$v0 #---> No es $t0 sino $s0
	 
	   #desplazo a la derecha
	   #para quitar el último bit
	 
	   dsrl $a0, $a0, 1
	   daddi $t1, $t1, -1 #---> No es $t1 sino $s1
	   bnez $t1, loop #$s1
	   jr $ra