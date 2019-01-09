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
	JSR MULT	;Jump to Multiplication
	LDI R0, X	;Resets R0 = X
	LDI R1, Y	;Resets R1 = Y
	JSR DIVID	;Jump to Division
	HALT


MULT	AND R2, R2, #0
	ADD R2, R2, #1		;Set R2=1 as state flag
	ADD R0, R0, #0		;Sets R0 
	BRzp YCHECK			;
	NOT R2, R2			;Negate R2	
	ADD R2, R2, #1		;2s Comp of R2

YCHECK	ADD R1, R1, #0
	BRp XYPOS			;Check to see if Y is positive or zero
	BRz isZERO			;Y is zero, return 0
	NOT R2, R2			;Negate R2
	ADD R2, R2, #1		;2s Comp of R2
	AND R3, R3, #0		;Clear R3	

XYPOS	ADD R3, R3, R0	;R3 = X+X
	ADD R1, R1, #-1		;Y=Y-1 till it gets to 0
	BRp XYPOS			;Keep going till Y = 0.
	AND R2, R2, #0		;
	BRn negPROD			;If X or Y is negative, neg product
	BR SKIP				

negPROD	NOT R3, R3		;Negate R0
	ADD R3, R3, #1		;2s Comp on R3
	BR SKIP

isZERO	AND R3, R3, #0	;R3 = 0

SKIP	STI R3, ProdXY	;Stores Product into x3102
	RET

DIVID	AND R2, R2, #0	;Clear R2
	AND R3, R3, #0		;Remainder location
	ADD R0, R0, #0		;Checks if X<0
	BRn nFAIL			;
	ADD R1, R1, #0		;Checks if Y<=0
	BRnz nFAIL			;

	ADD R4, R4, R0		;R4 temp value of X

DIVLP	AND R5, R5, #0	;Clear R5
	NOT R5, R1			;R5 = NOT Y
	ADD R5, R5, #1		;Negation of Y
	ADD R5, R5, R4		;X-Y
	BRn Success			;if temp >= Y

	NOT R5, R1			;Negate Y
	ADD R5, R5, #1		;R5 = -Y
	ADD R4, R4, R5		;R5 = temp-Y
	ADD R2, R2, #1		;Quotient = Quo + 1
	BR DIVLP

nFAIL	STI R2, QuotXY	;zero will be in x3103
	STI R3, ModXY		;zero will be in x3104

Success	STI R2, QuotXY	;x3103 stores the quotient
	STI R3, ModXY		;x3104 stores the modulus

	RET

X	.FILL X3100
Y	.FILL X3101
ProdXY	.FILL x3102
QuotXY	.FILL x3103
ModXY	.FILL x3104

	.END