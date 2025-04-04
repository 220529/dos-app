MODEL SMALL
STACK 100H
DATA SEGMENT
    NUM1 DB 1
    NUM2 DB 2
    MSG1 DB "JA!$"
    MSG2 DB "JNB!$"
DATA ENDS
CODE SEGMENT
          ASSUME CS:CODE, DS:DATA
    START:
          MOV    AX, @DATA
          MOV    DS, AX
          MOV    AL, NUM1
          MOV    BL, NUM2
          CMP    AL, BL
        ;   JA     CASE1
        ;   JMP    CASE2
    CASE1:
          MOV    AH, 09H
          MOV    DX, OFFSET MSG1
          INT    21H
          JMP    EXIT
    ; CASE2:
    ;       MOV    AH, 09H
    ;       MOV    DX, OFFSET MSG2
    ;       INT    21H
    ;       JMP    EXIT
    EXIT:
          MOV    AH, 4CH
          INT    21H
CODE ENDS
END START