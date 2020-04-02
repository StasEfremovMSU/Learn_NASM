%include "io.inc"

section .text
global CMAIN

rec:
shr ebx, 1
PRINT_DEC 4, ebx
NEWLINE
add eax, 1
cmp ebx, 1
je .L3
call rec
.L3:
ret

CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    mov eax, -1
    mov ebx, 111
    call rec
    PRINT_STRING 'result: '
    PRINT_DEC 4, eax
    ret