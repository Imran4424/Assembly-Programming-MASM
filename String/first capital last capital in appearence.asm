org 100h
.model small
.stack 100h
.data
MSG DB "Please Input a string: $"
MSG2 DB 10,13,"The first capital is: $"
MSG3 DB 10,13,"The Last Capital is: $"
MSG4 DB 10,13,"No Capitals $"

FC DB '?'
LC DB '?'
FLAG DB 'N'

.CODE
MAIN PROC

	MOV AX,@DATA ;loading segment register 
	MOV DS,AX    ; to use

	MOV AH,9 ;string output
	LEA DX,MSG
	INT 21H

	MOV AH,1

	WHILE:
		INT 21H
		CMP AL,13   ;carge return
		JE END_WHILE


		CMP AL,'A'
		JL POS1

		CMP AL,'Z'
		JG POS1

		MOV FLAG,'Y'

		MOV LC,AL

		CMP FC,'?'
		JNE POS1

		MOV FC,AL

		POS1:
			JMP WHILE

	END_WHILE:

		CMP FLAG,'Y'
		JE CAP_FOUND

		MOV AH,9
		LEA DX,MSG4
		INT 21H
		JMP LAST


	CAP_FOUND:

		MOV AH,9
		LEA DX,MSG2
		INT 21H

		MOV AH,2
		MOV DL,FC
		INT 21H

		MOV AH,9
		LEA DX,MSG3
		INT 21H

		MOV AH,2
		MOV DL,LC
		INT 21H


	LAST:

		MOV AH,4CH
		INT 21H

	MAIN ENDP
END MAIN