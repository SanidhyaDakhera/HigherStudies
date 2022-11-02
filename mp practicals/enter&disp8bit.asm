.model small
.data
msg1 db 10,13, "Enter 8 bit nos :$"
msg2 db 10,13, "8 bit nos is :$"
.code
.startup
mov ah,09h
lea dx,msg1
int 21h
mov ah,01h
int 21h
sub al,30h
mov cl,04h
shl al,cl
mov bl,al
mov ah,01h
int 21h
sub al,30h
add al,bl
mov bh,al
mov ah,09h
lea dx,msg2
int 21h
mov bl,bh
and bl,0f0h
shr bl,cl
add bl,30h
mov dl,bl
mov ah,02h
int 21h
mov bl,bh
and bl,0fh
add bl,30h
mov dl,bl

mov ah,02h
int 21h
.exit
end