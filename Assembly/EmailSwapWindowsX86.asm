section .data
    input_message db 'Enter a string: ', 0
    output_message db 'Uppercase: ', 0
    buffer db 256
    read_bytes dd 0

section .text
global main
extern GetStdHandle, ReadFile, WriteFile
main:
    ; Prompt for input
    push dword -11         ; STD_OUTPUT_HANDLE
    call GetStdHandle
    push 0                 ; Reserved, must be zero
    lea ecx, [input_message]
    push ecx               ; Message
    push dword 15          ; Message length
    push eax               ; Handle (stdout)
    call WriteFile

    ; Read input
    push 0                 ; lpBytesRead
    lea ecx, [buffer]
    push ecx               ; lpBuffer
    push dword 256         ; nNumberOfBytesToRead
    push dword -10         ; STD_INPUT_HANDLE
    call GetStdHandle
    push eax               ; Handle (stdin)
    push 0                 ; Reserved, must be zero
    push eax               ; Handle (stdin)
    lea ecx, [buffer]
    push ecx               ; lpBuffer
    push dword 256         ; nNumberOfBytesToRead
    push read_bytes        ; lpBytesRead
    push 0                 ; lpOverlapped
    call ReadFile

    ; Convert to uppercase
    lea esi, [buffer]
tolower_loop:
    lodsb                   ; Load next byte into AL
    test al, al             ; Check for null terminator
    jz done
    cmp al, 'a'
    jl skip_upper
    cmp al, 'z'
    jg skip_upper
    sub al, 32              ; Convert to uppercase

skip_upper:
    stosb                   ; Store the byte back in the buffer
    jmp tolower_loop

done:
    ; Print uppercase string
    push dword -11         ; STD_OUTPUT_HANDLE
    call GetStdHandle
    push 0                 ; Reserved, must be zero
    lea ecx, [output_message]
    push ecx               ; Message
    push dword 12          ; Message length
    push eax               ; Handle (stdout)
    call WriteFile

    push 0                 ; lpNumberOfBytesWritten
    lea ecx, [buffer]
    push ecx               ; lpBuffer
    push dword 256         ; nNumberOfBytesToWrite
    push 0                 ; lpNumberOfBytesWritten
    push 0                 ; lpOverlapped
    push eax               ; Handle (stdout)
    call WriteFile

    ; Exit
    ret
