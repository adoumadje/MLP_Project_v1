SYS_EXIT equ 1
SYS_WRITE equ 4
SYS_READ equ 3
STDIN equ 0
STDOUT equ 1

section .data
    msg1 db "num1 = "
    len1 equ $ - msg1

    msg2 db "num2 = "
    len2 equ $ - msg2

    msg3 db "num1 - num2 = "
    len3 equ $ - msg3

section .bss
    dividend resb 2
    divisor resb 2
    quotient resb 1

section .text
    global _start       ;must be declared for using gcc

_start:                 ;tell linker entry point
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

    mov eax, [dividend]
    sub eax, '0'

    mov ebx, [divisor]
    sub ebx, '0'

    sub eax, ebx
    add eax, '0'

    mov [quotient], eax

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, quotient
    mov edx, 1
    int 0x80

exit:

    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80