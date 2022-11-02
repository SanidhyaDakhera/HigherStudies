.model small
.stack
.data
    msg1 db 10, 13, "Addition: $"
    msg2 db 10, 13, "Subtraction: $"
    num1 dw 4536h
    num2 dw 2312h
    res dw ?
.code
    disp macro xx
    mov ah, 09
    lea dx, xx
    int 21h
    endm
.startup
  call subproc
  mov ah,04h
  int 21h
proc subproc
    disp msg2
    mov ax,num1
    sub ax,num2
    mov res,ax  
    call disp1
    ret
endp
    
    proc disp1
        mov bx, res
        and bh, 0f0h
        mov cl, 4
        shr bh, cl
        add bh, 30h
        mov dl, bh
        mov ah, 02h
        int 21h  
        
        mov bx, res
        and bh, 0fh
        add bh, 30h
        mov dl, bh
        mov ah, 02h
        int 21h 
        
        mov bx, res
        and bl, 0f0h
        mov cl, 4
        shr bl, cl
        add bl, 30h
        mov dl, bl
        mov ah, 02h
        int 21h  
        
        mov bx, res
        and bl, 0fh
        add bl, 30h
        mov dl, bl
        mov ah, 02h
        int 21h 
        
        ret
    endp
ends 
end