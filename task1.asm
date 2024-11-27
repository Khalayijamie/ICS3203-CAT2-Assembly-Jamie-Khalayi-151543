section .data
    msg_positive db "POSITIVE", 0
    msg_negative db "NEGATIVE", 0
    msg_zero db "ZERO", 0
    len_positive equ $ - msg_positive      ; Calculate length of "POSITIVE"
    len_negative equ $ - msg_negative      ; Calculate length of "NEGATIVE"
    len_zero     equ $ - msg_zero          ; Calculate length of "ZERO"

section .bss
    input resb 4

section .text
    global _start

_start:
    ; Read input from user (syscall: sys_read)
    mov eax, 3                ; sys_read
    mov ebx, 0                ; stdin (file descriptor)
    mov ecx, input            ; buffer to store input
    mov edx, 4                ; maximum number of bytes to read
    int 0x80                  ; invoke system call

    ; Convert input to number (for simplicity, assume single-digit input)
    mov eax, [input]          ; Load input into EAX register
    sub eax, '0'              ; Convert ASCII to integer

    ; Compare input and branch accordingly
    cmp eax, 0
    je zero
    jl negative
    jmp positive

positive:
    ; Output "POSITIVE"
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout (file descriptor)
    mov ecx, msg_positive     ; message
    mov edx, len_positive     ; length of message
    int 0x80                  ; invoke system call
    jmp exit

negative:
    ; Output "NEGATIVE"
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout (file descriptor)
    mov ecx, msg_negative     ; message
    mov edx, len_negative     ; length of message
    int 0x80                  ; invoke system call
    jmp exit

zero:
    ; Output "ZERO"
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout (file descriptor)
    mov ecx, msg_zero         ; message
    mov edx, len_zero         ; length of message
    int 0x80                  ; invoke system call

exit:
    ; Exit program
    mov eax, 1                ; sys_exit
    mov ebx, 0                ; exit status
    int 0x80                  ; invoke system call
