.model small
.stack
.data
msg1 db 10,13, "Mouse driver present:$ "
.code
disp macro xx
mov ah,09
lea dx,xx
int 21h
endm
.startup
mov ax,0000h 
int 33h

cmp ax,0000
je last
disp msg1

mov ax,0004h 
mov cx,0
mov dx,0
int 33h
mov ax, 0007h
mov cx,0050h
mov dx,00ffh
int 33h

mov ax, 0008h
mov cx,0010h
mov dx,00ffh
int 33h

pixel:
mov ax,0001h
int 33h

mov ax,0003h
int 33h
cmp bx,01 
je left
jmp right

left:
mov ax,0011h 
int 10h

right:
mov ax,0001h
int 33h
cmp bx,02
je last
jmp pixel

last:
mov ax,0000
int 10h

.exit

end