#Escriba un programa que utilice potencia. En el programa principal se solicitará el ingreso de la base y
#del exponente (ambos enteros) y se deberá utilizar la subrutina potencia para calcular el resultado
#pedido. Muestre el resultado numérico de la operación en pantalla.
.data
 base: .word 0 #Se ingresa por teclado
 exponente: .word 0 #Se ingresa por teclado
 result: .word 0
 control: .word 0x10000
 data: .word 0x10008
 
.code
 ld $t0, control($0) #traigo contenido de control
 ld $t1, data($0) #traigo direccion de data

 #Lectura de base
 #daddi $t4, $zero, base #Guardo dir "base" en $t4
 daddi $t2, $zero, 8 # función 8: entrada de un un numero
 sd $t2, 0($t0) # CONTROL recibe 8 y produce la lectura del numero
 ld $t2, 0($t1) #Cargo en $t2 el valor ingresado
 #sd $t2, 0($t4) #Cargo el número leido en la memoria
 sd $t2, base($0)
 
 
 #Lectura de exponente
 #daddi $t4, $zero, exponente #Guardo dir "exponente" en $t4
 daddi $t2, $zero, 8 # función 8: entrada de un un numero
 sd $t2, 0($t0) # CONTROL recibe 8 y produce la lectura del numero
 ld $t2, 0($t1) #Cargo en $t2 el valor ingresado
 #sd $t2, 0($t4) #Cargo el número leido en la base
 sd $t2, exponente($0)
 
 #pasaje de parametros
 ld $a0, base($0) #Cargo base en argumento
 ld $a1, exponente($0) #Cargo exponente en argumento
 jal potencia #Llamo a subrutina y $ra es la dir siguiente
 sd $v0, result($0) #Copio resultado de $v0 (Variable retorno) en memoria "RESULT"
 
 daddi $t2, $zero, 1
 ld $t3, result($0)
 sd $t3, 0($t1) #le mando a data el valor a imprimir
 sd $t2, 0($t0) #Imprime resultado
 halt
 
 potencia: daddi $v0, $0, 1 #Cargo primer multi
		   lazo: beqz $a1, fin
				 daddi $a1, $a1, -1 #Decremento exponente
				 dmul $v0, $v0, $a0
				 j lazo
		   fin: jr $ra