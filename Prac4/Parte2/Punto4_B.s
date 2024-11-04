#b) Cambio de color ⭐Modifique el programa original para que el punto vaya cambiando de color, desde negro
#(255,0,0) hasta rojo puro (255,0,0).

.data
	coorX: .byte 1 # coordenada X de un punto
	coorY: .byte 1 # coordenada Y de un punto
	color: .byte 0, 0, 0, 0 # color inicial "negro"
	CONTROL: .word 0x10000
	DATA: .word 0x10008

.code
	ld $s0, CONTROL($zero) # $t0 = dirección de CONTROL
	ld $s1, DATA($zero) # $t1 = dirección de DATA
	
	
	#Envío coordenada X
	lbu $s2, coorX($zero) # LBU -> Copia en $t 1 byte | $t2 = valor de coordenada X
	sb $s2, 5($t1) # SB -> Escribe 1 byte en DATA+5 | valor de coordenada X
	
	#Envío coordenada Y
	lbu $s3, coorY($zero) # LBU -> Copia en $t 1 byte | $t2 = valor de coordenada Y
	sb $s3, 4($t1) # SB -> Escribe 1 byte en DATA+4 | valor de coordenada Y
	
	#COLOR
	lbu $s4, color+0($0) #red byte 0
	lbu $s5, color+1($0) #green byte 1
	lbu $s6, color+2($0) #blue byte 2
	lbu $s7, color+3($0) #alpha byte 3
	#seteo solamente GB A
	sb $s5, 1($s1) #Envio a data+1
	sb $s6, 2($s1) #Envio a data+2
	sb $s7, 3($s1) #Envio a data+3
	#Impresión en pantalla y incremento de color red
	daddi $t0, $zero, 5 #5 función pintar pixel
loop: sb $s2, 0($s1)
	  sd $t0, 0($s0)
	  daddi $s2, $s2, 32
	  slti $s3, $s2, 256 #Si $s2<256 entonces $s3=1, sino será $s3=0
	  bnez $s3, loop #si $s3 != 0 entonces loopea
halt 