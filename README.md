# ICS3203-CAT2-Assembly-Jamie-Khalayi-151543


This project includes four tasks involving basic assembly language programming using NASM and MinGW for x86 architecture. Each task demonstrates different aspects of assembly programming including control flow, array manipulation, modular programming, and simulating control systems. Below is an overview of each task, along with instructions on compiling and running the code.

## Task 1: Control Flow and Conditional Logic

### Purpose:
This program prompts the user to enter a number and classifies it as "POSITIVE," "NEGATIVE," or "ZERO" using conditional and unconditional jumps.

### Challenges:
- The task required the use of both conditional (`je`, `jl`, `jg`) and unconditional (`jmp`) jumps to determine the flow of the program based on the user input.
- Ensuring that the program handles both zero and non-zero values correctly.

### Compiling and Running:
```bash
nasm -f elf32 task1.asm -o task1.o
ld -m i386pe task1.o -o task1.exe
./task1.exe
