;Class: CSE 313 Machine Organization LAb
;Section: 01
;Instructor: Taline Geogiou
;Term: (Fall 2017)
;Name:Taylor Pedretti, Minh Quach
;Lab01: ALU Operations
;Descriptopn: Working with ALU Operations.
.ORIG x3000

LEA R2, xFF
LDR R1, R2, x0
LDR R3, R2, x1

;x + y
ADD R4, R1, R3 	;R4 = R1+R3
STR R4, R2, x2 	;R4 -> M[x3100+x2]

;x AND Y
AND R4, R1, R3 	;R4 <- R1 AND R3
STR R4, R2, x3 	;R4 -> M[R2+X3]

;X OR Y
NOT R5, R1 	;R5<-NOT(R1)
NOT R6, R3 	;R6<-R5 AND R6
AND R4, R5, R6	;R4<-R5 AND R6
NOT R4, R4 	;R4<-NOT(R4)
STR R4, R2, x4 	;R4->M[X3100+X4]

;NOT X
NOT R4, R1	;R4<-!R1
STR R4, R2, x5	;R4->M[X3100+X5]

;NOT Y
NOT R4, R3	;R4<-!R3
STR R4, R2, x6	;R4->M[X3100+x6]

;X+3
ADD R4, R1, x3	;R4<-R1+3
STR R4, R2, x7	;R4->M[X3100+x7]

;Y-3
ADD R4, R3, x-3	;R4 <- R3-3
STR R4, R2, x8	;R4->M[X3100x8]

;EVEN OR ODD
AND R4, R1, x1	;R4<-R1 AND 00...1
STR R4, R2, x9	;R4->M[X3100+x9]

HALT
.END

