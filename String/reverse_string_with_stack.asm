org 100h
.model small
.stack 100h
.data
MSG DB "Input a string: $"
MSG2 DB "Given string in reverse order: $"

.code
MAIN PROC
	
	MOV AX,@DATA ; loading segment registers
	MOV DS,AX    ; for use

	MOV AH,9
	LEA DX,MSG
	INT 21H

	MOV AH,1

	PUSH 0024H    ;assigning $ sign

	WHILE:          ;input loop

		INT 21H
		CMP AL,13
		JE END_WHILE

		MOV AH,0
		PUSH AX
		MOV AH,1

		JMP WHILE

	END_WHILE:

		;new line code begins
		MOV AH,2
		MOV DL,10
		INT 21H

		MOV DL,13
		INT 21H
		;new line codes end

		MOV AH,9
		LEA DX,MSG2
		INT 21H

		MOV AH,2

	WHILE2:

		POP DX
		CMP DX,'$'
		JE END_WHILE2

		INT 21H

		JMP WHILE2

	END_WHILE2:

		MOV AH,4CH
		INT 21H

	MAIN ENDP
END MAIN