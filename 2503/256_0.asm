MODEL SMALL
STACK

DATA
    BLOCK DB 10H, 83H, 0F4H, ……    ; 数据
    MAX   DB ?

CODE
START:
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 256
    MOV MAX, 0
    MOV BL, 0
    MOV DI, OFFSET BLOCK

NEXT:
    MOV AL, [DI]
    TEST AL, 80H
    JE POSIT
    NEG AL

POSIT:
    CMP BL, AL
    JNC DONE
    MOV AL, [DI]
    MOV MAX, AL

DONE:
    INC DI
    LOOP NEXT
    
    MOV AH, 4CH
    INT 21H

END START