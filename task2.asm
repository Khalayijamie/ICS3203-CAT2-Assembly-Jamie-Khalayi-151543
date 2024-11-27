section .data
    prompt db "Enter 5 integers:", 0
    array resd 5
    msg_done db "Reversed array: ", 0

section .text
    global _start

_start:
    ; Prompt for array input
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, prompt
    mov edx, 17               ; length of prompt
    int 0x80

    ; Read integers into array
    mov ecx, array            ; point to start of array
    mov ebx, 5                ; 5 integers to read

input_loop:
    ; Read number and store
    mov eax, 3                ; sys_read
    mov edx, 4                ; size of each input
    int 0x80
    mov [ecx], eax            ; store input in array
    add ecx, 4                ; move to next slot
    dec ebx
    jnz input_loop            ; loop until all are read

    ; Reverse array in-place
    mov esi, array            ; start pointer
    lea edi, [array + 16]     ; end pointer (4 bytes * (5 - 1))

reverse_loop:
    cmp esi, edi
    jge done_reverse          ; exit if pointers cross or meet
    mov eax, [esi]            ; swap values
    mov ebx, [edi]
    mov [edi], eax
    mov [esi], ebx
    add esi, 4                ; move start pointer forward
    sub edi, 4                ; move end pointer backward
    jmp reverse_loop

done_reverse:
    ; Print reversed array (you can adapt for actual output)

    ; Exit
    mov eax, 1                ; sys_exit
    mov ebx, 0
    int 0x80
