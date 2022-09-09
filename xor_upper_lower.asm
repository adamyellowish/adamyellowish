;converts the letters of the text in the string from uppercase to lowercase, lowercase to uppercase
data segment
   DATA1 DB 'uPPeRCasEtoLoWEr'
   DATA2 DB 16 dup(?)
ends

stack segment
    dw   64  dup(0)
ends

code segment
start:

    MOV AX, @DATA
    MOV DS, AX
    MOV SI, OFFSET DATA1
    MOV BX, OFFSET DATA2
    MOV CX, 16
changer:
    MOV AL, [SI]
    CMP AL, 41H
    JB over
    CMP AL, 7AH
    JA over
    XOR AL, 00100000B
over:
    MOV [BX], AL
    INC SI
    INC BX
    LOOP changer
    MOV AL, 24H
done:
    LEA DX, DATA2
    MOV AH, 09H
    INT 21H
    
ends

end start
