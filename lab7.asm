%include "io.inc"

section .text
global CMAIN

rec:
push ebp
mov ebp,esp

push ebx
PRINT_DEC 4, ebp +12
NEWLINE
sub esp, 4
mov ebx, dword [ebp +8]
mov eax, 0
test ebx, ebx
je .L3
mov eax, ebx
shr eax, 1
mov dword[esp], eax
call rec
mov edx, ebx
and edx, 1
lea eax, [edx +eax]
.L3:
add esp, 4
pop ebx
pop ebp
ret
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    mov ebx, 1
    PRINT_DEC 4, ebx
    NEWLINE
    call rec
    PRINT_STRING 'result: '
    PRINT_DEC 4, eax
    ret