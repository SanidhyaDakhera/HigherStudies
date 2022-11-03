.model small
.stack
.data
M1 DB 10,13,"Hex to BCD: $"
no DW 5678H

.code
Disp Macro XX
        mov AH,09
        Lea DX, XX
        INT 21H
ENDM
.startup
Disp M1
mov DX,0
mov AX,no
mov BX,0AH
mov cl,0
Back:
mov DX,0



DIV BX
Push DX
INC Cl
CMP AX,0   ;compare == 0 hai ki nhi
JNZ Back

Back1:
POP DX
ADD Dl,30H
MOV AH,02
INT 21H
DEC cl
JNZ Back1
.exit
end
