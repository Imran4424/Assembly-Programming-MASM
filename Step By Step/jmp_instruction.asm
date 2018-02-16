.code
main proc
    first:
    
    MOV AH,2 ;for output
    
    MOV DL,3
    ADD DL,48 ;clearing ascii values
    INT 21H
    
    ;space code begin
    MOV AH,2
    MOV DL,32
    INT 21H
    ;space code ends 
    
    second:
    
    MOV AH,2 ; for output
    MOV DL,5
    ADD DL,48 ;clearing ascii values
    INT 21H
    
    
    ;new line code begins
    MOV AH,2 
    
    MOV DL,10 ; line feed 
    INT 21H
    
    MOV DL,13 ; carge return
    INT 21H   
    
    ;new line code ends
    
    JMP first
    