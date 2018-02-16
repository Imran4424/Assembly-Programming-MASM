org 100h
.model small
.stack 100h
.data
 x db 0  ;using 0 for optimization, '?' will also do the work
 
.code
MOV AH,1 ;for input
INT 21H
MOV x,AL

;new line begins
MOV AH,2 ;for output

MOV DL,13 ;carge return , we can use 0dh instead of 13
INT 21H

MOV DL,10 ; line feed , we can use 0ah instead of 10
INT 21H                                             

;new line code ends here


MOV AH,2 ; for output
MOV DL,x
INT 21H
    