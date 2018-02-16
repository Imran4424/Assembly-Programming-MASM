org 100h
.model small
.stack 100h
.data
    msg db "I am a Programmer $"
    
    
.code
MOV AH,9 ; for string output
LEA DX,msg
INT 21H