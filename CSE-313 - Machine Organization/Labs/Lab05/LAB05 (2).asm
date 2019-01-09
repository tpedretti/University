	.ORIG X3000
	LDI R0, X
	LDI R1, Y
	JSR MULT


MULT	AND R2, R2, #0
	ADD R2, R2, #1

	ADD R0, R0, #0
	BRzp yCheck
	NOT R2, R2		;Negate R2	
	ADD R2, R2, #1		;2s Comp	

yCheck	ADD R1, R1, #0
	

POSXY	ADD R3, R3, R0
	ADD R1, R1, #-1
	BRp POSXY

	AND R2, R2, #0



X	.FILL X3100
Y	.FILL X3101