.model small
.data
hex dw 0ACH
counter db 0
.code
mov ax,@data
mov ds,ax
mov ax,hex
mov bx,000AH
L:
inc counter
div bx
push dx
cmp ax,0
mov dx,00H
je exit
jmp L
exit:
    mov cl, counter
    mov ch,00H
LI:
    pop dx
    add dl,30H
    mov ah,02H
    int 21H
LOOP LI
    mov ah,4ch
    int 21h
    ret
ends
end