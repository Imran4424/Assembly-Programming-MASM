org 100h
.model small
.stack 100h

.data
STRING DB 100 DUP(?)
MSG DB "Input your string: $"
MSG2 DB "Your given string in conversion is: $"
X DB 0

.code
MAIN PROC
	
	MOV AX,@DATA  ; loading segment registers 
	MOV DS,AX     ; to use 

	MOV AH,9 ;string output
	LEA DX,MSG
	INT 21H

	MOV SI,0      ; assigning source index to 
	              ; decimal  0

	MOV AH,1

	FOR_LOOP:
		INT 21H
		CMP AL,13  ;carge return
		JE END_FOR

		MOV X,AL

		CMP X,97   ; comparing if it is small case
		JAE SMALL_CASE

		CMP X,65   ; comparing if it is capital case
		JAE CAPITAL_CASE


		JMP STORE

	CAPITAL_CASE:

		CMP X,90  ; comparing if it is above Z
		JA STORE

		ADD X,32  ;for converting capital to small

		JMP STORE

	SMALL_CASE:

		CMP X,122 ; comparing if it is above z 
		JA STORE 

		SUB X,32  ; coverting small to capital

	STORE:

		MOV AL,X
		MOV STRING[SI],AL  ;storing in string
		INC SI

		JMP FOR_LOOP

	END_FOR:

		MOV STRING[SI],'$'

		;new line code begins
		MOV AH,2
		MOV DL,10  ; new line
		INT 21H

		MOV DL,13  ; carge return
		INT 21H
		;new line code ends

		MOV AH,9
		LEA DX,MSG2
		INT 21H

		MOV AH,9
		LEA DX,STRING
		INT 21H

	MAIN ENDP
END MAIN