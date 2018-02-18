org 100h
.model small
.data
MSG DB "I am a Programmer. $"
MSG2 DB "Would you mind collaborate with me. $"

.code
main proc
    first:
    
    MOV AH,9 ;for string output
    
    LEA DX,MSG
    INT 21H
    
    ;space code begin
    MOV AH,2
    MOV DL,32
    INT 21H
    ;space code ends 
    
    second:
    
    MOV AH,9 ; for string output
    LEA DX,MSG2
    INT 21H
    
    
    ;new line code begins
    MOV AH,2 
    
    MOV DL,10 ; line feed 
    INT 21H
    
    MOV DL,13 ; carge return
    INT 21H   
    
    ;new line code ends
    
    JMP first
    