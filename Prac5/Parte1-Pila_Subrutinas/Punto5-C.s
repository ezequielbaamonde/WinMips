#v0: volumen de un cubo
#a0: long del lado lado del cubo

vol: daddi $sp, $sp, -16 #--> -8
	 sd $ra, 0($sp)
	 sd $s0, 8($sp) #---> No tiene sentido preservar $s0.
	 dadd $s0, $0, $a0 #---> No debo usar registros de tipo $S si no llamo a otra subrutina dentro de esta
	 dmul $s0,$a0,$a0 #---> Además estoy modificando $s0 constantemente, seria un $T
	 dmul $s0,$s0,$a0
	 daddi $v0,$s0,0
	 ld $ra, 0($sp)
	 ld $s0, 8($sp) #---> No deberia desapilar esto ya que ni siquiera deberia ser apilado
	 daddi $sp, $sp, 16 #---> 8
	 jr $ra
	 
#v0: diferencia de volumen de los cubos
#a0: long del lado del cubo más grande
#a1: long del lado del cubo más chico

diffvol: jal vol #---> preservar registro $ra antes del llamado 
		 daddi $t0,$v0,0 #---> $S0
		 daddi $a0,$a1,0 #---> 
		 jal vol
		 dsub $v0,$t0,$v0 #---> $S0
		 jr $ra