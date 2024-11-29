.data
 VEC1: .word 2, 3
 VEC2: .word 0
 
.code
 daddi $t0, $0, 0
 daddi $t1, $0, 2
 
 loop: ld $t2, VEC1($t0)
	   daddi $t1, $t1, -1
	   sd $t2, VEC2($t0)
	   daddi $t0, $t0, 8   
	   bnez $t1, loop
	   halt
	   
#Sin FORWARDING:
#	-> 1 BTS
#	-> 3 RAW
#	-> CPI: 1,615