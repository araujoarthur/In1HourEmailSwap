section .data
    input_message db 'Enter a string: ', 0
    output_message db 'Uppercase: ', 0
    buffer db 256
    read_bytes dd 0

section .bss
    handle resd 1

section .text
global _start
extern printf, scanf, toupper

_start:
    ; Display input message
    push input_message
    call printf
    add esp, 4

    ; Read input
    push buffer
    push read_bytes
    push dword 256
    push dword 0
    call scanf
    add esp, 16

    ; Convert to uppercase
    lea esi, [buffer]
tolower_loop:
    lodsb
    test al, al
    jz done
    push eax
    call toupper
    pop eax
    stosb
    jmp tolower_loop

done:
    ; Display output message
    push output_message
    call printf
    add esp, 4

    ; Print the uppercase string
    push buffer
    call printf
    add esp, 4

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
