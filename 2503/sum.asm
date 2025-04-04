DATA SEGMENT
    M    DB 21              ; 第一个数
    N    DB 2              ; 第二个数
    MSG  DB '1 + 2 = $'
    RESULT DB '0$'
DATA ENDS

CODE SEGMENT
    START:
          MOV AX, DATA
          MOV DS, AX
          ASSUME DS:DATA
        
          MOV AL, M
          ADD AL, N
          ADD AL, '0'
          MOV [RESULT], AL
          
          MOV AH, 09H
          LEA DX, MSG
          INT 21H

          LEA DX, RESULT
          INT 21H

          MOV AH, 4CH
          INT 21H
CODE ENDS
END START