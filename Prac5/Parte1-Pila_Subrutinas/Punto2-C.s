#Los siguientes programas tienen errores en el uso de la convención de registros. Indicar qué registros cuál es
#el error y cómo se podría arreglar el problema en cada caso.

.code
daddi $a0, $0, 5
daddi $a1, $0, 7
jal subrutina
dmul $t2, $a0, $v0 #No puede usarse $a0 como valor de multiplicación, solo es para argumentos. Se utiliza otro temporal.
sd $t2, variable ($0)
halt