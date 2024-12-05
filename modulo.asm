SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .data 
    msg1 db "dividend = "
    len1 equ $ - msg1

    msg2 db "divisor = "
    len2 equ $ - msg2

    msg3 db "modulo = "
    len3 equ $ - msg3

section .bss

    dividend resb 2
    divisor resb 2
    modulo resb 1

section .text

    global _start

_start:

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, dividend
    mov edx, 2
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, divisor
    mov edx, 2
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80

    mov al, [dividend]
    sub al, '0'

    mov bl, [divisor]
    sub bl, '0'

    div bl
    mov al, ah
    add al, '0'

    mov [modulo], al

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, modulo
    mov edx, 1
    int 0x80

exit:

    mov eax, SYS_EXIT
    int 0x80