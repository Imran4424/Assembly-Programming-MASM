org 100h
.model small
.stack 100h
.data
MSG DB "Please input your string: $"
MSG2 DB 10,13,"Number of vowels: $"
MSG3 DB 10,13,"Number of constant: $"
MSG4 DB 10,13,"Number of digits: $"
MSG5 DB 10,13,"Number of spaces: $"

VOWELS DB 48
CONSONANTS DB 48
DIGITS DB 48
SPACES DB 48

.code
MAIN PROC

	MOV AX,@DATA  ; loading segement registers
 	MOV DS,AX     ;   to use
 
 	MOV AH,9
 	LEA DX,MSG
 	INT 21H

 	MOV AH,1

 	WHILE:
 		INT 21H
 		CMP AL,13
 		JE OUTPUT

 		SPACE_CHK:
 			CMP AL,32
 			JNE VOWEL_CHK

 			INC SPACES
 			JMP WHILE


 		VOWEL_CHK:
 			CMP AL,'a'
 			JE COUNT_VOWEL

 			CMP AL,'e'
 			JE COUNT_VOWEL

 			CMP AL,'i'
 			JE COUNT_VOWEL

 			CMP AL,'o'
 			JE COUNT_VOWEL

 			CMP AL,'u'
 			JE COUNT_VOWEL

 			CMP AL,'A'
 			JE COUNT_VOWEL

 			CMP AL,'E'
 			JE COUNT_VOWEL

 			CMP AL,'I'
 			JE COUNT_VOWEL

 			CMP AL,'O'
 			JE COUNT_VOWEL

 			CMP AL,'U'
 			JE COUNT_VOWEL

 			JMP DIGIT_CHK

 			COUNT_VOWEL:
 				INC VOWELS
 				JMP WHILE


 		DIGIT_CHK:
 			CMP AL,'0'
 			JL CONSONANT_CHK

 			CMP AL,'9'
 			JG CONSONANT_CHK

 			INC DIGITS
 			JMP WHILE

 		CONSONANT_CHK:

 			SMALL:
 				CMP AL,'a'
 				JL CAPITAL

 				CMP AL,'z'
 				JG WHILE

 				INC CONSONANTS
 				JMP WHILE

 			CAPITAL:
 				CMP AL,'A'
 				JMP WHILE

 				CMP AL,'Z'
 				JMP WHILE

 				INC CONSONANTS
 				JMP WHILE


 	OUTPUT:
 		MOV AH,9
 		LEA DX,MSG2
 		INT 21H
 		MOV AH,2
 		MOV DL,VOWELS
 		INT 21H

 		MOV AH,9
 		LEA DX,MSG3
 		INT 21H
 		MOV AH,2
 		MOV DL,CONSONANTS
 		INT 21H

 		MOV AH,9
 		LEA DX,MSG4
 		INT 21H
 		MOV AH,2
 		MOV DL,DIGITS
 		INT 21H

 		MOV AH,9
 		LEA DX,MSG5
 		INT 21H
 		MOV AH,2
 		MOV DL,SPACES
 		INT 21H

 	MOV AH,4CH
 	INT 21H

	MAIN ENDP
END MAIN