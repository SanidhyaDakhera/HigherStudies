.model small
.stack
.data
m2 db 10,13,"$"
msg db 10,13,"Negative no. $"
arr db 20h,0afh,30h,98h,0ffh
narr db 5 dup(0)

.code
disp MACRO xx
mov ah,09
lea dx,xx
int 21h
endm

.startup
mov ch,0
lea si,arr
lea di,narr
mov cl,5

back:
mov dl,[si]
shl dl,1
jnc positive
mov bl,[si]
mov [di],bl
inc di
inc ch

positive:
inc si
dec cl
jnz back
disp msg

lea di,narr
back1:disp m2
mov bh,[di]
and bh,0f0h
mov cl,4
shr bh,cl
cmp bh,9
jg aa
add bh,30h
jmp aa1
aa:add bh,37h
aa1:mov dl,bh
mov ah,02
int 21h


mov bh,[di]
and bh,0fh
cmp bh,9
jg aa2
add bh,30h
jmp aa3
aa2:add bh,37h
aa3:mov dl,bh
mov ah,02
int 21h




mov bh,[di]
and bh,0fh
inc di
dec ch
jnz back1
.exit
end