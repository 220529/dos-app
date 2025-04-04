DATA SEGMENT
    NUM  DB 5
DATA ENDS
CODE SEGMENT
              ASSUME CS:CODE, DS:DATA
    START:    
              MOV    AX, DATA
              MOV    DS, AX
              MOV    CX, 5
    CASE_LOOP:
              MOV    BL, NUM
              ADD    BL, '0'
              MOV    AH, 02H
              MOV    DL, BL
              INT    21H
              DEC    NUM
              LOOP   CASE_LOOP
    
              MOV    AH, 4CH
              INT    21H
CODE ENDS
END START