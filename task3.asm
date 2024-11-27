section .text
global _start

_start:
    mov eax, 5                ; number to calculate factorial of
    call factorial            ; call factorial subroutine
    mov ebx, eax              ; result now in ebx for exit code
    mov eax, 1                ; sys_exit
    int 0x80

factorial:
    push ebp
    mov ebp, esp              ; setup stack frame
    push eax                  ; preserve input number
    cmp eax, 1
    jle end_factorial         ; if <= 1, return 1
    dec eax                   ; decrement
    call factorial            ; recursive call
    pop ebx                   ; retrieve original number
    mul ebx                   ; multiply result by current number

end_factorial:
    mov esp, ebp              ; restore stack
    pop ebp
    ret
