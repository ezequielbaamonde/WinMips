.code
 dmul $t1, $0, $0
 nop
 nop
 nop
 nop
 dadd $t2,$0,$0
halt

#a) Ejecutar el código anterior y verificar que ocurre un atasco STR. ¿Entre qué instrucciones sucede el
#	atasco? ¿cuál es la instrucción que se atasca? ¿Por qué esa y no la otra?
#	---> El atasco STR sucede entre las instrucciones dmul y dadd. La instrucción que se atasca es la "dadd..."
#		 Se atasca está instrucción debido a que la instrucción DMUL también quiere ingresar a la etapa MEM. Esta
#		 ultima pasa a esta etapa PRIMERO ya que se ejecuto antes que la instrucción DADD.
	
#b) Probar agregando un NOP ¿sigue el atasco? ¿y si se quita un NOP? ¿por qué?
#	---> Si, sigue el atasco pero en la instrucción NOP, ya que ahora esta es la que quiere ingresar a la etapa MEM
#		 a la vez que la instrucción DMUL.
#	---> Si se quita un NOP ahora la instrucción HALT posee un atasco estructural ya que es la que quiere ingresar a
#		 la etapa MEM a la vez que la instrucción DMUL.