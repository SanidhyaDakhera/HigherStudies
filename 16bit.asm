.model small
.stack
.data
M1 db 10,13, "Enter 16 bit no: $"
M2 db 10,13, "Display 16 bit no: $"
num db ?
num1 db ?
.code
.startup
mov ah,09;
lea dx,M1;
int 21h; display message 1
mov ah,01;
int 21h; taking input
sub al,30h;
mov cl,4;
shl al, cl; shift 
mov bh,al;
mov ah, 01;
int 21h;
sub al, 30h;
add bh, al;
mov num,bh

mov ah,01;
int 21h; taking input
sub al,30h;
mov cl,4;
shl al, cl; shift 
mov bh,al;
mov ah, 01;
int 21h;
sub al, 30h;
add bh, al;
mov num1,bh

mov ah,09; display
lea dx,M2
int 21h

mov bh,num
and bh,0F0h
mov cl,4
shr bh,cl
add bh, 30h
mov dl,bh
mov ah,02
int 21h
mov bh, num
and bh, 0Fh
add bh, 30h
mov dl, bh
mov ah,02
int 21h

mov bh,num1
and bh,0F0h
mov cl,4
shr bh,cl
add bh, 30h
mov dl,bh
mov ah,02
int 21h
mov bh, num1
and bh, 0Fh
add bh, 30h
mov dl, bh
mov ah,02
int 21h
.exit
end