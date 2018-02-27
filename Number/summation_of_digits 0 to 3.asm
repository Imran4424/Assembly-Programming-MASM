org 100h
.model small
.stack 100h
.data
MSG DB "Please input a digit from 0 to 3: $"
MSG2 DB 10,13,"The sum is: $"
X DB ?


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
	MOV AH,0
	
	XOR BX,BX
	MOV BX,'0'
	MOV CX,AX


	SUM:
		ADD BX,CX
		LOOP SUM

	OUTPUT:
		MOV AH,9
		LEA DX,MSG2
		INT 21H

		MOV AH,2
		MOV DX,BX
		INT 21H



	MOV AH,4CH
	INT 21H

	MAIN ENDP
END MAIN