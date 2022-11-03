.model small
.stack
.data
M1 DB 10, 13, "Addition $"
M2 DB 10, 13, "Subtraction $"
num1 DW 5678H;
num2 DW 3321H;
RES DW ?;

.code
Disp Macro XX;
MOV AH, 09;
LEA DX, XX;
INT 21H;
ENDM

.startup
Disp M1;
MOV AX, num1;
ADD AX, num2;
MOV RES, AX;
CALL DISP1

Disp M2;
MOV AX, num1;
SUB AX, num2;
MOV RES, AX;
CALL DISP1
JMP last;

DISP1 PROC 
MOV BX, RES;
AND BH, 0F0H;
MOV CL, 4;
SHR BH, CL;
ADD BH, 30H;
MOV DL, BH;
MOV AH, 02;
INT 21H;
MOV BX, RES;
AND BH, 0FH;
ADD BH, 30H;
MOV DL, BH;
MOV AH, 02;
INT 21H;

AND BL, 0F0H;
MOV CL, 4;
SHR BL, CL;
ADD BL, 30H;
MOV DL, BL;
MOV AH, 02;
INT 21H;
MOV BX, RES;
AND BL, 0FH;
ADD BL, 30H;
MOV DL, BL;
MOV AH, 02;
INT 21H;

RET 
Disp1 ENDP;

LAST:
.exit
end