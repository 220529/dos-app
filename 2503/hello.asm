DATA SEGMENT
    MSG  DB "hello$"
DATA ENDS

CODE SEGMENT
    START:
         MOV AX, DATA          ;
         MOV DS, AX            ;
         
         MOV AH, 09H           ;
         MOV DX, OFFSET MSG    ;
         INT 21H               ;

         MOV AH, 4CH           ;
         INT 21H               ;
CODE ENDS

END START