#Factorial: Implemente la subrutina factorial, que dado un número N devuelve factorial(N) = N! = N * (N-1) *
#(N-2) * … * 2 * 1. Por ejemplo, el factorial de 4 es 4! = 4*3*2*1. Recordá también que el factorial de 0 también
#existe, y es factorial(0) =0! = 1

.data
 num: .word 4
 numFacto: .word 0
 
.code
 ld $a0, num($a0) #Cargo el valor 4 en $a0
 jal factorial
 sd $v0, numFacto($0) #Seteo valor del factorial en numFacto
 halt
 
 
factorial: daddi $v0, $0, 1
     loop: dmul $v0, $v0, $a0
		   daddi $a0, $a0, -1 #Decremento $t0
		   bnez $a0, loop
		   jr $ra