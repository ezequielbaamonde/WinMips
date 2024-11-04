.data
 datos: .byte -2, 2, 2, 2, 2, 2
 
;Para probar la diferencia entre estas 3 instrucciones, ejecutar el siguiente programa en el simulador que intenta
;cargar el primer valor del vector de números datos y observar los valores finales de $t1, $t2 y $t3.

.code
 ld $t1, datos($zero)
 lb $t2, datos($zero)
 lbu $t3, datos($zero)
 halt