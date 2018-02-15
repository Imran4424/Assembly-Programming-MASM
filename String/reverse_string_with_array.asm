org 100h
.model small
.stack 100h
.data
STRING DB 100 DUP(?)
MSG DB "Input your string: $"
MSG2 DB "Given string in reverse order: $"

.code
MAIN PROC
	
	MOV AX,@DATA ; loading segment registers
	MOV DS,AX    ; to use 

	MOV AH,9  
	LEA DX,MSG
	INT 21H


	MOV SI,0   ; assinging 0 to SI

	MOV AH,1

WHILE:
	
	INT 21H
	CMP AL,13  ;carge return
	JE END_WHILE

	MOV STRING[SI],AL
	INC SI
	JMP WHILE

END_WHILE:

	MOV STRING[SI],'$'
	MOV DI,SI
	MOV SI,0

	DEC DI

WHILE2:
	CMP SI,DI
	JNBE END_WHILE2

	MOV AH,STRING[SI]
	MOV AL,STRING[DI]

	MOV STRING[SI],AL
	MOV STRING[DI],AH

	INC SI
	DEC DI

	JMP WHILE2


END_WHILE2:
	
	;new line code begins
	MOV AH,2
	MOV DL,10 ; new line 
	INT 21H

	MOV DL,13 ; carge return
	INT 21H
	;new line code ends

	MOV AH,9
	LEA DX,MSG2
	INT 21H

	MOV AH,9
	LEA DX,STRING
	INT 21H

	MOV AH,4CH ; 76 in decimal
	INT 21H
	MAIN ENDP
END MAIN