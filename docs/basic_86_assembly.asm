ORG 0x7C00 ; originate from this address
BITS 16    ; tell assembler to use 16 bit arch instructions

message: db "Hello World!", 0

start:
    mov si, message
    call print

    jmp $                ; infinite loop, $ = returns the current memory location
    ret

print:
    mov bx, 0

.loop:                   ; this is a nasm sub label which can only be accessable from the lable above it
    call print_char
    cmp al, 0
    je .done
    jmp .loop
.done:
    ret

print_char:
    lodsb
    mov ah, 0eh
    int 0x10             ; video teletype output BIOS interupt
    ret

times 510 - ($-$$) db 0  ; stores 0 at all the remaining memory addresses (512B program) just leave the last 2 bytes
dw 0xAA55                ; specifying boot signature 0x55AA (in reverse because Intel processors are little endian)
