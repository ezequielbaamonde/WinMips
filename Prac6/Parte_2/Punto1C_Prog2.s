#2 atascos RAW en BNE ya que depende de $t2
#Solamente se pueden reducir los atascos ya sea colocando 2 NOP. No hay manera de reordenarlo

.data
 A: .word 2
 C: .word 0
 
.code
 daddi $t0, $0, 0
 ld $t1, A($0)
 ld $t2, A($0)
 nop
 nop
 bne $t1, $t2, no
 daddi $t3, $0, 1
 j fin
 no: daddi $t3, $0, 0
 fin: sd $t3, C($0)
 halt