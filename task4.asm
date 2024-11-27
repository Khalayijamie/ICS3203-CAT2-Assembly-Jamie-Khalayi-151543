section .data
    sensor_value dd 3          ; Example sensor value (4 bytes)
    motor_status db 0          ; 1 byte
    alarm_status db 0          ; 1 byte

section .text
global _start

_start:
    mov eax, [sensor_value]    ; Read sensor value (32-bit)

    cmp eax, 5
    jg high_level              ; if > 5, trigger alarm

    cmp eax, 3
    jle moderate_level         ; if <= 3, stop motor

low_level:
    mov byte [motor_status], 1 ; turn on motor (byte size specified)
    jmp exit

moderate_level:
    mov byte [motor_status], 0 ; stop motor (byte size specified)
    jmp exit

high_level:
    mov byte [alarm_status], 1 ; trigger alarm (byte size specified)
    jmp exit

exit:
    mov eax, 1                 ; sys_exit
    xor ebx, ebx               ; exit status 0
    int 0x80
