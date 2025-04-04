DATA SEGMENT
    MSG1 DB "FU$"
    MSG2 DB "ZHENG$"
    NUM1 DB -1
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:
          MOV  AX, DATA
          MOV  DS, AX
          MOV  AL, NUM1
          TEST AL, 80H
          JE   ISE
          JMP  NSE
    ISE:  
          MOV  AH, 09H
          MOV  DX, OFFSET MSG2
          INT  21H
          JMP  DONE
    NSE:  
          MOV  AH, 09H
          MOV  DX, OFFSET MSG1
          INT  21H
    DONE: 
          MOV  AH, 4CH
          INT  21H
CODE ENDS
END START