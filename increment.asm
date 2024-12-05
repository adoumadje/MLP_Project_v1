SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1


section .data
    msg1 db "num = "
    len1 equ $ - msg1

    msg2 db "++num = "
    len2 equ $ - msg2

section .bss

    num resb 2

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
    mov ecx, num
    mov edx, 2
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    mov ebx, [num]
    inc ebx
    mov [num], ebx

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, num
    mov edx, 2
    int 0x80

exit:

    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80