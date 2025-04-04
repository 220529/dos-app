DATA SEGMENT
    ARRAY DB 10, 20, 30, 40, 0   ; 数组以0结尾
    CRLF DB 13, 10, '$'          ; 换行符
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
START:
    MOV AX, DATA
    MOV DS, AX          ; 设置DS指向数据段

    ; 初始化指针和计数器
    MOV SI, OFFSET ARRAY  ; SI指向数组首地址

PRINT_LOOP:
    MOV AL, [SI]       ; 读取当前元素到AL
    CMP AL, 0          ; 检查是否结束（遇到0）
    JE  DONE           ; 如果为0，跳转到结束

    ; 调用DOS中断输出AL中的数字（需转换为ASCII）
    CALL PRINT_DECIMAL  ; 自定义子程序（见下方）
    
    ; 打印空格分隔
    MOV AH, 02h        ; DOS显示字符功能
    MOV DL, ' '        ; 空格
    INT 21h

    INC SI             ; 指针移动到下一个元素
    JMP PRINT_LOOP     ; 继续循环

DONE:
    ; 打印换行
    MOV AH, 09h        ; DOS打印字符串功能
    MOV DX, OFFSET CRLF
    INT 21h

    ; 退出程序
    MOV AH, 4Ch
    INT 21h

; 子程序：将AL中的数字以十进制输出
PRINT_DECIMAL PROC
    MOV AH, 0          ; 清空AH
    MOV BL, 10         ; 除数=10
    DIV BL             ; AL=商（十位），AH=余数（个位）

    OR AX, 3030h       ; 转换为ASCII（'0'=30h）
    MOV BX, AX         ; 保存结果

    ; 输出十位（如果非零）
    CMP BL, '0'
    JE  PRINT_UNIT     ; 十位为0则不输出
    MOV DL, BL
    MOV AH, 02h
    INT 21h

PRINT_UNIT:
    ; 输出个位
    MOV DL, BH
    MOV AH, 02h
    INT 21h
    RET
PRINT_DECIMAL ENDP

CODE ENDS
END START