section .data   
msg db 'My first Assembly Program',0xa ;0xa gets interpreted as new line character '\n'
len equ $ - msg ;Computes the length of the msg variable by deleting the address of current
                ;instruction from the starting address of the msg variable

section .text
global _start ;Entry point for the linker

_start: ;starting point of program

mov ecx,msg ;stores the address of msg variable to ecx register,it points the beginning of msg variable
mov edx,len ;stores the value of len varible to edx register ,the kernel will look for this value
           ;to determine the number of bytes to write to

mov ebx,1 ;set the file descriptor to std_out for the sys_write call to write to
mov eax,4 ;sys_write call
int 0x80 ;Invoking the kernel to write to the resource(std_out) defined by file descriptor,edx value will also be used here

mov eax,1 ;sys_exit call
int 0x80 ;Invoking kernel to perform sys_exit sys call
