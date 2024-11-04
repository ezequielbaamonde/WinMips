.data
 cadena: .asciiz "ArquiTectuRa de ComPutaDorAS" # cadena a analizar
 cant: .word 0 # cantidad de veces que se repite el carácter car en cadena.
 
.code
 daddi $t2, $zero, cadena; Offset cadena
 
 contador: lbu $t1, cadena($t2)# Copio 8 bits del caracter, de la posicion que tenga $t2, en $t1
           beqz $t1, fin # Si el char es 0, finaliza
		   #EVALUAR MAYUSCULAS
		   slti $t4, $t1, 65 # Comparo si $t1 es menor que 65, $t4=1
		   bnez $t4, noMayus # Si es $t4=1, quiere decir que es menor que 65 y no es mayuscula
		   
		   slti $t4, $t1, 90 # Comparo si $t1 es menor que 90, $t4=1
		   beqz $t4, noMayus # Si es $t4=0  quiere decir que es mayor a 90, no es un char mayus
		   
           daddi $t3, $t3, 1 #Incremento contador mayusculas.
		   #CONTINUACIÓN
		   noMayus: daddi $t2, $t2, 1 #Paso al siguiente byte, sumo 1
		   j contador #Salto al loop nuevamente

 fin: dadd $v0, $zero, $t3 #Paso valor contador a variable local.
 sd $v0, cant($0) #Envío resultado a dato mayusculas.
 halt

#Contar mayúsculas: Escribir un programa que cuente la cantidad de letras mayúsculas de un string.
#Probarlo con el string “ArquiTectuRa de ComPutaDoras”. Pista: El código ASCII de la “A” es 65, y el de la 
#“Z” es 90.