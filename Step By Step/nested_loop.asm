.code
MAIN PROC
    MOV CX,'1'
    
    MOV AH,2
    MOV BL,'1'  ; storing the data in bl register
    
    TOP:
    
        CMP BL,'9'  ;comparing bl register
        JG EXIT
    
        MOV DL,BL   ; copying the bl register data to dl
        INT 21H
        INC BL      ; incrementing bl
        INC CX
        
        CMP CX,'3' ;comparing cx register
        JG NEWLINE
        
       
        
        
        JMP TOP
    
    NEWLINE:
        ;new line code begins
        MOV AH,2
        
        MOV DL,10 ;line feed
        INT 21H
        
        MOV DL,13 ; carge return
        INT 21H
        
        MOV CX,'1'
        
        JG TOP
        ;new line code ends
    
    
    EXIT:
    
        MOV AH,4CH
        INT 21H
    
    MAIN ENDP
END MAIN
