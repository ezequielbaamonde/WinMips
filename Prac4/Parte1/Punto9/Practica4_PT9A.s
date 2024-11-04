.data
 string: .asciiz "ArquiTectuRa de ComPutaDoras"; Tiene 28 cararacteres (Finaliza con 0)
 longitud: .word 0;
 
.code
 daddi $t2, $zero, string; Offset String
 
 contador: lbu $t1, string($t2); Copio 8bits del caracter, de la posicion que tenga $t2, en $t1
		   beqz $t1, fin; Si es 0, termina programa
		   
           daddi $t3, $t3, 1; Incremento contador
		   daddi $t2, $t2, 1; Paso al siguiente byte, sumo 1
		   j contador; Salto al loop nuevamente

 fin: dadd $v0, $zero, $t3; Paso valor contador a variable local.
 sd $v0, longitud($0); Envío resultado a dato longitud.
 halt

;Longitud de un string:
; Escribir un programa que cuente la longitud de un string iterando el mismo hasta llegar al
;valor 0 y guarde el resultado en una variable llamada LONGITUD. Probarlo con el string “ArquiTectuRa de
;ComPutaDoras”.