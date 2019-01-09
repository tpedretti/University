;Class: CSE 313 Machine Organization LAb
;Section: 01
;Instructor: Taline Geogiou
;Term: (Fall 2017)
;Name: Taylor Pedretti, Minh Quach
;Lab02: Arithmetic Functions
;Descriptopn: Purpose of this lab is to deonstrate a program
;that can compute the difference with values given and
;find the absolute and see which is bigger from the values given.
.ORIG x3000
LDI R1, X			; Value at x3120 in R1
LDI R2, Y			; Value at x3121 in R2

;X-Y
NOT R4, R2			; Negate Y
ADD R4, R4, #1			; Add 1 to 2s complement
ADD R3, R1, R4			; X+(-Y) store in R3
STI R3, SUB			; value in x3122

;|X|
ADD R3, R1, #0			
BRzp ZPX			; Skip neg if 0 or +
NOT R3, R3			; Negate R3, store in R3
ADD R3, R3, #1			; 2s complement
ZPX STI R3, ABSX		; |X| in x3123

;|Y|
ADD R4, R2, #0			
BRzp ZPY			; Skip neg if 0 or +
NOT R4, R4			; Negate R3, store in R3
ADD R4, R4, #1			; 2s complement
ZPY STI R4, ABSY		; |Y| in x3124

;|X| or |Y| is larger
ADD R0, R4 , #0			
NOT R5, R4			; Neg |Y| stores in R5
ADD R5, R5, #1			; 2s complement
ADD R5, R3, R5			; |X|+-|Y| R5

ADD R6, R5, #0			
BRz EQ				; |X| == |Y| go to EQ
ADD R6, R5, #0			
BRp GR				; X is greater, store as 1
ADD R6, R5, #0			
BRn LE				; Y is greater, store as 2

BR SKIP				
EQ ADD R7, R7, #0		; R7 to 0
BR SKIP
GR ADD R7, R7, #1		; R7 to 1
BR SKIP
LE ADD R7, R7, #2		; R7 to 2

SKIP STI R7, Z			;1, 2 or 0 in x3125

HALT

X	.FILL x3120
Y	.FILL x3121
SUB	.FILL x3122
ABSX	.FILL x3123
ABSY	.FILL x3124
Z	.FILL x3125

.END