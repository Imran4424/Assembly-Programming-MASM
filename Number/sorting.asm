org 100h
.model small
.stack 100h
.data
MSG DB "Please Enter Numbers: $"
MSG2 DB 10,13,"Number is sorted: $"
MSG3 DB 10,13,"In Ascending: $"
MSG4 DB 10,13,"In Decending: $"

STR1 DB 100 DUP(?)
STR2 DB 100 DUP(?)

.code
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX

	MOV AH,9
	LEA DX,MSG
	INT 21H

	MOV AH,1
	MOV SI,0

	WHILE:
		INT 21H
		CMP AL,13  ; carge return
		JE END_WHILE

		MOV STR1[SI],AL
		MOV STR2[SI],AL

		INC SI
		JMP WHILE

	END_WHILE:
		MOV STR1[SI],'$'
		MOV STR2[SI],'$'

		DEC SI
		MOV BX,SI
		MOV CX,SI

		CMP CX,-1
		JE OUTPUT


	SORT:
		MOV SI,0
		MOV DI,1

		FOR:
			CMP DI,BX
			JG END_FOR

			MOV AL,STR1[SI]
			CMP AL,STR1[DI] ;ascending check
			JL POS1

			MOV DL,STR1[DI]
			MOV STR1[SI],DL
			MOV STR1[DI],AL

			POS1:
				MOV AL,STR2[SI]
				CMP AL,STR2[DI] ;decending check
				JG POS2

				MOV DL,STR2[DI]
				MOV STR2[SI],DL
				MOV STR2[DI],AL

			POS2:
				INC SI
				INC DI
				JMP FOR

		END_FOR:

	LOOP SORT:

	OUTPUT:
		MOV AH,9
		LEA DX,MSG2
		INT 21H

		LEA DX,MSG3
		INT 21H

		LEA DX,STR1
		INT 21H

		LEA DX,MSG4
		INT 21H

		LEA DX,STR2
		INT 21H


	MOV AH,4CH
	INT 21H

	MAIN ENDP
END MAIN 