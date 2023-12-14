ORG 0x0000   ; Define the starting address

; Variables
buffer     DS 256   ; Data space for the input string
input_msg  DB "Enter a string: $"
output_msg DB "Uppercase: $"
read_bytes DB 0

; Code starts here
MAIN:
    MOV R0, #0     ; Clear R0 to use as a counter
    MOV DPTR, #buffer  ; Load DPTR with the address of buffer
    CLR A          ; Clear the accumulator

READ_LOOP:
    MOV R1, A      ; Save the current character in R1
    MOV A, #01h    ; AH = 01h for DOS function 01h (input without echo)
    MOV R2, #01h   ; DL = 01h for STDIN
    LCALL DOS_CALL  ; Call DOS input function

    CJNE A, 0DH, NOT_ENTER ; Check for Enter (carriage return)
    SJMP DONE

NOT_ENTER:
    MOVX @DPTR, A  ; Store the character in the buffer
    INC DPTR       ; Increment DPTR to point to the next byte
    INC R0         ; Increment the counter

    ACALL IS_UPPERCASE  ; Check if the character is lowercase
    JC NOT_LOWER

    ; Convert to uppercase
    SUBB A, #32
    MOVX @DPTR, A  ; Store the uppercase character
    INC DPTR
    SJMP NOT_LOWER

NOT_LOWER:
    CJNE R1, #0, READ_LOOP  ; Continue reading if not null terminator

DONE:
    MOVX @DPTR, #0  ; Null-terminate the string

    ; Display output message
    MOV A, #02h    ; AH = 02h for DOS function 02h (output)
    MOV R2, #01h   ; DL = 01h for STDOUT
    MOV DPTR, #output_msg  ; Load DPTR with the address of output_msg
    LCALL DOS_CALL  ; Call DOS output function

    ; Print the uppercase string
    MOV A, R0      ; AH = R0 (length of string)
    MOV DPTR, #buffer  ; Load DPTR with the address of buffer
    LCALL DOS_CALL  ; Call DOS output function

    ; Exit
    MOV A, #4CH    ; AH = 4Ch for DOS function 4Ch (terminate program)
    INT 21H

; Subroutine to check if the character is lowercase
IS_UPPERCASE:
    MOV R3, A      ; Save the character in R3
    MOV A, #61H    ; AH = 61H (ASCII 'a')
    CJNE R3, A, NOT_LOWER_CASE
    MOV A, #7BH    ; AH = 7BH (ASCII 'z')
    CJNE R3, A, NOT_LOWER_CASE
    SETB C         ; Set carry flag if lowercase
    RET

NOT_LOWER_CASE:
    CLR C          ; Clear carry flag if not lowercase
    RET

; DOS Call subroutine
DOS_CALL:
    PUSH PSW       ; Save the program status word
    PUSH DPL       ; Save DPL
    PUSH DPH       ; Save DPH
    MOV DPL, R1    ; Load DPL with R1 (function parameter)
    LCALL 0x0000   ; Call DOS function at address 0000h
    POP DPH        ; Restore DPH
    POP DPL        ; Restore DPL
    POP PSW        ; Restore the program status word
    RET

END
