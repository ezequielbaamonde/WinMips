#Implementar una subrutina INGRESAR_NUMERO. La misma deberá solicitar el ingreso por teclado de un
#número entero del 1 al 9. Si el número ingresado es un número válido entre 1 y 9 la subrutina deberá
#imprimir por pantalla el número ingresado y retornar dicho valor. En caso contrario, la subrutina deberá
#imprimir por pantalla “Debe ingresar un número” y devolver el valor 0. Para ello, implementar y usar una
#subrutina ENTRE que reciba un número N y otros dos números B y A, y devuelva 1 si B<N<A o 0 de lo
#contrario.
#Usando la subrutina INGRESAR_NUMERO implementar un programa que invoque a dicha subrutina y
#genere una tabla llamada NUMEROS con los valores ingresados. La generación de la tabla finaliza cuando la
#suma de los resultados obtenidos sea mayor o igual a el valor almacenado en la dirección MAX.
#Al finalizar la generación de la tabla, deberá invocar a la subrutina PROCESAR_NUMEROS, que debe recibir
#como parámetro la dirección de la tabla NUMEROS y la cantidad de elementos y contar la cantidad de
#números impares ingresados. Se debe mostrar por pantalla el valor calculado, con el texto "Cantidad de
#Valores Impares: “ y el valor. Para ello, utilizar la subrutina ES_IMPAR codificada anteriormente.

.data
 CONTROL: .word 0x10000
 DATA: .word 0x10008 
 mensaje1: .asciiz "Debe ingresar un número\n"
 mensaje2: .asciiz "Cantidad de Valores Impares:\n"
 NUMEROS: .word 0 #vector
 MAX: .word 10
 
.code
 daddi $sp, $0, 0x400
 ld $s0, CONTROL($0)
 ld $s1, DATA($0)
 daddi $s2, $0, NUMEROS
 ld $s3, MAX($0)
 jal INGRESAR_NUMERO
 halt
 
INGRESAR_NUMERO: daddi $t4, $t4, 0 #suma temporaria de elementos
				 daddi $t5, $t5, 0 #contador elementos
				 daddi $sp, $sp, -8
				 sd $ra, 0($sp)
				 daddi $sp, $sp, -8
				 sd $s2, 0($sp)
			loop: daddi $t0, $0, 8 #Señal ingresar numero
				 sd $t0, 0($s0)
				 ld $t0, 0($s1)
				 dadd $a0, $0, $t0
				 daddi $a1, $0, 1
				 daddi $a2, $0, 9
				 jal ENTRE
				 beqz $v0, loop #Si es cero, el numero no esta en rango y no se agrega al vector
				 sd $v0, 0($s2)
				 daddi $t5, $t5, 1 #sumo elemento
				 dadd $t4, $t4, $v0 #sumo numeros ingresados
				 daddi $s2, $s2, 8 #incremento desplazamiento
				 beq $t4, $s3, siga #evaluo si igual a MAX
				 slt $t3, $s3, $t4 #evaluo si es mayor a MAX
				 beqz $t3, loop
		   siga: ld $s2, 0($sp) #recupero direccion de vector NUMEROS
				 daddi $sp, $sp, 8
				 dadd $a0, $s2, $0 #paso dirección de vector NUMEROS como argumento 0
				 dadd $a1, $t5, $0 #paso cantidad de elementos del vector como argumento 1
				 jal PROCESAR_NUMEROS
				 ld $ra, 0($sp)
				 daddi $sp, $sp, 8
				 jr $ra

ENTRE: daddi $v0, $0, 0 #de lo contrario
	   slt $t1, $a0, $a1
	   bnez $t1, error
	   slt $t1, $a0, $a2
	   beqz $t1, error
	   dadd $v0, $0, $a0
	   daddi $t2, $0, 1
	   sd $v0, 0($s1) #envio numero a imprimir
	   sd $t2, 0($s0) #envio señal de imprimir SIN SIGNO
	   j volver
 error: daddi $t2, $0, mensaje1
	    sd $t2, 0($s1)
		daddi $t2, $0, 4
		sd $t2, 0($s0)
volver: jr $ra

PROCESAR_NUMEROS: daddi $sp, $sp, -8
				  sd $ra, 0($sp)
				  dadd $t6, $a1, $0 #cant elementos para iterar
				  daddi $t8, $0, 0 #inicializar contador impares
			loop1: ld $t7, 0($a0)
				  dadd $a2, $t7, $0 #paso num vector a evaluar
				  jal esimpar
				  daddi $t6, $t6, -1 #decremento iteración
				  daddi $a0, $a0, 8 #desplazamiento de vector
				  beqz $v0, loop1
				  daddi $t8, $t8, 1 #contador impares
				  bnez $t6, loop1 #si $t6 =! 0 loopea
				  daddi $t9, $0, mensaje2
				  sd $t9, 0($s1)
				  daddi $t9, $0, 4
				  sd $t9, 0($s0) 
				  sd $t8, 0($s1)
				  daddi $t9, $0, 1
				  sd $t9, 0($s0)
				  ld $ra, 0($sp)
				  daddi $sp, $sp, 8
			      jr $ra
				 
esimpar: andi $v0, $a2, 1 #si te da 1 es impar, si te da 0 es par
		 jr $ra