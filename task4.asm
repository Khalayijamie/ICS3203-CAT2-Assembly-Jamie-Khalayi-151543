section .data
    sensor_value dd 3          ; Example sensor value (can be modified)
    motor_status db 0
    alarm_status db 0

section .text
global _start

_start:
    mov eax, [sensor_value]    ; Read sensor value

    cmp eax, 5
    jg high_level              ; if > 5, trigger alarm

    cmp eax, 3
    jle moderate_level         ; if <= 3, stop motor

low_level:
    mov [motor_status], 1      ; turn on motor
    jmp exit

moderate_level:
    mov [motor_status], 0      ; stop motor
    jmp exit

high_level:
    mov [alarm_status], 1      ; trigger alarm
    jmp exit

exit:
    mov eax, 1                 ; sys_exit
    mov ebx, 0
    int 0x80
