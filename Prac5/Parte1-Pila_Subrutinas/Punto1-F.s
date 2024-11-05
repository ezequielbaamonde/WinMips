#Escriba un programa que lea un exponente x y calcule 2^x + 3^x utilizando dos llamadas a potencia.
#Muestre en pantalla el resultado. ¿Funciona correctamente? Si no lo hace, revise su implementación
#del programa ¿Qué sucede cuando realiza una segunda llamada a potencia? Pista: Como caso de prueba,
#intente calcular 23+3³ = 8+27 = 35..

.data
 x: .word 0 #Se ingresa por teclado
 result: .word 0
 control: .word 0x10000
 data: .word 0x10008
 
.code
 ld $t0, control($0) #traigo contenido de control
 ld $t1, data($0) #traigo direccion de data

 #Lectura de exponente
 daddi $t2, $zero, 8 # función 8: entrada de un un numero
 sd $t2, 0($t0) # CONTROL recibe 8 y produce la lectura del numero
 ld $t2, 0($t1) #Cargo en $t2 el valor ingresado
 sd $t2, x($0) #seteo en memoria
 
 #pasaje de parametros
 daddi $a0, $0, 2 #base 2
 ld $a1, x($0) #Cargo exponente en argumento
 jal potencia #Llamo a subrutina para hacer 2^x
 daddi $t3, $v0, 0 #Cargo en t3 el resultado de 2^x
 
 daddi $a0, $0, 3 #base 3
 ld $a1, x($0) #Cargo exponente en argumento
 jal potencia #Llamo a subrutina nuevamente para hacer 3^x
 daddi $t4, $v0, 0 #Cargo en t4 el resultado de 3^x
 dadd $t3, $t3, $t4 #Sumo 2^x + 3^x
 sd $t3, result($0) #Copio resultado de $v0 (Variable retorno) en memoria "RESULT"
 
 #Impresion resultado
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