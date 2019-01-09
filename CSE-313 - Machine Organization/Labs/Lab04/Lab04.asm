;Class: CSE 313 Machine Organization LAb
;Section: 01
;Instructor: Taline Geogiou
;Term: (Fall 2017)
;Name:Taylor Pedretti, Minh Quach
;Lab04: Fibonacci Numbers
;Descriptopn: Program that computes a given fibonacci number.

	.ORIG x3000
	LDI R1, n

	ADD R2, R1, #-2		;Subtract 2 for if checking
	BRNZ FONE		;if n<=2, then F=1
	BR ELSE			;else

FONE	AND R2, R2, #0		;Reset R2 to 0
	ADD R2, R2, #1		; F=1
	BR AFTER

ELSE	AND R2, R2, #0		;Set R2 to 0

	ADD R2, R2, #1		;a=1
	ADD R3, R3, #1		;b=1

	AND R5, R5, #0		;R5 to 0
	ADD R5, R5, #3		;i=3

LOOP	ADD R4, R3, R2		;F=b+a

	ADD R2, R3, #0		;a=b
	ADD R3, R4, #0		;b=F

	NOT R6, R5		;Negate i
	ADD R6, R6, #1		;add 1 to 2s complement
	ADD R6, R1, R6		;R6 = n-i
	BRnz AFTER		;If <=0, then n-i=0, exit the loop
	ADD R5, R5, #1		;increment i by 1

	BR LOOP			;Repeat F calc

AFTER 	STI R4, FN		;Store value of n calc in x3101

	AND R2, R2, #0
	AND R3, R3, #0
	
	ADD R2, R2, #1
	ADD R3, R3, #1
	
	AND R5, R5, #0
	ADD R5, R5, #2

	AND R4, R4, #0

LOOP2	ADD R4, R3, R2		;F=b+a
	BRN FNDIT		;if F<0 then we found N and FN
	
	ADD R7, R3, R2		;F=b+a
	ADD R2, R3, #0		;a=b
	ADD R3, R4, #0		;b=F
	ADD R5, R5, #1		;i++
	BR LOOP2		;Repeat Loop2

FNDIT	STI R5, Ln		;max n in 16 bit stored in x3102
	STI R7, LFN		;max FN in 16 bits stored in x3103

	HALT

n	.FILL x3100		;Value of n to start with
FN	.FILL x3101		;Value of calc fibonacci # at n
Ln	.FILL x3102		;Largest value of n in 16 bit
LFN	.FILL x3103		;Largest FN that can be in 16 bit

	.END