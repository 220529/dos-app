CODE SEGMENT
START:
ASSUME CS:CODE,
MOV CX, 10
MOV DL, '0'  ; 初始字符 '0'
PRINT_NUM:
INC DL    ; DL++
MOV AH, 02H
INT 21H   ; 打印字符
LOOP PRINT_NUM
CODE ENDS
END START