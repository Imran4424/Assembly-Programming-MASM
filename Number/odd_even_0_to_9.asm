;This is a Assembly program
;For determining odd/even number

org 100h
.model small
.stack 100h
.data 
MSG DB "Please input a digit from 0 to 9: $"
MSG2 DB 10,13,"The DIGIT IS ODD $"
MSG3 DB 10,13,"The DIGIT IS EVEN $"

.code 
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX

	MOV AH,9
	LEA DX,MSG
	INT 21H

	MOV AH,1
	INT 21H

	SUB AL,'0'

	MOV BL,AL
	
	AND BL,1
	JZ EVEN
	JMP ODD


	

	EVEN:
		MOV AH,9
		LEA DX,MSG3
		
		JMP STOP

	ODD:
		MOV AH,9
		LEA DX,MSG2
		
		JMP STOP

	STOP:
		
		INT 21H


	MAIN ENDP
END MAIN