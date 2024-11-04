.data
 cadena: .asciiz "adbdcdedfdgdhdid" # cadena a analizar
 car: .ascii "d" # caracter buscado
 cant: .word 0 # cantidad de veces que se repite el carácter car en cadena.
 
.code
 daddi $t2, $zero, cadena; Offset cadena
 lbu $t4, car($t2); Copio en reg temporal el valor del caratera  buscar
 
 contador: lbu $t1, cadena($t2)# Copio 8 bits del caracter, de la posicion que tenga $t2, en $t1
           beqz $t1, fin # Si el char es 0, finaliza
		   bne $t4, $t1, seguir # Evaluar caracteres para ver si son iguales. Sino son iguasles, sigue.
           daddi $t3, $t3, 1 #Incremento contador del caracter buscado.
		   seguir: daddi $t2, $t2, 1 #Paso al siguiente byte, sumo 1
		   j contador #Salto al loop nuevamente

 fin: dadd $v0, $zero, $t3 #Paso valor contador a variable local.
 sd $v0, cant($0) #Envío resultado a dato longitud.
 halt

#Contar apariciones de carácter.
# Escribir un programa que cuente la cantidad de veces que un determinado carácter
#aparece en una cadena de texto.