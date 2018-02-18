.code
main proc
    MOV CX,9
    
    MOV AH,2
    MOV BL,'1'  ; storing the data in bl register
    
    TOP:
    
    MOV DL,BL   ; copying the bl register data to dl
    INT 21H
    INC BL      ; incrementing bl
    
    ;new line code begins
    MOV AH,2
    
    MOV DL,10 ;line feed
    INT 21H
    
    MOV DL,13 ; carge return
    INT 21H
    ;new line code ends
    
    LOOP TOP
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
