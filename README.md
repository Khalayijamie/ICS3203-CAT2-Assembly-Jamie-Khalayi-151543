# ICS3203-CAT2-Assembly-Jamie-Khalayi-151543


This project includes four tasks involving basic assembly language programming using NASM and MinGW for x86 architecture. Each task demonstrates different aspects of assembly programming including control flow, array manipulation, modular programming, and simulating control systems. Below is an overview of each task, along with instructions on compiling and running the code.

## Task 1: Control Flow and Conditional Logic

### Purpose:
This program prompts the user to enter a number and classifies it as "POSITIVE," "NEGATIVE," or "ZERO" using conditional and unconditional jumps.

### Challenges:
- The task required the use of both conditional (`je`, `jl`, `jg`) and unconditional (`jmp`) jumps to determine the flow of the program based on the user input.
- Ensuring that the program handles both zero and non-zero values correctly.
- Understanding how to handle user input in assembly, particularly the conversion of input to an integer for comparison.
- Managing the flow of execution using conditional jumps (je, jg, jmp).
  
### Compiling and Running:
```bash
nasm -f elf32 task1.asm -o task1.o
ld -m i386pe task1.o -o task1.exe
./task1.exe
```
## Task 2: Array Manipulation with Looping and Reversal

### Purpose:
This program accepts an array of five integers, reverses the array in place, and outputs the reversed array.

### Challenges
1. Memory management was a key aspect of this task, as no extra space was  allocated to store the reversed array.
2. The program uses a start pointer (esi) and an end pointer (edi) to swap  elements, which required careful handling of the array indices.
3. Ensuring that the program reads input correctly and in the expected format was a challenge, particularly with sys_read.

### Compiling and Running
```bash
nasm -f elf32 task2.asm -o task2.o
ld -m i386pe task2.o -o task2.exe
./task2.exe
```
### Task 3: Modular Program with Subroutines for Factorial Calculation

### Purpose:
This program computes the factorial of a given number using a subroutine. The subroutine handles the recursive computation of the factorial, and the program demonstrates the use of the stack to preserve register values.

### Challenges
1. Managing registers and preserving values on the stack was crucial to the modular nature of the program.
2. Using a subroutine to calculate the factorial required understanding how to call functions and return values in assembly.

### Compiling and Running
```bash
nasm -f elf32 task3.asm -o task3.o
ld -m i386pe task3.o -o task3.exe
./task3.exe
```
## Task 4: Data Monitoring and Control Using Port-Based Simulation

### Purpose
This program simulates reading a sensor value and performs actions based on the value. If the sensor value is too high, it triggers an alarm; if the value is moderate, it stops a motor; otherwise, it turns the motor on.

### Challenges
Handling the logic of sensor values and taking actions based on comparisons was essential.
Using the appropriate memory locations (motor_status, alarm_status) to represent the actions was a bit tricky as it involved manipulating bytes.

### Compiling and Running
```bash
nasm -f elf32 task4.asm -o task4.o
ld -m i386pe task4.o -o task4.exe
./task4.exe
```

## General Compilation and Running Instructions
1. Ensure you have NASM and MinGW (or an equivalent assembler and linker) installed.

2. Use the following commands to compile and link any .asm file into an executable:
```bash
nasm -f elf32 taskX.asm -o taskX.o
ld -m i386pe taskX.o -o taskX.exe
```
Replace taskX.asm with the filename of the relevant task.
3. To run the program, use the following command:
```bash
./taskX.exe
```
## Insights and Challenges
1. Memory management was a recurring challenge, especially in tasks like array reversal where no extra memory was allocated for the reversed array.
2. Control flow logic in Task 1 was critical to ensure correct handling of positive, negative, and zero values.
3. Stack management in Task 3 required careful handling of function calls and register preservation.
4. System-level programming involving direct manipulation of memory and I/O using sys_write and sys_read provided hands-on experience with low-level assembly operations.
## Conclusion
This project helped reinforce concepts of assembly programming, including the use of registers, conditional and unconditional jumps, loops, memory management, and subroutines. Each task presented unique challenges that required an understanding of how to manipulate low-level system resources directly.


