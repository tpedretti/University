;Class: CSE 313 Machine Organization LAb
;Section: 01
;Instructor: Taline Geogiou
;Term: (Fall 2017)
;Name:Taylor Pedretti, Minh Quach
;Lab05: Subroutines: Multiplication, Division, Modulus
;Descriptopn: Gievn two integers X and Y compute the product XY (Multiplication),
;the quotient X/Y (integer division), and the modulus X (mod Y).
	
	.ORIG X3000
	LDI R0, X
	LDI R1, Y
	JSR MULT
	LDI R0, X
	LDI R1, Y
	JSR DIVID
	HALT


MULT	AND R2, R2, #0
	ADD R2, R2, #1

	ADD R0, R0, #0
	BRzp YCHECK
	NOT R2, R2		;Negate R2	
	ADD R2, R2, #1		;2s Comp	

YCHECK	ADD R1, R1, #0
	BRp XYPOS
	BRz isZERO
	NOT R2, R2
	ADD R2, R2, #1

	AND R3, R3, #0
	

XYPOS	ADD R3, R3, R0
	ADD R1, R1, #-1
	BRp XYPOS

	AND R2, R2, #0
	BRn negPROD
	BR SKIP

negPROD	NOT R3, R3
	ADD R3, R3, #1
	BR SKIP

isZERO	AND R3, R3, #0

SKIP	STI R3, ProdXY
	RET

DIVID	AND R2, R2, #0
	AND R3, R3, #0
	ADD R0, R0, #0
	BRn nFAIL
	ADD R1, R1, #0
	BRnz nFAIL

	ADD R4, R4, R0

DIVLP	AND R5, R5, #0
	NOT R5, R1
	ADD R5, R5, #1
	ADD R5, R5, R4
	BRn Success

	NOT R5, R1
	ADD R5, R5, #1
	ADD R4, R4, R5
	ADD R2, R2, #1
	BR DIVLP

nFAIL	STI R2, QuotXY
	STI R3, ModXY

Success	STI R2, QuotXY
	STI R3, ModXY

	RET

X	.FILL X3100
Y	.FILL X3101
ProdXY	.FILL x3102
QuotXY	.FILL x3103
ModXY	.FILL x3104

	.END