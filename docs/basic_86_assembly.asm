org 100h  ; the program we're writing will be loaded at 100h address

mov ah 0eh
mov al 'A'

int 10h

ret
