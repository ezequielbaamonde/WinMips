#El siguiente programa debería intercambiar
#los valores de $t0 y $t1 utilizando la pila. No obstante, así como está no va a funcionar porque push y pop
#no son instrucciones válidas. Implementar la funcionalidad que tendrían estas operaciones utilizando
#instrucciones daddi, sd y ld para que el programa funcione correctamente. Recordar que los registros
#ocupan 8 bytes, y por ende el push y el pop deberán modificar a $sp con ese valor

.code
 daddi $sp, $0, 0x400
 daddi $t0, $0, 5
 daddi $t1, $0, 8
 #push $t0
 daddi $sp, $sp, -8
 sd $t0, 0($sp)
 #push $t1
 daddi $sp, $sp, -8
 sd $t1, 0($sp)
 #pop $t0
 ld $t0, 0($sp) ###Intercambié el valor, ahora $T0 tiene el valor "pusheado" que era $t1
 daddi $sp, $sp, 8

 #pop $t1
 ld $t1, 0($sp) ###Intercambié el valor, ahora $T1 tiene el valor "pusheado" que era $t0
 daddi $sp, $sp, 8
halt