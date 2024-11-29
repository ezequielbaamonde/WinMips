.data
 NUM: .word 2

.code
 daddi $t0, $0, 0
 ld $t1, NUM($0)
 daddi $t2, $0, 2
 
 loop: dadd $t0, $t0, $t1
	   daddi $t2, $t2, -1
	   bnez $t2, loop
	   halt
	   