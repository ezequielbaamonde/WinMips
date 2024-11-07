
#v0: devuelve 1 si a0 es impar y 0 dlc
#a0: número entero cualquiera

esimpar: andi $v0, $a0, 1
		 jr $ra
		 
#v0: devuelve 1 si a0 es par y 0 dlc
#a0: número entero cualquiera
espar:  jal esimpar # en esta línea hay que salvar el registro $ra, haciendo un push anteriormente al llamado de la subrutina
		#pop del registro $ra
	    #truco: espar = 1 - esimpar
		daddi $s0, $0, 1
		dsub $v0, $s0, $v0
		$ra
		
		
		
#Salvado de $ra antes del JAL ESIMPAR
	#pusheo
#espar: daddi $sp, $0, 0x400
#		daddi $sp, $0, -8
#		sd $ra, 0($sp)
#		jal esimpar
#		daddi $sp, $0, 8
#		ld $ra, 0($sp)		