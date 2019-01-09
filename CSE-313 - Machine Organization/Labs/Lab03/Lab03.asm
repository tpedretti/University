;Class: CSE 313 Machine Organization LAb
;Section: 01
;Instructor: Taline Geogiou
;Term: (Fall 2017)
;Name: Taylor Pedretti, Minh Quach
;Lab03: Days of the week
;Descriptopn: User enters in 0 to 6 to display the day of the week that goes with the number.

	.ORIG x300
BEGIN	LEA R0, PROMPT
	PUTS
	GETC
	ADD R3, R0, x0		;Copy R0 into R3

	ADD R3, R3, #-16	;Subtract 3x16
	ADD R3, R3, #-16	;
	ADD R3, R3, #-16	;R3 now actual value entered

	AND R4, R4, x0		;Set to 0
	ADD R4, R3, #-6		;Subtract 6
	BRp ENDGAME		;Checks for error
	
	LEA R0, DAYS		;Load DAYS label
	ADD R3, R3, x0		;Enable condition
	
LOOP	BRz DISPLAY		;if r3 is 0, display
	ADD R0, R0, #10		;increment address by 10
	ADD R3, R3, #-1		;Decremnt input value
	BR LOOP			;Run loop again

DISPLAY PUTS
	LEA R0, LF		;New line
	PUTS

	BR BEGIN		;Prompt the user again	

ENDGAME HALT
PROMPT	.STRINGZ "Please enter a number between 0 and 6:"
DAYS	.STRINGZ "Sunday   "
	.STRINGZ "Monday   "
	.STRINGZ "Tuesaday "
	.STRINGZ "Wednesday"
	.STRINGZ "Thursday "
	.STRINGZ "Friday   "
	.STRINGZ "Saturday "
LF 	.FILL x000A
	.END