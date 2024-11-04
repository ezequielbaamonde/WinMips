.data
	coorX: .byte 0 # coordenada X de un punto
	coorY: .byte 0 # coordenada Y de un punto
	color: .byte 255, 0, 255, 0 # color: máximo rojo + máximo azul =>
	CONTROL: .word 0x10000
	DATA: .word 0x10008

.code
	ld $t0, CONTROL($zero) # $t0 = dirección de CONTROL
	ld $t1, DATA($zero) # $t1 = dirección de DATA
	
	#Coordenada X
	daddi $t2, $0, 8 # leo el num
	sd $t2, 0($t0)
	ld $t2, 0($t1) # copio el valor leído en $t2 
	sd $t2, coorX($0) #envío el valor leído a la variable coorX
	
	#Coordenada Y
	daddi $t2, $0, 8 # leo el num
	sd $t2, 0($t0)
	ld $t2, 0($t1) # copio el valor leído en $t2 
	sd $t2, coorY($0)#envío el valor leído a la variable coorY
	
	#Envío color
	lwu $t2, color($zero) # LWU -> Copia en $t 4 bytes | $t2 = valor de color a pintar (4 bytes)
	sw $t2, 0($t1) # SW -> Carga en DATA 4 bytes | color a pintar
	
	#Envío coordenada X
	lbu $t2, coorX($zero) # LBU -> Copia en $t 1 byte | $t2 = valor de coordenada X
	sb $t2, 5($t1) # SB -> Escribe 1 byte en DATA+5 | valor de coordenada X
	
	#Envío coordenada Y
	lbu $t2, coorY($zero) # LBU -> Copia en $t 1 byte | $t2 = valor de coordenada Y
	sb $t2, 4($t1) # SB -> Escribe 1 byte en DATA+4 | valor de coordenada Y
	
	#Impresión en pantalla
	daddi $t2, $zero, 5 # $t2 = 5  función 5 salida gráfca
	sd $t2, 0($t0) # CONTROL recibe 5 y produce el dibujo del punto
halt 