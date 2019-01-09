; Class: CSE 313 Machine Organization Lab
; Section 01
; Instructor: Talone Geogiou
; Term Fall 2017
; Name: Taylor Pedretti
; Lab #0 - Hello World
; Descripton: LC-3 Program that displays
; "Hello World!" to the console
	.ORIG	x3000
	LEA	R0, HW	; Load address string
	PUTS		; output string to console
	HALT		; end program
HW	.STRINGZ "Hello World!"
	.END