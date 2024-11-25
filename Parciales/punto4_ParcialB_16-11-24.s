#Escribir un programa que utilice 5 pares de números guardados en la variable datos, y dibujar
#en la pantalla gráfica puntos verdes con los pares de números X e Y de cada punto, descartando
#los puntos que se encuentren fuera del rango de la pantalla gráfica del simulador.

#La variable DATOS contiene todos los valores de los pares en la primera y segunda posición se guarda
#el primer par, en la posición 3 y 4 el segundo par y así sucesivamente.

#Para realizar este grafico escribir la subrutina GRAFICAR que recibe por REFERENCIA la dirección de 
#memoria que tiene los pares cargados y la cantidad de pares. Para cada PAR de numeros hay que veri-
#ficar que ambos numeros esten entre 0 y 49 (incluídos). En caso de estar en rango se debe pintar un
#el punto de color verde, en caso contrario no hacer nada. Dicha verificación debe la realiza una sub-
#rutina llamada EN_RANGO. EN_RANGO recibe el número a verificar y devuelve "1" si está en rango o "0"
#de lo contrario.

#EN TODO EL EJERCICIO DEBE USARSE LA CONVENCIÓN DE REGISTROS.

.data
 CONTROL: .word 0x10000
 DATA: .word 0x10008
 
 verde: .byte 0, 255, 0, 0
 datos: .word 35, 20, 70, 20, 1, 1, -10, 5, 20, 30
 pares: .word 5
 
.code
 daddi $sp, $0, 0x400 #pila
 ld $s0, CONTROL($0) #control
 ld $s1, DATA($0) #data
 lwu $s2, verde($0) #color 4 bytes
 daddi $s3, $0, 5 #señal de pintar pixel
 #direccion de pares y cantidad de pares
 daddi $a0, $0, datos
 daddi $a1, $0, pares
 jal GRAFICAR
 halt
 
GRAFICAR: ld $t0, 0($a1) #5 pares, iteración
    loop: ld $t1, 0($a0) #traigo x numero del par
		  ld $t2, 8($a0) #traigo y numero del par
		  #pusheo $ra y argumentos
		  daddi $sp, $sp, -8 #push
		  sd $ra, 0($sp)
		  daddi $sp, $sp, -8 #push
		  sd $a0, 0($sp)
		  #---> duda si falta un push más
		  dadd $a0, $0, $t1 #traigo x
		  jal EN_RANGO
		  beqz $v0, sigue #si el valor retornado es 0, el num no esta en rango y el par tampoco
		  dadd $a0, $0, $t2 # traigo y
		  jal EN_RANGO
		  beqz $v0, sigue #si el valor retornado es 0, el num no esta en rango y el par tampoco
		  
		  #pintar pixel
		  sb $t1, 5($s1) #envio coordenada x
		  sb $t2, 4($s1) #envio coordenada y
		  sw $s2, 0($s1) #envio color
		  sd $s3, 0($s0) #envio señal de pintar pixel

   #pop's y decremento iteración   
   sigue: daddi $t0, $t0, -1
          ld $a0, 0($sp)
          daddi $sp, $sp, 8
		  ld $ra, 0($sp)
		  daddi $sp, $sp, 8
		  daddi $a0, $a0, 16 #nos desplazamos, al siguiente par, en la direccion del vector datos
		  bnez $t0, loop
		 jr $ra #ret prog principal
	
EN_RANGO: daddi $v0, $0, 0 #inicialmente fuera de rango
		  slti $t3, $a0, 50 
		  beqz $t3, volver #si es cero esta por encima del 50, si es 1 esta en rango
		  slti $t3, $a0, 0
		  bnez $t3, volver #si es cero esta en rango, si es 1 esta por debajo del cero
		  daddi $v0, $0, 1 #asentamos que el num esta en rango
  volver: jr $ra