.data
    input_message:   .asciz "Enter a string: "
    output_message:  .asciz "Uppercase: "
    buffer:          .space 256
    newline:         .byte 10

.text
.global _start

_start:
    // Display input message
    mov x0, 1          // File descriptor (stdout)
    ldr x1, =input_message
    ldr x2, =14        // Message length
    mov x8, 64         // syscall number for write
    svc 0

    // Read input
    mov x0, 0          // File descriptor (stdin)
    ldr x1, =buffer
    mov x2, 256        // Buffer size
    mov x8, 63         // syscall number for read
    svc 0

    // Convert to uppercase
    ldr x3, =buffer
tolower_loop:
    ldrb w4, [x3], 1   // Load a byte and advance pointer
    cmp w4, #0         // Check for null terminator
    beq done
    cmp w4, #'a'
    blt skip_upper
    cmp w4, #'z'
    bgt skip_upper
    sub w4, w4, #'a' - 'A'
    strb w4, [x3, -1]  // Store the uppercase character
    b tolower_loop

skip_upper:
    b tolower_loop

done:
    // Display output message
    mov x0, 1
    ldr x1, =output_message
    ldr x2, =12
    mov x8, 64
    svc 0

    // Print the uppercase string
    mov x0, 1
    ldr x1, =buffer
    mov x2, 256
    mov x8, 64
    svc 0

    // Exit
    mov x8, 93         // syscall number for exit
    mov x0, 0          // Exit status code
    svc 0