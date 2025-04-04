MODEL SMALL
STACK
DATA SEGMENT
    FIRST DB 'ASDAASZXCFGRSAAXADRRAT$'
    NUM   DB 0
DATA ENDS
CODE SEGMENT
          ASSUME CS:CODE, DS:DATA
    START:
          MOV    AX, DATA
          MOV    DS, AX
          MOV    SI, OFFSET FIRST
          MOV    AL, 0
    NEXT: 
          MOV    BL, [SI]
          CMP    BL, '$'
          JE     EXIT
          CMP    AL, 'A'
          JNE    NEXT
          INC    AL
          JNE    NEXT
    EXIT: 
          MOV    NUM, AL
          MOV    AH, 4CH
          INT    21H
CODE ENDS
END START