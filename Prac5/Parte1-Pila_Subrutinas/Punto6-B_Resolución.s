.data
 ValorM: .word 6
 ValorN: .word 3
 Resul: .word 0
.code
 daddi $sp, $0, 0x400
 ld $a0, ValorM($0)
 ld $a1, ValorN($0)
 jal comb
 sd $v0, Resul($0)
 halt
 
comb: daddi $sp, $sp, -8
      sd $ra, 0($sp)
      dsub $t0, $a0, $a1
      jal factorial
      dadd $t1, $0, $v0
      dadd $a0, $0, $a1
      jal factorial
      dadd $t2, $0, $v0
      dadd $a0, $0, $t0
      jal factorial
      dmul $t0, $t2, $v0
      ddiv $v0, $t1, $t0
      ld $ra, 0($sp)
      daddi $sp, $sp, 8
      jr $ra
	  
factorial: daddi $v0, $0, 1
		   otro: beqz $a0, fin
		   dmul $v0, $v0, $a0
	daddi $a0, $a0, -1
	j otro
fin: jr $ra