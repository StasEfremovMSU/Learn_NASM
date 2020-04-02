%include "io.inc"
section .data
strn :   db  '232cfdg 323'
section .text
global CMAIN
CMAIN:
    lea ebx, [strn] 
    push ebx 
    lea ecx, [strn]
    push ecx 
    add esp, 8 ; ò ê 2 push
    
    mov ecx, -1 
    dec ebx
    
    fl1:
    inc ecx 
    inc ebx
    mov al, [ebx] 
    cmp al, 0 
    
    jnz fl1 
    PRINT_STRING 'operand length: '
    PRINT_DEC 4, ecx
    NEWLINE
    
    cmp ecx, 1
    jne end
    
    ret
    end:
    PRINT_STRING 'Bad length'
    NEWLINE
    ret