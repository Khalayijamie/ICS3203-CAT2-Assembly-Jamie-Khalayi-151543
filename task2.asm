section .data
    prompt db "Enter 5 integers:", 0
    msg_done db "Reversed array: ", 0
    newline db 0xA, 0  ; Line break

section .bss
    array resd 5  ; Uninitialized array for 5 integers

section .text
    global _start

_start:
    ; Prompt for input
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, prompt
    mov edx, 17               ; length of prompt
    int 0x80

    ; Read integers (simplified handling)
    mov ecx, array            ; Start pointer to the array
    mov ebx, 5                ; Counter for integers to read

input_loop:
    ; Simulated input (replace with your actual input logic)
    ; Move to next slot
    add ecx, 4
    dec ebx
    jnz input_loop

    ; Reverse array
    mov esi, array            ; Start pointer
    lea edi, [array + 16]     ; End pointer (4 bytes * 
