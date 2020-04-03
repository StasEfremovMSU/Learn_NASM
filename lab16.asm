%include "io.inc"

section .text
global CMAIN

fib:
push ebp
mov ebp, esp
push ebx
mov ecx, dword [ebp + 8]
xor edx, edx 
mov ebx, 1 
mov eax, 1 
dec ecx
jecxz .end
.loop:
lea eax, [edx + ebx]
mov edx, ebx
mov ebx, eax
loop .loop
.end:
pop ebx
pop ebp
ret


CMAIN:
push ebp
mov ebp, esp
sub esp, 12
mov dword [esp], 1000b 
call fib
PRINT_DEC 4, eax
NEWLINE
xor eax, eax
 mov esp, ebp
 pop ebp
 ret